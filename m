Return-Path: <linux-arm-msm+bounces-56007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 82735AA00F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 05:53:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 294401B6284B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 03:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C76A274647;
	Tue, 29 Apr 2025 03:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h/uPqF6U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7539F2741CC
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 03:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745898793; cv=none; b=jYSbgnK2AHChwAf0ZIe6tf0nx7Z7yqcn1vpfpr2ry/cy2+V+1fIXlhlGD4vAAHKj+NXl5RQryX1/AZGEOuwodZ9l6Fm29Kvk51ncOYAP1o/nvbR+uow71xXMI/EGdD5DbfeTT+6Ib0nHbn30s7iRY5OjbUwvhzxvGJ6pIy1H84A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745898793; c=relaxed/simple;
	bh=AytacF8IX6i6G1FN8eQ1htwX9lpcsnJFuCYiZeq112E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HlviIcdIyz3XGXpvjruB5cb/LV61+q4iff+agpfF2MarP6wwFY4V9zTLyAzFy7QWd1AKh0oFNsH/TTv/B2zCjIJVkm4dM5oq7YjAoFrs+EP531w5eA3x1XxrcTelyMQk7fDAZn4ILvavheLgYhRCyHkwgk4uymmGAR4YpDUn3Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h/uPqF6U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNr8Mq014387
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 03:53:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x6NDUslavgZOx8kuTTGLUx0Srey60wxbb+yJNYs/03o=; b=h/uPqF6UEmN2+dna
	zardzneIDQ8k7+WKj8WqnRmNMef2/WgqfmGSSynT45NfprZVcIUAODhayLTJG34W
	yEzbS+V7uwV0DBifAOrVIupOktZIzF2z7qxjbemQRN8/8vMFEyLUHs3z+MI0zJR7
	woqF5q6E6qNUGElROMlNe+gDNohpJXS6mk0M60YmNJ0HXorWGBEaXvzn4BPN3Iko
	4/ODhjRJyiRWNZWwxh67dbk4RPnueAkqNhs3uz7Rxxi6pfx6jugabE/uZ+Cw+gqR
	TaJ5v5GqJFcdt5t/KXm+fuqBpgY37RAhJ+pTFk1A1LhQjeUAcCTc/HDxAFL2mB4j
	l98ZVg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnn228v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 03:53:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-227a8cdd272so46166745ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 20:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898791; x=1746503591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6NDUslavgZOx8kuTTGLUx0Srey60wxbb+yJNYs/03o=;
        b=QzXkTqcWqkNXQ9r2Rm2PutC3hBDfB1sjgAjIzy9AMJnneAYAxKgb1wfOsq/ckPhddi
         tnZ8JCwOl/755M16KOYbDRLJgZCAbYL1aHOOY5875qoE8vSPJiDTG84NybHqkGX1fBZT
         4iTGpuSFyoQFnhrLIlKBMJ4xMtwZn5ARfFRz5VKSTMalhw5tvdcFXOEFezenFNhuU5A2
         ceeScandAlpHYWIOllvrT9eMtyYhkeySyET7WlSbIB1GjezMHJXivEpwBS44NZHaxVIT
         8wLrcXtFVRv472cpNIMfi4Ah6VdKP1HwkBewGdnkdu1Ia4OOlxRO0oxToN1Jof7Qg30w
         +0MA==
X-Gm-Message-State: AOJu0YxP90JhuqCx44Da+IHob0kw94mEw63ze7mk6Jf0tFHKtvqLJka1
	iGyCConbVeNpA4PPSoiSNRBOYpPpFTItF2UOIzn5++ExUGFYi1Pr/rds1obSInG+9P+WQJorfJz
	gmqbCk39IxlcrTovyNG3r4W/xMrFt9NiYeEVys/hDVfp2cU/UxGsleVGdAvVdEU3e
X-Gm-Gg: ASbGncuRe7sfONt4hDq3vioBDD4oTr8P4x7Xo3bp1BVvmatZLMWema3kpJKvNIVjENA
	4keeyx3KYGgMP16n+Y4VHvXwgI14V96CGdsqUlHVpt3weROk6I1sbOunBk9zVUhB9s8WHrrFwKJ
	fUzVXbsnm5m5uZbm2NzaTRfMlG7Qt0bP0HIEcjUPsLP6gk3L0Zq5/sixNaqhYnD2X+Y1FVidZ2Y
	/e5dTbJJ/uAg2tvjwEOKT0sZNjU1GYrvqavekZH0OVyFioNiUdHh8vNVJJWBQ7wPx0yCbz4MnRs
	b7lJaOpq2IeNnnFjOpZNNv6ktA==
X-Received: by 2002:a17:902:e5cd:b0:224:912:153 with SMTP id d9443c01a7336-22dc69f3b1cmr172161125ad.5.1745898790850;
        Mon, 28 Apr 2025 20:53:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUBmfQ+9kjzawyqWn958VruQ8fxXZJKgBmdQ2Z/yh+wmTC8W1vvIpXPHtTAVzYgC6/Fn2RxA==
X-Received: by 2002:a17:902:e5cd:b0:224:912:153 with SMTP id d9443c01a7336-22dc69f3b1cmr172160875ad.5.1745898790496;
        Mon, 28 Apr 2025 20:53:10 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef1246d2sm9960522a91.36.2025.04.28.20.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:53:10 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 09:22:34 +0530
Subject: [PATCH 2/3] soc: qcom: qcom_stats: Add QMP support for syncing ddr
 stats
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-ddr_stats_-v1-2-4fc818aab7bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745898780; l=2774;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=AytacF8IX6i6G1FN8eQ1htwX9lpcsnJFuCYiZeq112E=;
 b=8wXYJ/U60BWLP/iUvPBfRZhtpCSgDOAseIhsxzLbxydIj3FgwI5/Iz/VryX05SButZs/oWGCJ
 ghS1A2C2Io9BkwVUlvVaZgZdbNPz+EQfpg2SXFKcYBIEUS56FjxnjiK
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: wbulUs6_wzHst2M7SakpMJU9uh_eP2q-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAyNyBTYWx0ZWRfX44hv4aXLV1xB SgzLO28+h243zBOI4U/1362an4ij9zwkJ5Yjdt/z1WgarOSRZrYT/TJ9NpY3n5sVIZQYqsHuSlB tG+G2ZDlf+CjRGr4yeGcHw65GiUbGFHMxiDalAX684xsB6ZBlLJjz6gFdijHFLyulTf1zJLGrbf
 wRieYUBTIH3a7c6GWOSQZecomsuoz3VnlGPkcbuCZKzdIlSpI7XGl12gknqrJz9mGP3LT7625t7 BEYRxS/J2FQELK5e8mXfeWTqRptOUdmgv32HE1W9Y8P3Aj5qy4q24pc+LuKf6vlZeFrMyggL//U 1yK62WhJkQK6BxTkAkgloxyAXl+l2Ehe10JnG0hcEaxgkO8LxxjPJPKevQth1AQLNgXnoCjgl7c
 4XNw6k83Sd33/38nmM0OM1ywsiq+9mtZhR50B8VhHAhBTpI6rpW2+0kSfZZ9rbEY8LGxOjoM
X-Proofpoint-GUID: wbulUs6_wzHst2M7SakpMJU9uh_eP2q-
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=68104d27 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=BT90xxDHZu-g9S-RVkkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290027

Recent SoCs (SM8450 onwards) require QMP command to be sent before reading
ddr stats. The duration field of ddr stats will get populated only if QMP
command is sent.

Add support to send ddr stats freqsync QMP command.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_stats.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
index ee11fb0919742454d40442112787c087ba8f6598..15bdb8e6a542bbab34f788ac4270f7759ca83e3c 100644
--- a/drivers/soc/qcom/qcom_stats.c
+++ b/drivers/soc/qcom/qcom_stats.c
@@ -13,6 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
 
+#include <linux/soc/qcom/qcom_aoss.h>
 #include <linux/soc/qcom/smem.h>
 #include <clocksource/arm_arch_timer.h>
 
@@ -37,6 +38,8 @@
 #define DDR_STATS_TYPE(data)		FIELD_GET(GENMASK(15, 8), data)
 #define DDR_STATS_FREQ(data)		FIELD_GET(GENMASK(31, 16), data)
 
+static struct qmp *qcom_stats_qmp;
+
 struct subsystem_data {
 	const char *name;
 	u32 smem_item;
@@ -188,12 +191,28 @@ static int qcom_ddr_stats_show(struct seq_file *s, void *d)
 	struct ddr_stats_entry data[DDR_STATS_MAX_NUM_MODES];
 	void __iomem *reg = (void __iomem *)s->private;
 	u32 entry_count;
-	int i;
+	int i, ret;
 
 	entry_count = readl_relaxed(reg + DDR_STATS_NUM_MODES_ADDR);
 	if (entry_count > DDR_STATS_MAX_NUM_MODES)
 		return 0;
 
+	if (qcom_stats_qmp) {
+		/*
+		 * Recent SoCs (SM8450 onwards) do not have duration field
+		 * populated from boot up onwards for both DDR LPM Stats
+		 * and DDR Frequency Stats.
+		 *
+		 * Send QMP message to Always on processor which will
+		 * populate duration field into MSG RAM area.
+		 *
+		 * Sent everytime to read latest data.
+		 */
+		ret = qmp_send(qcom_stats_qmp, "{class: ddr, action: freqsync}");
+		if (ret)
+			seq_printf(s, "Error updating duration field %d\n", ret);
+	}
+
 	reg += DDR_STATS_ENTRY_START_ADDR;
 	memcpy_fromio(data, reg, sizeof(struct ddr_stats_entry) * entry_count);
 
@@ -310,6 +329,15 @@ static int qcom_stats_probe(struct platform_device *pdev)
 	qcom_create_subsystem_stat_files(root, config);
 	qcom_create_soc_sleep_stat_files(root, reg, d, config);
 	qcom_create_ddr_stat_files(root, reg, config);
+	/*
+	 * QMP is used for DDR stats syncing to MSG RAM for certain SoCs having
+	 * (SM8450 onwards). The prior SoCs do not need QMP handle as the required
+	 * stats are already present in MSG RAM, provided the DDR_STATS_MAGIC_KEY
+	 * matches.
+	 */
+	qcom_stats_qmp = qmp_get(&pdev->dev);
+	if (IS_ERR(qcom_stats_qmp))
+		qcom_stats_qmp = NULL;
 
 	platform_set_drvdata(pdev, root);
 

-- 
2.34.1


