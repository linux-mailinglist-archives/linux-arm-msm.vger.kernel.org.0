Return-Path: <linux-arm-msm+bounces-64415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E74F6B007B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 17:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E7CB1BC437E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 15:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B08F62797B2;
	Thu, 10 Jul 2025 15:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NoOG/5n3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF21A276021
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 15:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752162708; cv=none; b=gdleScKLZ4h0IpjYFN1k5JxP5ZnTvXBpz8DQx7eZw8SqAHPs0OghkvNGcQ6L0UjxtEb1aZ3rObSZ+R4W2SonP7F/Ra6xkbk9YKqEHAGilg+lzDl1CiXudGKdSlu4CN6nznkUM454Uk5+lmzQatuebo/kzLpdmBrCdG3QvwF2Nw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752162708; c=relaxed/simple;
	bh=9HMFkZbuW9ZpnWbftnssfH9Bqhp8qt4XbuXWzr1wRy0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZshjMx7IJYVn4bn3Buv5qOc2u7HAmRCsMQi9cwuYeHtZ936iMx1+LxV8bGrVAPrCCqCbJ8p0aVoFP9kYiXouJYftoK8qXkTV/7bk0pE5lviT484oGFP5NWcA35EMYl/gf4eKTVmm+54QBkeZ3vtY1S2eYLCsF5FF80JtBYrI6Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NoOG/5n3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752162705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WADJ7rxEf5+t43hyxNegpLJp1h0n13l+s0KkiLPhYtw=;
	b=NoOG/5n3eNk1WDsqPLy/gTrXzR40kMOq9CpEFCSL8Dn1c1B2W2Y/hGvafTkgupA1jY0Xbi
	S6bMhfPxv0AJqjNxnL4XTEe27nbTRCxpofubbD/8KszqGmobFnHqDd3hutNKF9asSZJnP3
	+0ag61dv8pFI6o00kQfOP267IpLgKOs=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-7c7U4U6vPMOf0t_-9uQSXw-1; Thu, 10 Jul 2025 11:51:43 -0400
X-MC-Unique: 7c7U4U6vPMOf0t_-9uQSXw-1
X-Mimecast-MFC-AGG-ID: 7c7U4U6vPMOf0t_-9uQSXw_1752162702
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fad9167e4cso20551986d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 08:51:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752162702; x=1752767502;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WADJ7rxEf5+t43hyxNegpLJp1h0n13l+s0KkiLPhYtw=;
        b=T+1veNTJTILklrA6HtH0pcVF2auoSVXKoAlHPqAuyK8fepFEMbdCX7aZMrg3xeb5wU
         avT5i4MDRMsX/TTu8RsWQ92Bw/mm5tQCqotSfGlHeh/A/SjZqdE5MTw3UeHys3XU/toN
         K42QK9vQz+H41fACgMYXdW/oGyGfLhvVJ96y5kgEDvuWl4pkdi7OfKF3WUOJej53GkYd
         nmpTp1x0cS2Vdhyg7/Y3IYRv2p+fZz92cptlytk2H26ajaIGvG+i8wxDwmBVx59/uVjZ
         OkOsRmBmkQH9RQjjWGh69ELf6X5gKMeB5zWsqSsum4RG+Vv5YqXNXU5pkUhV0X0BH5zQ
         Mcww==
X-Forwarded-Encrypted: i=1; AJvYcCW6BM0ERVawaLK38iGbRBC9f7yjrB9636hEuXpT4LrOXs/gKsHVJ9drB9B9/hRw45pa4lkOk6dRUcmESdI9@vger.kernel.org
X-Gm-Message-State: AOJu0YxFZprf3gmLDWCqVv8erBsqF+FTxDlNFaAIHpr3VaniVssRtpqt
	sAoMOI8pk/djhXk/NoCrE5eA9DjQp6htGw28SoTRh7VWDGLuCH4fZaSXLYVrxPwSNkK7s3yXhYo
	bHmpLsl6OokhE5OwM/moutbmfZSt565a64wY5o7SamEBtprn2qwZeMrASSaos/4NMeT8=
X-Gm-Gg: ASbGncvk28eSdRD+DopDCiKfvWx307gqkH9Luf+rtO793LMZPLrJbyCzci3Z7HBNyjC
	wdJ2lHW/ESBwJEOLBNUncaiUC+scNF2H8gdmMaEbEqPG4JwJAOf5r9FyP/+U4Z0qDCfAftZgaXk
	mTJEfsYRGhbGkKlb/vQv8HiUCWx6BNCOYPjwUiyGaY6qBtywCkn1LodIrrv3QMoFr+JbfjsmM5m
	cgLvYPzrabk4vPzOXtcYrvN0O5mLXVONn674FfP3xfrXrVJaCzaWMNg2+sCeDJ8Em3lMK/tTV/e
	ue/wHk43Ls1p+io4WNTgiAIOOiG5C7uW+dfea0todFUwZSaFNgZEbfIHmmbW
X-Received: by 2002:a05:6214:f6f:b0:6fb:50da:48c0 with SMTP id 6a1803df08f44-704981df370mr48741486d6.32.1752162702176;
        Thu, 10 Jul 2025 08:51:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6tTS21fRt7gW+5oC/mUmMYYDHl8pgKSfHGnscN6OnkB2uw7eNnpNtqA9BjpxUhpgOQUOErg==
X-Received: by 2002:a05:6214:f6f:b0:6fb:50da:48c0 with SMTP id 6a1803df08f44-704981df370mr48740986d6.32.1752162701655;
        Thu, 10 Jul 2025 08:51:41 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d3940asm9475456d6.73.2025.07.10.08.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:51:41 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/6] sound: convert from clk round_rate() to
 determine_rate()
Date: Thu, 10 Jul 2025 11:51:06 -0400
Message-Id: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGrhb2gC/x2MQQqAIBAAvxJ7bkGDMvpKdDDdaiks1oog+nvib
 eYw80IkYYrQFS8I3Rx5D0l0WYBbbJgJ2SeHSlW1Mlph3K/g0W0rSiaxJ6H1o7ZGj75tDKT0EJr
 4ydt++L4fj0lNa2YAAAA=
X-Change-ID: 20250710-sound-clk-round-rate-adb1a71bd867
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752162699; l=5203;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=9HMFkZbuW9ZpnWbftnssfH9Bqhp8qt4XbuXWzr1wRy0=;
 b=sGBwjqYM4hPVL1CZFdLUsSLiPft7TSDB69HuiD4QNIFy9Mz6ke78nYWLUUl9QcWx2qrOP3kGY
 O85EabSwvs7AKgAZmdJB/ePYT6ukziJUFUbHtudOEOYr50RuwcvWs0Y
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() clk ops, so let's go ahead and convert the
drivers in the rtc subsystem using the Coccinelle semantic patch
posted below. I did a few minor cosmetic cleanups of the code in a
few cases.

Coccinelle semantic patch:

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (6):
      sound: soc: codecs: da7219: convert from round_rate() to determine_rate()
      sound: soc: codecs: rt5682: convert from round_rate() to determine_rate()
      sound: soc: codecs: rt5682s: convert from round_rate() to determine_rate()
      sound: soc: qcom: qdsp6: q6dsp-lpass-clocks: convert from round_rate() to determine_rate()
      sound: soc: stm: stm32_i2s: convert from round_rate() to determine_rate()
      sound: soc: stm: stm32_sai_sub: convert from round_rate() to determine_rate()

 sound/soc/codecs/da7219.c                 | 64 ++++++++++++++++---------------
 sound/soc/codecs/rt5682.c                 | 26 +++++++------
 sound/soc/codecs/rt5682s.c                | 26 +++++++------
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c |  8 ++--
 sound/soc/stm/stm32_i2s.c                 | 21 ++++++----
 sound/soc/stm/stm32_sai_sub.c             | 14 ++++---
 6 files changed, 87 insertions(+), 72 deletions(-)
---
base-commit: b551c4e2a98a177a06148cf16505643cd2108386
change-id: 20250710-sound-clk-round-rate-adb1a71bd867

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


