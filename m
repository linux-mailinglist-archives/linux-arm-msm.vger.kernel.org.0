Return-Path: <linux-arm-msm+bounces-59669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2358AC65AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 11:22:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EE613B5B83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 09:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18196277804;
	Wed, 28 May 2025 09:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QBzGFsb8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3739E27605A
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 09:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748424108; cv=none; b=iCQcw8mrgvq2WaunuP1w722+TFzfpWlnzZe5SZdIdsaurZQFcAxNtBA6L0bEdNTnYL9ZHeI2oIdzaY0fAXdV4KhOa1mAJLqkXP6jqbuJg+FX6WL0uqmGMsEYmwhWfdKgPx34o8PXXE/0njiuYvirZ6uait5J1d+90GGpQyGssZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748424108; c=relaxed/simple;
	bh=vRR6szynldY94FYUj5qNjs3DmteWmQfiTljj3mxMF78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SdTNaqJ7mNzIJ1d4RK96JHIRFVhrhOqSLCnHm36wb8mc5WrBwbjPL+nfN5muqmkN8m05bnqWkmqg094Q8UACqiTzAHgaTL1AtqBiSSz+01Ypt/eobMNfUVr6170OIYFZYkArfrB9YWCb+TQ18JJkjQCkffEp+Z+34ZRwy1kxCsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QBzGFsb8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S7Nrb0016786
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 09:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LdmcYDeR3oxl4uFyKw3pkSyRmu08N2XqrqgvurqEKN0=; b=QBzGFsb8QvT/YLEc
	14HhK5zHN3mSsKt3rfJJh/6un/CYR2/tCrSl2Zelpjpe0mx5j0jEs4jekWRAzkHR
	SKmZWkQe4crnS08r4iMPGKyJnW7be2fkegf62UbW4WZTZ/sqds7qerC0h2i1YCdt
	lXrP+DKGYkRZBsmZ6jIDVxYPiZfA23tFDClsVw7uHmlP/mhvhEXT9tA2Fvyyh85V
	e1IJdZ6Ib9CJDgUR36wSPdYsjwbnyIj0EIhBA3zAo6mHklCHVhm7HGUGrtQBWH9V
	5Rz60u7+OCpnkCZHMdkUmrX7bhzsi1p9a0Q+OXuxdzsPX4AO78XeDzJE05wiHqFZ
	nsF6QQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fq9wqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 09:21:43 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-73c09e99069so5034210b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 02:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748424102; x=1749028902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LdmcYDeR3oxl4uFyKw3pkSyRmu08N2XqrqgvurqEKN0=;
        b=RNnlILw/XJis4mS2/Wcb5ZYtL68ICqn3/kssuYoYfbabL9vKJEUrO6P7FA9ma5MdOz
         3nSGPPX1gv804Lf/9IIkeah35qB2uDf2aGoWdKSyjVzddn9XXm+7mJoJfKadu1AvgUyI
         d5tGe6Y+eLax/cO3JdD2QDbVn9/hOQrcRuzYqCtENf/IUQandq+TCDuJG3fqoyJfhvSb
         CAwJBMY8cXzi4/tJuf1Kk6P3TG87KNdaBqKC5P8yd0If874CECbf/t5TIcXN3E/cb5AS
         N96D47VbX2Be/fqo7lIR/p7K15UoJpGv6LN1zgj4aIhBPKfwJLHgGZHY+xN6g6nkPF7i
         BpJQ==
X-Gm-Message-State: AOJu0Yx5F+1dfAOTwwYxyOSN+FKU7pOcVuI1+OfvKobtAHuZrZhJQfh4
	gYVCP8jYo2qA8QaSGjNV5pxAlSn8igWWo0HOzQNL+7DvZu/nj3RIEkgm+j+QV0Jn3K+A4uAX2+j
	iPf+4SEwc2oL2xbKbO/ptWBCCFUs/330k/uuNIMFdVOjHVYb8hYKy3bjqwue+AWrL5mih
X-Gm-Gg: ASbGncv6jlQtu6ph02wMfr4fN14axz/aFSmpyGr1KQqih/iOzhXyc1RlX9RBoEbCdaU
	gdbsggwqGc3jgbyhriXpv4ecfr3gWwstULxDBLF5sN/6SqoyqkrNEZPqZdCV2WnuP5yaF5dWN92
	lWjf9vkG6oR0DVy2OYKTEzpbJ4y0xgF4fHTSSWAacKqjIocU3jbURcyp8Y+6o9+r8npdCK6k1J6
	80qLbcX2BMltQkDYkPeHs+FSBSDpg2PSARYsCVDo1Ms7JIUFRFwpwiL17lryUS54bP5Au4UpweT
	BB+KRqL7kKtL5ZH5N9xlZwWuug==
X-Received: by 2002:a05:6a00:2e84:b0:730:95a6:3761 with SMTP id d2e1a72fcca58-745fde797f3mr24323797b3a.3.1748424102591;
        Wed, 28 May 2025 02:21:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOHf36e4dkNlG6DMsyRTtIAf5lz2596DKm1iPCMiu2jr/91WaEtWmAHAW/0U0SViuukeLjeA==
X-Received: by 2002:a05:6a00:2e84:b0:730:95a6:3761 with SMTP id d2e1a72fcca58-745fde797f3mr24323768b3a.3.1748424102157;
        Wed, 28 May 2025 02:21:42 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746e343c2c6sm833456b3a.134.2025.05.28.02.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 02:21:41 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Wed, 28 May 2025 14:51:31 +0530
Subject: [PATCH v4 1/3] soc: qcom: qcom_stats: Add support to read DDR
 statistic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-ddr_stats_-v4-1-b4b7dae072dc@oss.qualcomm.com>
References: <20250528-ddr_stats_-v4-0-b4b7dae072dc@oss.qualcomm.com>
In-Reply-To: <20250528-ddr_stats_-v4-0-b4b7dae072dc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748424095; l=5260;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=vRR6szynldY94FYUj5qNjs3DmteWmQfiTljj3mxMF78=;
 b=wyg0HxlBt9+CHjpyV/krOmIWGoJbdWC5A52CQmU5BRZ9BOYY6tmJnIQEUtum6PX7YjgxleFAJ
 Owu/bpw0QjuBhM/JrDxCEq0uXp0YllZUeVLkZO7lC5jIAP/YeYltPbe
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: klSOsYLG_9lwGmGcUsd21E4AIoS4f1RP
X-Proofpoint-ORIG-GUID: klSOsYLG_9lwGmGcUsd21E4AIoS4f1RP
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=6836d5a7 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=4QwxTSDsR6DxlQvKCcYA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA4MCBTYWx0ZWRfX9/yd3hYts4J7
 xQjHVe72Y67xLdXLzW0lzBQ9MW7CczB7JRWnwM6AWQISr5js9XOw8itd1awH9AjG/4bTIF1Q1ez
 eICsV6HSJ2JwXGCB/pWoHVSMkx/xb8yRBsD6ZVJPlQ1+cGqgTXm1nxKD7VYh2c04re1KstoFgUN
 hPbzTLXYA4hTbIHG//rM0zIgS2/xR/eP9NKdk0RVfK9h1Apg5q6niKaFn85uK47piA8aewGw8QO
 Z0wban8AhhhThEa1qzb7Qe3LRDdRBg9bw+aIzqq7lgaN30U6zDsUQplSR5FztV1cqfBLTtlwXfm
 swYVVsu3dh2t5R2/C19rFFP5iRp2D2STId7DDEYjT6fRZLokNt7TiEqYXWKTkRVw6uzMamoh3Kt
 wUjPzO639ixUtXJXJJqTkp1yA7o9pOmLH1WoknlnM9Kmy9lVWJWwJrWFmp/VwvEScH7QA9RF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_04,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280080

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


