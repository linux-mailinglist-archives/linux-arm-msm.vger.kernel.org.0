Return-Path: <linux-arm-msm+bounces-68339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58231B206E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 13:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA1477AA5D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A448A28C865;
	Mon, 11 Aug 2025 10:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jISHvdsY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2505228C5D3
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754909812; cv=none; b=Q9dxcNm2Re7cI8jdukEx/YGoorFfJfMoDl1xYwzsCcz3IFoOKEBxZ2DfNwqNNVy01eqHtbNZ36AVXCgnLTIpreNKRQs/eCUm6aemO4nAdsXT101LUslBj8VFPzcWqe1Tf+c4xcJLJVwa9AleouX8HZRGh1wjV2X9DNhjyU6+z1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754909812; c=relaxed/simple;
	bh=juKzshMtQ4DF/h+L6Akp+woYewfsK6BXt/oa5cMlZgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B/cgJPr0Nd+y+NVa+4ITOwsO1LNR+JLOa/Srf/Mq68is8troHwJUleyHqa/6XwgfiAvcQjXlYJCub/ba13jeyrtNkCwUS7TsPFuGrI7/kfRp4y3j2BOZouyRB/SsfHirIC4PthdYNCnZQ+w6QrR5+CoKauC1gaAyfSUtyVItMis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jISHvdsY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754909810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JStqtZIS8blwztj2LAAjIqKUEnudWLKj0xcXYk/QJ50=;
	b=jISHvdsYD6jcN7/wvI7KnETLgeVyEt8rq00LMA7opD7JpD2RNXUei2xFUrah4/AXn3PIje
	4Z0tMauhQi5rYOvvK/NJ4HFUmbijTJGASrzoMMYJtMnOy2xOJ7ZSVDfFdznWiJoB6PqGOs
	nDuX7zhdhWOU9VJoz+gIpKRtfCnCIRw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-2x1F1ONsObehDGX7kD3FSg-1; Mon, 11 Aug 2025 06:56:49 -0400
X-MC-Unique: 2x1F1ONsObehDGX7kD3FSg-1
X-Mimecast-MFC-AGG-ID: 2x1F1ONsObehDGX7kD3FSg_1754909808
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e7ff9e2738so930265985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909808; x=1755514608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JStqtZIS8blwztj2LAAjIqKUEnudWLKj0xcXYk/QJ50=;
        b=VDRyJvaetJnlJuOk1dc2Y4r3//NTufDriZrfxTjbi/dmg1OUsjkFE4gQc4FqZL9e19
         YTOI+3NdMUNF9udS1EG/6oOekwMg19tGzlc7kfkp2xrb9D/nH49iPkFeOuA+8endmQwj
         1JQp8BM8DHLln2yeOqRQRoyuL0DgUbd81GG8wBCDZgYf7UPlYvzH23jF5YISRL0f5wt8
         Wp1pijgvpczjJti1qiGGFTey7PzYbXlcQ6BsPb8pkA9RCkcgtmLuOPSq7yqGHcLBpBjz
         BNVJq2g+Ya0xOMKNX1S52n+Fiq0jjkQh9IMiUVdK3ZwTYbTJveGky0WLlr0en7EAjFRX
         ErzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgOnScO/ynw0Fsz+NXXv4clOBROOMTT3+dVprGBAfmGH4Oq3AKPVLYMZPLZM/rvmIs9cmoWpT0njOX4VzZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwDzeGEip9k72lCKqs4PJnVdBNkOi5fZIeGz5aazMOcjQbvnkVp
	LmwIIoOGGG1OkAWRbRnhGi9ByCXnCflcOOhOdYSj6Ld4rJQHgpK7DtAEniIT2VLLibBKxnPlaVI
	L7ud8UzH2rSLH1WvPJUkWjuHUx1wfiWdky+YPfYXjyu/m7EGO54hUZqXCeuzSs63er3U=
X-Gm-Gg: ASbGnctSQ71SkCyfsAeUqNTu+9tTEOZXHaLW+U8eqwb8X0absb1uGSp8Ygdd8PVXgUU
	++qy1Hl1IfvCv60Y3XJWjaUlzvIU6cW+4LYSir2x/l/dhjVcajcOmXOVDKloM03SOf4FAYYRiwn
	VjOYdABrfB3/n+j70bgzxXbrs+mqpwUgBTQmjik2Z4CWmYZ1PTlowDGZ4cpfYzVBxds1mZC8jwn
	285cdKdyLdeCN/7t+rkUTKJHgueSnhoXMjHJ1pz5263stMZOzPEMqsxWHJavlrPWHOWEk0C61vF
	+2/5PIpuzMXMQqgOyRVUSGrhS6//u/q33u1F2bZGQwUtH092V46U5IZ3dwtGHmS69mSKJmOypUv
	J7mI=
X-Received: by 2002:a05:620a:a00e:b0:7e3:60cf:c037 with SMTP id af79cd13be357-7e82c75b89cmr1125687685a.34.1754909808561;
        Mon, 11 Aug 2025 03:56:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhnLELhezGJADLmdApayEoevKdtEKOKSDSvgPhqkzq4hJSUIbUnZL0k2iE8nto9nf3DAncrQ==
X-Received: by 2002:a05:620a:a00e:b0:7e3:60cf:c037 with SMTP id af79cd13be357-7e82c75b89cmr1125683685a.34.1754909808062;
        Mon, 11 Aug 2025 03:56:48 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:56:47 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:11 -0400
Subject: [PATCH v2 7/9] drm/stm/lvds: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-drm-clk-round-rate-v2-7-4a91ccf239cf@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=2162;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=juKzshMtQ4DF/h+L6Akp+woYewfsK6BXt/oa5cMlZgg=;
 b=srQL2Syf3qoqHVxtrhYtzT2hxKDJiG2H0/4WtgjDA8OLuly+icCFFE04ANS8bywbgRo5Semzj
 RZvKazBg3coDcnWyiIki4FOxz5OPAdab1K8jRW40iEHpLbopisMgRC3
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Acked-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/stm/lvds.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c
index 07788e8d3d8302a3951e97d64736b721033998d3..fe38c0984b2b552e1ccaef4d1e589b9d86a40ee3 100644
--- a/drivers/gpu/drm/stm/lvds.c
+++ b/drivers/gpu/drm/stm/lvds.c
@@ -682,8 +682,8 @@ static unsigned long lvds_pixel_clk_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)lvds->pixel_clock_rate;
 }
 
-static long lvds_pixel_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *parent_rate)
+static int lvds_pixel_clk_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	struct stm_lvds *lvds = container_of(hw, struct stm_lvds, lvds_ck_px);
 	unsigned int pll_in_khz, bdiv = 0, mdiv = 0, ndiv = 0;
@@ -703,7 +703,7 @@ static long lvds_pixel_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	mode = list_first_entry(&connector->modes,
 				struct drm_display_mode, head);
 
-	pll_in_khz = (unsigned int)(*parent_rate / 1000);
+	pll_in_khz = (unsigned int)(req->best_parent_rate / 1000);
 
 	if (lvds_is_dual_link(lvds->link_type))
 		multiplier = 2;
@@ -719,14 +719,16 @@ static long lvds_pixel_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	lvds->pixel_clock_rate = (unsigned long)pll_get_clkout_khz(pll_in_khz, bdiv, mdiv, ndiv)
 					 * 1000 * multiplier / 7;
 
-	return lvds->pixel_clock_rate;
+	req->rate = lvds->pixel_clock_rate;
+
+	return 0;
 }
 
 static const struct clk_ops lvds_pixel_clk_ops = {
 	.enable = lvds_pixel_clk_enable,
 	.disable = lvds_pixel_clk_disable,
 	.recalc_rate = lvds_pixel_clk_recalc_rate,
-	.round_rate = lvds_pixel_clk_round_rate,
+	.determine_rate = lvds_pixel_clk_determine_rate,
 };
 
 static const struct clk_init_data clk_data = {

-- 
2.50.1


