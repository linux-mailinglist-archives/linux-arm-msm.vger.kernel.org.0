Return-Path: <linux-arm-msm+bounces-68341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 998FBB206B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:59:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A560716ADD4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E58B28DB56;
	Mon, 11 Aug 2025 10:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ICGqgEWF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A4128D8F4
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754909823; cv=none; b=fE9tauta0A7n+HVuFT9NhZn6zIm4C6zKmjhQAgNHUET+FkIjmTxTma/dgIEj8nFQUioEc9WZwQqb3VkV+Qx/wi7cIFRPlJIWstBHma43xjdrmC7wzyZDT03/nB1mhTZOg9eu5f0Dnju2LUde5dloXTqEaclF9zukPkbhEI5H3g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754909823; c=relaxed/simple;
	bh=y0KLkFzoWiBCsjyKHVyFf5yBXdH+nrgv9bMtrhIbLXo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=slzIFoob7fwnqAfnlIXKJF0r5NF3WGULZuLUmXe/oZLc7KxRVzghnfwR9jEpkdlVdZ1wS6i+a5H+Sq3V+J3bmtRmQK+vy2+GWVtzET0yOOk8OXF7CZBfx3bjdWtgNWkYCL/EZBjConnwMuNoyRpLa2HnpD+DhLHZZZy9Xn2YR0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ICGqgEWF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754909820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CR+LHOxQNJH4mrdkRrblEPU2A6Ou6dlR4qZMmeyZ4e8=;
	b=ICGqgEWFO9+4n2aXFPbAcrVdI3YnWLsyVgMpZY4cUzWOw+RdwhHUhf/7pHfW9DzALsg6cr
	vX3lb04C7b+TMbP4wUzPUPPj7Rr+N4FkZnCvYkOIS7UZ4xr+QgWpg6GoGaAsKuLFcErKj8
	AhhBLlfr9ZojnZ6MBClM0pa9AjFqG8Y=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-EIdp5a4hNqeCaSGjT7WYYQ-1; Mon, 11 Aug 2025 06:56:59 -0400
X-MC-Unique: EIdp5a4hNqeCaSGjT7WYYQ-1
X-Mimecast-MFC-AGG-ID: EIdp5a4hNqeCaSGjT7WYYQ_1754909819
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e7f74baf26so993019485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:56:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909819; x=1755514619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CR+LHOxQNJH4mrdkRrblEPU2A6Ou6dlR4qZMmeyZ4e8=;
        b=tRo4OzZ0ebQ+GQMX4RbsSiiDaFkL5obpnBIXxVFU80iBV4Y1Ygn1KwXVA7uXs6j3Hc
         hfhkPTcXC7Pcr5Xa7Q+8Goo+zNA/UiaUjgOIoGhQexLoT9fKTgIvx6Kf/lWpDNAWJm20
         F4RSIvpFuoukHxuunXe2KGO0u/L+25hDHQYtYLPqJvVoJsHFKsIhuoMaCD7cA0zhGNVP
         YKHyQEEYJl/CZ8CIy5CJhmIyRoywdb8SugDVqvCaYsxEZv+mDMsWeqWCD7MeVX7b2rDL
         PoL1/rbCOyicA9feLjy/OENrH5KGMwoQEZBfoC0Vb0fl4mMuABBv3xnpanoiK+a8P9fl
         sNbw==
X-Forwarded-Encrypted: i=1; AJvYcCWf3IbZlPgwVM4A6QYC2b07ZZ7xqsDqRmdSGLXoWCx1yoEMKHe065/v/C7TeTBAj3SoFpEFQT2GIHxOmsS3@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnm+QILmq8+tgwc4ryY5YhGugCLBqes7R9Dd6cKvRso+ExkU8a
	/KoWl5f+1bPKRANKGDMiTIhK7osEe0ao886apEq5TLZyMK68bd/Kx8crddEulO1+uSq8A0wKneB
	Siu2fpcN3z0F8t+BALC4LXnYA2rC0JjgZTcUp91qj5JhxHpFmIbvGHUqE8eT6LSYW/yA=
X-Gm-Gg: ASbGnctSIlo2zSRqzSL/M6ClS/tnzRWc2lhotgP6lS44RUGKVA1/KTIZ9PAbSXKLv6d
	FqV2U10MuNAj5MXpJCqyH5NXOBGuj3zt0qxI9emLNS5zVkC1oIoO/Vy+e1NCVOnGrtBljZMP7KS
	/Unw57vcfESI+MbIwsq1rC2uDef0399unM4cAXFLJFOJ+Mr0lV5cQqGVsI1itafOL/yE3NcLXev
	9J6z2IZoNB8nVCJW1KiP3t1FCg0dRTQyyN0sk+d3TwIQt6o+1OKpCLLUsKquvzCnMSbzjyEKuGt
	FbefTTCnt3sZV8Om3zwIBaQBZI9QK84NN6BDa11BeLqP9j1uopen+cVhtLZNYJOimNBTydWFWEA
	9aIQ=
X-Received: by 2002:a05:620a:1996:b0:7e8:54f7:67cd with SMTP id af79cd13be357-7e854f76862mr91507585a.50.1754909819019;
        Mon, 11 Aug 2025 03:56:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSii5P15b+af3L4E7F/cQGCM1Xz8KwmyfhCdGkZGKODW+eFh6Bky1dDzTK+GfwnJZiiMZJQQ==
X-Received: by 2002:a05:620a:1996:b0:7e8:54f7:67cd with SMTP id af79cd13be357-7e854f76862mr91484185a.50.1754909814934;
        Mon, 11 Aug 2025 03:56:54 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:56:53 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:13 -0400
Subject: [PATCH v2 9/9] drm/sun4i/sun4i_tcon_dclk: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-drm-clk-round-rate-v2-9-4a91ccf239cf@redhat.com>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
In-Reply-To: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=2307;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=y0KLkFzoWiBCsjyKHVyFf5yBXdH+nrgv9bMtrhIbLXo=;
 b=j1ZnE8gcsk3YjO3zCEvUNiC5B3rrw/rsR6rCeLo5Q9BxZp8jvK69xEFMszvH1iDCwux2pSDHd
 eRkR0peMpaDCxDNa8Bi3chrL3Nda3ZZTmewCk0Eb5cefUz9pD7/Qw2Q
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c b/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
index 03d7de1911cd654f395ea85ad914588c4351f391..4afb12bd5281f0d1720cfe2c8f79b80d97244ef2 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
@@ -67,8 +67,8 @@ static unsigned long sun4i_dclk_recalc_rate(struct clk_hw *hw,
 	return parent_rate / val;
 }
 
-static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *parent_rate)
+static int sun4i_dclk_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	struct sun4i_dclk *dclk = hw_to_dclk(hw);
 	struct sun4i_tcon *tcon = dclk->tcon;
@@ -77,7 +77,7 @@ static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	int i;
 
 	for (i = tcon->dclk_min_div; i <= tcon->dclk_max_div; i++) {
-		u64 ideal = (u64)rate * i;
+		u64 ideal = (u64)req->rate * i;
 		unsigned long rounded;
 
 		/*
@@ -99,17 +99,19 @@ static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
 			goto out;
 		}
 
-		if (abs(rate - rounded / i) <
-		    abs(rate - best_parent / best_div)) {
+		if (abs(req->rate - rounded / i) <
+		    abs(req->rate - best_parent / best_div)) {
 			best_parent = rounded;
 			best_div = i;
 		}
 	}
 
 out:
-	*parent_rate = best_parent;
+	req->best_parent_rate = best_parent;
 
-	return best_parent / best_div;
+	req->rate = best_parent / best_div;
+
+	return 0;
 }
 
 static int sun4i_dclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -155,7 +157,7 @@ static const struct clk_ops sun4i_dclk_ops = {
 	.is_enabled	= sun4i_dclk_is_enabled,
 
 	.recalc_rate	= sun4i_dclk_recalc_rate,
-	.round_rate	= sun4i_dclk_round_rate,
+	.determine_rate = sun4i_dclk_determine_rate,
 	.set_rate	= sun4i_dclk_set_rate,
 
 	.get_phase	= sun4i_dclk_get_phase,

-- 
2.50.1


