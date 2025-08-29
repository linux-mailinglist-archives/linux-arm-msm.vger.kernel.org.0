Return-Path: <linux-arm-msm+bounces-71204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 376FCB3AFDC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 02:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDD4E1C84EC4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 00:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729E621FF5D;
	Fri, 29 Aug 2025 00:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T7ano3/m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B43211499
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 00:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756427935; cv=none; b=FMy0sqELWotzK8puyuZ2eZrpAuLKHnCmyB2qQMCnSEu9R3prhzBrFwSFVre4Ec5hsgeTnRaHhwN50TGJjP2QDYPJEG8Cl0TAQMVhkx96UmCUYynesDJ/xY6vngufCTPSadOyDDDES+V+cxiUUBvz/62IO/h9Iy/YBiqcbmjIDRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756427935; c=relaxed/simple;
	bh=sqQ9Idu7LND8TQvnc9CGktCQVk853FsqtiSZ1I4901o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LqtMwpGUAn3cnVUJqc2zynaq240Eiued+N+u8pCt7QK8D/SpuVaXLaaGx2yc26YWmmW3kUTc3NNyg/VWA73sNuppD7rWYLOuQgKpOhKj3YthuHvOffojkO2PxpcXR3R4MqA7esTB5j49Dqrxtx1lnmv9kniovusddLbsfW9GnnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T7ano3/m; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756427933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dWO8Dz9nIHqrR+SVTleBzTnUpEyDVDhvHJs2y9irGnw=;
	b=T7ano3/muFbZC4nIbAJPvkXVbGGyBbgqgPME6b3RGmld4MFveW8ai7UxvtsHzu44xVKVCm
	iuFeVDo0igx8kSonMzxFAK7E/3iJDc7tNfINFpb5cXXsMeZ7CyHPX9HgJxncPa/j78Uozy
	BnxqSBRxAD7S6VHXfhyVNn+JcmNWNoY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-k-sWnoS3PQWsz355XztODQ-1; Thu, 28 Aug 2025 20:38:51 -0400
X-MC-Unique: k-sWnoS3PQWsz355XztODQ-1
X-Mimecast-MFC-AGG-ID: k-sWnoS3PQWsz355XztODQ_1756427931
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70ddd80d02fso18605706d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 17:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756427930; x=1757032730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWO8Dz9nIHqrR+SVTleBzTnUpEyDVDhvHJs2y9irGnw=;
        b=uiQAhqRJk7NUN42/EAbChaQ4rDvgy82mhY7RkyVmOKWVYOf2wF2RCKmKbGpc3AX79R
         nP0yMGtRWiWX/kPDEwVTxlPKj2GoatIR4JC3tUljQbhliZI5f6CeY/rjaOvBlJcVNb6s
         TwMmXdXEzyXEzKvFGlTU1uYp+tPV0xk4W2jtD9fRA9LU3GohGnHGjUBDDh1Z0h/PI95Q
         k4Z1xCfxeRzHFKRmoVAaix9R8DfD/0JBdAITBJ7fSXKyrA6YidAKxAvODhJkETWgHcwX
         Fh1H451S/ppJv4E4RU9/pAUaZbAAPNUo+p25r6KHCyZqDhNe0l6j0W6Vfoqp4p6SpeBz
         KauA==
X-Forwarded-Encrypted: i=1; AJvYcCU4KWSjsQXfbjHrkM5UBcFlXMF7caXPxqpELxeRZvBeXzSjWwtFkgLRGAD9lX6aVJZ62acv+QJHNKO+fCnx@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtveb95wAU6GZCZeYzd0gY7qKXxw019cbAxXWY3Ju1Aa0ZN8ZE
	TkTas+ipxvj31LjOQLUbmn3mOKl3gy/1MgY5TNTi0CZYdNl3AAOF7Z7n5ZjbTChgl4EIvhhKn29
	RBOr3kRl1rAMRINGNb+4mSdfkJBqqZ4xmZrPIDD+SkKf2bXUvxCHVwRlv0ls4+v3vLl5/QEUf5x
	Rm4nKA9vsJM+CiJLm6FM+eGIpkKZC0G2AwIQfnqdL9C5zotQiKQw==
X-Gm-Gg: ASbGncszNUkvxrbq+bl3N6rxwMD7uKvV/Xy2X0LpsX9tHzLidken9K/NDz4JsuSDCXH
	9SdwdbwjCAwK64GqNfeGo0qJF46zXEl+il41ayq/GSBb2lkLiPoqdW/B2z3oAVL4SnFA5mu81Cw
	FHe00xnmvkHFgJulzQgQ+oabkN6iOwz3jKBgNYAVRaP3fAcmWkzb+a8cAOcet/86KgQAvioar34
	5zwqae+5/tmDON8sT3VzhutD2585V0o/IRGfCkta0oO5RW8jyHtBZtt44edmGXrcAUUgcnS0vI+
	YAEtoMs+v3M/DcBbwKwsxIwDyfysP1cuaOoTH1UFkv+y4fSKKQ33BXGf4VjDUwGNwUEzU96GZxK
	j6oG9n2btSiYdO40KmNyex9/N7AJ8qgYChw==
X-Received: by 2002:a05:6214:252f:b0:70d:e4a7:1b38 with SMTP id 6a1803df08f44-70de4a7272amr93091396d6.59.1756427929877;
        Thu, 28 Aug 2025 17:38:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0zJ/btEpUgEaoIIvfrO+RJjlxl3Pv9v+fWpYa9u5ZWZV72zvhLGJUbbr2PZPa8Aw72GLx4g==
X-Received: by 2002:a05:6214:252f:b0:70d:e4a7:1b38 with SMTP id 6a1803df08f44-70de4a7272amr93091076d6.59.1756427929458;
        Thu, 28 Aug 2025 17:38:49 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70e6264141asm5588696d6.65.2025.08.28.17.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 17:38:48 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 28 Aug 2025 20:38:24 -0400
Subject: [PATCH 5/8] clk: sophgo: sg2042-clkgen: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-clk-round-rate-v2-v1-5-b97ec8ba6cc4@redhat.com>
References: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
In-Reply-To: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Michal Simek <michal.simek@amd.com>, Bjorn Andersson <andersson@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756427914; l=2463;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=sqQ9Idu7LND8TQvnc9CGktCQVk853FsqtiSZ1I4901o=;
 b=OqClB2gKvwUjzcBuWISxeT+XMsrr1fq+AKWaKypJZsPPPqcYnCjdJ8UA89aYPddHv0+EsQ93z
 FAS6xT63b+ACxX8kvKkjjNayIxis6/FhWL13CkGrP4I8GMEnTIJ9PfM
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/sophgo/clk-sg2042-clkgen.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/sophgo/clk-sg2042-clkgen.c b/drivers/clk/sophgo/clk-sg2042-clkgen.c
index 9e61288d34f3757315702c355f2669577b29676f..683661b71787c9e5428b168502f6fbb30ea9f7da 100644
--- a/drivers/clk/sophgo/clk-sg2042-clkgen.c
+++ b/drivers/clk/sophgo/clk-sg2042-clkgen.c
@@ -176,9 +176,8 @@ static unsigned long sg2042_clk_divider_recalc_rate(struct clk_hw *hw,
 	return ret_rate;
 }
 
-static long sg2042_clk_divider_round_rate(struct clk_hw *hw,
-					  unsigned long rate,
-					  unsigned long *prate)
+static int sg2042_clk_divider_determine_rate(struct clk_hw *hw,
+					     struct clk_rate_request *req)
 {
 	struct sg2042_divider_clock *divider = to_sg2042_clk_divider(hw);
 	unsigned long ret_rate;
@@ -192,15 +191,17 @@ static long sg2042_clk_divider_round_rate(struct clk_hw *hw,
 			bestdiv = readl(divider->reg) >> divider->shift;
 			bestdiv &= clk_div_mask(divider->width);
 		}
-		ret_rate = DIV_ROUND_UP_ULL((u64)*prate, bestdiv);
+		ret_rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, bestdiv);
 	} else {
-		ret_rate = divider_round_rate(hw, rate, prate, NULL,
+		ret_rate = divider_round_rate(hw, req->rate, &req->best_parent_rate, NULL,
 					      divider->width, divider->div_flags);
 	}
 
 	pr_debug("--> %s: divider_round_rate: val = %ld\n",
 		 clk_hw_get_name(hw), ret_rate);
-	return ret_rate;
+	req->rate = ret_rate;
+
+	return 0;
 }
 
 static int sg2042_clk_divider_set_rate(struct clk_hw *hw,
@@ -258,13 +259,13 @@ static int sg2042_clk_divider_set_rate(struct clk_hw *hw,
 
 static const struct clk_ops sg2042_clk_divider_ops = {
 	.recalc_rate = sg2042_clk_divider_recalc_rate,
-	.round_rate = sg2042_clk_divider_round_rate,
+	.determine_rate = sg2042_clk_divider_determine_rate,
 	.set_rate = sg2042_clk_divider_set_rate,
 };
 
 static const struct clk_ops sg2042_clk_divider_ro_ops = {
 	.recalc_rate = sg2042_clk_divider_recalc_rate,
-	.round_rate = sg2042_clk_divider_round_rate,
+	.determine_rate = sg2042_clk_divider_determine_rate,
 };
 
 /*

-- 
2.50.1


