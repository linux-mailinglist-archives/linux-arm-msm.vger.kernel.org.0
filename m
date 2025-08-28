Return-Path: <linux-arm-msm+bounces-71198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE20B3ADD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 00:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AA051C835F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 22:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8FE52F0690;
	Thu, 28 Aug 2025 22:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bH3BS4y8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719AF2EDD61
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 22:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756421321; cv=none; b=dZLdVV8rh0lpFEx4kam3ppfaQdTPl/EgogBsyPkVfLmL7DWaZJ8deJFl45uuPAIRy8WLaup+Yh4pb+ScbKx1OF2np1d6XmU4Y0bKwtuBAaI7h/Da7Zv2x9hAWj3alLrVmMzvLS60/M0+/hqiyUCxAWv1RIXTRHf2aHPV/3OmjZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756421321; c=relaxed/simple;
	bh=gMisimyzVOvecuJQNa2f1wDcJTrDOntt4ySb9o1AL0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NdKLxzdJPggMm6QrFL0F+2qgo7mbmUWfjciFlu7WSu9zBd/5wdAfF1xErn3XWfvDlum5Epvwbs24x2lQ/M9yn3ZnmNg7XBPRNkv0TwBTLH/goeaGjEeMro4ei5/lOqoGFjDFxgGLviRPSveQnKr0JxOViMzIR1cTmVMGJmaD+jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bH3BS4y8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SLWs5h006827
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 22:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rSW7bLFIv68K0TSOLOOLS4hy7/h4TH1xVhjVjSmVIvg=; b=bH3BS4y8K5nZIDhH
	ydDmJ75gsanRqOcV6MfyRDF1kwxdq2hP65NYsNZKd+SuJJeE6E3E5W0f6jl5CzHv
	0N6HbqIgQLzlwJXiqm8uJro1SaIsyXZkvRXq33eWA7DwC3Nu6KWD7VL+zCKxBQZC
	7bNFGepDQA53W6+zGCaYLHpL9d2Mm9yF9sBkky8fTesVxUaPleylhxKpLcwwOViW
	vVNGwenRa6VeXWXoQvD29ng80xBvVAyUFxo2ELU2PXDSElXoSn0eXMb0uzCer2TN
	4sf92679WRAG73sFzXPZnq2XgVhqazWc1TpcWalCZE0d9jvTgg+Iuq87nqfymCF7
	2ySAwA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tbpgks70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 22:48:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70de169afa2so35129366d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 15:48:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756421318; x=1757026118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rSW7bLFIv68K0TSOLOOLS4hy7/h4TH1xVhjVjSmVIvg=;
        b=QaRoM4N0t/mQ10x8OyDSJi39wy+t8qzkW17U2Uyk1HGM6yeS+9/cG7H+uVvwG+Z1al
         +Tsr4/mvWic0I5cKphMjf1/JYFbjCtxOka+j1GlViZsu019HLyb4iD5roCvi9aj/eOcx
         18AOFMPFnd+4kStjI6/YqT/ZBFldV6Dh2E4ThDRMN0I4WwZE9kJpV8OIqk79G1tbgg8G
         0RzCSZfNpqfviHIdW9gFs4vmXxX7UcFGwC8bq8kzWsx9YS2mgad5YOFmBskBKCCPhfrm
         IHQPo6+T7aURkAHnkMQssaajF/rfDY1ug8W22bbeKtg9CUVpDcr2jxFlJJkew/xQ44vu
         +hYA==
X-Gm-Message-State: AOJu0Yyv6SlrxtUHeULTREbEvc3sa49dkmR/6ZZR+051kYkHcntaZNLm
	MkJJENnzL6j8pCviEmSYagjIk8uJml6WBCAY2/HEXi86NVEN226DdGbIU4tbKsQkTpPWZyrPZ0q
	ESaclKSJRx1MhG7te9svW6LbC5/mq61kw6WAgTJZOS+/vLS0Q5TkgQD1bweIxeM4zV3K0
X-Gm-Gg: ASbGncuABmD6pMIg0vcdlXnhuXB1jjlF62jrPgbeotjJ59/gLPJXcHScQvLJxy7IRH1
	cJCtncIUm7TKMSdhWM3rpkpcuaKP7DRx6vId+rjp2duAaat46FWfSaBnFnpZwdmJ/x47a/d6aGb
	ZvNddfsFTSJNGaOLssbaQPEr2tA2CFOEbs1ymw5a1g80hSlcUYp624OE8eVOlJ38ZzmUA6ZwNu/
	AUzi0J0DzF2q0llmJ2l4qhb9Y++Emwelh2Zh5xE8pfKulfM98rRBeoYt3Z7PR3oCAcJPkbRhHEM
	YHG7WID9FjSg241SkhhzUcuSgytnJ8C94IcyKXWx15cwHg4m/XF3BEZTJtFHqMoT9dsWwrCDw0k
	TT225X9Qoc8vIXQbFPD/FCtyEdNgcq0ZoAwjXUOPpnq4/kGszBWjv
X-Received: by 2002:a05:622a:4ac8:b0:4b2:e0ac:63b0 with SMTP id d75a77b69052e-4b2e0ac6451mr135195321cf.77.1756421317409;
        Thu, 28 Aug 2025 15:48:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE39XtIWUxRdeQ8RUU9D0Kf4DEta2iPaLgOGZoJYGgP+lDkjeb5wUN/HPg383aP9oNttYjtAQ==
X-Received: by 2002:a05:622a:4ac8:b0:4b2:e0ac:63b0 with SMTP id d75a77b69052e-4b2e0ac6451mr135195021cf.77.1756421316735;
        Thu, 28 Aug 2025 15:48:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f678452e1sm143807e87.85.2025.08.28.15.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 15:48:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 29 Aug 2025 01:48:22 +0300
Subject: [PATCH v7 9/9] arm64: dts: qcom: Add MST pixel streams for
 displayport
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-dp_mst_bindings-v7-9-2b268a43917b@oss.qualcomm.com>
References: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
In-Reply-To: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=29526;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=un7p6ZEgt0DLL4VOauc1Tk5vKgqenX8wQes1+jhJheY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBosNyxtSL39dWmY6SDQwNg89FVS5eZxz1+DSxVS
 GReSTuU96eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLDcsQAKCRCLPIo+Aiko
 1bpECACP5Et3UVovhvEAp2fkJuHrV9egijlu5C/advdkMLc2EKyYA6O6UoGx0b80O9uDWeM8vYY
 z2GU5ytUQaAqj4dDvugr2Tt2/d7aZC1VoPiyMpazpVwrzAL1hzlwa9b/963/KH9cEdQWP2ZoTtT
 jN7+Oa5UZkKpp6QsK+nSj72Tw7oCUZMqGMBgNKgBhA+GO0w7ZivWhCkUqkhETVSk76FdbTx3jEq
 1/dg+YY1qF2rWpARkLqVYbmulV6xtP6ASLXUWK2VcGoo4uya46a1ODmBpAoPIgNip/mMTB+pDGT
 rhwxenZYK4L2wpF+G3fJf4Nm0623i2TcHoG9R03dwqCNWCfl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: OeenCevoNG3HOpzTF6-MlnC8cVQ79sjM
X-Proofpoint-ORIG-GUID: OeenCevoNG3HOpzTF6-MlnC8cVQ79sjM
X-Authority-Analysis: v=2.4 cv=G7gcE8k5 c=1 sm=1 tr=0 ts=68b0dcc6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=w1STtvVAkJ5k5OLWU0AA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI3MDE5OSBTYWx0ZWRfX9VhUEH4un9ih
 k9XYMZA2Ix2jdxIJCznpV9wqZfN5jFbXvzzLCFPf2fe9vuH+JDtNgtx2XxwLVjsdNkIGv7VfxAo
 NeCEVYNIXGzVppW8ZNKgJnEIOWUcqxh5qbHy8vz6r9kwNvTbyyQlKCP5kR9hzmGUnesJ376xZdB
 nf0ngXMSewFx0kkj3zdDQZbFP97Ch7G3SLpWEMTgWoDcoZuJVXO4wq/8S6+CRVoWNesjye3L2lJ
 +bCB7i2ybTnyYQpfjpuemub6wi3c283Uw+NomtBIaez8115+tGL373M/hjIIGRJ/eAE2+OvlyUz
 bAHMU4xIbl390nnEsevHYzf4Dgz5KHESxYx4uKwNprihf4kH4rfFxXAGKmNvt7tI771N5Mn48eJ
 cpdf/Ba4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508270199

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Update Qualcomm DT files in order to declare extra stream pixel clocks
and extra register resources used on these platforms to support
DisplayPort MST.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi   | 46 +++++++++++++++++-----
 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 10 +++--
 arch/arm64/boot/dts/qcom/sc7280.dtsi   |  3 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi  | 23 +++++++----
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 72 +++++++++++++++++++++++-----------
 arch/arm64/boot/dts/qcom/sdm845.dtsi   | 15 +++++--
 arch/arm64/boot/dts/qcom/sm8150.dtsi   | 10 +++--
 arch/arm64/boot/dts/qcom/sm8250.dtsi   | 10 +++--
 arch/arm64/boot/dts/qcom/sm8350.dtsi   | 10 +++--
 arch/arm64/boot/dts/qcom/sm8450.dtsi   | 10 +++--
 arch/arm64/boot/dts/qcom/sm8550.dtsi   | 10 +++--
 arch/arm64/boot/dts/qcom/sm8650.dtsi   | 10 +++--
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 30 +++++++++-----
 13 files changed, 185 insertions(+), 74 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 64f5378c6a4770cee2c7d76cde1098d7df17a24a..a1e033089860504844727fd9cd887f0808de1607 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4694,7 +4694,11 @@ mdss0_dp0: displayport-controller@af54000 {
 				      <0x0 0x0af54200 0x0 0x0c0>,
 				      <0x0 0x0af55000 0x0 0x770>,
 				      <0x0 0x0af56000 0x0 0x09c>,
-				      <0x0 0x0af57000 0x0 0x09c>;
+				      <0x0 0x0af57000 0x0 0x09c>,
+				      <0x0 0x0af58000 0x0 0x09c>,
+				      <0x0 0x0af59000 0x0 0x09c>,
+				      <0x0 0x0af5a000 0x0 0x23c>,
+				      <0x0 0x0af5b000 0x0 0x23c>;
 
 				interrupt-parent = <&mdss0>;
 				interrupts = <12>;
@@ -4703,15 +4707,28 @@ mdss0_dp0: displayport-controller@af54000 {
 					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
 					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
 					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK>;
 				clock-names = "core_iface",
 					      "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-					      "stream_pixel";
+					      "stream_pixel",
+					      "stream_1_pixel",
+					      "stream_2_pixel",
+					      "stream_3_pixel";
 				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
-						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
-				assigned-clock-parents = <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>;
+						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>,
+						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC>,
+						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC>;
+				assigned-clock-parents = <&mdss0_dp0_phy 0>,
+							 <&mdss0_dp0_phy 1>,
+							 <&mdss0_dp0_phy 1>,
+							 <&mdss0_dp0_phy 1>,
+							 <&mdss0_dp0_phy 1>;
 				phys = <&mdss0_dp0_phy>;
 				phy-names = "dp";
 
@@ -4773,7 +4790,11 @@ mdss0_dp1: displayport-controller@af5c000 {
 				      <0x0 0x0af5c200 0x0 0x0c0>,
 				      <0x0 0x0af5d000 0x0 0x770>,
 				      <0x0 0x0af5e000 0x0 0x09c>,
-				      <0x0 0x0af5f000 0x0 0x09c>;
+				      <0x0 0x0af5f000 0x0 0x09c>,
+				      <0x0 0x0af60000 0x0 0x09c>,
+				      <0x0 0x0af61000 0x0 0x09c>,
+				      <0x0 0x0af62000 0x0 0x23c>,
+				      <0x0 0x0af63000 0x0 0x23c>;
 
 				interrupt-parent = <&mdss0>;
 				interrupts = <13>;
@@ -4782,15 +4803,20 @@ mdss0_dp1: displayport-controller@af5c000 {
 					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
 					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK>,
 					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
-					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>;
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK>;
 				clock-names = "core_iface",
 					      "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-					      "stream_pixel";
+					      "stream_pixel",
+					      "stream_1_pixel";
 				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
-						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>;
-				assigned-clock-parents = <&mdss0_dp1_phy 0>, <&mdss0_dp1_phy 1>;
+						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
+						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
+				assigned-clock-parents = <&mdss0_dp1_phy 0>,
+							 <&mdss0_dp1_phy 1>,
+							 <&mdss0_dp1_phy 1>;
 				phys = <&mdss0_dp1_phy>;
 				phy-names = "dp";
 
diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index 38f7869616ff01ece3799ced15c39375d629e364..62bd535d7f14bed10fae329b20ac97cb63f3761b 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -2144,16 +2144,20 @@ mdss_dp0: displayport-controller@ae90000 {
 					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
 					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
 					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
-					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
 				clock-names = "core_iface",
 					      "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-					      "stream_pixel";
+					      "stream_pixel",
+					      "stream_1_pixel";
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
-						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
 				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
 				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 0dd6a5c91d109c78333f6b90104fa51fcf3bd64c..375e890f02c7d1cb06845293f17deb6ec45f9c5a 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -5047,7 +5047,8 @@ mdss_edp: edp@aea0000 {
 				reg = <0 0x0aea0000 0 0x200>,
 				      <0 0x0aea0200 0 0x200>,
 				      <0 0x0aea0400 0 0xc00>,
-				      <0 0x0aea1000 0 0x400>;
+				      <0 0x0aea1000 0 0x400>,
+				      <0 0x0aea1400 0 0x400>;
 
 				interrupt-parent = <&mdss>;
 				interrupts = <14>;
diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 70c87c79e1325f4ab4c81f34e99c0b52be4b3810..e6a7248040095077d6f98d632f4e8a1868432445 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -3241,16 +3241,20 @@ mdss_dp0: displayport-controller@ae90000 {
 					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
 					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
 					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
-					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
 				clock-names = "core_iface",
 					      "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-					      "stream_pixel";
+					      "stream_pixel",
+					      "stream_1_pixel";
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
-						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
 				assigned-clock-parents = <&usb_prim_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_prim_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 							 <&usb_prim_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
 				phys = <&usb_prim_qmpphy QMP_USB43DP_DP_PHY>;
@@ -3319,16 +3323,20 @@ mdss_dp1: displayport-controller@ae98000 {
 					 <&dispcc DISP_CC_MDSS_DP_AUX1_CLK>,
 					 <&dispcc DISP_CC_MDSS_DP_LINK1_CLK>,
 					 <&dispcc DISP_CC_MDSS_DP_LINK1_INTF_CLK>,
-					 <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK>;
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
 				clock-names = "core_iface",
 					      "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-					      "stream_pixel";
+					      "stream_pixel",
+					      "stream_1_pixel";
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK1_CLK_SRC>,
-						  <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK_SRC>;
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
 				assigned-clock-parents = <&usb_sec_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_sec_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 							 <&usb_sec_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
 				phys = <&usb_sec_qmpphy QMP_USB43DP_DP_PHY>;
@@ -3389,7 +3397,8 @@ mdss_edp: displayport-controller@ae9a000 {
 				reg = <0 0xae9a000 0 0x200>,
 				      <0 0xae9a200 0 0x200>,
 				      <0 0xae9a400 0 0x600>,
-				      <0 0xae9aa00 0 0x400>;
+				      <0 0xae9aa00 0 0x400>,
+				      <0 0xae9b000 0 0x400>;
 				interrupt-parent = <&mdss>;
 				interrupts = <14>;
 				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 421693208af0d5baeaa14ba2bbf29cbbc677e732..ad04868763d00221ed9939c76132977b83762cd7 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -4338,15 +4338,19 @@ mdss0_dp0: displayport-controller@ae90000 {
 					 <&dispcc0 DISP_CC_MDSS_DPTX0_AUX_CLK>,
 					 <&dispcc0 DISP_CC_MDSS_DPTX0_LINK_CLK>,
 					 <&dispcc0 DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
-					 <&dispcc0 DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
+					 <&dispcc0 DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
 				clock-names = "core_iface", "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-					      "stream_pixel";
+					      "stream_pixel",
+					      "stream_1_pixel";
 
 				assigned-clocks = <&dispcc0 DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
-						  <&dispcc0 DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
+						  <&dispcc0 DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc0 DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
 				assigned-clock-parents = <&usb_0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 							 <&usb_0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
 				phys = <&usb_0_qmpphy QMP_USB43DP_DP_PHY>;
@@ -4417,14 +4421,18 @@ mdss0_dp1: displayport-controller@ae98000 {
 					 <&dispcc0 DISP_CC_MDSS_DPTX1_AUX_CLK>,
 					 <&dispcc0 DISP_CC_MDSS_DPTX1_LINK_CLK>,
 					 <&dispcc0 DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
-					 <&dispcc0 DISP_CC_MDSS_DPTX1_PIXEL0_CLK>;
+					 <&dispcc0 DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_DPTX1_PIXEL1_CLK>;
 				clock-names = "core_iface", "core_aux",
 					      "ctrl_link",
-					      "ctrl_link_iface", "stream_pixel";
+					      "ctrl_link_iface", "stream_pixel",
+					      "stream_1_pixel";
 
 				assigned-clocks = <&dispcc0 DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
-						  <&dispcc0 DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>;
+						  <&dispcc0 DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
+						  <&dispcc0 DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
 				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
 				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
@@ -4494,10 +4502,12 @@ mdss0_dp2: displayport-controller@ae9a000 {
 					 <&dispcc0 DISP_CC_MDSS_DPTX2_AUX_CLK>,
 					 <&dispcc0 DISP_CC_MDSS_DPTX2_LINK_CLK>,
 					 <&dispcc0 DISP_CC_MDSS_DPTX2_LINK_INTF_CLK>,
-					 <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL0_CLK>;
+					 <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL0_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL1_CLK>;
 				clock-names = "core_iface", "core_aux",
 					      "ctrl_link",
-					      "ctrl_link_iface", "stream_pixel";
+					      "ctrl_link_iface", "stream_pixel",
+					      "stream_1_pixel";
 				interrupt-parent = <&mdss0>;
 				interrupts = <14>;
 				phys = <&mdss0_dp2_phy>;
@@ -4505,8 +4515,11 @@ mdss0_dp2: displayport-controller@ae9a000 {
 				power-domains = <&rpmhpd SC8280XP_MMCX>;
 
 				assigned-clocks = <&dispcc0 DISP_CC_MDSS_DPTX2_LINK_CLK_SRC>,
-						  <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>;
-				assigned-clock-parents = <&mdss0_dp2_phy 0>, <&mdss0_dp2_phy 1>;
+						  <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>,
+						  <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC>;
+				assigned-clock-parents = <&mdss0_dp2_phy 0>,
+							 <&mdss0_dp2_phy 1>,
+							 <&mdss0_dp2_phy 1>;
 				operating-points-v2 = <&mdss0_dp2_opp_table>;
 
 				#sound-dai-cells = <0>;
@@ -5675,10 +5688,12 @@ mdss1_dp0: displayport-controller@22090000 {
 					 <&dispcc1 DISP_CC_MDSS_DPTX0_AUX_CLK>,
 					 <&dispcc1 DISP_CC_MDSS_DPTX0_LINK_CLK>,
 					 <&dispcc1 DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
-					 <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
+					 <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
 				clock-names = "core_iface", "core_aux",
 					      "ctrl_link",
-					      "ctrl_link_iface", "stream_pixel";
+					      "ctrl_link_iface", "stream_pixel",
+					      "stream_1_pixel";
 				interrupt-parent = <&mdss1>;
 				interrupts = <12>;
 				phys = <&mdss1_dp0_phy>;
@@ -5686,8 +5701,11 @@ mdss1_dp0: displayport-controller@22090000 {
 				power-domains = <&rpmhpd SC8280XP_MMCX>;
 
 				assigned-clocks = <&dispcc1 DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
-						  <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
-				assigned-clock-parents = <&mdss1_dp0_phy 0>, <&mdss1_dp0_phy 1>;
+						  <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
+				assigned-clock-parents = <&mdss1_dp0_phy 0>,
+							 <&mdss1_dp0_phy 1>,
+							 <&mdss1_dp0_phy 1>;
 				operating-points-v2 = <&mdss1_dp0_opp_table>;
 
 				#sound-dai-cells = <0>;
@@ -5750,10 +5768,12 @@ mdss1_dp1: displayport-controller@22098000 {
 					 <&dispcc1 DISP_CC_MDSS_DPTX1_AUX_CLK>,
 					 <&dispcc1 DISP_CC_MDSS_DPTX1_LINK_CLK>,
 					 <&dispcc1 DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
-					 <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL0_CLK>;
+					 <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL1_CLK>;
 				clock-names = "core_iface", "core_aux",
 					      "ctrl_link",
-					      "ctrl_link_iface", "stream_pixel";
+					      "ctrl_link_iface", "stream_pixel",
+					      "stream_1_pixel";
 				interrupt-parent = <&mdss1>;
 				interrupts = <13>;
 				phys = <&mdss1_dp1_phy>;
@@ -5761,8 +5781,11 @@ mdss1_dp1: displayport-controller@22098000 {
 				power-domains = <&rpmhpd SC8280XP_MMCX>;
 
 				assigned-clocks = <&dispcc1 DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
-						  <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>;
-				assigned-clock-parents = <&mdss1_dp1_phy 0>, <&mdss1_dp1_phy 1>;
+						  <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
+						  <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
+				assigned-clock-parents = <&mdss1_dp1_phy 0>,
+							 <&mdss1_dp1_phy 1>,
+							 <&mdss1_dp1_phy 1>;
 				operating-points-v2 = <&mdss1_dp1_opp_table>;
 
 				#sound-dai-cells = <0>;
@@ -5825,10 +5848,12 @@ mdss1_dp2: displayport-controller@2209a000 {
 					 <&dispcc1 DISP_CC_MDSS_DPTX2_AUX_CLK>,
 					 <&dispcc1 DISP_CC_MDSS_DPTX2_LINK_CLK>,
 					 <&dispcc1 DISP_CC_MDSS_DPTX2_LINK_INTF_CLK>,
-					 <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL0_CLK>;
+					 <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL0_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL1_CLK>;
 				clock-names = "core_iface", "core_aux",
 					      "ctrl_link",
-					      "ctrl_link_iface", "stream_pixel";
+					      "ctrl_link_iface", "stream_pixel",
+					      "stream_1_pixel";
 				interrupt-parent = <&mdss1>;
 				interrupts = <14>;
 				phys = <&mdss1_dp2_phy>;
@@ -5836,8 +5861,11 @@ mdss1_dp2: displayport-controller@2209a000 {
 				power-domains = <&rpmhpd SC8280XP_MMCX>;
 
 				assigned-clocks = <&dispcc1 DISP_CC_MDSS_DPTX2_LINK_CLK_SRC>,
-						  <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>;
-				assigned-clock-parents = <&mdss1_dp2_phy 0>, <&mdss1_dp2_phy 1>;
+						  <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>,
+						  <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC>;
+				assigned-clock-parents = <&mdss1_dp2_phy 0>,
+							 <&mdss1_dp2_phy 1>,
+							 <&mdss1_dp2_phy 1>;
 				operating-points-v2 = <&mdss1_dp2_opp_table>;
 
 				#sound-dai-cells = <0>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 828b55cb6baf10458feae8f53c04663ef958601e..816987906ca51b8c7eb834d8b850839941eadb6b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4656,12 +4656,19 @@ mdss_dp: displayport-controller@ae90000 {
 					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
 					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
 					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
-					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
-				clock-names = "core_iface", "core_aux", "ctrl_link",
-					      "ctrl_link_iface", "stream_pixel";
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel",
+					      "stream_1_pixel";
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
-						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
 				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
 				phy-names = "dp";
diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 4b347ee3244100a4db515515b73575383c5a0cb7..e0beb5373cdc8ff92f165d7a971f8f7dce31bca8 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3890,16 +3890,20 @@ mdss_dp: displayport-controller@ae90000 {
 					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
 					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
 					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
-					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
 				clock-names = "core_iface",
 					      "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-					      "stream_pixel";
+					      "stream_pixel",
+					      "stream_1_pixel";
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
-						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
 				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
 				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 244339cfbed5c32708c282de18f5655535e2ff45..272b41214ab31edd2c0c695cf294f0959167585a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4771,16 +4771,20 @@ mdss_dp: displayport-controller@ae90000 {
 					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
 					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
 					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
-					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
 				clock-names = "core_iface",
 					      "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-					      "stream_pixel";
+					      "stream_pixel",
+					      "stream_1_pixel";
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
-						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
 				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
 				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 9a4207ead6156333b8b6030fb0fbc1d215948041..136f40a3b9767133d6a4fe52753530bccced3391 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2876,16 +2876,20 @@ mdss_dp: displayport-controller@ae90000 {
 					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
 					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
 					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
-					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
 				clock-names = "core_iface",
 					      "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-					      "stream_pixel";
+					      "stream_pixel",
+					      "stream_1_pixel";
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
-						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
 				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
 				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 2baef6869ed7c17efb239e86013c15ef6ef5f48f..1b482dc5f574acd5ea938c9953a35164e51c6cb3 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -3431,16 +3431,20 @@ mdss_dp0: displayport-controller@ae90000 {
 					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
 					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
 					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
-					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
 				clock-names = "core_iface",
 					      "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-					      "stream_pixel";
+					      "stream_pixel",
+					      "stream_1_pixel";
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
-						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
 				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
 				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 38d139d1dd4a994287c03d064ca01d59a11ac771..2d085680afd1bed2bd2477c21ae4b798efe6a066 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3755,16 +3755,20 @@ mdss_dp0: displayport-controller@ae90000 {
 					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
 					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
 					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
-					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
 				clock-names = "core_iface",
 					      "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-					      "stream_pixel";
+					      "stream_pixel",
+					      "stream_1_pixel";
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
-						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
 				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
 				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index d6794901f06b50e8629afd081cb7d229ea342f84..887b2ea055e8d969ba9ad07e738dcb6feccc0e61 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5657,16 +5657,20 @@ mdss_dp0: displayport-controller@af54000 {
 					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
 					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
 					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
-					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
 				clock-names = "core_iface",
 					      "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-					      "stream_pixel";
+					      "stream_pixel",
+					      "stream_1_pixel";
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
-						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
 				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
 				operating-points-v2 = <&dp_opp_table>;
diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index f293b13ecc0ce426661187ac793f147d12434fcb..7c5f6c101ac10ce6fbc5eead177246ce77c668bf 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5338,16 +5338,20 @@ mdss_dp0: displayport-controller@ae90000 {
 					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
 					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
 					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
-					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
 				clock-names = "core_iface",
 					      "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-					      "stream_pixel";
+					      "stream_pixel",
+					      "stream_1_pixel";
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
-						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
 				assigned-clock-parents = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 							 <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
 				operating-points-v2 = <&mdss_dp0_opp_table>;
@@ -5421,16 +5425,20 @@ mdss_dp1: displayport-controller@ae98000 {
 					 <&dispcc DISP_CC_MDSS_DPTX1_AUX_CLK>,
 					 <&dispcc DISP_CC_MDSS_DPTX1_LINK_CLK>,
 					 <&dispcc DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
-					 <&dispcc DISP_CC_MDSS_DPTX1_PIXEL0_CLK>;
+					 <&dispcc DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX1_PIXEL1_CLK>;
 				clock-names = "core_iface",
 					      "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-					      "stream_pixel";
+					      "stream_pixel",
+					      "stream_1_pixel";
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
-						  <&dispcc DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>;
+						  <&dispcc DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
 				assigned-clock-parents = <&usb_1_ss1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_1_ss1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 							 <&usb_1_ss1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
 				operating-points-v2 = <&mdss_dp1_opp_table>;
@@ -5504,16 +5512,20 @@ mdss_dp2: displayport-controller@ae9a000 {
 					 <&dispcc DISP_CC_MDSS_DPTX2_AUX_CLK>,
 					 <&dispcc DISP_CC_MDSS_DPTX2_LINK_CLK>,
 					 <&dispcc DISP_CC_MDSS_DPTX2_LINK_INTF_CLK>,
-					 <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK>;
+					 <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX2_PIXEL1_CLK>;
 				clock-names = "core_iface",
 					      "core_aux",
 					      "ctrl_link",
 					      "ctrl_link_iface",
-					      "stream_pixel";
+					      "stream_pixel",
+					      "stream_1_pixel";
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX2_LINK_CLK_SRC>,
-						  <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>;
+						  <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC>;
 				assigned-clock-parents = <&usb_1_ss2_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_1_ss2_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 							 <&usb_1_ss2_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
 				operating-points-v2 = <&mdss_dp2_opp_table>;

-- 
2.47.2


