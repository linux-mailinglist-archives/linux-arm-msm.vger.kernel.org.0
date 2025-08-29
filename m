Return-Path: <linux-arm-msm+bounces-71207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EE4B3AFE5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 02:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49B651882D00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 00:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D6E238171;
	Fri, 29 Aug 2025 00:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UXDMx8gm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC762356C9
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 00:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756427944; cv=none; b=UvaQIMKvoeFebigJt0L+E+U3q20if8uaP/BaMBJLB514+JOZ3A+3mQ/suUhvnhwl+TEgnHaTh1+99EZ/UDh69343u4pEMXx6rmTogl/vkssWQhMQLQ/mKe3noHOegGwCjb+K3T7BGKuI+jgyWiERajFPR6iNWBpd4+ERlBIQgYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756427944; c=relaxed/simple;
	bh=58n95bQC3o+Nb/L33jeFcmWnqEOz/8LpB+ZJ4315jbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VPKHBGRrTihgzScNCjzLJ9U1w2ZRW2VJrAdlzZ5PTvEtoLKSF6vyxAx7yEKKdW2Su1vVdads6yd1kp+I1bjJ1JmaiIYWhJdDU/UTmpmq6WGHw/Pa8dqXdiXRZhtSSm8l+FJWNTtWI49B/7xzz+GO809MaBRc/RfBpQYC8vkwLVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UXDMx8gm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756427941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/zv3Pf2hNuIQOUArm7ZxnDoNihXiep39POzlD21Z8Ns=;
	b=UXDMx8gm0bzMmGVVGt3K3hNbFuF2KltKF0Cmh1uNRchiRtQlI80mRlnAVgLa04NrZNMrhR
	5wG6RhbW/Poi27groJbdTnjIk+LMI40f4bxip0zusDdSDWPPsp14D+yYDT18iFcnoFos6X
	vTmGxY25V7vil2ydm4tEbU6jjJg8euM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-lXbtKndeOsWV7vpO_u3noA-1; Thu, 28 Aug 2025 20:39:00 -0400
X-MC-Unique: lXbtKndeOsWV7vpO_u3noA-1
X-Mimecast-MFC-AGG-ID: lXbtKndeOsWV7vpO_u3noA_1756427940
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70de1a3cec7so30783356d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 17:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756427939; x=1757032739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/zv3Pf2hNuIQOUArm7ZxnDoNihXiep39POzlD21Z8Ns=;
        b=GF4D5Xw2yG9xhEn1SEa8fNsD77iLjEtBaSjSVMScRxn3sID+ZRnfSv/Vt636tUemz9
         5P5AyKiqD71hMLBghKWuOKHM/OO0FspBN1rQtwkwx8JY9gWtOX8TFfJid3menH665Euc
         Yga78OHb7yMAwXSs+DqHmWrOPd/v6mXdzqQmKs8b5HU7/b7L5F0OKpUQt06fOc+2pUiC
         dVUQNtaFElKCQym8tkkJZQBhafGZ6ALhhlmGk8RHD8B09mEGehoVPaJg4V5D4Ficezxp
         pK3Kpi5EOIpq09VXprwg1JsSaO23I2awjYWXIMk+qmOYTwXlW1o6tlGW3JV6UOwZnT14
         K22w==
X-Forwarded-Encrypted: i=1; AJvYcCXAPQ9wluuybdM0dQnXT5zxUh4sHzgTybYVLxFQ44Dj7eRpy6m3aM7UdojoCzGBe+Ltu3DJhPVDfcNQKtYk@vger.kernel.org
X-Gm-Message-State: AOJu0YxZMXvrmItXnPIwZlUigj3HKkCFXcZ3JPyDgweKB0LyGw9DezLb
	UWRIz10gIk/T0qDHMOaQhaRWx5zIiMEMLrWb51Wkghq1lWr9qcKX4Sba7fqvP0zmCyHnWaOyTgj
	TvCz8GhfbM63mCopfGzM89xNd3QMt/FkJdB9gP8EpUzdK7Mj4mJZCves8JD3ATK7gMqYVcC2nER
	+jcp69Dx9G/AT5U+nXaNjGOytf+8HWNO9Fsv1IqhGhns70j6nQUA==
X-Gm-Gg: ASbGncsOxY9C8BVnKHnzK6ahLDNiVShUvRY6x9lbNjJLgGOgHdcj62fHpjCayf4sDPa
	CEQmRz7wT65kweQiH5XdXQM9zuf9hrAEyUMQGCuRBjlLtzoe4X0YQPFS4eCwemarzW98JwLpRWZ
	iOC57lH1dGI9q8BgzroePLjC9C/eGFAmTjDoz2kUD3AeVOYxUkXiIcbJYc9el8vV/tH22NgrzyB
	YvcVPH2feTlzKSSRGI9GQ6Txv2Q9qkHA8DMHJFYC+FMs3ntCF3pEgtRDT/O3aQ/VeOIXSDpIAli
	dgKEQ7lk7U3zFlOHKz9/WKRDv2QKoUgBVJ0qqc8GlD5rW+PfnYmRjuMReiEo88iiOxdIsNsBWYa
	uJiqoSuTMRJ6DA8/BSjSv5MVe4803QnLhfg==
X-Received: by 2002:ad4:5d6d:0:b0:70f:5a6d:a24c with SMTP id 6a1803df08f44-70f5a6da382mr3848716d6.3.1756427938606;
        Thu, 28 Aug 2025 17:38:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNGUlyT+ctgue+dRAvvl/QvlMdyIOiL7k4jZZ7Wud+MSEXYojVVEBluU8riRrhIojKE6e3Kw==
X-Received: by 2002:ad4:5d6d:0:b0:70f:5a6d:a24c with SMTP id 6a1803df08f44-70f5a6da382mr3848306d6.3.1756427938041;
        Thu, 28 Aug 2025 17:38:58 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70e6264141asm5588696d6.65.2025.08.28.17.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 17:38:55 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 28 Aug 2025 20:38:27 -0400
Subject: [PATCH 8/8] clk: zynqmp: divider: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-clk-round-rate-v2-v1-8-b97ec8ba6cc4@redhat.com>
References: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
In-Reply-To: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Michal Simek <michal.simek@amd.com>, Bjorn Andersson <andersson@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756427914; l=2556;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=58n95bQC3o+Nb/L33jeFcmWnqEOz/8LpB+ZJ4315jbA=;
 b=uy+XUWiCv9yIjSAyrE0/4I1CLGHob+UIZ+EQxuc1qyVM5xq9Nhgg1+JCuBhoLqxMKDOrEirQl
 MnnF6BAHL2DDr0riIPtjEh4AcWFPyXh0pP1ewj5MPPjAgu3gyCxOVpL
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/zynqmp/divider.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/zynqmp/divider.c b/drivers/clk/zynqmp/divider.c
index 5a00487ae408be4ffd586704859b232e934c1f6e..c824eeacd8ebd4d670d78f1af2186e61008bdae2 100644
--- a/drivers/clk/zynqmp/divider.c
+++ b/drivers/clk/zynqmp/divider.c
@@ -118,9 +118,8 @@ static unsigned long zynqmp_clk_divider_recalc_rate(struct clk_hw *hw,
  *
  * Return: 0 on success else error+reason
  */
-static long zynqmp_clk_divider_round_rate(struct clk_hw *hw,
-					  unsigned long rate,
-					  unsigned long *prate)
+static int zynqmp_clk_divider_determine_rate(struct clk_hw *hw,
+					     struct clk_rate_request *req)
 {
 	struct zynqmp_clk_divider *divider = to_zynqmp_clk_divider(hw);
 	const char *clk_name = clk_hw_get_name(hw);
@@ -145,17 +144,21 @@ static long zynqmp_clk_divider_round_rate(struct clk_hw *hw,
 		if (divider->flags & CLK_DIVIDER_POWER_OF_TWO)
 			bestdiv = 1 << bestdiv;
 
-		return DIV_ROUND_UP_ULL((u64)*prate, bestdiv);
+		req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, bestdiv);
+
+		return 0;
 	}
 
 	width = fls(divider->max_div);
 
-	rate = divider_round_rate(hw, rate, prate, NULL, width, divider->flags);
+	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
+				       NULL, width, divider->flags);
 
-	if (divider->is_frac && (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) && (rate % *prate))
-		*prate = rate;
+	if (divider->is_frac && (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) &&
+	    (req->rate % req->best_parent_rate))
+		req->best_parent_rate = req->rate;
 
-	return rate;
+	return 0;
 }
 
 /**
@@ -199,13 +202,13 @@ static int zynqmp_clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops zynqmp_clk_divider_ops = {
 	.recalc_rate = zynqmp_clk_divider_recalc_rate,
-	.round_rate = zynqmp_clk_divider_round_rate,
+	.determine_rate = zynqmp_clk_divider_determine_rate,
 	.set_rate = zynqmp_clk_divider_set_rate,
 };
 
 static const struct clk_ops zynqmp_clk_divider_ro_ops = {
 	.recalc_rate = zynqmp_clk_divider_recalc_rate,
-	.round_rate = zynqmp_clk_divider_round_rate,
+	.determine_rate = zynqmp_clk_divider_determine_rate,
 };
 
 /**

-- 
2.50.1


