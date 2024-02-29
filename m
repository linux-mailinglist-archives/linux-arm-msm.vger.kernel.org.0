Return-Path: <linux-arm-msm+bounces-13032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E972486D5AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 22:07:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 158BB1C234F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 21:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96BC7151741;
	Thu, 29 Feb 2024 20:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p5XNv89M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7462014EA43
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 20:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709240168; cv=none; b=RnT8d+3PqZ8joW2BNvuYji4shYBMQ/nunNO64rRRkIoED6CYUB6iA9Tf7fp2qkLdfopiWMNHaQtyGuELQEfrlxGh5s5f9Wcn3f/VgpaxkAMX5H7qInpbIGNhRFhZvszN+NDgh3Ig6357QGEPyF+Pr3ge2Wn3DSPuUXqaYwrUauE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709240168; c=relaxed/simple;
	bh=Am0NKmlCwgLy7Njo99K+o5i4CrEnaQkPIJSAd0GcvZg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FyKJGfDRr/ObMllfl/2wKYOMjnwdRy7cQNVicoYB16DVPyAKRShKbJ2noX83jak71UcuxoxSxwzRRHzNnkb840vdcR9cmKo6/UQaQekWKiQq2q4fXj8TWueuVvFjt/E4iKrdE7r6iwnh6mlkyAqhGfCfwViaXIilFaALcw84Qyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p5XNv89M; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-364f791a428so7239985ab.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 12:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709240165; x=1709844965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5D+lwpw4B4CqzaxbOzMn85Ig/zR5F9N9xKtP1WaY0I4=;
        b=p5XNv89Mx3GinPIQt7BOa5mzCvf/PZDTGIBL5xIWL8fCGRJ5YGPK1rvoFth/QbJ3gD
         zGPZRSN+xiGDhiGCUotcbnxzs0fqH4qgxgjOY4aO8nfH5HYSTDuUTwC/apU1QoVcy4CC
         rCMJa2gYWvL6XKKCItvU8a2kB5rfioMzBb9zjs+3jXspSAyXnU8sy7de2jDM94OfkA11
         a56iRAYvu0c69qRfZRgWIwDLaPKi/d4lFPrI9pDkFW3fjMujDqjBajQzBUEx4lLFc9fL
         kcK5EOSHHr5WxKm7qUgiHg0lFjniHUtBe9bbPNxdN6eep7LCssmU1YYl1c+PzrNU8cv3
         pp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709240165; x=1709844965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5D+lwpw4B4CqzaxbOzMn85Ig/zR5F9N9xKtP1WaY0I4=;
        b=n7FTG5wwH4temM21d+EfKiosva5xNzQS4ZGq68FRGjm4bvLPD1Z4XIDmoOiUXQXKez
         Jou2eFoo1mKw6rvaVkY60r4SJ064nKaxrXrm248YMRW1VgOEWoUoYwQTO8fC+IyVaKky
         UJ2bjvGjeXLpE0YcFZJRAHf5kE3WndVLegYcfhmpbexBdbTh9bEPSbKIcDcsBdJqSyt3
         DQJOg9mLYgL/vlQGMI+BwlFTgcB6HWJG6c/oe1JqPjRSAte08krvO5YEbBLS2lsAYHFZ
         /ERe2J/VV9T/ID7Lyjou35b1gDRMu2YSjPu9m1N7L+DflWRipSfNFKB5d/fJLutqTFFk
         cRVg==
X-Forwarded-Encrypted: i=1; AJvYcCWJSzEtxYnNj0TWpeaXJ0D1+y08qD8czOd7L8fco8yvBJFXeS099pfKSZlmoqLN6fMG3hj8TUIIWTvgeWHH7+aXzctxxntqgSB++59x1g==
X-Gm-Message-State: AOJu0YzEHq5qGkrx6939TOOCdU+gFg5UbqriW6RzIdsOhCKlKsG5HFXE
	gtlODEGpK6qDK5A/BVFSHIj2kZZEaibHF6ebxah8qcB+3Fx08jUjZk0tmY6RaoU=
X-Google-Smtp-Source: AGHT+IGcOfVrDqhNCWn1fNLEGXylxBZpA2oid/ypDYM6J5i+Mj7J0q56fj66lxK0j1ZvfW//1Sz22w==
X-Received: by 2002:a05:6e02:b29:b0:365:4e45:658f with SMTP id e9-20020a056e020b2900b003654e45658fmr193247ilu.22.1709240165712;
        Thu, 29 Feb 2024 12:56:05 -0800 (PST)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id h14-20020a056e020d4e00b003658fbcf55dsm521551ilj.72.2024.02.29.12.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 12:56:05 -0800 (PST)
From: Alex Elder <elder@linaro.org>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: mka@chromium.org,
	andersson@kernel.org,
	quic_cpratapa@quicinc.com,
	quic_avuyyuru@quicinc.com,
	quic_jponduru@quicinc.com,
	quic_subashab@quicinc.com,
	elder@kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 5/7] net: ipa: pass a platform device to ipa_smp2p_irq_init()
Date: Thu, 29 Feb 2024 14:55:52 -0600
Message-Id: <20240229205554.86762-6-elder@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240229205554.86762-1-elder@linaro.org>
References: <20240229205554.86762-1-elder@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rather than using the platform device pointer field in the IPA
pointer, pass a platform device pointer to ipa_smp2p_irq_init().
Use that pointer throughout that function (without assuming it's
the same as the IPA platform device pointer).

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_smp2p.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ipa/ipa_smp2p.c b/drivers/net/ipa/ipa_smp2p.c
index 5620dc271fac3..8c4497dfe5afd 100644
--- a/drivers/net/ipa/ipa_smp2p.c
+++ b/drivers/net/ipa/ipa_smp2p.c
@@ -5,7 +5,7 @@
  */
 
 #include <linux/types.h>
-#include <linux/device.h>
+#include <linux/platform_device.h>
 #include <linux/interrupt.h>
 #include <linux/notifier.h>
 #include <linux/panic_notifier.h>
@@ -179,14 +179,15 @@ static irqreturn_t ipa_smp2p_modem_setup_ready_isr(int irq, void *dev_id)
 }
 
 /* Initialize SMP2P interrupts */
-static int ipa_smp2p_irq_init(struct ipa_smp2p *smp2p, const char *name,
-			      irq_handler_t handler)
+static int ipa_smp2p_irq_init(struct ipa_smp2p *smp2p,
+			      struct platform_device *pdev,
+			      const char *name, irq_handler_t handler)
 {
-	struct device *dev = &smp2p->ipa->pdev->dev;
+	struct device *dev = &pdev->dev;
 	unsigned int irq;
 	int ret;
 
-	ret = platform_get_irq_byname(smp2p->ipa->pdev, name);
+	ret = platform_get_irq_byname(pdev, name);
 	if (ret <= 0)
 		return ret ? : -EINVAL;
 	irq = ret;
@@ -261,7 +262,7 @@ int ipa_smp2p_init(struct ipa *ipa, bool modem_init)
 	/* We have enough information saved to handle notifications */
 	ipa->smp2p = smp2p;
 
-	ret = ipa_smp2p_irq_init(smp2p, "ipa-clock-query",
+	ret = ipa_smp2p_irq_init(smp2p, smp2p->ipa->pdev, "ipa-clock-query",
 				 ipa_smp2p_modem_clk_query_isr);
 	if (ret < 0)
 		goto err_null_smp2p;
@@ -273,7 +274,8 @@ int ipa_smp2p_init(struct ipa *ipa, bool modem_init)
 
 	if (modem_init) {
 		/* Result will be non-zero (negative for error) */
-		ret = ipa_smp2p_irq_init(smp2p, "ipa-setup-ready",
+		ret = ipa_smp2p_irq_init(smp2p, smp2p->ipa->pdev,
+					 "ipa-setup-ready",
 					 ipa_smp2p_modem_setup_ready_isr);
 		if (ret < 0)
 			goto err_notifier_unregister;
-- 
2.40.1


