Return-Path: <linux-arm-msm+bounces-77074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 664CEBD7105
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 04:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B8BB4039A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 02:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4A9303CAC;
	Tue, 14 Oct 2025 02:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6LPHfoR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA5D188A3A
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 02:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760408501; cv=none; b=CKuuLg3FHetezFwIF1wpoDLTIarjGkGx4/PEGRjK2Majhw7WFXI11UC4xPCbmgNE8cW1zVe4Vw3+4PQtTl+stgAWkCau/6I5+B/VTfKTqbYZkBFmX8njIRDa2ucoUYtVMfAAt+3IdrUsHEOEmmGIcaH3PdKmr+1pjkU3OViJ2kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760408501; c=relaxed/simple;
	bh=Ae7W8ylf7yskGAGr17k7iA1R1IssvdnNrOpWDt4fPQo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dy1h0A+cEVDWn4qgjD0byY3mzwpTHY+39bklFT2VdX+fkWZwjoBUWqO0jJAOfliVFYzf/6gx1h3mLRi6Mq0R/7uKIjVOIRHx/9haJOP//jzhXWfq0m/fjaMFNKUDmkdCvd8mR+16ywEe4rhCGW+inveaFDEzWwlZHEnz+WAA9Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6LPHfoR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDF7B002501
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 02:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dxqm9YHyQv8
	DsGntyPgQBCU4KRODiPh5Hor3JotdLEc=; b=Q6LPHfoRQjs2k/MxCtIvlX/+rUU
	jmYKkQ93F82n2eTv3Y9gr632DjbXWRkbsiZ81Ah/5mELefU8rlY3n3KUr1DUMni1
	8jEk2O0SJqZHYZn1Ud28SWTRdhV/OUyivRqQHPNH6qhn6M3zAZKfY+nY9RLbk8yq
	86WiwedaoammWizXnHSQlSYLJd2je5T1pmN3FIeMKv/7bm9ti90YuLHK46gFWBlc
	Rtay4A5myBqkByV1UtHSVMsX5zN1kM8p4e/XVIMpPq1krfkLRdY6/O6s2kLMbESl
	gixGR6Rzky7/3ztn4nQq7ExbkpRkQs/JgqremaB/6Ugfm4mG4v+vpyQP7Hw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdk6t90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 02:21:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-339ee7532b9so24630626a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 19:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760408496; x=1761013296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxqm9YHyQv8DsGntyPgQBCU4KRODiPh5Hor3JotdLEc=;
        b=pzIct+aMds86jPVXn1E3RtQcrsPCFEQ7LplpCud5zfgpnVoK62Jqi+3cGdGQ8cBg5P
         6MJ2L6SvZ8pX37GTHqRh2Ed9I6r7DZ1Q9+iBfx6WMP/Pe8Sq75MYPMsCeQZ0wTS6PtW7
         zA+Bzwup0nY00SYtqDb0EF04pndJRIobx08PPay8MmsuNnmBctxy29ZTjZEWry9+d99T
         LAlHzBM5UtNPL4Rfs6PEZcqQyv+x/qh0EN7B9zHua2q+TGxL/gMaXGn+iz/tJYDfUXnv
         756HJuAeJs3x+P3j/ouBUd7Jy6utjKzHy+iM3b3+XMDQbgMhQI9zD5d0upWAfH+D+wSn
         YQuw==
X-Gm-Message-State: AOJu0Yxa9Peu6tEKNL20BErp4cybvD+VpT45QBFiJxIYW/p0+SYzw7Zk
	NE/DNWUbe16L54u+UCUlQZY2ufUNlj9rfgkZBXZUOzBJ9bqYHmeFSIAjVBPZTfksq5I3Q+jxFha
	gV7b89ytsa0TPOMH1n26Xzgt2AfZx3NjvZbipS+WKbT0TYGvLtDvldEw+wvfwmi3h8CNi
X-Gm-Gg: ASbGnctrVxpM7enFzqu6N0ji3u3a8WxHWZpHOqRwcnQfJ77FFS/roiwLuuG8zOpbNk0
	a1D6CZ4rWGdWP5dV/1oPU0RjZdaDi0GEW6vInTff7LnKQqe+WaYJmmYeQkMQnGJX+SrsMleQUjc
	ppUkLmURtSM/hjpPgVW3fAHNN3TqjS30oT2iRvTWAfFRX1O3vj7Zbf4HJQ7aND/agA55pqPd+en
	9mMNN7cueQBWzuK4a110fPXkR06uTkRKjUYeXAoWJw1otN3GzYeZcvOe3DIUUFjTSIBLjgqsONb
	k87YdOLXM7BBerjKBvR2rgK4JniQOftoHls9r+r0Xp0v5Uhs2xjq82FX6TKGnnibJQXVfyweixl
	ugA==
X-Received: by 2002:a17:90b:1d85:b0:335:28ee:eebe with SMTP id 98e67ed59e1d1-33b5138e625mr31183271a91.30.1760408495754;
        Mon, 13 Oct 2025 19:21:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUxtx81n+UOS5jbk7F3M3bEZ54aFdilQuayqKTZqOjON8VfI1/cz4wcoYndOlbd60bE4Tc5g==
X-Received: by 2002:a17:90b:1d85:b0:335:28ee:eebe with SMTP id 98e67ed59e1d1-33b5138e625mr31183222a91.30.1760408495161;
        Mon, 13 Oct 2025 19:21:35 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61aab6c1sm14006978a91.13.2025.10.13.19.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 19:21:34 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH 1/2] arm64: dts: qcom: x1e80100: Flatten usb controller nodes
Date: Tue, 14 Oct 2025 07:51:20 +0530
Message-Id: <20251014022121.1850871-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251014022121.1850871-1-krishna.kurapati@oss.qualcomm.com>
References: <20251014022121.1850871-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BYRG21v1oc7-YPaGUdOP8U1zc_uRa2X8
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68edb3b1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=Wkv4l7xtRGuRliXDwzwA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: BYRG21v1oc7-YPaGUdOP8U1zc_uRa2X8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX9upyTE7lqfjH
 7X1/dLp+JUKR1OKs417TpohBZKgFPUVSSQ4ZIRTY+wZnjbnHeQoMfDAxd3Lipjt08lGstpE6nSV
 R70aVxKRKtFUqRGzl4+upGSX32E1sZztFXuJv97sID4sBisoyFW+SsfYmq1SClTr8Ah5cW22Sk7
 93VOv9fFZs+r+mVOtRGqJE+D0GfgpN4Cyw85anAySrifE//koKxUuUsph8S3Yo6Sl2tyROUKfEn
 pPLKQW/iWrXjoF4FVrWwt9ot7QH2FUN7DJSPXaqQxGUErP+U1NskMeVGeO7pK3ybe7SEgRFt0O+
 jFusqxY1tD9rM/SDfQx5s1MUcy8CP9Ks0vejHyOz7YDtk9mXeNajp6MelDCUjc2l8o4P2rdZ3sF
 unXJPFBP1TIxZdu7iLqF1daog1mziw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_09,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

Flatten usb controller nodes and update to using latest bindings and
flattened driver approach.

Tests done are as follows:
1. On CRD, verified host mode operation of the 3 exposed Type-C ports
and enumeration of the Goodix fingerprint sensor on the multiport
usb controller.

2. Modified the dr_mode to otg for the first 3 controllers and
verified role switching and device mode operation on the 3 exposed
Type-C ports.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
DTBS check done for all affected platforms.

 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi   |  24 +-
 .../boot/dts/qcom/x1-asus-zenbook-a14.dtsi    |  12 +-
 arch/arm64/boot/dts/qcom/x1-crd.dtsi          |  18 +-
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi   |  18 +-
 .../boot/dts/qcom/x1-hp-omnibook-x14.dtsi     |  18 +-
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts  |  18 +-
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  18 +-
 .../dts/qcom/x1e80100-asus-vivobook-s15.dts   |  18 +-
 .../dts/qcom/x1e80100-dell-xps13-9345.dts     |  12 +-
 .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  18 +-
 .../dts/qcom/x1e80100-microsoft-romulus.dtsi  |  12 +-
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts     |  18 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi        | 323 ++++++++----------
 .../dts/qcom/x1p42100-lenovo-thinkbook-16.dts |  24 +-
 14 files changed, 218 insertions(+), 333 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
index 1aead50b8920..2cbab3cabc00 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
@@ -503,12 +503,10 @@ wake-n-pins {
 };
 
 &usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
 	dr_mode = "otg";
 	usb-role-switch;
+
+	status = "okay";
 };
 
 &usb_1_ss0_hsphy {
@@ -526,12 +524,10 @@ &usb_1_ss0_qmpphy {
 };
 
 &usb_1_ss1 {
-	status = "okay";
-};
-
-&usb_1_ss1_dwc3 {
 	dr_mode = "otg";
 	usb-role-switch;
+
+	status = "okay";
 };
 
 &usb_1_ss1_hsphy {
@@ -549,12 +545,10 @@ &usb_1_ss1_qmpphy {
 };
 
 &usb_1_ss2 {
-	status = "okay";
-};
-
-&usb_1_ss2_dwc3 {
 	dr_mode = "otg";
 	usb-role-switch;
+
+	status = "okay";
 };
 
 &usb_1_ss2_hsphy {
@@ -572,11 +566,9 @@ &usb_1_ss2_qmpphy {
 };
 
 &usb_2 {
-	status = "okay";
-};
-
-&usb_2_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_2_hsphy {
diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
index ee3c8c5e2c50..6414867a8161 100644
--- a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
@@ -1409,11 +1409,9 @@ &usb_1_ss0_qmpphy {
 };
 
 &usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss0_dwc3_hs {
@@ -1441,11 +1439,9 @@ &usb_1_ss1_qmpphy {
 };
 
 &usb_1_ss1 {
-	status = "okay";
-};
-
-&usb_1_ss1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss1_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index 3c9455fede5c..c06478afecf8 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1696,11 +1696,9 @@ &usb_1_ss0_qmpphy {
 };
 
 &usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss0_dwc3_hs {
@@ -1728,11 +1726,9 @@ &usb_1_ss1_qmpphy {
 };
 
 &usb_1_ss1 {
-	status = "okay";
-};
-
-&usb_1_ss1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss1_dwc3_hs {
@@ -1760,11 +1756,9 @@ &usb_1_ss2_qmpphy {
 };
 
 &usb_1_ss2 {
-	status = "okay";
-};
-
-&usb_1_ss2_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss2_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index cc64558ed5e6..c5b4bd7efb5d 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -1551,11 +1551,9 @@ bluetooth {
 };
 
 &usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss0_dwc3_hs {
@@ -1583,11 +1581,9 @@ &usb_1_ss0_qmpphy_out {
 };
 
 &usb_1_ss1 {
-	status = "okay";
-};
-
-&usb_1_ss1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss1_dwc3_hs {
@@ -1615,11 +1611,9 @@ &usb_1_ss1_qmpphy_out {
 };
 
 &usb_2 {
-	status = "okay";
-};
-
-&usb_2_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_2_hsphy {
diff --git a/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
index a4075434162a..16437139d336 100644
--- a/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
@@ -1471,11 +1471,9 @@ &usb_1_ss0_qmpphy {
 };
 
 &usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss0_dwc3_hs {
@@ -1503,11 +1501,9 @@ &usb_1_ss1_qmpphy {
 };
 
 &usb_1_ss1 {
-	status = "okay";
-};
-
-&usb_1_ss1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss1_dwc3_hs {
@@ -1519,12 +1515,10 @@ &usb_1_ss1_qmpphy_out {
 };
 
 &usb_mp {
-	status = "okay";
-};
-
-&usb_mp_dwc3 {
 	phys = <&usb_mp_hsphy0>, <&usb_mp_qmpphy0>;
 	phy-names = "usb2-0", "usb3-0";
+
+	status = "okay";
 };
 
 &usb_mp_hsphy0 {
diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
index bfc649d4b643..48a2fe8963ce 100644
--- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
+++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
@@ -1383,12 +1383,10 @@ &usb_1_ss0_qmpphy {
 };
 
 &usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
 	dr_mode = "otg";
 	usb-role-switch;
+
+	status = "okay";
 };
 
 &usb_1_ss0_dwc3_hs {
@@ -1416,11 +1414,9 @@ &usb_1_ss1_qmpphy {
 };
 
 &usb_1_ss1 {
-	status = "okay";
-};
-
-&usb_1_ss1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss1_dwc3_hs {
@@ -1448,11 +1444,9 @@ &usb_1_ss2_qmpphy {
 };
 
 &usb_1_ss2 {
-	status = "okay";
-};
-
-&usb_1_ss2_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss2_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 654cbce9d6ec..f2f41d9cf814 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -1501,11 +1501,9 @@ &usb_1_ss0_qmpphy {
 };
 
 &usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss0_dwc3_hs {
@@ -1533,11 +1531,9 @@ &usb_1_ss1_qmpphy {
 };
 
 &usb_1_ss1 {
-	status = "okay";
-};
-
-&usb_1_ss1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss1_dwc3_hs {
@@ -1549,11 +1545,9 @@ &usb_1_ss1_qmpphy_out {
 };
 
 &usb_2 {
-	status = "okay";
-};
-
-&usb_2_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_2_hsphy {
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index 0113d856b3ad..bd5bed98d10f 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -902,11 +902,9 @@ &usb_1_ss0_qmpphy {
 };
 
 &usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss0_dwc3_hs {
@@ -934,11 +932,9 @@ &usb_1_ss1_qmpphy {
 };
 
 &usb_1_ss1 {
-	status = "okay";
-};
-
-&usb_1_ss1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss1_dwc3_hs {
@@ -950,11 +946,9 @@ &usb_1_ss1_qmpphy_out {
 };
 
 &usb_2 {
-	status = "okay";
-};
-
-&usb_2_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_2_hsphy {
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index 58f8caaa7258..233a045d70ce 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -1291,11 +1291,9 @@ &usb_1_ss0_qmpphy {
 };
 
 &usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss0_dwc3_hs {
@@ -1323,11 +1321,9 @@ &usb_1_ss1_qmpphy {
 };
 
 &usb_1_ss1 {
-	status = "okay";
-};
-
-&usb_1_ss1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss1_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index e0642fe8343f..de40e0da7740 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -1569,11 +1569,9 @@ &usb_1_ss0_qmpphy {
 };
 
 &usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss0_dwc3_hs {
@@ -1601,11 +1599,9 @@ &usb_1_ss1_qmpphy {
 };
 
 &usb_1_ss1 {
-	status = "okay";
-};
-
-&usb_1_ss1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss1_dwc3_hs {
@@ -1633,11 +1629,9 @@ &usb_1_ss2_qmpphy {
 };
 
 &usb_1_ss2 {
-	status = "okay";
-};
-
-&usb_1_ss2_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss2_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index ed468b93ba50..ab88107f3bb5 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -1492,11 +1492,9 @@ &usb_1_ss0_qmpphy {
 };
 
 &usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss0_dwc3_hs {
@@ -1524,11 +1522,9 @@ &usb_1_ss1_qmpphy {
 };
 
 &usb_1_ss1 {
-	status = "okay";
-};
-
-&usb_1_ss1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss1_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 4a9b6d791e7f..c3ae0f2a03a3 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -1420,11 +1420,9 @@ &usb_1_ss0_qmpphy {
 };
 
 &usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss0_dwc3_hs {
@@ -1452,11 +1450,9 @@ &usb_1_ss1_qmpphy {
 };
 
 &usb_1_ss1 {
-	status = "okay";
-};
-
-&usb_1_ss1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss1_dwc3_hs {
@@ -1484,11 +1480,9 @@ &usb_1_ss2_qmpphy {
 };
 
 &usb_1_ss2 {
-	status = "okay";
-};
-
-&usb_1_ss2_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss2_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 51576d9c935d..56f787a8d821 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -4773,9 +4773,9 @@ usb_mp_qmpphy1: phy@88e5000 {
 			status = "disabled";
 		};
 
-		usb_1_ss2: usb@a0f8800 {
-			compatible = "qcom,x1e80100-dwc3", "qcom,dwc3";
-			reg = <0 0x0a0f8800 0 0x400>;
+		usb_1_ss2: usb@a000000 {
+			compatible = "qcom,x1e80100-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a000000 0 0xfc100>;
 
 			clocks = <&gcc GCC_CFG_NOC_USB3_TERT_AXI_CLK>,
 				 <&gcc GCC_USB30_TERT_MASTER_CLK>,
@@ -4801,15 +4801,24 @@ usb_1_ss2: usb@a0f8800 {
 			assigned-clock-rates = <19200000>,
 					       <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 58 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 57 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 10 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq",
 					  "ss_phy_irq";
 
+			iommus = <&apps_smmu 0x14a0 0x0>;
+
+			phys = <&usb_1_ss2_hsphy>,
+			       <&usb_1_ss2_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+
 			power-domains = <&gcc GCC_USB30_TERT_GDSC>;
 			required-opps = <&rpmhpd_opp_nom>;
 
@@ -4824,61 +4833,40 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			wakeup-source;
 
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
-
-			status = "disabled";
-
-			usb_1_ss2_dwc3: usb@a000000 {
-				compatible = "snps,dwc3";
-				reg = <0 0x0a000000 0 0xcd00>;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,usb3_lpm_capable;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
 
-				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
-
-				iommus = <&apps_smmu 0x14a0 0x0>;
-
-				phys = <&usb_1_ss2_hsphy>,
-				       <&usb_1_ss2_qmpphy QMP_USB43DP_USB3_PHY>;
-				phy-names = "usb2-phy",
-				            "usb3-phy";
-
-				snps,dis_u2_susphy_quirk;
-				snps,dis_enblslpm_quirk;
-				snps,usb3_lpm_capable;
-				snps,dis-u1-entry-quirk;
-				snps,dis-u2-entry-quirk;
+			dma-coherent;
 
-				dma-coherent;
+			status = "disabled";
 
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
 
-					port@0 {
-						reg = <0>;
+				port@0 {
+					reg = <0>;
 
-						usb_1_ss2_dwc3_hs: endpoint {
-						};
+					usb_1_ss2_dwc3_hs: endpoint {
 					};
+				};
 
-					port@1 {
-						reg = <1>;
+				port@1 {
+					reg = <1>;
 
-						usb_1_ss2_dwc3_ss: endpoint {
-							remote-endpoint = <&usb_1_ss2_qmpphy_usb_ss_in>;
-						};
+					usb_1_ss2_dwc3_ss: endpoint {
+						remote-endpoint = <&usb_1_ss2_qmpphy_usb_ss_in>;
 					};
 				};
 			};
 		};
 
-		usb_2: usb@a2f8800 {
-			compatible = "qcom,x1e80100-dwc3", "qcom,dwc3";
-			reg = <0 0x0a2f8800 0 0x400>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+		usb_2: usb@a200000 {
+			compatible = "qcom,x1e80100-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a200000 0 0xfc100>;
 
 			clocks = <&gcc GCC_CFG_NOC_USB2_PRIM_AXI_CLK>,
 				 <&gcc GCC_USB20_MASTER_CLK>,
@@ -4903,13 +4891,19 @@ usb_2: usb@a2f8800 {
 					  <&gcc GCC_USB20_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 50 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 49 IRQ_TYPE_EDGE_BOTH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq";
 
+			iommus = <&apps_smmu 0x14e0 0x0>;
+			phys = <&usb_2_hsphy>;
+			phy-names = "usb2-phy";
+
 			power-domains = <&gcc GCC_USB20_PRIM_GDSC>;
 			required-opps = <&rpmhpd_opp_nom>;
 
@@ -4924,38 +4918,30 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			wakeup-source;
 
-			status = "disabled";
+			maximum-speed = "high-speed";
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
 
-			usb_2_dwc3: usb@a200000 {
-				compatible = "snps,dwc3";
-				reg = <0 0x0a200000 0 0xcd00>;
-				interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
-				iommus = <&apps_smmu 0x14e0 0x0>;
-				phys = <&usb_2_hsphy>;
-				phy-names = "usb2-phy";
-				maximum-speed = "high-speed";
-				snps,dis-u1-entry-quirk;
-				snps,dis-u2-entry-quirk;
+			dma-coherent;
 
-				dma-coherent;
+			status = "disabled";
 
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
 
-					port@0 {
-						reg = <0>;
+				port@0 {
+					reg = <0>;
 
-						usb_2_dwc3_hs: endpoint {
-						};
+					usb_2_dwc3_hs: endpoint {
 					};
 				};
 			};
 		};
 
-		usb_mp: usb@a4f8800 {
-			compatible = "qcom,x1e80100-dwc3-mp", "qcom,dwc3";
-			reg = <0 0x0a4f8800 0 0x400>;
+		usb_mp: usb@a400000 {
+			compatible = "qcom,x1e80100-dwc3-mp", "qcom,snps-dwc3";
+			reg = <0 0x0a400000 0 0xfc100>;
 
 			clocks = <&gcc GCC_CFG_NOC_USB3_MP_AXI_CLK>,
 				 <&gcc GCC_USB30_MP_MASTER_CLK>,
@@ -4981,7 +4967,8 @@ usb_mp: usb@a4f8800 {
 			assigned-clock-rates = <19200000>,
 					       <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
@@ -4991,12 +4978,20 @@ usb_mp: usb@a4f8800 {
 					      <&pdc 53 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 55 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 56 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event_1", "pwr_event_2",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event_1", "pwr_event_2",
 					  "hs_phy_1",	 "hs_phy_2",
 					  "dp_hs_phy_1", "dm_hs_phy_1",
 					  "dp_hs_phy_2", "dm_hs_phy_2",
 					  "ss_phy_1",	 "ss_phy_2";
 
+			iommus = <&apps_smmu 0x1400 0x0>;
+
+			phys = <&usb_mp_hsphy0>, <&usb_mp_qmpphy0>,
+			       <&usb_mp_hsphy1>, <&usb_mp_qmpphy1>;
+			phy-names = "usb2-0", "usb3-0",
+				    "usb2-1", "usb3-1";
+
 			power-domains = <&gcc GCC_USB30_MP_GDSC>;
 			required-opps = <&rpmhpd_opp_nom>;
 
@@ -5011,39 +5006,23 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			wakeup-source;
 
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
-
-			status = "disabled";
+			dr_mode = "host";
 
-			usb_mp_dwc3: usb@a400000 {
-				compatible = "snps,dwc3";
-				reg = <0 0x0a400000 0 0xcd00>;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,usb3_lpm_capable;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
 
-				interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
-
-				iommus = <&apps_smmu 0x1400 0x0>;
-
-				phys = <&usb_mp_hsphy0>, <&usb_mp_qmpphy0>,
-				       <&usb_mp_hsphy1>, <&usb_mp_qmpphy1>;
-				phy-names = "usb2-0", "usb3-0",
-					    "usb2-1", "usb3-1";
-				dr_mode = "host";
+			dma-coherent;
 
-				snps,dis_u2_susphy_quirk;
-				snps,dis_enblslpm_quirk;
-				snps,usb3_lpm_capable;
-				snps,dis-u1-entry-quirk;
-				snps,dis-u2-entry-quirk;
+			status = "disabled";
 
-				dma-coherent;
-			};
 		};
 
-		usb_1_ss0: usb@a6f8800 {
-			compatible = "qcom,x1e80100-dwc3", "qcom,dwc3";
-			reg = <0 0x0a6f8800 0 0x400>;
+		usb_1_ss0: usb@a600000 {
+			compatible = "qcom,x1e80100-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xfc100>;
 
 			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
 				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
@@ -5069,74 +5048,65 @@ usb_1_ss0: usb@a6f8800 {
 			assigned-clock-rates = <19200000>,
 					       <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 61 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq",
 					  "ss_phy_irq";
 
+			iommus = <&apps_smmu 0x1420 0x0>;
+
+			phys = <&usb_1_ss0_hsphy>,
+			       <&usb_1_ss0_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+
 			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
 			required-opps = <&rpmhpd_opp_nom>;
 
 			resets = <&gcc GCC_USB30_PRIM_BCR>;
 
-			wakeup-source;
-
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
-
-			status = "disabled";
-
-			usb_1_ss0_dwc3: usb@a600000 {
-				compatible = "snps,dwc3";
-				reg = <0 0x0a600000 0 0xcd00>;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,usb3_lpm_capable;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
 
-				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
-
-				iommus = <&apps_smmu 0x1420 0x0>;
-
-				phys = <&usb_1_ss0_hsphy>,
-				       <&usb_1_ss0_qmpphy QMP_USB43DP_USB3_PHY>;
-				phy-names = "usb2-phy",
-					    "usb3-phy";
+			dma-coherent;
 
-				snps,dis_u2_susphy_quirk;
-				snps,dis_enblslpm_quirk;
-				snps,usb3_lpm_capable;
-				snps,dis-u1-entry-quirk;
-				snps,dis-u2-entry-quirk;
+			wakeup-source;
 
-				dma-coherent;
+			status = "disabled";
 
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
 
-					port@0 {
-						reg = <0>;
+				port@0 {
+					reg = <0>;
 
-						usb_1_ss0_dwc3_hs: endpoint {
-						};
+					usb_1_ss0_dwc3_hs: endpoint {
 					};
+				};
 
-					port@1 {
-						reg = <1>;
+				port@1 {
+					reg = <1>;
 
-						usb_1_ss0_dwc3_ss: endpoint {
-							remote-endpoint = <&usb_1_ss0_qmpphy_usb_ss_in>;
-						};
+					usb_1_ss0_dwc3_ss: endpoint {
+						remote-endpoint = <&usb_1_ss0_qmpphy_usb_ss_in>;
 					};
 				};
 			};
 		};
 
-		usb_1_ss1: usb@a8f8800 {
-			compatible = "qcom,x1e80100-dwc3", "qcom,dwc3";
-			reg = <0 0x0a8f8800 0 0x400>;
+		usb_1_ss1: usb@a800000 {
+			compatible = "qcom,x1e80100-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xfc100>;
 
 			clocks = <&gcc GCC_CFG_NOC_USB3_SEC_AXI_CLK>,
 				 <&gcc GCC_USB30_SEC_MASTER_CLK>,
@@ -5162,15 +5132,24 @@ usb_1_ss1: usb@a8f8800 {
 			assigned-clock-rates = <19200000>,
 					       <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 60 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 11 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 47 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq",
 					  "ss_phy_irq";
 
+			iommus = <&apps_smmu 0x1460 0x0>;
+
+			phys = <&usb_1_ss1_hsphy>,
+			       <&usb_1_ss1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+
 			power-domains = <&gcc GCC_USB30_SEC_GDSC>;
 			required-opps = <&rpmhpd_opp_nom>;
 
@@ -5183,52 +5162,34 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			interconnect-names = "usb-ddr",
 					     "apps-usb";
 
-			wakeup-source;
-
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
-
-			status = "disabled";
-
-			usb_1_ss1_dwc3: usb@a800000 {
-				compatible = "snps,dwc3";
-				reg = <0 0x0a800000 0 0xcd00>;
-
-				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,usb3_lpm_capable;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
 
-				iommus = <&apps_smmu 0x1460 0x0>;
-
-				phys = <&usb_1_ss1_hsphy>,
-				       <&usb_1_ss1_qmpphy QMP_USB43DP_USB3_PHY>;
-				phy-names = "usb2-phy",
-					    "usb3-phy";
+			dma-coherent;
 
-				snps,dis_u2_susphy_quirk;
-				snps,dis_enblslpm_quirk;
-				snps,usb3_lpm_capable;
-				snps,dis-u1-entry-quirk;
-				snps,dis-u2-entry-quirk;
+			wakeup-source;
 
-				dma-coherent;
+			status = "disabled";
 
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
 
-					port@0 {
-						reg = <0>;
+				port@0 {
+					reg = <0>;
 
-						usb_1_ss1_dwc3_hs: endpoint {
-						};
+					usb_1_ss1_dwc3_hs: endpoint {
 					};
+				};
 
-					port@1 {
-						reg = <1>;
+				port@1 {
+					reg = <1>;
 
-						usb_1_ss1_dwc3_ss: endpoint {
-							remote-endpoint = <&usb_1_ss1_qmpphy_usb_ss_in>;
-						};
+					usb_1_ss1_dwc3_ss: endpoint {
+						remote-endpoint = <&usb_1_ss1_qmpphy_usb_ss_in>;
 					};
 				};
 			};
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
index 1ac46cdc4386..23f2a8a8a565 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
@@ -1504,11 +1504,9 @@ &usb_1_ss0_qmpphy {
 };
 
 &usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss0_dwc3_hs {
@@ -1536,11 +1534,9 @@ &usb_1_ss1_qmpphy {
 };
 
 &usb_1_ss1 {
-	status = "okay";
-};
-
-&usb_1_ss1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_ss1_dwc3_hs {
@@ -1552,14 +1548,12 @@ &usb_1_ss1_qmpphy_out {
 };
 
 &usb_1_ss2 {
-	status = "okay";
-};
-
-&usb_1_ss2_dwc3 {
 	dr_mode = "host";
 	maximum-speed = "high-speed";
 	phys = <&usb_1_ss2_hsphy>;
 	phy-names = "usb2-phy";
+
+	status = "okay";
 };
 
 &usb_1_ss2_hsphy {
@@ -1572,11 +1566,9 @@ &usb_1_ss2_hsphy {
 };
 
 &usb_2 {
-	status = "okay";
-};
-
-&usb_2_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_2_hsphy {
-- 
2.34.1


