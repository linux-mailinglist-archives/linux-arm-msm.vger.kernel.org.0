Return-Path: <linux-arm-msm+bounces-69001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C9FB24EBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 18:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A2F394E42DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 16:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 699C92BD588;
	Wed, 13 Aug 2025 15:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qz+msIor"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB38B27FD75
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 15:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755100795; cv=none; b=FuDKOUL/9hdBqS5hrLo809q/huFOqMhINqhVeh8k/aRxip1osc4DDfT8weMhKURJwHPOiNW5PhveGDW+0FYsvrH2JYIgQCc+37KXigkGP+QF4PDG+83ggzyAgmaHFNVaEsdRoD8ITCOe3Ct+U7QCQF9Vg56e20TqacWZTnbkOyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755100795; c=relaxed/simple;
	bh=ta+XFz3HnDL+iYanlmFudLHTEpIpVrwEgFil5Ac6Is4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OzNGkesx0ziQ6IsD7Jan9B2tTEbICUmBuwpgpzpxQ+X06+9OHv3KG4/vgtynkgeDxHRGehHzCn5r5fR+o2Q2p2IkD7PEKNsYr//ApWxsOXrEzhZlT0KtBw/YgEzs47NEjK95fxds5nhEgouGd2CcEjB/cb06EuLf4BpRDr21CA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qz+msIor; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a11a138faso11617965e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 08:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755100791; x=1755705591; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5QzubzEpxSR8AJtEH00aEvzTNop5IRJl0SD/ZGDdhCw=;
        b=Qz+msIor5CpX8r2TMU+xzBGMeZ5QGEpz843omJTaWqxKBiUMBCOiKtIhiTAtS0U9IK
         /lQGk6ipK+rBmR/vDmNFeZEIdtWYsi7rNpoQz4d+up2pNfg7gPb5SeyJqNZTCdzk2VtG
         uyCHkdkO/uSCkBljPl/ArEj1Iy5X/S3N1/irv0AG/LKt7UE8tIONK35JpxguAti5e6sa
         kAU4WXwWTpop/0SZ3MLerx7SrSaLZuj1aBfWavVWBnEjWnnfG+oQMCqwKYmlquv4Qht6
         VH/5YDhknGnCA4jPh/JgsbLjjSGfIQaD8XoolHo49dK/iu5/RluIZ4GGI19dphSpnN3C
         3+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755100791; x=1755705591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5QzubzEpxSR8AJtEH00aEvzTNop5IRJl0SD/ZGDdhCw=;
        b=earH0MEPO8VC/sHv7UfkNc/CtfMqOsN9G9PebC0meNbRdZY8dJUltKFuxc0PiwVtN/
         QhzE/m9q+xMWGqbtC9Hwa/M9IqHbhCXQ+zyHc4qtRqwbS9cMtTBPKoHyZJYzyuSQ2q8B
         L9GIvc5c1fysRvZ3UtyoRa21hWfcfq0oASCNvO0dPi3paPctM/EBsBNA0IxEJzwaRkFX
         0VGVJ6c9Z1TUdYUikJAIaMBuw5mMZbXQHF6XHzmRR5lXs4vuLRsqX+z3su6MZQQumiwM
         eoW+GT2w75ZkEedqk9auLovQbV1xYm5YeAfvNWs/D3ZbOnRpb8eCzXodx34/XClsZgky
         wZRw==
X-Forwarded-Encrypted: i=1; AJvYcCWyqfljGlrZ625BXy2PpENQyF18QvBT92p78bIEeC1s9saSAJyOi5x5YaDpbhIWrvfRmEbSQBx10Bn/RBeA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4TKx2LX777YO4BGf6FLC1vuyQafiq76XaJNpnxhNPSelq+zyO
	J9ZhU9oXaSpZPnTXNrOWQEs9IeH/LdfKSwpzoBiitmXpz2KA3XRZF2vWhDG9+TakpJk=
X-Gm-Gg: ASbGnct4PGRWwZEg11gTD0U5NLh6Gr0uo0PeHz65pDVj5awsytvLSEx34k56IO8HzU+
	K7X/a7yKdciHBFE8V2hxwzP5T0G/06wQzJs2GETRZETv+wfQQ11cqe31HYlS1NBx1qVYJkc7i3n
	+wxRw/R11fXTKu6HFJP3ce2LQgVl4vxuWjX8zKxcESEcM4bjZ6A/P2Veikqym1RbJHeNHamJvre
	afZnOAlAvwx23fkKAgrtGGAVdNd3/ZbM1jcbfbAnEaZV5vMRfKCNItECdjz98EiRept5aX9rHoC
	S/6GLnC6m6HXKja3oJNdsjEWVymBH9tD7GcjYLI9P2YTC2rLAPGgxwtB1siCHsPWbA2VGdfEJo0
	YhaoYqw6JVdaqFO6Ku999aRs08gAK8lG4wnQsMQ==
X-Google-Smtp-Source: AGHT+IEjUP02XfK61rRdhxtRGMf3DS2mDBJhrXTHtM14wcAYEv1oTJOGC8hNEB9g11usNrWVkIY1vQ==
X-Received: by 2002:a05:600c:a03:b0:453:5c30:a1fd with SMTP id 5b1f17b1804b1-45a165adae2mr30788525e9.8.1755100790994;
        Wed, 13 Aug 2025 08:59:50 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:4537:5d58:c08d:204b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a517c26sm7087755e9.7.2025.08.13.08.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 08:59:50 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 13 Aug 2025 17:59:01 +0200
Subject: [PATCH 4/9] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s:
 Explicitly enable used audio codecs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-x1e80100-disable-audio-codecs-v1-4-af82d9576f80@linaro.org>
References: <20250813-x1e80100-disable-audio-codecs-v1-0-af82d9576f80@linaro.org>
In-Reply-To: <20250813-x1e80100-disable-audio-codecs-v1-0-af82d9576f80@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2

Currently, the macro audio codecs are enabled by default in x1e80100.dtsi.
However, they do not probe without the ADSP remoteproc, which is disabled
by default. Also, not all boards make use of all the audio codecs, e.g.
there are several boards with just two speakers. In this case, the
&lpass_wsa2macro is not used.

In preparation of disabling the audio codecs by default in x1e80100.dtsi,
add the missing status lines to explicitly enable the used audio codecs.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 .../boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 4cf61c2a34e31233b1adc93332bcabef22de3f86..5816b7d5cc5492771d2d1e675ee3e09a86b07ae4 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -967,7 +967,13 @@ touchscreen@10 {
 	/* TODO: second-sourced touchscreen @ 0x41 */
 };
 
+&lpass_rxmacro {
+	status = "okay";
+};
+
 &lpass_tlmm {
+	status = "okay";
+
 	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
 		pins = "gpio12";
 		function = "gpio";
@@ -977,12 +983,22 @@ spkr_01_sd_n_active: spkr-01-sd-n-active-state {
 	};
 };
 
+&lpass_txmacro {
+	status = "okay";
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>;
 	pinctrl-names = "default";
 
 	vdd-micb-supply = <&vreg_l1b_1p8>;
 	qcom,dmic-sample-rate = <4800000>;
+
+	status = "okay";
+};
+
+&lpass_wsamacro {
+	status = "okay";
 };
 
 &mdss {

-- 
2.50.1


