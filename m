Return-Path: <linux-arm-msm+bounces-64417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E643CB007BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 17:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66FDA1C25983
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 15:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5558E27A114;
	Thu, 10 Jul 2025 15:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YHh8AYwA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953952797A0
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 15:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752162712; cv=none; b=gmkp0FbFkb/cdBWoZAo509H7td5fNVM6rEsehfQ1K5Ne/vnLYjIkvr7m3RA7bd8PDO0YDa0Sdo725l/Hb4p4RiqSOUQakElI5NlaSBifHZz2mu4YnYvxuCjZxmh5GnkvVNDZhOEZZnlevm6fhxFDzdZHnI4tTsetRM4za9NTofg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752162712; c=relaxed/simple;
	bh=t2hjGCARaRQgI0Ustel3aF+sNP5ba1R6WUsBnvpS8Gw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dHs2Ynwqr0vfl+MBbcfUcOTJyXXZ2bV1ao8qWdlgBaeiyo6gQlgmrLejB12LZMC+HMssXgCET2SUyHq/1SI9YQd7DZF544e28no3repUY0AP3pbzSz4YuhIpf30wVRpuik5ZXw+dOEH/TCDexQ/GeVhfcO9FCu+gFnFos2+fjrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YHh8AYwA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752162709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cGKF6eOX7Jk+EpeggU8l+LOb8l3CYbEDXRYR6gPHE9Q=;
	b=YHh8AYwAyzK+jB93+mepqjpUaCxV5Gj4iuWVYrT02PfUgxof500PayGGdPBMZ3tfp81cak
	m6N9PbBkrJ98z7ci0UtYGr471vuT1YNmvLIjqGKkbwBNE0L9QbX1eoLI+bI045OO+WXEw5
	R7ThANAzVRM9dfKs2ajN4oUDvDOfk+0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-wYutfEZqM0ye3nxQRDEycA-1; Thu, 10 Jul 2025 11:51:48 -0400
X-MC-Unique: wYutfEZqM0ye3nxQRDEycA-1
X-Mimecast-MFC-AGG-ID: wYutfEZqM0ye3nxQRDEycA_1752162708
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb520a74c8so21039606d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 08:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752162708; x=1752767508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cGKF6eOX7Jk+EpeggU8l+LOb8l3CYbEDXRYR6gPHE9Q=;
        b=O4QXZ1IvqRxrIPBWdd6Ivi+HjVk4V74Zo2T10QdFMYIedfAQ9Z2WQ0dyKFOuy/EGCh
         a7MqyVfEdJ6cSVRIqZTnE/hp5K1rOPNtR23rvPuDIn9M1DNKrs2naItcU01rmeZP9DoR
         3M+Lf8Kqlzv19HyhT8CJwDlWfAn1jaz2XB274sKQ18pEyok3kMJRiagF0klrvKvzAC7A
         5iu7BPUkCWxuqbu/1sMlz+Klp6GRbUUXgcZiv7CKUWPRA2JKp6SN7uEjVEHFruu4hdZq
         49reCEJmqzZ8X19CiBzPHDFcnofMVKf8EG8vq1I8HG5E++TUU8jPEamLWxUutIBUSvwW
         Xs5w==
X-Forwarded-Encrypted: i=1; AJvYcCVhNTgFhRu3zPBRQRrPpSpjeh8pd0Uoz5HKcsH94dTZS9oB3rZHRz9uBlGWYiQGHejzxwSwHoJulwOyJueG@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2+5h/scBJGiiKmbVh67etqX+aj9bwNG61zes3vG72waXbNm/N
	QE3Uk1HtbSM7tGqSMy7NNNDDpHxWF9TToQnB8HUNFvLP1XYJaJviQJd89ir4tAemQY+4spwuThP
	kqB+EFDVGnuLS55H8xT5Xu7tCx64Xrri3/O2NGkGMs6w3rWdpABlz6FoejwZs53o19sM=
X-Gm-Gg: ASbGncs924YPqQgkRb94zJIKnUxw/nY9tT8DW+LZfT/rbtYeBb6iaE40SqUbW+yavxj
	MFBU9z4dibyBByfn1lqBhml/GD+I7eSgApBMJzHH0VYeKj4o/w4m20AVbvMkic5+GvWQVDk+0rH
	sc3bdnlVQ+YNKc/AJYOCSgjoZFGBjDU1cRgiFspvZ1d02AbJvjaqvUXiBNal82NkRanOo3IPyaG
	VR4HDH+SZOGUPTzOtX2aFsvK7Z8Hqt9zLtmUaR9rMdKvkQeDkdo+WSzI1ZJAPx7al1Wt8oVPES0
	zK+jNVGxg3eYoEuhbCLPFJ4iNcsCSf/ERp9OV2pWV/KfDgLXiEUVhxFg/Z1h
X-Received: by 2002:a05:6214:246f:b0:702:d6e7:18bf with SMTP id 6a1803df08f44-70494ee3ed9mr73517936d6.3.1752162707916;
        Thu, 10 Jul 2025 08:51:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiBnQKyOU9ItMPJPrgQVPScQNEJSbolGEYy2qaZnVPuAr8zwJYLa8LtkWFTwl7pjIeSY0WKw==
X-Received: by 2002:a05:6214:246f:b0:702:d6e7:18bf with SMTP id 6a1803df08f44-70494ee3ed9mr73517366d6.3.1752162707432;
        Thu, 10 Jul 2025 08:51:47 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d3940asm9475456d6.73.2025.07.10.08.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:51:46 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:51:08 -0400
Subject: [PATCH 2/6] sound: soc: codecs: rt5682: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-sound-clk-round-rate-v1-2-4a9c3bb6ff3a@redhat.com>
References: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
In-Reply-To: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752162699; l=3278;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=t2hjGCARaRQgI0Ustel3aF+sNP5ba1R6WUsBnvpS8Gw=;
 b=aqGq6Wwv3mN+qouYIGF3pJ+rhEvmpUrlcSVA+xDWGeOk1pwtlMf/NqlX0M/HemN2IEuG5nCBi
 JURzf2JUU/1A51p4xURtCdQ1xTp4/K/hH/dOMIbhw6NBEwmj4I/5xek
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 sound/soc/codecs/rt5682.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 7c88370e2dee6a4c2332f1e3db885c980f5e8079..a0abd2ce0c1e1f6cf59fecdd426db16136befe66 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -2675,8 +2675,8 @@ static unsigned long rt5682_wclk_recalc_rate(struct clk_hw *hw,
 	return rt5682->lrck[RT5682_AIF1];
 }
 
-static long rt5682_wclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int rt5682_wclk_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct rt5682_priv *rt5682 =
 		container_of(hw, struct rt5682_priv,
@@ -2689,13 +2689,13 @@ static long rt5682_wclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * Only accept to set wclk rate to 44.1k or 48kHz.
 	 * It will force to 48kHz if not both.
 	 */
-	if (rate != CLK_48 && rate != CLK_44) {
+	if (req->rate != CLK_48 && req->rate != CLK_44) {
 		dev_warn(rt5682->i2c_dev, "%s: clk %s only support %d or %d Hz output\n",
 			__func__, clk_name, CLK_44, CLK_48);
-		rate = CLK_48;
+		req->rate = CLK_48;
 	}
 
-	return rate;
+	return 0;
 }
 
 static int rt5682_wclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -2795,15 +2795,15 @@ static unsigned long rt5682_bclk_get_factor(unsigned long rate,
 		return 256;
 }
 
-static long rt5682_bclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int rt5682_bclk_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct rt5682_priv *rt5682 =
 		container_of(hw, struct rt5682_priv,
 			     dai_clks_hw[RT5682_DAI_BCLK_IDX]);
 	unsigned long factor;
 
-	if (!*parent_rate || !rt5682_clk_check(rt5682))
+	if (!req->best_parent_rate || !rt5682_clk_check(rt5682))
 		return -EINVAL;
 
 	/*
@@ -2813,9 +2813,11 @@ static long rt5682_bclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * and find the appropriate multiplier of BCLK to
 	 * get the rounded down BCLK value.
 	 */
-	factor = rt5682_bclk_get_factor(rate, *parent_rate);
+	factor = rt5682_bclk_get_factor(req->rate, req->best_parent_rate);
+
+	req->rate = req->best_parent_rate * factor;
 
-	return *parent_rate * factor;
+	return 0;
 }
 
 static int rt5682_bclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -2849,12 +2851,12 @@ static const struct clk_ops rt5682_dai_clk_ops[RT5682_DAI_NUM_CLKS] = {
 		.prepare = rt5682_wclk_prepare,
 		.unprepare = rt5682_wclk_unprepare,
 		.recalc_rate = rt5682_wclk_recalc_rate,
-		.round_rate = rt5682_wclk_round_rate,
+		.determine_rate = rt5682_wclk_determine_rate,
 		.set_rate = rt5682_wclk_set_rate,
 	},
 	[RT5682_DAI_BCLK_IDX] = {
 		.recalc_rate = rt5682_bclk_recalc_rate,
-		.round_rate = rt5682_bclk_round_rate,
+		.determine_rate = rt5682_bclk_determine_rate,
 		.set_rate = rt5682_bclk_set_rate,
 	},
 };

-- 
2.50.0


