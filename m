Return-Path: <linux-arm-msm+bounces-35416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1CF9AA215
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 14:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD25B1C2198B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 12:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6087119CCEC;
	Tue, 22 Oct 2024 12:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m1TbBCqz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD27019C576
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 12:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729600118; cv=none; b=nlC1d55h3aAPG8ugIeegnSHz8r1Ys50Yy2Jmc17rGwNH9GF+b/ypdLg5jj8Em6zI/TG0EQBJ4fVyODx7Vuq+Hhm1532bdKbVElqRnpDfZaRT48unEGIS1fe8WR3L5jmIU4uDP4aZKRPCpctbU3AYffFK8ge0OTBgj0js7RcmeCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729600118; c=relaxed/simple;
	bh=qWIjXmIEmAmE3Cr1lHs1eWeZDZtAM7mr7Y3/sudwq7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LAbzZh+JN2vkM6OLXlniD83reTpjvcaNTobZXTDK+7kYdhaB6Rq34U7eGnukQCo4tm6SFW5N0y9grBsW8ylkntQNvUbFiE4dOUg7JuM9CvERfSWIQ0SUr0aYp3GSJITRrNHQ22p78hMAB/oiwSqxmYB2d0EUhTHAR5c3G0S1n9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m1TbBCqz; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e2e3179b224so440586276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 05:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729600115; x=1730204915; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ioL3U7Maz0qLUYZXpZJBEClR0ZOLVSgH8k832uiTky8=;
        b=m1TbBCqzC0VghJZKTo/K7l6rQj1R7B9EQlRnTIIadCq/DrQtvcsW+UCe7Xtm+7F44+
         cKFMygPdQBsPotcnXRpRgS0/Mz7oCkX73T514ccBQlrxe1MggwTyR/RCDP+JXRxCw8OE
         6iBbjil3JyAEtZ3bJXjMdri7E9cWbBoJqFtNZJyM7f82H3NOOKdD1AAhn9yaLeZYo+jo
         6iBN91Znjc0lkvNlAbybZUP955HZPz9PMFX1KnUjWLXV3HDhvqaO9mhoPcq8Lvp+yssZ
         RKZQUWWOL/QHAQoVnYUonOx6Emv0fNzlCgCfUimTDTfao1+aDq5izz92Rfa8BU83Axo4
         nFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729600115; x=1730204915;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ioL3U7Maz0qLUYZXpZJBEClR0ZOLVSgH8k832uiTky8=;
        b=D51ufMLx0h/aUByFjtE+OqmWtA3CoURqswiQqqjEUuOrqJsEBb81y9ITBeIuz3OLrW
         SFCIh8vthIVGmOYtyqOyvDpHpKRO3I55u5EdIY5Acoqkl+DEILSjEcq0pTvLu6OEA0+/
         S7DglDG8JH3C7qQRxwh6fTgrFfjeQoMbjqtAyjq2Tocb3ipqV7dtD+XqImB9QGAK6kLB
         16mNJmrDVE1B28ASZpMz5GsaYQvssuqjgzZ6IxxubQ8R+EqviK/znILW5meYLeFL4kex
         c5JL/7GM0eeXrPHK7R1p0LJwfRBNzlNKC/HvnkxTLle55Wk5mbDx+yNMcgI4ZfDdcpQC
         Nxzw==
X-Forwarded-Encrypted: i=1; AJvYcCV0IANp23aqbCwNxHsM9Aoe+UNqAvjPYngNTvHonbmoIFMTOfJlo++Jyr7AcfEmcr06tHb9G1Ls5y2tg8S/@vger.kernel.org
X-Gm-Message-State: AOJu0YwQnrlr6mm7RAvz8U7aAzhuk6bZgieYMpwalTdCAZPSA6btOf4X
	I9e990NZVwewwMCDC7mwUVAvrdRbprSJdMsM8QIG92+fEGXvDV6nzToCPC1ean/P4q/ELKXynIu
	8ouzXIPRTXOq7VVeNGop6+tBuJuyt5kWVZDY9tQ==
X-Google-Smtp-Source: AGHT+IEl5bYcUxKZc8mAfmMEAjtQp84RugZvAkgPtQDGOp24lN77bPuSBEw3ulBRwyVTZHLzGUlZyV8MTZyrDSygndg=
X-Received: by 2002:a05:6902:1027:b0:e0b:5b37:d0c9 with SMTP id
 3f1490d57ef6-e2e22eb8ca4mr3538840276.14.1729600115527; Tue, 22 Oct 2024
 05:28:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241006135530.17363-1-quic_spuppala@quicinc.com>
 <20241006135530.17363-2-quic_spuppala@quicinc.com> <CAPDyKFpXh0vZrK6PU2V+y92Q_+y6Q2+VUEONXiBrqAp_qqp_jA@mail.gmail.com>
 <e63f8862-5e1b-45c4-9815-95deb70f72b4@quicinc.com>
In-Reply-To: <e63f8862-5e1b-45c4-9815-95deb70f72b4@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 22 Oct 2024 14:27:59 +0200
Message-ID: <CAPDyKFqhUKuwUs9ySZnDvp8WZLNZq2K6q-S-0DjQvFU7vuvHoA@mail.gmail.com>
Subject: Re: [PATCH RFC v3 1/2] mmc: core: Add vendor hook to control
 reprogram keys to Crypto Engine
To: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	quic_rampraka@quicinc.com, quic_nitirawa@quicinc.com, 
	quic_sachgupt@quicinc.com, quic_bhaskarv@quicinc.com, 
	quic_neersoni@quicinc.com, quic_gaurkash@quicinc.com, 
	Eric Biggers <ebiggers@google.com>, Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"

+ Eric, Abel

On Sat, 19 Oct 2024 at 06:55, Seshu Madhavi Puppala
<quic_spuppala@quicinc.com> wrote:
>
>
>
> On 10/8/2024 7:30 PM, Ulf Hansson wrote:
> > On Sun, 6 Oct 2024 at 15:55, Seshu Madhavi Puppala
> > <quic_spuppala@quicinc.com> wrote:
> >>
> >> Add mmc_host_ops hook avoid_reprogram_allkeys to control
> >> reprogramming keys to Inline Crypto Engine by vendor as some
> >> vendors might not require this feature.
> >>
> >> Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
> >> Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> >> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> >> ---
> >>   drivers/mmc/core/crypto.c | 8 +++++---
> >>   drivers/mmc/host/sdhci.c  | 6 ++++++
> >>   include/linux/mmc/host.h  | 7 +++++++
> >>   3 files changed, 18 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/mmc/core/crypto.c b/drivers/mmc/core/crypto.c
> >> index fec4fbf16a5b..4168f7d135ff 100644
> >> --- a/drivers/mmc/core/crypto.c
> >> +++ b/drivers/mmc/core/crypto.c
> >> @@ -14,9 +14,11 @@
> >>
> >>   void mmc_crypto_set_initial_state(struct mmc_host *host)
> >>   {
> >> -       /* Reset might clear all keys, so reprogram all the keys. */
> >> -       if (host->caps2 & MMC_CAP2_CRYPTO)
> >> -               blk_crypto_reprogram_all_keys(&host->crypto_profile);
> >> +       if (host->ops->avoid_reprogram_allkeys && !host->ops->avoid_reprogram_allkeys()) {
> >> +               /* Reset might clear all keys, so reprogram all the keys. */
> >> +               if (host->caps2 & MMC_CAP2_CRYPTO)
> >> +                       blk_crypto_reprogram_all_keys(&host->crypto_profile);
> >
> > Don't you even need to call this once, during the first initialization
> > of the card?
>
> The first card initialization is done during the boot up for qcom socs
> and the kernel keyring contains no keys immediately after bootup.After
> the initialization of the card, the block i/o operations to encrypted
> folders will automatically trigger the corresponding program key calls
> to the crypto engine since the kernel keyring does not contain the
> required encryption key. So, it is not necessary to explicitly reprogram
> all keys for qcom socs.

Okay, I see. I have looped in Abel and Eric who worked on this
feature, just to confirm that this makes sense for them too.

I assume the reason why you want to avoid the re-programming is that
it adds latency when re-initializing the card, right? In that case, do
you have some numbers of what we save by doing this?

Kind regards
Uffe

