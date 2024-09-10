Return-Path: <linux-arm-msm+bounces-31390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 296F9972C4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 10:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73431B24434
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 08:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0547183CB0;
	Tue, 10 Sep 2024 08:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3CjCQZU4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8785185959
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Sep 2024 08:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725957482; cv=none; b=pDJrkqNaY1/amhzwH1TrbwGrKlU3vIbEUNGxreaTmPukYvYcfiIPbhqOD8ZOWBAun8dIlt2dROmKY70X8/89r2Yi1cmHNWvk2mUa5YTYirnFmQc2iG3Sk2T1oBnx6vllbetJKmOXh9zw2+EjeV0cGqBYkZ7H3Cbrbo2fboqGSjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725957482; c=relaxed/simple;
	bh=eZweYYHm++Bqv8c2cCyGe8waWaVC9L/fMVK1rSAYEuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HIPCJLttqRgYstVaujbRE9ORUzmxYRgxdSl6tvazZN5Y+FMqHjdm+18qBPKH1FSTCcbdUfaj97oWP0jMfbZfuI1w0xYFZgMqAVTrW8/6HFKFya95uNCXyFKG3PebzQs43utRkh6TPNd6yf9KXimOACiF0ISH3Y57HLiZf60pjzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3CjCQZU4; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-535694d67eeso5151234e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Sep 2024 01:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725957479; x=1726562279; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avZmreRSQ5vgu2EEKWcyaA3dEVEZLIFX3VmPTyqgNK0=;
        b=3CjCQZU4H7rPtaGBPSLdgPcCCeNwnuyasIZfL74ap9ntqaE+ygVdGJxburzCXGnOAw
         rBy75UVfLCBWc5xH21+QLkuyoSfu6jognonwLCTgwZrZwRREefJIS0LLbfmjMJbG1YMa
         Hl8tZrQf3yIj1dSubV+WVbUmZqFmmN2uPOVFzCKp5X0Wl+o93FtCdwNTbKXp2AB6vkge
         WcgxGSJup2HYnW14v2FrSypMOiSm+piXvsNKFLdUf3wJ0prbsBQZFiz3+V2UHsG+o3R0
         7w8k9Qmope++BoNdxHcuVJf5F1xkEhlLi6SQ5dScnDXDaXAd8VK/NDuKeErhUwZwXt5D
         Gd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725957479; x=1726562279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=avZmreRSQ5vgu2EEKWcyaA3dEVEZLIFX3VmPTyqgNK0=;
        b=uwVl5G+UEOfOWzC1++OCI2WOwnuDmvYUOhXWD0/L6P3L7XOnVwYEZJPRU0wlvkjQoi
         HHLqF12LHYH3hFSu7F0gZZEZ6OlmBYOdCA11ApPK17gNcstasp09BgarV7W4KWu+LPg3
         OqoqjW94mRBh+lFqh/Ght8Gj2KdgRe2CvdKnaj0x7voP3mqY4vJ7m/+BB9II/jK/fpHs
         0knTS73xxUyHf8X1Hi5uI3tbi5Et3ubvOnGU+QOMJmHH4kFMZN8+0UZuVTOhuyOXOTuT
         zC6BdHdLBo4qsQijFxwIjqtpaHHI6vNrEMjRVeSX3dVuqt9mLMXV5R5PALvm+Lo6g8DP
         9v1g==
X-Forwarded-Encrypted: i=1; AJvYcCXLkuMuCt64WPq1iLquL8EAbdD2mTyeoXJggfSdp6nJkjaYMjeGU4HUZSN0cr2pIbtG5857D8FQxrpY8zD9@vger.kernel.org
X-Gm-Message-State: AOJu0YwuNdZYAvJeOHKfFRzsKTJMIXlSI2iW/b9hsonBc0cmhm8UTe3h
	kt26uEe5K0GiVhoF8DHpebsMfdK+fh0mkXhZxkeJOz8jBHM0buqrXV7BUq4uy4LhMcNEB12lv5L
	QCSj1lPpJ45BO7GjIry4857Gspcy+4Gu/YemceA==
X-Google-Smtp-Source: AGHT+IGvGeHtcjeoxZgfuU6A2kXjOayadF/beubgiWM477PI1P06goWDhPFUpQgAtkK8pAAAeUdifLwfAbbX+5UYzuU=
X-Received: by 2002:a05:6512:b9f:b0:535:6480:707d with SMTP id
 2adb3069b0e04-5366bb3d443mr830105e87.19.1725957477765; Tue, 10 Sep 2024
 01:37:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240909-tzmem-null-ptr-v1-0-96526c421bac@linaro.org>
 <20240909-tzmem-null-ptr-v1-2-96526c421bac@linaro.org> <20240909131842193-0700.eberman@hu-eberman-lv.qualcomm.com>
In-Reply-To: <20240909131842193-0700.eberman@hu-eberman-lv.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Sep 2024 10:37:46 +0200
Message-ID: <CAMRc=MdCHWfmZORx=mjBzOcgub_hSAz9oF6CzovGpKfMkKqgPw@mail.gmail.com>
Subject: Re: [PATCH 2/2] firmware: qcom: scm: fall back to kcalloc() for no
 SCM device bound
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Andrew Halaney <ahalaney@redhat.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Rudraksha Gupta <guptarud@gmail.com>, 
	"Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 11:04=E2=80=AFPM Elliot Berman <quic_eberman@quicinc=
.com> wrote:
>
> On Mon, Sep 09, 2024 at 08:38:45PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Older platforms don't have an actual SCM device tied into the driver
> > model and so there's no struct device which to use with the TZ Mem API.
> > We need to fall-back to kcalloc() when allocating the buffer for
> > additional SMC arguments on such platforms which don't even probe the S=
CM
> > driver and never create the TZMem pool.
> >
> > Fixes: 449d0d84bcd8 ("firmware: qcom: scm: smc: switch to using the SCM=
 allocator")
> > Reported-by: Rudraksha Gupta <guptarud@gmail.com>
> > Closes: https://lore.kernel.org/lkml/692cfe9a-8c05-4ce4-813e-82b3f31001=
9a@gmail.com/<S-Del>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/firmware/qcom/qcom_scm-smc.c | 28 ++++++++++++++++++++++++----
> >  1 file changed, 24 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/firmware/qcom/qcom_scm-smc.c b/drivers/firmware/qc=
om/qcom_scm-smc.c
> > index 2b4c2826f572..13f72541033c 100644
> > --- a/drivers/firmware/qcom/qcom_scm-smc.c
> > +++ b/drivers/firmware/qcom/qcom_scm-smc.c
> > @@ -147,6 +147,15 @@ static int __scm_smc_do(struct device *dev, struct=
 arm_smccc_args *smc,
> >       return 0;
> >  }
> >
> > +static void smc_args_free(void *ptr)
> > +{
> > +     if (qcom_scm_get_tzmem_pool())
>
> I'm a little concerned about this check. I didn't think making SCM calls
> without the SCM device probed was possible until this report. We do
> worry about that in the downstream kernel. So, I'm not sure if this
> scenario is currently possible in the upstream kernel.

I didn't know about this either. And I think this should be fixed.

That being said: qcom-msm8960.dtsi doesn't have any SCM node and
there's no such compatible in the driver so it looks real.

Also: some of the calls seem to be ready for this and they check
whether __scm is set and use a NULL struct device pointer if not.

>
> It's possible that some driver makes SCM call in parallel to SCM device
> probing. Then, it might be possible for qcom_scm_get_tzmem_pool() to
> return NULL at beginning of function and then a valid pointer by the
> time we're freeing the ptr.
>

I thought the SCM module is initialized at subsys_initcall() exactly
for that reason? Because if the above can happen then we have more
problems than just that. What if we enable SHM bridge during probe?
I'm not even sure what would happen to SCM calls in progress that were
passed regular buffers before.

I think the SCM driver should be improved and not allow calls until it's pr=
obed.

Bart

