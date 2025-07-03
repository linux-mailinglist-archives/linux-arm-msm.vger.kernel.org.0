Return-Path: <linux-arm-msm+bounces-63586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C33DFAF8414
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 01:23:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FAD91C85C4A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 23:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11AAC2DCC01;
	Thu,  3 Jul 2025 23:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="giBQaoyj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6361F2D94BF
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 23:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751584989; cv=none; b=NxVsLS6zMjgDNov1AqLDi/Izp94vvKgI4oGySA6Bc1t5bXm2EhyOVB+A1tj1pmHdfDKQEsuI0CyOcU22jXCv6ien0BXFndUQpjLZh3m35VubUj02ryBr1VG9MQGnC4BXwfQdMMoiB3/inexzCQAnp48rI1aOwGYqFA6qUgSZuq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751584989; c=relaxed/simple;
	bh=bUDrRrVU7cuzvOkq/BXSXRrTOJz73kF5fGj8HK4w53E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nTZxwTmJMbT6x0CwZ2QRRmVw68kFRLOdqe4S95CpTWFNvX46FJMiGJhgKFqpE+MPjZfSMcbNOFoQQnGyqWePsULCAtIaHnrx3rkw6cJgBwuY0Rj47Ri6DfiLNxzdUEdfdksEkJ6wN1+4I5NbTxiDmDEKWqYeGhFYXyPtR5RmX7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=giBQaoyj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751584985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zb0t+bPuMy487CsPpINgg8YqC+3JQLKvQYW9mEqLvWM=;
	b=giBQaoyjd6rWISWSQ6KwIdGger7SAhg+ckTv6rpkqC40GrOiiCpsZkAqCqRj6+502Vsggp
	Iw8aYrnBoUPAsqeSVri61LXcu1c8RXqmOaY82cMuYb0+fQtM9tl0XZfKsep0weee7hbU3a
	17DZrNCYEj8INVuJ1Ril1xm4FJpvYP8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-272-IoSta8PCM-ucbWOLgvuvzg-1; Thu, 03 Jul 2025 19:23:04 -0400
X-MC-Unique: IoSta8PCM-ucbWOLgvuvzg-1
X-Mimecast-MFC-AGG-ID: IoSta8PCM-ucbWOLgvuvzg_1751584983
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6faf265c3c5so4403476d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 16:23:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751584983; x=1752189783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zb0t+bPuMy487CsPpINgg8YqC+3JQLKvQYW9mEqLvWM=;
        b=FXb9dZy54yNlwjIAqv77hU+Scp/Hfj1nqzctpCVjzIlUjHoSnWGJfKtr1krAiqhgkX
         Pzc33zVM42UqbKQV0K6Iu0uyVRc5RJNsQMgBqImBG4czKcq3zRiwWaQRzQjtGG67bYGY
         1b+xX9LC5ZBrXDa+eLbgORtFwX9EPfcpz+yrYwZqFVJJtp7RQAQJMxqPil+O52a8SBr3
         UhEGhw3dPvJYWb7hq8XDOHApTaknRImIiZLVXiLvntCQxn5sGhr54bx+G5RBEkxlc81H
         TufTNaurpo6ez7AGWQsnykoYpkSKCtZEmfmW+hZ1K1+8jSOgYWoz++UIJysmKkipMyjT
         g8yg==
X-Forwarded-Encrypted: i=1; AJvYcCVbUvSLWGpNhsDE0kJwLHRAaCeXlnZyRAzmWRg9TD+bb9rKNVByvz+uy/0s9wVDSpaK62mqbKLRWU2vk4Ks@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvtum+AUBcJQLcJ4/6drmvS1ThA3wPGJPUMCEdS1zarsTGIZt5
	4bDkKAbN34kWQhPKfqE33l1aPlm5I0NuAoI4qNbwDT+sZQaznv+n6Isy5uJ7+BB16+vD8B5uaOp
	MBXuKtA/gtedOdf2xOfWea8MZ8pNXsrku2mJOLV4YLCKBx1Zq5cNl6YUQ3XwCJATZsjI=
X-Gm-Gg: ASbGncsixhDASQxOzGAMCbYxjr0/T7j6w3Vo5KZqSt1RFjIvZQk9SvxCh/XTlUgTBwB
	4v5fwZfcRQUy9B4Li5olWJ2GWV1IoFbPid+zVhNmho3nyYpInGiiNBOrIYGNBXjd/rXYfJJiOYJ
	IymS1FdzW1Yb11kUYp/72p2SIoX5r1O90kl1r2ys6JCwam5IDT31KA2acFP24pUYjgailTJKMbW
	8+kcBQZPiV+OsoUjVLBET+fAbWuyWbfJA9caroJVfYYfiNuIOC6Nt8o9M+NFNDpyq2tFByH81cG
	N352tgkyYXSDnNULRoo9yNi+M9ToFqTvfO1fPW7GNZC65y9AQSwopf8jlkB3GQ==
X-Received: by 2002:a05:6214:4109:b0:6fb:66cb:5112 with SMTP id 6a1803df08f44-702c6dbd1d7mr2609976d6.43.1751584983552;
        Thu, 03 Jul 2025 16:23:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyxhZnZ049hC67seKLZMmTesEshAPctloMTDGwamaQuOlXGGQBJwFhr4CP+VGmOImhVXHj5g==
X-Received: by 2002:a05:6214:4109:b0:6fb:66cb:5112 with SMTP id 6a1803df08f44-702c6dbd1d7mr2609726d6.43.1751584983157;
        Thu, 03 Jul 2025 16:23:03 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:01 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:25 -0400
Subject: [PATCH 01/10] clk: bcm: bcm2835: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-1-3a8da898367e@redhat.com>
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1979;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=bUDrRrVU7cuzvOkq/BXSXRrTOJz73kF5fGj8HK4w53E=;
 b=xUB+8pQNqSYfMSMKtJ+gOj0YuRr7Wv56SqgY0gPYScWgdV1HkGtTwLwdx9iGFlUExmLZuwyku
 mHoKvxPW2vyDCFHfBUgtY5dZ7pH4PFh8nPq0RUUJZ7MoCOhvyogjc9p
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/bcm/clk-bcm2835.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index fb04734afc806286b6a68996f36bd8a49b542cc8..5e7788406de39c94884cbc3aa162c378443322c0 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -570,18 +570,23 @@ static long bcm2835_pll_rate_from_divisors(unsigned long parent_rate,
 	return rate >> A2W_PLL_FRAC_BITS;
 }
 
-static long bcm2835_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int bcm2835_pll_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct bcm2835_pll *pll = container_of(hw, struct bcm2835_pll, hw);
 	const struct bcm2835_pll_data *data = pll->data;
 	u32 ndiv, fdiv;
 
-	rate = clamp(rate, data->min_rate, data->max_rate);
+	req->rate = clamp(req->rate, data->min_rate, data->max_rate);
 
-	bcm2835_pll_choose_ndiv_and_fdiv(rate, *parent_rate, &ndiv, &fdiv);
+	bcm2835_pll_choose_ndiv_and_fdiv(req->rate, req->best_parent_rate,
+					 &ndiv, &fdiv);
 
-	return bcm2835_pll_rate_from_divisors(*parent_rate, ndiv, fdiv, 1);
+	req->rate = bcm2835_pll_rate_from_divisors(req->best_parent_rate,
+						   ndiv, fdiv,
+						   1);
+
+	return 0;
 }
 
 static unsigned long bcm2835_pll_get_rate(struct clk_hw *hw,
@@ -783,7 +788,7 @@ static const struct clk_ops bcm2835_pll_clk_ops = {
 	.unprepare = bcm2835_pll_off,
 	.recalc_rate = bcm2835_pll_get_rate,
 	.set_rate = bcm2835_pll_set_rate,
-	.round_rate = bcm2835_pll_round_rate,
+	.determine_rate = bcm2835_pll_determine_rate,
 	.debug_init = bcm2835_pll_debug_init,
 };
 

-- 
2.50.0


