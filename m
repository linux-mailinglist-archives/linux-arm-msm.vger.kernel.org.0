Return-Path: <linux-arm-msm+bounces-10647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D23A2851547
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 14:34:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10CEB1C21CBF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 13:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C12A43F9E0;
	Mon, 12 Feb 2024 13:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gtwvT075"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21ADD3B289
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 13:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707744229; cv=none; b=WZmqvqu7XvpEWTyugfJONcu2kDQY+bSpKND+/3QxcdQgXFtEJiMMKtmMcqHmx3qYjMFmGtr1aK/QxHKp+IFOy1WQFh64F4UevDZSTRdEi1tYCz5uLT0Ca0VPrNWuq7Wa/mK1CY9d/8uTFT9PxZJVf38We6SpmGg+Dkm/RIMA2nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707744229; c=relaxed/simple;
	bh=ydSEgrw3vWH0wzxU4QWRY90lfDyvLwBVFaRZ31MUPio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SXrzNVGi+9ES7i2tfH9NUMHZ4l+QphK6CEjlMscEMa8mCTY5MRgABj58VujNtSF0323aCM+MNmamg9bQHYMv1ZwTnbz3ZVmr34AxxZP/UbokV4asW/BD19GiSPlSB3qURV7b7xTu6vMoEhE5enj+S4VxBym8DiOLgaXl88xnRhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gtwvT075; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc74898644cso3045829276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 05:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707744227; x=1708349027; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I/A7r9NP/0VziEIfxN1XbFV9hH5pFIDQbUZtjpYFKSQ=;
        b=gtwvT075RsSFOrYLxrG8VHIo/BUCxR3Dz8B/3A+qZ3YZPe/FXIPXXy3b8AW3ekaXka
         SBaN8TX0PMCqLPsg0VANzW94hR62fwOBFCFbrXsu/dN5w1yAFVAvwNFs9OGi4ZPhUT8T
         0K79rQJjUkqcEL0NpyK878kUs/sGLusRYbr8C3DwNDXrxjXS/d9JMd+QExUVWSCW1XnF
         hoFpPlhOhj5nUantFzwhTWaOILdgZACL4GK9vLJ7TOdBY4VWBtWq2/FSA4hkFkxIYM3n
         u/ruC8Y9i+ymtH2wemeV3K1XK6nfivYZzUxIER03Xjphl4sbbinyOZCpnCDAP5wo77D6
         TZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707744227; x=1708349027;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/A7r9NP/0VziEIfxN1XbFV9hH5pFIDQbUZtjpYFKSQ=;
        b=uD0SAjISHF92MTSVhUrQGJ2PFBeeHe/kNeEMpsfmRktgoXdJtNl1sxRUvLid8wgbto
         /6KKqs2OCopMQmOmjdLyunTYDqxA5gmT0hvcY+cLM3nDGwAimRWmGm6jgjGKwpIpxYy3
         ZUB5ygYARNkz0N327TW46/5MdSS7PmTTeT0HxLL9MXhGBPbG5GMZ3pfpqfvG5Hf8VV0a
         1FjTLRPoGc4nVXV0Nocos7zqywBpoQbnQOSPy4o6xcgCEN8iASi0k9QbG/lzjg8B7lez
         gzr94wmYyjOcD2bvXt0zWTtf9TQLx9LkkNoMgMxlu2VDVH4E5UbCOWWSWQ/C1dQNavgQ
         KGtg==
X-Forwarded-Encrypted: i=1; AJvYcCUK/hpeLsuDUKW0bpNWuPN2jaAKf0qSng+h9W7psD1y3lYJegnj5yc+AfzFmUlzY490pD3wmOS8cH4p74B6RhSXFCHpiFhOYpO5MkofCg==
X-Gm-Message-State: AOJu0Yy0zNpRV+FiCR3tj/rRACg9H2ceukwBbm/kH5ginKu/9IDX+6gh
	0rNbREGarisdIFWuX++b1eW1um5B+XeMv1oqan9soDG695yYE9JP+RvrcqlPZc3q8oTwfVb9T3J
	cNTa+PFE/uGKZivKN5KZMF2CeaE0c1woSSRQlhg==
X-Google-Smtp-Source: AGHT+IFaHXNER64YVI2EmDGuarm5+vqB/KmhTYs8V+V8KJWqxbKjhPCsz8Bj5huKgdacRxl9V59XYT2x99P6pR1T7vY=
X-Received: by 2002:a05:6902:2489:b0:dc6:421a:3024 with SMTP id
 ds9-20020a056902248900b00dc6421a3024mr6213196ybb.43.1707744225689; Mon, 12
 Feb 2024 05:23:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130-wcn3990-firmware-path-v1-0-826b93202964@linaro.org>
 <20240130-wcn3990-firmware-path-v1-2-826b93202964@linaro.org> <03d5d556-9477-4f2e-a737-c2f6a96d97a4@linaro.org>
In-Reply-To: <03d5d556-9477-4f2e-a737-c2f6a96d97a4@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 12 Feb 2024 15:23:35 +0200
Message-ID: <CAA8EJpratQH5fS9mS8mnK=c9FwHn8n8g5dj+weoyzrobVMOvBQ@mail.gmail.com>
Subject: Re: [PATCH RFC 2/4] wifi: ath10k: support board-specific firmware overrides
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, ath10k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 Feb 2024 at 13:12, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 30.01.2024 17:38, Dmitry Baryshkov wrote:
> > Different Qualcomm platforms using WCN3990 WiFI chip use SoC-specific
> > firmware versions with different features. For example firmware for
> > SDM845 doesn't use single-chan-info-per-channel feature, while firmware
> > for QRB2210 / QRB4210 requires that feature. Allow board DT files to
> > override the subdir of the fw dir used to lookup the firmware-N.bin file
> > decribing corresponding WiFi firmware.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/net/wireless/ath/ath10k/core.c | 11 ++++++++++-
> >  drivers/net/wireless/ath/ath10k/core.h |  2 ++
> >  drivers/net/wireless/ath/ath10k/snoc.c |  3 +++
> >  3 files changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> > index 0032f8aa892f..ef7ce8b3f8fb 100644
> > --- a/drivers/net/wireless/ath/ath10k/core.c
> > +++ b/drivers/net/wireless/ath/ath10k/core.c
> > @@ -942,11 +942,20 @@ static const struct firmware *ath10k_fetch_fw_file(struct ath10k *ar,
> >       if (dir == NULL)
> >               dir = ".";
> >
> > +     if (ar->board_name) {
> > +             snprintf(filename, sizeof(filename), "%s/%s/%s",
> > +                      dir, ar->board_name, file);
> > +             ret = firmware_request_nowarn(&fw, filename, ar->dev);
> > +             ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot fw request '%s': %d\n",
> > +                        filename, ret);
>
> Perhaps it'd be useful to move to a more noisy loglevel

No, these are details. If the firmware is in place, it is loaded properly.


-- 
With best wishes
Dmitry

