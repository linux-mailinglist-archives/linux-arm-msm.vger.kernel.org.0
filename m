Return-Path: <linux-arm-msm+bounces-28764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A08D095432C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 09:47:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AF58285186
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 07:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E567F155327;
	Fri, 16 Aug 2024 07:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sRFDflZe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F2214EC4E
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 07:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723794059; cv=none; b=K77991IutCt5Lq0M5bjdH4j5PNA2Ppx2Fp7O1V5VJc7t9F68fiPtRv01PTa7l67Jt6YnV5HFyHvfTzSsJhoAefVkCMCVtTXvubuVihRNQ7g0B7QHy1W3ahqDkMcK8dgOL8Vyii7Hfl+XUDRmrODUrLE2RGW1PCYHk9nFTJE/fmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723794059; c=relaxed/simple;
	bh=IirK1kH8ZFaYK+Qd1HN3sx/SR5DeUZclZQLJnYIcqp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S5ueJD/PFnlVGvRJtDr57RyOhEC8S6iTKGEtVb69xOslWladvhWmZCrx/b9lqGx1w5NfsIYARl/8ULJN1qlMXlfq7RWk2Rfo3q0EX4btAjFNwVEFkTuC8FAstgPGW1MvwKhqOWMphZhK+k9AEnXv8Z4yXA/t5SEr2SHs2WGeReo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sRFDflZe; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52f04c29588so2402133e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 00:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723794055; x=1724398855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oOnuVPSEiv2AcMdh6RSWf26c7BxWtZXwLCBzhkW1eTQ=;
        b=sRFDflZelQqLh2GzBncplbSib1SK1tJ/h6i36pCkAQErUXZCF6NCh3CFoJRQ8VfCQC
         FjBiSUkYCpiH3kjdcY/C3v3IHCc4seQ0Deq2o0CKTDGxsT2FCtzsEvgerHlE2kZegpIZ
         Gxagtb47e4R23zS9AymrLM786jKhKyQ5IaeFcNoT3qlk5rlfoHRuEQ+coD4FqVD56nEn
         HGSwJOaSn2fHnkxCLJYplwJPytTaubkrd/T1/KMaunsoIPXrZ6B//SaXfjEmfuVL0xZ2
         U4iLBpZpG6V4rJHHKLTuXLUlNRDS6dGQGeDEBYW+iiT67Opc0OSf5PYzvpbUhkQ7xxPg
         l7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723794055; x=1724398855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOnuVPSEiv2AcMdh6RSWf26c7BxWtZXwLCBzhkW1eTQ=;
        b=rJrcpFiLZWuHx6rKZjm+X9cCPoFcWMTVdMS64T4QFqOK/EpMqEBwxi/iKF5gdD9QTJ
         pHYTqtt+6XzJIFzWP95G6RSq4NkHZ4rE4y1FRTTbmoTKTNL31BSsJFp38L0D/ZPmu4ME
         R6FsdaPnVxt2L/PrAEsbiMQ6pVEFmkdKyC+Oi4GrHHNifEXIjxlhOb+Bhi7KrM/wiM1m
         PHoZNad+sG5D2fkTCd4Yl43EsJuII49f42NYINOWzuNGtv9q3GZ42NLrik5ZtEiOX2Jp
         Xry2sRYgwpNsNVVRvUOGSrKa5Pd3RJHaJm8oINGnMWm1VOr66pwGybxmqaEd9QISehOG
         Ux2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWa/Byc+KTPFmsETJYTRmjT42TABYmF/BTSuzduG8HMHU3NoEDEjiEHwvmLgBqvyLABZNSK6Qkfh+oMHaybWhA6kwtd0kNYM5iVyfjw2Q==
X-Gm-Message-State: AOJu0YwutebdqwBCXmJND8pzKXH6X4HknqMCRCXpO4Tx45eESyRE5CNX
	A8VNQBs2RODywg2ECSSR8XQzgqCRjXv6C2feWCUIfxb8IdH0lGLfybMXuoqvZ6c=
X-Google-Smtp-Source: AGHT+IGm5wS69TxUWTKg0DzxkZwTJea1xUpbHE65rKz/zhe5yL4AjAz5VVHvzlDKSEanOGu6NzifNg==
X-Received: by 2002:a05:6512:2346:b0:52d:582e:4117 with SMTP id 2adb3069b0e04-5331c6e979dmr1102171e87.54.1723794055062;
        Fri, 16 Aug 2024 00:40:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded3596esm68549625e9.22.2024.08.16.00.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 00:40:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 09:40:36 +0200
Subject: [PATCH v2 6/7] thermal: tegra: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-b4-cleanup-h-of-node-put-thermal-v2-6-cee9fc490478@linaro.org>
References: <20240816-b4-cleanup-h-of-node-put-thermal-v2-0-cee9fc490478@linaro.org>
In-Reply-To: <20240816-b4-cleanup-h-of-node-put-thermal-v2-0-cee9fc490478@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Chen-Yu Tsai <wenst@chromium.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1360;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=IirK1kH8ZFaYK+Qd1HN3sx/SR5DeUZclZQLJnYIcqp8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvwJ5VFTD7jL8T2C8EqxXgCoZt3AMXm79PgzLr
 sTjGUCyw1CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr8CeQAKCRDBN2bmhouD
 185yEACQBjW7Xgteb2o2laP/JQ0q3JXG2b2i0GZGwB62iEyDcJl4EGxBEYWTcrT46Hu2ROUiWQp
 w1q3LqVeSLyeTgJBHMJsSkkjhfuUxKQWw56DNwzQKUAyh4Fdvghc2CKYG+cwcEqTJQL7tSdDgZw
 KYLGFFrEkyk3wlvOtQakEetOfeo25JvN7cRrlsXV3PoH7YO17+UAPON1ou4KYLlykgmm/ppYxUd
 zfql28aKU4u9B2AymcC5MR22oqSwFYKHVjQee4HAkz8S8v3VxD+I3eOrdmsVTiEukprVNg1i6TZ
 xDhx4+YF1Js9VHiz2UVhiS1WNClUjtIuJRk+FxwL1cfiMLo43nZA2J326D9ZW5/QTY1wQDRshq8
 pYZv/BwvC3nqcvQ1L7hQdwtGEH/p3B6EqwVyNuTsVQIMWdU2WxbS9n9ema0tyKKRmhXFNiKERvg
 Jtbbz3Nn2TjOjTzxxSVJJESFTZ565vyBN4moKHimhY2oMLxrSrX7af74T4DSE8QQYtOuOPRhHaG
 YURgdAWhPOrQxyXTmWnTKOsanvyYzCnnmD4G+PoRKKH0ukZbLede20bOFqANr+ARvzEvAPEKL/0
 Ot1U/iyTkPXgGJFg9NJxZCHrGHulNvz47ruEPfYLGRTO/XsI7D2CInaZbbbJqzrSxTFMgr/2Tnl
 OIS185LIZoedfSg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/tegra/soctherm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soctherm.c
index a023c948afbd..ff4eedb553fb 100644
--- a/drivers/thermal/tegra/soctherm.c
+++ b/drivers/thermal/tegra/soctherm.c
@@ -1651,7 +1651,7 @@ static void soctherm_init_hw_throt_cdev(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct tegra_soctherm *ts = dev_get_drvdata(dev);
-	struct device_node *np_stc, *np_stcc;
+	struct device_node *np_stc;
 	const char *name;
 	int i;
 
@@ -1668,7 +1668,7 @@ static void soctherm_init_hw_throt_cdev(struct platform_device *pdev)
 		return;
 	}
 
-	for_each_child_of_node(np_stc, np_stcc) {
+	for_each_child_of_node_scoped(np_stc, np_stcc) {
 		struct soctherm_throt_cfg *stc;
 		struct thermal_cooling_device *tcd;
 		int err;
@@ -1683,7 +1683,6 @@ static void soctherm_init_hw_throt_cdev(struct platform_device *pdev)
 
 		if (stc->init) {
 			dev_err(dev, "throttle-cfg: %s: redefined!\n", name);
-			of_node_put(np_stcc);
 			break;
 		}
 

-- 
2.43.0


