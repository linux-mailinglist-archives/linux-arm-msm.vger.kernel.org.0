Return-Path: <linux-arm-msm+bounces-68335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DC3B2069E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:57:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8287C18C0C16
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D53D28000D;
	Mon, 11 Aug 2025 10:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UbuQMlYm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BAB27FD46
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754909799; cv=none; b=o0zY0zCl/64RdlzahSg7ad7Bd+dvjrrxf4lRBSsHk7knWxUGAplbrzhLwjWAxRsmSQS/xVmZon2W7ciJplMoNFKz+TptpVrBrCHldDt2+TZWIqcN4JQmGSirxAs0qczCskUHhTJxwZaO6w0EfIsNeurwnH74MmcMVwKE3g5Aj+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754909799; c=relaxed/simple;
	bh=QhsR7m95oQQJWiR4k5sEM+znPy8RVqMfVFdEDgPgP5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ccj2TDTIkSR2e3RJs0sFBmxmUGMGXI8JCmkv7L9t63D8RKBL5sMLvQ4sTFR2KPje0PI9dgwSTUY+K/yOJp4lHCN6GoT6RDT2gmSm5krbZgjk6iYnyt0lxf19XD6TyneB/pBAQMI0ndHSyFNLdHPAd4DVCGhwyEY6C3P+GIkv3Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UbuQMlYm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754909797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SmZ5OhIFbDNhhdemRjccJWJIhJ+GPeWDy3CnIwZY5Y0=;
	b=UbuQMlYmTwYPV2/asD2FSXjSz1l0hyZlxDj2qQ+MZN9i9uXIzuH4cwD8p1WTaZXQrD1cbW
	p6l5aa/d4m/oPGXE7eiMB3K/o6jlzQrVNLBTOFQ/PHg8zHzRDloN0Qc8GvVAFEfPNY16Jq
	kKu4/c4JlIqdnfTzIuLnYz2yLMghqkY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-KzgJu03SPTyej3PivGhrmg-1; Mon, 11 Aug 2025 06:56:36 -0400
X-MC-Unique: KzgJu03SPTyej3PivGhrmg-1
X-Mimecast-MFC-AGG-ID: KzgJu03SPTyej3PivGhrmg_1754909796
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e69e201c51so996663585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909796; x=1755514596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SmZ5OhIFbDNhhdemRjccJWJIhJ+GPeWDy3CnIwZY5Y0=;
        b=lWt5qMzB3ao01VNLkrXoZZA722KVMYW/397vsWVLPODcGMe50NdXhtWjTEYwXd5ESA
         Pb6yl7Rt+PcrzmVu5pDGStZ1fuOY3MR2vIflKusIa69iX208DlCG6BC2h1OgKKi00+PD
         VF9GPMcRFRiaIbV4Y3A0srZpitCt8eGZtU5T0Na4ObV0PsCxVYLknNGUinKHHoIMqD95
         ypHBk+Li8DVDYRRSEnrq03VUl/AI4LcvTzHtURl3AZzTdt2XHmwC80Mu7EH1f4g7p/aG
         762/4HNuJKuQnk7Gw2a8M0x8DMP8a+0eIsbSpWZLN/OAq5Ze6n2sJvCMsyuWngKhaYlz
         ijNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWM+5avqgG9KTPoU2EGSQJclsdlpz7EJhUmVNMXogzkDMsTQZBcZT0og3QFfiWyfy7isjggaVMJQk8Jz9m3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5xhVc+CuxoMq/tAAiVn75SDPIvY95LbEC2PIPKLstxPAsXNBz
	WB7lJc9sjKyEzP+qtSj+KY4yn6sgScfZin50JB0oSG5L9xReHlskKan0OuazG9qeCKDHPjhQ+EX
	SHzMfwv1/tc/fX3JAXBr1ydar26oJKaYz1AEWrat2ddilGwuMJIbhg8SelYYlHDuxFV4=
X-Gm-Gg: ASbGncsURO4tALzm4TCUfHoyzo03IICdr/KOmD6xsAA3gxy+yZiBxTix3Aer+JBjdQ5
	rSZhmegVfBEJQQnJg6K5WhqIIOIFkvUMnW0iwB8d7leO1LfN2YZslwS/SSB5Xc8REidpP/KGfs0
	tmyRCM1KeqJV8ECHKEZCSocm2iVcgSfrT2Cgm8E+IOmN9AsRp0xO6G4LKHZpw3GKRBfEJ3q4xUF
	zRlinQ7sPLnxTMsbZA4xFSDxS8PW634H7+TZHCfz7OWEWhOozPtb3jtE0Fgb2seETrMvKhLigmw
	d2Vqe2K7RBQRi4yqUeAR71lwxr+vtqf0H+/vf1ccDllfrV96ZiMbrZK1mhTy6C4evIjngLcEXBb
	bq2E=
X-Received: by 2002:a05:620a:2ae2:b0:7e8:23c1:f472 with SMTP id af79cd13be357-7e82c64cc0dmr1348328985a.3.1754909795600;
        Mon, 11 Aug 2025 03:56:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9n70Dnsh0oekI6lYBsj+g6fiHD2aJUNrf5ZRMtmoVkJvAZxcIb6V9PGnNEHDigLw+MQojEQ==
X-Received: by 2002:a05:620a:2ae2:b0:7e8:23c1:f472 with SMTP id af79cd13be357-7e82c64cc0dmr1348326285a.3.1754909795068;
        Mon, 11 Aug 2025 03:56:35 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:56:34 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:07 -0400
Subject: [PATCH v2 3/9] drm/msm/disp/mdp4/mdp4_lvds_pll: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-drm-clk-round-rate-v2-3-4a91ccf239cf@redhat.com>
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
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=1737;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=QhsR7m95oQQJWiR4k5sEM+znPy8RVqMfVFdEDgPgP5I=;
 b=Yf+/AEJVSVpYyfmQu4W8WyuhOAot3PpTJ66fonHG6NgwPWqhvr62JRFBH9lf6jrYZTbKGBwD4
 RLchj5Jj8AWD0/ZZRq0fRTK+W2ARhNi43oK0yq2QvGqqPc6Fg70Vyhk
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
2.50.1


