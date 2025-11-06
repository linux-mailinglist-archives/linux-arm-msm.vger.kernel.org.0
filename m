Return-Path: <linux-arm-msm+bounces-80650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E00C3D297
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 20:09:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85C3F188DB27
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 19:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 400283563D5;
	Thu,  6 Nov 2025 19:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oxPG+PMz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA3C355801
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 19:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762456102; cv=none; b=JTHRHKavD3iaEt5Wgt0zSudHj9qnO6704byPWFUrNVYC9SXqaTTkZrJS+sN2jLPlp0giMLxIbe1OL4mOWGUWAYS1CAXqJmZVRX5g/HOO9LPtPF9QuEBiq7FCVERxn8QXBD8SltbzF7yI4yOJDFroQaNyH/ZnAdbM9g2Bml9wvRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762456102; c=relaxed/simple;
	bh=VJX4q1mmI2ou2O4fS/+roMRPBdhrTr0mfp9hVrUEt3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MS3/CO2Jcf93gzk9bGJVUu+UcG9Ss2cGG3v2FsKVi3JwgbRbNLEwWIB3iyWV5IV2O0qOCcteSj6EzollBWgve+xxsJ4Ye+w3GMnNfvBYQ/Apr0oinE1AXfdOvgP5KY7IaUvMdyPDqPVRawjcQaFjS+Mrxfe0/ntEI6clmqo8lSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oxPG+PMz; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64124874e6dso159198a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 11:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456097; x=1763060897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l4JMGsObTs14isSyw/2HDk5qr9bB4dzim7Xxg/79G90=;
        b=oxPG+PMzCudnRvNQHTNgmenQfoJbuUn9LCXdHNOi4zkbhgf7Z2RZLfMfGreNy1jfIy
         37MHa9Tz8XILwak6miMhbgWTKCxyNXpp9x/VQOfv9WH+s6LPCFU65AKNwhAWrRZGtpmq
         PeIeBGS6ckK3aNnFEsXiEFntnUB+S6kP5QEt7JfvNmTFZWLn0svGxE69//RnYon47Ihd
         iV/IzU8gt9yH1tTTKaUVayeCMFY/84gH8QQBxDbY7zBSLwGWupr/VfAZEvwPamHI2KI2
         m1PDo6GCK+B1JzRqGc07LaS7THJSHgGdnau0w0h8+3fYHZ8aUoq5XLCg0xb8Jj1OClD3
         +/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456097; x=1763060897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l4JMGsObTs14isSyw/2HDk5qr9bB4dzim7Xxg/79G90=;
        b=xPjuMbigLz6zjV09mfabYZOE+RppPy3wG4hqdfRrKUoSPI8CxXiPt3EQa1WpGi3Kvs
         REmosn9A7QKu5rPXJh6UsocrqGP+Rr1RUTGAzdXFTYpRuUW3XwVJkZMFaVJ3KMK3qgzN
         NYGMEnL7EfV2mZuwQAwwMG7bIKk903ZdNxEdCTs0YV44KAJuPhG4m2KUBpGyFmM/NIW4
         +9toV1Rvp5idAGcoRkJT/9BZrO+M9y7zN2NwknagOY35jB4eQ8Kpo461/eCo1MszV+Vs
         hqYVXBgLiZQV/VJwPNbGsKDF/royS3xxmpmWRz8E/tit06S7DNXCbMfgHYZPIlKHjM0t
         84Dw==
X-Forwarded-Encrypted: i=1; AJvYcCV+tUndc+qsWMocFKaY35fIL6QdAwUzkmPedKrrY5qejcikCPycL6326PdjeVj8qt72/Qh/C3//r7cYfOPu@vger.kernel.org
X-Gm-Message-State: AOJu0Yya3sfkTorMyrOaEmRWbKLIxYFJYQn59y5+Di3LSLhUMOO0c4i7
	z6UJlIYK37e50fKYXI9rHMNoWjFweKimDJ8ODhgDmzUQ6X40cJT4DFCnCHW1OWShongqSCbPL0h
	Ip0G+
X-Gm-Gg: ASbGncu3bjXORG0NFJJFbZU1fxFXfTFRVWXgf2NnGrqd6Eb+LRIgB8SmVTkyWFk6kSj
	m978VVeLoLTiv20ATpeJZhyCZKpNJ0eKZCDLgN8O0okcvHYL9mKHYlnATt8oyg8O8D34P6UoW/q
	8zL3ImQiI7ozv+EwILKaz03BDG2Jssy5wEhfnPX+djxjoOU+XtwwdKla4NuJnmnQiD7x6+u9J0G
	UOGIZe0L4t9zcL48YwSSKBzHhfYfii6QvcZuG/zs6KCM7eMWxXjHJYfO1evfNS2eTlSdD9GY1eC
	i0KJ2FZVy4xrgnmK1UEw47VoGke8Z0STyn/0oDoCTrr6z/uO32CQSFOdqqU2g/+CRneAUwiAcc7
	jFF+u6SGpgvgTHjmNX1p1rnvzXTjzukIvQ+r20sN0ADJTGKgGUc9gl866PU5bbSftGM5F20AnFz
	mFabLVlsNat3ghppBQ
X-Google-Smtp-Source: AGHT+IFk+bNY3frZKV9s/ojuNfqyzPuYp51TMnp260XUevSmM92K38NtOvI6xgFcbZ7/Qd6kA8xBlA==
X-Received: by 2002:a17:907:7b8f:b0:b5f:d4db:731 with SMTP id a640c23a62f3a-b72c04ee049mr25494066b.0.1762456097132;
        Thu, 06 Nov 2025 11:08:17 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 20:07:11 +0100
Subject: [PATCH 04/13] cpufreq: sun50i: Simplify with
 of_machine_device_match()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-of-match-matchine-data-v1-4-d780ea1780c2@linaro.org>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1496;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=VJX4q1mmI2ou2O4fS/+roMRPBdhrTr0mfp9hVrUEt3U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPIMHFyxNlu4T2drLcnz2sjdbxNslTCnq8MD7
 ICJBBochkeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyDAAKCRDBN2bmhouD
 12JLD/9wxXcPWvHWK1TxOFBiNFBChyh3nSefla4W1FxvqtSjyYx7Ic6ZAWJQq0liz3u1ImNOUdW
 RKYq8vLm8PFRV/zuG8GhaamOHTAWvffbvpspD6tSO1JtKEBAbU+Y0mfF2l0okz/5XURUV/Azqoh
 IOKkU4s8fPs+1SeHX3dmJNLMD6iW7SredyCcNbRemCu2s692b7Z4Jjx8HsCIkSqsBYFEHDf3jA9
 Vt7uKrTHEExDkXxgTy6tCEIyYLknTaHZt0p//RhYPbOWa0Mkt1SUPC4TxwzZ8D4Sq1VcNmncG4t
 o6ZjpoF2Ina0n0SZ1iXnJwtgr/L51tqs3iDrxvgy9MOj/OYA3efvHNhODve5eNJYdvOwEhw82pT
 wYLVt2p7e/E+JSrkn4fzwQchUWkcVUqKs+NVqHiMMmR24G5PrP1PoWDUKivHZaqmla1XplHxF+H
 YjavMrtr0DiOkMnh7lQYhVSzQgQuGKY6qRZnLxIMh2ygHZx/MxcQkDtNOS1Xd8yowtDli1z5P5R
 SoRdK0Yb0Rnj4Ey/uypxoBDFFBeGBYfaszQAimrcw5t7lgmV6RRU19VFs47jOLkmj/o9g2Uiuf5
 XN6FX0JUwwkVHnhIr3f5NuPFaWZrkoYtGJsGbAj46rhCogv/a3exsmBhboYP4WWG/zB8RU+0ppz
 cKXKSifLH8r8STw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace open-coded getting root OF node and matching against it with
new of_machine_device_match() helper.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first OF patch.
---
 drivers/cpufreq/sun50i-cpufreq-nvmem.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
index 744312a44279..4fffc8e83692 100644
--- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
+++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
@@ -332,13 +332,6 @@ static const struct of_device_id sun50i_cpufreq_match_list[] = {
 };
 MODULE_DEVICE_TABLE(of, sun50i_cpufreq_match_list);
 
-static const struct of_device_id *sun50i_cpufreq_match_node(void)
-{
-	struct device_node *np __free(device_node) = of_find_node_by_path("/");
-
-	return of_match_node(sun50i_cpufreq_match_list, np);
-}
-
 /*
  * Since the driver depends on nvmem drivers, which may return EPROBE_DEFER,
  * all the real activity is done in the probe, which may be defered as well.
@@ -346,11 +339,9 @@ static const struct of_device_id *sun50i_cpufreq_match_node(void)
  */
 static int __init sun50i_cpufreq_init(void)
 {
-	const struct of_device_id *match;
 	int ret;
 
-	match = sun50i_cpufreq_match_node();
-	if (!match)
+	if (!of_machine_device_match(sun50i_cpufreq_match_list))
 		return -ENODEV;
 
 	ret = platform_driver_register(&sun50i_cpufreq_driver);

-- 
2.48.1


