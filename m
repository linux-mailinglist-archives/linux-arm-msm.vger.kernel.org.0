Return-Path: <linux-arm-msm+bounces-81379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9618CC51A9F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 11:31:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0DFB189C3FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 10:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 696DC30AACE;
	Wed, 12 Nov 2025 10:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XXC6MVAk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65653054D7
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 10:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762943356; cv=none; b=mMhTC1Xys0l3ZXWikbsWSNVPh6muxvZ9FAoAxCSygsbYLlYDcrTaiPR1fFLcFg7Rrb0JUJU/3+VHKxGlh9obBvxxo+bkes3li9F1oxwHY9oDqxqfzN+nleDOXkyiHsZvW3UJYsbXxoMpN7nmyxk7/44p026c5c+osky/SPY51y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762943356; c=relaxed/simple;
	bh=oH6NNnU6YnXoMLAuucc3pTLRVuvHWITrx+nY03hzLxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iPav0AJDQgxzC+5VbcB4AHrDLsVQq8UQguM5GZXBZ41A4q/MA5MVNr76dmEVRO7jxZ2EHYOmT+9xV8XXopf6G6n5LPPh5xNmxLx9Qs/G4o10Nwi9k4lM4P4fP8N434AdVeKpu/U4/zItQK1HS6uADVI4ULZ+KzpsFj6pRFsmcZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XXC6MVAk; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b2cff817aso98801f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 02:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762943349; x=1763548149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w45OgRvMf8Q8Havr8iuy1kijs8a2N48hste9FDQZ8ZI=;
        b=XXC6MVAkuF+U8XZU9fU9/p2sUUxKxE5e9ahQdi+uBCd36gC+4exHJEVyYD6AAJWeXD
         Iyk6SNsMKFaZoq2otxuhUiY2MWzoq2WBc4PCEDAIIyV3AB/Ue5+8a4cqJUOawdc+zwCi
         ilIWZMrFiWzQWpGywK1dNvhpz+z4U09nkPSkx0n2U/BL3WKN5APpxbihd5UqnRiVsaK8
         z4Dn6CLKRKIQwy6Ndouqg2hBjsNweMozXz1iRa15QnsvegfR8Kiu34poS7qv10cBd8kb
         Y3/4BoLk4FJjaWEWLrWsfAesB4fDxiefze6DWPxTEpE4M5Kc8DGxkeguyOvG/ewLOm55
         0Daw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943349; x=1763548149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w45OgRvMf8Q8Havr8iuy1kijs8a2N48hste9FDQZ8ZI=;
        b=jlEh3x4O/6yxxXnQDibHHTuclF4IJuuuotafD/ImQ67IWEit6Qm3ur8VQPF4F6+UTa
         WlrmCYq7RVOQnOonDddbq35LtKf2aNoXSyDQrmkaDaSRsSWURd+yZE6gtYwhdmlYsRWi
         gCJeRW9WRwWP81EO59h0WN5v0l5P93AvbY4cYGX6pmUmxp8DeVeBNJ7GHVDZR0YzKj9V
         xflqXekX3qcXjMvtgZ/wdqTQ4lMoUpFks88qmZ4Z+pDNwVcKTxmWXWc+p2HykqrYcezk
         ppTYjSkcgX6OtcjGhj1zRX1XFaJSGbE6gkzhY8lMcBdnT7QrRSF+12ChBK/kkTWd7o5L
         VjqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcRgR3eLgMG7aYx6QgSCm22HVC3dh8lTOeMTS7HHvyb14vjdVRLPNZT8JVSgz11gL21EcsIzKFzW1099VA@vger.kernel.org
X-Gm-Message-State: AOJu0YzV5WvXxCZPhnt4b/ARa3Qu05HwyMk+e6oed9+pgDJy+pcV3VQf
	dZocNxy+NSxDqTdEnUr8pkEBem76oNHK4NeL2UgxlUi846qo5MlEv0Aj/yv2eP3VFLg=
X-Gm-Gg: ASbGnct5X6EhvmiqA6ZsZfHF4tc/lC7e+2QVSt2SLPTCAUPAT5jnW0QF75uxG+u0s0f
	6UlqNDlbvx/WdfjcPEDz697FigfdaR/J5xbNje35ULSbCZlQd30TjKTLkH7rZfsEOoQhmIdpCg7
	kpncgSOHav2ZSosiK1Gco8wln7U+FR9dMpeXVyLv2KCfeCAWc0M4UzGaObDwJnOO60fjqBXK/8a
	YGjT00pCYufJPwer7gZyuvoi7MfRayT384zTqlPUMfeY5ByLO9Jjcci5rvA8EjWQMETk/4u2VvH
	yJ7Lm9tk9gYDJB+OEFbo6FDjkgqOV1lEXuKc0xq8PNkra7D/QaWkdlmieTAyfsFcVuo0h2zTgv2
	D/n/IIkJtBS0cO2JKGTGEJ1dvZCjoperi677hj3lTzTLmqqZSF3PnadeDj+kC3VTkkLskP81KSP
	9cP57Dwcj4d3tv4ew3
X-Google-Smtp-Source: AGHT+IEBjmd4u1QNttKmz7L0aw18Am5hrtzSeYwW7S0ncXT+W3NewsEFilmNZtDfK1rOFBgpa6PWwQ==
X-Received: by 2002:a05:6000:230e:b0:42b:3746:3b83 with SMTP id ffacd0b85a97d-42b4bdb73bbmr1049815f8f.8.1762943348777;
        Wed, 12 Nov 2025 02:29:08 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm22020001f8f.45.2025.11.12.02.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:29:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Nov 2025 11:28:47 +0100
Subject: [PATCH v2 02/11] cpufreq: dt-platdev: Simplify with
 of_machine_get_match_data()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-b4-of-match-matchine-data-v2-2-d46b72003fd6@linaro.org>
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
In-Reply-To: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1374;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=oH6NNnU6YnXoMLAuucc3pTLRVuvHWITrx+nY03hzLxM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFGFlkwl8YTtZY7iax+Pe/MvWCZAulDzXGghXx
 4BV76H7fmiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRRhZQAKCRDBN2bmhouD
 1xlWD/9VRaAIX3FFAH/ubXfeuDcoGvwYZtXIVY1BLh4qOi4HRkmmln3Jfimzlkz5D5X3+i6NtqQ
 0f1HovNsLqCXe4SoP+d84VxH3XJu+thultJiBSzY5REZBzuYUgw1LNScrMkHOmmQahZUam9U8m2
 tCyfi56sN7E2oJhj58rR3eoCg74pzQq8+1SM45wM2bRKF+JbQA+8ihs1lJ9Dzczj+LWRa5CDrRa
 wVUXEGrbnOAGvs3H2excUOVIcfy1UbP0Q0cvYYj0mlnE//XJc0pocM+tmvS6/NzKmLY1J4cBK14
 1goulVQRxW2dKVVJY9uBnXHXdvRnIPxq/r69ExWCTNuDFZPNWMTTuiQieXZUyWzKobS/U6OP02Q
 /sgBkG6T1lP3+yOyJv4SQXw01BgisEb7o7hi1mJuUSCyfiv0qmTRJU2Iw0WsFReZuPkGbGJzyc0
 BU6tmYiAOsQCNkVb6tap5NvJpjR1Dlptumq88tHldU8JnTQaFLT7aa+GSFDDT6qgVc9z0TONc5n
 CmJnG0Dv6DUot/Tn+V8AMRr74MafVQRL0blRhvffhK2OKLVbekFSoqqV7WcDld8CYYvJcHQjs+Q
 xl7FL0e5VPU/BwYuJhfWXZWQMHkPp3koK8X4Tet2TtzqdIge9u2pMqOsi+SuEoCkUJUMQL/aFoV
 nfJyjKI/mqIUeyw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace open-coded getting root OF node, matching against it and getting
the match data with two new helpers: of_machine_get_match_data() and
of_machine_device_match().

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Depends on the first OF patch.
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index dc11b62399ad..a1d11ecd1ac8 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -219,20 +219,13 @@ static bool __init cpu0_node_has_opp_v2_prop(void)
 
 static int __init cpufreq_dt_platdev_init(void)
 {
-	struct device_node *np __free(device_node) = of_find_node_by_path("/");
-	const struct of_device_id *match;
-	const void *data = NULL;
+	const void *data;
 
-	if (!np)
-		return -ENODEV;
-
-	match = of_match_node(allowlist, np);
-	if (match) {
-		data = match->data;
+	data = of_machine_get_match_data(allowlist);
+	if (data)
 		goto create_pdev;
-	}
 
-	if (cpu0_node_has_opp_v2_prop() && !of_match_node(blocklist, np))
+	if (cpu0_node_has_opp_v2_prop() && !of_machine_device_match(blocklist))
 		goto create_pdev;
 
 	return -ENODEV;

-- 
2.48.1


