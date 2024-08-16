Return-Path: <linux-arm-msm+bounces-28759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CC1954315
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 09:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DF13B29679
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 07:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6778113F426;
	Fri, 16 Aug 2024 07:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cUEFcnkc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC1713DBB3
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 07:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723794050; cv=none; b=uRMAjwh+HJbKTlt7a5h0HebOYh/DYtz04/fc6+C9ZO+/N6SI6tBn7fHeqhch591kciIGOpAwLCzye/4Drq6pl64Nz15DkChD2D8sKqTYE83tzzErNU3TAeZwmdJfClBxuRmsOgw5JcL3ntHywSxw4hkaHLPyucNu4Kq/Za441q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723794050; c=relaxed/simple;
	bh=PGsw5QEex7CpuDWx1RGJUm5OKheN4rGmrB1iCwFW2V4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lnfg9OzWFwZgGSPvhFQQIFn+MZEu3vQID+0+vAhuQtdd2jR9dQdypKW/aAbORUZ15CzEgRWCmYJAQdkTb5QQ7O8kqE7txrclzHqq8Lbqk3EDPkG6GFacPOJMg42Fys9UBlPKIqLpziZfOYhqKfkj+wprw/960hf8QJfw29vdnf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cUEFcnkc; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52efa16aad9so2135146e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 00:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723794046; x=1724398846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1uGkngSoQ6xXDida4nnB27AlMz6Imue7QU/aLBQagO8=;
        b=cUEFcnkco1NOUOBwqzayBXVnkyiizhu3Wf5+NeVRjJzb1O44CtaBuhJ8KQS7O6sT9J
         ASQjmTpqQxaMPhZrq4LrD2CuwAGcfdX/XWNnBXh513bZZf9T4Hpflr3CqDsZ/580P6XP
         0/ma4R6pGOtEAGhEmYmHW0lPcmv5oShAIXr/cqgYd0EROM44niMY7p4cUSFizIcAARSC
         hnYMc23hfKudwvn97bgfjyaz3XSXwO5K54uWuTM13o2WQBj5JwAHotpbZ5F+aWTmPH+x
         T3jziHl8TwfIKluX+Ahvg7PcOzpVEXBPfMBwFMCI86ZLOWHUu5Ibp3AMz7SO6AJXtgOL
         BnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723794046; x=1724398846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1uGkngSoQ6xXDida4nnB27AlMz6Imue7QU/aLBQagO8=;
        b=ZH9RPk7Q9COecoEHDDMnAq01ILMdLdM9RVv6maf+arKAxcNkpLk9WR8CbsSNM9bi12
         mi2Z53gj+we3MvkmYiO35WfSuL+jSXJ00LHtOztXkiaskDD4NaK8bLY2psb/LirvkWCg
         2KQovnc/G8CFDbxeAeVrFxYVXUUagYV94zvdDZd4x8ZdQoL0kPfld2ubNAGtrNiS5vrK
         8dMGDSJXnZIonZ8IYH7XgCw3F2uu3txNQwUSc0Ns9AfeaP8eBT+uK6AMO8li5yBKTv9q
         +vw6JtR6aydWwzbIOZwcRD+6OzAu+2S6lJybMB2KOD4sRhqPdZldlwkflssGSq+jEMBk
         Fj8w==
X-Forwarded-Encrypted: i=1; AJvYcCXE8XRd+9Amy17+h6FNr+Bg9YGyoBnwhgtQ+TSERFP+2IePyHvRWAK/MjQDyED+R+6oiKHnF//aO5k3XNKXYVi/fAa8bQu9VG+Vs8Qd/g==
X-Gm-Message-State: AOJu0YxRhSoM7upF4MBYGmAulnI4vg9hDdjbY2FFLDEFe0DSjaHyaGM+
	6hqmm1qGmZieBJMfyImAalbJNMzCyEPsAoFjkn0a+szVPFKVyqEZRwQZfiOG8Zc=
X-Google-Smtp-Source: AGHT+IHVpxmEDbWkRu0WtK0xFv4zm5wdQAu15HLyFiw3HU25oGcA8Yg4aEM9aSa1ga5Xo/0m7M9nHg==
X-Received: by 2002:a05:6512:10c1:b0:533:6f3:9857 with SMTP id 2adb3069b0e04-5331c6904c5mr1276139e87.5.1723794046302;
        Fri, 16 Aug 2024 00:40:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded3596esm68549625e9.22.2024.08.16.00.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 00:40:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 09:40:31 +0200
Subject: [PATCH v2 1/7] thermal: of: Use scoped device node handling to
 simplify of_find_trip_id()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-b4-cleanup-h-of-node-put-thermal-v2-1-cee9fc490478@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1658;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=PGsw5QEex7CpuDWx1RGJUm5OKheN4rGmrB1iCwFW2V4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvwJ0a2oOLNxyHQgqOvUweDO+R4Igmr3Jpxu3e
 NoVVWn7VOaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr8CdAAKCRDBN2bmhouD
 1x/KD/4vzaf8o3Cs0YXq3URfWkk0gwTnAVURfyW6uwwZpyfLnu/c3oMd7TTIoOy4TNwSwBSvZjc
 W1rBbtDFaOvz/BBNm219y03iR1zBBaOpeShkSB0pRHJDwWgHDJpXMX1rau2AlDrA+f4lwJjPILf
 VXDQDyQFtUhwZ9ANVb7UDabNpbh1ImBgtqpCVwkdG+D9Oo40/5W6IaiLPj/BywB05eaoKvlyQ8v
 sOBetRdJQ8g/TYq4YQLEWL9Ze8hkP/+60KpyrwR5Dq8aldz2hbKQHN0XyILqw6jq2/Ra1J600BI
 PjyOV7YkvKAqF4BWp6IX6+rn21G5Alc9RO6A3p+S2++7HhBwdR7qU6kWgg60hXYtQJFphCOq+a5
 7Is+mjf50wlyoW/3KMKA8wfZKBaTD3i4fbMEdOd31RnBImAduYDdeYmTJtCso7+w9hPPPU6g7GX
 MyXe7aPL/JaXdn4pU0rPJ5GSCArix+Tg8WlCpLgIisjgtPoVULa3cSCOedhgTN7A+wYpiNMPDhx
 x+XBdvyGoCoX3au0cqqSH1wJIeUez1zzUyoN+MVfxo7rv2qrpcJm+mzOMSjhBlBFpyJ5Vd7eT5O
 WY1I3zLiEZZj+Gb9Zk4IpHXFreff/DOnjmmqZrSL/1B5/F5MQCkf9vIflh6tMbvHzx2aE6K3BfV
 +2Qf1zWMPdhl/Vw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h and use scoped
for_each_child_of_node_scoped() to reduce error handling in
of_find_trip_id() and make the code a bit simpler.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/thermal_of.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 1f252692815a..a2278d4ad886 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -8,6 +8,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/export.h>
 #include <linux/of.h>
@@ -22,11 +23,9 @@
 
 static int of_find_trip_id(struct device_node *np, struct device_node *trip)
 {
-	struct device_node *trips;
-	struct device_node *t;
 	int i = 0;
 
-	trips = of_get_child_by_name(np, "trips");
+	struct device_node *trips __free(device_node) = of_get_child_by_name(np, "trips");
 	if (!trips) {
 		pr_err("Failed to find 'trips' node\n");
 		return -EINVAL;
@@ -35,20 +34,13 @@ static int of_find_trip_id(struct device_node *np, struct device_node *trip)
 	/*
 	 * Find the trip id point associated with the cooling device map
 	 */
-	for_each_child_of_node(trips, t) {
-
-		if (t == trip) {
-			of_node_put(t);
-			goto out;
-		}
+	for_each_child_of_node_scoped(trips, t) {
+		if (t == trip)
+			return i;
 		i++;
 	}
 
-	i = -ENXIO;
-out:
-	of_node_put(trips);
-
-	return i;
+	return -ENXIO;
 }
 
 /*

-- 
2.43.0


