Return-Path: <linux-arm-msm+bounces-74327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E63FB8D5FD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 09:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2143744268E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 07:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C8F52D29D5;
	Sun, 21 Sep 2025 07:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RU01x+Dm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778832D2485
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758438701; cv=none; b=DHyCz84sh5yvAerafFIK7BKHDTtHo80TZ4ICR3+gdSuWeMwFKMXP1H6TomD1SY+EDKDl8IMFAo6Acwev52RroypAsh05ayPI0k07nb8ZvF5QJ2VWgQmyomFsoo/HedgIDZ2LRBc3dIX9PXa/P/gONWpf6HbgfNYGyf+Xc7nwimo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758438701; c=relaxed/simple;
	bh=25cpesBQZL6NxG0fllLu/KW9z5cEvr8RmU7Ymx5wjGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QGFpWPpkCJ+iDilHHa357EkPHPgA0NUmFpJ+WNFwYn7f9VDh1abo4jjhpveQCSqvW+S1W6hG5iuB7L5wWQMQRxHAF7sQXHQQ0gsAqBAHt3hiKtizh2wO4l7bN7l5IdXTrYhfkm5zyY6ch1OYup2WUoeJ1pLs0FhoH/SI19PNdd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RU01x+Dm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58L5U3gi007174
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uzGmbbPMZLNgcbIAXSS0rfo+JjB4ZA9WYM36RJVPBG4=; b=RU01x+Dm+NrjGnMm
	draBHlfO+/TdvFE8h0od/PLhtyMVN5Y97oLVKNV6Lwb1B59ARaiVwU1gtpEEKUMK
	rBxlIXgHtCS/rgGyQmmhTLVD4653hHkDdAmX4enVdOLkxy1cqwgIztId0z9TL83v
	V7WcADo37iYnAWRKLz9HbgiIykHuJYUh52SNKfurzbD+V2BQ7y9pchsFslNPzaNl
	sKoixpnk6uP0ww2Vzz13WML7SyJ6ROt24l2e8DnnLezAPkSBBdBnWT33OnNuxeP/
	n413E4BplB8+P9NOuanBQLJPn7cIeljecgvR1K8WnSV3ffrZQEJBJiMxYenDSp+n
	j4V+7A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499neksnwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b7a2999d38so63133341cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 00:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758438697; x=1759043497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uzGmbbPMZLNgcbIAXSS0rfo+JjB4ZA9WYM36RJVPBG4=;
        b=bAh0caqqgz7QTPZIcu/87a9yUOExsn3w8MxRTmTJ3dwl0HpULKisHgKK0POztR3rd/
         zqu5TxJGVrcYwE0mJ97gQr8rbyjKbGod5T5DC8hIc7SuL/xQkW0FIxRMqo2+iMR2adPP
         gYswp6FIAxVNCHY/5p5NP1v21unkqtttWf5jc9oeth/GWL+jj3MvZUYG6tj8KGY+J5ae
         oqTZ4QfheLhmuAgLsvzGkZIv9jMG3GgxvtZ/N1IsmxDUiauY612rDq7CnPKK1m8j63eR
         nvKp+RWkRGWI/NmgjpQgHVU7RV9IRiQB8JBGT2lYE4lrxCnuW8Od9sQw7c3znWr/UjmW
         9GSg==
X-Gm-Message-State: AOJu0Yz2f3KSd3HsJnEybN+kSo2c6wefxTCAQW2plqv18g5Ikx2IeP3f
	sqPXASG3lvRcdPiW4qSv4z5IGR2TzHxNpmlQyvNzRcaKNKHLrHPUtiEuUax3nWPl43Cr+WLd3lA
	LrjwBTJlLrUZhPehdiXYFFl7hN+rciLb5xxUgY/KVWlq/61Lavncgit4Jvsn1R0PkCAyS
X-Gm-Gg: ASbGncv14l4cU9n9c59fMYPwh0hN+MCo62ch0csrYyDUaYh5FWAy6yDDW3DBSmw9FP2
	iHkHzuItXnLvCF92NyexlGRtl/YjfUs7u8yotcbSHKMYHPdKJ/3wnDMw5bLsExMRooExd0+UXdf
	fMDLrKQN+PfwGspX6VJpsBPzZJ7kbvfYpGHqqeVkFakvsKzDhdvRyZ94zeCGrEBMYRUlA1A2nXL
	qPeSVizA0Z+lEbUcLIqMJqT6DLIz9XpndJves+BQi/X9O7LjGyJnfB6ZrMQicC4Rk60cryPr3OH
	lr4oYNMTWTonOnBm2tgErQbjMS71UDIOvDBXm6HbG0P7NU37VU38B7k2H2MS2mDbuNodeqnRZhP
	C4naKt2DXJuhQTMnxQSQqyb6o5fV0AZJrCxi0FutA4/UNxJaeBeU6
X-Received: by 2002:a05:622a:58f:b0:4b3:a2f3:47f9 with SMTP id d75a77b69052e-4c072e26e90mr91502131cf.62.1758438697463;
        Sun, 21 Sep 2025 00:11:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT9w5N0wwngpLaLuh9bWhV+On4qs8xA73xMbcbu4tGipa4A9KvgSFlNO+X4uMPm0jIo1bFbA==
X-Received: by 2002:a05:622a:58f:b0:4b3:a2f3:47f9 with SMTP id d75a77b69052e-4c072e26e90mr91501921cf.62.1758438697052;
        Sun, 21 Sep 2025 00:11:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57e06875c2csm144031e87.4.2025.09.21.00.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 00:11:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 21 Sep 2025 10:09:18 +0300
Subject: [PATCH 02/14] arm64: dts: qcom: lemans: move USB PHYs to a proper
 place
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-refgen-v1-2-9d93e64133ea@oss.qualcomm.com>
References: <20250921-refgen-v1-0-9d93e64133ea@oss.qualcomm.com>
In-Reply-To: <20250921-refgen-v1-0-9d93e64133ea@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4035;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=25cpesBQZL6NxG0fllLu/KW9z5cEvr8RmU7Ymx5wjGo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoz6Ug6hA6Q0cGQMi7P4b+tAhIMtO4Dypv1M/SV
 Jr+WVwyYjiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaM+lIAAKCRCLPIo+Aiko
 1ZFPB/9m3wAIgK5GwIc+5lREQHL7/H8umbYMf9uHy83KQ6m/wpnTWcJt+eO4BGbHS9NNv9VEPsa
 /lSCpZTUD3EddkRd8fouw4AxfnrD80Q8G/q8T3/jVKekh2bYZVU50acaiojEsJmayz7N+XmvR2S
 ZeHtymbdD/+19xn7TnZ2KcuqT56qLOdz9NjoKM71Q+PW24SNH4ynzp/fofWxG2pR5xW+0k/MyAq
 oUKjNGyxgSE7/j3hRlO0riKiOitXmqOwiq5Qj5Nf6PSSIQt73B1FD5xObJKapeU1ymbFefPth4/
 k0+LwqbrJbER1Q0GhS0Qo+eoRir/0HoCdQZ/ef/9J6VL70D2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: QRnugsUm_njInTf-vUbnKFDi3hsDKaqX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDA0MSBTYWx0ZWRfX6UxruqP4kk7S
 oP3DVm/xwdQJUq5o4K0J/hcXlIObIsTzMWkfR8T4Cg5iph9WOB+z8a1DIBmMRihvREhlhV4V3lP
 a8GQiReatYTaQx9zCnDYsFvsKI2er+NW5wfRgxVWSE8TxjeTkEDvvDbBbDvwz+hL4t1uGH6JOFC
 6W7bapwrdsbLaF8Wen8z1aGSQo2JOLSr4xwVBAr4dytZsYmefRDpDmCLByFSRE5kE3gz8W01XR5
 6fX2+VLoE1F7Nx+xcoXEepRF2SGzXzwixoPz47ZfM/oRoOlE6EMw/MyypomCXGsvxm2hsmHVdM9
 vPWE2YSzlellyAW4gomB5TDXIFAeqroAUxe1x8yQSYajDDDFj01YP+EfPMZiFcKSE2a6JN8S90Z
 +4HT/vYY
X-Authority-Analysis: v=2.4 cv=b+Oy4sGx c=1 sm=1 tr=0 ts=68cfa52a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=w_1g6Rb62rfZozfxvqQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: QRnugsUm_njInTf-vUbnKFDi3hsDKaqX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200041

Sort the lemans.dtsi, moving USB1 and USB2 PHYs to a proper place,
making the DT file sorted by the address.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 100 +++++++++++++++++------------------
 1 file changed, 50 insertions(+), 50 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index cf685cb186edcade643790ba22f6a900beb85679..7b5f0b4d1be75d1aa757069522bbcf20898a321e 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3901,6 +3901,32 @@ usb_0_hsphy: phy@88e4000 {
 			status = "disabled";
 		};
 
+		usb_1_hsphy: phy@88e6000 {
+			compatible = "qcom,sa8775p-usb-hs-phy",
+				     "qcom,usb-snps-hs-5nm-phy";
+			reg = <0 0x088e6000 0 0x120>;
+			clocks = <&gcc GCC_USB_CLKREF_EN>;
+			clock-names = "ref";
+			resets = <&gcc GCC_USB2_PHY_SEC_BCR>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_2_hsphy: phy@88e7000 {
+			compatible = "qcom,sa8775p-usb-hs-phy",
+				     "qcom,usb-snps-hs-5nm-phy";
+			reg = <0 0x088e7000 0 0x120>;
+			clocks = <&gcc GCC_USB_CLKREF_EN>;
+			clock-names = "ref";
+			resets = <&gcc GCC_USB3_PHY_TERT_BCR>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
 		usb_0_qmpphy: phy@88e8000 {
 			compatible = "qcom,sa8775p-qmp-usb3-uni-phy";
 			reg = <0 0x088e8000 0 0x2000>;
@@ -3925,6 +3951,30 @@ usb_0_qmpphy: phy@88e8000 {
 			status = "disabled";
 		};
 
+		usb_1_qmpphy: phy@88ea000 {
+			compatible = "qcom,sa8775p-qmp-usb3-uni-phy";
+			reg = <0 0x088ea000 0 0x2000>;
+
+			clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
+				 <&gcc GCC_USB_CLKREF_EN>,
+				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
+			clock-names = "aux", "ref", "com_aux", "pipe";
+
+			resets = <&gcc GCC_USB3_PHY_SEC_BCR>,
+				 <&gcc GCC_USB3PHY_PHY_SEC_BCR>;
+			reset-names = "phy", "phy_phy";
+
+			power-domains = <&gcc USB30_SEC_GDSC>;
+
+			#clock-cells = <0>;
+			clock-output-names = "usb3_sec_phy_pipe_clk_src";
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
 		usb_0: usb@a600000 {
 			compatible = "qcom,sa8775p-dwc3", "qcom,snps-dwc3";
 			reg = <0 0x0a600000 0 0xfc100>;
@@ -3973,43 +4023,6 @@ usb_0: usb@a600000 {
 			status = "disabled";
 		};
 
-		usb_1_hsphy: phy@88e6000 {
-			compatible = "qcom,sa8775p-usb-hs-phy",
-				     "qcom,usb-snps-hs-5nm-phy";
-			reg = <0 0x088e6000 0 0x120>;
-			clocks = <&gcc GCC_USB_CLKREF_EN>;
-			clock-names = "ref";
-			resets = <&gcc GCC_USB2_PHY_SEC_BCR>;
-
-			#phy-cells = <0>;
-
-			status = "disabled";
-		};
-
-		usb_1_qmpphy: phy@88ea000 {
-			compatible = "qcom,sa8775p-qmp-usb3-uni-phy";
-			reg = <0 0x088ea000 0 0x2000>;
-
-			clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
-				 <&gcc GCC_USB_CLKREF_EN>,
-				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>,
-				 <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
-			clock-names = "aux", "ref", "com_aux", "pipe";
-
-			resets = <&gcc GCC_USB3_PHY_SEC_BCR>,
-				 <&gcc GCC_USB3PHY_PHY_SEC_BCR>;
-			reset-names = "phy", "phy_phy";
-
-			power-domains = <&gcc USB30_SEC_GDSC>;
-
-			#clock-cells = <0>;
-			clock-output-names = "usb3_sec_phy_pipe_clk_src";
-
-			#phy-cells = <0>;
-
-			status = "disabled";
-		};
-
 		usb_1: usb@a800000 {
 			compatible = "qcom,sa8775p-dwc3", "qcom,snps-dwc3";
 			reg = <0 0x0a800000 0 0xfc100>;
@@ -4058,19 +4071,6 @@ usb_1: usb@a800000 {
 			status = "disabled";
 		};
 
-		usb_2_hsphy: phy@88e7000 {
-			compatible = "qcom,sa8775p-usb-hs-phy",
-				     "qcom,usb-snps-hs-5nm-phy";
-			reg = <0 0x088e7000 0 0x120>;
-			clocks = <&gcc GCC_USB_CLKREF_EN>;
-			clock-names = "ref";
-			resets = <&gcc GCC_USB3_PHY_TERT_BCR>;
-
-			#phy-cells = <0>;
-
-			status = "disabled";
-		};
-
 		usb_2: usb@a400000 {
 			compatible = "qcom,sa8775p-dwc3", "qcom,snps-dwc3";
 			reg = <0 0x0a400000 0 0xfc100>;

-- 
2.47.3


