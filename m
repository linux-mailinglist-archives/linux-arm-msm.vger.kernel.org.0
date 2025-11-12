Return-Path: <linux-arm-msm+bounces-81381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF70C51AAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 11:32:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B66E188430A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 10:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C451A30B51F;
	Wed, 12 Nov 2025 10:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wgxAQFOG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6198730499B
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 10:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762943358; cv=none; b=FcRRGHPNP8cECUo/S+4fRxyXlyqJgdOMI0C90dOsRfTzBFWFp8NEg+iRS/65E2x9Vy2g3y5bo0eybk/Z/rZHzfbg0SwVCri34CkzJDajgPYSRuhXKqntwOk+df9VyOhBV0Zf/ibbIx8oD0xhIrO0bIi0fg+ykapaxKDg47+e/UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762943358; c=relaxed/simple;
	bh=81jTJshG5U8dunGjPlokrsbh1X84C4sADnDFTx0hch0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k0GKfR/aCpGnWYcgC6ti21vzcZnBNQANXVzFtdeEV0EIV11oX/bZdpzO+ky/d9zGac1o5PQSdIwh4W59q9EflRb3aloOtRE6/jAnrHgifqbsnq4iAUH0lLhA5/YxtPaHDDnNUHU9Yp0XBtwpDonnkdKh0udW5jxqzcjTqVDKkEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wgxAQFOG; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b2dd19681so104906f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 02:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762943355; x=1763548155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lTTwfl+8zqu4m1wm1arK7XbgGiT9bQGfagDjMk+wU6o=;
        b=wgxAQFOG9Anw9uOyjFx2pTNCFI/4mLtXZ6uITKqA72v83m4U39KMpIDU0FoUxqLvpv
         Dd4KzAvJiS/QyvBeIx3sOcsq2BSW670xNIgo9U8i/lMMPlJGigSFpURjyEks480xOMxy
         JfQNz1S0UqKii1F4Ud0HZ6EuWaWopy8dzy9fCIZT85IQ4UcrSGUBZBkcNrQgAzJMqTCz
         foLvEofcgVb7sQfkPZWpHNh99Xvr9sQRiVDrtjaZW9K7U7TZEGSaEiyRhIAj0cli2Se9
         5a44jK9tHREcQD02tnpfKcWWGj8rercieFRwRVhA9LF25lyCZIjgFtSiDixMdpVwqZD1
         bGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943355; x=1763548155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lTTwfl+8zqu4m1wm1arK7XbgGiT9bQGfagDjMk+wU6o=;
        b=EVu8AURzm1dSfdk/8c6FdJHcxSzDfojMnmhCJ5YlTpSzPQHxekkjEjyqT2K2L5e9GW
         uzpWjwpxnFjTtrJYbC+wzvaSZVFKGyAee20XWcXyhxPFRhv7dGzGsHvE+VW9cq8Ykjiy
         NZiOT7VKSHmFTNQqw5BlTQZmr1TdYqTRSyplW+gkHy86VAgR2bM2HIE9Wrl0RlP86/vr
         iEXBqZYBG8FvCccg4d15ScTyBWlk9p5jO0VhrrJVcvCDHHitp22N7P01VLOgwtT34SWt
         4GpduU9jGhTF4Dfm5+BXmBQegD9wKn/DuqiIbZ88Ojuna34SHCI2BrZFgYq1a1/5LCjc
         VY0w==
X-Forwarded-Encrypted: i=1; AJvYcCVdddvt6bNhbjnMuP710JF3qgi7aTmh+vRwaNzJfSGzuWVdvW3t5DI8rbqQ23Mh/oB7Ful8K0hkOeUitPEd@vger.kernel.org
X-Gm-Message-State: AOJu0YwQUKNBZG8nbehP5GqUzq/TZKrHY51otfdOzKs4N80PzTAJqcBC
	JYCFjwNttvXAC4Ps8qN2q9UE1v62BtLAEWvkdYFKmeDvm+8fdyWQ+ow0E025tncRczg=
X-Gm-Gg: ASbGncsKKiRhNkCY/CjT1j+AQoOTouk0eMpH7tZkk9mbfohs0N2L9e4Tgy7wbexf5rc
	4WvoePe2TdbFpiyMl5GUFW3I4tavh/BHOW18F/Ya3ZM/sH94P6LJ1Jiw+RhzVTBGiF5rFXG5ZkT
	JIJcSWaA0kx+JZYJmwae3+fSuDNB0lmfnRutKh7bnK155CqdLxryY9IxC7A6vEBx59Xxfb68Ajq
	s4Uru1n6kE31koil1I3fTYL8e2wQ/pyo6UciE94r3GdNPtWafcKvCsRyWib4Xn33afMX6GK5Wkx
	QeD7lW7eRGvEXSSbA6sIOpkgG0kg2qDCMdxuIYlxF9C97DqU9+8R41BJGgXUtQ8EQmJYLsL9VlW
	jTycnWeWaVa6oRq30iQbteRfIYuh24SAl4fO+ifhSRDJHHHjPq0FCClCLtQrIYbRYRlMm8aFtfJ
	ghziQmqmwhwQiFpDyT
X-Google-Smtp-Source: AGHT+IGrKXMvZPgqQESuBAhxDftEhNsnWrEuywC4iLSQ8rVCnZlglSobGl6lS0FycwtWDDujVctuoA==
X-Received: by 2002:a05:600c:138f:b0:477:79a0:515 with SMTP id 5b1f17b1804b1-477871eedfemr12412855e9.8.1762943354825;
        Wed, 12 Nov 2025 02:29:14 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm22020001f8f.45.2025.11.12.02.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:29:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Nov 2025 11:28:50 +0100
Subject: [PATCH v2 05/11] cpuidle: big_little: Simplify with
 of_machine_device_match()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-b4-of-match-matchine-data-v2-5-d46b72003fd6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=81jTJshG5U8dunGjPlokrsbh1X84C4sADnDFTx0hch0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFGFnyTG8g3Dv3wVreirAjpYs3pAX3qJ3UXkuT
 K35vq/FMbKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRRhZwAKCRDBN2bmhouD
 17JZD/981Aty8LTyqThGaZ2jPZnQRqILA4jQLUdlyGHSD3o1JOkc/OejeGBa2XG43Vs68nAkJAD
 joLQtVvcic7O5R3bHLdubIg/nwmSiJf4E3lzP/egNMDXmQGhpjFr+JbWrafzPx5AkJOcZkYqz6N
 YUgS2cJxbZYonK2umjv++lLOLQnSeIo2E+KprbWM0yjX6kUbPE4epGQaM065McRy0AIwdI4fxoW
 T6NV0F+1HAANoi65DBqfvOzIdaeldH2t1qyaOaX3hEtYzvDDKNjh/Ut1AmmH7gSnlsU7EfG0AwF
 O/P4RyK/k0twGUZr83j3MngPkzj6XIIc800HONG4zXqQcRu5Wl+UDmvPMfhu+G8hCTlD7pTKc7B
 3yRo8XhIdgJZL4BIBD3ZMaD/sfeWkS5N2HQce+sfgszMJWRCRiAIdL4jq2lZ87zhxw3NaR7MQUI
 LnKOqV7KTzrZndBUoFckzLoGxG9iwlS/Q2z/F/FzJK9Wcw7CYIjpNYhIrVxg8XbNbtfnvevBGif
 fIEC9fmM1ZsBP88jyZMpC/z4Jsfhbfv33/tx+L/MkGKxM47rhKd3kvDjANqxXGKWFhO2FB6auwC
 +Cv6k4NIK1sSTmE+jFxF9lSfYVoaZadbNr4XM6w+OP766Lilq7Fe1l29ZMNe+NsXwsVo4jys4VG
 Bx3+BfE9uyjqLNA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace open-coded getting root OF node and matching against it with
new of_machine_device_match() helper.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first OF patch.
---
 drivers/cpuidle/cpuidle-big_little.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-big_little.c b/drivers/cpuidle/cpuidle-big_little.c
index 4abba42fcc31..08f6bf2f6409 100644
--- a/drivers/cpuidle/cpuidle-big_little.c
+++ b/drivers/cpuidle/cpuidle-big_little.c
@@ -166,20 +166,11 @@ static const struct of_device_id compatible_machine_match[] = {
 static int __init bl_idle_init(void)
 {
 	int ret;
-	struct device_node *root = of_find_node_by_path("/");
-	const struct of_device_id *match_id;
-
-	if (!root)
-		return -ENODEV;
 
 	/*
 	 * Initialize the driver just for a compliant set of machines
 	 */
-	match_id = of_match_node(compatible_machine_match, root);
-
-	of_node_put(root);
-
-	if (!match_id)
+	if (!of_machine_device_match(compatible_machine_match))
 		return -ENODEV;
 
 	if (!mcpm_is_available())

-- 
2.48.1


