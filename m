Return-Path: <linux-arm-msm+bounces-80654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEA5C3D2D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 20:10:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DFEF6352444
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 19:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 045B53587A1;
	Thu,  6 Nov 2025 19:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ur2QlCq0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631033570DE
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 19:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762456111; cv=none; b=sEvIjWhDOA0DUxcDfmgzYockrus+76LvORpcAgRAneGGJhkbyX0HsR36klPNbiAy9RcQDId8yzA/S4wEmMcLLokn7Upipgz4Hbpr/V9NBolb4Fx+5V/X/ozkvBe5oxaC5IwFgY+Mwb/jIj4gDA+Ha1q2LXU79p1iU72l0qVS7HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762456111; c=relaxed/simple;
	bh=em6T/0hfaUrxxPHQSOCVHJqt17fZcoSzBpufVPMk75E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KbOrRjL4iFkjMOj3E07p+E9sqY2zZp3ZrRzXNIdrnY2VQYmKWOhOdeFcRCb94M5VEr2ODHh6SIAnq4Pu5m4fYOvRRltu3wZ2FlbLZsY7MSPmukQ2jS/QWa56Mh5tNtI8Lky2smWDRA/vGQOUlXSonesnIoBKjB+5jrIaWYX74/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ur2QlCq0; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64106cfa518so236335a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 11:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456107; x=1763060907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eFhUWdS232/zvQ5zx8YGxHTaYNY9a/jDdBok4SLTbUo=;
        b=Ur2QlCq0ik29I9065yrZX8pGcAy4KLJfXQcFRn0IllUo1D+SF98qQ+QnVFdRCi6cFl
         2mAM8N7jvIdZAA97AlUZU4ll5Bu/OFJx+IYTkptxqv1A4dnMwLJ12PMyFfT8Ol8Fh9UG
         kCMlk/hiY2R65TKOp9ROfIsKUJ0n/u4FkAUm7jiwtLd09a48ccspztfEgjg1CW1jtEuS
         AXgOID7XiciDjMC/nMt9wKRFOYCBjuO+zmh5YO2YZFpB5YpZsIuKZdXsuSfAPU+pDZ/t
         K1tdaFWDECiQdPmRcjS0sraSvMHRaciRa3Y8e/O/34dgDeKzr9txD8DxfgHwXaqU35nE
         RyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456107; x=1763060907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eFhUWdS232/zvQ5zx8YGxHTaYNY9a/jDdBok4SLTbUo=;
        b=fRL+gLMx4zgjg3z4PQ0YR5HrA4DyHnNYx0H2L+n4LQmpsPIwB43kBylcvr5m6iWLQN
         gHjbZ6e60n9MdpM/cH+3rTq6Hr3XLt2BM8c0uq3u5fIH0SVo7QgPUJYIQ6zNCDNY0OZB
         hlR5yhLK9Mim0IBfMw9EPsAL4iBOb+FraJ7F6Nhud0l6YBSa2kOtntxqbZJZXTYdq8LZ
         Z/gUw97vJpTSbahA/mxc7ucgoCpwIg6DfRCfnk+oc5uRDs1jrBsFeNmIiowePFZG/IcH
         dewhfq+X+yclrPeVMSfv15KO5kj7O0y7BmOHnPG4xUmCzF6/qFn5ubYg7MJy5IQ2gqL6
         rMmA==
X-Forwarded-Encrypted: i=1; AJvYcCWTwC0p0LQkb8xQ9y1gzMQDtXaf3aZp7pRPmOmxtiANCg9lcedFKIFAYces3uy+ARmidV+E1BvhlfLpIoZZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5ukBtipFwIm23sNcOcu36l5EZJ9ixmiuTUk2e3Do/20xyuzQu
	3lnJkA9n3K6KYPLUeVTPt1qBXTcawG4552gWjUI1K7GkmId4JDjWJyTYEEOuWhxstuE=
X-Gm-Gg: ASbGncuqgvqnl1QCKxwnUdou+1EUdczgkdQmVy+28/fuDPEZAWj5MMsiSkoyCCXdoFz
	15aC0gIHuem1VKORWDxivvI4IIQdyYezLTsfQuDqg7y1TnYcwUGwYbrGEGmYsdUgzMb4gCN/G/Y
	T7As2mTel3te26uVs6kNBrO7ijl0G5ojYRz/ZsLT+AP3/1F66Y3TuOwhZ8oo/KoBBMSSPiXiW1W
	nYS7AYI23PjOpLIdEPJiPWfuHseRAFyX3FJVyy0gdBuJ9im0nF368tOMTLOuOK8na3U0oDnWEp/
	KYWUGbGxRJlnBmzpkhtZs9P+0QIprTORQAtVABRUjJnEMITOsqIfHC1fBlyq9UtQYgX0wol6xKa
	OCPgScbZjPQH4pYkLIE3erYn3y0KQbZhX1Ozn4GmOA+nIywx2HntvnVJGFrhXDx0hQSBzBpzmvD
	ePayDoEvbdYITcmA69qeRAsH8nntTosS3j9HA7Xg==
X-Google-Smtp-Source: AGHT+IHV0gcmtT5dHOFz2RWdjjPo4Ym0Dxek/nZLw6T0N6UfI+vf5qBD6z9VCh47UKxNTUDt+Fg2GA==
X-Received: by 2002:a05:6402:1d4c:b0:641:2a32:b8bd with SMTP id 4fb4d7f45d1cf-6413f062ecfmr273551a12.1.1762456106689;
        Thu, 06 Nov 2025 11:08:26 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 20:07:15 +0100
Subject: [PATCH 08/13] irqchip/atmel-aic: Simplify with
 of_machine_get_match_data()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-of-match-matchine-data-v1-8-d780ea1780c2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1193;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=em6T/0hfaUrxxPHQSOCVHJqt17fZcoSzBpufVPMk75E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPIQPP9Q0idGJx68rbMt6LPDzi2dtyc+qS5Mu
 2MGYLCnw72JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyEAAKCRDBN2bmhouD
 19RJD/0S4D7rWxJnMM5I0ZYvnbWMyO/Pj+zZl5eFKXP8jMODrKLvsKA6Fg3LnSAdO8L+5R5rOrn
 4EUnjlQYlM54t/RRDk+Nzjd/KH48/DE/2WCAFiGImlDsuBP056TT98RR3yrY4NzyX24N/8z3ax3
 8GZFPox1BIaAcX+3EomDyR36I+92AkCvbnhnFPDKUTooHlSVWPX+K3FdtM//a58/chL6TZ86jq6
 1SgBn6KYSc22lQ59475GTGt4ta3S+5ZvHrQi2366EGm69VLEQq9Ysm+AGe/x12eHW53kGE9p0AM
 wapt3PIh/Lvpie5yT6jh7TtmdKuIaka3XM6EOgFwnkDLzsSGOZCBPg2Rcpos//m5AjddN2J1KGl
 0EZJIVYOqxPDRKY61SJacWclPPPmdC+hJOMGk4tr4v3b3IMuXPSQOSyZSkCuum4QMkPYk7LPZO/
 MVGJ3XH65qFgUsUwv7MGHHUkz2dgMMvzpi2oFBbsriL+FY82SE0gsjda3sfKcjj4IKMEEb5wCRu
 jHeDHhMGRpgqfbXiosWKNkJQpOp4gHIsuCueX40vRwcWy89afIZXxJ9cyXTBcyDrzOQVF6NovFl
 9Nz4nRsyPVVgw3gPqrDfWqzQlrFQeSwu5UTDL0iIWxTLElBqYmjApnQ6PvZPKC1N8OTCYhLlGUy
 JC6bgRbAddOP0nw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace open-coded getting root OF node, matching against it and getting
the match data with new of_machine_get_match_data() helper.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first OF patch.
---
 drivers/irqchip/irq-atmel-aic-common.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/irqchip/irq-atmel-aic-common.c b/drivers/irqchip/irq-atmel-aic-common.c
index 3cad30a40c19..e68853815c7a 100644
--- a/drivers/irqchip/irq-atmel-aic-common.c
+++ b/drivers/irqchip/irq-atmel-aic-common.c
@@ -187,20 +187,11 @@ void __init aic_common_rtt_irq_fixup(void)
 
 static void __init aic_common_irq_fixup(const struct of_device_id *matches)
 {
-	struct device_node *root = of_find_node_by_path("/");
-	const struct of_device_id *match;
+	void (*fixup)(void);
 
-	if (!root)
-		return;
-
-	match = of_match_node(matches, root);
-
-	if (match) {
-		void (*fixup)(void) = match->data;
+	fixup = of_machine_get_match_data(matches);
+	if (fixup)
 		fixup();
-	}
-
-	of_node_put(root);
 }
 
 struct irq_domain *__init aic_common_of_init(struct device_node *node,

-- 
2.48.1


