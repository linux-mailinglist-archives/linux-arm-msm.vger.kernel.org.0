Return-Path: <linux-arm-msm+bounces-74696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF92EB9C68B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 00:59:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C0BB3820B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 22:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D1729E0E1;
	Wed, 24 Sep 2025 22:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IkB23UIk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DD22BD5B9
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 22:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758754751; cv=none; b=QYIIfOKsQfix/d/mffZUfSJdorgeahZ5lgg9Iolce+RXCxrnHXq/BNs4SAGeWRQhofBdDQpNzt6dQWqeflq6TijW3x0w3Rt5QVgy5tf+zUoKlXd6mV/jJf6a4rqCNdk7xqia688717uTwBc5jBiomROAAAu8Tkz4lGi4XIJnwSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758754751; c=relaxed/simple;
	bh=XZ0hoeYqjKXt3km9LluK8i2YBRgettCbZm3Z+uReIqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TmxdxRlsScTzIThi0JGIwkoEiJr1JfsBXpSeE17b8SZNzLNx83i46sx1rfRTtu2DkiE6bPH64iufWRF3F3UK9kVSBHvojaGZS5/DQrnWM+KreTI55VSrVxga84MNT52yg2cwWrE6u7QGwzd2yRa/l9wuHWWlt8uBEJxSfrm756I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IkB23UIk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODGOwo017437
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 22:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dWwZxKCkwdVAKEY9a++gDKMjpT1SaCqsz9/b8XNl96U=; b=IkB23UIkaT+XdEv/
	iqLZqBxm0bRFoSfK1TbksdegmK3IN0Yv+WgAb5p+fbl5WyrQG0rvoSFDszXEbm3c
	4wJ6iQy4y4MVh5wsCmIi6F6UZMG++nPEA5Q9MTR0BFeLTcdo/dnjqdC2roliEJMM
	HEJr0Vj5khQknPhgDFbmS9JjX/iRsGmo0ubO5NcpeO7lKu8SViNi0fsLUgfNgtjr
	fBo6ZPiX8xprIcZZDrCDDrDfrKfb/Bs05WYo+gZcWtYycCNKMfrXHDlS2mq1Qely
	WYmCOk8Jq3aGnrskCF+dItgcHUcGRPMqrr+nkNSmQZDVTubCXM9JZRjVaDN4WhM2
	FGN3ng==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjya0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 22:59:08 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77df7f0d7a3so297416b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 15:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758754748; x=1759359548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWwZxKCkwdVAKEY9a++gDKMjpT1SaCqsz9/b8XNl96U=;
        b=DD2Eds+Mqo90Fr4S6RZ1Ev/oxD0VWcLA4v+2TO1+EKtNKd+CjImrXdiU81LiTHphXX
         dCMGItdGbYc3memRKttjZ2jhv2BAKdsK48y82PATO0V4D1grpvJcnicsgB6E+yjawZo1
         1hjJmmXPK4zfFyFjreNJ+CNDoeG5MoDoDlW9HQtJnuv/yrVskqQhxGfJJO1C1CPcUpq3
         i33ZuHTUN+hNTUol9WtkKU0E0SgpsiUP+SwmJbj1NS7uUZmvgfPM7/oPXOCzdJbJOyo2
         EfyUIltQ/dqQk+I/FKnfFDZrj9jRAhMx8NCoM57UmJhr/74kgHCKIIFwks5ZqPg6RCbR
         oLEw==
X-Gm-Message-State: AOJu0YzHvoliZaK9SVwc8d6HrzQ4IhKUZhbKKr1GHhtz0bNbEm7lIh5S
	CrCavxVbNZv1fM1qc8GqWfr+KdRzvU//Bu6Hpa8YYtnUGlZUZiTh9AiojduKRtgbfdh6EbPqVmw
	CqLr3icQla7atPma9r+kklY9f8tRkLmxjaVnmJzfXpcFIAvg2rcrtD+L8gpLhJ2zglK9t
X-Gm-Gg: ASbGncuq2KgSbzAFm4TMv1Y3l8xT7YKpTvBDLnGkUEDHouGDxC2QECyycsYNwMMx8jn
	5GyVh0ukEFYl+C/TkDZSdumkZiSnu6R61O4SfKfDGrB2Dio4NVYNH220kqWlIA/if5VaiAq+QP2
	NyTmUeL6X34NcbY4UZ7zLn95D7MDtS1pcl6MvfhC8efWR/emwdljQJmPOrSe2qw5z0Vpx4+FBhE
	Dr+ZrABQwuydsRwzShW2NhJEgiXQA0422JCmuxkrbc3cUwwuAOmETev4C7KwY3A0ZeDSRJgDMkY
	4yp6s8bhfDL2NtAjoTwwdGtrdvJB5wvQ3U4bJaFgAI647iIxIJaT/uMiFG+Rhy9TV7URkdVxObP
	NPCRHJ0CN2pjD3yQ=
X-Received: by 2002:a05:6a00:2345:b0:77f:2e62:1e32 with SMTP id d2e1a72fcca58-780fce1f177mr1676573b3a.2.1758754747907;
        Wed, 24 Sep 2025 15:59:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVPWhLfFWOYM2j92FUM0viubup4HQUNPWDl/34V9A780ChXBV6NXaa/7+RyBg9wFmhwWCnXA==
X-Received: by 2002:a05:6a00:2345:b0:77f:2e62:1e32 with SMTP id d2e1a72fcca58-780fce1f177mr1676557b3a.2.1758754747446;
        Wed, 24 Sep 2025 15:59:07 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c2b70esm111166b3a.101.2025.09.24.15.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 15:59:06 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 15:58:56 -0700
Subject: [PATCH 4/9] clk: qcom: rpmh: Add support for Kaanapali rpmh clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-clk-v1-4-29b02b818782@oss.qualcomm.com>
References: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
In-Reply-To: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758754740; l=3080;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=yAdiGcsgDOlUWsxDUGOiFkgNYUbzTf+oqHvFM4/yQPU=;
 b=Ume/z3becT7Yq26SLRd0O0bxwN64Tp3InF4Dh1V4PGWv3aYQNjuKYocEmtcwh2XcdcN6E5nAl
 bd17vFigxBSBXjruf/kidElQNPYxXwaE9DSb28OgOMoH/BHoDhJO+aN
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: GtBIPNl9uA4KjdyRm8mndjdS7ujeN_iq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfXwhxKXFAJO3Ot
 YPB5YTixD11FneydbUbM5j+jPsAvSDdu1qb8XTQMbvpMHQ9qaVsxyKwiESs5oeaUI0h/92Ma+Mx
 1CpfcdxzQsGO7teKnOAEhI+8IlGlvs+6IW5PNyZvDmuqpS/mlEiCwQ9g92/k8LC+84vcMcXeLpp
 pkXmjMUKuKpN5RoxXExwCouLxwrYBDrvzv5OxAod58MeSBmZRn6GsSh8DgvwhlwjoM++StM3tnL
 hrFqssxq5vvaQA1Odkgu7/8MECAybShxDK+Lu2E+mElsaaSe96oAfoLdadNQ95LC1HEvtECKtoH
 kOpmSHdjY7XSMhO1H9p2TRlhWvIghsSXVz0VmcnE/QgBMI1UA0tXqBRVVf89uxVdhnXyVWZofUR
 jvHnVAdL
X-Proofpoint-GUID: GtBIPNl9uA4KjdyRm8mndjdS7ujeN_iq
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d477bc cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gxflGWy-rYv13cvyobsA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add the RPMH clocks present in Kaanapali SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 63c38cb47bc4..6b1f24ee66d5 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -395,6 +395,16 @@ DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
 
+DEFINE_CLK_RPMH_VRM(c1a_e0, _a, "C1A_E0", 1);
+DEFINE_CLK_RPMH_VRM(c2a_e0, _a, "C2A_E0", 1);
+DEFINE_CLK_RPMH_VRM(c3a_e0, _a2, "C3A_E0", 2);
+DEFINE_CLK_RPMH_VRM(c4a_e0, _a2, "C4A_E0", 2);
+DEFINE_CLK_RPMH_VRM(c5a_e0, _a2, "C5A_E0", 2);
+DEFINE_CLK_RPMH_VRM(c6a_e0, _a2, "C6A_E0", 2);
+DEFINE_CLK_RPMH_VRM(c7a_e0, _a2, "C7A_E0", 2);
+DEFINE_CLK_RPMH_VRM(c8a_e0, _a2, "C8A_E0", 2);
+DEFINE_CLK_RPMH_VRM(c11a_e0, _a4, "C11A_E0", 4);
+
 DEFINE_CLK_RPMH_BCM(ce, "CE0");
 DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
 DEFINE_CLK_RPMH_BCM(ipa, "IP0");
@@ -900,6 +910,34 @@ static const struct clk_rpmh_desc clk_rpmh_glymur = {
 	.num_clks = ARRAY_SIZE(glymur_rpmh_clocks),
 };
 
+static struct clk_hw *kaanapali_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_DIV_CLK1]		= &clk_rpmh_c11a_e0_a4.hw,
+	[RPMH_LN_BB_CLK1]	= &clk_rpmh_c6a_e0_a2.hw,
+	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_c6a_e0_a2_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_c7a_e0_a2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_c7a_e0_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_c8a_e0_a2.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_c8a_e0_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_c1a_e0_a.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_c1a_e0_a_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_c2a_e0_a.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_c2a_e0_a_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_c3a_e0_a2.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_c3a_e0_a2_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_c4a_e0_a2.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_c4a_e0_a2.hw,
+	[RPMH_RF_CLK5_A]	= &clk_rpmh_c5a_e0_a2_ao.hw,
+	[RPMH_RF_CLK5_A]	= &clk_rpmh_c5a_e0_a2_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
+	.clks = kaanapali_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(kaanapali_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -990,6 +1028,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 
 static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
+	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
 	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},
 	{ .compatible = "qcom,qdu1000-rpmh-clk", .data = &clk_rpmh_qdu1000},

-- 
2.25.1


