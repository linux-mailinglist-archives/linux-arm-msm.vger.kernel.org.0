Return-Path: <linux-arm-msm+bounces-63593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74127AF8427
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 01:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C842856602B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 23:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1022E11DC;
	Thu,  3 Jul 2025 23:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HgRWBlL9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439072DCF40
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 23:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751585008; cv=none; b=pxiAT5TgKeDaYdD7ZzlUeQolFBCq4D3xqUxzV7u/QyyRceOoeKbOf4pb073esPArEiUN6Jx3uzxJBiX2yhXZli+/2RAjPgOEwPByUkZTCR9krUhfDnu9cBJWTxdUX33033oCz+kJeGHbLKdVIufARVomnH5E6H5PgzV6sHFJULs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751585008; c=relaxed/simple;
	bh=btToz2S3ADP3ZxZpciNSy/MUe5vuMQa0nAdFifjfxYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sx7yvmTLrPqkV02S/9S77tUz6CF8ThfcymLvpJLJI+OeksVh74yTBT/nWXNdchbksfzN4QfBt2/JDrAHc1P6gls+rDyErtc/dDbbPzcLtqolXkyas8pkUxvLOL6Z21ICfeJyvTm7IZ0BrRvabOzj0Y0PJ+l5GuY9IYucrZS+8os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HgRWBlL9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751585006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PLJPkvu+exBJdImF9hJf2W6Rmq4JjRca1LT16iZ+xSg=;
	b=HgRWBlL9BhglwFuxNhGyQLnYwojLJWAC5CtX4FTQDXWZHtcBJKHT6Cet8Yw95mdWrpeVfs
	oAgKXrBSIbCvTefY/iDxD6IRJKzO0moqkQrONMk4MZx3rOkNmt/w134UVgUWrCS5cSob4q
	xHGuXOH3LH0S04rsGKXzvufpxCVqBsQ=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-fc4bbjGWMNGM9-NNOYTamg-1; Thu, 03 Jul 2025 19:23:25 -0400
X-MC-Unique: fc4bbjGWMNGM9-NNOYTamg-1
X-Mimecast-MFC-AGG-ID: fc4bbjGWMNGM9-NNOYTamg_1751585005
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fd3aeb2825so11881676d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 16:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751585005; x=1752189805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PLJPkvu+exBJdImF9hJf2W6Rmq4JjRca1LT16iZ+xSg=;
        b=cjSUqNM45TkcL+lo8fqG8xqEyf7NXmt/Xya6GSjPkcz0OLvNLxUxjdMW0GYHFHcEb6
         BqEdLgcalYUaqY5xkLapjS+0hcj3Nqb6RbxpppJdWCDKK5iWicyCooOFzWGUA0uASAuO
         cifAfaPOfLr62NxidRnsbu/sNoxWNxBf+jDMMcF739rbGPeCKxJoVTDouf8LzHWiiI7F
         +AQ3TTaBoiUV6RyYgLkYGUU0hBnHUAqa22HP64tCsJdhybKkNnILOanfsQY7F1Vpmnex
         ErW23xMzG1VgH+ZMUIdJM3+t3v7VZp8ZrM9C0wmVDvam3mk1jj1xA076C+PtKwGsIYkX
         MSwA==
X-Forwarded-Encrypted: i=1; AJvYcCXroi+ejHHEpgB/oOSLir28nK+tPb8w6tPKIfMw2i28p4ZkaM9GGG4ZCm0lSNDubVGuqT6sKVeOP/GQX0gP@vger.kernel.org
X-Gm-Message-State: AOJu0YzJUrN3k8iMCZi/udMiuQE7ygQZDtjh6KE1eD4d5ImRKtu8g7/R
	vMGZdTddvwl6JIZb7h6g6qoLB6aQ0H2J1qN8aP88fiwkBkHlqF2U7jYM9PAWVhNwev7gocuZJid
	Fe9W+NrAdMLvJD6ZmVj344MQS9tmPTUXW9Y+vYLdpCwea6lJnL0bMJkKXrk1e79tCOA0=
X-Gm-Gg: ASbGncujIH/w58pNKx1Uon5m/PVhtsSVaBzHmpYnofxJsbDUjBt7WSeR41X1lkvr5J6
	JI+UugQ6ZbHJXDI9WAGFSvDrMwWlf4A5FrtcJJ+IucfjgLSDGe10dYADGHSDe9i4RA08eF5uJuA
	xE1YH7v2iM0xqe/SN/f4+RwqlGI3QAcnuqEuKrJ76L7Qlms+noZyftHqncEM4jx4/sAOaW516dc
	LFPN/rLCR5jprZDD+vcFl6g7vj11nmovbc8QENUecr0iSE09XOXH0dLwEmPwY97T2x5DX8zATZ0
	QyFkBjJS73FVPz2DPTTD7sNgMH4Pt1lOAWLZzxqYBB777jUjeoTnoU27tIGp5A==
X-Received: by 2002:a05:6214:5016:b0:6fa:bd17:313 with SMTP id 6a1803df08f44-702c6dd28f5mr2312716d6.30.1751585004824;
        Thu, 03 Jul 2025 16:23:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZUTcv/RXxDRv5oOXWGYLGuMzoJgJUUqtfCFBZdCd61PSDSlgd+Ecfdnm9HkmgohROAdoaIQ==
X-Received: by 2002:a05:6214:5016:b0:6fa:bd17:313 with SMTP id 6a1803df08f44-702c6dd28f5mr2312506d6.30.1751585004446;
        Thu, 03 Jul 2025 16:23:24 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:23 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:32 -0400
Subject: [PATCH 08/10] clk: sunxi-ng: ccu_nk: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-8-3a8da898367e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1938;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=btToz2S3ADP3ZxZpciNSy/MUe5vuMQa0nAdFifjfxYg=;
 b=d2ZMlN6C58BBAH6QeN6ACobOCoE2MjYgmAG9txbKa5xDhf1dkWNsPCaDoFCNoKlsbitIMf4tY
 rlssfLZk/Y8AJ4/97xBA/IKkdc92QGnzsPYwRqblNmN4ZVeb/pGltBT
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/sunxi-ng/ccu_nk.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nk.c b/drivers/clk/sunxi-ng/ccu_nk.c
index 555e99de2cc6ee0c84ccaaac9ee83be2d88741a0..5db748fbb5bd9399a2d551c8821a4bb17ded005a 100644
--- a/drivers/clk/sunxi-ng/ccu_nk.c
+++ b/drivers/clk/sunxi-ng/ccu_nk.c
@@ -92,26 +92,26 @@ static unsigned long ccu_nk_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long ccu_nk_round_rate(struct clk_hw *hw, unsigned long rate,
-			      unsigned long *parent_rate)
+static int ccu_nk_determine_rate(struct clk_hw *hw,
+				 struct clk_rate_request *req)
 {
 	struct ccu_nk *nk = hw_to_ccu_nk(hw);
 	struct _ccu_nk _nk;
 
 	if (nk->common.features & CCU_FEATURE_FIXED_POSTDIV)
-		rate *= nk->fixed_post_div;
+		req->rate *= nk->fixed_post_div;
 
 	_nk.min_n = nk->n.min ?: 1;
 	_nk.max_n = nk->n.max ?: 1 << nk->n.width;
 	_nk.min_k = nk->k.min ?: 1;
 	_nk.max_k = nk->k.max ?: 1 << nk->k.width;
 
-	rate = ccu_nk_find_best(*parent_rate, rate, &_nk);
+	req->rate = ccu_nk_find_best(req->best_parent_rate, req->rate, &_nk);
 
 	if (nk->common.features & CCU_FEATURE_FIXED_POSTDIV)
-		rate = rate / nk->fixed_post_div;
+		req->rate = req->rate / nk->fixed_post_div;
 
-	return rate;
+	return 0;
 }
 
 static int ccu_nk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -155,7 +155,7 @@ const struct clk_ops ccu_nk_ops = {
 	.is_enabled	= ccu_nk_is_enabled,
 
 	.recalc_rate	= ccu_nk_recalc_rate,
-	.round_rate	= ccu_nk_round_rate,
+	.determine_rate = ccu_nk_determine_rate,
 	.set_rate	= ccu_nk_set_rate,
 };
 EXPORT_SYMBOL_NS_GPL(ccu_nk_ops, "SUNXI_CCU");

-- 
2.50.0


