Return-Path: <linux-arm-msm+bounces-27245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D24893F396
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 13:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E4752832E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 11:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABAB3146580;
	Mon, 29 Jul 2024 11:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JYmIfHJ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC1B14534D
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 11:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722251098; cv=none; b=iuRsva1LE0IZcR/0en4iSZsHEueY3pjIBai/LkMWhKTwuUTird0vguSfNFgJNPbTIf4+Hpxir7S+AhrRzAXBtgtIeeedWsoVgZrLvwGdBqHazBz0F97XIOcGAmVty9o9YdXU1aWjnvcmn7KMys/z54Bj8YUUF6u/XF+OYde12e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722251098; c=relaxed/simple;
	bh=LmnFWXQwB+zVmUbaXAxgLw8NL6rGHH1AOIMYnhPLopg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XosoB0h0bySwaICWovft7wppsg+vgPO0geoEbQeQs+J9AUPvmJjglOp2KYdIocxVVBOLIo93uxVzzzWcWMsOFVLFNW7GyH/xvh5K4o3PWMNl2WfwpCCN7PuOKHGfwrc7sMO2NQWmkdTEj+e5aIDRoJVxYbTRcnGNflbLWncNOwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JYmIfHJ2; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2eeb1ba040aso57342191fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 04:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722251095; x=1722855895; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vo5dVHxwYUOCulmoYzfsTboShJXb0xMjQ5jWjKDTtlU=;
        b=JYmIfHJ2guL8ccjw1aQiI0sBzzVrw8pdwC4gPLQ59xDdU81voKoCI+0HlGhzPZ+Obt
         12zbpOaLGEfJNsO8PMJARTt0SxfEkOAs55l80LhqNLuhZPIYSPnJX5K/IJMSsKOlUEly
         JohsN2QAa2yFp/+bl9rNNSh9EgvoDhTzMh9jqLe/D5PJt0GE7sj9EoZRxPTVvGv6+ZHU
         8Q7Q6FoU2jcGJgjx53CrY1cxPcWzVqBFsBcxBkQOXdlKjLi3KCXS4VSf48WjB04s2txE
         bpGaocn7NB4vMdx+bqY+SR0hI3IG1DDLUC8ng6A+OuEWvF1die8nXmje2AxasoLE5sya
         fdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722251095; x=1722855895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vo5dVHxwYUOCulmoYzfsTboShJXb0xMjQ5jWjKDTtlU=;
        b=OmrvEdH3IsDqCS+ldyewtIDnANcc0FT9b9CHoe2z9E4U18yz3lpR1kECf+0kVnfcH0
         /D6r24Tdt7KN+7cA2b6Hg9vaindi/eTYOZW+3isc0FoykSuMdtJAA88cwcJpuuFcE+ig
         GC5xPwKj1GIrtHHfWPxfU7+M2qpcbRYVQsU35eI+yWiP+0QckePbitdaZwhVMOdAMOnX
         V6z96zTWO/+UKpy1eg5WrzYxZa5oFRo+siBvt+MTFkZWDQJVBppByf0B0G1Zf/cWmDw0
         mqiOAk2IDz6hZF/hPGbPnIeq9MuUBv7l6mV33YREQuFANUBosIGThmSe6+UJGDWUixoU
         VFAQ==
X-Gm-Message-State: AOJu0YzrvrvdYUh/e61+bHOXnoUDIT28Dk14udUaXVlWS5xeNpHyQe+O
	r975Zix8qU/Y74Z0G3LOXxyaGVdb9AhMBsYcT+hAP0lKotuLiCppM7e+4w9eYf4=
X-Google-Smtp-Source: AGHT+IHwkV/HB89HoVuW58uAQaN2wo3IqgtJuRVZdOtgC0SrdBcCIdOAa7QH6TfvFJAoPVKyCyCbKw==
X-Received: by 2002:a19:6919:0:b0:52c:6461:e913 with SMTP id 2adb3069b0e04-5309b26b5dcmr4944450e87.16.1722251094568;
        Mon, 29 Jul 2024 04:04:54 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c09093sm1457806e87.172.2024.07.29.04.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 04:04:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Jul 2024 14:04:48 +0300
Subject: [PATCH 4/4] arm64: dts: qcom: add generic compat string to RPM
 glink channels
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240729-fix-smd-rpm-v1-4-99a96133cc65@linaro.org>
References: <20240729-fix-smd-rpm-v1-0-99a96133cc65@linaro.org>
In-Reply-To: <20240729-fix-smd-rpm-v1-0-99a96133cc65@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6332;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=LmnFWXQwB+zVmUbaXAxgLw8NL6rGHH1AOIMYnhPLopg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmp3dTA7VR3a+S7TA+mPifZW9dRlIZPwMz17Tr9
 g3uKaL0Vx2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZqd3UwAKCRCLPIo+Aiko
 1bGLB/4y/S4Ey3R1gulWcErPO0KSQs5KbupD7D7xJWAeZjPnHFnheO8ygtga8oU1kQ9azj+Yc2t
 /qawWpESm1jPJKpfXdHiSaw+rSDQ7gcXXBWlUSUmdBIfSYOSw04/h8p5Y7t38TISVMwX09sCbrP
 lO1pnHsuaqzOhKj1/iywiFeuta/c0CnUy8WjFM0yRVdtrcso0ylvdAueCoYvGqkiDekQgU3IGdZ
 1+h/2iLRbS0Kl/GMCndHBM0WSDAy5j16xq7oIPuTqiTPPGW8eKzD2k+erAT+wcR6RZ3Ontx5a4F
 cRweDaoihh/wW3taY3KrrXaDZyYr+zWktxChRTwZXF+qOYJz
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add the generic qcom,smd-rpm compatible to RPM nodes to follow the
schema (and to allow automatic driver loading in a sane way).

Fixes: bcabe1e09135 ("soc: qcom: smd-rpm: Match rpmsg channel instead of compatible")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8976.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/sm6375.dtsi  | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 7383bcc603ab..0ee44706b70b 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -312,7 +312,7 @@ smd-edge {
 			qcom,smd-edge = <15>;
 
 			rpm_requests: rpm-requests {
-				compatible = "qcom,rpm-msm8916";
+				compatible = "qcom,rpm-msm8916", "qcom,smd-rpm";
 				qcom,smd-channels = "rpm_requests";
 
 				rpmcc: clock-controller {
diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index 46d9480cd464..28634789a8a9 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -252,7 +252,7 @@ smd-edge {
 			qcom,smd-edge = <15>;
 
 			rpm_requests: rpm-requests {
-				compatible = "qcom,rpm-msm8936";
+				compatible = "qcom,rpm-msm8936", "qcom,smd-rpm";
 				qcom,smd-channels = "rpm_requests";
 
 				rpmcc: clock-controller {
diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index a4bfb624fb8a..d20fd3d7c46e 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -199,7 +199,7 @@ smd-edge {
 			qcom,smd-edge = <15>;
 
 			rpm_requests: rpm-requests {
-				compatible = "qcom,rpm-msm8953";
+				compatible = "qcom,rpm-msm8953", "qcom,smd-rpm";
 				qcom,smd-channels = "rpm_requests";
 
 				rpmcc: clock-controller {
diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
index d62dcb76fa48..c76cab9174be 100644
--- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
@@ -247,7 +247,7 @@ smd-edge {
 			qcom,smd-edge = <15>;
 
 			rpm_requests: rpm-requests {
-				compatible = "qcom,rpm-msm8976";
+				compatible = "qcom,rpm-msm8976", "qcom,smd-rpm";
 				qcom,smd-channels = "rpm_requests";
 
 				rpmcc: clock-controller {
diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 917fa246857d..fc2a7f13f690 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -188,7 +188,7 @@ smd-edge {
 			qcom,remote-pid = <6>;
 
 			rpm_requests: rpm-requests {
-				compatible = "qcom,rpm-msm8994";
+				compatible = "qcom,rpm-msm8994", "qcom,smd-rpm";
 				qcom,smd-channels = "rpm_requests";
 
 				rpmcc: clock-controller {
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 0fd2b1b944a5..f8de9bafcc24 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -472,7 +472,7 @@ glink-edge {
 			mboxes = <&apcs_glb 0>;
 
 			rpm_requests: rpm-requests {
-				compatible = "qcom,rpm-msm8996";
+				compatible = "qcom,rpm-msm8996", "qcom,smd-rpm";
 				qcom,glink-channels = "rpm_requests";
 
 				rpmcc: clock-controller {
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 7f44807b1b97..072bc03f5833 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -352,7 +352,7 @@ glink-edge {
 			mboxes = <&apcs_glb 0>;
 
 			rpm_requests: rpm-requests {
-				compatible = "qcom,rpm-msm8998";
+				compatible = "qcom,rpm-msm8998", "qcom,smd-rpm";
 				qcom,glink-channels = "rpm_requests";
 
 				rpmcc: clock-controller {
diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index c7e3764a8cf3..7d11cdea4f7c 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -372,7 +372,7 @@ glink-edge {
 			mboxes = <&apcs_glb 0>;
 
 			rpm_requests: rpm-requests {
-				compatible = "qcom,rpm-sdm660";
+				compatible = "qcom,rpm-sdm660", "qcom,smd-rpm";
 				qcom,glink-channels = "rpm_requests";
 
 				rpmcc: clock-controller {
diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index e374733f3b85..69c9d2d9af87 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -376,7 +376,7 @@ glink-edge {
 			mboxes = <&apcs_glb 0>;
 
 			rpm_requests: rpm-requests {
-				compatible = "qcom,rpm-sm6115";
+				compatible = "qcom,rpm-sm6115", "qcom,smd-rpm";
 				qcom,glink-channels = "rpm_requests";
 
 				rpmcc: clock-controller {
diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 777c380c2fa0..1686db0f1c89 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -192,7 +192,7 @@ glink-edge {
 			mboxes = <&apcs_glb 0>;
 
 			rpm_requests: rpm-requests {
-				compatible = "qcom,rpm-sm6125";
+				compatible = "qcom,rpm-sm6125", "qcom,smd-rpm";
 				qcom,glink-channels = "rpm_requests";
 
 				rpmcc: clock-controller {
diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index ddea681b536d..f2908fa2dfac 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -653,7 +653,7 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			mboxes = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
 
 			rpm_requests: rpm-requests {
-				compatible = "qcom,rpm-sm6375";
+				compatible = "qcom,rpm-sm6375", "qcom,smd-rpm";
 				qcom,glink-channels = "rpm_requests";
 
 				rpmcc: clock-controller {

-- 
2.39.2


