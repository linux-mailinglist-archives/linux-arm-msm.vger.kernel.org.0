Return-Path: <linux-arm-msm+bounces-49329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EAEA4469B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 17:45:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7476425061
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 16:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3751B19DF4F;
	Tue, 25 Feb 2025 16:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aw360ezK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD2819CC06;
	Tue, 25 Feb 2025 16:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740501569; cv=none; b=Nq9gXWAd6MS7iOFQtrQd3MjkHYI1dIrippUuzBL+d9xT82GKTjO//nIuOrgcE+FUSwq719PzNLn8KdJ1F/Vb4iSHj4JGvARsrAYuP6UBAGSp6LcCQpET2ztkJUUSDT44OVF14kqqMj8tr5aluHvCD6w7rLT0/g8ia53piqbi/eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740501569; c=relaxed/simple;
	bh=zvVaBsOx8LkyJfd75hG74//crP1potwo+5tyyj61pkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A1YYpQcdZxdwLHHZcBpF2+AgcPBvd7w/FUPYFqh791WZvkHbMiHhpY5rvT4uBsPQPTFigBOAaq8cd9IrRAlrZqSlIddhjOebsPlfJx+Ixx5c6OQ/5JY4arm9CsnsSLCq8vVj93K+BqIJFknWQ2a2A3hH6mW6wSUBEUPPYMmoeJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aw360ezK; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ab771575040so1177704966b.1;
        Tue, 25 Feb 2025 08:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740501565; x=1741106365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AuPrDy8IlYWpbtRwNyfywea8CseYGDtYL9HxzM4l+m8=;
        b=Aw360ezKLzQacvI/pnJlBvtWOBKftNf94toPXOpUZ/WIbgxEj+Gdju4UlwObbQ2j+B
         +LnhV2nqZyaSJ2jeeY2gyqNwXN43iS9NZFTzLKCC8yanB36ByWLFpoLD++b0C+thUVZI
         hTjcI6hIGYdORJpZ5L/GhKlci8HrdD5p+sTYhxI6uZxGYpBk3xa3ku/RsP4puOrlW+fe
         2/r44weDUSsS4hwuxbZA1kUAqdD+8QjpS5kkgGLW+mmqpTw2MATQ6Wqkuw1Z29kmGPg1
         beF4i+gmG8YYeX7rEHQvw8KXprckOBjZ6rT0hx4Df7CbdUSeQ7Ho9xNNUq3zdN0Yi1dE
         /B0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740501565; x=1741106365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AuPrDy8IlYWpbtRwNyfywea8CseYGDtYL9HxzM4l+m8=;
        b=DxCaJC5CsPQPGqDqh0ICzPU9JmVSMW6cJqLzW2Uy4nONmbvuVnmjrn6nsWVFJ+c90J
         9X0A2U7LswYoiYVAHdZ51IWkE/kFyaA98mR8HBkNX2viSh9+ffMgbf34fCIcYubAUzkG
         MNCj/TMWBZ0Lb7nYA5fSdVcD25d8Vh8wh637f2Ci58xgIvJhsRGzGZ6F3K/vb8gI2gWu
         6ZA+wrRFzeZyNu4JHwqMchNeFhpkI4VtwYy0iuSIbQDfbiJbtK1zGcJOhOQraqRhUGjz
         jS8rDj/xi7byWMzbX+GSleAiyp+mGTcxml5eyXtw48Cl00jKrExcHYjnINOUghC135Du
         X8Kw==
X-Forwarded-Encrypted: i=1; AJvYcCU9ISFDZPxsM0eKvFjgAnCdyHOyWHG7RxXOwojnzyJwM1VznOY2yHM/avjCkt8F5MrNFeUiMDSRlbMQ@vger.kernel.org, AJvYcCWPFn6ju3iB7gvqWqL4pft249jNhxnboeKc9eXo2ZCjaawNEadjh/OcoFZoGPe4EMEiIRDENRMiTJUDMLqG@vger.kernel.org, AJvYcCWmdf9qIbjuHtLYRyd/NeRgxX+8sfzyt8ZArRDGkkvFcnymRtw08FvQVaz5ILFdHqtqCYpiYPZxf7StH30=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTQHvt/JkVlWKm/TVZmgg6jCBVnihXH/PSPfRzlCoENGP2a728
	zCQe6An3GMWVBwFCagbWMcNHEkaTgc6SHdbhO9x5bAj7lmycj2sOQ/dmGjBi
X-Gm-Gg: ASbGncvIiw0qDcD7gtGqkgDn0d2joxLLresPpykkC4zXrCBeafMRgsoPM8mv+r/sg5f
	NMZbIPa46dFYPuij7T6DFj7I2qVo5NgfKjP3CN39CR10zsfuCQvL7nbBVCUc8AYJqJ70UTf9Vy7
	+mLtl8x6nth43uMgHZZ7D/ABO8ONP7O7S+lz9iJfa6wWifQ5/rUJGDbvvGMnsjOf+VI/C0DN51M
	kwFVxDHuVXwl7vo6WuSXUVJ78uDMHNXYWoxVeFqlMwmiC5ykU1K5oEPVP0lOS+QhWsgg/VWZSo7
	cD8M+YcGc9JfH39IxHq69b+N
X-Google-Smtp-Source: AGHT+IG73ipX/K6/1fB2dZClMYvD018l2YUa7kadqZvW5jkT7esqACjbGycqBzyYya9Dmr2h1g/m/g==
X-Received: by 2002:a17:906:318b:b0:ab7:b7b5:2a0c with SMTP id a640c23a62f3a-abc0ae1b6e9mr1470104466b.6.1740501565023;
        Tue, 25 Feb 2025 08:39:25 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.22])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abed2055011sm163999866b.156.2025.02.25.08.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 08:39:24 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 25 Feb 2025 19:38:56 +0300
Subject: [PATCH v9 05/12] arm64: dts: qcom: sdm845-starqltechn: remove
 excess reserved gpios
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-starqltechn_integration_upstream-v9-5-a5d80375cb66@gmail.com>
References: <20250225-starqltechn_integration_upstream-v9-0-a5d80375cb66@gmail.com>
In-Reply-To: <20250225-starqltechn_integration_upstream-v9-0-a5d80375cb66@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740501555; l=1258;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=zvVaBsOx8LkyJfd75hG74//crP1potwo+5tyyj61pkA=;
 b=ZvglG92V6bjZc9uV0BSVgufjxxIpiJhRIsQ6G7p8fHe9gQPtyxXUAncdGNFo3h0XQcYsDlvgq
 KXI6Fvw8KF9ABjXq7FnA34s6IO2OJacMJWYonq30VFfmUvmSU9vlafI
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Starqltechn has 2 reserved gpio ranges <27 4>, <85 4>.
<27 4> is spi for eSE(embedded Secure Element).
<85 4> is spi for fingerprint.

Remove excess reserved gpio regions.

Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v6:
- refactor: no space between tag in commit message.
- refactor: s/starqltechn/sdm845-starqltechn in subject.
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 8a0d63bd594b..5948b401165c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -418,7 +418,8 @@ &usb_1_qmpphy {
 };
 
 &tlmm {
-	gpio-reserved-ranges = <0 4>, <27 4>, <81 4>, <85 4>;
+	gpio-reserved-ranges = <27 4>, /* SPI (eSE - embedded Secure Element) */
+			       <85 4>; /* SPI (fingerprint reader) */
 
 	sdc2_clk_state: sdc2-clk-state {
 		pins = "sdc2_clk";

-- 
2.39.5


