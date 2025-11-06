Return-Path: <linux-arm-msm+bounces-80649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CBAC3D291
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 20:09:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 424A24E7FE9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 19:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 031EB3559CA;
	Thu,  6 Nov 2025 19:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CAffjnri"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD5B34FF6D
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 19:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762456099; cv=none; b=kD5ey5NRxgvId2LC7LrGToLKOo+o/pt86k8b/qewfFdKcXa4KtUVww3V4gpM01uvWg0gCBG0KWHgJ1O6x40jd/ivElGf867O8Kd5J4OfyXzJsn9CDoJl9DDU08sLHxUBdjzmLLX+73spUXlG/ARjfb1bJ2AlzYFcI+OSg6GNW9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762456099; c=relaxed/simple;
	bh=CTPERwGR0vMXN1C8guhiuGxeTUnLxrLtg8vK5MEHVnk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gFbCWwz2FcERzE1+SYdkcpqR5x80pW6YyYjeGoofAlRd4CaDknyU0B3JjlEg3TmJlLQGglywcH0h1eg4KmoKUMQPkWkLJf56GR7k7yQ1O82PS4EDEqxda6qFTXFt2pamSTXrSmkInYhe3dZu4BgOsTWcZU2fM0WpooYDWDWZPxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CAffjnri; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b727cce8d21so17756066b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 11:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456095; x=1763060895; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R6naE3xvBLUOEj7qpWoYnnhA5sncyoH35f6mKe7kp0E=;
        b=CAffjnriq0Dy2UjvoDl0BUBw3zhNTb8WHWWpIDzLUIUvADcjpG3skKRNerU8gmh6SV
         W4ZSXhrooNFkIBnbdUiBe6DUKGYGNGKlBO7Ja23K1C3y0gu9p+D6ng36LB29mrVc0M3Q
         V96LW4Zod13dA84ov/geKemH27mFEKqr4DVzDGVoDViY+AJBXaFQalyY579s0lMXAu7Z
         7y2ER5I202JuxBO3KFxxWGKgYXj1TZeMl3N7/Ha9yk0o0We/qNijt7ICCR8q87/LEobq
         VcNrsBQMAgWRDaTHzWdTC2SbZNGpD0a9eW4F5i2bbEJ+HenglkOAgy7Rlo0cFFfZNC24
         uoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456095; x=1763060895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R6naE3xvBLUOEj7qpWoYnnhA5sncyoH35f6mKe7kp0E=;
        b=bB+8SVWdRugFo/WwfSJ/i2McE2GbUP7WViCt/77kRg5zPnjGqtQay+Vsm0Hbb2fPBP
         m18Ogr1cJV3OeSb7WRtNmeVYeeQjfsRuSerBJrpJAUBDtOg68+AieIX4Can6he+n+d5+
         D7OjoL2xAveWT51U1mkLzbcMRawHRo4nR99IK73WDeBsoHhsMbzDLGpv4CGQKCuFtWas
         NC+EQMgCKKAtMvKnDMWXLM53JNsKBeO8bN3Aks7gSvAYu+7GIO96B/eZsNtsksYDrxc2
         vwaRaGAeAtUyKKjhVyvx4hbaC3exZsQOzgvNGGXKY6jLcL5E0j35VdbuH9pbRvvtie6p
         vdig==
X-Forwarded-Encrypted: i=1; AJvYcCWnkoJ4NjL/fj9Il07+hpbXgcUO+5F8wYfhuiZcsNIZ+WoY+J5gePUV9wpafDsgIL8K0v7N44H+NZvExvIi@vger.kernel.org
X-Gm-Message-State: AOJu0YzUhczjh4CyrwKR1/E4DomRZmb8Y0GofOvNXNWOIrTAvKXNTKQC
	4SfYsqYHEf22WjJHMNgpMVAYExjazvZz4Jfi7ao9cA2tqXcRRLrg9CdzfT0LDslImeo=
X-Gm-Gg: ASbGncsu21xiy7XGZlHsRWdhlehaWjfK7F7LoJA6QQoeIOi2fzO0735e+MMLkfNK4UG
	iLvsp/aZDv5ZmlikLAwZu+e6K+TpQTjiFU4MeNUIIKuwlyu5XhIp95FhrUIVbW/aIQ4CP51ZZ6e
	3jraGAuy5DfDgIp1Ch0B+lmdpfIElEBAlwGsWgHcfptjIa87Zyhob3PR4mxYQe0dPfWX19kMEPf
	AalmibhfR4sTYHQQ3/KmdH2/q/waHxg10jvmTS0Sr2RO3SFckAFsM9Cll9gN3AtKrvWQXyrpHfL
	R3R/YPfJYTMyraNk10EJx5ubmGnDN+JaZ5cp2de55vKgx2E5q4MWmcQbp6yuUwJInAiN0mkzpEA
	ZERTLyHUNkBvPobf3Jzv/86yyXuAcQ7GgM1GqzhBfg9bICTRHY0xoRqQ8KeS49mq2n5+PwOFgLs
	4s+STdL1h+HufhWIBonjBoDRqiA2k=
X-Google-Smtp-Source: AGHT+IEr4RF4E5wCG++3YWlDKZbg9YIivFvXtw4OBS4Iyhln9zaKKk5C0r/mzjc23RBpruUfQanxFA==
X-Received: by 2002:a17:907:1c01:b0:b6a:382a:1516 with SMTP id a640c23a62f3a-b72c0d52bf6mr17966766b.5.1762456094708;
        Thu, 06 Nov 2025 11:08:14 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 20:07:10 +0100
Subject: [PATCH 03/13] cpufreq: mediatek: Simplify with
 of_machine_get_match_data()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-of-match-matchine-data-v1-3-d780ea1780c2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=CTPERwGR0vMXN1C8guhiuGxeTUnLxrLtg8vK5MEHVnk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPILAuS+lVwfFACNKPjz22AAYwy2bMRt/Q93S
 DnUgdU65maJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyCwAKCRDBN2bmhouD
 1zn6EACV/mnoLciIGb4VTtmzF+e3USbZjuRip476+yuuWtnAhwJj3BwMkKgKezM4jwZiQ1WrGil
 16TT/t9A1kxXb/wtajTcOSOreBQH/r7cTofVbfolf4PEgMwNSA4fR9doVK97Yx18uPTlPdbIR4O
 XOkStiIMqsv4e7klUNKsXhdTjrheH9GCA0oWRbie2Daqxt+11029JL4W6yCgsxSIIyjL8tmnhDc
 devdZzJQJkckT6NdYe6NaCszbAstRhJa/mI3ReNfIxrKRjXZ6xOvbgqvUyjmhV7g6rPrMfrJevl
 biLpFS2mDn1cF0l+Fgz7tY2xFzEF6YzZ8reqiCXSLdysLlawci/V4J5drxnWmrH9TF1/OLXAOXv
 b8ePYzRjo7D7uf+eMEj7WB7edc8DFauttnNvvc2AV5hgAdUJNuQ+BDUgtWlc0kJzjjlhSa/BcKy
 3Jyud64JvwzEc0w5YSP87RP30/FppcGBhmjk1/dwn2LNnHSihOgsXxHgO5GHu0+3BUojGHPcCr5
 6cbRsV7B+esMM+vWK5zpDIgZQBe+MkZyehmRahg7X6c34KQabQVPQSpVS39nvYFTpDldTeumK6W
 PALkPNvM6TQ/kkaMJXNUaNPT9sQnP6tkCgCXvou2jIXiZ0CnulHJgiu40AHRP0m47yn2possioW
 ujbvgdZ1rNqGpAA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace open-coded getting root OF node, matching against it and getting
the match data with new of_machine_get_match_data() helper.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first OF patch.
---
 drivers/cpufreq/mediatek-cpufreq.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 5d50a231f944..052ca7cd2f4f 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -764,22 +764,14 @@ MODULE_DEVICE_TABLE(of, mtk_cpufreq_machines);
 
 static int __init mtk_cpufreq_driver_init(void)
 {
-	struct device_node *np;
-	const struct of_device_id *match;
 	const struct mtk_cpufreq_platform_data *data;
 	int err;
 
-	np = of_find_node_by_path("/");
-	if (!np)
-		return -ENODEV;
-
-	match = of_match_node(mtk_cpufreq_machines, np);
-	of_node_put(np);
-	if (!match) {
+	data = of_machine_get_match_data(mtk_cpufreq_machines);
+	if (!data) {
 		pr_debug("Machine is not compatible with mtk-cpufreq\n");
 		return -ENODEV;
 	}
-	data = match->data;
 
 	err = platform_driver_register(&mtk_cpufreq_platdrv);
 	if (err)

-- 
2.48.1


