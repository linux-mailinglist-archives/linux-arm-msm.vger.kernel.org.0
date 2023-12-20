Return-Path: <linux-arm-msm+bounces-5682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEE481AB6C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 00:58:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D1541C23F2A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Dec 2023 23:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012D64F1E4;
	Wed, 20 Dec 2023 23:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MnbpjDzK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C974EB27
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Dec 2023 23:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7b7f93eb935so9461239f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Dec 2023 15:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703116521; x=1703721321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZuPqRxkPW8qurxjYx07gjm1CYO7d9uELmdtkiZRYco=;
        b=MnbpjDzKOaN/BhBdGaCtMaiJ3xpNomM8j7iiMCSYgNHNCA14g3C3/pl1vTx3i/Xd4G
         O0n5Z+HAjQLECf/wNCBpzhNbPUts/tkrVXgKOiO2xfev8yiZtEGP/iAJVY1OnK5pYN1t
         PTvB3j+nNoIZIY4R4v2vFaCHx4LXB0tt65sd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703116521; x=1703721321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bZuPqRxkPW8qurxjYx07gjm1CYO7d9uELmdtkiZRYco=;
        b=UpuUW3OX3klgrQVXja0ZcwKk10RC6LOtfQkfye/YwjU/SCXl7AFOeIZALilGpEV85Q
         pNrxMnRO5wZzu1Iw/6RSLc37s5OZjYr1aIRjzITKW9y1scKjmkAswrRw1UqnbpC70IHF
         bOD1ND6gcpYW+3+s2YQNFx2VBbtvCvk1ASPB8R/lftcWINbLr1cu33hvRLIJ974VABdI
         tHXYJq6cX2m8u0BSdLnZvesamx8LcZSQf1Vipb81osW+rvjNkHJUVuLpKxSEjb6zEZ0c
         VNfOQHz9dfuY/5JvCw0MRtQjGvJ15h6//Y9lGh6LEC8ZXmR8+be7uxiV20ED8K1j62hI
         FJvw==
X-Gm-Message-State: AOJu0Yyd/5DIDp3VB4ycZgGenhtP4bGHWq/sNwaEMtc3G9C61OafrojL
	rL5gm+qX8vZKVfRNMpWagohnVg==
X-Google-Smtp-Source: AGHT+IH9eKxs2gX2n0YBuAdnfEstGKr3mBLvpJ8v13Hu+3I2CjGqKVDhyAV9CBjaiJ1aNpqgRQZE1w==
X-Received: by 2002:a05:6e02:1ba3:b0:35f:c678:9509 with SMTP id n3-20020a056e021ba300b0035fc6789509mr3542419ili.48.1703116520994;
        Wed, 20 Dec 2023 15:55:20 -0800 (PST)
Received: from markhas1.lan (71-218-50-136.hlrn.qwest.net. [71.218.50.136])
        by smtp.gmail.com with ESMTPSA id bp22-20020a056638441600b0046b39a6f404sm177805jab.17.2023.12.20.15.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 15:55:20 -0800 (PST)
From: Mark Hasemeyer <markhas@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Raul Rangel <rrangel@chromium.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Mark Hasemeyer <markhas@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 14/22] arm64: dts: qcom: sc7280: Enable cros-ec-spi as wake source
Date: Wed, 20 Dec 2023 16:54:28 -0700
Message-ID: <20231220165423.v2.14.I7ea3f53272c9b7cd77633adfd18058ba443eed96@changeid>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231220235459.2965548-1-markhas@chromium.org>
References: <20231220235459.2965548-1-markhas@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cros_ec driver currently assumes that cros-ec-spi compatible device
nodes are a wakeup-source even though the wakeup-source property is not
defined.

Add the wakeup-source property to all cros-ec-spi compatible device
nodes to match expected behavior.

Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
---

Changes in v2:
-Split by arch/soc

 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index 9ea6636125ad9..2ba4ea60cb147 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -548,6 +548,7 @@ cros_ec: ec@0 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&ap_ec_int_l>;
 		spi-max-frequency = <3000000>;
+		wakeup-source;
 
 		cros_ec_pwm: pwm {
 			compatible = "google,cros-ec-pwm";
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi
index ebae545c587c4..fbfac7534d3c6 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi
@@ -19,6 +19,7 @@ cros_ec: ec@0 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&ap_ec_int_l>;
 		spi-max-frequency = <3000000>;
+		wakeup-source;
 
 		cros_ec_pwm: pwm {
 			compatible = "google,cros-ec-pwm";
-- 
2.43.0.472.g3155946c3a-goog


