Return-Path: <linux-arm-msm+bounces-44959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97888A10030
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 06:08:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3F837A36EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 05:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA16523A0E8;
	Tue, 14 Jan 2025 05:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KGf7NYt4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5A5235BFC
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736831177; cv=none; b=BYO3NXS9K9OYMyLnQ4g1XsX6qQssmMazN6VxmOfYuHIMzOD4Cz8ej4+dHEoZVpY344XSAKwjljCwWkdaZYy4NaZju6mQYwcRLtlkAyorcvsMKX8L7+Dtn+iDQQ8HY60si2ENKnf4aS7z3QQi9vno7b9ru4chzg9kja/X3F1Meh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736831177; c=relaxed/simple;
	bh=QZCpZlu53quw6nL6TnKxy5fmS1nRzhqSoUP2GUKX9/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qjhrZDLw0eezVWU8D23qW3l5NhwKakWm2OAei3Uwda4CrJDMHVvpdw2JiQLtS6tm6s2F6Ybg6WVW660QunUdpOJV08nku4NG6Z7ikp45IKFPHWf4McrQJJBevi0iX0NJW0v2Z6mJEg6CY8Ce4f9DHlmnYeHoyp3E+MkJwuVtWCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KGf7NYt4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E41GQ0021780
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:06:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7sVaiMs2t/yghLl4ZXum6gfPzebES0AYVlGI7YtV98s=; b=KGf7NYt4oOGnRDHO
	wwN0i9O/t7QZJqhpGXfDqSvWdbX4t5XeO1SGPHQ/EoCZDXsrkIy8wnd0/GJ93jQz
	18XlEk4s7uCheAWgA/zsVVk7fYzCH8m8blH2XJrAUHG0ELjWuY7PTHtq2MkTrxrT
	EDy626Yfc0AFQHyATsOLhyhwSn6KLYdP92uJ3kQBXlb3+7oS2q0GCuenmVAditBX
	vO/T/kbf/NLsUFlz7KhPjX7FdBVi+Dm80/VljM09/cYWNL/pFNBMhlrmSwKSW1tL
	ulvORhyfpJmoPpy3POInnXExNsIqcvfe9duFocTaJf5uNMcj7A0Ge1V7up7GuVzh
	pgh6uA==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445gh603c8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:06:13 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-5f336936512so3569191eaf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 21:06:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736831166; x=1737435966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7sVaiMs2t/yghLl4ZXum6gfPzebES0AYVlGI7YtV98s=;
        b=e5dJvU3svVHE/NP6cnVk15C7dduG67Tvr7faR+Sg3d4sZ0xAT113JDHTTbKnezSrQh
         J+bN9PH1cwaU93nENct5lAcDTJ1uTF5KLY+PE6kJEDMvoqGsTRBPm/VX/wk8D8Fe2pZ1
         q4qaEnavEhYDXRT16+rTMohvCq4waVdXLI9WCoDDYorb5lgHbyOmtabaUmbEVVs+ne7F
         g0cSJF+esgbVBGxXHWxf4WOXsAnqACXr1r6n7kVDMqqW+bfgcKCsrkQp3XWhnNS/ivkV
         bp/ifmRRxdR4nHycp89pvzQTw7X0aVXkgshiA/zkp4X/o8QyIIKr6mHYcCmlseNNPJfG
         dBWw==
X-Gm-Message-State: AOJu0YwAWVt3pTJJVH343bcs+DSm3ozBhScQoZR6RD5YFx55O1XiIrvv
	wEmGIjt/L8z3adbNhUfa8JdaRtTwlyn76NDyaKD3BvR1P/oEzOcehUHR+xOeesQErj/LkujAZwf
	p10ETdwy+f4HvEea2iuCRq/jb5KqK4Wu23tavDMr5kj9nkM0QqHR4tUqTHtu3Uj8c
X-Gm-Gg: ASbGnctCTAXhjRNtrb02HPUNV6255oaf81kwyPIjA793q4VU1ZYLCBTFf75t4PTlH4G
	ICIP1gaiCOF5HvuoLJis90I7eyCYa9pAkY5462xiWLRSm5NA3wz6RqGDT9AjlyKP+XG05VWOXGB
	3Xk0viBx03Rl0hQgqUKIcKu3YQtpQ0J2ye3EGQmUV6/nUeoszDgsfjDcAMHu6daCIFJQdNP/Rww
	swUg8884gIxaBVY/WmedMsSLwV7VuB//AKf32BNDLN/vkSuCJU2uWBuAX1sCHRdXLgwfi8TMeKd
	7nwn7j+Pqka9Id2qKPiNrxcu/9pQ4yVCDfiKl6bYM3cPrCEz4zv+svXj
X-Received: by 2002:a05:6820:c92:b0:5f8:b916:2516 with SMTP id 006d021491bc7-5f8b91627fbmr3634059eaf.0.1736831166223;
        Mon, 13 Jan 2025 21:06:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmEHuVW5qi2sAI1oDKa1nMWAv2Gy9K/Nus/ICcutZpYln8LjviPaQBro2NNf9FeuBaY8drYA==
X-Received: by 2002:a05:6820:c92:b0:5f8:b916:2516 with SMTP id 006d021491bc7-5f8b91627fbmr3634048eaf.0.1736831165840;
        Mon, 13 Jan 2025 21:06:05 -0800 (PST)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f882756603sm4001750eaf.29.2025.01.13.21.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 21:06:05 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 13 Jan 2025 21:11:45 -0800
Subject: [PATCH v3 12/12] arm64: dts: qcom: sc8280x: Flatten the USB nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-dwc3-refactor-v3-12-d1722075df7b@oss.qualcomm.com>
References: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
In-Reply-To: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
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
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13628;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=QZCpZlu53quw6nL6TnKxy5fmS1nRzhqSoUP2GUKX9/c=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBnhfIVd3y2cF3CBIEhCUos5UwVC6LpTGBrNcMcM
 jJsSfDrykKJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ4XyFRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWzgA//Waq1cGSgv95hOttvPTD7GbCp6dOzDOe/tgWFHRu
 DH1v3Ci83L/ardMEoT0NmeZ74dGw6JTgwwiboJjDJlG2M77vEFH4mRjWarUeUR+CO9QK7AbrAG9
 V9QUrItL2bVZkULHRth8qmbnK9+9jdsFL3lRN8bkRA5RoUCOPlBx7trVY+/jQ4RHfurnTUQaHMc
 GRIX8c5Zd3Gsf3gdpimu6w4TV2UyRplL60Wlb4VRSoIjsPqi8F9RaqzQfx59Xr0eCCcyMI3cwyC
 2jN6APDFKj1QipC/VrmIRiSTOH583/ltUs231+PuAqTcRiSARHlqh0zCAqMmaR6nl214U3IenR8
 3SrIZSvS/iqE79EdS7dscCt9Q4lacUHdJ5pTCdyk+gokEzblLFPbEGvIRUoS1ew/rb5fkLtufr2
 YX6Wd4yLMxEoe8LAU7NM4zkggAMQ2noC0CXTTqTPZUMlTPaFsoY7AWNPnkiCcejavNiffYh8Gtf
 79mPjzL4C0Aad6l7ztAvxXybEMcZkHYhzCe3wjULdlN5DTBzNIsuQ+ewfkWfFhLlQaZWTdO0eXX
 h70ws80mOwPWRaIUt9bRo/jxUO8aKoFWJtslKlTXUhzduW6ITTF+krYsstD76mkPZfecQm6eHW3
 db6yaB8AskzXOIfcTCoY29c9QG7qNTv4x5bACIVtOcFo=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: wrUdbD5cKw49YchyIzVvIqhE3zAcqSYo
X-Proofpoint-GUID: wrUdbD5cKw49YchyIzVvIqhE3zAcqSYo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501140040

Transition the three USB controllers found in sc8280xp to the newly
introduced, flattened representation of the Qualcomm USB block, i.e.
qcom,snps-dwc3, to show the end result.

The reg and interrupts properties from the usb child node are merged
with their counterpart in the outer node, remaining properties and child
nodes are simply moved.

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
index 2fd1dafe63ce..3d84cbf5af31 100644
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
index 177b9dad6ff7..7be803fb7cbe 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
@@ -466,11 +466,8 @@ &ufs_mem_phy {
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
index 75adaa19d1c3..05fe5793f1f1 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -795,11 +795,9 @@ &ufs_mem_phy {
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
@@ -832,11 +830,9 @@ &usb_0_qmpphy_out {
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
index 09b95f89ee58..300c7dc999a4 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
@@ -997,11 +997,8 @@ bluetooth {
 };
 
 &usb_0 {
-	status = "okay";
-};
-
-&usb_0_dwc3 {
 	dr_mode = "host";
+	status = "okay";
 };
 
 &usb_0_hsphy {
@@ -1026,11 +1023,8 @@ &usb_0_qmpphy_dp_in {
 };
 
 &usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
 	dr_mode = "host";
+	status = "okay";
 };
 
 &usb_1_hsphy {
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index f3190f408f4b..1b9501cc82f4 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -1343,11 +1343,9 @@ bluetooth {
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
@@ -1380,11 +1378,8 @@ &usb_0_qmpphy_out {
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
index ae5daeac8fe2..82672f441ea2 100644
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
index fa9d94105052..eeb69cfd4422 100644
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
index 01501acb1790..3dea86b0e13d 100644
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
+			reg = <0 0x0a600000 0 0x20000>;
 
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
2.45.2


