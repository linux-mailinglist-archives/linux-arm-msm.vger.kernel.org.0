Return-Path: <linux-arm-msm+bounces-68243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE5AB1FCF0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 00:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06F391729A6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Aug 2025 22:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 400762D8766;
	Sun, 10 Aug 2025 22:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yyg3oG7l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC6C2D77E1
	for <linux-arm-msm@vger.kernel.org>; Sun, 10 Aug 2025 22:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754866672; cv=none; b=Vwdpa0vP7AYWeQleRoBLKO762XccE4LMyZokyEtnBoRY1NowfIBNizVGNHaXXGTKrIylY07C4LAd1AAz4m++t34TqVKNDLaIWJn6b4Wa6eobAcMtvGDFqH5GJh2lIQA5pFJM3rlPAd4XYoSqkZ90PyxQvN8I1131GfPGRS2oHic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754866672; c=relaxed/simple;
	bh=zgC0RAqMfe4QHFoCK3ImKc6JYhHbtGs2pWeVB9da7xM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OO8MfT3OYd9YEZ9p7y4iElrU5B1zjgisJFTSIKMCpFd8Deyjb8+pufAIRq9NMQeLpE8VTyIl3lZ0MWJASkY5FMDH87PCo55GLRGn3rxid+GOu4Hs3wjRXmUZw/Sz0OUnYiEfc/uyrgjODHYv6FVoUlarxnvZRqA8Q1GBZRno4nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yyg3oG7l; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754866669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8SfCqXrLXFpaQOsEIXkeTXLB3lBS80oYBheI2i61aRI=;
	b=Yyg3oG7l7MzvjXkc3d7bloPpfb3/bpQtJN7kTPrqzfDGZ2EPz1d+mruWtv4sDH9gjtCs0R
	nhWDsW6SytAn5zkJRl8/D1jhYkQxO69JHv6X3fVXl2KbEMpKhRPDhZ+fPpfhrew4CkK4rs
	sRcyJS4+kOQZpEDbOOgNeOAjKHvkKZA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-FuRH1HtQMNiJyVo8gxfKPw-1; Sun, 10 Aug 2025 18:57:48 -0400
X-MC-Unique: FuRH1HtQMNiJyVo8gxfKPw-1
X-Mimecast-MFC-AGG-ID: FuRH1HtQMNiJyVo8gxfKPw_1754866668
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b096d8fc3bso98208051cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Aug 2025 15:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754866667; x=1755471467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8SfCqXrLXFpaQOsEIXkeTXLB3lBS80oYBheI2i61aRI=;
        b=rDBQ03tILlhth842R8yO1vP1BhCrqaZaPV8EYK/o7XAiCT6GoXeENAnzW7QO2NRyw0
         gRk3BuqGQztLeuysD3HNGOidS9lXbT8QDgpZ/BYpFVXxwv39xw37g1qAz76KyCE6/WHB
         4I14ylGflY0JQQz/MSdwzDnOFdYUDnqTmtb0M0XA/GhqD0vcsYPCSUypz36H5/0hDnFQ
         AEtj41tZ57Ag/zCUR9dBD2mk9gitbUJInyiiOw3Lpi+oAElb6ahjkZh5QUMtqxwN6jd7
         A4MpzLsJZvoA3NgO7o7PXTIBw1rw98GCGWDVNsi59rtpzqibhKI3u7hFB/9z27FbKZIb
         4GCg==
X-Forwarded-Encrypted: i=1; AJvYcCUeZdM76ys4FvRsMojqdGKKHurPWhneAm6mRNyy90Vco826WlYc/xZfoGifCY+/THBtPCyKC2/+Z/TkajK8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Yxuc9958x7dvtM5g9VdQFBuSclylbNH6RU7RpYvuqvBD1mKj
	8KHrrwIB55rN8NZ+4WBdCyYv/2m0SI8Z5l9U7TnHS3YPGHkA853ojJDHFoCBKKL1Pl0kqtwreRC
	5u7dGvHIFCs+Iw80FsP9teuUcQLeVRmo3KHqoO55U3i8Xu9m8JXkcXv9LpL9Z6tckz34=
X-Gm-Gg: ASbGncuhg0ruBT/Kf+9kffEHv8sQ0o+RozbrfTZMkVzZrh+gNo2MveYyYYqUQr/sTXp
	+o9/XoRwms+X6Da5zx5J1AeqSAz8BPyd8oqFuXCxv9OpM2zMz0sa+kth/1XLNrAworCWmyqFsZY
	dM4eaWgW4FuokbbQqyiv0zI/2k2dpPq4UTmojLj0eLKIebwNIzT22J1eF9c9KYoyTgmUgciN9zW
	/pULoIvplqF7/vawhUWgRs1e7cVkkdWHPLychVk2pkPBG8w00puOmpislWkZ9Ii3B+E7SFvEOBE
	i+su6Kds2oKffolUp5wPS4vNT4uCn9Xu+rvBWpEdCtcngZjd37J2uyMtlzOfB28569O+aD2vUf7
	eIMFv7w==
X-Received: by 2002:a05:6214:21e3:b0:707:616f:fff4 with SMTP id 6a1803df08f44-7099a199543mr177311496d6.10.1754866667587;
        Sun, 10 Aug 2025 15:57:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmz3g1MbcKxpKoE+L/OvCm0G94lPBEhAXAtzenne1OaexYFo15GBJiT3E87eJ0e4mZmWm1MQ==
X-Received: by 2002:a05:6214:21e3:b0:707:616f:fff4 with SMTP id 6a1803df08f44-7099a199543mr177311176d6.10.1754866667214;
        Sun, 10 Aug 2025 15:57:47 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cdd9916sm144266336d6.61.2025.08.10.15.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:57:46 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:57:26 -0400
Subject: [PATCH v2 2/7] drm/msm/dsi_phy_14nm: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250810-drm-msm-phy-clk-round-rate-v2-2-0fd1f7979c83@redhat.com>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754866653; l=3160;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=zgC0RAqMfe4QHFoCK3ImKc6JYhHbtGs2pWeVB9da7xM=;
 b=g/OyIxfyVmL0j+PhW5RWDXbEs2uOlzP1vLM9nzajU+5emPdyje17xtKS5Qd4HfejxqWdsQWeZ
 8ROBSPZGhvzDt9b3VBZA5OUUGLIt5EVJPoH+qM81ctxrdXWei/umj9J
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series. The change to use clamp_t() was
done manually.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 34 +++++++++++++++---------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 3a1c8ece6657c988cfb0c26af39b5d145bc576f8..fdefcbd9c2848a1c76414a41b811b29e5fed9ddc 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -578,21 +578,19 @@ static void dsi_pll_14nm_vco_unprepare(struct clk_hw *hw)
 	pll_14nm->phy->pll_on = false;
 }
 
-static long dsi_pll_14nm_clk_round_rate(struct clk_hw *hw,
-		unsigned long rate, unsigned long *parent_rate)
+static int dsi_pll_14nm_clk_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(hw);
 
-	if      (rate < pll_14nm->phy->cfg->min_pll_rate)
-		return  pll_14nm->phy->cfg->min_pll_rate;
-	else if (rate > pll_14nm->phy->cfg->max_pll_rate)
-		return  pll_14nm->phy->cfg->max_pll_rate;
-	else
-		return rate;
+	req->rate = clamp_t(unsigned long, req->rate,
+			    pll_14nm->phy->cfg->min_pll_rate, pll_14nm->phy->cfg->max_pll_rate);
+
+	return 0;
 }
 
 static const struct clk_ops clk_ops_dsi_pll_14nm_vco = {
-	.round_rate = dsi_pll_14nm_clk_round_rate,
+	.determine_rate = dsi_pll_14nm_clk_determine_rate,
 	.set_rate = dsi_pll_14nm_vco_set_rate,
 	.recalc_rate = dsi_pll_14nm_vco_recalc_rate,
 	.prepare = dsi_pll_14nm_vco_prepare,
@@ -622,18 +620,20 @@ static unsigned long dsi_pll_14nm_postdiv_recalc_rate(struct clk_hw *hw,
 				   postdiv->flags, width);
 }
 
-static long dsi_pll_14nm_postdiv_round_rate(struct clk_hw *hw,
-					    unsigned long rate,
-					    unsigned long *prate)
+static int dsi_pll_14nm_postdiv_determine_rate(struct clk_hw *hw,
+					       struct clk_rate_request *req)
 {
 	struct dsi_pll_14nm_postdiv *postdiv = to_pll_14nm_postdiv(hw);
 	struct dsi_pll_14nm *pll_14nm = postdiv->pll;
 
-	DBG("DSI%d PLL parent rate=%lu", pll_14nm->phy->id, rate);
+	DBG("DSI%d PLL parent rate=%lu", pll_14nm->phy->id, req->rate);
 
-	return divider_round_rate(hw, rate, prate, NULL,
-				  postdiv->width,
-				  postdiv->flags);
+	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
+				       NULL,
+				       postdiv->width,
+				       postdiv->flags);
+
+	return 0;
 }
 
 static int dsi_pll_14nm_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -680,7 +680,7 @@ static int dsi_pll_14nm_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops clk_ops_dsi_pll_14nm_postdiv = {
 	.recalc_rate = dsi_pll_14nm_postdiv_recalc_rate,
-	.round_rate = dsi_pll_14nm_postdiv_round_rate,
+	.determine_rate = dsi_pll_14nm_postdiv_determine_rate,
 	.set_rate = dsi_pll_14nm_postdiv_set_rate,
 };
 

-- 
2.50.1


