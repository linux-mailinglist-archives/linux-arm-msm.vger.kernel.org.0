Return-Path: <linux-arm-msm+bounces-68340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5D9B206E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 13:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A14A7B648D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B95C28D8C9;
	Mon, 11 Aug 2025 10:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fnXPjgnO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC7928D82F
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754909818; cv=none; b=QNLZqog4Oyky12y6T6cxz8RrFeNoD7yRc3g+5jFeQ5vl7aRkQN6SC6BftBrbaGzlUi3Okw+afLJLryS2VLTgPsBX6lA7R6FqXtDPvf3qu1F6bNkLyvEEfJcTAZVv9Hr2o+pj43UIy7RsJOQmbzzwodZFOA0kZYvlfPzrzB3wkCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754909818; c=relaxed/simple;
	bh=4SmOn45QQwwyMezbBb5tx+ffOCKNsfDDe6H8Sa9QRwg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MTsx35Ar4WE+Grv4rePES1qMvIucoKXynrxTEckYHGtAglQerfsJ8HDEBCcgVZZHjb66x1l2+ZcnNyv+p/ypUN5IxSkWx2mMjzk6xHoydIvgIG2Ms/pjhSxFZLxlFxvEXNVGSRpjitqcdmq2aZp/+9ugQyXQ8TauIqzf/LbT0yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fnXPjgnO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754909816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+Rztee25JuVOb3qnfGrbYzil++DqREMLNxo1mFDVeU=;
	b=fnXPjgnO+vSLi83AAU+1ov+xdofhRRcag+n9R4IVAxq379otv7wKXANxXnoaG1/sIGQ0Yw
	Bp3VFNk/Bv4aHcOAriBkOY4PnQXESZivHcHFbPPZsuUtIlvhTXiHeZr4xwr87U+X64TSiW
	AVYv6u8DTgEhQf+iYtMpIWDNy3Bw8yg=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-d9MahkaKNce9S8mKnjuxBQ-1; Mon, 11 Aug 2025 06:56:55 -0400
X-MC-Unique: d9MahkaKNce9S8mKnjuxBQ-1
X-Mimecast-MFC-AGG-ID: d9MahkaKNce9S8mKnjuxBQ_1754909814
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e826e0d7abso887691985a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:56:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909814; x=1755514614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+Rztee25JuVOb3qnfGrbYzil++DqREMLNxo1mFDVeU=;
        b=MAyJA9CwyIlvCeHRrBJdirJW/oxBCB9lr9vdhw07kV+cKkHjMdp9HL4t2fCbnqXHVk
         nmlKqsBiSgMrVZqZKh2muoWbMb0CQu3diY/7Zq/XjILljHAeWuA/1AHva1gkJE+OKkYM
         i0jvhLRLy5ZcXf1xbIKxau/JU1ZP3Gho88m78meJ6/eYVVqwbPLxziOk5N5ebX3atNK5
         V8Xy9D8Ybc5294516EhoMn7J8XuGQz//Ckx4zHws3H0bb4M+wKim+qzmLMMDeq097Hvr
         v+lihEFw7Y0yi5vluNUDrnBDwAR0w62jV2igW06tXYUK1SipKL7ZsGDdyIty3INRpbRX
         MqXw==
X-Forwarded-Encrypted: i=1; AJvYcCX5xLS7GxpSsPbzmKvejUUYz1Ot+EMMfEo3MSYPzyr17DTjaphprgyCxpqVwT+xMakyOEQ1b66wGhPakKsC@vger.kernel.org
X-Gm-Message-State: AOJu0YyLfxJ160vJioNjzBAcKmIn2v1whMrNQQBrRhVMoVsVac/YXB+8
	CfzFNIB+yX1yNmq3Eb8kDZXBjGRO4diUJRdG3IxERaWlkgN0iS5Yt7/0MBkKpJbCRmCmHyBlI7n
	tdz9HhaWy3gvALNHyvKGTdY4UOt8cVkZwGosPHdCGnuN8N6T2OKuuJGITZSs8uwaTP2U=
X-Gm-Gg: ASbGncuHGISYu+4MZvjGH8wYg4rt91kPACiug3/1NpxAnt//V0YsLcEzQIirQ+8UJ+V
	RXm/7jMC3FAmlTAYaKfVYIM4Os4rLpksYoSgSJlpRQCHhGDIGAN6qvgV0rgcE3srslvm4sqaw24
	d96zill/GFsLKTBTH1KaJQgfqBg4ndahr1GO3a+kndlpvjaZke8IGYk2bvnwcmlR0KZmMWYuT8B
	2icQWp+fjBPR9YXc1LYVyACJ2yKXpcyNM/17neTQNtdOB3NUathMOcd4pp01wy+Gb1YF0Cqbs2F
	q3Mn5LJLFRbIgA0RX0H/TS/XVBPTTFlZs+rAKA4/F/oGa8VcbVwS3/yD00Q6nAtVhbMOxCWLnEP
	dVDg=
X-Received: by 2002:a05:620a:c50:b0:7e8:1b64:2187 with SMTP id af79cd13be357-7e82c75f958mr1792754085a.33.1754909814328;
        Mon, 11 Aug 2025 03:56:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEK2Etk94d7jqWBuBTsPUBpC0ORVIn7oE21Xh8O9EOQgSk7vq5RIMLYWuxIl1Nwz+nt1Y38MA==
X-Received: by 2002:a05:620a:c50:b0:7e8:1b64:2187 with SMTP id af79cd13be357-7e82c75f958mr1792735585a.33.1754909811152;
        Mon, 11 Aug 2025 03:56:51 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:56:50 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:12 -0400
Subject: [PATCH v2 8/9] drm/sun4i/sun4i_hdmi_ddc_clk: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-drm-clk-round-rate-v2-8-4a91ccf239cf@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=1693;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=4SmOn45QQwwyMezbBb5tx+ffOCKNsfDDe6H8Sa9QRwg=;
 b=D6lQv4uU9BbCtmlsDXvXPLa8dR0h0DlOWWckbVaEkFndxlEt+IyMNkfDuSVR8NgDYOThGx2MA
 72BwKh/6cLNDsrNiAlNie395a35C4+/kjwVpt/wftlDiaqzAFDkxkOV
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
index 12430b9d4e930f7e7b0536a5cabdf788ba182176..b1beadb9bb59f8fffd23fd5f1a175d7385cd5e06 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
@@ -59,13 +59,15 @@ static unsigned long sun4i_ddc_calc_divider(unsigned long rate,
 	return best_rate;
 }
 
-static long sun4i_ddc_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *prate)
+static int sun4i_ddc_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
 	struct sun4i_ddc *ddc = hw_to_ddc(hw);
 
-	return sun4i_ddc_calc_divider(rate, *prate, ddc->pre_div,
-				      ddc->m_offset, NULL, NULL);
+	req->rate = sun4i_ddc_calc_divider(req->rate, req->best_parent_rate,
+					   ddc->pre_div, ddc->m_offset, NULL, NULL);
+
+	return 0;
 }
 
 static unsigned long sun4i_ddc_recalc_rate(struct clk_hw *hw,
@@ -101,7 +103,7 @@ static int sun4i_ddc_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops sun4i_ddc_ops = {
 	.recalc_rate	= sun4i_ddc_recalc_rate,
-	.round_rate	= sun4i_ddc_round_rate,
+	.determine_rate = sun4i_ddc_determine_rate,
 	.set_rate	= sun4i_ddc_set_rate,
 };
 

-- 
2.50.1


