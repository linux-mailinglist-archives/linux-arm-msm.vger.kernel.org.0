Return-Path: <linux-arm-msm+bounces-80648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D610FC3D276
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 20:08:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4AD6C4E6413
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 19:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472D5355044;
	Thu,  6 Nov 2025 19:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ywvo39Eh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1943E351FD8
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 19:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762456097; cv=none; b=UsOVS9EDp0lO8C+Y53jFtT6vfhSVx0vzG+hgdq+YgC0TQSqoQY6qrt4GvPUuBG9pkqICJV1tMdXPrBqUhLQpY92HMXjLP09viSTuGWzu+CO84Ztw6mwpB9fqQo/DeKgfIGhLT/YMG9l+IAKXzuHYwKOFgPKnhvzzsT+sDJbRM9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762456097; c=relaxed/simple;
	bh=JUijnBRGu0gt5BmJL1AM+Ht/YwmL8eWcsQcfAW02eOY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c6bQ5kaOgeg9VNKncQvHFhGt45Zd7edWKOwmV07OI+VMhBEtoFQGLoMk88wSEMjp4G1x7pVUWWVtp8phh4Y+7nOM5dZ9Ftx280/MK6ClBOa0eaHrGxacQZ8U0XJBdTkCoBhzDrG55YJP9cZC5Mx7ug4dKZxNBbsIIPwi1LK6z3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ywvo39Eh; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b70b40e0321so16683566b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 11:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456092; x=1763060892; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tHx0ijyt7NNWrg5OZkXcDWeNAbRVfwuusWhyx0gnMK0=;
        b=ywvo39Ehduhw/1w5qNV1Rd9Qi/11oS+v7O4ALGwDv+MHMehRV0SsVxVRRtszWC0Bd+
         6wC/c2h0qJ/3LxtJJXqkN0QgMhZ1anLQ22EEm27VRq+f/+U3KhUKcPb8hSYNNgiajuYi
         DtrKvhUjwWtzmBALS0NWXA+GUX9AvAFDxHvtSz+Jch0M1Qn4ghTl+FjpsqExVb7Ygk0M
         B9ZYcx6LUcTaQdACLJEixFn+8iIh6EuyNNi7/W5zp+BlvLudk9pOyzl52sSDC85QElgT
         OMSP0RSKGogxbgcl7FVpfrJAHtceEOplf/C/KzD921A/5G0vogn3dvDs3mO0ysKNXfIe
         8euQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456092; x=1763060892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tHx0ijyt7NNWrg5OZkXcDWeNAbRVfwuusWhyx0gnMK0=;
        b=NE18JFd5KJ9I/bvrz7MenqHolxe2eL4cCPX2Nj6YpJb3MCAYB9+aRLOgspPdtGlYaG
         pdpWFuOxvhxL62UZMQ72xDiLWzncohBmYG72sy3/zfM9OWp+QCv7uJx0feEzU3D20Erd
         TSKGBO6E7ivaISIdxqr2TLEtpOFP41c9OXcwX9EmbUpcxS/tubVYG2/pvbwKuvXAoHC7
         DWtQvLo2LNsIZXcJ1cPi7DAS+ezHEeM9W2mr6w6sbYeBBdRY8k7d/spGbzRHEVIdFqgM
         P3b9IRYeMZq1VvZmcmIN+2YfULRcUM+gJAVPq8Tw3opKwK2+H9XvH4jHeBM7MQ6RqVO6
         oIgw==
X-Forwarded-Encrypted: i=1; AJvYcCXi5aKJctFjJlzVkvN19TINDA5ZmmePE1qnAD6LjZqf9uTKf60IpmUjzATTVWw/Haaoz+tdqyNGl9r0YkpO@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhe09oMC2FI0mtgSiZbBSxxuPVJfC2rM7h/2Wk+bctlqRUsVHe
	lZR9DUHMo5JeZdPh8B5slbEgl7ghtIt23dbFvJ6G/9lv7Eu/DiAEOg7i6Bompnv4ITA=
X-Gm-Gg: ASbGncsm9WOkElWkCK+ASTo3lbj5HPcJ7OhmFUg+42nW2Jn3YXhjocU+23dy+dJp9hX
	0Lm0FOZCrxcLtiRlpQBzrBK2Q9mcYraBFE1JStoiuJPMb46/OmKKdueEBTLfvg/asMu6YYG4qIE
	ktSNo7GyGM0NjaHwYKO3PNJM9EEGMWJbY29R7Z5bvo+LHSjAQ0hAx3aEmXbHwDqSXX1SncXuuQ8
	l8Ay3oRZD76QByqZ+m675mc2zdJIHIlVm1HXHPJ7x2NVbTyrT2WYG1ygGSOiiEGAhtXqfNfvZOl
	juNindsDmBGX7hGM249imBMkTGfFK5lIIixWX4K9GWCUmdg3/v8Q5UkpnAcIni0MCHSYN3uWUOj
	lgJDz8W5gcJs5puOaAMB+9oz5huOemcxbi87jD8WO0b26/v0COkBu5aAlzP7mlIY1kjHL/ezAwt
	P+fetEG/kx8WPWOiU9
X-Google-Smtp-Source: AGHT+IHEirr3Jun5greVbFzCCT3Fh3wTZA5ZwGfVN2ya/txpM9j9JLnmbgtXU2cagXUpIzPh9ex10A==
X-Received: by 2002:a17:907:3fa5:b0:b70:b45d:d9c2 with SMTP id a640c23a62f3a-b72c0d9ea7emr14466166b.9.1762456092426;
        Thu, 06 Nov 2025 11:08:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 20:07:09 +0100
Subject: [PATCH 02/13] cpufreq: dt-platdev: Simplify with
 of_machine_get_match_data()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-of-match-matchine-data-v1-2-d780ea1780c2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1326;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=JUijnBRGu0gt5BmJL1AM+Ht/YwmL8eWcsQcfAW02eOY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPIKQkvxWPYTlG0/11v2qnF+WGB4lyWocQIsb
 E+BCX699yWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyCgAKCRDBN2bmhouD
 13ftD/0Sb2L3Qr4nwf5h7Cly6LwsxSlZoJjp/W9v0WGxNdDeNrrC98D1uHWpz8WejUoTpe8FhvD
 /TvAuRvEANS+J/AyAE1J0evzHcegvDXb3QfmrpU6rIDNmDvMJ1MFHJVoJI/oBoh3Uf7RTWJsuSE
 v6xr6ScHY74ZSWqNtd/LlAeGoPXSLptXE1kVtWdhrxCgJ2SLG8wix8wA+g+yJz2ieJq+n0DbkmA
 eyMuFIi/0hL+W2kOFEYsO6kaIbHZOKlCWwGKnIes+8VxOLq5MTJDwwjgBNutCffRlu5f2WDSkcY
 6aifYmVkyUO/xmUTHb6aVpoa+m8plHAADVnWf6x3xFsKrZY6kb4DJZXBRHm4nfsaLeRhO0bSNca
 6vyTRvy3Ccsafdfrt3/olOOgGzUUE0UvQUHeyDAUROoTBo1IgN+in6qEA/GVNMqirxajkfNyrru
 yk0S0U+rvDq/GJDbvDTKlTvsD3RmL9oAb8PJ7FqRQSfehpAQ2KBxRy9skz0z9keE48KRKWjgEoT
 6+/QF5WcZZgZmi80F7k/Pb0doeBjTMKJ8o0mqJXKJmZWN7aUfUL9DtGtG8+uE5ef/FjgLfzC41X
 dUDk/Ndr1cvlzd5G+twl5YJdjGEbL0Ub98gORPtqCbpk9Fvb+BTyoQGLhNcLC0NrbZ9lH56bFRX
 pFHmzOtqHLnAOdg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace open-coded getting root OF node, matching against it and getting
the match data with two new helpers: of_machine_get_match_data() and
of_machine_device_match().

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


