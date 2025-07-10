Return-Path: <linux-arm-msm+bounces-64418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9533B007AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 17:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B7E04E4A2F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 15:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38ACA27B50F;
	Thu, 10 Jul 2025 15:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EQExaIUB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8368927A914
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 15:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752162716; cv=none; b=l6rGcvLqs+M1MlAwW+hZxlIRTc5fbpq9bQc7qeN2Ue82pmZ3l5F0p3k1aIHl8QuGzmwqq1DuzL6ufoNqEVt+x1JuBLr/eWLx5AVlFfVPbcG3K7s1onqrsk7j5ZfzhN1Vuxb/jPQaRXYlJJuifsEs798cJiVcKK3FG8VR6p5f9uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752162716; c=relaxed/simple;
	bh=gJQYtpXBJm648AFk1gtJnD4yQFFqo6H++D/z3O5GbyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hVa4lIi42Bc8N1LZ4TAoqf55aS/WFkqG6mKHMqyeOu2orKkqvf3ZiManHFVairk4pbh0tOJuwuVXMuNUqgy00Gh4jr0ImpcfKvkt2u0cIwQBhVNITDGNoqp5WeCFJacC+AnAmvkC4MLtCApCZsqN6m1yola4v/NWz2C89wxwKj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EQExaIUB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752162713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y/QbCc4ZhrocJak5FMn7/cnZOpnKx6mcm3PWtmF6BV4=;
	b=EQExaIUBTS8ufkXGJ04a2fKiLEh3hFFCrU5P4GopVL5QqDFmOmaMcbSQs6suzYM80TEIgJ
	w7TJGA3W21S2gpgMU743Hmem3+HplcmYORoM2/dRyjtpyRxYr3M1pZcqQOPRniIEzfurDy
	EaRGUqCsgm1f4b2OSGP88l9P8LLtyZI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-bBnFOcFsPs6DX3Oc-sj2yQ-1; Thu, 10 Jul 2025 11:51:50 -0400
X-MC-Unique: bBnFOcFsPs6DX3Oc-sj2yQ-1
X-Mimecast-MFC-AGG-ID: bBnFOcFsPs6DX3Oc-sj2yQ_1752162710
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb1f84a448so11619186d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 08:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752162710; x=1752767510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/QbCc4ZhrocJak5FMn7/cnZOpnKx6mcm3PWtmF6BV4=;
        b=FtZoDfRjOyVJXOKVfbGA7R1IqnfMZnD4RjXAZu59gnYsDaGhdr8OlFHBGpTOeDyAdr
         AZMtZChxZS3F9RzH0w8d3vbk2uxISGRMdRhKD4z4Nsl7Yg6aS6HMRYv1YXSKZy1i1mFp
         yzx5hgf8xjUKjTaq/TH42U9TstIIyHrOMWFMEJltE9NJ3gSoScSbZnukDrzocuryg97a
         vKB4pj0AfAXfBAWJpSd1Q/e9NEZDjOxvYp1HzqPE7eHuRt/2TNPkmNc1UHkh9YbPTYOG
         d31y5nHtW/8kyUkEgEXZnsOrWgS1AaM6cPRPAW4itSLhvr3IFaG5Y2XQNBz3Js4HrdsX
         mMhw==
X-Forwarded-Encrypted: i=1; AJvYcCWLSk7E0w26KOxTBTspPV2QomfHLsffhkBb9diXpegvpXdWVyUaDx2B8HeBMBmyih6Hiknqh1fcMTERU6GZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxnfHQzAQJmQxk5Sx3ZDy5WgCJ/gY3xWMP/QUYhqDGkPF5GWl7Q
	gG/WbAYolk0r+NLsBozCZUroE6Whbdw3Jd3ZwTMCAbbGSK6blSESlYRwjJZy69XHQXdPBofdydq
	D9Mlb9IkxrSYmuxlzW43gXvaX1GQqEhcfZSFUe7WCW/IEEqUDWZ8t0x3fOkkojQVmwuM=
X-Gm-Gg: ASbGnct2xU89LIQbZmSllDsxvNU7V94qv5fkMi9fuECP+hQxlQmTCCwbab/zAymq+o8
	R+wgUbNmih4YERYdRK9xduW5/S/veoQ3zb2sctyjw/A+M9i1zr4ygAB9mYDMmzbg27S1YLyWAAI
	QSgBihDPT2vBmZjITGVS8GrbtQOliLhmBymigLFstEphdRnC8plhMbFOwZKz5NiVGbjOUhPNHqx
	/mLzJNffa5iuPOSAl6Xs/SjHU1yqlpYBCaiEyF5+LAhlBXG1W3vDelHWx1W1rXygvb78VxZygoV
	pMUEqhg093qnU9QheyNAs4zY7E/FQ/legei1s4wajls+sXhaoc2tR+9789Zo
X-Received: by 2002:a05:6214:b62:b0:702:d822:9376 with SMTP id 6a1803df08f44-7049801cd10mr39722636d6.12.1752162710231;
        Thu, 10 Jul 2025 08:51:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9Z7rRnZbhf+h4qqa+7uxIY+dr40XTC3XMOAdTeO370BxlyEUPUGIFiPj6+jcE4rOLalJzHw==
X-Received: by 2002:a05:6214:b62:b0:702:d822:9376 with SMTP id 6a1803df08f44-7049801cd10mr39722176d6.12.1752162709775;
        Thu, 10 Jul 2025 08:51:49 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d3940asm9475456d6.73.2025.07.10.08.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:51:49 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:51:09 -0400
Subject: [PATCH 3/6] sound: soc: codecs: rt5682s: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-sound-clk-round-rate-v1-3-4a9c3bb6ff3a@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752162699; l=3348;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=gJQYtpXBJm648AFk1gtJnD4yQFFqo6H++D/z3O5GbyQ=;
 b=vD7l+nzKA8agktbW8Jzsxd4HfmX/ug18UCk1oQGlijIkHUQB6mZ1qnPnNhOQanXgK2uw/TZG1
 MAryM+LpwAXCVClNThsU6ftx2kQA9I5QEh/lGCP0TGcm3ECu8RsmgOH
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 sound/soc/codecs/rt5682s.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 73c4b3c31f8c45703d965e6fd1b70aa1817e2926..80b921695e7d1c0506766bd47421c07e5fa7a6d3 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -2610,8 +2610,8 @@ static unsigned long rt5682s_wclk_recalc_rate(struct clk_hw *hw,
 	return rt5682s->lrck[RT5682S_AIF1];
 }
 
-static long rt5682s_wclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int rt5682s_wclk_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct rt5682s_priv *rt5682s =
 		container_of(hw, struct rt5682s_priv, dai_clks_hw[RT5682S_DAI_WCLK_IDX]);
@@ -2624,13 +2624,13 @@ static long rt5682s_wclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * Only accept to set wclk rate to 44.1k or 48kHz.
 	 * It will force to 48kHz if not both.
 	 */
-	if (rate != CLK_48 && rate != CLK_44) {
+	if (req->rate != CLK_48 && req->rate != CLK_44) {
 		dev_warn(component->dev, "%s: clk %s only support %d or %d Hz output\n",
 			__func__, clk_name, CLK_44, CLK_48);
-		rate = CLK_48;
+		req->rate = CLK_48;
 	}
 
-	return rate;
+	return 0;
 }
 
 static int rt5682s_wclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -2719,14 +2719,14 @@ static unsigned long rt5682s_bclk_get_factor(unsigned long rate,
 		return 256;
 }
 
-static long rt5682s_bclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int rt5682s_bclk_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct rt5682s_priv *rt5682s =
 		container_of(hw, struct rt5682s_priv, dai_clks_hw[RT5682S_DAI_BCLK_IDX]);
 	unsigned long factor;
 
-	if (!*parent_rate || !rt5682s_clk_check(rt5682s))
+	if (!req->best_parent_rate || !rt5682s_clk_check(rt5682s))
 		return -EINVAL;
 
 	/*
@@ -2736,9 +2736,11 @@ static long rt5682s_bclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * and find the appropriate multiplier of BCLK to
 	 * get the rounded down BCLK value.
 	 */
-	factor = rt5682s_bclk_get_factor(rate, *parent_rate);
+	factor = rt5682s_bclk_get_factor(req->rate, req->best_parent_rate);
+
+	req->rate = req->best_parent_rate * factor;
 
-	return *parent_rate * factor;
+	return 0;
 }
 
 static int rt5682s_bclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -2769,12 +2771,12 @@ static const struct clk_ops rt5682s_dai_clk_ops[RT5682S_DAI_NUM_CLKS] = {
 		.prepare = rt5682s_wclk_prepare,
 		.unprepare = rt5682s_wclk_unprepare,
 		.recalc_rate = rt5682s_wclk_recalc_rate,
-		.round_rate = rt5682s_wclk_round_rate,
+		.determine_rate = rt5682s_wclk_determine_rate,
 		.set_rate = rt5682s_wclk_set_rate,
 	},
 	[RT5682S_DAI_BCLK_IDX] = {
 		.recalc_rate = rt5682s_bclk_recalc_rate,
-		.round_rate = rt5682s_bclk_round_rate,
+		.determine_rate = rt5682s_bclk_determine_rate,
 		.set_rate = rt5682s_bclk_set_rate,
 	},
 };

-- 
2.50.0


