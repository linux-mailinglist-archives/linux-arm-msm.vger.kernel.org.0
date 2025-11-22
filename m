Return-Path: <linux-arm-msm+bounces-82932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D4BC7C75C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 06:01:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 426194E2F2C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 05:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC4B2BE7AC;
	Sat, 22 Nov 2025 05:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hc1CfRTd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bZn5GU2i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5617C2BE620
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 05:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763787669; cv=none; b=BDwDD6LyuKByl9cFCNqwKJpoVTYmUcqin1Bl+0r4X/aZYJmXq389574vpXxRLvzFkMHNfcR5aeAjXsDSC9l6qS0cZGUUbpsg7uSeKKlm0K/mCBeujGLk3JiNQGVbuEbawUBxU6ayzlIip7OM6FuoXpTzYCgxxMcenIqzgfJBF8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763787669; c=relaxed/simple;
	bh=5FymjPfvlgC+qNA+t/Omj53maDcsKpdv2H50iHJArm0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gv1SlutlR/fr1FN607eTINdmEjaWkvceNvVhPdqChlj4Uo2ZaJ5qFU/TX/l4jKBCTao0fzCjhliLUIeebTnMTJBVDLXrSZ5BbvShpAAgClwUfM7v3g6IqdRtn5EnS5vU28+khFMyZRML6YuY+K4lQ4X1P1vXBNarASmrww91Nyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hc1CfRTd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bZn5GU2i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AM4dvYc1091385
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 05:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=caicS9Fdeoo
	pePrrAT2bbtFvVaxE0HhhLndEP+/8Hlo=; b=hc1CfRTdHPe5JLU+lSidJkTIuDD
	I+gUAKj0rm8M3J0qQjx2SmqkkZbYVrg59sz6b/oSs4yEvUklNaCAN1Iw+HwAAk61
	M9kXR8btSdy4fe/ZAzMTdyaqUAJ4K3ZCqeNq9UjSXbWkPCE7HhaRMggQgVp4o4Pf
	d5fKQz81XagmEG2yg1Zgs7FhBEYAeSqk0rVlO3jJi+O/VGW5v3GYICjDHmzdJTB1
	THNBMOIbIACLu9wvOiNHoCdTJmWJsgHSCDQAYwIUeIEjs6gFLZOmPIeBJhkyAgug
	A8HTMHZco5QbkKV84r8VMXu2a7TkNAKs/7ST7AOoS2ubfuFQ2BEvSQXZUdg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak6bgr115-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 05:01:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29557f43d56so36312955ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 21:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763787667; x=1764392467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=caicS9FdeoopePrrAT2bbtFvVaxE0HhhLndEP+/8Hlo=;
        b=bZn5GU2iWTDJ9i8wDo2SQT4eNR0rlad024W0X83MepibPGdzYwzk8XTs9OhPh18iG5
         Eu5cdrDoQyerbkRP28VOtOQG40ykuXw7JRDNOcLhMPCvgfjtTwzreDzMMMwRkHoYgLa3
         uhR7VrmiKB8KHkKRnOcpEB/Lqyg+4o/ApdEbzK8tVHm1JKOr2Hr66ITjpL/SKhHVbZB/
         trdYF4ZF2rvkw4FDYl3ZUsEiROAgUSuWi2ER17YeXuvO01M1IR4xcIMy6FNL7B0wJk+u
         xnQHV9ASFeu0OZnH7UqWznlKHr5oi++sIuTh/Ml1aCwp/aVT4Ith6eGp3ZTgJqdfPKy7
         xmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763787667; x=1764392467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=caicS9FdeoopePrrAT2bbtFvVaxE0HhhLndEP+/8Hlo=;
        b=E0nmQN2KzQBDlLhlFOOJ2/M7ztHxne7FBANWdWDiUiGSg1YKvJu/EXkIIvCHtjPuaq
         XIXutofGWYsamEa8K15c8y6eqK9Ls2nfi70RthlWrXHyIuzl8cbnX01T/0IE7KfijrzF
         B3GtNLSizAPh2pa5a9MjJhMfbQRY5nf3JY1D/mc6xmJSZNtMtXmvquFGtjha1lIshHKv
         kTTCW4tcsrLTXG8NPKGKP1K3ed50G+vORKz0j6trs80rowkm9udYuv45V4MK+COFX9V4
         5GleSBj1nFCOn19pvv1e6dQ/xZ8fsHLleoWN/TZpBD32u4EzJdCAmlYnZvMcIoh934jW
         fiUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyrDM47ie3NdcU8S8XjH6um2prB06ZIO6IR++SBwUfGcpAPHVVrNP+yOQ1qh0ICyi0WphhhHtNCDpcinqu@vger.kernel.org
X-Gm-Message-State: AOJu0YwKVmM9bdfZL2F914gV8T8Xb2Ro7yYbktyZHbucaGEbKd1YFdYw
	9ViU258Htl8CPzxZLdgrdjF1xHZ4RbYr2httLbWyiEtj66yTuoCym4QcaqXpegTd0YT33Nf8uwQ
	dgGrpCwfjDohO7J+p9poGLnoZmq8Mg9oNNMJebWR7UnZ92Waj1wM703yztQAeqUV5xVF1
X-Gm-Gg: ASbGncsVOcPuwuC+SXMTgLVXNdK+9yjmK1McSTryJ/4uFAY0Lb+xHVImLT112ObDO3s
	O0FFFky8AQfkmuiFckGTm8h6PueVOt06FQ8hX6NPnTzrz2uKnF/UcaHTn1kufYEf9Ch2Fmj/9lR
	GWm3dabUm3YLaOKQsIFoses6oMBYEaPZ+WKCGEi0jwh1N+uw2N4BQ1IQvv7VuXJVNpr6PEruLPd
	87LGTQcoixHoJgYYZ3//HAEMTW70EtlKGUczXFz503IJiOp3Jn/+a4hPhug2UKXz3jTyFSorsgu
	wha/fdBQPCRDSs5RWCvB2gkDS7xjSzV7U43HC1valACklQny+kGWtY5aC0dADR3MaXZjnTQHHHL
	5IgkUqono0B/bNArsLGwQ4rt1b2EpTawG+gxkdQdpcBo=
X-Received: by 2002:a17:902:ce0c:b0:298:33c9:eda1 with SMTP id d9443c01a7336-29b6bf65137mr56078055ad.43.1763787666733;
        Fri, 21 Nov 2025 21:01:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGj6JCjZt8nVOBBiOy+gR454eyBDzt5Ff3v0Xzoc343F1gSDY+4aAHMdKCxPgSNrEMmfXXj8g==
X-Received: by 2002:a17:902:ce0c:b0:298:33c9:eda1 with SMTP id d9443c01a7336-29b6bf65137mr56077555ad.43.1763787666132;
        Fri, 21 Nov 2025 21:01:06 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138c08sm70688725ad.25.2025.11.21.21.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 21:01:05 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com
Subject: [PATCH v1 05/12] soc: qcom: geni-se: Introduce helper API for attaching power domains
Date: Sat, 22 Nov 2025 10:30:11 +0530
Message-Id: <20251122050018.283669-6-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
References: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4LwCXkgj1kdjJ6KkgfjXVeTatkKMOjYY
X-Authority-Analysis: v=2.4 cv=MtJfKmae c=1 sm=1 tr=0 ts=69214393 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dV-XI41DVKgoCQLr4ZQA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 4LwCXkgj1kdjJ6KkgfjXVeTatkKMOjYY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDAzNyBTYWx0ZWRfX4benrFP5Z1Mn
 mcrSxxqVYyYOLYZdxTaPY4yvN6v/sP1m683LGWAaoNDoxvJ8sLWZGaDRvOMqKMhAWMr0llZgOu+
 Xti1Egbgj7jhg/ydPYkabJIvKbBg5roldT2SgJvEef4OpgxvZVYACy6pWV2URBaBmfuJpuYT+jQ
 tVjAT+QDGmBFY1Q6he3d18Ue2pcB5P4cCTDU6GnSJPWB6QQWQlxcCU9y6ba0vmnULVQRB2qXlJ5
 o9HWmojrSI/5RBSPifcevwvKVTy55lk8p9BMLYS/KR0bd4JNYc5WVRXObleziQuqlfB4BcdF7mu
 d3cFuZrfsEQkhBMJN7yGEIEzU15EwxHjzx9dro0z/Co95AUEKAxv9YYkyZsoCmaFeacmVyZ/tLn
 AsW6pAa6cFb+gyl3TQR0hg0T3C1dPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_01,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220037

The GENI Serial Engine drivers (I2C, SPI, and SERIAL) currently handle
the attachment of power domains. This often leads to duplicated code
logic across different driver probe functions.

Introduce a new helper API, geni_se_domain_attach(), to centralize
the logic for attaching "power" and "perf" domains to the GENI SE
device.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c  | 29 +++++++++++++++++++++++++++++
 include/linux/soc/qcom/geni-se.h |  4 ++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 7aee7fd2e240..30b58f2f2e5d 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -19,6 +19,7 @@
 #include <linux/of_platform.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 #include <linux/soc/qcom/geni-se.h>
 
@@ -1074,6 +1075,34 @@ int geni_se_resources_state(struct geni_se *se, bool power_on)
 }
 EXPORT_SYMBOL_GPL(geni_se_resources_state);
 
+/**
+ * geni_se_domain_attach() - Attach power domains to a GENI SE device.
+ * @se: Pointer to the geni_se structure representing the GENI SE device.
+ *
+ * This function attaches the necessary power domains ("power" and "perf")
+ * to the GENI Serial Engine device. It initializes `se->pd_list` with the
+ * attached domains.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int geni_se_domain_attach(struct geni_se *se)
+{
+	struct dev_pm_domain_attach_data pd_data = {
+		.pd_flags = PD_FLAG_DEV_LINK_ON,
+		.pd_names = (const char*[]) { "power", "perf" },
+		.num_pd_names = 2,
+	};
+	int ret;
+
+	ret = dev_pm_domain_attach_list(se->dev,
+					&pd_data, &se->pd_list);
+	if (ret <= 0)
+		return -EINVAL;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(geni_se_domain_attach);
+
 /**
  * geni_se_resources_init() - Initialize resources for a GENI SE device.
  * @se: Pointer to the geni_se structure representing the GENI SE device.
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index d1ca13a4e54c..8c9b847aaf20 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -64,6 +64,7 @@ struct geni_icc_path {
  * @num_clk_levels:	Number of valid clock levels in clk_perf_tbl
  * @clk_perf_tbl:	Table of clock frequency input to serial engine clock
  * @icc_paths:		Array of ICC paths for SE
+ * @pd_list:		Power domain list for managing power domains
  * @has_opp:		Indicates if OPP is supported
  */
 struct geni_se {
@@ -75,6 +76,7 @@ struct geni_se {
 	unsigned int num_clk_levels;
 	unsigned long *clk_perf_tbl;
 	struct geni_icc_path icc_paths[3];
+	struct dev_pm_domain_list *pd_list;
 	bool has_opp;
 };
 
@@ -544,5 +546,7 @@ int geni_se_resources_init(struct geni_se *se);
 int geni_se_resources_state(struct geni_se *se, bool power_on);
 
 int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protocol);
+
+int geni_se_domain_attach(struct geni_se *se);
 #endif
 #endif
-- 
2.34.1


