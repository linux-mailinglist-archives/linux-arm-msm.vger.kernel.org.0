Return-Path: <linux-arm-msm+bounces-58860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 008FEABEDFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 10:33:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 658D91BC0140
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 08:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA31F236A7C;
	Wed, 21 May 2025 08:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VT7WU8JW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB2822DF91
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 08:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747816350; cv=none; b=ql26Ekt95N43k0MZBmiZh2NUH9VHsriFTKmK746ZauBZKE67kFi28RwCq2MvmW6JbRgNqCHGocZ8962HFiwagsoixBzdQXh7TWNnfreeEHaOzjim5gwLGLE/19RHxKxlEQnVrWz1r3JxXGMvshsz/gBG0mfHvkcHgEJdeDsuvCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747816350; c=relaxed/simple;
	bh=Oe0c/HT/ThhA+Ev7ojrKYh6uc2pxBdtFufKW0Dpogs0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NjnWWnVe6pgewzRr+JYUDfCsvc5iPKjEMr0vJ2Il5zXq9t/vkAaq8R4BRYoL/Yiyo+yVMOX2pJQ0E2jX99hIXCijp+aUAjfWypYM5XWdHPwu5vVvWGf8Ci5V0COpzxH2nLs6MNOCibLRwHJHGADsK0a+Ps3yhD7qe5HH0x7aqAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VT7WU8JW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L5omBv028094
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 08:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S76KZTjew8gM/3p7mMZdUV3VYx0eCPcV5iivyT9LkdE=; b=VT7WU8JWJ5GCrNh4
	au/VrzCFqb/T82FC0WZtLwfoDa+wN+tKSAK3t1CH2okmBY1S3zS/KUkrNGBug2Io
	1xiu0TK9Aob9U+IdKxFQmT6dpbHAITDLAn+H4kxfeoQABcHJyanTFNFJsemGnCOA
	hhVlWX2VlwMtzlHxmhk0frdNLjVzgMKljTTgTe6SpkVmDEZ0q2QQxH5dCmjfKxYO
	ofmHNIez5tD98t/yIjp4CRPbBgJjDKR0BkIduUx552Two5JVK7cFsGO0xIeTD0qG
	DwYLDtDUfYKBiyMMUpHs60vuAxJ5BkjBsHJXUiviCJvJGTQeABEaqjE+kmqmJ51L
	yA3OZw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf428tv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 08:32:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-232340ba283so28971595ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 01:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747816347; x=1748421147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S76KZTjew8gM/3p7mMZdUV3VYx0eCPcV5iivyT9LkdE=;
        b=RhgCSDV2L5+S8QWUOE0ZPKx3RE3HEWWAB7icgn5qgaKNdtUfXns/BzWaZIjrXJMYpV
         2I1XhQMcpceU7TSzNxIfWomgnmbv6srq6OZPsqAHLbPL7RLJ/HDe+0ulya61yx65FLc9
         gRq1DEkfICVlv8JbM6y93hRddR8RSssnuSTYkLVw7/5L1BFKISk4LcPwHPI4F74PwLrn
         YTEguznUW4ddtuLWCAHiHBNuavGpPqEZUZUNbrtk1T7BpDXv8DJUSCmFO1yM993kz8cD
         L0EX7zR7OwcXE9Oly3pHy0qx8pkfJHHX1h1wgob4YVJ9RZa+qERXaTFvqiwGRj7i2VhR
         QMBw==
X-Gm-Message-State: AOJu0YyyERGcO/YdIv85EU66D6ls+rowR1gM+Nw7rkBtAx9f5LrNBFdD
	y+/bN63Bltw9qI1J7UvKBJpC58LhQaYFpw9x/Uu3K+auFGq7K4p7RuZiMWaassgeDM8+HkiRRrg
	qqMucZJUodHEEMZWqPWeYJ0F5K/gPbdkScyfFDPkeymuZAZVsH9C5IVKVxTMw31kfVfxZ
X-Gm-Gg: ASbGnctaiIp2Gr7NaqELmEKeJ6U9p2RAiOvBURd2J8HxESlEqEPGBVAQleqVfJNKylX
	CqQS7EHkRRnT/LC3pR3Aa8ekupPZwJZOiJ5DQvk9IBh8R598xjOCmhvr0xzdw3Ia0UHQWkPds1U
	jwzKRYMiNyXFzbVZK/ISnhBlfQUtgDYCeEKFsJDWDqHWoBufnyw7lwKbb5lmUovxyNP5GWsnAV4
	P/6pDlbaeZdyQPW4BoelyOQ1Q2RE/knrtJA6ttNmtlPkel2IN8Lt3KfdiUSxqKOMDJk0r8mABt/
	ntvuERgPBXSAFY+dzD5sO0fTaQ==
X-Received: by 2002:a17:902:f683:b0:231:fc4b:c04 with SMTP id d9443c01a7336-231fc4b11c7mr244351165ad.17.1747816347424;
        Wed, 21 May 2025 01:32:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGV1xWBfIK43T9/ji+GRLO5chwpRsJB/lkdE0H3gO8bQb2Z1FBbt6swDS+oSfMEBAxBhaMgSg==
X-Received: by 2002:a17:902:f683:b0:231:fc4b:c04 with SMTP id d9443c01a7336-231fc4b11c7mr244350865ad.17.1747816347039;
        Wed, 21 May 2025 01:32:27 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-233abb99a06sm13194265ad.254.2025.05.21.01.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 01:32:26 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Wed, 21 May 2025 14:02:10 +0530
Subject: [PATCH v2 1/3] soc: qcom: qcom_stats: Add support to read DDR
 statistic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-ddr_stats_-v2-1-2c54ea4fc071@oss.qualcomm.com>
References: <20250521-ddr_stats_-v2-0-2c54ea4fc071@oss.qualcomm.com>
In-Reply-To: <20250521-ddr_stats_-v2-0-2c54ea4fc071@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747816340; l=5258;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=Oe0c/HT/ThhA+Ev7ojrKYh6uc2pxBdtFufKW0Dpogs0=;
 b=ujNdqZfGze7UgJfqIFYhkIv01bVnGXPPcSyMndyG2IS1LFj+NNu0nOitbNxhGDeB+0mLItUPn
 3nWs3e1dwxXCo2C2K9N5i9yfpmwGsZGq43aIHti0GF6sCNCSBDehYv4
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA4MyBTYWx0ZWRfX9bfBSjEgaxVj
 aZL8ZkupYRWgZKyAIX8UgWvA99cwC4UQlRAL+cHiUiU+1kstmerp83nQapKlTdL/Smy6+04ZdeI
 L5KLifnGaFS+pJXLMQXMEM2iZQnpMBVY8FCymCjtkkzwfDCqijjO1GcISdNYf1bZ+++n+LNRK2X
 AlVknuhIIXjW/JlVaxuu86T0kJhNKatihyc3oih8kSX+J36zcme42mVCsRLgrEyCmMGPL4JJgk7
 ef4dnNo6fUlh2cKu69s4ZxyCyIDkJjO7VKpM3v5wNLrZcMHRR6gtPzkhDnONDBCX9v0XjtYkYi2
 Vu+6ECpHl0oKfSBVO+Xqid4xN1LS7Mc9MfCCMHApvZgmh/co8hiv1t96Pbn9YANq3OU0pZ45fYS
 USq7YbHGTelwny2+lpvLhageuq5jdRRN5YskfIFsroiOwXV94IwihCyJrlsNgQ8Pda9u2z9R
X-Proofpoint-GUID: Qn2bO5uv3MjTUIwKEEiqubE3LWEfLTX1
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=682d8f9c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=4QwxTSDsR6DxlQvKCcYA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Qn2bO5uv3MjTUIwKEEiqubE3LWEfLTX1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_02,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210083

DDR statistic provide different DDR LPM and DDR frequency statistic.
Add support to read from MSGRAM and display via debugfs.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_stats.c | 99 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
index 5de99cf59b9fbe32c0580e371c3cc362dfabb895..6ee73268db1d4f69deaf4ff1ee8cc8e245b76f07 100644
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
+		seq_printf(s, "DDR LPM Stat Name:0x%x\tcount:%u\tDuration (ticks):%llu\n",
+			   DDR_STATS_LPM_NAME(data->name), data->count, data->duration);
+		break;
+	case 1:
+		if (!data->count || !DDR_STATS_FREQ(data->name))
+			return;
+
+		cp_idx = DDR_STATS_CP_IDX(data->name);
+		seq_printf(s, "DDR Freq %uMhz:\tCP IDX:%u\tcount:%u\tDuration (ticks):%llu\n",
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


