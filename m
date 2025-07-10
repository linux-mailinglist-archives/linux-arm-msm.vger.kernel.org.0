Return-Path: <linux-arm-msm+bounces-64433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C705B008B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 18:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 911F41C2634F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 16:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245FA2F19B9;
	Thu, 10 Jul 2025 16:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GlFutpi4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2072F19A7
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 16:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752164882; cv=none; b=R/GATXrmeqXhFmixFDeRetKmOH5F7t3wGLs+R5bqQGyIYBbpgMkl4ZTEhNeGv87Xg5MOJj0CVTqKR/yf2v15kmPdP+Rs3ialxc6dGimRyXTlM5EY1mt0ESUsPq/YVA+qlCheVP3Rn4ybUIIlGRQG9WWmNl68bO5p/SJq875cwaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752164882; c=relaxed/simple;
	bh=3ODFGmq25OpFxWiAcH0OIyfIX2aQaxGLNyYzCPsECGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bjVxS+OYAy+o2QTXXj/9UrUEiVcwu3lgkXnTcDslohTAHaHJJxJ4DseRkp+sSrPoYHYCufblrMiZiC+6W6GIDfUDbH8Mo9AAhPEhEZigbtmmfI7PrMTJ0TenC5qNJ8zMShgOOSPeFgr6PScEnveK52FCKa/H45OaiKQ9eVwIKGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GlFutpi4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752164879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p9mwZB2plhUHbudI2oPn9i55OvcjPNJuoUdisMW4qVI=;
	b=GlFutpi4q+TX6dT6pbFs/8bDdtSkfPsiwhyWI3564OMrfUP1lHFhGou6NddxS8momSgJhK
	92A/iV8BuuOv2IS8+aOAKDOrikeXWlhDCEJSIO/GUaIRWB7CEqItMdeLLeJU3cZUwx5jzp
	19n1CfV0L7gdp0DHNZDLKXluLzepARg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-XoPJXYcuPkytO3Dls1aydQ-1; Thu, 10 Jul 2025 12:27:57 -0400
X-MC-Unique: XoPJXYcuPkytO3Dls1aydQ-1
X-Mimecast-MFC-AGG-ID: XoPJXYcuPkytO3Dls1aydQ_1752164877
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3cbf784acso281809385a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 09:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752164877; x=1752769677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9mwZB2plhUHbudI2oPn9i55OvcjPNJuoUdisMW4qVI=;
        b=Nn2TQOLQ9Ys0vkNjkdcvhS8R7OVezRA20tkueoYf7VqaxTz64kz9e8J4f8us97FCwS
         DzAzvYc/7/g1yQE9fdtfyH3pQqhjoltfZSAJr/S1/bfisjHCwE6rtg2ZeJlFmmPiIMXQ
         vxobtpATgKembqBAPCrwas9au0wHHm3PzvbivulsLs14+vszdFKRALJEh34K3Vc8dsWl
         u9veVkc7AUMcRsUuaTcNhXxIH9XWtBPyVJ14Y7ft02/K87jsBAscZ8SOhHrwhxpDKt6X
         F9HIyHRbcOoXbtb9qCz2ANJ5yZT8v18v+j0jr4qfws2N9pPCCVble7CuILZgjPe0yv9n
         HZlw==
X-Forwarded-Encrypted: i=1; AJvYcCUkpXfYslcVW7A2RfWp1ZSnx1zR/zqn7Y9P6X9B3s9abB4kD2aO7vZgFjQ9xLiZ9ADiE4CAHFxU2GtvL7lh@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw6DzuEtXFp1xY9cwfpEw1iiOYbovEG9j3g6IgvQpkkR7pfz/h
	2WuB5rT4grKfeMLCRCWqL9jDdkLD5H36A2kuFcneozEF2IjGbA6VbPPZVJ0+hiLDSdQgUzXFLLL
	o+lpIvMUh9tRLa030YPc8dHlCnA8rUl9NJXsbI2l/WnFJhHh6ENaIVHfbDzFyPmO4h98=
X-Gm-Gg: ASbGncuATXveyV9tS0Lt3V7jpKaNB3Wet0xxqY8GAAPCtvjqgzm0I1q9gQyfmAqHiyA
	wIZG0ViclVU2cjspiMI59CGSLocI4PN3PO1QMQEVrg27RcagvNO8WyimEfymf4y50zMqruy5/6T
	z/FmpEIh01RUp8k4sStUfQrGVWJ9VVZ7EGWACVzuCz2QSW+LEMAslGtAAsX3fwfaunjugiRu4GT
	38uT6iDVRZVyMzGAVWbZsb2USz297xQan1iv/zWRQpTa91KB3YY9pYzRzgTQ1OB2P4mJkXfwxW9
	xfPu9VhYKA5EYNk7ZpmbO3/aoaCsqvQ13bIBxjzJ0WNS3UctwQVxc0wZt5g3
X-Received: by 2002:a05:620a:720d:b0:7ca:efed:8644 with SMTP id af79cd13be357-7dde9d4b40emr22152685a.5.1752164877011;
        Thu, 10 Jul 2025 09:27:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5Dc+meUY3eLJ1nyNqdTNqbIqZwCg2pxyiI+KO5nsXIe7JUd0ZvtudqCR2DM307gX30VZuYQ==
X-Received: by 2002:a05:620a:720d:b0:7ca:efed:8644 with SMTP id af79cd13be357-7dde9d4b40emr22149985a.5.1752164876637;
        Thu, 10 Jul 2025 09:27:56 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcdc5df99asm113487685a.49.2025.07.10.09.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:27:55 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:27:30 -0400
Subject: [PATCH 4/7] drm/msm/dsi_phy_28nm: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-drm-msm-phy-clk-round-rate-v1-4-364b1d9ee3f8@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752164864; l=2599;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=3ODFGmq25OpFxWiAcH0OIyfIX2aQaxGLNyYzCPsECGw=;
 b=6/oStFWVrSUL8wUy/Yr+UeM9R3GqucZAe/BmJ+rdDWThekiBeQJQsTbUFCiwYDPvTUlOQurv+
 kZVgof83EB5BMQUlmdA4vkC4n6yoCb7TJpusAuMVQfBfOhbDoFBQBI1
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 90348a2af3e9dac72924561b23b169a268abc3b0..6f500f6ac72813b542775e392680499f2eea6df5 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -533,21 +533,21 @@ static void dsi_pll_28nm_vco_unprepare(struct clk_hw *hw)
 	pll_28nm->phy->pll_on = false;
 }
 
-static long dsi_pll_28nm_clk_round_rate(struct clk_hw *hw,
-		unsigned long rate, unsigned long *parent_rate)
+static int dsi_pll_28nm_clk_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
 
-	if      (rate < pll_28nm->phy->cfg->min_pll_rate)
-		return  pll_28nm->phy->cfg->min_pll_rate;
-	else if (rate > pll_28nm->phy->cfg->max_pll_rate)
-		return  pll_28nm->phy->cfg->max_pll_rate;
-	else
-		return rate;
+	if (req->rate < pll_28nm->phy->cfg->min_pll_rate)
+		req->rate = pll_28nm->phy->cfg->min_pll_rate;
+	else if (req->rate > pll_28nm->phy->cfg->max_pll_rate)
+		req->rate = pll_28nm->phy->cfg->max_pll_rate;
+
+	return 0;
 }
 
 static const struct clk_ops clk_ops_dsi_pll_28nm_vco_hpm = {
-	.round_rate = dsi_pll_28nm_clk_round_rate,
+	.determine_rate = dsi_pll_28nm_clk_determine_rate,
 	.set_rate = dsi_pll_28nm_clk_set_rate,
 	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
 	.prepare = dsi_pll_28nm_vco_prepare_hpm,
@@ -556,7 +556,7 @@ static const struct clk_ops clk_ops_dsi_pll_28nm_vco_hpm = {
 };
 
 static const struct clk_ops clk_ops_dsi_pll_28nm_vco_lp = {
-	.round_rate = dsi_pll_28nm_clk_round_rate,
+	.determine_rate = dsi_pll_28nm_clk_determine_rate,
 	.set_rate = dsi_pll_28nm_clk_set_rate,
 	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
 	.prepare = dsi_pll_28nm_vco_prepare_lp,
@@ -565,7 +565,7 @@ static const struct clk_ops clk_ops_dsi_pll_28nm_vco_lp = {
 };
 
 static const struct clk_ops clk_ops_dsi_pll_28nm_vco_8226 = {
-	.round_rate = dsi_pll_28nm_clk_round_rate,
+	.determine_rate = dsi_pll_28nm_clk_determine_rate,
 	.set_rate = dsi_pll_28nm_clk_set_rate,
 	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
 	.prepare = dsi_pll_28nm_vco_prepare_8226,

-- 
2.50.0


