Return-Path: <linux-arm-msm+bounces-21137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DFA8D4FF3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 18:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89CC5282F5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 16:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403693D963;
	Thu, 30 May 2024 16:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pH8RIvrM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE1F22EE4
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 16:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717086961; cv=none; b=h5ywPZsvrY+c6scmKEslf/QOdcUqDlO4V2v2LqTxsDm7L7c5khFLx42XrzAJUrZun/+0chmbMvulLtkRx79x4MLO6nvCYY9wn1lwVi198nHWZdbNy6D+7SRqAhtE77/HuatQm6i6TPdyt1Aes5F5Bup6ojFyLL5QiyKqMa3eZcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717086961; c=relaxed/simple;
	bh=6HntS71rHp1CBZeIhiK7csmrNdwGhdAijMWT15I8h6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UgM/aAL4CLsRtimqAEIJIq24v8FEBS694HEbGbvzOMCVLMACwWjSm6hL9fjZS9XOYGxw9zgIXhau6syQchCn8nE1yzWCbffLZo7hpPkoy44Vu1iQ9Ze26DseCOEAC0WUGqBjmlcoa95B6JLk3X+vUgCt9XuaoPxb3yYXbK7C3yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pH8RIvrM; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57a30b3a6cbso113799a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 09:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717086956; x=1717691756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LVNBbeVZBvTq8FFnr5SMvxjl63WbZpKZEJu2+F+OFfM=;
        b=pH8RIvrMFZaE8iLBBEiltfEHVNSBrHJQN9Yf4Z6wVbX/jsXsstgCTERRRBEx0jCcaV
         j+WUEymy4v7ybIaKjMmsa6oOWWpWG04Eca8vEt5O9j+mva7zQgTHs0hEw0prxTJ6C+9Y
         296MU1kep5+AO9EPIDREGeflojCvOGVozMqVyhemPmYSHBvpjYxKmJEmBXSSEh1WjmH4
         ZPQkI3yVHNP/yriZw1YSP30loDS4nMpY+Knax5coFT3AXHvaJWDX5YzDSr39q1ckjsEV
         RxB+Tc8MrV0SAp7BKszNpR3TcZLwLtv41bIpHX9A0jkurR1rd45UuH0fZeGT670A9HDb
         eJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717086956; x=1717691756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LVNBbeVZBvTq8FFnr5SMvxjl63WbZpKZEJu2+F+OFfM=;
        b=kuP29zx9zAi48NSqiGNEEpzZK7+SDzYr6NbPu8h/MFxa94i3nEMJ6ZWa0wet+xCqF1
         DbQTDft6rOFFfvNU5C8ysU8IdQMMYjXVncFczSNgDued8hKmOZONGh7N+J0UxoAPY+vh
         l6HB2L+XXM2X9WrblZymCWIUKn1QVxmas4x9h0BcIuM/VNPsY8PZiUXjXa1fR223xoXf
         DAyqhjzhhfO9FoRbBhBnOZhzoGUQdEU3Kr6JrDDlGpfGLawKX5m7beJSgkwz61GNfYE+
         w/ud0cETAjoJc/bTip1tsjGo5CGOrJU7iHLIcmKpm0nNk7j2chuC+iEwxrGxVSMaotU1
         6H5w==
X-Gm-Message-State: AOJu0YxY62GeiWmQTCxOwnWNBwDgcOtlk650wL54GA0r3SnPLQ2uWVRS
	rOwLa9kT5043Z1FbqHL8RMci0+OHh+EXj6tCB85LdiccoLCr2zEHiIwl9yYoApO9JwAwe6XZxJm
	y
X-Google-Smtp-Source: AGHT+IGNvmaxJuZ56kRub6HJrnCCvwMNSDYvRB4DosUBUCyELTa77vo317nBgy8bmWqwQJ832iIXDg==
X-Received: by 2002:a50:8e4f:0:b0:574:d0ae:568b with SMTP id 4fb4d7f45d1cf-57a17941e6fmr1599753a12.38.1717086955777;
        Thu, 30 May 2024 09:35:55 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a10670df6sm1888885a12.69.2024.05.30.09.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 09:35:55 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 30 May 2024 19:35:45 +0300
Subject: [PATCH 1/2] arm64: dts: qcom: x1e80100-crd: Fix USB PHYs
 regulators
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-x1e80100-dts-fix-usb-phy-supplies-v1-1-6eb72a546227@linaro.org>
References: <20240530-x1e80100-dts-fix-usb-phy-supplies-v1-0-6eb72a546227@linaro.org>
In-Reply-To: <20240530-x1e80100-dts-fix-usb-phy-supplies-v1-0-6eb72a546227@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1782; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=6HntS71rHp1CBZeIhiK7csmrNdwGhdAijMWT15I8h6Y=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmWKrmhqbqD8t9tvszAv1baRL8ihnUNlnUH09gD
 wLt4NxcnSyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZliq5gAKCRAbX0TJAJUV
 Vua7D/4ohzvO8XSXtv+ggscSb5rvZPbh61AgPXyeNxptSYQ/HSGNv72mhcWyUVh410SHUexN7rq
 yItrMpNbLNtdo4a8opKDzvDn3WXN6QxsztT43MYwM1bAVcg3Uer46p7Ev5ycLBbfl3kcKcV399B
 iySMFMseD+qVRCChz/UV3yjTa4AVgeopgm9b5iG59L26X7VL5Oh0dPQAvMolbx36n3msrUGyWAK
 dM98ua4aHvb2cFJ5R5OUqn273PNLk314ew2R36mQdybeOFnNomtXRQyUTM85+ulrd2jVpfqWFF5
 fiUG1ZMK2PZqmMK93NnrjxsyMq0YcO/ISAraOdavp6RPrY0Rd/CQjh6G2u+YDfpx0dg63MVjmys
 5UqVPHL9UFJn0o46vv3n2FdnEQTy7z4k4rz9z9f/EJQxoKHOwGdPy0dTaYFHkJJxn5jFzEsR9mu
 K6LLJpat7/4qqaQYIjReHcAg4NyayqgoQXQmCnUpqqIB7Ejhc9tdUIo1R3tadD6f+4e3FKyqp+b
 q8p2BaStjuf/kSivArUdCfRQijlC3nGeSEPNo7r9gDPnlTYgrJHKOWJKZz6Fj9AMz0fBUcmjryI
 WxG+ushhU9YG6wIx3TYRRHwlSSsCdNjOoK4m0zfvoOXEPPS8mzL4fMDC1AnS8y6W9wpR48biGst
 0izbJWAdco23S1Q==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The 1.2v HS PHY shared regulator is actually LDO2 from PM8550ve id J.
Also add the missing supplies to QMP PHYs.

Fixes: d7e03cce0400 ("arm64: dts: qcom: x1e80100-crd: Enable more support")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index ed8b80627534..173a88b6b8b8 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -841,7 +841,7 @@ &uart21 {
 
 &usb_1_ss0_hsphy {
 	vdd-supply = <&vreg_l2e_0p8>;
-	vdda12-supply = <&vreg_l3e_1p2>;
+	vdda12-supply = <&vreg_l2j_1p2>;
 
 	phys = <&smb2360_0_eusb2_repeater>;
 
@@ -849,6 +849,9 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy {
+	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-pll-supply = <&vreg_l1j_0p8>;
+
 	status = "okay";
 };
 
@@ -862,7 +865,7 @@ &usb_1_ss0_dwc3 {
 
 &usb_1_ss1_hsphy {
 	vdd-supply = <&vreg_l2e_0p8>;
-	vdda12-supply = <&vreg_l3e_1p2>;
+	vdda12-supply = <&vreg_l2j_1p2>;
 
 	phys = <&smb2360_1_eusb2_repeater>;
 
@@ -870,6 +873,9 @@ &usb_1_ss1_hsphy {
 };
 
 &usb_1_ss1_qmpphy {
+	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-pll-supply = <&vreg_l2d_0p9>;
+
 	status = "okay";
 };
 
@@ -883,7 +889,7 @@ &usb_1_ss1_dwc3 {
 
 &usb_1_ss2_hsphy {
 	vdd-supply = <&vreg_l2e_0p8>;
-	vdda12-supply = <&vreg_l3e_1p2>;
+	vdda12-supply = <&vreg_l2j_1p2>;
 
 	phys = <&smb2360_2_eusb2_repeater>;
 
@@ -891,6 +897,9 @@ &usb_1_ss2_hsphy {
 };
 
 &usb_1_ss2_qmpphy {
+	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-pll-supply = <&vreg_l2d_0p9>;
+
 	status = "okay";
 };
 

-- 
2.34.1


