Return-Path: <linux-arm-msm+bounces-63587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFA6AF8416
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 01:23:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFCF16E3695
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 23:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26BBE2DCF6E;
	Thu,  3 Jul 2025 23:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WNN8mWfG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B922DCF42
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 23:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751584991; cv=none; b=aMcepiq79vbEAVVgfgweig6bkqahEcSz0SifDZa5WIarY/FQ84KCym9w3zaD8atXfZeAbzYoL+IyS7HQ26AL+QBhbhOQIwC3Z9RsRsFt+9UZ6hLPCnWhaR00PGFPMULUJoonjlitekqenKNRRYqUJUygmbIBQeeSlEtmshIWYjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751584991; c=relaxed/simple;
	bh=1SBXkivgAIQT/xpKmW16GCKl6DQTPvDdkzKcxCMxAeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UHl+vW/mCGkM9lNDmurGEvwNrzsXbt8mjfiy662ZRZy3ERVeX3wJD6HhwyrmJjWlFLKfgxvdbAvyizkia5alc6DE1usW2uPbLTsPK2K3cZmdQMxDt/NlaFHcGKFW7XHkfSNJ5D/MoCWyk8+wjdQrBJX2yNFIQW9z1gOnksS4Lqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WNN8mWfG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751584988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=glmhRhvorqftCM1PQW39H91YcYQ1dirxkl9GgHITt1M=;
	b=WNN8mWfGxSFymuJoZr8vVPjZ5X1fpE2vQagr6CubUxYNeu5YmtlBR/gwSollklkb0Xsgdk
	WCBRMJl8lF86kG7pcE47zCT9Na1FxfYGTpoC2vFMH1b/tQpx0Lvx/ap7KfQM0wTNDya1o1
	piKx3Z5S88+siplNERnnz52lllcxhJw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-zo6yc6M5MH2bHoBnvac2gg-1; Thu, 03 Jul 2025 19:23:06 -0400
X-MC-Unique: zo6yc6M5MH2bHoBnvac2gg-1
X-Mimecast-MFC-AGG-ID: zo6yc6M5MH2bHoBnvac2gg_1751584986
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb5664c771so9139726d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 16:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751584986; x=1752189786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=glmhRhvorqftCM1PQW39H91YcYQ1dirxkl9GgHITt1M=;
        b=Atl0y3WrFQJ2LNV02+1CGlWfpHihycW+sCkgLjvUCOQhntsdpGhhsijKXxnDbzI2YJ
         mXsAnqYY59z2PThNfYGGkKuMTMmLCrHmq304S9e4CPgkBdcia7KPYfoRaVNuFZFqCTQ6
         yjrRas69HYsWk5zXK7qLDYW8YZA0eq2Csgi8uI0F5/uUMzsjnLvjltqtPR1tmPCRNNEk
         fIibUGJY5LJ0EU5rLpY1yESGFETxwF1Wo8zzrfW5vd7vr2dK8LnpWZxcl3wAEkCZ54Gl
         2rMoor+x9MttW6zV+xSEtjIJA5BnE67ZU9g31Rb4YBfzGImMN9f5kwBixqC63up8qU5l
         Hg2g==
X-Forwarded-Encrypted: i=1; AJvYcCWGQ1AaI/OWFst+QEsXrU3zJKijksjxwGN8TC9tu5VeTpuoxwfgBb5c9sewbwy3DvIz7+M9FYeIQGh2PQHP@vger.kernel.org
X-Gm-Message-State: AOJu0YzSwYX4Zv71nfCZ6r9iaXIP9+Y3StjrkXyPwl3gRz+Rs3+Dp1Bt
	TgMnDrFWOM+mhqP1UUW/Zq2HhcYHrmr0Rj18KN4Hu5fUr/4EqDqnEhxXodH8vMgVu3CdwE3iT14
	YlPwAYibDaBbpB5TEcORYC9opU0IquWaws9TGi+vANgBwfWDiaxcParYl4YKS8j0gTKY=
X-Gm-Gg: ASbGncvaWsrenrlHScez7SZ2W9MvXdP/ht42pteBQCjv9GXKj7I9LY+NmD2hcwIG1HU
	vh1ZS8dgX5vcHQZohaqgGhIl+7DH5aVLFT2eVn8dWgE3g6OjGwcC7d8u80ulO53/JWvOHXJUN+p
	xaySTBkAdiV6EjpRcNyrKBnkiCS/eTBbMjGixTKCvgs3/txzZbq2yLz0IEeKJRPIfzglLIiYglM
	gxlJSOC4TZbH+9EHBK3+9TFcNmHwn6oHo0fSITkpGh8psZJHCjVf3WV7hiGBzLC7cBYtTsDzZ9h
	/tqBI7des2WrZH2CVJApYDkdR8l8/uffmlm3XY1D/Zs1FzWgER1SrXYBuRphEg==
X-Received: by 2002:a05:6214:2dca:b0:6fb:5f1d:bf8c with SMTP id 6a1803df08f44-702c6d01136mr4001216d6.11.1751584986120;
        Thu, 03 Jul 2025 16:23:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXulxd6EhHQEWqdLCkq6bowgpk9H5xc/2E0qAWrXV2cw9IMvYCQaGyeK1vlKk4+HCoD7JcAA==
X-Received: by 2002:a05:6214:2dca:b0:6fb:5f1d:bf8c with SMTP id 6a1803df08f44-702c6d01136mr4000676d6.11.1751584985738;
        Thu, 03 Jul 2025 16:23:05 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:04 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:26 -0400
Subject: [PATCH 02/10] clk: qcom: gcc-ipq4019: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-2-3a8da898367e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1744;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=1SBXkivgAIQT/xpKmW16GCKl6DQTPvDdkzKcxCMxAeE=;
 b=F0GhFYifg67W61nanNKHwHfKd+yXvRKHNLyjxttEwNvS+4WIggMD8oWPnfPgFZE6hEmZ1fiIO
 n/Dix9ZjUe/BuSWXFyFuVK1zEaIQUGKOyn0QrOGVaTFUnEWIHOKyt1n
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/qcom/gcc-ipq4019.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index d38628b5226898b6a556a1fe16806cb79c4735da..5ac44cfb53ce023c0668afdcb67de636f3319197 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -125,21 +125,23 @@ static const struct clk_fepll_vco gcc_fepll_vco = {
  * It looks up the frequency table and returns the next higher frequency
  * supported in hardware.
  */
-static long clk_cpu_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *p_rate)
+static int clk_cpu_div_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct clk_fepll *pll = to_clk_fepll(hw);
 	struct clk_hw *p_hw;
 	const struct freq_tbl *f;
 
-	f = qcom_find_freq(pll->freq_tbl, rate);
+	f = qcom_find_freq(pll->freq_tbl, req->rate);
 	if (!f)
 		return -EINVAL;
 
 	p_hw = clk_hw_get_parent_by_index(hw, f->src);
-	*p_rate = clk_hw_get_rate(p_hw);
+	req->best_parent_rate = clk_hw_get_rate(p_hw);
+
+	req->rate = f->freq;
 
-	return f->freq;
+	return 0;
 };
 
 /*
@@ -205,7 +207,7 @@ clk_cpu_div_recalc_rate(struct clk_hw *hw,
 };
 
 static const struct clk_ops clk_regmap_cpu_div_ops = {
-	.round_rate = clk_cpu_div_round_rate,
+	.determine_rate = clk_cpu_div_determine_rate,
 	.set_rate = clk_cpu_div_set_rate,
 	.recalc_rate = clk_cpu_div_recalc_rate,
 };

-- 
2.50.0


