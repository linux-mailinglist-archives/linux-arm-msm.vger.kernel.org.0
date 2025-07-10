Return-Path: <linux-arm-msm+bounces-64416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F696B007BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 17:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E143817F61D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 15:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93AB279DA4;
	Thu, 10 Jul 2025 15:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dYwEQCMp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0BD278750
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 15:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752162709; cv=none; b=OUqgFuLBzrx0Lg3/8DZi9TxMm6lUgbOS9CXsD6+LlEn24mIsjeMwhqUydbJNc3yZJdWRZFaNU36LTnYKrVDqxw1/0ywKgLH590iNwfQnQEVGY1xIrypMcjnao9jTxqahcI23cEqI4DD6CXXcFu7G+J2J5XYrx/i3+WjYVVqfc88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752162709; c=relaxed/simple;
	bh=vLmJmRC+9bzkFJmLST4jSrv6MV1rviG/pwzLdY7NBcI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ghVpbdW5l4r6aiOG2y+F73gsm1HhSkvN/V37/tC1oRFTQn3MizVOHGMkMgefWRP4TVIe9EwbpYaTFy0IxM5W1Oi8sNflsBrLnzZCFsV78Y5Qa1VKwpvae4yD62tKq3oPMbu+OMUG4Yv6INk59jzPhkYQnvlafIwHF1DjrBeim94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dYwEQCMp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752162707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uPmO2oQ+ynlDeJxb9Am/uG3bA7syL2BNHimRk7a6rO0=;
	b=dYwEQCMpfXwNW9vLWd1yWihGkTaSJyNZj32XUsYvyw62RnJCbGM39jWZ6ilmAPmgnR6Jyb
	3ZS5X07WZ//Ma4HWjZa05QukTmg03NWZk7DfpjSvkWVYkigL1QEesWvmZEB3rl1xPO8EjC
	tkECYYcMzM6BBAcSPD8IfDZBke2G+m4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-oA34b5pZN5-_gKN_9BXbpg-1; Thu, 10 Jul 2025 11:51:46 -0400
X-MC-Unique: oA34b5pZN5-_gKN_9BXbpg-1
X-Mimecast-MFC-AGG-ID: oA34b5pZN5-_gKN_9BXbpg_1752162706
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6ff81086f57so13364486d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 08:51:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752162706; x=1752767506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uPmO2oQ+ynlDeJxb9Am/uG3bA7syL2BNHimRk7a6rO0=;
        b=Ojzrgjiq585MaCEi051F16gpdGfkLSf0RSkb/y7M3fp9tjHW0ZIFUExMB1wS4ekM4s
         eqD/rVbyikCy9ZUom0iva1xLLCv67Dz/d0b51yPkaVYa39jhZn1/ozf15TnUhkZjIGoJ
         IXoI38i5bBBjNnDYFGdJN0xCtm+o4JZFfx1v2dYDOy+J5HoE/nrzxg+R4E6bXZ8gAVPF
         NAbfZaXFjwZQoJTwXEn7m8jAN+lC1jSu++uLqFqjDRVPAM/F32M3S7hWE6hv/2CK7zLN
         MQdYy9EP+P7eN9+W2g2prlFL31gLhG7gmvlKVR8FAPZcmHJDx9mTzpzbMjyqGuaWMN4J
         lXNw==
X-Forwarded-Encrypted: i=1; AJvYcCW582Bhy3/eJMOWu4Mc692kNi3tBCNKe6nshBWs7C9qf93of2JgCU8fs3+SqENTzHXprEZmgz5wZWvOS6Wg@vger.kernel.org
X-Gm-Message-State: AOJu0YxlLolq1jzuM3/ADul/+s+QvIcX3QAkzqnAuORNObkMugH/+/6t
	5h28/XF8eY5qsEaAp1OSl22CcJr4zR6cVLc6RPyBo2b0qET4OSCaI0pVUpFcw/lB3y+805aLB4u
	beUhPZv01SjhViepd7Cye1kURDqd0mieZtRs3Fyb1paOlMuMhEhoYecM2WVAta/JMQ0E=
X-Gm-Gg: ASbGnct7s8AcQStHDi2jbkWrqQugUjb1iv44Xf5EoBu/aBMMBrsiUeJs8wwe49Wbn7A
	U/EtCd7TWthtlhVxSQOwywLm5Lg9HSGuSW2/JZiooSTnLefMsu86nvBHmVgZ9GcJyu5bZcAtBJQ
	DR0a2HUueBYfg1Ud4HzBiqjmDOnm/92tCysjheO5tM+J+afME3a79sFIg2XSwpYp/XvzTZIuKwL
	g5fo5fxe1ZFFS8puI4EQIePxCRnue5wJrGQGLSx2QRQH2JEh8gHGzpnIL1rZ0UgYct1uJzd54Sq
	Yz6bBqjZCRU/EvEnkmHyYrOyMarXKkS3p/zVPoANo9YWfbqeoy1/oEGEzq4L
X-Received: by 2002:a05:6214:27cc:b0:702:ce4a:849b with SMTP id 6a1803df08f44-704982360b5mr39084236d6.43.1752162705544;
        Thu, 10 Jul 2025 08:51:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkuqPel6v0c9oLWEAy3uC+hrgIsFPdla2ArZn2bXT5IJXXP8ZdH6ZBnGUgw1dx0j1MhfYDcw==
X-Received: by 2002:a05:6214:27cc:b0:702:ce4a:849b with SMTP id 6a1803df08f44-704982360b5mr39083756d6.43.1752162704970;
        Thu, 10 Jul 2025 08:51:44 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d3940asm9475456d6.73.2025.07.10.08.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:51:43 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:51:07 -0400
Subject: [PATCH 1/6] sound: soc: codecs: da7219: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-sound-clk-round-rate-v1-1-4a9c3bb6ff3a@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752162699; l=3957;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=vLmJmRC+9bzkFJmLST4jSrv6MV1rviG/pwzLdY7NBcI=;
 b=Whbfgc0vqEfbD1+TqJhMdUQrpnzHP0K9B9S+FRtvZgCJnqYxlve3+jWZvpTSIWePANUgtkvX7
 faBzXT5+lP7DDmWOWcvnzTKOy6haiXPgyE+uiaAkDiRx/3YzQGQaLXs
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 sound/soc/codecs/da7219.c | 64 +++++++++++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 30 deletions(-)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index 221577574525a5fd60180a4441331d7db88f50e2..1742f91c788c62a34f35aae44fcfd1d7fbea007c 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -1982,8 +1982,8 @@ static unsigned long da7219_wclk_recalc_rate(struct clk_hw *hw,
 	}
 }
 
-static long da7219_wclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int da7219_wclk_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct da7219_priv *da7219 =
 		container_of(hw, struct da7219_priv,
@@ -1992,28 +1992,30 @@ static long da7219_wclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	if (!da7219->master)
 		return -EINVAL;
 
-	if (rate < 11025)
-		return 8000;
-	else if (rate < 12000)
-		return 11025;
-	else if (rate < 16000)
-		return 12000;
-	else if (rate < 22050)
-		return 16000;
-	else if (rate < 24000)
-		return 22050;
-	else if (rate < 32000)
-		return 24000;
-	else if (rate < 44100)
-		return 32000;
-	else if (rate < 48000)
-		return 44100;
-	else if (rate < 88200)
-		return 48000;
-	else if (rate < 96000)
-		return 88200;
+	if (req->rate < 11025)
+		req->rate = 8000;
+	else if (req->rate < 12000)
+		req->rate = 11025;
+	else if (req->rate < 16000)
+		req->rate = 12000;
+	else if (req->rate < 22050)
+		req->rate = 16000;
+	else if (req->rate < 24000)
+		req->rate = 22050;
+	else if (req->rate < 32000)
+		req->rate = 24000;
+	else if (req->rate < 44100)
+		req->rate = 32000;
+	else if (req->rate < 48000)
+		req->rate = 44100;
+	else if (req->rate < 88200)
+		req->rate = 48000;
+	else if (req->rate < 96000)
+		req->rate = 88200;
 	else
-		return 96000;
+		req->rate = 96000;
+
+	return 0;
 }
 
 static int da7219_wclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -2070,15 +2072,15 @@ static unsigned long da7219_bclk_get_factor(unsigned long rate,
 		return 256;
 }
 
-static long da7219_bclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int da7219_bclk_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct da7219_priv *da7219 =
 		container_of(hw, struct da7219_priv,
 			     dai_clks_hw[DA7219_DAI_BCLK_IDX]);
 	unsigned long factor;
 
-	if (!*parent_rate || !da7219->master)
+	if (!req->best_parent_rate || !da7219->master)
 		return -EINVAL;
 
 	/*
@@ -2088,9 +2090,11 @@ static long da7219_bclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * parent WCLK rate set and find the appropriate multiplier of BCLK to
 	 * get the rounded down BCLK value.
 	 */
-	factor = da7219_bclk_get_factor(rate, *parent_rate);
+	factor = da7219_bclk_get_factor(req->rate, req->best_parent_rate);
+
+	req->rate = req->best_parent_rate * factor;
 
-	return *parent_rate * factor;
+	return 0;
 }
 
 static int da7219_bclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -2116,12 +2120,12 @@ static const struct clk_ops da7219_dai_clk_ops[DA7219_DAI_NUM_CLKS] = {
 		.unprepare = da7219_wclk_unprepare,
 		.is_prepared = da7219_wclk_is_prepared,
 		.recalc_rate = da7219_wclk_recalc_rate,
-		.round_rate = da7219_wclk_round_rate,
+		.determine_rate = da7219_wclk_determine_rate,
 		.set_rate = da7219_wclk_set_rate,
 	},
 	[DA7219_DAI_BCLK_IDX] = {
 		.recalc_rate = da7219_bclk_recalc_rate,
-		.round_rate = da7219_bclk_round_rate,
+		.determine_rate = da7219_bclk_determine_rate,
 		.set_rate = da7219_bclk_set_rate,
 	},
 };

-- 
2.50.0


