Return-Path: <linux-arm-msm+bounces-27302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 776BC93FE98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 21:53:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E433284CD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 19:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA27718C33F;
	Mon, 29 Jul 2024 19:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RnOqvt/c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C7018A927
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 19:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722282746; cv=none; b=RgQRvodIMv/3KbehBq+UsHPEGIyct64LfUI1A8JshnHqPnYEFjh8J45opw7shmmfZFJTuunFD7oeI1opEzq53QarPs6Gp95sQ+foUlmGgXAd7vCQxaaCTxF1k6b5cjj6Zmzt1kb0sjwzIVN0RiTNDh2WVOOeDlKlvJTvbgoka3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722282746; c=relaxed/simple;
	bh=lGFZGgA/O9A/S5qTh5NR5ly34Ld4DtkmOO5/k+pKHKs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mvG8WTUaqjcf75wMaf6HAGo+cdkK2T2W+OcxQHcl1VsU0D0EAzR2sQ+gFQnnYDl9UYuEhFfmBBHNCOcENh/3ma1oiv5CNHc0jk4wMUHvzFWBJ/tXX208GGiyuoRyTbHVN5ewxbQzar+vtMwXdmvHyA6ffGz3fNSnjh6SgsB/HjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RnOqvt/c; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52f008aa351so5820485e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 12:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722282743; x=1722887543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NzkDp7NapSOrLl8ec7U9pJiscxvgpUDR6AyuyeyD8V8=;
        b=RnOqvt/c0e99g1wVhG8Heva0kcftKlRzHhhm++bjtQnuAltn3TSp72xr3PWMV2w13T
         1nBMHAsJrJf4ThLFL0WwZIHVEr31HMqtDsUbRawj3/FylXarigvrLngUGyQkEYIoCHIS
         /0ASiK1iD7EQYYDioZqMQet/9O+E2oR0PJU8ZDqd7Jg7P3evzwzG0kIQnzKj6B3o/QD7
         hiZQ4GlTRR1hOQ1T1vNUF1dN3lKqWoXMtoapJiHIlJJDGeMH4RNs7xUH8ggz1jQ/RdFg
         edcDGhNOgqboSOnazGYzyGGKrRag7yihi9y0IqLrZGTjqjn5DRNHCalhwO+UiKAh5dWH
         lMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722282743; x=1722887543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NzkDp7NapSOrLl8ec7U9pJiscxvgpUDR6AyuyeyD8V8=;
        b=K8B+LczPBBxTogXLPS8X4gkvrcB3zWncTC5ShBA+2FP3SIVaNKJ1JFHACSa0silHsp
         0K91cFu0ZELhYy/rFZKbUtLI6wOW2sUybf7C2eHt5jJKVq8JVgYTu+mnGn/lMaoHTZ+R
         btR2qTgGljAsJfS/7Ks9uckkLNe7aR37UAJg3CTNl4u94q1Zrn3g8C0cG2/6l3W4L3Gn
         qNNDRWZdPENAZjrcrK23K3Efc02gXDSKBiuJ0LPGTdqc04kJcYSPIKJTUHFB8Dgf9ZTe
         n+/uUSasMQw/HdGn3p7gLUTEX2Edc0H4fYHIITq20nFA8mb65etD8XEfSKeZpEoJC6fz
         oy8g==
X-Gm-Message-State: AOJu0Yy2bfUQibsDMFYLQ5FvhppgATSttf7IOBAr82TpJMNa7wTjGatG
	glb16Ec2CJStUJ9r8GlzezsEiO4wIZp0xlx50Y1y1JS4EfOskX2rKgg9OFt71lM=
X-Google-Smtp-Source: AGHT+IEoUa5Kq4BiEJEbD/pnaPgcbfWAsGmbgkhlgJhiVuF+n53mG9ru8cRtBtnLWxCCpIfBP96BCA==
X-Received: by 2002:ac2:4f07:0:b0:52e:a60e:3a08 with SMTP id 2adb3069b0e04-5309b25aa12mr7561340e87.11.1722282742634;
        Mon, 29 Jul 2024 12:52:22 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bd1088sm1615590e87.106.2024.07.29.12.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 12:52:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Jul 2024 22:52:18 +0300
Subject: [PATCH v2 5/5] arm64: dts: qcom: add generic compat string to RPM
 glink channels
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240729-fix-smd-rpm-v2-5-0776408a94c5@linaro.org>
References: <20240729-fix-smd-rpm-v2-0-0776408a94c5@linaro.org>
In-Reply-To: <20240729-fix-smd-rpm-v2-0-0776408a94c5@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Stephan Gerhold <stephan@gerhold.net>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8405;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=lGFZGgA/O9A/S5qTh5NR5ly34Ld4DtkmOO5/k+pKHKs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmp/Lxkkf1Hee0/3zaCdHJ6DntkURb4bZWzrS7n
 pJMqskhXzmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZqfy8QAKCRCLPIo+Aiko
 1UZ+CAClqTh6Y/FVSqyLyzKrVNGkoLtqAbBJkvsHJsoWgv9SgemgVqpfTXKk4lz9RojYo9XEZH7
 WFRiwQiU6VbsPlonYLUSCL6haENBgHtA1hcw65PlowiXM8Ysd+fldhDy2izWDz6ctABM2jOK95Q
 HBFNfeuHUcRPbincq6FErpQPZ9VAyFzMffLoYeJqwk7xwAeP/X/uPsuRDhnz24aF6oIOz5f5FPn
 YPZHOL76TZ+zkv4ag5u77AJERC7YUWjP5OypOXlcqri7qfj/CuckVMtqz0tWq/plyj7FcrdFVku
 N8EJvJoPmrAeTCGsYwALJm7NdgYRflH6gmn91d23ZNCCSJPi
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add the generic qcom,smd-rpm / qcom,glink-smd-rpm compatible to RPM
nodes to follow the schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8976.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/sm6375.dtsi  | 2 +-
 15 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index e1e45da7f787..8edd535a188f 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -168,7 +168,7 @@ glink-edge {
 			mboxes = <&apcs_glb 0>;
 
 			rpm_requests: rpm-requests {
-				compatible = "qcom,rpm-ipq6018";
+				compatible = "qcom,rpm-ipq6018", "qcom,glink-smd-rpm";
 				qcom,glink-channels = "rpm_requests";
 
 				regulators {
diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 48dfafea46a7..08a82a5cf667 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -181,7 +181,7 @@ glink-edge {
 			mboxes = <&apcs_glb 0>;
 
 			rpm_requests: rpm-requests {
-				compatible = "qcom,rpm-ipq9574";
+				compatible = "qcom,rpm-ipq9574", "qcom,glink-smd-rpm";
 				qcom,glink-channels = "rpm_requests";
 			};
 		};
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
index 0fd2b1b944a5..e5966724f37c 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -472,7 +472,7 @@ glink-edge {
 			mboxes = <&apcs_glb 0>;
 
 			rpm_requests: rpm-requests {
-				compatible = "qcom,rpm-msm8996";
+				compatible = "qcom,rpm-msm8996", "qcom,glink-smd-rpm";
 				qcom,glink-channels = "rpm_requests";
 
 				rpmcc: clock-controller {
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 7f44807b1b97..2bcfa480509d 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -352,7 +352,7 @@ glink-edge {
 			mboxes = <&apcs_glb 0>;
 
 			rpm_requests: rpm-requests {
-				compatible = "qcom,rpm-msm8998";
+				compatible = "qcom,rpm-msm8998", "qcom,glink-smd-rpm";
 				qcom,glink-channels = "rpm_requests";
 
 				rpmcc: clock-controller {
diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 8f3be4c75db3..79bc42ffb6a1 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -215,7 +215,7 @@ glink-edge {
 			mboxes = <&apcs_glb 0>;
 
 			rpm_requests: rpm-requests {
-				compatible = "qcom,rpm-qcm2290";
+				compatible = "qcom,rpm-qcm2290", "qcom,glink-smd-rpm";
 				qcom,glink-channels = "rpm_requests";
 
 				rpmcc: clock-controller {
diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index c291bbed6073..cddc16bac0ce 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -177,7 +177,7 @@ glink-edge {
 			mboxes = <&apcs_glb 0>;
 
 			rpm_requests: rpm-requests {
-				compatible = "qcom,rpm-qcs404";
+				compatible = "qcom,rpm-qcs404", "qcom,glink-smd-rpm";
 				qcom,glink-channels = "rpm_requests";
 
 				rpmcc: clock-controller {
diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index c7e3764a8cf3..c8da5cb8d04e 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -372,7 +372,7 @@ glink-edge {
 			mboxes = <&apcs_glb 0>;
 
 			rpm_requests: rpm-requests {
-				compatible = "qcom,rpm-sdm660";
+				compatible = "qcom,rpm-sdm660", "qcom,glink-smd-rpm";
 				qcom,glink-channels = "rpm_requests";
 
 				rpmcc: clock-controller {
diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index e374733f3b85..41216cc319d6 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -376,7 +376,7 @@ glink-edge {
 			mboxes = <&apcs_glb 0>;
 
 			rpm_requests: rpm-requests {
-				compatible = "qcom,rpm-sm6115";
+				compatible = "qcom,rpm-sm6115", "qcom,glink-smd-rpm";
 				qcom,glink-channels = "rpm_requests";
 
 				rpmcc: clock-controller {
diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 777c380c2fa0..133610d14fc4 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -192,7 +192,7 @@ glink-edge {
 			mboxes = <&apcs_glb 0>;
 
 			rpm_requests: rpm-requests {
-				compatible = "qcom,rpm-sm6125";
+				compatible = "qcom,rpm-sm6125", "qcom,glink-smd-rpm";
 				qcom,glink-channels = "rpm_requests";
 
 				rpmcc: clock-controller {
diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index ddea681b536d..4d519dd6e7ef 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -653,7 +653,7 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			mboxes = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
 
 			rpm_requests: rpm-requests {
-				compatible = "qcom,rpm-sm6375";
+				compatible = "qcom,rpm-sm6375", "qcom,glink-smd-rpm";
 				qcom,glink-channels = "rpm_requests";
 
 				rpmcc: clock-controller {

-- 
2.39.2


