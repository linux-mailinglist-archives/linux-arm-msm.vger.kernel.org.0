Return-Path: <linux-arm-msm+bounces-51819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A4DA67CB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 20:07:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC4C519C39B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 19:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32485214A89;
	Tue, 18 Mar 2025 19:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hF3zmzBH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E58214232
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 19:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742324728; cv=none; b=HOMXEr1o+FdQGva8G8jcf4uMnoH4jhiC8mx89ozttrsP5zRaSZDquw3lor9GmXKvliYbSgaLI1LqcF83rP5Komb9J95JnWb4PROGe+TtMSzv1shPrViQZjUez9hYkBIIGhRuS0pXN09fQfC9ux9c3o4TzoHs3UlMC8b1sX9EAaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742324728; c=relaxed/simple;
	bh=sLxeEtD5KdN/Fv/iIWiSNNJC3gbOXhgI4IPGBPoYGf4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O2wjBh9+HNJK74SXdV49i4jDijGc7ZfJJOXMoptijXaYYaX+eA6AvL05H/mnVkH+roeusS1fyekZmP2zau+wjg00K1CvskUvCsqNnhNm8TNfCt4jLGcd/KeQlqAzAHbw8oN+IHWkvkFmMi3bpVLtVUixLi00PRmWRFz5+Ry+dlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hF3zmzBH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IHs3qG014864
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 19:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J6uQd0OkZNwJTPgyOmvaqcV8zTcij5kAUFzA7Gkr9es=; b=hF3zmzBHb9MF30/+
	5LjI1oEDGDiCnUbO464Q6N7JkmSVN94MFR7asChcSJ1XDlIplBdB2cpkxP1yhWnb
	wfv+pFuAwu8OnYC9jPFfb3sFZTsV8xaTGjM3eRqo/VDZo6EjSEvWCSAQsBKgggV/
	Kghbe/zaFS1CCMpwFw0XunGDsM9A72UYth2xePNqT/nHzFizOfPE/QWpBL4pXVBQ
	5tvgwEJcpmGC883L7KXgcwxJjua8o8EgBNdFZBSLZX9YM2t4GaXEd4fJR9h0RVbq
	T7XdTSLp9H7wUnYyWUcbD+KWojsqTO4uV7M+Bt+8aGIROIJXMeqpPKrnxbmTaXdY
	AfWb6A==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45fdmwr5th-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 19:05:20 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3fa52ae463aso5282944b6e.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 12:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742324719; x=1742929519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6uQd0OkZNwJTPgyOmvaqcV8zTcij5kAUFzA7Gkr9es=;
        b=vtuUrBY3LTz2jWTzHSLk5pTqQ3KgkxFCkl+bDi4LFvIYZIwPgq39vJ8QpXXi+z/xOg
         4AZevfaFiJ+fQSBGFBl/7ngYvorWzBGijLzYItP13DwAKArEV/UX1cXcSSNOyyApl6DA
         KnXBtqemsEwka0I+sLr8l+819nzBYIOsPK8WrosceMUKCmn8lQi/h5ire4U0AivuABGS
         FF6gkN9jbY4WLr5INikh6PIfxTutYvUOeksvKY8wiWK0qkOQgZMgYyy21tdbirtuXjLd
         4CQHU9HA65b+YjuWP0z2IHK9cjyFhbStb6nf8T8xoEKdHnPdVQ8WtsQc1MI8jHfwuShe
         tl7Q==
X-Gm-Message-State: AOJu0YyOnn7/U8OsbUpoVDiZvxCa2k/qrLCtvfuF1BfN9sgCI/QTsp45
	weaQws15AdLj3kR33JhLvBJPAf0LYdDkeZevu/wT63L0NfVVOJ+qAr3HA59xvNvivmzif3KxNMf
	OEV1+zBc5BB1iec9TOHJhT00rCixjartNssj2/J3NrjxzFAJWuUHZVc/Jk17aDs/t+ZRx4Lr+
X-Gm-Gg: ASbGncvBc72Gmnm9MkUEP+gV0QNbSqBt6dlFNiSUYQCHyy1nkW0wERJ4Jw3SJUCm+B8
	onMWri1dfe1b8Ie5kPbXN0mE/kVdqQv1Iw40CUIZPw2nXpCHdAeGlvparnq/c/qH1HrQRJINrHe
	rtpiTHhJ1po0YVpxiw9pQtUIrtkwi2dDkZxi18HqeHH0yY+b2Yzo8GybtZCDr8tYvIYVoJAhj6d
	mcQaYpfCYbJbl+6/zNtA/3wGTkC9pgLc+EUgDbEOphDrR9Vsa+GjeraM2/IrZtelkKmE0Uz25FJ
	k528lPc+lEHjozlgwjfGl/NGaUdEPN/5M8pXbvTp2TqIze4/BKqdYK00Kse1WJnJEVB1NB09fxA
	6zReDvZxwcN2FEs8=
X-Received: by 2002:a05:6808:244e:b0:3f8:95cc:3d35 with SMTP id 5614622812f47-3fdf06470d5mr7986138b6e.37.1742324718887;
        Tue, 18 Mar 2025 12:05:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9RwwS3lxuV+oqVVP5738VEKq+iMo5mGWNjBhkcxPvwxZYna17cQsmaAyGa8O4NEqBHMfBlA==
X-Received: by 2002:a05:6808:244e:b0:3f8:95cc:3d35 with SMTP id 5614622812f47-3fdf06470d5mr7986093b6e.37.1742324718469;
        Tue, 18 Mar 2025 12:05:18 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3fcd403b065sm2264273b6e.4.2025.03.18.12.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 12:05:17 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 14:05:07 -0500
Subject: [PATCH v5 7/7] arm64: dts: qcom: sc8280x: Flatten the USB nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-dwc3-refactor-v5-7-90ea6e5b3ba4@oss.qualcomm.com>
References: <20250318-dwc3-refactor-v5-0-90ea6e5b3ba4@oss.qualcomm.com>
In-Reply-To: <20250318-dwc3-refactor-v5-0-90ea6e5b3ba4@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Saravana Kannan <saravanak@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14141;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=sLxeEtD5KdN/Fv/iIWiSNNJC3gbOXhgI4IPGBPoYGf4=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBn2cPktSWx/Y5SmgLPt0FRYJfIOetOU/S5hmV/u
 nvj+WWUPbOJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ9nD5BUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVEwxAAlccuZQxDZsO8jAxrrrHGk5Kno5y4VuGdXBi/MTL
 98fpe/d9e2NAUfASCSqUkEZNSn706deU6vOT0Z6gNJ6adJE9JhEqJLUjsJ/G1FsbAY1pmpN7Qy7
 BD4XTMTOCzHrNniQiGZFG/rvb9AWAlGhqx0cjr+wsxosZ/oKomBehDHv1nySYZtAEzzf6HP6WVM
 XiE2kbPUGihSYEelIp6YyQXKnTvXIDgb6qK5i5F/643VWr9S1t0uI4Xu5lg5K2LDds9Kqr0YgKQ
 lqaJp2/YtQtqarUUGU2ga+Cb40jF5+U2ohyJ87cpD6ClTJBp6ZkwzMGlCEZuRTedAN05omYIQBm
 furcBdLucaROQHXmcVFZLA/+MN2kJGeS3R+FCB6ITDeZfZ+IjAWS7HiXZSOJMi1hX4/iv2/+83t
 s6EDICx746cKkZ3n8o9cwEK4uXt8aTEJbo8AZ3hwID6RB9aIL3jalQCgyD3mi1iIrw/uqG5bZo4
 XPS9KIEMrKiRc79shbKpHBGFkr+moay9KKxLKXJI2phr+ZKi3iqbI5xBvgihaBwbkZDbJRB0GSE
 BlwkdNAp88isjhGtVY89FLcMlhGjFJ0DBHHF5vAA9DeyiwJWzbI4pyxBa6xBfFff/1sF4GJIsTl
 xhX4veV3oYln+1XMpXI8ACrzOuT/eNOR2UTQBxYvDzsk=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: sZbuucvXo9haTtVbBjldQKq6JlJVaOPL
X-Authority-Analysis: v=2.4 cv=ReKQC0tv c=1 sm=1 tr=0 ts=67d9c3f0 cx=c_pps a=4ztaESFFfuz8Af0l9swBwA==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=4tWh1G48NiluqMR1ZxwA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: sZbuucvXo9haTtVbBjldQKq6JlJVaOPL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_08,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180137

Transition the three USB controllers found in sc8280xp to the newly
introduced, flattened representation of the Qualcomm USB block, i.e.
qcom,snps-dwc3, to show the end result.

The reg and interrupts properties from the usb child node are merged
with their counterpart in the outer node, remaining properties and child
nodes are simply moved.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts           |  12 +-
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts          |   5 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |  12 +-
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      |  10 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  11 +-
 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    |  10 +-
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts |  18 +--
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 157 ++++++++++-----------
 8 files changed, 95 insertions(+), 140 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
index 2fd1dafe63ce7a4f409d19946b9f10ffe324fba3..3d84cbf5af3181c51853ed3a05f1fd9dd47d113b 100644
--- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
@@ -631,12 +631,10 @@ &ufs_card_phy {
 };
 
 &usb_0 {
-	status = "okay";
-};
-
-&usb_0_dwc3 {
 	/* TODO: Define USB-C connector properly */
 	dr_mode = "peripheral";
+
+	status = "okay";
 };
 
 &usb_0_hsphy {
@@ -655,12 +653,10 @@ &usb_0_qmpphy {
 };
 
 &usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
 	/* TODO: Define USB-C connector properly */
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_hsphy {
diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
index 11663cf81e45881d74aa58104b8e36b1189cede0..e794f45ce841f0bb041ee3732d561b2ec49eeb35 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
@@ -464,11 +464,8 @@ &ufs_mem_phy {
 };
 
 &usb_0 {
-	status = "okay";
-};
-
-&usb_0_dwc3 {
 	dr_mode = "peripheral";
+	status = "okay";
 };
 
 &usb_0_hsphy {
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index c4a5828be9353de0e4215b71a78ed5ca8e4b6b8a..46d11e8261e21cca99e7c01aaacc62182a97ef56 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -809,11 +809,9 @@ &ufs_mem_phy {
 };
 
 &usb_0 {
-	status = "okay";
-};
-
-&usb_0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_0_dwc3_hs {
@@ -846,11 +844,9 @@ &usb_0_qmpphy_out {
 };
 
 &usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
index 1667c7157057825e92c6103c9d8fe03dbf1d2b4c..10fcf85c0d94a42de7181f7982732e428fbcb7c9 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
@@ -1123,11 +1123,8 @@ bluetooth {
 };
 
 &usb_0 {
-	status = "okay";
-};
-
-&usb_0_dwc3 {
 	dr_mode = "host";
+	status = "okay";
 };
 
 &usb_0_dwc3_hs {
@@ -1160,11 +1157,8 @@ &usb_0_qmpphy_out {
 };
 
 &usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
 	dr_mode = "host";
+	status = "okay";
 };
 
 &usb_1_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index d36fc1ebe50e8baf73e21bd571f716e0152aa624..20c3b2f7231a1df14fe83ef548ebe48e9437b7f9 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -1329,11 +1329,9 @@ bluetooth {
 };
 
 &usb_0 {
-	status = "okay";
-};
-
-&usb_0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_0_dwc3_hs {
@@ -1366,11 +1364,8 @@ &usb_0_qmpphy_out {
 };
 
 &usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
 	dr_mode = "host";
+	status = "okay";
 };
 
 &usb_1_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index d00889fa6f0bac01d326dca9801c66a508ff1d67..105463070e314a2e8ce8e255a013f56f09c4b425 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -749,11 +749,8 @@ embedded-controller {
 };
 
 &usb_0 {
-	status = "okay";
-};
-
-&usb_0_dwc3 {
 	dr_mode = "host";
+	status = "okay";
 };
 
 &usb_0_dwc3_hs {
@@ -786,11 +783,8 @@ &usb_0_qmpphy_out {
 };
 
 &usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
 	dr_mode = "host";
+	status = "okay";
 };
 
 &usb_1_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
index 812251324002b50f3b48845b6c244f692d42b9b2..cb5baf50cef216ab2fb19fad3c58c999a68237fe 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
@@ -982,11 +982,9 @@ bluetooth {
 };
 
 &usb_0 {
-	status = "okay";
-};
-
-&usb_0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_0_dwc3_hs {
@@ -1019,11 +1017,9 @@ &usb_0_qmpphy_out {
 };
 
 &usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_dwc3_hs {
@@ -1059,12 +1055,10 @@ &usb_2 {
 	pinctrl-0 = <&usb2_en_state>;
 	pinctrl-names = "default";
 
-	status = "okay";
-};
-
-&usb_2_dwc3 {
 	phys = <&usb_2_hsphy0>, <&usb_2_qmpphy0>;
 	phy-names = "usb2-0", "usb3-0";
+
+	status = "okay";
 };
 
 &usb_2_hsphy0 {
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index f57c23c244b6bb8a5502493553bbd17372e57b0c..cfc61d2a0285da15ddf28db50a14d088adc684d7 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -3457,12 +3457,9 @@ system-cache-controller@9200000 {
 			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		usb_2: usb@a4f8800 {
-			compatible = "qcom,sc8280xp-dwc3-mp", "qcom,dwc3";
-			reg = <0 0x0a4f8800 0 0x400>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+		usb_2: usb@a400000 {
+			compatible = "qcom,sc8280xp-dwc3-mp", "qcom,snps-dwc3";
+			reg = <0 0x0a400000 0 0x10000>;
 
 			clocks = <&gcc GCC_CFG_NOC_USB3_MP_AXI_CLK>,
 				 <&gcc GCC_USB30_MP_MASTER_CLK>,
@@ -3480,7 +3477,8 @@ usb_2: usb@a4f8800 {
 					  <&gcc GCC_USB30_MP_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 857 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 856 IRQ_TYPE_LEVEL_HIGH>,
@@ -3499,7 +3497,8 @@ usb_2: usb@a4f8800 {
 					      <&pdc 16 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
 
-			interrupt-names = "pwr_event_1", "pwr_event_2",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event_1", "pwr_event_2",
 					  "pwr_event_3", "pwr_event_4",
 					  "hs_phy_1",	 "hs_phy_2",
 					  "hs_phy_3",	 "hs_phy_4",
@@ -3509,6 +3508,7 @@ usb_2: usb@a4f8800 {
 					  "dp_hs_phy_4", "dm_hs_phy_4",
 					  "ss_phy_1",	 "ss_phy_2";
 
+			iommus = <&apps_smmu 0x800 0x0>;
 			power-domains = <&gcc USB30_MP_GDSC>;
 			required-opps = <&rpmhpd_opp_nom>;
 
@@ -3518,35 +3518,28 @@ usb_2: usb@a4f8800 {
 					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_MP 0>;
 			interconnect-names = "usb-ddr", "apps-usb";
 
+			phys = <&usb_2_hsphy0>, <&usb_2_qmpphy0>,
+			       <&usb_2_hsphy1>, <&usb_2_qmpphy1>,
+			       <&usb_2_hsphy2>,
+			       <&usb_2_hsphy3>;
+			phy-names = "usb2-0", "usb3-0",
+				    "usb2-1", "usb3-1",
+				    "usb2-2",
+				    "usb2-3";
+
 			wakeup-source;
 
+			dr_mode = "host";
+
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+
 			status = "disabled";
+		};
 
-			usb_2_dwc3: usb@a400000 {
-				compatible = "snps,dwc3";
-				reg = <0 0x0a400000 0 0xcd00>;
-				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
-				iommus = <&apps_smmu 0x800 0x0>;
-				phys = <&usb_2_hsphy0>, <&usb_2_qmpphy0>,
-				       <&usb_2_hsphy1>, <&usb_2_qmpphy1>,
-				       <&usb_2_hsphy2>,
-				       <&usb_2_hsphy3>;
-				phy-names = "usb2-0", "usb3-0",
-					    "usb2-1", "usb3-1",
-					    "usb2-2",
-					    "usb2-3";
-				dr_mode = "host";
-				snps,dis-u1-entry-quirk;
-				snps,dis-u2-entry-quirk;
-			};
-		};
-
-		usb_0: usb@a6f8800 {
-			compatible = "qcom,sc8280xp-dwc3", "qcom,dwc3";
-			reg = <0 0x0a6f8800 0 0x400>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+		usb_0: usb@a600000 {
+			compatible = "qcom,sc8280xp-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0x10000>;
 
 			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
 				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
@@ -3564,17 +3557,20 @@ usb_0: usb@a6f8800 {
 					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 804 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 804 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 805 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 138 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "hs_phy_irq",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq",
 					  "ss_phy_irq";
 
+			iommus = <&apps_smmu 0x820 0x0>;
 			power-domains = <&gcc USB30_PRIM_GDSC>;
 			required-opps = <&rpmhpd_opp_nom>;
 
@@ -3584,45 +3580,40 @@ usb_0: usb@a6f8800 {
 					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_0 0>;
 			interconnect-names = "usb-ddr", "apps-usb";
 
+			phys = <&usb_0_hsphy>, <&usb_0_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy", "usb3-phy";
+
 			wakeup-source;
 
-			status = "disabled";
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
 
-			usb_0_dwc3: usb@a600000 {
-				compatible = "snps,dwc3";
-				reg = <0 0x0a600000 0 0xcd00>;
-				interrupts = <GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>;
-				iommus = <&apps_smmu 0x820 0x0>;
-				phys = <&usb_0_hsphy>, <&usb_0_qmpphy QMP_USB43DP_USB3_PHY>;
-				phy-names = "usb2-phy", "usb3-phy";
-				snps,dis-u1-entry-quirk;
-				snps,dis-u2-entry-quirk;
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
 
-						usb_0_dwc3_hs: endpoint {
-						};
+					usb_0_dwc3_hs: endpoint {
 					};
+				};
 
-					port@1 {
-						reg = <1>;
+				port@1 {
+					reg = <1>;
 
-						usb_0_dwc3_ss: endpoint {
-							remote-endpoint = <&usb_0_qmpphy_usb_ss_in>;
-						};
+					usb_0_dwc3_ss: endpoint {
+						remote-endpoint = <&usb_0_qmpphy_usb_ss_in>;
 					};
 				};
 			};
 		};
 
-		usb_1: usb@a8f8800 {
-			compatible = "qcom,sc8280xp-dwc3", "qcom,dwc3";
-			reg = <0 0x0a8f8800 0 0x400>;
+		usb_1: usb@a800000 {
+			compatible = "qcom,sc8280xp-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0x10000>;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
@@ -3643,17 +3634,20 @@ usb_1: usb@a8f8800 {
 					  <&gcc GCC_USB30_SEC_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 810 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 790 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 136 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "hs_phy_irq",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq",
 					  "ss_phy_irq";
 
+			iommus = <&apps_smmu 0x860 0x0>;
 			power-domains = <&gcc USB30_SEC_GDSC>;
 			required-opps = <&rpmhpd_opp_nom>;
 
@@ -3663,37 +3657,32 @@ usb_1: usb@a8f8800 {
 					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_1 0>;
 			interconnect-names = "usb-ddr", "apps-usb";
 
+			phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy", "usb3-phy";
+
 			wakeup-source;
 
-			status = "disabled";
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
 
-			usb_1_dwc3: usb@a800000 {
-				compatible = "snps,dwc3";
-				reg = <0 0x0a800000 0 0xcd00>;
-				interrupts = <GIC_SPI 810 IRQ_TYPE_LEVEL_HIGH>;
-				iommus = <&apps_smmu 0x860 0x0>;
-				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
-				phy-names = "usb2-phy", "usb3-phy";
-				snps,dis-u1-entry-quirk;
-				snps,dis-u2-entry-quirk;
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
 
-						usb_1_dwc3_hs: endpoint {
-						};
+					usb_1_dwc3_hs: endpoint {
 					};
+				};
 
-					port@1 {
-						reg = <1>;
+				port@1 {
+					reg = <1>;
 
-						usb_1_dwc3_ss: endpoint {
-							remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
-						};
+					usb_1_dwc3_ss: endpoint {
+						remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
 					};
 				};
 			};

-- 
2.48.1


