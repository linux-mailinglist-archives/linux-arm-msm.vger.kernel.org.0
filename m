Return-Path: <linux-arm-msm+bounces-61758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AED14ADF512
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 19:56:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06AD24A39DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 17:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B592F94AF;
	Wed, 18 Jun 2025 17:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hW/ured8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033BB2F94A9
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 17:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750269017; cv=none; b=RlTbdAoZ+x4UYbOyDo8KJSuXZp9GEAfQq9a89fyxIHWiSnVHL30tYM2ANmMwtsn0+iivzxaOX3D4ux3laomfkBP9jo6uCLjVqqhCsy32VFMPlB5rUCM7l5tLtl1j+WR4+pUVTYpYh9CHEZ3nfdwc27/n3EJ7trmxH3CB0wXZH2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750269017; c=relaxed/simple;
	bh=tpBKnIAuCP3hHpY88s21IGk6s0xzFRbXOi1xBoSjdpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J76Ac8TIUaEk5/6wYr2/5J/u4bjuBum/IiQNIh1+rKcXD7kdoxCYlk8A0ea/HRndLNHxefjVol2JuPPkjpYE1lmU6t7sRG5o0nHpaFmYjL5Z1/2tK2SOrFJKOl2mkAs81aL51mx/InN2TpJp4BETJVy/lFEDHyS2oxIYxCIUE/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hW/ured8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IAUMUf024471
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 17:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MRtl5KObeetKj8XsueZwlT4HvnbbdDcQprlvAt4ypkc=; b=hW/ured8BPMN1U0k
	o7Bt1HVFzPsMA/0Q+4JZ2bNM4lXxmAOy7Y4/dlSdYKVMHIcJEDmmDWchNWxwOooq
	s5/AR8mwpNQ77FydMr5kYgVHMvEmNImIDv7G9UTWGKeehOjdv3MwnKr4+ZiueSLv
	lFAYWddrvuSISNWr53+iQNb1ba4ZQIUFzpU+/F0Qw6SGnp/lAyMQ8f98itplIv24
	ma0iHaw+iXYlb1L/DMRz2LaE11UCvmkAwhANPH4d8YCNqYhQZAtgD5kBKsBON2nB
	hF4bsqVLFHFc+oku9+xgz5WYJwlJPCiRVoKD/1H4l6O98qrCUGolg7nCYBXz2jGc
	u1EwNg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792ca581v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 17:50:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3d3f64739so865478685a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 10:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268999; x=1750873799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MRtl5KObeetKj8XsueZwlT4HvnbbdDcQprlvAt4ypkc=;
        b=Ctw06ixgR5ye5egVbYo9QFqAjDggVoboKN8I+Q2zIQA//Gn6mpL/4DlILqp3d8So0T
         y52ykBk9U65+gKw/r+YXhlfTq+XqiiCaUU1NSdLX7CBwOKzvxi1BMx24Pm44skCsLoHf
         pjdLBWjvYjyMSAbwwu7hE5qg7H5NLgmP/LBm6+6/4q+ZXNACHIXNjroKtQ3BDtXutQgX
         xEZQ7DUupAaanR3Y3aHxOvgNAd60k5Gjtws3VW/earU74PBtCz7AmZOgu+xwTMp/yC9O
         SKId/SOqOdrJC0nhC0yEHpdBdtpZViUelTL7AzSAYpQfYmqLQAWuOGzceEvEytQE7QOy
         PVbQ==
X-Gm-Message-State: AOJu0YxI/G5vD0XYMT1NsJnzI/SYJmdfVOXQOpxZ8sR3ni4LrEHCmJd+
	4aJxmKeR/pcmL+cbnJPU/cPqy1TsGdx/Noq6ZtbLM/+OX3O37rsfPA+sgzXIuhmHOX4sBa8Vaxf
	asEMRirEl6mCIUknjQCKJ6WpD3jRx6JNRQLMqO12DQ6vhwxeQA5JNy7wB6ZQDnLRD8S5Usn1vcm
	0qYzV1SQ==
X-Gm-Gg: ASbGncv6Us3Z0Vg7epPiFqkHBaOgidLTasqvNzWJVjwhm6lZNS5pRBASs16dWb8Zi7h
	JBkZEHNdggeHI7UUvbENV4++YIdvEZzAwfxqYvT84I+FFJW4TJMGASQn04llWvWHDRZVOSb+lIP
	HYsCBwMzfV5r8gzR4oaBXhJjk3KpIzXpS1G14GnPf6xgdfTddPF/2yvn3EUc3eKvIlcYM6onYmq
	CaldvbldcnSSEJ0P5N2FjotQy1k1oIdWKtc/bbFHeM6ppy9bz+Gx4C+647tYUBkqoDrlXRhO5qI
	IKTI0dHVgZ4apxxMICsBeIUIctB+0ecGCmTOsy7v1V26vq+W6Mi+BgXSGUgK6lSj36MbwBKpG5F
	xzrgmIXi0r+sHTScIrr7pj6cWH8ZXieUrxLM=
X-Received: by 2002:a05:620a:318c:b0:7cd:31ca:d76 with SMTP id af79cd13be357-7d3c6cd9c7fmr2475200685a.33.1750268999023;
        Wed, 18 Jun 2025 10:49:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3z8OAvTpTGWACRNkJcs/dFQGqJGMmD6eV6BI5+VFC1nQtz2t9LiZEWhZ47C60omEChiyMrQ==
X-Received: by 2002:a05:620a:318c:b0:7cd:31ca:d76 with SMTP id af79cd13be357-7d3c6cd9c7fmr2475197485a.33.1750268998586;
        Wed, 18 Jun 2025 10:49:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b7b43a98esm2911131fa.65.2025.06.18.10.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 10:49:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 20:49:53 +0300
Subject: [PATCH 3/3] arm64: dts: qcom: sar2130p: use defines for DSI PHY
 clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-sar2130p-fix-mdss-v1-3-78c2fb9e9fba@oss.qualcomm.com>
References: <20250618-sar2130p-fix-mdss-v1-0-78c2fb9e9fba@oss.qualcomm.com>
In-Reply-To: <20250618-sar2130p-fix-mdss-v1-0-78c2fb9e9fba@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2199;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tpBKnIAuCP3hHpY88s21IGk6s0xzFRbXOi1xBoSjdpk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoUvxAb1xg1MLy4xeqhbG8IzCQeBAQUS94HvioB
 lMpZuNCkHaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFL8QAAKCRCLPIo+Aiko
 1fiICACHTS3u8xNy6tTR4ll9c5Ltiexdon9rwTZjFzyy/1j8Z9OG+JYf3WQ3x8nFbFvdbLaqTCQ
 gDgCACHVz71SqAdyr7ZLdbRZkw1uoHZ6gpaeDtbFdz2PgyZkj4VohgEWB4AHTIYHTDkS06grl7p
 7vqthgqZZQgj7ETswoQGrFXZ3TCdlpP0oZWPzkGGFNljbELoBnPZiIDjUxAt7nN//GyWpyyN5M2
 Jq7Tegj5RENRN12xeu2EhEYTFwxSFfHeuS6qPdDUZxCt6+NqM7rhV9xFoQlQLZDHttf+2uMz/b0
 iCfhXycf+xREWSEuPp1e4ocVUbcn1XqOq31QZb57041IIR3k
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 76ELp3W0XDE4jOauCqxfemZcTIkoEMKP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE1MiBTYWx0ZWRfX+DleFrGT1j+b
 i8TNXkzm1x8HdRKaysSvTjz+VFnr3RGv+AloMeBEAcK2R12psBkS42yQYeC2WFmutR9NsK8UqTb
 XmlqsORLi90aCv/Jz86I5Bt6ohl5e+cWcQnkXqW5R/809DQxdUSitamlVF9I1WFM4UI/UjfYo9z
 fpYG3Lmr6H6nilAaX77rIkiymMmLwjj+wv6+Hy+uppVhgaJrNW9yqX8Yq5jS2M8YjHWXo2V7GZL
 x1/CuQATHToqACcCPh4vSM0F9DjohtGcIxLEVC6Dv5Rui5lybi7kYlLCX5EbftXhJzvBxZBk5bb
 p0I/+z3Bbo/cKpGPcPQCXC2rpVi9ujxfEpfJKdb9GPXSjdAoDOE06E3d9hKa3wJKrEEZMI+z7Ei
 iGzUmoQ+SX5fYmpOiV9lTc7XZsDuXFQLOJ6Ms1+1hUx1yrJuLu6dzOLqjr6Pk+2O891wO27A
X-Proofpoint-ORIG-GUID: 76ELp3W0XDE4jOauCqxfemZcTIkoEMKP
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=6852fc57 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=sW9EZDGZIsf-NLb0FcQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=754
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180152

Use defined IDs to reference DSI PHY clocks instead of using raw
numbers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index d9948360cc0198a768598f60302097e1143cf1fc..38f7869616ff01ece3799ced15c39375d629e364 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) 2024, Linaro Limited
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sar2130p-gcc.h>
 #include <dt-bindings/clock/qcom,sar2130p-gpucc.h>
@@ -2237,8 +2238,8 @@ mdss_dsi0: dsi@ae94000 {
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>,
-							 <&mdss_dsi0_phy 1>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&mdss_dsi_opp_table>;
 
@@ -2333,8 +2334,8 @@ mdss_dsi1: dsi@ae96000 {
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi1_phy 0>,
-							 <&mdss_dsi1_phy 1>;
+				assigned-clock-parents = <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&mdss_dsi_opp_table>;
 
@@ -2392,10 +2393,10 @@ dispcc: clock-controller@af00000 {
 				 <&rpmhcc RPMH_CXO_CLK_A>,
 				 <&gcc GCC_DISP_AHB_CLK>,
 				 <&sleep_clk>,
-				 <&mdss_dsi0_phy 0>,
-				 <&mdss_dsi0_phy 1>,
-				 <&mdss_dsi1_phy 0>,
-				 <&mdss_dsi1_phy 1>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
 				 <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
 				 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 				 <0>, /* dp1 */

-- 
2.39.5


