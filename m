Return-Path: <linux-arm-msm+bounces-54367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF00A89A02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 12:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6789188BE66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 10:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A621828DF0B;
	Tue, 15 Apr 2025 10:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BajK0viC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269E128DEE6
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712807; cv=none; b=YkQqebSPICp/DIWFgXJMh2bwMk0I/KW8ceq8ISjTyjS03pV1bmiHkb4iBWE92oX9Yfb2a1Lbcw77urPMmxLfrBaO0ljefEBwYWg/JUJ8W/8O8BLsc7y2qfSvP2HpzXV0s6HfdtRkVTFbMfzms8Xsl7S3yyKAgYYU2qYQU/DtPsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712807; c=relaxed/simple;
	bh=swolJ2wT3PzlKpfDSKVw34/qc577z+kfHl/7Kga+DEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E4oPobsH/sngP+4u7DGOJTmipNo66zo80Q3BRwxu3zM5Vr2AevCWFDvYdT0Nz62J8lGb3DUvWjBfaQ5NR8cufdg/DIfuVJifPO6ldL1y0EAfa/MAe43tfxB3dpoWRqHE2YeVkVqDpbraRAOQa6sRjjZNs2olyWqZU5U7WJhZp9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BajK0viC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tMRl013244
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z6UdlSNEU4KFIk6YYcg22HkZSMhBh8b8LGzlZTfU7Rk=; b=BajK0viCMrwKT43F
	YHNfRFxS4MeuNDW5z0amQ7pgds84r1vrAWwCjjD7aZGHcAqcdwldkYGjqaBSAQnH
	aUuGAUsf8hdo4E3VVjphRINvkszqNLpwrcCQTqtt++Y52Ls4kuuYgVKkRsSLjlh/
	/ziY8Nfbz3DhY+WiC7nn5IPfkcyfKILMk0XsZxSmVcymBoSIKaeyQ3tcOqxKJh9w
	F+j6RswBDCH2nXmU+k6T4dYLTZMY76spaLYYYKaP9HgEqRnM1EDDc5FVj/eSmzPn
	lSI90uYJht9WokRqTPeNn4VGrEBozOhjW+2ejiJCSwMUz6RQ0eJsl65IJwoRyITR
	rgPcPQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6fng8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:26:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c543ab40d3so791879885a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 03:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744712803; x=1745317603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z6UdlSNEU4KFIk6YYcg22HkZSMhBh8b8LGzlZTfU7Rk=;
        b=AIQREEzYhJEOUCAd2WW4lqSYlpm/9ng4JLWsfvaeU66A/XNt8cymNGy3W6n+4yhVlN
         8ExHqFQ9V/s4PuUmlE4UqPHaK/LsT5XVgPSMtOgHjeKiO1Gin0EMnpSDicDrY2w6nJW9
         jRRCztVUwgrEEjtI6aO6oN8ky+xBCmiw75LS7hMVlhQGBz3D4ThPb3fkN26XiBt94cmq
         Targ3gHQPAhEFspcXLNTdtZ2pBfLzVAAIPzar+AphO1Chv41BVMNY1wRtHvjXP8me0kM
         pCojcOSk6e4JFrH5g/8dZYt5OU5EIryr8vEoxJ7BTUxagcryLpXarcF3nIjtaCvMpgmn
         CMLQ==
X-Gm-Message-State: AOJu0YxTfb1pCzuw2ntCFLF7/sfb+dOMl6X2AOqWoWAyQWCNyQlPcfOn
	hcA2wcn4Djda7JcNUa3LTZytVk0dcOPe7wgnzjIOqNMz4K2M3nEHjJrKhnempOZfTIRsRDW6fQJ
	SfRVZBMFVU9/s6lm3HI+ZjG3X2e/0Y4CJNqtyUKb2RFMt6UOy5xU2vwes6Vlo9ZDfcRmV8nftKt
	5QVw==
X-Gm-Gg: ASbGncsdEwqqYRHAMJQNbSuAxCD8hOS0PRhehaAeIrfOi2EEqXzBvBJWs7A9uzzFwE8
	oBECpoOY3wem9ZkkPMdPxym2NWz0m0mcaDrfOKsXFUnOvPS/bIu9p/IMHIiipCuAdGzO1ccnEdK
	QoxRGCkTitdUdFcev60TXEjd3narcNDfjgv7p1TFkRgsAcbgj+dby2EzkCQzGOASksaT/DzYbVq
	cJwJlAnagtNRnfy22h3rwwREUTq9D5D7EPSuorfssfvFqCq0Z59hogwUennVryjgZmPjludk6Eo
	80Sau0RZkCuUzV23upHILoL5BcfJgjJB/Xf0pGzcETM8OFGsYJYNjdpNkxxOZ+O2QmTaZ/p8zNA
	AqYOQ2aYytZSbokP+mE9NIPR5
X-Received: by 2002:a05:620a:1981:b0:7c0:c469:d651 with SMTP id af79cd13be357-7c7af12a2d2mr2101606985a.57.1744712803400;
        Tue, 15 Apr 2025 03:26:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFttRmuL67NqA2zTdRYVjTXnuJTMGoI0OSnpOoHvcP0EMBO7fLONwT8uunFuuxhcivqNgkcwA==
X-Received: by 2002:a05:620a:1981:b0:7c0:c469:d651 with SMTP id af79cd13be357-7c7af12a2d2mr2101605285a.57.1744712803091;
        Tue, 15 Apr 2025 03:26:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5035f5sm1384005e87.117.2025.04.15.03.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:26:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 13:25:59 +0300
Subject: [PATCH 01/20] arm64: dts: qcom: sc7280: Use the header with DSI
 phy clock IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-drm-msm-dts-fixes-v1-1-90cd91bdd138@oss.qualcomm.com>
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
To: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1881;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=swolJ2wT3PzlKpfDSKVw34/qc577z+kfHl/7Kga+DEA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/jRa0fkvFXfXCaPFGlGhR6b1uMqtCdD53vP70
 tBFrrUlJRGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/40WgAKCRCLPIo+Aiko
 1eMRCACn1FLqnyuXy0MQXj6hszUC36yY8T7sVjTJtvZUKgzkhBFHXkrWGLlgcFVpsZK4nnwAHad
 XlwzMbG+ZWdOwW9Q2z5qIc2LlGMnv6IN/e2aFzlXln/go5bixiSNco6QOu9SrhS+hpe1hBzj3fQ
 9zRibq0Inex/GhVVEYBJ4/XVPw5mvY4AGssqglQ8RAeZ5vb05xm2nmi+dD2JHdhM4M3w2Nqh43i
 PTUjRlXewvAJxxbxf21RJNAt9R0hQCwyKhTD180Og81NSgiDvfSaDLFajQqRyg2rcYz/ftcqhRh
 u59rpkeoGpvuOpmwqLic1owy79KYsggYEpXmmqpiTuQLgrNA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: E22Q-ZKm28OiTaLLaMIKzo9LwJKzD6Ms
X-Proofpoint-GUID: E22Q-ZKm28OiTaLLaMIKzo9LwJKzD6Ms
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67fe3465 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=Y6IR2WjCNL-hTLnPAXoA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=789 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150073

Use the header with DSI phy clock IDs to make code more readable.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index ec96c917b56b4a077b45ac0186da6aaedb899dbe..d780b5a18cf6472082a87bbbd1900b4ab907eda5 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -6,6 +6,7 @@
  */
 #include <dt-bindings/clock/qcom,camcc-sc7280.h>
 #include <dt-bindings/clock/qcom,dispcc-sc7280.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-sc7280.h>
 #include <dt-bindings/clock/qcom,gpucc-sc7280.h>
 #include <dt-bindings/clock/qcom,lpassaudiocc-sc7280.h>
@@ -4617,8 +4618,8 @@ dispcc: clock-controller@af00000 {
 			reg = <0 0x0af00000 0 0x20000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
-				 <&mdss_dsi_phy 0>,
-				 <&mdss_dsi_phy 1>,
+				 <&mdss_dsi_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi_phy DSI_PIXEL_PLL_CLK>,
 				 <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
 				 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 				 <&mdss_edp_phy 0>,
@@ -4775,8 +4776,10 @@ mdss_dsi: dsi@ae94000 {
 					      "iface",
 					      "bus";
 
-				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi_phy 0>, <&mdss_dsi_phy 1>;
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SC7280_CX>;

-- 
2.39.5


