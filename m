Return-Path: <linux-arm-msm+bounces-110667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMhcHqvOHWrHeQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 20:25:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B04623EAD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 20:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3FED130A938C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 18:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F373E92AF;
	Mon,  1 Jun 2026 18:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iS6EcdVE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D0QiTdzI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD3C3DCDB5
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 18:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338149; cv=none; b=AzAmBXACvJSkbIPVya8DfWyh31v78wyWLLyLhz3i7g9GJ4ke6o5iqUdzApTzzrq3fbPdecUlHUd0CM/dl5GUd7BluF7R3XIYuUuB2mCwaJgnfnhOloFjLlNdCIA1lr7GgWLpkV5TE1Qgo/njVYv43zFX1fgUBVLIokvp4xcD3U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338149; c=relaxed/simple;
	bh=42ccGag0WOj0/GBe2dVH9h3Tap4krbtNxLr1X4sK6N8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NLQgJ9d3Xqyvy3l4uwMtysaHApFWa18FreU4LJDaP7s/7JrqaAlcVSsZeljofR77nn113Ye5GrLgyMwjP/QTIsEdPJSXC7+1+pPqmhy3rtgp3xyzAh0oGzq6FIPz98H1kmWWHOOTOraLwd4m81FXSmO0vnxpuZOjWD/meFPYehg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iS6EcdVE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D0QiTdzI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651FXCrX3372598
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 18:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	puZDQSZbceIaT3uro2Z2sNeQm6mU370uUUyIBgl4Q4w=; b=iS6EcdVEwfIn6cqf
	E2fDv6Mpexdd/KIU9ZH0qOPMx24YbWeSiAPPCS0HSECub9IFDc7F1/+aW193+xyJ
	8oI4X31c07obV0aeaQXZdVtc2JZctAnlBj40BiBgCQRVOAxkCSzwYCYzphgKhRwq
	Lu8G95u4NCNdUr1lsqcnTv9JlLH3ZA9TU98zRCqcaYAVZNojpw2GT+GIVoOsViXo
	/cwKhfAeXOwllnS56Mobetr7KMWNGC+m6z2pv6CzrDFwiUwCV9zQsY5Pnc3W2HpF
	SgCft+Gnaw5wodRY9VY7O/LrkrNBxJaQeqIo7qwSwqfJoQYyiu553BTMDsxmHLYk
	Po4IJw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh7jha9bf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 18:22:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36bc380fbf9so3326804a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 11:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780338147; x=1780942947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=puZDQSZbceIaT3uro2Z2sNeQm6mU370uUUyIBgl4Q4w=;
        b=D0QiTdzIPvX0+kNvU6+ZSv4/Crp/Y/eK1AfWk+rTIPpvmJtH8gvoOpNDTqTz4ax/wI
         cO81P9UKaV5bxg7v5EY8oB7aMYtTXMaJJwXNCQP1Ji2OptvQIe0xeiHe9acVtIpmd2oa
         PGMoH/1E9leOaDT8832RcbqNIHo4Dpz9ezZg76Yg+XD9XfL2d1ncHlYtEh4tvkHg1MbL
         i/g+SLELauVtadd5r872R0HssFRs0TwiGRuDDO1d59jww8QELGO7+wj20WRKwa5mGD66
         9y16zhoy0qQeVASJ7WNtS9VHxJoAgVL8jCegI30OtQ4E2195vAsaxnwPlKznb6Ttvi18
         d4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780338147; x=1780942947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=puZDQSZbceIaT3uro2Z2sNeQm6mU370uUUyIBgl4Q4w=;
        b=pz5wkz1v/G+Lbghh7T0WI4CDPG25hErLnhbhYid/ddfpJeNzEiIuyX5rhLwis85xk7
         J83s+WEwZ5ktzulARxN5iNbtUFTdCnJl8ee2odLaDcJDVhXvQma/OCmhJSevNx+VqR0t
         TM3j8aEer2BvMvZRzuA554RVmhrcDubNS40HSCJzl/YlXWEoi05eLLtMZh9iVG5X7z5o
         r0tuqzK0CMrx558qA8DUbycljSN2v4hwXvt16Vqjsc81jcljaJ069BPbgTnhbWgImkYm
         5HPPpQlg8jfYVTtotY/8nYOxSiZGN7E9aaDgcQlT1lTbO9cJTn3eOievF7cpTBShvdWc
         o8Xg==
X-Forwarded-Encrypted: i=1; AFNElJ+wMWpQu1TeEjHaRVu8oY93vb8xNThQoNXJDDZEH7VWpiPmkFbjPmrrH8dXg/Zdg6tIQq8/H9nG907wYlzB@vger.kernel.org
X-Gm-Message-State: AOJu0YwvbhLJxkyK/x1M6hYbh/UetGzpfi0RZ2A7dwB/TMyteZzFkvjt
	p2ThL8rFanNxvQZhllXMhEkBmzDT+WH95Vg1ju/hr4XTPP/ByiSnhD28bCaH7AvC0TC/2c21zxq
	Q/9d7xwLnSQsT5pEPGw5BG2D1ftCGUMDYA6gmt2UJiIWp0rwWZJULq2TTZWr20pufHyNI
X-Gm-Gg: Acq92OGdz3d4k0b34m5Dlz7f2C7qhO8qN1Ej/WaVRf1IFDethMrFlai2Lj+4Fnqme0m
	LL0KA0NBnxA777nuMPGb2q8UXcudgoy032NCXuFPnjoUCRYsXwsFCZVQHl4jDJprSZJGNK4ArZe
	hOknVlJI5gEfn6A28+pVZz9vvCrchO4ACMq4RiJ4i3lzb94x3RJiT6QJD40/nWwBzIF7U3we4c+
	+pCp9LXMtS+YXpLXK6KuEd9eQ66UkL+ecYTC6Js0UJNXFLYq5BzRAcKRPWu0aWOlsQCdSHNSaxU
	2S5eWpEp7IXvsAU/X+Inpv8NNf0+3/Jj/A+q+Ipv3ieDq0qHbmhdoitaK7ZEm5pysE3N2KN8RPf
	TCxWCFUAI6KtUZnQBY/AFBMMA8Ra+WVSKIS+5OriyXgG0gfoex4gIXuDK8ZfxEqY=
X-Received: by 2002:a17:90b:3141:b0:366:1bab:c3d6 with SMTP id 98e67ed59e1d1-36c4ff6456emr12830373a91.10.1780338147345;
        Mon, 01 Jun 2026 11:22:27 -0700 (PDT)
X-Received: by 2002:a17:90b:3141:b0:366:1bab:c3d6 with SMTP id 98e67ed59e1d1-36c4ff6456emr12830328a91.10.1780338146828;
        Mon, 01 Jun 2026 11:22:26 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd918f069sm326613a91.1.2026.06.01.11.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:22:26 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 23:51:27 +0530
Subject: [PATCH v3 05/12] clk: qcom: dispcc-qcm2290: Move to the latest
 common qcom_cc_probe() model
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-dispcc-gpucc-v3-5-61c1ba3735e8@oss.qualcomm.com>
References: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 8nK7VIO1rH527x_tvgbTLOavYlUe1vHg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE4MSBTYWx0ZWRfX2cM8l/kgj06M
 eMj4GbAoJO4TlQ534XZ9n0QWxRhCEgfkYILSAkzQpG8r5ZjdKSKp63vt7hBqdxrTyvNzqfeXRTY
 6sURXCr9HgQgeAmeFIyqZXD4h3CJDpwvlv5NL7ZEgjBvHcc2/pErHgblJWOeXFT3f/ZvHZSryLg
 HULWMXGqlR66SM5LHPfh0et9ZbjGub7ufdKl9zMyBHhPAM/220PF9apOuyPzAEKMSRdmEFGStmX
 MXuBC0yyKSdRlPbj2u5lNf4vB4QhrVIFrDwDH2PG91//+VBxIssOdxFtfU4iM1oagfgB6nOi8VH
 eXi77D1P2m/gJ2rI2sZ6zAs052v7URl48md0O5I5gTnn0L0McQ+wvdl7QHZX8x9iCU/GOvPVEzw
 en+0Gmw0y+XRnQfLg0WnACdlQsPfwAhQ00uvJYEOi8hULnZ4ZmH2CFIjz/JHqLEOEYFb/ge6LDF
 6UBAxTmcEZ1TW2Ng1mw==
X-Authority-Analysis: v=2.4 cv=YuY/gYYX c=1 sm=1 tr=0 ts=6a1dcde4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=5-E6Jl9njFXL_0F9BXgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 8nK7VIO1rH527x_tvgbTLOavYlUe1vHg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010181
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-110667-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 17B04623EAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update the QCM2290 DISPCC driver to use the qcom_cc_probe() model by moving
the critical clocks handling and PLL configurations from probe to the
driver_data to align with the latest convention.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 6d88d067337fa132114b0d8666931b449f86de17..1c21267ae0f7a86c1de88e888c2a990c35f0a0e0 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2020, The Linux Foundation. All rights reserved.
  * Copyright (c) 2021, Linaro Ltd.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/clk-provider.h>
@@ -49,6 +50,7 @@ static const struct alpha_pll_config disp_cc_pll0_config = {
 
 static struct clk_alpha_pll disp_cc_pll0 = {
 	.offset = 0x0,
+	.config = &disp_cc_pll0_config,
 	.vco_table = spark_vco,
 	.num_vco = ARRAY_SIZE(spark_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
@@ -483,6 +485,14 @@ static struct clk_regmap *disp_cc_qcm2290_clocks[] = {
 	[DISP_CC_SLEEP_CLK_SRC] = &disp_cc_sleep_clk_src.clkr,
 };
 
+static struct clk_alpha_pll *disp_cc_qcm2290_plls[] = {
+	&disp_cc_pll0,
+};
+
+static const u32 disp_cc_qcm2290_critical_cbcrs[] = {
+	0x604c, /* DISP_CC_XO_CLK */
+};
+
 static const struct regmap_config disp_cc_qcm2290_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -491,6 +501,13 @@ static const struct regmap_config disp_cc_qcm2290_regmap_config = {
 	.fast_io = true,
 };
 
+static const struct qcom_cc_driver_data disp_cc_qcm2290_driver_data = {
+	.alpha_plls = disp_cc_qcm2290_plls,
+	.num_alpha_plls = ARRAY_SIZE(disp_cc_qcm2290_plls),
+	.clk_cbcrs = disp_cc_qcm2290_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_qcm2290_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_qcm2290_desc = {
 	.config = &disp_cc_qcm2290_regmap_config,
 	.clks = disp_cc_qcm2290_clocks,
@@ -499,6 +516,7 @@ static const struct qcom_cc_desc disp_cc_qcm2290_desc = {
 	.num_gdscs = ARRAY_SIZE(disp_cc_qcm2290_gdscs),
 	.resets = disp_cc_qcm2290_resets,
 	.num_resets = ARRAY_SIZE(disp_cc_qcm2290_resets),
+	.driver_data = &disp_cc_qcm2290_driver_data,
 };
 
 static const struct of_device_id disp_cc_qcm2290_match_table[] = {
@@ -509,25 +527,7 @@ MODULE_DEVICE_TABLE(of, disp_cc_qcm2290_match_table);
 
 static int disp_cc_qcm2290_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &disp_cc_qcm2290_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	clk_alpha_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x604c); /* DISP_CC_XO_CLK */
-
-	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_qcm2290_desc, regmap);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register DISP CC clocks\n");
-		return ret;
-	}
-
-	return ret;
+	return qcom_cc_probe(pdev, &disp_cc_qcm2290_desc);
 }
 
 static struct platform_driver disp_cc_qcm2290_driver = {

-- 
2.34.1


