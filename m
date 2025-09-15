Return-Path: <linux-arm-msm+bounces-73580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE21B57D25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 15:30:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 857F61AA2D0C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 13:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92A7313297;
	Mon, 15 Sep 2025 13:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HPOlI/cN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02E124A044
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 13:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757942936; cv=none; b=EAbFajQwP6kteRSrkCQ+aNpmurzGouasMXTp03doPwXo8SsTWAzbnHFG+ITwH/tqhSPM/CdtWrn6GARo/M3XW5EsM7mOLmHGnnRrRsioi5wCJD6UOE9ha2G9flVo3pizhCNiGWjKh8WOxLhN+fCvBjzLpbb6Yn3KPkpu6ARxLaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757942936; c=relaxed/simple;
	bh=vnlm1slyNmbttO9fw4RIWStPZdVkW1FF3oJw8gyAinQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dke5ydjMOiOC/LBYXn7TfX8eOpC7NaArx9zT//MWtxeCbM5IZdLf7SuK4BZHhu43N3EgRzqngPNRbzAW0ByoQ0gA7gpFqK3XDATgfZwHkyXQqEJRJ4Vr7xSQSPPxL2Y+qXK3X9HCl7J5556SpJSe0Ede9eAs/TdYnvVX6bt6lhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HPOlI/cN; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3e9a9298764so1150023f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 06:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757942933; x=1758547733; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=35maHscUr/d47mvdI2u+bHhN47XfHp34cUHx+zt1aho=;
        b=HPOlI/cNBucj9ZmJ7fuE1dAKZ1e5jgYxSIx1PCtbLI0fwIMDMwRATM1CBs5nGoBOIe
         9EltpUsVZgTFPQTNOaPrbmAqxJW6NhYMo8WHzJpbx3kP0TgSxDl3ze3ScGjdQsoWc1nf
         dvo3a3g4EC5v8KQlljGghJifmGPxrVIZzbOoDgjudSRgS6k7ALdZjHsm5VGxPNvuKu8+
         Ln/2Z2ful+6bPzD8QEhmrCHhgpOxrWP/VqVjeIvGddFnAOlN5v7h5T25osJD7qNlPysF
         6XsZDhayoHi6Yi/KTbjc/TKR4+HrqVs9gWhnCeQuu1aDShIa3nsVnncojnbKBeWy59TV
         epXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757942933; x=1758547733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=35maHscUr/d47mvdI2u+bHhN47XfHp34cUHx+zt1aho=;
        b=aDvPpGQrCTaeXwDOdvMyMyh6wXJMo63WiGynVjvn8e0XCrOdz7EYhl/UVLDjgO+JOV
         BYoocCjYVQdK1xiCHQaz7Tp4OnqP15QTk4JKa5GeDM/BVmGdeLuw/HoK2WUjOLkxof7N
         C+aiWsx60Uago8a1D+lG77ugrKoKm54ClsmF8B50SxWo1kEntlv6V5I3kQsFea8xcXT5
         Q4LElyOlj3SpTmW5m1zZVuUuEQk+816GJ3YbM0daybFkQHMcm58NBBx/NgqccZ5BNcjL
         P4+wXcyQA74KQzAOjloIriuj5cBLZii6momC7ckGzw5c+7JrDndlFl/vd1qIMWaokdbQ
         lVQg==
X-Forwarded-Encrypted: i=1; AJvYcCVdaWPb8RrIxb539sPKBGcTCxmLBAq291z0gGoRPCPFbxzjLNWC66ie2a3685O4RM7yK6NIdr6qViJmC9L1@vger.kernel.org
X-Gm-Message-State: AOJu0YzwqXRMLEJMuxZ8dKGRF6L2lzZsa/VsmU36TowBtekAfQs7F2AV
	ix8dzepq8Rhbz5laxxhhkJektKWdZEjyH2AP0M43BIB4DtJDKkmN1dbGB/wPc/p9xDw=
X-Gm-Gg: ASbGncsc1jkVZ6dUOh6rtL6QL67YPcCjhbIbeuQ3775biMzE3pa3jcdqGzsoN7jUqs0
	bPPE7EhQaadqFkg5VyFWgJVq1NFQhOAzv/UtM3hYkMTovPT8zOxljw660O9sKq6mOlyyKdPTwTG
	YRcce36Oz6HSxscuCJcc4ZEne+iaZSwGujdIeJPJ5npvIlDOIvcOYWsD9sV40hT34IcuxLQ+SHE
	/PTxv9FaC1/D4fNNFZWAxRURXKjEhsJLMYdOiH7kiN0uDthz5bDngpm6x6ARb9caoJW5mr9DwDu
	S2xw0HLfPqB4Yh9EdXG8Xfxgze4stLT0uOn8T4qXWfVY1zssc2i93imNKxRD1DAGznjk/tSeY4X
	X+H3kXWjEcB3t+5tSSaUVygmlLlWaIYyyDGE=
X-Google-Smtp-Source: AGHT+IER/KlJED2PxaZ/4h5FniATgL9p4nd5Af5mJaje+r1DLi2JqavLb0mBaDaMSdEUYQIxaESExg==
X-Received: by 2002:a5d:5d0f:0:b0:3cd:5405:16e7 with SMTP id ffacd0b85a97d-3e765a2eed8mr11975067f8f.29.1757942933186;
        Mon, 15 Sep 2025 06:28:53 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:41:eee1:5042:e713:2e9a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e9fd89af70sm5978874f8f.43.2025.09.15.06.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 06:28:52 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 15 Sep 2025 15:28:30 +0200
Subject: [PATCH 1/3] arm64: dts: qcom: msm8916: Add missing MDSS reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-msm8916-resets-v1-1-a5c705df0c45@linaro.org>
References: <20250915-msm8916-resets-v1-0-a5c705df0c45@linaro.org>
In-Reply-To: <20250915-msm8916-resets-v1-0-a5c705df0c45@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Vincent Knecht <vincent.knecht@mailoo.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

On most MSM8916 devices (aside from the DragonBoard 410c), the bootloader
already initializes the display to show the boot splash screen. In this
situation, MDSS is already configured and left running when starting Linux.
To avoid side effects from the bootloader configuration, the MDSS reset can
be specified in the device tree to start again with a clean hardware state.

The reset for MDSS is currently missing in msm8916.dtsi, which causes
errors when the MDSS driver tries to re-initialize the registers:

 dsi_err_worker: status=6
 dsi_err_worker: status=6
 dsi_err_worker: status=6
 ...

It turns out that we have always indirectly worked around this by building
the MDSS driver as a module. Before v6.17, the power domain was temporarily
turned off until the module was loaded, long enough to clear the register
contents. In v6.17, power domains are not turned off during boot until
sync_state() happens, so this is no longer working. Even before v6.17 this
resulted in broken behavior, but notably only when the MDSS driver was
built-in instead of a module.

Cc: stable@vger.kernel.org
Fixes: 305410ffd1b2 ("arm64: dts: msm8916: Add display support")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index b50c7e6e0bfcd35ab4f8b84aeabe214fd60e8d7c..de0c10b54c86c7795b7a0d1ecd80652e60e117b6 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1562,6 +1562,8 @@ mdss: display-subsystem@1a00000 {
 
 			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
 
+			resets = <&gcc GCC_MDSS_BCR>;
+
 			interrupt-controller;
 			#interrupt-cells = <1>;
 

-- 
2.50.1


