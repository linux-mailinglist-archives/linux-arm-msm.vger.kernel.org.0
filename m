Return-Path: <linux-arm-msm+bounces-74336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F390B8D647
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 09:13:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06E73442884
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 07:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53C962D8790;
	Sun, 21 Sep 2025 07:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aSfup16Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929B52D7DC0
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758438714; cv=none; b=HJWsMloLGn8I5+hg9S1W9ACLZLL/B0U72egu2txmbV+SzrE42nipNfdAx9SYc3BJTRL+vAUeoS2lBxuVf2I00DpIuglpqLxeLtcGbKxLU+rf84hKesa5zxZoWNl60EIbV8WcLUH2kpfpGlUM8KPgSwAXFjncAjlffbBBcaI8kDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758438714; c=relaxed/simple;
	bh=zuQiWqmJm7w8YUxjIGDIjDJcbtB7BchoHhOmUu7GxK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DTkCYEotpXTsl+1hgPmXSo+UVjaCSgqfkpEkCjtO0Cv5CUiRAQ4kpmxvB6o4N0blX9LJd4nf9A25L1ndnpDU8blv48YOBDgANxF6icgXR7wbUiKct2NsVmZ0LhzOl6NzIAhB/upVhHd25tj1Sknwll5BuzQZYBDfsXYS71xkFl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aSfup16Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58L30GEm013624
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ZZdrH3Q//EdTw9e3UqtT0f3Z1evP9cjcmzKv0KlKR8=; b=aSfup16ZW7H0Jt3p
	LgGCoYXMIG+hYmZCeQIz+iVN4ioWAVQTsaUEe04YyiqVpOLz/vQykfiEEk+LuA+U
	19FYNPMt1LGMrq/jB5/R+qEDwZ3wWjVzcCjEqQxhWs6vWdxMRmjLdWaNDvO6VkP6
	pyvBk1bdu+8Oey6WQAdYllCtfPyu7T8MxZ8OCh6oFZ31quhWmix+y8PCIFr5Vh7a
	SJO3/NOh/3d0nvkJWytuGGtrCUECZ1unmCJ9OP7TtmqufW/l2/MqHtcCOBHO9y5r
	9EnCWdkGKTwydDwCZzDY2/w9TQBQd/Xpib57g+i2ehAJN/6OR4HTf/a3/QO1V5GQ
	lAMugg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyej2fw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b4980c96c3so127290671cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 00:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758438711; x=1759043511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ZZdrH3Q//EdTw9e3UqtT0f3Z1evP9cjcmzKv0KlKR8=;
        b=wU1yrjd6myAT7+70J9LAHortE7SDwExawZw1ENnhEm/MqYOSnCDCcxAjizpdrnAud1
         4mBvPjiutzxEP/GahikIgSzpuJpTINtRYP5P2pOfh3qY07ToeiUVsV/51r4zwF1grsok
         +hfAdMtrbLP7O3035w3pyKcB8uyUuPySBuWS2T/vKvmoWIO4wOfvSN77qivhEzBZQJ4k
         WkV71T7YIsiIi245EsSfYTPPPYOZxesPWaVWzdaFNr5Tv0OAE0gtldOM0bF44OBNRlHw
         SEBn3eKqvQUwfGFU7IOAN2azyzYX7u1Himh39sSVnB5JZ0duL5ukNIXpVQLAhOkSFlQH
         GwYg==
X-Gm-Message-State: AOJu0YyQY5KPNaA0RZ7o1ey/G29AUwu3PBJ1fZXGrJEJsJmJtj+SGlXG
	rp6UZ9lK2dbViQK/1/JJWAGgvrL/85KZHVY6yEVIZXoVETv02uzsG0IievYBpW+sJpNm17u8Sfl
	ksibDq+jGQyixPYQg2TtOQOvQsm+sacR8wnEIlYH2poFZDCYYENit2DUIaiRdu3n5E0GQ
X-Gm-Gg: ASbGncvpch2ZlUCpQ8jAeLOVo141wksm0dDWwEWnKMsZ8mbNDOLjayuI87BMhesgdBP
	JFqpfGT9EKW8R7H985Y7vuAhRZ9WhKJdDgHyi1/b6sDMJfLCXb74+YSBYQm7W/lTqrTL+6toFvO
	pyXsEyYFJnWqIXPSaaZap/mDi8K545PlH5c8mX77ST50TyDRUeNiYwCbOd2bMxxChWx59GSTbzZ
	LZnOCOMsecqJi2fjzgqCr7NxjphPaUV6dXBqJu0R+29ZooXfHyep1SUDgwSjVAKZsTq5hKD/6vJ
	jhKrYS3tP6XhF1Ht8QD80Uucw4NSqSWIfbZVn8KPKWrlaEcSynhgqVH5gqZVJO9ZrS8+W62HwHc
	9kmuKDaVB78jJR3jgo6YWmT3JVR42cRh6Kob5Rgr4jPoqK/Dgg2ix
X-Received: by 2002:ac8:7fd0:0:b0:4b5:dd8c:1c9 with SMTP id d75a77b69052e-4c0734e9317mr100198301cf.68.1758438710625;
        Sun, 21 Sep 2025 00:11:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFJbN4ICf3+DZYPXMSkMJnELfLIDtjsLpE0pV/XJT1JzTW0k4Md9I5YmiE0XzZx/27OQMK1w==
X-Received: by 2002:ac8:7fd0:0:b0:4b5:dd8c:1c9 with SMTP id d75a77b69052e-4c0734e9317mr100198161cf.68.1758438710236;
        Sun, 21 Sep 2025 00:11:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57e06875c2csm144031e87.4.2025.09.21.00.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 00:11:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 21 Sep 2025 10:09:27 +0300
Subject: [PATCH 11/14] arm64: dts: qcom: sm8250: add refgen regulator and
 use it for DSI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-refgen-v1-11-9d93e64133ea@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1231;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zuQiWqmJm7w8YUxjIGDIjDJcbtB7BchoHhOmUu7GxK4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoz6UizRnyzuDzCASNdWjrQxTqT5yHbYZBbZnvn
 YjHqoP1caeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaM+lIgAKCRCLPIo+Aiko
 1ceQB/9GQ1RWDnrAxCkS8Nq4dRw3oaQD28VH00917u8AGpGg1hQNCQ7Gq9efDrlS1ddmjKnroV4
 DrhDEiqTrxQoBPjDZQmZc072v8k8Qi4QwJsW23MRnu5N0nGhwRIORpHzZqgJ7Ze9hK43Ssgy0ai
 e2qSfRzQF1EvLPOR3uyTQjJMq8/VDAcB6YDuCHIFlAFxTjjpqBbglGahlW3fGqCkX4ed3ejzZMF
 lJYfd8fZSXsntvsc5WQiTKQs3MYvVjuSY2Pb+JRYKlGS0qkPXw1xgorP9/7Y4HdiG8rOz3ngX+l
 4AOwmDINE5+bn96gda1Tnn47DhLWiboNbsiAh6aoLt5smc2b
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: tEzjZzE-DsDQEEMzNSn4s3kkH9D4PkCR
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68cfa538 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=XZOqtvWFhPgZnOB8h3YA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX2QLLI8U8QlBY
 nh/BlY0ufOPDwwkFafo0rmyT2nbZFAcHsE8h13Nq3D1nB0IYeMPFmTqwzqIadH+fT2B+cBJ70+U
 38U1t8daqOdnJA3L/posoUlDz4CUH/9XL3wSFUpYOiquFXu4SLW09UwHvwENGaEdIyd3GmBMz3/
 ZQwjQNAS2hxgPXl6SiN1KY4CPeRrQTEznC5fOZL+knyZsFjK3xN7NyhHsDZfTIgqu4lp6p+u5+y
 Odb58B2dDfUGfVHwd9BzgZ2CbnHYaovfjlsN+DuRmrRGH+dDvFuyJXvF43IlBqPdMzsJYVTT9xK
 0js3ev9+KcAVlKh5HtZqFORXfcKmlz5A/MbgGjsopY/L0zfp6uAcOivfVKFuEw536x9ISkQV0Y+
 0EU/gMZL
X-Proofpoint-ORIG-GUID: tEzjZzE-DsDQEEMzNSn4s3kkH9D4PkCR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

Add the refgen regulator block and use it for the DSI controller.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 50dd11432bb2e8d4e9c811b31192331c424f205c..8248ac3119f12919d4988f4bec34fed7139e13e6 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3901,6 +3901,11 @@ usb_2_hsphy: phy@88e4000 {
 			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
 		};
 
+		refgen: regulator@88e7000 {
+			compatible = "qcom,sm8250-refgen-regulator";
+			reg = <0x0 0x088e7000 0x0 0x84>;
+		};
+
 		usb_1_qmpphy: phy@88e8000 {
 			compatible = "qcom,sm8250-qmp-usb3-dp-phy";
 			reg = <0 0x088e8000 0 0x3000>;
@@ -4873,6 +4878,8 @@ mdss_dsi0: dsi@ae94000 {
 
 				phys = <&mdss_dsi0_phy>;
 
+				refgen-supply = <&refgen>;
+
 				status = "disabled";
 
 				#address-cells = <1>;
@@ -4967,6 +4974,8 @@ mdss_dsi1: dsi@ae96000 {
 
 				phys = <&mdss_dsi1_phy>;
 
+				refgen-supply = <&refgen>;
+
 				status = "disabled";
 
 				#address-cells = <1>;

-- 
2.47.3


