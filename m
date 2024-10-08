Return-Path: <linux-arm-msm+bounces-33508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA71F99437A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 11:05:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC7611C23D46
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 09:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C7FF1DE2D8;
	Tue,  8 Oct 2024 09:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pFkUD8SQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01501D4175
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Oct 2024 09:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728378033; cv=none; b=a0qTY0DzdEzh8ycPWvKIUG/2UBtkIQvBpqVKwDJ4QtUEEY0xmOZn7CKb3uX0f/RXJpjJKRd8VCGtTerAXcq6f1Owc4To5Lt5WzP+XRHIiwGJFoWRuXezg+e54BcLt6dmeu8j59vC4vaOKp4EhbD5cnt+OK/GjVy+2eDlxWMS1BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728378033; c=relaxed/simple;
	bh=FhSSUbYjEIvtsOA30smmw3DQZNhLSc6w/jfUrv5pJGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bOtDObe/k6kjn7RKZwzefpfMZszqIFTdGe/PELRX+ad0gSf4FR19PFuUBhYWynm5TfNntx7c4Dn/KUDf+oCBDFblWAYDwBeJRQbtIOcKipZ6NlGO7IZ+38jAmv/yuC/TEY+UGE62F3mcdwUA7f6Lxf9sFYfOD712BTvIOpvway4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pFkUD8SQ; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c884bc72e9so683026a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2024 02:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728378029; x=1728982829; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WqvSXxv/sXZh4YDTgQXsf5TmgeATsSUVXTwwhzFav38=;
        b=pFkUD8SQrF7dN4wJxVAAqXAxjByuPm8DaBRY+Uvs4Rtz9HX0L+1/n9XHe/lIyMvRIz
         73mxxAyfJqobbHEQLKBuyIDgwisHIqLMTHolUDnZS7zDWdnQKXZAh9RFw+9JZEPm2XAK
         2sD4cvUdxqkJUDvFYP9cyyS0JOF9vdELJhgEN7B+NxRPK6PSaeOChXGMZ3dJqoaHFCcW
         jAfDTsJYlh8VxecJ9R5F6ZfrPTeazxRsrK9E9TJOdKLyKoWuex+cAEBbvp9tDesPkG19
         EnKIrHY1aaeTkXsK9sKz0SJlMTkRwFa3vVLvjbj6jXMK/t2f3Z0T5rRzdmuTsnoIXV9x
         uw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728378029; x=1728982829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WqvSXxv/sXZh4YDTgQXsf5TmgeATsSUVXTwwhzFav38=;
        b=szHV2TmQRU5/Dbd/Af1lXYTwQ1i9FVmERBB30kyIDpTmyVNDwbnGYkBwJwTfTymR8J
         4vLmRfpp4JgCJhiosw0o5COStocj2eTD1STZSdJrJwUgdwpS0tUxBjKMW1kbLgbNlAQD
         3cGwV6OgKcrpu5X7jun84mrXn8heX6VmIqqR+J5g2PBSlmXjYTxqwrIDKGzIOY7d5qVw
         UXNHsIdn5cLJgo+fPK2x+fyiVreFGeKVqPwC1V8QWCPQbEyMp6OWylzrfkavHqLaj3Mo
         AhMHo/soN1ggezplS3DKN3I3V2ntRldfkR/aWrs08VXqtHwJ09vZMrwrxPOBjx8mQEej
         YEoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyxi25vY/ydGZG/YjaXP4ldkL9pCg1aNuraIv/wbAt1hQkLPBoItKImVkrYqjKbiWaxfav2qFm6GJsQ4mh@vger.kernel.org
X-Gm-Message-State: AOJu0YyHpASZEfM1AdY+F0jo0GOc1wMJQc956LlXpWjr4TbKHUNEWCH1
	uGhFLt2DRCminkUGCTiQy2D6raU693bX827zAzH+IAXSZUHLzjSmXkAYgWC0pc0=
X-Google-Smtp-Source: AGHT+IFnyQZ00WTesS7K+tvwWCInNJHE2ElAD+QHyyO9zbJNo147gVcQXc2DQgTrdqZeOoQgnFBBVg==
X-Received: by 2002:a17:907:a4d:b0:a80:f54c:ad68 with SMTP id a640c23a62f3a-a991bce2e1cmr668029966b.2.1728378028617;
        Tue, 08 Oct 2024 02:00:28 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a994e6e571asm294701166b.85.2024.10.08.02.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 02:00:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 08 Oct 2024 11:00:06 +0200
Subject: [PATCH v3 6/6] thermal: sun8i: Use scoped device node handling to
 simplify error paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-b4-cleanup-h-of-node-put-thermal-v3-6-825122398f71@linaro.org>
References: <20241008-b4-cleanup-h-of-node-put-thermal-v3-0-825122398f71@linaro.org>
In-Reply-To: <20241008-b4-cleanup-h-of-node-put-thermal-v3-0-825122398f71@linaro.org>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1794;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=FhSSUbYjEIvtsOA30smmw3DQZNhLSc6w/jfUrv5pJGQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnBPSfE1YKQx6eHCEVnRKeY3oZT2E67IuVgGqTh
 yKvFuSWE12JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZwT0nwAKCRDBN2bmhouD
 1//PD/0a92e+IdVlo1Rd94IpF461K36Nbu2qEwIl8Z7fifaGiJu7QHKtVmk47ZohZ6B8ygJYuXm
 T0qST14kdxL/AXy/Y23FX+h7AETR5L4omrqBZwsIcD6EeX1ap7QKpE9Ir8kjlTurpPf4N9XRvEP
 ZhxUCifgdhjpf5bHjGF69fW8S76we++KAKPCJJXV2YZ7NEM0TL6zbkJvcuOXsVXtMnmqZohB/Dn
 3SjUZKT2nWWBEZAJLm++7ll2iXeue5bZReaf55ifDGSEGvht2vQonR3dTnaHAC8NMTsdlOHBIVv
 +MAN3obefMgGDXwMlSlxI4DME6H+LSJ/PUzba99CpgbLug+WFpRGodxXjNBEfJWlG2sNGWYWdd4
 NuciO0D92ILoNmqk2paqYfM+BW9yanrVfIusWnDfzPt4iwUupv7/9+C+vSYkaMCRbo1Z8EyLy8O
 ot2Yoe91ibgcUCIjXx1o04tJ2JzP1rZFx4guOdjJvHMvvG/ZTKXcUiQ/SIkMupPathCMA2jCdwz
 wlXL5F8KSRRw0s5MaPGsrMh20yBKEgblq8+vPrNkJ8Lf8Oes9PFuNLTEqjJJgJEw9KgoL36/2zG
 lVpIywoGSVHcPjAotUE9tFiDT4q4ibyUp7Qt9HdKh5yTFk0qOmu3YaDG9gQer/pxcvTE/OjrctQ
 iYfmhRS9ItI4tAA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/sun8i_thermal.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 3203d8bd13a8fc2a9e5a59b3547cefc2440542c6..22674790629a7b549d1ce618998ff51f6553613e 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/bitmap.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/interrupt.h>
@@ -348,19 +349,18 @@ static void sun8i_ths_reset_control_assert(void *data)
 
 static struct regmap *sun8i_ths_get_sram_regmap(struct device_node *node)
 {
-	struct device_node *sram_node;
 	struct platform_device *sram_pdev;
 	struct regmap *regmap = NULL;
 
-	sram_node = of_parse_phandle(node, "allwinner,sram", 0);
+	struct device_node *sram_node __free(device_node) =
+		of_parse_phandle(node, "allwinner,sram", 0);
 	if (!sram_node)
 		return ERR_PTR(-ENODEV);
 
 	sram_pdev = of_find_device_by_node(sram_node);
 	if (!sram_pdev) {
 		/* platform device might not be probed yet */
-		regmap = ERR_PTR(-EPROBE_DEFER);
-		goto out_put_node;
+		return ERR_PTR(-EPROBE_DEFER);
 	}
 
 	/* If no regmap is found then the other device driver is at fault */
@@ -369,8 +369,7 @@ static struct regmap *sun8i_ths_get_sram_regmap(struct device_node *node)
 		regmap = ERR_PTR(-EINVAL);
 
 	platform_device_put(sram_pdev);
-out_put_node:
-	of_node_put(sram_node);
+
 	return regmap;
 }
 

-- 
2.43.0


