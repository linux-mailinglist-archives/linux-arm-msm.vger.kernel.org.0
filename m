Return-Path: <linux-arm-msm+bounces-64445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFDEB00A3C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 19:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C2B76402AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 17:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE6AA2F19B1;
	Thu, 10 Jul 2025 17:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z6C6+DUg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFAF279DB6
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 17:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169410; cv=none; b=JX4+T4v/YMs1J1B2bNPNW7o9+xtww6NGUhrkUqwPbbIIMV5Mmv7Bxg54n6QGyJAbzlOqlSqBAZPHYDl0L3AA9Q16AMTHZLwizAqJBBuUQFt1iFyi4l7Vgu1M9ALUI1Pp3TZKdIGPqGavc4ZzjEIplPlKdkMDNhUvuKXh6+ZhXG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169410; c=relaxed/simple;
	bh=0XNjSSy+sJ0lfEyL4cE3BgJoCrdQCRO7x73pTQQcP6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fLB6RW6iA7oHvs/fofIYoKwO9ajAkYG/XybTnscv4OX3DDjvtHzK+SusJqLKFAK5XjBBWhYe3+bigof9XMUBOGoM5Ffa2rX33+P1qCrWXW0fmy5OgxRt4PZRfezgzcagbqwftL3ABJmE1oe4cwUHF4Apqd+F5EJi7AOutvgkeT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z6C6+DUg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KBPGyYPlG02EWMpLoXBzNUmSiSLVytWyHaO2lqHRcZA=;
	b=Z6C6+DUg4w1ugVrWNW9WD7XPladdxlXW0J91egWhoYSpM9Q4ezFhvOUX6fcnXk00TKHtDd
	6as/n6Q2VPb8Qk+eMAqJnuc+p1QNa1nZfytaHXEqQBCQ2SfOY00LSvzY0hFPAldqbNWGzC
	URwibWZiy3br+cSDhFQbudAzUvI23pQ=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-9UV5e7uzN8aZQZtOw9ccFQ-1; Thu, 10 Jul 2025 13:43:27 -0400
X-MC-Unique: 9UV5e7uzN8aZQZtOw9ccFQ-1
X-Mimecast-MFC-AGG-ID: 9UV5e7uzN8aZQZtOw9ccFQ_1752169406
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7048ef66427so24036706d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 10:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169406; x=1752774206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KBPGyYPlG02EWMpLoXBzNUmSiSLVytWyHaO2lqHRcZA=;
        b=drmfNUXDcVEd59nfetkIUtO66ZCyq0nP7/MoTj7GorR8eEiRClVUdQKTEB/5RRcwPs
         DCElQc2t5cDjOqaR5vAD9G5Pn6lUxMWiP2CpHdfM+AoS23LCdzxNnxLC3st4iM9ddzW5
         noKo6tngCVZWKlFyS6sXCn/wheywbR5HoArfOZWGp6KhjD0+4wdEdPyAjT0xNRPPJDw7
         Z7vtFovI3AzetrN/c+f5TyQmBDvGDMAnbC3NCgpp9tjIXznGO8ZzFeg97qYO18tD7WBb
         /ketbTFG+LPnN4cwKt/dgp3xm6O1eib7aTRjvaai4FXVZldy6IgqfGzAt2I9ATszI6pE
         Mhkg==
X-Forwarded-Encrypted: i=1; AJvYcCUzrvjs72fP9wfCUkVQ5waXo7y+AYwAA5GpvJnzcqVqmhirtM6XudEFS8UAQdoWrVma8vpWrhIy8c0zIoUb@vger.kernel.org
X-Gm-Message-State: AOJu0YxzEWeppwd68XhwHADrTE3QzHZbUeGgjfP/z8+/99+llhMt3czc
	Q1LwyfDUdFoDyxloReQHYP0Kd9TvIvNNakmdeaHq2NS03KUK2AkjJZx/MsJE8QKr8dkuCQISJXg
	3lA6r2aSqbFjet2RLllYl2Z0O0STqpThYxo2efLHF2HBKn6SZQbor8wmDKII46bdhEsw=
X-Gm-Gg: ASbGncufX240yvVthb0trAKV82jleIqKlO9slS9IEZFYsxQ8LpdGDRDfsoOi1tWd/lh
	+VLKMar5pRMJDundXno8b3HxFj05csT15q7BRCEnFUJpiEAV9R8i9KyKDPW9s4Ysrgp+2oztVEa
	KDY0e0cXReJYZDn0TxkH5nGl3GK3FTdgzXtjBfgtngYe244hvYvf5GqGLy1PhoUKAOmRAkR4b3c
	5VajgvgYjHZux4CGLv7SgH2Sdcs/ZFZ5mk8JzP0vh3WXikCA8NDxwqppAF3Tbg5hw5/NUjIcwhv
	mjw/ddp8uXGNSU+N2NgjTuEkUBa5h6ypCNhSmVw1vk3sLGY62vjvfv1kzBG3
X-Received: by 2002:a05:6214:3f85:b0:6fa:c22c:f78e with SMTP id 6a1803df08f44-704a3f6fd62mr2495866d6.14.1752169406560;
        Thu, 10 Jul 2025 10:43:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEttkcpvpmW8n4QYixl0+KFt8qbGPFK3Af/cnV1daIlslvCn8CNttD2d7VeOQXKfYZa2Tsq5w==
X-Received: by 2002:a05:6214:3f85:b0:6fa:c22c:f78e with SMTP id 6a1803df08f44-704a3f6fd62mr2495446d6.14.1752169406197;
        Thu, 10 Jul 2025 10:43:26 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:43:25 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:04 -0400
Subject: [PATCH 3/9] drm/msm/disp/mdp4/mdp4_lvds_pll: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=1612;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=0XNjSSy+sJ0lfEyL4cE3BgJoCrdQCRO7x73pTQQcP6I=;
 b=96LRUEONivujwIpqQbr8tblgDkupptPSSepp1EfUIk95IM619emUTpzW+J+hude/MQ3kCg+HA
 3yXQuBUEDwkAc7M+xiKSzQ6eV9m9VE+WhiAmImR5xyYrk63QkNrzyzs
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
index fa2c294705105f5facbf7087a9d646f710c4a7fe..82e6225c8d491d44e30631cd5a442fb7c2de3f75 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
@@ -98,11 +98,14 @@ static unsigned long mpd4_lvds_pll_recalc_rate(struct clk_hw *hw,
 	return lvds_pll->pixclk;
 }
 
-static long mpd4_lvds_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-		unsigned long *parent_rate)
+static int mpd4_lvds_pll_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
-	const struct pll_rate *pll_rate = find_rate(rate);
-	return pll_rate->rate;
+	const struct pll_rate *pll_rate = find_rate(req->rate);
+
+	req->rate = pll_rate->rate;
+
+	return 0;
 }
 
 static int mpd4_lvds_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -118,7 +121,7 @@ static const struct clk_ops mpd4_lvds_pll_ops = {
 	.enable = mpd4_lvds_pll_enable,
 	.disable = mpd4_lvds_pll_disable,
 	.recalc_rate = mpd4_lvds_pll_recalc_rate,
-	.round_rate = mpd4_lvds_pll_round_rate,
+	.determine_rate = mpd4_lvds_pll_determine_rate,
 	.set_rate = mpd4_lvds_pll_set_rate,
 };
 

-- 
2.50.0


