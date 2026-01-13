Return-Path: <linux-arm-msm+bounces-88777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C62D18C04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 13:35:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2FFC0304F64D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 12:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4526838A2BA;
	Tue, 13 Jan 2026 12:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZqxN5mcS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MVV22t5b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BE938F957
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 12:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768307613; cv=none; b=VAtTF9IjdDZg0g8AfIu3r1mPv230GJ/w5MKpwiL5A0/Pp6ba7FtBRx4NPeicPsSlmUgEIQlxSsGibZFCiwP5eZntgrv7DyOt4uk6F3b1wvsv2445ZUnFpwRZc8OrKlyhK5RkDte8ij0cZOhDSZMEAOeS6q4veYefJh6+IYFPVBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768307613; c=relaxed/simple;
	bh=tydRX3yo9AEeq6PJhCYN2pEPyQHenw1yvOsXlAsnTwM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R14+FBOHYKmruO4PolttbPURT2f7ECKmumRjGleCxQcq+nRvgvjqYRAxrXhbe8DvPrdv5mW8hqlldnpyhiJwl3SOYndTjdADWWYjSb5ro5gn/lSp+CNpJ/KpAxFGRJ7FD3hRnbcLsCJXvfjPU/nF3iUR+5QOjPhKrd6camT3ujw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZqxN5mcS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MVV22t5b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5Svua3869220
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 12:33:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fWrkao9Ts+ESL02ON3LtjqU7MWhHizbig5UgIr4PUuw=; b=ZqxN5mcSXMkxOLzu
	N2y6fQ6Da3TQUDeI68tprt5mnWJoAt6K5Q47HUDhnfk/njBFSiRKFGGWxP0V+FBN
	1Pu9VHhvLmkDvhrVob5ABlLmomyXCtnL39BiSFz7UMEsFE4Ysgnf/ZnL5bopRxqC
	4tsr+BrAvWhdf3PnLWhqSK16jWoU9MF5WbP5xHZKGzgsPsJSDVCJ1Qp37MqXkGqw
	kyXBfce4nxlvh0a5U+DLvp7PmjnhX1RgrQBFT4axHxlJ8aqZ6fMXgG+nxbw8ZRFm
	VF7EBrpJO8ckKtZTm8GjaGIri0UuIJ/opNIy23B2JeHOcUDYFwz+eilQ+ASdc4KP
	FROfWA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfxk98ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 12:33:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b19a112b75so1863048185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 04:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768307609; x=1768912409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fWrkao9Ts+ESL02ON3LtjqU7MWhHizbig5UgIr4PUuw=;
        b=MVV22t5byS5tweP33SaZqAx6Rp27qpgJYNdxIG2W+rIwBUNS0dR8kjttjVYng1mGmy
         B6uvEVWDUUsLkjLt0X4w7eKvYhjZratQK7hqEejXngvu6mg85igP0mDvDupc9cOFRgzn
         fXC+A6pOayekZ3zTMPAyf0+FKemeC6b40OJ5sC3WiMZiU2j2KihntuAtaFHKMZPd0PKM
         evMyuJCa69QGDy9da33Oi8XLVm4HPzjVMETYo/y1VlLmWVN7VbuFEViWQAxz9Teb2BWX
         dRlL0WkUv06tuOn7K1sDNVUmE/5OLIYqVXf+RMvKsU1rU/BhojdB1Vj10p35ja8n7FDn
         OFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768307609; x=1768912409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fWrkao9Ts+ESL02ON3LtjqU7MWhHizbig5UgIr4PUuw=;
        b=IbOi2U1dIzbGARKHQ6hyIB3yeg9Bj9wI0X4DaPlbMpJQtwK0eGQBs17Mp+iugY7JxD
         ubq2aFN6u5Cr/20H4GP3fG1XCsQPMrBUrylFMm4GV0oL+YHyw72fawtMWVVmB70i9bq9
         68V8lrqi7FbkNMieyA17pN3Omn/0TTTE3TdN9w9yUmsp8pHwNxWdB2qY4FVWVwTOTREz
         nGaJaDdjeYRs4+Wdxt0MDxEVJeOb0dDQB6B34ey/u0yCtB9fERfoeZIlXbJ04d9hHpN8
         QdEe+UwG3lwQEizetHAIjUbgmKt7XuYtBjlzSZWLhdkiF8U4BsA4sewgDVCPL1aRQglF
         Wdcw==
X-Forwarded-Encrypted: i=1; AJvYcCXg10UpQtAQS70KEhOhDSRWooPF4+caG7c/dLBxzCtXTlWeasGruCwuXZCIGeHydz/qY7VxLMS6/P9aTvm6@vger.kernel.org
X-Gm-Message-State: AOJu0YwqXE7059UnbqvfDYGgk2No6MvRzTJdOUUaPFZ+eAIxkLIVpwHl
	UiISnBBTXZAMLXXUat4T+OexUdRkb+qR+pLfVGXyxFuEYfbpd2DWpYEGcyFOTjGD7ROFbjolu1S
	WlgnObp1QjKNyDXBVGCycznD5sRJpWbaTo5HJ/a/kjJ8UsWB4Ta7dNfy26KXgf27wCYJS
X-Gm-Gg: AY/fxX5N3fg94Q/5H2qFEz53OWapnEo+imhD3FA5A2afks0q42OQ4p+TP9Ya38EIkjF
	V2YP6DHANUSqxIruYT6IPFvBoB1PQbUK/lLPrVNbD3cNS/j23w/S+Fe9N8L1gTCHSHsnUbTvrcc
	DYMbI2gifUZ1y00H3VSwb9Nxz35zQLXHVhZ6hCJr8EfXEnwf3S7bBr+pfJjDWp9xXCRkfl5X9b8
	loJzLbEHZFhcfDW95zynH1VuugSZ8uIDQkjXM5o/qe8ZSnFhK1i1TV/jYcmmefjHGPke//J39Qu
	hx+uFYRcDz9yoB3tyu2D4nL5/1suu+kwBFf6u13VmakdKJKJmhnbmfoVyF6rfxXeerWRlPknC1y
	xCFh0JO0dYd1iZTLu8w==
X-Received: by 2002:a05:620a:4108:b0:8b2:e617:5aa4 with SMTP id af79cd13be357-8c389408bdbmr2888773485a.44.1768307608778;
        Tue, 13 Jan 2026 04:33:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFF/swdlMXvmcFil7P3+Dk9HS6kLG13Qooz+l1CLX9ig2BomaF3UaDh7Zl2FEHIsbYjWtl9dw==
X-Received: by 2002:a05:620a:4108:b0:8b2:e617:5aa4 with SMTP id af79cd13be357-8c389408bdbmr2888767485a.44.1768307608184;
        Tue, 13 Jan 2026 04:33:28 -0800 (PST)
Received: from hackbox.lan ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8715952fc3sm635303166b.50.2026.01.13.04.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 04:33:27 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 14:33:05 +0200
Subject: [PATCH RFT 2/3] arm64: dts: qcom: glymur: Add USB related nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-dts-qcom-glymur-add-usb-support-v1-2-98d6d387df01@oss.qualcomm.com>
References: <20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com>
In-Reply-To: <20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=17864;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=MP54N74Y/1wWkI8uyhb5jMrihAPg8pkm3bNtAmrcSjY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpZjuQOdlbzhFcv6bUnfiR9m39v3PlB0AfN6j5M
 8egRoNl5K2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaWY7kAAKCRAbX0TJAJUV
 VlOWEACl/rRU5YrOD66g4UndrAIpCUvExC7uVI/UGLKI5ydeWgK8uNIK0W0gOoRoVuVcjWCZKg1
 0tDLeq7+xpbJpvI9cnuOfHoqjmytjpwfj6M+SWYFYL00lNBM/a2y1kh/DxH8v6aegSfNM7p1yWR
 IoMmBnnR2xn+uNOOiacNxTsLSVO9+JPitQO89Vj1a5sV/6pQcqht2xcgvir3oeWzyVH46zl9PLO
 TJGgYfCdNJsnEU7+AIHOsCL9NIvgSCORZYwgUoNGFz+d01g7sf3o5EkQVIzwsP4nA7EZjD0dbMs
 m1poPar3tFROg4dCpGVbC7zJja32IMWnfCyOwUXyB9VG9MvWS/t16KL1n3Xlf0z8eUGIubQBeCH
 Kh5J8Hn7y9MeFaEl63iFMdDxRyvdF/GKGbxY6l5H6X8pZUxgBGkdse8Y2Tt6EpsH1HF1tT99qi/
 OEfNOTwarxJELE3f8hVqtVitkEzhL27NZzQah9syzrFq3szbJnV+WollYeNjvJ8cM/RHZJD8fEU
 Bbj18tn3OzI8cqoH0WOyTZgSoYbEB3WDEXx+0Yd2vNk+OJglDCM7GCPpOe1uOULsbccesaY+Lzt
 iwCwabJOxfP1PjIV4uBvwNqkJBaRrWM3QsfMucZWx+32UKMhufJQLWFQssvbWiG7iGBKOyrF3u4
 A6uZBcu4vbWgssg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: KPa2k9WLo8jwqc8voIUrIXvp9kLIyTtX
X-Proofpoint-GUID: KPa2k9WLo8jwqc8voIUrIXvp9kLIyTtX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEwNiBTYWx0ZWRfX+kgx/AHkRv8I
 AgI4zjhDn+wvtdCsLUs5Kpep1+cF4Lp+xYf6SBZ4TdW/Q6jYNml/rRpbAUR1U3ZJohrbLrmu6yp
 kPrQfGBc6HRaj752jj+5OUxwMHRv6mxbJx2U1DRIb1/62yIZ9kZoxNLdN/WRmf+bchgRiBHqLPv
 Ka5f7QcPUh8TSq/3ojrSHDRnAmWaLXOuFILKSsNK42cmjiyUSmWy5drfzbmyhP8UACRj/+xWQsM
 2xh9wfl71G5q36x5uTlPWYyaQGGti/iRxKXfydN/K0JU2dClEW2ZCK6jRUeal1FTH8AEu1jjPv4
 FrxLipN/5PEGpwFO7kf6ccbAFZyk+v8lq5YgXN6pu6PpQhOHV/gQCt1n0WSfZY75mV/aheUt3/v
 vUiojp2diWkHFhK8aNwZrRP6sjWDdwQrwtP2LXwufrL94ElY5/WxFAiq0pPvuQHVAIn9StZETw5
 Wg/B+1YBWFY4xuo4CRg==
X-Authority-Analysis: v=2.4 cv=PvSergM3 c=1 sm=1 tr=0 ts=69663b99 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Sasm_VHLg3_W7jhM0QIA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130106

From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

The Glymur USB system contains 3 USB type C ports, 1 USB multiport
controller and a USB 2.0 only controller. This encompasses 5 SS USB QMP
PHYs (3 combo and 2 uni) and 6 M31 eUSB2 PHYs. All controllers are SNPS
DWC3 based, so describe them as flattened DWC3 QCOM nodes.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 663 ++++++++++++++++++++++++++++++++++-
 1 file changed, 658 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index eb042541cfe1..53b8ab7580bd 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -750,11 +750,11 @@ gcc: clock-controller@100000 {
 				 <0>,
 				 <0>,
 				 <0>,
-				 <0>,
-				 <0>,
-				 <0>,
-				 <0>,
-				 <0>,
+				 <&usb1_ss0_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
+				 <&usb1_ss1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
+				 <&usb1_ss2_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
+				 <&usb_mp_qmpphy0 QMP_USB43DP_USB3_PIPE_CLK>,
+				 <&usb_mp_qmpphy1 QMP_USB43DP_USB3_PIPE_CLK>,
 				 <0>,
 				 <0>,
 				 <0>,
@@ -2224,6 +2224,249 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			};
 		};
 
+		usb_mp_hsphy0: phy@fa1000 {
+			compatible = "qcom,glymur-m31-eusb2-phy",
+				     "qcom,sm8750-m31-eusb2-phy";
+
+			reg = <0 0x00fa1000 0 0x29c>;
+			#phy-cells = <0>;
+
+			clocks = <&tcsr TCSR_USB2_1_CLKREF_EN>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_HS0_MP_BCR>;
+
+			status = "disabled";
+		};
+
+		usb_mp_hsphy1: phy@fa2000  {
+			compatible = "qcom,glymur-m31-eusb2-phy",
+				     "qcom,sm8750-m31-eusb2-phy";
+
+			reg = <0 0x00fa2000 0 0x29c>;
+			#phy-cells = <0>;
+
+			clocks = <&tcsr TCSR_USB2_2_CLKREF_EN>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_HS1_MP_BCR>;
+
+			status = "disabled";
+		};
+
+		usb_mp_qmpphy0: phy@fa3000 {
+			compatible = "qcom,glymur-qmp-usb3-uni-phy";
+			reg = <0 0x00fa3000 0 0x2000>;
+
+			clocks = <&gcc GCC_USB3_MP_PHY_AUX_CLK>,
+				 <&tcsr TCSR_USB3_0_CLKREF_EN>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_MP_PHY_PIPE_0_CLK>;
+			clock-names = "aux",
+				      "clkref",
+				      "ref",
+				      "com_aux",
+				      "pipe";
+
+			power-domains = <&gcc GCC_USB3_MP_SS0_PHY_GDSC>;
+
+			resets = <&gcc GCC_USB3_MP_SS0_PHY_BCR>,
+				 <&gcc GCC_USB3UNIPHY_PHY_MP0_BCR>;
+			reset-names = "phy",
+				      "phy_phy";
+
+			clock-output-names = "usb3_uni_phy_0_pipe_clk_src";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_mp_qmpphy1: phy@fa5000 {
+			compatible = "qcom,glymur-qmp-usb3-uni-phy";
+			reg = <0 0x00fa5000 0 0x2000>;
+
+			clocks = <&gcc GCC_USB3_MP_PHY_AUX_CLK>,
+				 <&tcsr TCSR_USB3_1_CLKREF_EN>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_MP_PHY_PIPE_1_CLK>;
+			clock-names = "aux",
+				      "clkref",
+				      "ref",
+				      "com_aux",
+				      "pipe";
+
+			power-domains = <&gcc GCC_USB3_MP_SS1_PHY_GDSC>;
+
+			resets = <&gcc GCC_USB3_MP_SS1_PHY_BCR>,
+				 <&gcc GCC_USB3UNIPHY_PHY_MP1_BCR>;
+			reset-names = "phy",
+				      "phy_phy";
+
+			clock-output-names = "usb3_uni_phy_1_pipe_clk_src";
+
+			#clock-cells = <0>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb1_ss0_hsphy: phy@fd3000 {
+			compatible = "qcom,glymur-m31-eusb2-phy",
+				     "qcom,sm8750-m31-eusb2-phy";
+
+			reg = <0 0x00fd3000 0 0x29c>;
+			#phy-cells = <0>;
+
+			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+
+			status = "disabled";
+		};
+
+		usb1_ss0_qmpphy: phy@fd5000 {
+			compatible = "qcom,glymur-qmp-usb3-dp-phy";
+			reg = <0 0x00fd5000 0 0x8000>;
+
+			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "com_aux",
+				      "usb3_pipe";
+
+			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
+				 <&gcc GCC_USB3PHY_PHY_PRIM_BCR>;
+
+			reset-names = "phy",
+				      "common";
+
+			power-domains = <&gcc GCC_USB_0_PHY_GDSC>;
+
+			#clock-cells = <1>;
+			#phy-cells = <1>;
+
+			mode-switch;
+			orientation-switch;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb1_ss0_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb1_ss0_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb1_ss0_dwc3_ss>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb_dp_qmpphy_dp_in: endpoint {
+					};
+				};
+			};
+		};
+
+		usb1_ss1_hsphy: phy@fdd000  {
+			compatible = "qcom,glymur-m31-eusb2-phy",
+				     "qcom,sm8750-m31-eusb2-phy";
+
+			reg = <0 0x00fdd000 0 0x29c>;
+			#phy-cells = <0>;
+
+			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
+
+			status = "disabled";
+		};
+
+		usb1_ss1_qmpphy: phy@fde000 {
+			compatible = "qcom,glymur-qmp-usb3-dp-phy";
+			reg = <0 0x00fde000 0 0x8000>;
+
+			clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>,
+				 <&tcsr TCSR_USB4_1_CLKREF_EN>;
+			clock-names = "aux",
+				      "ref",
+				      "com_aux",
+				      "usb3_pipe",
+				      "clkref";
+
+			power-domains = <&gcc GCC_USB_1_PHY_GDSC>;
+
+			resets = <&gcc GCC_USB3_PHY_SEC_BCR>,
+				 <&gcc GCC_USB3PHY_PHY_SEC_BCR>;
+			reset-names = "phy",
+				      "common";
+
+			#clock-cells = <1>;
+			#phy-cells = <1>;
+
+			mode-switch;
+			orientation-switch;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb1_ss1_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb1_ss1_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb1_ss1_dwc3_ss>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb1_ss1_qmpphy_dp_in: endpoint {
+					};
+				};
+			};
+		};
+
+		usb_2_hsphy: phy@fa0000 {
+			compatible = "qcom,glymur-m31-eusb2-phy",
+				     "qcom,sm8750-m31-eusb2-phy";
+			reg = <0 0x00fa0000 0 0x154>;
+			#phy-cells = <0>;
+
+			clocks = <&tcsr TCSR_USB2_1_CLKREF_EN>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_USB20_HS_BCR>;
+
+			status = "disabled";
+		};
+
+
 		cnoc_main: interconnect@1500000 {
 			compatible = "qcom,glymur-cnoc-main";
 			reg = <0x0 0x01500000 0x0 0x17080>;
@@ -3164,6 +3407,416 @@ lpass_ag_noc: interconnect@7e40000 {
 			#interconnect-cells = <2>;
 		};
 
+		usb1_ss2_hsphy: phy@88e0000  {
+			compatible = "qcom,glymur-m31-eusb2-phy",
+				     "qcom,sm8750-m31-eusb2-phy";
+
+			reg = <0 0x088e0000 0 0x29c>;
+			#phy-cells = <0>;
+
+			clocks = <&tcsr TCSR_USB2_4_CLKREF_EN>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_TERT_BCR>;
+
+			status = "disabled";
+		};
+
+		usb1_ss2_qmpphy: phy@88e1000 {
+			compatible = "qcom,glymur-qmp-usb3-dp-phy";
+			reg = <0 0x088e1000 0 0x8000>;
+
+			clocks = <&gcc GCC_USB3_TERT_PHY_AUX_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_USB3_TERT_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_TERT_PHY_PIPE_CLK>,
+				 <&tcsr TCSR_USB4_2_CLKREF_EN>;
+			clock-names = "aux",
+				      "ref",
+				      "com_aux",
+				      "usb3_pipe",
+				      "clkref";
+
+			power-domains = <&gcc GCC_USB_2_PHY_GDSC>;
+
+			resets = <&gcc GCC_USB3_PHY_TERT_BCR>,
+				 <&gcc GCC_USB3PHY_PHY_TERT_BCR>;
+			reset-names = "phy",
+				      "common";
+
+			#clock-cells = <1>;
+			#phy-cells = <1>;
+
+			mode-switch;
+			orientation-switch;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb1_ss2_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb1_ss2_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb1_ss2_dwc3_ss>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb1_ss2_qmpphy_dp_in: endpoint {
+					};
+				};
+			};
+		};
+
+		usb1_ss0: usb@a600000 {
+			compatible = "qcom,glymur-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xfc100>;
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
+				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+				 <&gcc GCC_CFG_NOC_USB_ANOC_AHB_CLK>,
+				 <&gcc GCC_CFG_NOC_USB_ANOC_SOUTH_AHB_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi",
+				      "noc_aggr_north",
+				      "noc_aggr_south";
+
+			interrupts-extended = <&intc GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 90 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 60 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_EDGE_BOTH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+
+			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
+			resets = <&gcc GCC_USB30_PRIM_BCR>;
+
+			iommus = <&apps_smmu 0x1420 0x0>;
+			phys = <&usb1_ss0_hsphy>,
+			       <&usb1_ss0_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,usb2-lpm-disable;
+
+			usb-role-switch;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb1_ss0_dwc3_hs: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb1_ss0_dwc3_ss: endpoint {
+						remote-endpoint = <&usb1_ss0_qmpphy_usb_ss_in>;
+					};
+				};
+			};
+		};
+
+		usb1_ss1: usb@a800000 {
+			compatible = "qcom,glymur-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xfc100>;
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_SEC_AXI_CLK>,
+				 <&gcc GCC_USB30_SEC_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>,
+				 <&gcc GCC_USB30_SEC_SLEEP_CLK>,
+				 <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
+				 <&gcc GCC_CFG_NOC_USB_ANOC_AHB_CLK>,
+				 <&gcc GCC_CFG_NOC_USB_ANOC_SOUTH_AHB_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi",
+				      "noc_aggr_north",
+				      "noc_aggr_south";
+
+			interrupts-extended = <&intc GIC_SPI 875 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 88 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 87 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 76 IRQ_TYPE_EDGE_BOTH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+
+			resets = <&gcc GCC_USB30_SEC_BCR>;
+			power-domains = <&gcc GCC_USB30_SEC_GDSC>;
+
+			iommus = <&apps_smmu 0x1460 0x0>;
+
+			phys = <&usb1_ss1_hsphy>,
+			       <&usb1_ss1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,usb2-lpm-disable;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb1_ss1_dwc3_hs: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb1_ss1_dwc3_ss: endpoint {
+						remote-endpoint = <&usb1_ss1_qmpphy_usb_ss_in>;
+					};
+				};
+			};
+		};
+
+		usb1_ss2: usb@a000000 {
+			compatible = "qcom,glymur-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a000000 0 0xfc100>;
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_TERT_AXI_CLK>,
+				 <&gcc GCC_USB30_TERT_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_TERT_AXI_CLK>,
+				 <&gcc GCC_USB30_TERT_SLEEP_CLK>,
+				 <&gcc GCC_USB30_TERT_MOCK_UTMI_CLK>,
+				 <&gcc GCC_CFG_NOC_USB_ANOC_AHB_CLK>,
+				 <&gcc GCC_CFG_NOC_USB_ANOC_SOUTH_AHB_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi",
+				      "noc_aggr_north",
+				      "noc_aggr_south";
+
+			interrupts-extended = <&intc GIC_SPI 871 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 89 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 81 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 75 IRQ_TYPE_EDGE_BOTH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+
+			resets = <&gcc GCC_USB30_TERT_BCR>;
+			power-domains = <&gcc GCC_USB30_TERT_GDSC>;
+
+			iommus = <&apps_smmu 0x420 0x0>;
+
+			phys = <&usb1_ss2_hsphy>,
+			       <&usb1_ss2_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,usb2-lpm-disable;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb1_ss2_dwc3_hs: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb1_ss2_dwc3_ss: endpoint {
+						remote-endpoint = <&usb1_ss2_qmpphy_usb_ss_in>;
+					};
+				};
+			};
+		};
+
+		usb_2: usb@a2f8800 {
+			compatible = "qcom,glymur-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a200000 0 0xfc100>;
+
+			clocks = <&gcc GCC_CFG_NOC_USB2_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB20_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB2_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB20_SLEEP_CLK>,
+				 <&gcc GCC_USB20_MOCK_UTMI_CLK>,
+				 <&gcc GCC_CFG_NOC_USB_ANOC_AHB_CLK>,
+				 <&gcc GCC_CFG_NOC_USB_ANOC_SOUTH_AHB_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi",
+				      "noc_aggr_north",
+				      "noc_aggr_south";
+
+			assigned-clocks = <&gcc GCC_USB20_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB20_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <200000000>;
+
+			interrupts-extended = <&intc GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 92 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 57 IRQ_TYPE_EDGE_BOTH>,
+					      <&intc GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "hs_phy_irq";
+
+			resets = <&gcc GCC_USB20_PRIM_BCR>;
+
+			power-domains = <&gcc GCC_USB20_PRIM_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			iommus = <&apps_smmu 0x0ce0 0x0>;
+
+			interconnects = <&aggre3_noc MASTER_USB2 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_USB2 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "usb-ddr",
+					     "apps-usb";
+
+			phys = <&usb_2_hsphy>;
+			phy-names = "usb2-phy";
+
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+
+			dr_mode = "host";
+
+			maximum-speed = "high-speed";
+
+			status = "disabled";
+		};
+
+		usb_mp: usb@a400000 {
+			compatible = "qcom,glymur-dwc3-mp", "qcom,snps-dwc3";
+			reg = <0 0x0a400000 0 0xfc100>;
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_MP_AXI_CLK>,
+				 <&gcc GCC_USB30_MP_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_MP_AXI_CLK>,
+				 <&gcc GCC_USB30_MP_SLEEP_CLK>,
+				 <&gcc GCC_USB30_MP_MOCK_UTMI_CLK>,
+				 <&gcc GCC_CFG_NOC_USB_ANOC_AHB_CLK>,
+				 <&gcc GCC_CFG_NOC_USB_ANOC_SOUTH_AHB_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi",
+				      "noc_aggr_north",
+				      "noc_aggr_south";
+
+			interrupts-extended = <&intc GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 12 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 11 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 13 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 78 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 77 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event_1",
+					  "pwr_event_2",
+					  "hs_phy_1",
+					  "hs_phy_2",
+					  "dp_hs_phy_1",
+					  "dm_hs_phy_1",
+					  "dp_hs_phy_2",
+					  "dm_hs_phy_2",
+					  "ss_phy_1",
+					  "ss_phy_2";
+
+			resets = <&gcc GCC_USB30_MP_BCR>;
+			power-domains = <&gcc GCC_USB30_MP_GDSC>;
+
+			iommus = <&apps_smmu 0xda0 0x0>;
+
+			phys = <&usb_mp_hsphy0>,
+			       <&usb_mp_qmpphy0>,
+			       <&usb_mp_hsphy1>,
+			       <&usb_mp_qmpphy1>;
+			phy-names = "usb2-0",
+				    "usb3-0",
+				    "usb2-1",
+				    "usb3-1";
+
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,usb3_lpm_capable;
+			snps,dis_u3_susphy_quirk;
+			snps,usb2-lpm-disable;
+
+			dr_mode = "host";
+
+			status = "disabled";
+		};
+
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,glymur-dispcc";
 			reg = <0x0 0x0af00000 0x0 0x20000>;

-- 
2.48.1


