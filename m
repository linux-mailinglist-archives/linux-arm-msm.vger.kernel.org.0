Return-Path: <linux-arm-msm+bounces-40382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 820679E46D1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 22:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FA5E169EE6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 21:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0596202C3F;
	Wed,  4 Dec 2024 21:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWJDTQ7J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A6F1F5422;
	Wed,  4 Dec 2024 21:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733348118; cv=none; b=VzAOQZXuHGYKXaRl0NPGe1g7mrKpjidPNMGMfeVoEfI1zkeMlQE2nIpBznapthvaGBKgtr+xwj2flTaTwrePACTkY+3R0P+XNiPhk1zjJwcvMWiM4DsjxacIwBe0YaIhEXvsrFDnWft2g5hArbhfzj3RDRHSnPuc2eXTpN+rEnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733348118; c=relaxed/simple;
	bh=zvVaBsOx8LkyJfd75hG74//crP1potwo+5tyyj61pkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gx5mKLsyNzsF76+8J3EcW3BuyPzbVZDOhWQhrYasVcH5nmaK0SFFdew3fhpNid1V+XjcmPo2dWJ0lq5XswCMobLh9mtk6l32YEtxPU71EQQOAtwFvtP+jYULt0KG8mF7V9DSQ4egnHXHG4SbjRLTHcZn3/GaZXF3NQMeHJI6O1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kWJDTQ7J; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385eed29d17so207958f8f.0;
        Wed, 04 Dec 2024 13:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733348115; x=1733952915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AuPrDy8IlYWpbtRwNyfywea8CseYGDtYL9HxzM4l+m8=;
        b=kWJDTQ7JYRibCrRPQwpBvWF9phuOTdvqVVqTdj85HRGWYBlyTIRL1DHYv/DETW8+8a
         lMMBPRplgY4NRQ8rmAusTmL2LiqMJi7NQ3HEzeeLLIukVc34iM3usdOEP97SCNEXksRo
         qG26/0Zg2lodDGQNAuzI5RwF2jdFE29xNLsm1BgNMQtvlANZs72D2e6GVEwuveFlm+NK
         +JuBWv8cj02GZaJiLG5mkFwEbMRSoAWb2oZcnqURumd4SdHzHf/6VnhMLlXmWZ6+04nv
         pwrENn6dgmJiCk1Cv+1QrUDK6TLz2GAEr5W/KOPyfgwqMO5UwsrSPeumpaOCA6k4b3QI
         b2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733348115; x=1733952915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AuPrDy8IlYWpbtRwNyfywea8CseYGDtYL9HxzM4l+m8=;
        b=Nb0vfed0SKLf7t6kUVFAGaw7nnj+2dPO/YreQq7qNcHpDCTQ4GfisyJBtFJD3BqpEg
         BLEX+vKux4TcxdkfI2o+isqu9ywhBac4rcwq/oKrQtinJxUaYNYOPTvBm9NIngU1s5uy
         SAPMH5SoxeGQ+QJlImHsgEd/L26oNj5gh2O2SDXaHHsQ8NC20yPABrTjztOcGnRNErHv
         sxikYIkT3gRaAnWp/8i/ZD59QGvoXf22L5YiY8VxRcKC65X1OKUV3xj6IICxnPliS8V0
         RwIstH4UHau/POwJ/UIdwLDKyJjQheXoGwQw5HxHBMJnhfKjC0VLTGntfXLZeBCJPWJB
         cSWw==
X-Forwarded-Encrypted: i=1; AJvYcCVmKP5EdQq9WWr/YGmD8pAEZdMjiF8s5RewLywm+XTYOCCcp0TkG+xLTKlMJSSKZMdZXEByUIiYQX7nt1E=@vger.kernel.org, AJvYcCXeU5gQXAHl1BoK0O1fIUiAFtlf6KJZgHTV3Tt39I2A2zN6G/ezsV7umKxL58NZjPj9eOUadFazInrTrYJ/@vger.kernel.org, AJvYcCXtXtBkSSmj9rRes21a1SkI4VpDJ679HujNssHwEmM2B8at2+EqxmmWIhMdk6kN1jqMdZ89C65z1W4l@vger.kernel.org
X-Gm-Message-State: AOJu0YyImEQwjo3oDHgQCnP3jTexbwulBuPEj4FvBpE6VaRL+PG29V5b
	B2ZaxBlSH3O6dg41ylWKCaIAs3R3DTStx7EiwzHEDaEMmcYx6pwoV/F8WA==
X-Gm-Gg: ASbGnctX2hUlhuY2LMcQZXr3puKDm4idoUvCl3/r37z0tw8ciVQP3TCbtEJqQqyH8N+
	GhlTOciJ/Ug1SBvA/GwVDo67OzR5YM1W1lgHOVV/xvUY+sZkAhALi+t97XgQeROZrv6bP/KgnLb
	5AmhXqlYfDpO/jveh1bi1+xvqAa5LGsFwMtMO50JfeLlfeLGo7w6l2pTIfL2jGyYs0Nugyblc0v
	Fvee+SG6zM6RwMZRpGP6MhCJONWfRrZr5kdHkH7NOkjPnsU
X-Google-Smtp-Source: AGHT+IEfsyRkYuAHs8u+yl6ZKtUK3ttpKUDUQWPgwjJV3nLLlPiD/hu6PyH68bIU0YLRjquIsUszwQ==
X-Received: by 2002:a5d:5889:0:b0:385:c878:62cb with SMTP id ffacd0b85a97d-385fd53ee6amr6663715f8f.39.1733348114888;
        Wed, 04 Dec 2024 13:35:14 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa62601b5ddsm4506966b.118.2024.12.04.13.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 13:35:14 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 05 Dec 2024 00:34:54 +0300
Subject: [PATCH v7 07/14] arm64: dts: qcom: sdm845-starqltechn: remove
 excess reserved gpios
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-starqltechn_integration_upstream-v7-7-84f9a3547803@gmail.com>
References: <20241205-starqltechn_integration_upstream-v7-0-84f9a3547803@gmail.com>
In-Reply-To: <20241205-starqltechn_integration_upstream-v7-0-84f9a3547803@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733348104; l=1258;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=zvVaBsOx8LkyJfd75hG74//crP1potwo+5tyyj61pkA=;
 b=9rR380WCgGe67pF5MGZ+uKZ+xelAiWdpPbNFFKvMisyVFxgwBqY8LXz6/cIQmTIt902VDjSwJ
 nKELcHBAMy1AvwW+XcYGWxTSM6QyzylT29VAbbi35/GP+tceka4stx2
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


