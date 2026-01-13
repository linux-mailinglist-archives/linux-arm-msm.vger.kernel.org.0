Return-Path: <linux-arm-msm+bounces-88808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B14DED19C13
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 16:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D7ABB302233D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 15:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DBB02D7DF8;
	Tue, 13 Jan 2026 15:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KhcAoiv5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MiZkuYfh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FD52D879E
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 15:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768316755; cv=none; b=eiNI/lNrSmKpYfTN7iXZSUu/HPn6Tle3Fb6ZmoA94u1LcGWtz/O6yKvQGAYnhL9/3qNs/9u21PvcRDFy8nv5mfnmpumYaSbY9YTQYwK+Ne42SDWIQcgIZYpg1zzoqW2ExtYPXTp5+/kXMBPfIV9G/S/xdtSeZK1mYl0RMZh5ZYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768316755; c=relaxed/simple;
	bh=fdkTTxCws1SqGGcVirwfUeWaU334oFlvfpm9ey2HxFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FQT+PC0FTnGx0LLrnLsOTtU72lnp/fRrrmPiT8Nb91wMM0h+dZu7xrRArzk6S8rr0gsV+qzzPFYaNqE2mQF8f4L1ZJ6cC0i6olg/M4LElzAF/j9o95/EkNz8mhsHLQm2eUGXuDzVLAW1T7SxVJfIGIUM6rcc9/xn8vk9meEa7hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KhcAoiv5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MiZkuYfh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D8Z1ik3727188
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 15:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VL8203OSWMIWC7qbAzaBVg6fNhPChNvwFjAEK5Qi8us=; b=KhcAoiv5Mx/3ar6N
	q7R0niWaaFjUSPHxE34rXqpPXOcUNvehMYF4cqAWF9HPR2MYpaB7SvuYQvR3cUBk
	g9VJlaTG2I0CE6a+ieih0CA9SLCGi2EHDMuatXl5xRbp0kHlX+J7zaU/4JDRiFmk
	HdvHsFPkEVwYBUMbiUMsb2pTl82yF0g+5CuV/uGGyvXM356ySti7Gv1BgHwn/nuu
	5rCnoCCflDMg1NgMjsekPa1fWdbn3ac19jMlBPsj85EpgnDHRO9/HYgOeze4MNN6
	sfADc9lDdGHRAceh2WrROhJSW6GRZcg8WRj4GCKdunZ9YVHXzhVXwVFo/3gjcHbC
	ywgVag==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnjnu18ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 15:05:51 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ae32686ed0so25152329eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 07:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768316750; x=1768921550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VL8203OSWMIWC7qbAzaBVg6fNhPChNvwFjAEK5Qi8us=;
        b=MiZkuYfhb3ho39OWUjauFRLcrR67HeuV36fIVEnTORKrsil18LGK9TVCfNyKJnXmxW
         spDPIeeTT7lFIkF/BtK//qzOQ1cXRuyevaVwEGEyEFc2cDbdsiAh8cf9Ffx23XwcpOUU
         WorXw1jRYl84NvgqKUKwONkb4JuZTSFSa3Y4WngmFSPWndTwjiN5OO6ntWlTdPrmxPwU
         R2lewyzgpuqBtGgNIh6G70sA6W0TAMixLDyaTxrg3e5f1x1rfkry9S0ycBAn5vINaVrd
         HNzgQAUJsMGMWelD78RN8XfmYRaoTlGh33Yq9TerIoGv6lWs8Ggs8CxbcIv1p0++39TV
         1klA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768316750; x=1768921550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VL8203OSWMIWC7qbAzaBVg6fNhPChNvwFjAEK5Qi8us=;
        b=diGJ/DIlUhBOPyEOaEfZsGneTvZUjA0Ym9k1t93N92dojNbfgiVYb8w67H8chH5ozW
         jZ9Vrq86CooDgK0v/FXkgjUSsEsNRgqBqTuo94qX0TWTH2RHLWWL2p2KkO7lRzIQ33RB
         v9Uuhfreu8cbrX8tpRmKs4c8ok3VlKncPCrCM7HsNk/qyzm5Ff4E9r23M788wvhUJlST
         U/WxYUIoYb4Z8ggae+KAemy7vtEO6rv2e4oiNo5fj/E5ra8zszd8dem9mnLWJ1v7Fez/
         oYq0/i5ZrD9406KdedQe+h04Ty5bXH1IhD6D3hpEcfBeawAxzBat9Ch6CV2O/SmxiFPs
         v/Og==
X-Forwarded-Encrypted: i=1; AJvYcCVjIsjdQQqiK24su+Yt46eAldHw5sBzZq0Yi65nuDqi1LG3kme1CUd4RCE98Wt+x6jvvJfmMDkDum75Mfhj@vger.kernel.org
X-Gm-Message-State: AOJu0YzIsQ+xQO+P8vdAhuybxaYg+Rxq4ihp589SGq8USgHqkfGwOGml
	qnhDDNQ7NDu0AIelLltsPRMBGchPSAQjVM4+E6nUolqyUsQyZBAb3G3MvntHtHpXfhHEkNMZaHF
	Ddd/iyox2IOAYatzzDeo/qPiCRb+PLBVPglymwS+g7pZpgiLLtzFfYn9ppwirDWmYWscY
X-Gm-Gg: AY/fxX6Y/+VhwqDU5Xgokr3xDXx7OtLME1OcSTkeheh2ibsiI703EvN6ohx3HB3DsqW
	cZweDA7uAr0Gu273g+ZH3EkP7Z/QTolnWG5b5dL8XA2ZG7biGPfaNQyEPI8Qh41VFBnS/UGJaJy
	0DWmsQpNRHcYtnuvtjQ6cw/mAJSMRcflwwLfGoDnHFNrja5m7xnY6Ot94EynRu3Pk0RSkaz2Lr8
	awxlWPbxzOLPYzl3+dgMufgqDou9+wdgF5KvDnEBaRrPGG03A9o9pjQ2YBQBMO1UTKDd2v8RjmK
	hmKApfhiTrJqHpvuLhuceMwt64gE9MfeupyfC5JSH8WaNn5RP7640rOfk627GPAv2ma9ZbKe3mn
	g/4lTcKIg2qR8ZeTXYw==
X-Received: by 2002:a05:620a:7104:b0:8b2:dabe:de27 with SMTP id af79cd13be357-8c389408d4emr2878534985a.85.1768316420690;
        Tue, 13 Jan 2026 07:00:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRMngKrwWXxfZQenbgG+jZOfYX4PQq+MbHe1dkRFN6rn4r5gCBIjJXTA12hBCCBOtAVLcBLw==
X-Received: by 2002:a05:620a:7104:b0:8b2:dabe:de27 with SMTP id af79cd13be357-8c389408d4emr2878494685a.85.1768316418378;
        Tue, 13 Jan 2026 07:00:18 -0800 (PST)
Received: from hackbox.lan ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4d3831sm2317392366b.44.2026.01.13.07.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 07:00:17 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 17:00:06 +0200
Subject: [PATCH RFT v2 2/2] arm64: dts: qcom: glymur-crd: Enable eDP
 display support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-dts-qcom-glymur-crd-add-edp-v2-2-8026af65ecbb@oss.qualcomm.com>
References: <20260113-dts-qcom-glymur-crd-add-edp-v2-0-8026af65ecbb@oss.qualcomm.com>
In-Reply-To: <20260113-dts-qcom-glymur-crd-add-edp-v2-0-8026af65ecbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2549;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=bzXRipEb88917TVh5cJVP1PkKOLSRPzc1VoESDiOxCo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpZl37RsUY+OPC86gMyVKcuBmsj33N2kcGFdigE
 hOeK9I9pRqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaWZd+wAKCRAbX0TJAJUV
 VhJjD/9f7ccH6BGXOnp/jGDof0c26ms4EXt/3RLK1qUTdd54fQbxYCE7JJESmujXiVnfC5Y5JmP
 03CjSxv/m2tPShOJZZtxbCHQPnBtVz3eRGxSyuYiEzFdBbelcEk06ReknIB+RT+GvVd4NCWA4U+
 R9FuJKQov3Qx/eBMM5VjJpJYokhjKdWVcYU2X7RIjNVlMSHqFhc4T6GUUskm6BS08H/F6LXsxqN
 WH9GPH80YczONPJYSdN49VVvKfXBdRWUubwz9Nsdc+N6YptcNlwTEw8PCxjbJXzP0L98+g+V4Wo
 b35LMUsVcBQBm23Ebjp2Py672FTORkMGvDlW8dx9rHxa/FxNqdxqQkPQtmOCTx56mLXQPr9LnQA
 AMVuT8ePHKAXK69e4kiMFrhqHCi4kye6BFW7N0bA4s9SYWDK7LrtiVUm4ZyZxpiZcW1PMnWBrFU
 o864aXaKxXrKteIgvQjPRjUDJdpINYP3Z4PG79jxCZZrAZp4oJYpDiu+IV2jIRMMEQiak5seu6F
 B6H5lGB6Lwj9RtMPWvBX7uUBYB9z9/Jz3cdgum1u6gpC8vmYTUGBSiTDV4RQmYZSiKz7p21xa2v
 FwF9oJDl7qdt/U1IKBurm/FuOG/S/phomS4aT0gqQ2EcXGaajBrZVsMAKdvYqCoJjfKdgsfPzY/
 rrXmap0B8Y/MqfA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: bvGGUm-r8huY9bLqTEJkV3rKj9kPT9RQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyNiBTYWx0ZWRfX9GAYppnFsfRX
 OAEV425vgvvrPhsal8kBUU40Q4+wtXASD/RVPBNay1WltC8TACHOPg1SQ3AAhSZWE6Stycmx/vO
 7a9w6ZKbYkU1eiM1rky7URWKYqFfWyvHGSRrRbRQi7gkOLJOeWx+Cd5W8wTrzFIV/8q+KZIzZHv
 N7u7u40RLT1yaQSdjJFs5aXxlb4CEdRZ/2rx3HQiL7g82zp4ejO1CMJSJSxWyUYdZk4MPFxWY+G
 3piQ0z9epv7pO4NxvCQqXk8uFX68qAJ5NAreftwRqqS74IyVlV4XIa3MnVeSNEP5vNxW4vqZK5S
 43BNCIbZa0wsSusaxx3Mzis3E2CpJfm6zeTWdYMae+OB38J8pNX+4AYP1o2grbxL36WBPjFFlFj
 bbJWzVoctR9q1Kk3cl3vAx9d65FFrYc+4PTEiFTVU/qMdiB20YAtVPviYFpB21uAzlWs10zc4rq
 USRVVUoaAyLmqe4p4uQ==
X-Authority-Analysis: v=2.4 cv=RMu+3oi+ c=1 sm=1 tr=0 ts=69665f4f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=68_4jy3stEaJOreQ4WQA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: bvGGUm-r8huY9bLqTEJkV3rKj9kPT9RQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130126

From: Abel Vesa <abel.vesa@linaro.org>

Enable the MDSS (Mobile Display SubSystem) along with the 3rd
DisplayPort controller and its PHY in order to bring support
for the panel on Glymur CRD platform. Also describe the voltage
regulator needed by the eDP panel.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 71 +++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 3188bfa27bea..db8307f06bac 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -147,6 +147,22 @@ pmic_glink_ss_in2: endpoint {
 		};
 	};
 
+	vreg_edp_3p3: regulator-edp-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_EDP_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -493,6 +509,20 @@ &tlmm {
 			       <10 2>, /* OOB UART */
 			       <44 4>; /* Security SPI (TPM) */
 
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio18";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	edp_reg_en: edp-reg-en-state {
+		pins = "gpio70";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	pcie4_default: pcie4-default-state {
 		clkreq-n-pins {
 			pins = "gpio147";
@@ -900,6 +930,47 @@ &gpi_dma2 {
 	status = "okay";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp3 {
+	/delete-property/ #sound-dai-cells;
+
+	status = "okay";
+
+	aux-bus {
+		panel {
+			compatible = "samsung,atna60cl08", "samsung,atna33xc20";
+			enable-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+			power-supply = <&vreg_edp_3p3>;
+
+			pinctrl-0 = <&edp_bl_en>;
+			pinctrl-names = "default";
+
+			port {
+				edp_panel_in: endpoint {
+					remote-endpoint = <&mdss_dp3_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dp3_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+	remote-endpoint = <&edp_panel_in>;
+};
+
+&mdss_dp3_phy {
+	vdda-phy-supply = <&vreg_l2f_e1_0p83>;
+	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};
+
 &pmk8850_rtc {
 	qcom,no-alarm;
 };

-- 
2.48.1


