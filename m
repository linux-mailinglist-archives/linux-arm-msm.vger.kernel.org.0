Return-Path: <linux-arm-msm+bounces-64431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB19AB008A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 18:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9874854281C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 16:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224C42F0E25;
	Thu, 10 Jul 2025 16:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L98kfYr+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED222F0E21
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 16:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752164876; cv=none; b=k9JISWLXBHf2J6kNXj5MWVCAPAGVfybEhBKryAAu3wMfhfAiEMsyvIJPFEeYcAXKTBQVpG0Mvke6ks5WhtAqRcr2Axlx32Z3dS/3zQQ1Bns0I2rl74jtSmbBwvTFgdaFKJEMhZelyAdHlV9lF21eJBKam+f3Ki62zei3MFo+ErM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752164876; c=relaxed/simple;
	bh=2tcX4i+WplqrfRmawSRGIQU9quR/NT2tlxOGP4FTR2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tj4moz3NwPcI7oWDPMeh4MJYo3HlOw0FqswnCbqiT+z5irCEfZSg80QQCsBOt2T0F3H7vqgSSb5ucc73xfjpHgjsifr6ICeOQqf0wyslWnaN1bhUAwIaGU5y3fiQDqRqDRf6FeWwLEJvrEpWUSPQJgBJDWvZFo+rm4AL78h9KUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L98kfYr+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752164872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8lg6vSRQIoxZQq3J6kiqCP0RJ7z/x8IqpzwjD/7nChQ=;
	b=L98kfYr+6u9NVtE4T1HobAclVDxgOC4uo2FIJ6jZ5DjMwXJHIDhWsc08TR2mBS5S/pe3Tg
	y5axUx842qtp6qoz/wcnbBzxV7L0vWbifGqC0306fpz8lO7tAioVEZeEpUtmqB932ymJRZ
	fwyQ9jJmhyOpALqV8zOneW6LCYBllV8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-tR7unPYcPeaEj50_R6pD7g-1; Thu, 10 Jul 2025 12:27:51 -0400
X-MC-Unique: tR7unPYcPeaEj50_R6pD7g-1
X-Mimecast-MFC-AGG-ID: tR7unPYcPeaEj50_R6pD7g_1752164870
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d399070cecso214996485a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 09:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752164870; x=1752769670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8lg6vSRQIoxZQq3J6kiqCP0RJ7z/x8IqpzwjD/7nChQ=;
        b=oCWOO5fo32YVoHdl1rMisIeB3iEbvHxrOVkFJWEwcp+5ZUAC9ipFQoQ5gdeKCWjQHJ
         dkoug3hyIkLkK2hgLfDA2CbsatHigFW5kg/s/Bcb/kfee/oWUxe+2KJPhwqm8nwn3BR6
         wsj8x836uSGbuF9SW8t92jO6ZMV437U87L9Nvik1ZqqVJOzUilXOLGjdlxvFADX9vnBR
         HGjCemEbx1coo5VxH/coYUZK8xDecye4/HbO7gVoKNs3qCp7glQACezMgHvdUmy6fgAQ
         V3vVQYr07khMP13U//05UPNtME1EeY5F0fSi6D4zr5LStziO5jFFNzDcunI9r+YicGVn
         rxYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWObHNCsSYjb7wanXQd0jmJU5Ff5+QnwC0rxRbYRbVuJBmmhFphF3vpVfyXoDF1bfMMeeeeDgQ52dqnu1KY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2qfBbfF6GpN9gh7CLlKCrtDAVK4tkst5SAIJeZ1jT8HVSuReD
	ikbyuOjaXjcL2lkwwT9iku2g+1As8CyLzZUS5CDKaVZAZAoPtBzW75lJQDjlPbin0LdwORINbeA
	QfSjvNDRfWKsaTHLljZle/YT+dT7i12ilv9Q3xNXYnM2tsnlqFCZBrHHLuMLd2c/dlXA=
X-Gm-Gg: ASbGnct26hiD6XqlZyRiorsPzNsoAmOUm1PoWo1Js0j8xSrABJetBdsrJefPUwNyNS1
	W1k0Prevw6jrAK/o/pzcxLJxRrSJ11zwkniIPl7D+pFX0hgfhCl7LW3nZf1PFfbfEL45uZ2HqVK
	HEVGDLWBsRxqfSoQd1Ly2sLOxOTfpdknJAWYPuR8Wq1wITv2uaNE1hfSgn/erJ2j1+hDTaE6sWq
	jt9AXqxNcRklPcNR5q88i4yOtirnAtjDW5DovMeGDXeB5RonC0bvlOAHS5mDmJKqilKl4gbqr3P
	6rbIrG+b+0VVSOSf1Dh/aWn5D70Rca46lYuH1zGFE3sn2RUGAEdEAyo2GX9K
X-Received: by 2002:a05:620a:278b:b0:7d4:4b40:fcab with SMTP id af79cd13be357-7dde995087emr35199985a.6.1752164869848;
        Thu, 10 Jul 2025 09:27:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzID3fxPLzjceUNQ7ykn+etrxan44d1sFVAzLmbbmeJrEyagiiMxYKuKtBXqRalDrZs3g0iA==
X-Received: by 2002:a05:620a:278b:b0:7d4:4b40:fcab with SMTP id af79cd13be357-7dde995087emr35185885a.6.1752164868703;
        Thu, 10 Jul 2025 09:27:48 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcdc5df99asm113487685a.49.2025.07.10.09.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:27:47 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:27:27 -0400
Subject: [PATCH 1/7] drm/msm/dsi_phy_10nm: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-drm-msm-phy-clk-round-rate-v1-1-364b1d9ee3f8@redhat.com>
References: <20250710-drm-msm-phy-clk-round-rate-v1-0-364b1d9ee3f8@redhat.com>
In-Reply-To: <20250710-drm-msm-phy-clk-round-rate-v1-0-364b1d9ee3f8@redhat.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752164864; l=1824;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=2tcX4i+WplqrfRmawSRGIQU9quR/NT2tlxOGP4FTR2U=;
 b=qzj4XInGJ7/EHJVBNG2+t0ziIbNz896g6fTJEvecN0CZRiGCaopgTV+PetsARQ4sfl9hv4ynl
 EW7hPRPg9BxC9pUnEaWMMeMPqih8fcUG8Gm5AhUD6C5SJGf/nMExHjE
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index af2e30f3f842a0157f161172bfe42059cabe6a8a..d9848b5849836a75f8f6b983d96f8901d06a5dd3 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -444,21 +444,21 @@ static unsigned long dsi_pll_10nm_vco_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)vco_rate;
 }
 
-static long dsi_pll_10nm_clk_round_rate(struct clk_hw *hw,
-		unsigned long rate, unsigned long *parent_rate)
+static int dsi_pll_10nm_clk_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(hw);
 
-	if      (rate < pll_10nm->phy->cfg->min_pll_rate)
-		return  pll_10nm->phy->cfg->min_pll_rate;
-	else if (rate > pll_10nm->phy->cfg->max_pll_rate)
-		return  pll_10nm->phy->cfg->max_pll_rate;
-	else
-		return rate;
+	if (req->rate < pll_10nm->phy->cfg->min_pll_rate)
+		req->rate = pll_10nm->phy->cfg->min_pll_rate;
+	else if (req->rate > pll_10nm->phy->cfg->max_pll_rate)
+		req->rate = pll_10nm->phy->cfg->max_pll_rate;
+
+	return 0;
 }
 
 static const struct clk_ops clk_ops_dsi_pll_10nm_vco = {
-	.round_rate = dsi_pll_10nm_clk_round_rate,
+	.determine_rate = dsi_pll_10nm_clk_determine_rate,
 	.set_rate = dsi_pll_10nm_vco_set_rate,
 	.recalc_rate = dsi_pll_10nm_vco_recalc_rate,
 	.prepare = dsi_pll_10nm_vco_prepare,

-- 
2.50.0


