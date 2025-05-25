Return-Path: <linux-arm-msm+bounces-59317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B14AC3344
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 10:56:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E0621897FD4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 08:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9B91DF254;
	Sun, 25 May 2025 08:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S0v2c3QD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833971D90DF
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 08:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748163371; cv=none; b=fi+ObVlUb7U6cmBK/A3xyfmzTxhdjT8oyDBgC2mkEUM61i7o/FOFF33RzTWE0Pm8U9CALYCIEkM8lvD/TftHURknDKyKCATRswKS5ytFVhwbmzYyXBLCCE7imLmvb31R9qfZZvah6krsu/qdj/ECeEC1XScLHtL/JVUCtevbOSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748163371; c=relaxed/simple;
	bh=vRR6szynldY94FYUj5qNjs3DmteWmQfiTljj3mxMF78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d+FK9lUPGZvOnTLJc1YrQV6HJYm41wdhANqIGrLfOfNLRbpqNoqfikg0lCLm9RH4wmeuGq1aZJz259npr3r+y3wpi+t2Zhxj7yoxWfWoxx+KZRV1F6YjMczQ5SKzq5yAP/fYQgkDudE+iD0Tbhn/HxjvWHD8U/f7qKC53pQ2F0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S0v2c3QD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54P5lJxw002853
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 08:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LdmcYDeR3oxl4uFyKw3pkSyRmu08N2XqrqgvurqEKN0=; b=S0v2c3QDh+hdA0Eu
	TTtCzvKTBaWGJld5C6XXKEbT8Yd46mR8KDfpLlhMnfz7VQsN2sa6hDot01ZMraRs
	mYnGxoiudrs/qS8ewcpjkz0rp8dUJkebpy1VK/bSwm81WYXzAkyu2bNiEipaoajT
	qlKNJUbY1j4hd+C2knRm5H7LAHt16LPyDHh+mse8dxISq3jKaw0pGwSJhyvwXnuB
	rbNbTDXzgCymtYk4AH44KR6HR2VPV6vCwslOrBBDia+46LAte9Umhsww4xO11mgE
	m6YvmQOyyps+7YqB93az+8W/f/P7lmdyFcJt2ehC/os8rH9pI0Zhlz4dyCb6rH6p
	1EFm1A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u79p1pjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 08:56:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23206c06d29so10262235ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 01:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748163368; x=1748768168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LdmcYDeR3oxl4uFyKw3pkSyRmu08N2XqrqgvurqEKN0=;
        b=HwMS84HVtm2pazSPzVG9A7zePbWSX+YjR17orkwwb+ZD6EucL/lELS5K0U34JVyOw9
         nqPYtMp0Oqs/yUJJtseFT5xHFWCxIaNq5TwioGFkNYWezPMomrZ41Z/xWYQ7jC8CGgDd
         8QEgZhzT9pq5U3X2L2rgT1eWqrI3sj2I/+5JA/N8TnBf8QegSNsEQOj2zJOBPtufo+YB
         SNJ4fFZegNwpAmZaI+un5J1GAo0ERpqCeGA4UfzM0lS26l/WwJ7Qm/gEqgz8RBOm2UpA
         vB5XUNuZSvlike6xctCMyZnPeE4ONlrXQ+wgwDkTyb2wmH6ux9C3B1U+WnkHdvIfQgKG
         vTNw==
X-Gm-Message-State: AOJu0YyuKMpnG89ScNmu7fOx75W9EwzJgmCU8d3P19NFLMl6wuI5kEJi
	Mdbuo5ARb3AZ1rQ0niu14IlQpqsZtT5KOStJ0Nb8zTIBoDVNLNefnOuh9LjLEVnsTq0Fsu/cbv6
	AIkBuSWfi3loHz0kYl6N0fZtxnBuwy1pNkMt+rBCM6mrfUGcapk9e7L4NnfAz1nVHka0K
X-Gm-Gg: ASbGncvAdI+HV3YYGchM8+E+ea10Llo/+6wrsWxExW1+Jc8gs3QPiG2X4Xx0KP3i1KX
	sES3W6fzGT1TaSudF2/04/2rOPh0Tx4E/qEKNK+E6KZ4Gr3NO7c8dnWcik4EDNkSWQu+C/IywjT
	Vr9hhStDO7tT2nqLlaUp8AMitxedMrQPm4/CWjXpPv+/7yau+WKgejbxf9pysUw4NFNnfh+NqYj
	PeLKxupT8f0zygOXi57gDizFjGTicmXT8xShf+0XZbHo9hLp/OetEjPHCJYp3nP0tAiqsO03m7L
	cTl7bMCUmmCofzSLb/aA4K7FVg==
X-Received: by 2002:a17:903:acf:b0:233:f903:a11 with SMTP id d9443c01a7336-23414f48f23mr78955865ad.2.1748163367906;
        Sun, 25 May 2025 01:56:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVYWkUNVUJgm3pHRAuoZ1u3jFEnUwArxDSTKnwca1PjV2B1ONqMF9v5/FP5DvhZTWM44ZTsQ==
X-Received: by 2002:a17:903:acf:b0:233:f903:a11 with SMTP id d9443c01a7336-23414f48f23mr78955635ad.2.1748163367529;
        Sun, 25 May 2025 01:56:07 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2340531be85sm29609805ad.104.2025.05.25.01.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:56:07 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Sun, 25 May 2025 14:25:57 +0530
Subject: [PATCH v3 1/3] soc: qcom: qcom_stats: Add support to read DDR
 statistic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250525-ddr_stats_-v3-1-49a3c1e42db7@oss.qualcomm.com>
References: <20250525-ddr_stats_-v3-0-49a3c1e42db7@oss.qualcomm.com>
In-Reply-To: <20250525-ddr_stats_-v3-0-49a3c1e42db7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748163360; l=5260;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=vRR6szynldY94FYUj5qNjs3DmteWmQfiTljj3mxMF78=;
 b=jY+Pp8gtI8tOj+7UQiz1924zun9Xp+l43QsQA5RH8nAY/eYGaqkDiLsOFrbasVEAT8ZShczQF
 CkgMCAJfBp8BqbY7Rb+SVh0AS9DvkrYAq+IBzRF/NsxiJRHEetk/IDV
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: tzY-YfCGHohEkJVwYw5_bDCN8oLfDtQL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI1MDA4MSBTYWx0ZWRfX5uzYwDvppixy
 s3zvSNchj2zuPzBhhwmmMAvUDTlgVl0DM1MVMP0Q2Id3yr/GaU4AYVLzhe6EDy+xA3Ptn/pJalC
 skS/TVlxBc72hAoceY7yD6yp/UDkeZX2VrGFLwQkYsamu7yDxTCwhTyeHMjgGgwXdJJtNkKna1A
 VmM6H32yi5VIZngNxt/s1mCB9g2vtNTbvDA3iX3PUpX4unI3vMO3WqKisLH0sZr4jRTUyTNnH1u
 tcqGhWa0A6mLJyweiLwOeNBpAm5VqvnDcBbE5eVapHhekfRau1GeeTKfBh36uo9l71etN+4NvZe
 I8dbPGcXlY/fWsnvnD5h/Iuzeh5lxPMG1fomnVF6qyVcl6BlpQHv4KskAASZwEVgmPJULCJ6CPx
 OhaSLxErvR332+l6qspVQRaYZCX+7sR96NmEZHoQ7T7W5bOBqfeEdFdFlddT/2hQh4jCc/y5
X-Authority-Analysis: v=2.4 cv=HNnDFptv c=1 sm=1 tr=0 ts=6832db28 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=4QwxTSDsR6DxlQvKCcYA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: tzY-YfCGHohEkJVwYw5_bDCN8oLfDtQL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-25_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505250081

DDR statistic provide different DDR LPM and DDR frequency statistic.
Add support to read from MSGRAM and display via debugfs.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_stats.c | 99 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
index 5de99cf59b9fbe32c0580e371c3cc362dfabb895..33fd2a1574464768bd07289e743fbb79ba415e84 100644
--- a/drivers/soc/qcom/qcom_stats.c
+++ b/drivers/soc/qcom/qcom_stats.c
@@ -1,8 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2011-2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022-2025, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/bitfield.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/io.h>
@@ -24,6 +26,17 @@
 #define ACCUMULATED_OFFSET	0x18
 #define CLIENT_VOTES_OFFSET	0x20
 
+#define DDR_STATS_MAGIC_KEY		0xA1157A75
+#define DDR_STATS_MAX_NUM_MODES		20
+#define DDR_STATS_MAGIC_KEY_ADDR	0x0
+#define DDR_STATS_NUM_MODES_ADDR	0x4
+#define DDR_STATS_ENTRY_START_ADDR	0x8
+
+#define DDR_STATS_CP_IDX(data)		FIELD_GET(GENMASK(4, 0), data)
+#define DDR_STATS_LPM_NAME(data)	FIELD_GET(GENMASK(7, 0), data)
+#define DDR_STATS_TYPE(data)		FIELD_GET(GENMASK(15, 8), data)
+#define DDR_STATS_FREQ(data)		FIELD_GET(GENMASK(31, 16), data)
+
 struct subsystem_data {
 	const char *name;
 	u32 smem_item;
@@ -48,12 +61,19 @@ static const struct subsystem_data subsystems[] = {
 
 struct stats_config {
 	size_t stats_offset;
+	size_t ddr_stats_offset;
 	size_t num_records;
 	bool appended_stats_avail;
 	bool dynamic_offset;
 	bool subsystem_stats_in_smem;
 };
 
+struct ddr_stats_entry {
+	u32 name;
+	u32 count;
+	u64 duration;
+};
+
 struct stats_data {
 	bool appended_stats_avail;
 	void __iomem *base;
@@ -122,8 +142,85 @@ static int qcom_soc_sleep_stats_show(struct seq_file *s, void *unused)
 	return 0;
 }
 
+static void qcom_ddr_stats_print(struct seq_file *s, struct ddr_stats_entry *data)
+{
+	u32 cp_idx;
+
+	/*
+	 * DDR statistic have two different types of details encoded.
+	 * (1) DDR LPM Stats
+	 * (2) DDR Frequency Stats
+	 *
+	 * The name field have details like which type of DDR stat (bits 8:15)
+	 * along with other details as explained below
+	 *
+	 * In case of DDR LPM stat, name field will be encoded as,
+	 * Bits	 -  Meaning
+	 * 0:7	 -  DDR LPM name, can be of 0xd4, 0xd3, 0x11 and 0xd0.
+	 * 8:15	 -  0x0 (indicates its a LPM stat)
+	 * 16:31 -  Unused
+	 *
+	 * In case of DDR FREQ stats, name field will be encoded as,
+	 * Bits  -  Meaning
+	 * 0:4   -  DDR Clock plan index (CP IDX)
+	 * 5:7   -  Unused
+	 * 8:15  -  0x1 (indicates its Freq stat)
+	 * 16:31 -  Frequency value in Mhz
+	 */
+	switch (DDR_STATS_TYPE(data->name)) {
+	case 0:
+		seq_printf(s, "DDR LPM Stat Name:0x%lx\tcount:%u\tDuration (ticks):%llu\n",
+			   DDR_STATS_LPM_NAME(data->name), data->count, data->duration);
+		break;
+	case 1:
+		if (!data->count || !DDR_STATS_FREQ(data->name))
+			return;
+
+		cp_idx = DDR_STATS_CP_IDX(data->name);
+		seq_printf(s, "DDR Freq %luMhz:\tCP IDX:%u\tcount:%u\tDuration (ticks):%llu\n",
+			   DDR_STATS_FREQ(data->name), cp_idx, data->count, data->duration);
+		break;
+	}
+}
+
+static int qcom_ddr_stats_show(struct seq_file *s, void *d)
+{
+	struct ddr_stats_entry data[DDR_STATS_MAX_NUM_MODES];
+	void __iomem *reg = (void __iomem *)s->private;
+	u32 entry_count;
+	int i;
+
+	entry_count = readl_relaxed(reg + DDR_STATS_NUM_MODES_ADDR);
+	if (entry_count > DDR_STATS_MAX_NUM_MODES)
+		return -EINVAL;
+
+	reg += DDR_STATS_ENTRY_START_ADDR;
+	memcpy_fromio(data, reg, sizeof(struct ddr_stats_entry) * entry_count);
+
+	for (i = 0; i < entry_count; i++)
+		qcom_ddr_stats_print(s, &data[i]);
+
+	return 0;
+}
+
 DEFINE_SHOW_ATTRIBUTE(qcom_soc_sleep_stats);
 DEFINE_SHOW_ATTRIBUTE(qcom_subsystem_sleep_stats);
+DEFINE_SHOW_ATTRIBUTE(qcom_ddr_stats);
+
+static void qcom_create_ddr_stat_files(struct dentry *root, void __iomem *reg,
+				       const struct stats_config *config)
+{
+	u32 key;
+
+	if (!config->ddr_stats_offset)
+		return;
+
+	key = readl_relaxed(reg + config->ddr_stats_offset + DDR_STATS_MAGIC_KEY_ADDR);
+	if (key == DDR_STATS_MAGIC_KEY)
+		debugfs_create_file("ddr_stats", 0400, root,
+				    (__force void *)reg + config->ddr_stats_offset,
+				    &qcom_ddr_stats_fops);
+}
 
 static void qcom_create_soc_sleep_stat_files(struct dentry *root, void __iomem *reg,
 					     struct stats_data *d,
@@ -212,6 +309,7 @@ static int qcom_stats_probe(struct platform_device *pdev)
 
 	qcom_create_subsystem_stat_files(root, config);
 	qcom_create_soc_sleep_stat_files(root, reg, d, config);
+	qcom_create_ddr_stat_files(root, reg, config);
 
 	platform_set_drvdata(pdev, root);
 
@@ -254,6 +352,7 @@ static const struct stats_config rpmh_data_sdm845 = {
 
 static const struct stats_config rpmh_data = {
 	.stats_offset = 0x48,
+	.ddr_stats_offset = 0xb8,
 	.num_records = 3,
 	.appended_stats_avail = false,
 	.dynamic_offset = false,

-- 
2.34.1


