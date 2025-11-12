Return-Path: <linux-arm-msm+bounces-81378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B15B9C51B2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 11:37:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD7753B0763
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 10:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF83308F17;
	Wed, 12 Nov 2025 10:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IMX7z39W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C35305E26
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 10:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762943355; cv=none; b=YhbQr2yYsV5yCRJA1PetpKep7aUxQTumSIFrjXZpfhhRLSlujR/cEYmGW8csp41ahTPLSSl/WmfuXwacVOKyZvleorIq0Tx5rYMm+J5txEw50AR5aFdozaXuwn1aibr+GxhA6H5ea6m1TB0Rszvz/zpAQTf0iknN3nea7QtTIN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762943355; c=relaxed/simple;
	bh=LNZVLd0eAq+BrnUkkpnNxcIGap0kv/bUjUexuvfEGXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LDSR6uT8z7wzVFjCbVGLJJku3ZFPRMfIbz1qVw95oh42kIbcxY8TyhfhqGU3apSeNwLaSWSWUL+Ko3BnDeUNv2Snx3g/lu1/0lf63Rtz74dmmEYEy+rvovS9UFxPZGZ1iybtOXCLLvgaCW/mq1gJmAQ86pBx9Xm1jl4A8EP6kF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IMX7z39W; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b2dd19681so104887f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 02:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762943351; x=1763548151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5/lQB+Uh1RIExOYxBM20d7K/TgstG2S7aLzqMU+wPy0=;
        b=IMX7z39WSRqCb6bctsLbnwfof1cCJnlX/LAw4QKVn7VL5iJDGx24yxnR5gw9oYiaZV
         vEPj+xfou3QizMRzKPwm9kG85X6fAh+ZMspjyk8pKPv44HB1IX14WfdKfmtzKJZbcH/r
         T2oUOwMKqdG+O+8fQgD+rYe0x63tJtRpcJPJqPyvMZMLmh0XdI0NQs2X+IFPJHyzm/QL
         pmtokojzFLQWWXCmhygLbx0F6NgU6RxMyHFUtqqNkfk+1+nmEhBLPbufDODVGYU0EVNd
         PscLdgbxVYGMQ98xKWoZ344nCXs6uyUj/s/c4HqfMqv7q2hkDGqB0AnVbyqIgd0WzecV
         3L0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943351; x=1763548151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5/lQB+Uh1RIExOYxBM20d7K/TgstG2S7aLzqMU+wPy0=;
        b=J9MzuOqUTanBuNvTPxhKKVf6yEP4lmifPeb1OkRUuJMv40rWvyiIrJ6WGdyOnRdRnt
         rzzcUM8R+yYYNZ1Og1HP5WuZj7sGaTvj+JruxCZWJWOJE2k8Gy/bgdT8o998gJrpOkeV
         0fSiXj+lWA/94v6M6gosSqWfxzjcuqUS7+aO0qbdIHmQJK0JmJVskcI0nnbI0yMDzsSc
         DgmLyvB1vx3/MBm3LArEeM4XOD32Cgm64oxGcpXHF9zRnhig8u914HVf/QikXtN851va
         pFDGzL5NBh735tp9c6rkwqNHsOzazVStmk4cwlWR28hH+zOSAt4srnPpFwTqzy+kj1Bd
         C7pQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBXJ1pBu0i71NyZhcjQe8ml9/tB/98vURBxJofQ47Wqdl82CmVR7dC5rwYun8tHyWS22ruyQz3bsRmqH1U@vger.kernel.org
X-Gm-Message-State: AOJu0YxUlOGpe8+mhWi0i2eC3N84DsJRtdNFa6P82DsdXl7vtHnGwo9j
	xR9JhbYnSyIONCAPEpI1Iakfjy5i0yKSIvQW18skCJGKfcdOR4c38S74HdLSo02YYBU=
X-Gm-Gg: ASbGncsW6VAq3xdPoMZ7aGcjBNMJkeQS1kTLSC0BZF4EvNvGrngZaClPn7L8T29n3Xc
	UbZW2DoFzK4aZeJS/588QINXPJap1zPPo6pCAHIAlyJraqjvxhP+0k/Oiw/Iziu0cmxs2pN477/
	fNKVh1sw/hG9uEGrpcSM/N4ECJ7BJlXIAtbrl1g8ed2Pf/23Sble45lR08/CiQd8TKSTqgxbX+h
	zsG3dYRJQCmtl6DLHWATOMmrCDbJCCS8GW1gACHfNeQifoack9B4AjoNrQfislWNCxV01DlEXRn
	lhIdUw39dwPuCNV/Tszw48JZc5/rGlH4sLSIq9Uo5dxUKot6aQYPbURI3x9gIVtsvTSNEmQqgEL
	dUpBdeAUNo6QrqBeQic5UtlijtEbzp/8aSJIYDCuLf8t0erl0W8Fjm5zMxPj8pxCXMKk4qwC2fa
	/qV9f7iF9bkAhoSJrjY3xsmUwGvdU=
X-Google-Smtp-Source: AGHT+IHB6n2PoFLTKpvGtutCOV+YXAAXwZCON+pwRDKraH4emSs7ggR+Jr7wcSja/g8Qf6UCT0YvCQ==
X-Received: by 2002:a05:6000:288e:b0:425:6fb5:2ac8 with SMTP id ffacd0b85a97d-42b4bdd0bf3mr1171080f8f.9.1762943350716;
        Wed, 12 Nov 2025 02:29:10 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm22020001f8f.45.2025.11.12.02.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:29:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Nov 2025 11:28:48 +0100
Subject: [PATCH v2 03/11] cpufreq: mediatek: Simplify with
 of_machine_get_match_data()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-b4-of-match-matchine-data-v2-3-d46b72003fd6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1305;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=LNZVLd0eAq+BrnUkkpnNxcIGap0kv/bUjUexuvfEGXc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFGFmEH2DeB6xb4ZsqGIiZXyCKuaghi7tcHXuF
 IW0yheCS2+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRRhZgAKCRDBN2bmhouD
 1z8uD/93hKK/EORiP0ZP33MBXOGFTWBhbf/7kPv1vUdNrOaOhPu+qdM5qudXfnS0028Qkp8N8Q0
 j5BYRsQSnrlxFw2Uzi8DVZWyW3kLmDHF4etZAeu2C1GJdClp9nkThAp4rYNKoY5yAQ7QQDATj1T
 y+21lzSQdWB9stCR7B5QQpOaYzlBfefo+ZsF+faalQ7B7L528JPO+Zd+UDwRJe8IRjy9xXuN1vA
 0t/XQoDfNAXIS4chQ+QlB73kfDsgNJVEyJjIGiW0+hBT9qGkKw6h1qYltWg2H/YOuX9lgZ7o2ne
 ws2ILzwsb/mTJiRIGaUjgeLIjoawH4vRMEtuim9SBFT5VOVYBiC7+QY7kxHTmpYDWJSAgconnF5
 H6m8yWbNnIvi05aPyR1wGY9Q+RJb8OQxpdJeIs96swv0EgvSp+nGCNTklo0TL5XI+SzJUL00WGG
 lmpgVGJK8oc5C2AYl3b29mKGu9R9RH82w8gE8TuQvWmg5VbGZESRWRSHf47W1OjuW9UKarGHVIU
 DDgjjdjor440n7ziUnnOycmB/nUZaIYE2yb9rFqNjg2N3nXgXx54XrI6zs7rZhypzRh0pK3Hh/V
 srAkeBC/7Nyj4qZfgaLfjnaKC1a5CwF87sC8+/W8jIH2Qq/BnmqyiW25fDIwD5WTvOjJdpm6EFE
 5nCBO8HP3QKMtLg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace open-coded getting root OF node, matching against it and getting
the match data with new of_machine_get_match_data() helper.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
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


