Return-Path: <linux-arm-msm+bounces-56006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BE6AA00F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 05:53:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7232B5A4FEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 03:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD052741C4;
	Tue, 29 Apr 2025 03:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qjy4WSpJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565822741B4
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 03:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745898792; cv=none; b=p2y2ADW7Z/t4GAXSXjdVuxX2OScTSL/Gu2MJ4FIxqHvAr83cXC2C08Yjyhv1bOGByuVFR5/HnXYZadbeoKr56AITHyhfNBTDRvtl4uSsFKT1wlzAJeZ61EmM2rmJh7cXwOaJXcVGni/vUG4/i6H0t0VP4bhpyLaf87vEbhrRv3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745898792; c=relaxed/simple;
	bh=KBLVRw4EQ8n87HBdGxGZz0NBPnzcgQ3qqKwMHrpwiy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KA6DfmUntoSi6S8t93xzjyymvirv6F7/GzWrjweUCcCBDdYWiQnAf74UGdKQlRDH2zMcZ5h3Ik7Bt5NcEdDLxnsgqWxhV5A9+n9d4hJ0+TI6LTLMQHvMwbuL5E0ZNutqTlTFPI7WuTjxaA19UqDGkNfWM3We/6/nURXyKqpMU68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qjy4WSpJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq0kD000503
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 03:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2m1IDBjD0TjZMEvSLlP6dKihhi0FrOlQ9FbxHyc3VOc=; b=Qjy4WSpJ8hkhWP7M
	JQI8swUaxPwD7v3VyCdN/W//2Jezt/dHCvXd4O9PQxfSe6FNxfFaYdQREDKS1UP2
	bn1OwzSb9181uzedRQ9AtolpO/SXuc8Sgy1EXeUdUDV0nkwA72wPcQ86wPPikt5o
	kMCLIMjjYcj1VYqSCyW6V36NiMmyd2gX2v2dB45Fe5eRhAFHqQJ7SEgtg39iWodN
	29adIIkbCtSYKungOhvZEmwBWItYECEmZJzk+/+1ceTqfZyy6Uu1CnMfAv38rl2F
	quplGJ1/Trk1kmxFslFm7Z0AfwswS2n7CIV3ilpvC8c32/YGuLvVNLYb8GFf+3/7
	LFH2dg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qv9k4ne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 03:53:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-308677f7d8cso4897367a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 20:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898788; x=1746503588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2m1IDBjD0TjZMEvSLlP6dKihhi0FrOlQ9FbxHyc3VOc=;
        b=HdDrj9Ykthc/zl3/XO9ALmP7vmht4G1Yc9puOxPG87+othku6oZSRROHeYt6BbOwhh
         obOxGT2JvEWQ3j14mAX8Mo26Z+sQrPzqfW83XusqmG1zxYO1T0Lgj1zrd7WuP00Wb0Rw
         21nEqBdHRaWoq0f9Vfwtu7OgGAtXaDjgy17B0bV9mxZTjP8vDtt6G7DqR9d5uuE3PMaf
         BrqNux86fMl56j4B4ceDy3KjdoCXNUOX14zl88FdLn2YZ7po6fCmcIZiKNk3pT6ys6dx
         BCrbxhyfnjc6MjHRuyhCeLSwIHoGNoCQvelnPqO0rKx7P5qwPfjPFDe5WwRoG/ifCRBf
         Y0zw==
X-Gm-Message-State: AOJu0YwW76QiNGq58haqZviXTj/TOjLnr0nxSkMDlXJpgJ5GO2CJHwGS
	kmY+zQhIWkQcwPJDOUS35whv6iyFW5lmLS8FEjK1Cte1C76gybI6dMzWAYMYFFSr3L4vUaaTCae
	JZxWmJpxgaZ+zMhlApsqvpYEq8ew1VK7HIM7/tzA4mQ4euIl8y0JRebALOi2JbniR
X-Gm-Gg: ASbGncvI2pnwbcXDV38DrFxhOPQu4A+mJF7FWvJuHrpiMKXz3QRK6tsCcSRUOrVizQ1
	ChYcFuD5EACNVkZCDObk/uzrGWxqm3e3MuP/Fo8OH2REiyAR40hWI/Cob0SEveoGK+b9vmdaZ4W
	Krro+oFx+U6GDCUSmqxkG2bHc+z2oL8eUqZRJvgKiykznHNuB8mbmiKvHY7VNpv7o01n4sRd9+R
	OKRfRDOBrUZjFVELD0Wbfn4C2qY32A6rX3gM37hZ2dEpUE1aDU46R3ghe8hdcZ6gDY/zxV+6IJW
	1B5lJrrJFtF7PuSCx/FFof1BLA==
X-Received: by 2002:a17:90b:180d:b0:2ea:3f34:f18f with SMTP id 98e67ed59e1d1-30a2155e3a9mr2893530a91.19.1745898787616;
        Mon, 28 Apr 2025 20:53:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1q4t1m3f4GvYJbXnKaMCxaGgbZDgtqDg7V77DGHIyDPWC3NyYh4PdtUYfHdknPZWwBPYZmQ==
X-Received: by 2002:a17:90b:180d:b0:2ea:3f34:f18f with SMTP id 98e67ed59e1d1-30a2155e3a9mr2893499a91.19.1745898787237;
        Mon, 28 Apr 2025 20:53:07 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef1246d2sm9960522a91.36.2025.04.28.20.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:53:06 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 09:22:33 +0530
Subject: [PATCH 1/3] soc: qcom: qcom_stats: Add support to read DDR
 statistic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-ddr_stats_-v1-1-4fc818aab7bb@oss.qualcomm.com>
References: <20250429-ddr_stats_-v1-0-4fc818aab7bb@oss.qualcomm.com>
In-Reply-To: <20250429-ddr_stats_-v1-0-4fc818aab7bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745898780; l=5276;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=KBLVRw4EQ8n87HBdGxGZz0NBPnzcgQ3qqKwMHrpwiy8=;
 b=jvfrpmCuDX3A2WMdlLy9dc+yPuxLUDhMVexQtph/E3DHCI2h6+8VcfU7HExxKmmpoe+LEsh3X
 iMmglpf78YQC0EtqPgjbl/8smS0fRGPXNrZjh8XcfDu/9UYbeZyQ09Y
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=AO34vM+d c=1 sm=1 tr=0 ts=68104d25 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=K4m-N6GZnQPiituObOwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: AL6bWGx4f7xJts2tPCy263n6udlWu1gd
X-Proofpoint-ORIG-GUID: AL6bWGx4f7xJts2tPCy263n6udlWu1gd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAyNyBTYWx0ZWRfX8bMH+LoqdUuB XGYV8IuSDFSl5+KWr81k9mgfyKj0iV7Qm6CFsAuQswWoPWNTa14ZEknWfBZ6wWkfAENBAeXbihb JUpDp4Lc79l5Oay/YA3OrWu+o5KS/+lSQ0K8DyEgMf5zYsCCEQ30aVzpyu/jtBILP6yS9Bag2t0
 dWbtA5ra35p4dCaNJBL7RmgQv1jdsKGa3UsS8y+es7go37Kak9csOKmPlq3oKHGa7S9m6Z7dBT3 849Wz7kg62WOvDMGk4Ey+HpUSS8TjfAsi6iWgDegPWmROQsL+Y5YegTh07Kqm+ndIytZKyamEMX hQuYmmuzwrdxkzfNXSLN+VfMjEkQidUy52YP7LOUWb4nwdP8Bo0160SzNdyeLvax5WfNYO3+SR5
 PsRqaPlVOseMKNn7EFsmuGQG4GFBYWziRHuneilcXMGy9oRkxLixLHAVuQRf6oKeNEPeLLjB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290027

DDR statistic provide different DDR LPM and DDR frequency statistic.
Add support to read from MSGRAM and display via debugfs.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_stats.c | 99 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
index 5de99cf59b9fbe32c0580e371c3cc362dfabb895..ee11fb0919742454d40442112787c087ba8f6598 100644
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
+#define DDR_STATS_MAX_NUM_MODES		0x14
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
+	u32 cp_idx, name;
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
+	name = DDR_STATS_TYPE(data->name);
+	if (name == 0x0) {
+		name = DDR_STATS_LPM_NAME(data->name);
+		seq_printf(s, "DDR LPM Stat Name:0x%x\tcount:%u\tDuration (ticks):%llu\n",
+			   name, data->count, data->duration);
+	} else if (name == 0x1) {
+		name = DDR_STATS_FREQ(data->name);
+		if (!name || !data->count)
+			return;
+
+		cp_idx = DDR_STATS_CP_IDX(data->name);
+		seq_printf(s, "DDR Freq %uMhz:\tCP IDX:%u\tcount:%u\tDuration (ticks):%llu\n",
+			   name, cp_idx, data->count, data->duration);
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
+		return 0;
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


