Return-Path: <linux-arm-msm+bounces-63595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C99DAF8474
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 01:45:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01A1916F25C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 23:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7FD523E23C;
	Thu,  3 Jul 2025 23:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aykQ0y6J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB21E2CCC1
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 23:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751586354; cv=none; b=B0RfAIImnrdLVBGrjs7OGcpOnuoZHSlRUz9/yUYEKiPjER1qE5T3vqbUWbNLT+MnOe3s6gFkaH4mjWO7nYgY4C/1tR8eElVT4Uru1FKK4gygVtHIZFhYIlNP040v1agrPJL1tSEbyO5wcNK6a/rD9CL66Eoy0iO0dHUPIph/r3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751586354; c=relaxed/simple;
	bh=4fRm/4wvZQWe/TuI4l5eob8PB/NYw5v9nV4VOmFwTUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NRin54k5fTIAtL1l5ktiWWtX22Z3XyDRmYkOtfb03s5k5mCEQmaYJiF+j4YyvbNggHTnShJ1IPJTwgC+LQKfOEnGZgf9xGXHEq3UFZJJg94PVvM8XpOggUZvLTEaEG4K1+BGju5TT3DkEk9DROpxVsxYxKJX0eDsgjRuEAJsxxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aykQ0y6J; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751586348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vIUTPB0Xa7IujQxGdU5BbuzZFcJXYmPAbUo0ojDRNf8=;
	b=aykQ0y6Jq2GvuagtQo/AVRHwTjnpO4ksMpPpm1ctmE45f6nmxIG9ki/I7tBC8aNY/F1gfj
	AavjWelxb+JA2lfU08ofLVqQ0QrqB5mws8KljFTH9bZGhJ1OkmhGZx8ny2ZlsMSngHvd+r
	BxTW5ZFSipnIwZQGAWWHZzP+mntveYQ=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-Ffr5RQZvPy-qF6KVfNM4zA-1; Thu, 03 Jul 2025 19:23:33 -0400
X-MC-Unique: Ffr5RQZvPy-qF6KVfNM4zA-1
X-Mimecast-MFC-AGG-ID: Ffr5RQZvPy-qF6KVfNM4zA_1751585013
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fad8b4c92cso8480066d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 16:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751585013; x=1752189813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vIUTPB0Xa7IujQxGdU5BbuzZFcJXYmPAbUo0ojDRNf8=;
        b=ioCpSSHPEhatbci7eV6fUoxct3OvyjwUAmuwdq53/HOfkyuyBykyklEHss8JM5WwT5
         NNFaGaK7Q6ENnen8IHJdB0rHSNscJANKPT2iE8PXSkNm+dQbE7UM0WBeINUWkMdeatpE
         YuMRH9+guugIoL2O+aL6D7f2DeaOPZ+KOTxwCgUY2Lo2PWC/Fs0Dt2q8MCPJxLNb6y04
         rVT8lEuwvppQIEGA2UH/CmrRrCPthGyPU3KaCmStaA06ad0uo/CpgRhniGtJCva0N4GH
         YeYDPpecglqB3yD/VGvccQLjhisRh20Ot6pqNz4Bt/XQ9283p/Kw2sI9t1AoH7PnfCsM
         JCPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJtio5BwEkDNIgXY29eal0qmlBs5IHnhyYLX5wkU7vZ+leEqVTYGaCVIu3Lzy1exmq6tVnHV8CrVb+t5dG@vger.kernel.org
X-Gm-Message-State: AOJu0YzhDwLQjlkPLTI5lotgd3q8QglwtKKzV1Kn8aFc1N8/fv7BOgxl
	D81aoQEC2PJ2pThdpbx2pHRzuMifiFZWpTngpgYnkq+GzOfnayRhp+aHWSfarkgWn8VbhvI2WuR
	KdcwJ14cUSV2G19SJP6Ob2ZflHTesEA3jBVUTy/V6zFHpJVHIi46RVwSNAL1tB4PwYzQ=
X-Gm-Gg: ASbGncuYSWOAHQZKX0cVYiSM2z2uHhu0OaTLD2ZlH1jubqq2/4PLZX5NM34aK2eHRzS
	HqEBzTf0R8AbKS3j3lE5aQ8LvGTxJ6vLfYFIDbb+bIJJD857N8RwyH2o3s+z7ob8VBTtU1ilvGc
	y0lynNXrSquc9HOd1Fs7pG9nirmDInwF93ENwQsBkBTnHF88BI9dpfzvoC1r4i9aQP1l2VFZ3Pw
	cm7lGk0w4oTHTNEzQ3CiK+AoFeX6ikY8I4lwBPbGU4G8e0lScntVY0X2Kuub322RHw9oTt0kAl6
	je3mCnsZlV7llsFYJMkV0nQzJZRsPi/FRWKx07SPgEQI6I0EhJ1/743AvgaNzg==
X-Received: by 2002:a05:6214:400f:b0:701:945:68a0 with SMTP id 6a1803df08f44-702c6db6d72mr2550986d6.26.1751585012830;
        Thu, 03 Jul 2025 16:23:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsLP+EtTPJqTbUAM3azCv14keKHQHBVX2XiZhb2AArhva5ftrpXUEhswiQr1GgZeMTOKJdIA==
X-Received: by 2002:a05:6214:400f:b0:701:945:68a0 with SMTP id 6a1803df08f44-702c6db6d72mr2550676d6.26.1751585012507;
        Thu, 03 Jul 2025 16:23:32 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:29 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:34 -0400
Subject: [PATCH 10/10] clk: sunxi-ng: ccu_nm: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-10-3a8da898367e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=3661;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=4fRm/4wvZQWe/TuI4l5eob8PB/NYw5v9nV4VOmFwTUI=;
 b=fvx7qhP1aLoIOPU3sjNvBCth81x2jcOY/I9wnn1tKMT2BbPA4cFWn1Ytapjub1E1HqAvCp+zr
 RDPpPrT6r0wCY9IQ3u30PGRfoAmv/kGQTGOqlafbNKX0lErw2qUupAD
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

I manually fixed up one minor formatting issue that occurred after
applying the semantic patch:

        req->rate = ccu_nm_find_best(&nm->common, req->best_parent_rate,
                                     req->rate,
                                     &_nm);

I manually changed it to:

        req->rate = ccu_nm_find_best(&nm->common, req->best_parent_rate,
                                     req->rate, &_nm);

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/sunxi-ng/ccu_nm.c | 43 ++++++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nm.c b/drivers/clk/sunxi-ng/ccu_nm.c
index a4e2243b8d6b4a8fdd9ea1ff2ca06e2f1a009632..df01ed3b37a6b56e93e18cc4c1ad5909e2ba0c5b 100644
--- a/drivers/clk/sunxi-ng/ccu_nm.c
+++ b/drivers/clk/sunxi-ng/ccu_nm.c
@@ -116,39 +116,39 @@ static unsigned long ccu_nm_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long ccu_nm_round_rate(struct clk_hw *hw, unsigned long rate,
-			      unsigned long *parent_rate)
+static int ccu_nm_determine_rate(struct clk_hw *hw,
+				 struct clk_rate_request *req)
 {
 	struct ccu_nm *nm = hw_to_ccu_nm(hw);
 	struct _ccu_nm _nm;
 
 	if (nm->common.features & CCU_FEATURE_FIXED_POSTDIV)
-		rate *= nm->fixed_post_div;
+		req->rate *= nm->fixed_post_div;
 
-	if (rate < nm->min_rate) {
-		rate = nm->min_rate;
+	if (req->rate < nm->min_rate) {
+		req->rate = nm->min_rate;
 		if (nm->common.features & CCU_FEATURE_FIXED_POSTDIV)
-			rate /= nm->fixed_post_div;
-		return rate;
+			req->rate /= nm->fixed_post_div;
+		return 0;
 	}
 
-	if (nm->max_rate && rate > nm->max_rate) {
-		rate = nm->max_rate;
+	if (nm->max_rate && req->rate > nm->max_rate) {
+		req->rate = nm->max_rate;
 		if (nm->common.features & CCU_FEATURE_FIXED_POSTDIV)
-			rate /= nm->fixed_post_div;
-		return rate;
+			req->rate /= nm->fixed_post_div;
+		return 0;
 	}
 
-	if (ccu_frac_helper_has_rate(&nm->common, &nm->frac, rate)) {
+	if (ccu_frac_helper_has_rate(&nm->common, &nm->frac, req->rate)) {
 		if (nm->common.features & CCU_FEATURE_FIXED_POSTDIV)
-			rate /= nm->fixed_post_div;
-		return rate;
+			req->rate /= nm->fixed_post_div;
+		return 0;
 	}
 
-	if (ccu_sdm_helper_has_rate(&nm->common, &nm->sdm, rate)) {
+	if (ccu_sdm_helper_has_rate(&nm->common, &nm->sdm, req->rate)) {
 		if (nm->common.features & CCU_FEATURE_FIXED_POSTDIV)
-			rate /= nm->fixed_post_div;
-		return rate;
+			req->rate /= nm->fixed_post_div;
+		return 0;
 	}
 
 	_nm.min_n = nm->n.min ?: 1;
@@ -156,12 +156,13 @@ static long ccu_nm_round_rate(struct clk_hw *hw, unsigned long rate,
 	_nm.min_m = 1;
 	_nm.max_m = nm->m.max ?: 1 << nm->m.width;
 
-	rate = ccu_nm_find_best(&nm->common, *parent_rate, rate, &_nm);
+	req->rate = ccu_nm_find_best(&nm->common, req->best_parent_rate,
+				     req->rate, &_nm);
 
 	if (nm->common.features & CCU_FEATURE_FIXED_POSTDIV)
-		rate /= nm->fixed_post_div;
+		req->rate /= nm->fixed_post_div;
 
-	return rate;
+	return 0;
 }
 
 static int ccu_nm_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -233,7 +234,7 @@ const struct clk_ops ccu_nm_ops = {
 	.is_enabled	= ccu_nm_is_enabled,
 
 	.recalc_rate	= ccu_nm_recalc_rate,
-	.round_rate	= ccu_nm_round_rate,
+	.determine_rate = ccu_nm_determine_rate,
 	.set_rate	= ccu_nm_set_rate,
 };
 EXPORT_SYMBOL_NS_GPL(ccu_nm_ops, "SUNXI_CCU");

-- 
2.50.0


