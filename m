Return-Path: <linux-arm-msm+bounces-74334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC38B8D633
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 09:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB69018A0496
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 07:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C2F2D73A0;
	Sun, 21 Sep 2025 07:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q+2A7B5t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03F42D3ED9
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758438711; cv=none; b=moWDQa3dC4XjYHdhqMMZwI1WngLCMMI2Ep1BcxKZQKzSTfqGw9Gib0Y9s7hS7NesYu7RyyGAym1LWfA2EbmhzTpuE8cXHMpZqXyOlv2RLWkQQQM1tk1C92oS8cEp+5mso2zH4olZOLeroZFXapR8rkalS/9dyW6v1GCSQtGSQOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758438711; c=relaxed/simple;
	bh=KOrtr9anBwhu3Lm3+yW4FXeCTQdCvH4Eo/x1eLlVG78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F3SxCSAcs1yi1p8pr7Yf80zzVyGLpgAKtVarKtx1PWNua3b8wtgrRQuwkDVZsXKBtUKWUmIhCnTTHmzbkSXct4o7cuNFVhzpVtJt3Bnl5UYkEJlJNt6+hRW1PjOJajrkBD0y3ZiIic/xSmciKLQ/x63xdNlP35TsJl6tPyjQqjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q+2A7B5t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58L67LZR018096
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5UKxEl4Tj1idU7Nm/u6DnMbzEVRNgZL4yVBAlpg8pIU=; b=Q+2A7B5td2QcFt7H
	4WnNBfSZgCaFdjeWv3RoHpGM5Wb0z80/pa7FW4qcokmr5HMFYB1ZINBi7LuDF72X
	/JdxLRW+1/uzONImOy97yBBHlf9cjNWfUA5hNcAu75ndGuofU01iS2Q1ESucBfF2
	DEbSyJpmN0j8wIJ9EnT60OJ4DIKAVFc+2pe8rxB1t9Ud30BeWACEcVz/HER2f034
	PhQWG1PRjvh0UMGd9nDgFVucqorRSLm9EpvWkBoXAivnqzGBNG+xCtl5J3/ubdrA
	q/Szc4TuOp5Nw71NhkQi4dPjFycR6ab6R2y+L0OqtfXY6lst62LPCwui0i2fF00D
	fdoshg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyej2fg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5ecf597acso82793101cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 00:11:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758438708; x=1759043508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5UKxEl4Tj1idU7Nm/u6DnMbzEVRNgZL4yVBAlpg8pIU=;
        b=cGKMyLVsdiY59UmkwUZgaNUSE8KWc9zMRG0v2YOg25o38WN2qsNl0tMGgCXJhJihD8
         AhRYSsGL0fyjaIUFJn31LDD3/q9zh4+lkpiyLim/hCMjb6xX2Eof58Ki46vTUbGPGDGg
         C9QnxgH+19jdkFwevBH0M1BfoOINSv+CGPORkqf3yHX2RLmmFF8g/+S9GZAQUoIFoQc5
         iOPHdFp8QYk1wqA12/45hWEuNKb2AB/tR5/FOOFa6fDQCQkmLg3+Mxx7Z67oiBoM/r4o
         2gKjEFqt2n6yge4EclaUsyvnlqngM3RqBWLwtcKxkuVzVDNu3iJy8VIWyH/iKjPkM1aK
         kggA==
X-Gm-Message-State: AOJu0Yy384+Kz83A5JxO2p9YzR/7C3dvIykn0dQt1lRw+71sFAwQL4m+
	6IhyQKppEOUKqHpTTnG0BJKyn1pAJhBzq5XrltX6NXvpreqBPzShv4lSUa8iH0M2fNxskbZGWzt
	zV2Xwkb11QB0QRobEr23W5FPFL0atez34vnDp11Mnh7ghMq+e05O14/xlHQ1XJQp+jxBN
X-Gm-Gg: ASbGnctT9835vOvQysY8rG2uCGNGIoL2VgkzYILcxVvU6kMeq/i6ApB5WsZYzNPg6K8
	r1bnJ9RZ5BFDLAQy0rxRfNRugUaMl21mbOefgKT7Qn0aO8ynS83Z5iiQRwXrHHj+/gGWBaF/8NA
	uXbgoArsSbBeKPFArkQY/f8y+W1sHblgQej19umVx+K2+UlPxQmQErUG8p8RjB4EuTX5It2nvdK
	PqbnQtSbjFBJ7tTdexI+DbMNmFixgAN7L9bgvuKcmlIHYXXT7Etl7CeXDuBFo5EUQL0YVDC6MeM
	a8JukbR9pUEw0mUL2f/tI+GQZX98djbWeMvidazlFrHk8skTq+EJAV3t7Y+NMnxopp69VpZMA0V
	AuO0YJhd5MOavuAHCXRTRJqQDbry0HZsFsd2gsWP8U2fVJbvgMIl9
X-Received: by 2002:ac8:7d10:0:b0:4b7:9abe:e1d0 with SMTP id d75a77b69052e-4c074359c94mr94438611cf.83.1758438707793;
        Sun, 21 Sep 2025 00:11:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiNftRpn9KjvlSL/RDOxBX5e8nD0VvpVQBe/J+schooKFCCi+R5m7dj1MxaUqGGzQ7yvMK0g==
X-Received: by 2002:ac8:7d10:0:b0:4b7:9abe:e1d0 with SMTP id d75a77b69052e-4c074359c94mr94438451cf.83.1758438707335;
        Sun, 21 Sep 2025 00:11:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57e06875c2csm144031e87.4.2025.09.21.00.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 00:11:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 21 Sep 2025 10:09:25 +0300
Subject: [PATCH 09/14] arm64: dts: qcom: sm6350: add refgen regulator and
 use it for DSI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-refgen-v1-9-9d93e64133ea@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KOrtr9anBwhu3Lm3+yW4FXeCTQdCvH4Eo/x1eLlVG78=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoz6UiYddOH0h7x7juqL8KjUrr3kezSpxnEbDeV
 5Z8OUkSmcuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaM+lIgAKCRCLPIo+Aiko
 1Xm5B/9cwh1oT90s6mnxrQVmsGk7jwkEdm15qFkwklbt3suWr2TmDUrHAkdXqTgT/K/hbjJ8gtp
 +qyKdRGEWuNmgt9yPWdzENoKyutWeDFkquE5jKOlbjjnKIxSfibiMkJMK77gK9E766nHwyjiQo8
 sC3SgBqBs3BCAVQ0uXDq3TfdfjfQKJF0A1Qe+//e1NfuR/K+uRJojvLZ/dSuP011FHan/rZnGug
 FZoLmAuXzyufE6FpXSU/StCx1whgetuAeM6RXSqr6HADNFiPhS8XrtiHo8E7YyCNtRvDgaP6h1Z
 N9Ng7QG1F7S+ExTrVg4lkZSt0cxNx6fkJOJuOppIcy17xeUN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: PeCsG60JAwHALHEtZvwLF0iMcEovI6g-
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68cfa535 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=XZOqtvWFhPgZnOB8h3YA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfXyv5Av+qpkoZ3
 t7lmOZ70ZmfO0auRT6p6qs8p/tyihndJ18XtzLewqjV6zhFDacjbFXHAGCC9UcL63c7DOOkx4fk
 2fxgpZPgAj+lJUeDICyNOanp+UWOCvtF6f7HlJKnyW2l8JR8+UGfo58x4KUBnRiPqUI5q5KubAX
 jsFk82SWJivDAJ0RS0yMs8gQ2pmnGBpGT5p/XhsvUH0rMbzJMwg53LlDAbsZHhsLV5WGpXh2DSc
 dBTZcS1CSN+cI3P+8LXiGXCi2RyQdcZlQEFJNd7w8Lr1hoxKJ4Iv8dws+zg3dWEdMntLLtq7Zp2
 mUwhedk3t60cUlnyYU6JdIl4CWYI2HpcYBPqcY0TRgIilra79CIHyz3+VQOHast+N0LVXZFTMoB
 zJ2iGDKx
X-Proofpoint-ORIG-GUID: PeCsG60JAwHALHEtZvwLF0iMcEovI6g-
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
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 8459b27cacc72a4827a2e289e669163ad6250059..dd009569a6683a25f13b068e3e0bd8746b2ac501 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1768,6 +1768,12 @@ usb_1_hsphy: phy@88e3000 {
 			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
 		};
 
+		refgen: regulator@88e7000 {
+			compatible = "qcom,sm6350-refgen-regulator",
+				     "qcom,sm8250-refgen-regulator";
+			reg = <0x0 0x088e7000 0x0 0x84>;
+		};
+
 		usb_1_qmpphy: phy@88e8000 {
 			compatible = "qcom,sm6350-qmp-usb3-dp-phy";
 			reg = <0x0 0x088e8000 0x0 0x3000>;
@@ -2360,6 +2366,8 @@ mdss_dsi0: dsi@ae94000 {
 				phys = <&mdss_dsi0_phy>;
 				phy-names = "dsi";
 
+				refgen-supply = <&refgen>;
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 

-- 
2.47.3


