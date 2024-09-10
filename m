Return-Path: <linux-arm-msm+bounces-31411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D41E9735E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 13:06:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C86AB22909
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 11:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2166718C039;
	Tue, 10 Sep 2024 11:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nWb9Z+kK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6832214D431
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Sep 2024 11:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725966410; cv=none; b=UJ4OYzGefXWmfkghz77q1pdt+DDkOjV9jkCoGc5L1ZclmAe+LHCj7EP5e3Kv1UT+T0aw61w8qOZIARxI2Ldnb0Tu1xqWlX/LxfxhUYK9eOLKO5OcgdzkJy0TY77N55UKCw9T+MQubcrVirrpuwCV2pAZwICcHp++bh/gCXWedfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725966410; c=relaxed/simple;
	bh=1maY1cX453DMHlJm2agu5A1XDvFqpwWseCzYI4mcRfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T4I7yqOiv/hh7xX4nxi/9eVgYD0SOurcDFsataz78TBfBIzUjmcimNRUXpA7PcQuCXU/JvMnXLKisj3Yq7ZGu5ySzWX+14cx2ohchjGf8DgnxF9BCmknLOXNJL2Um/G6EcExOZLz2B0DMFqr/mJtflBJR7NmUonH4kIHDd5TIDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nWb9Z+kK; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-68518bc1407so58407087b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Sep 2024 04:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725966407; x=1726571207; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UCCbavyEihwNVBphJesiHire7f9BtBrqKcNAqBxfKK8=;
        b=nWb9Z+kKgldO/yQSZDo2F7iYYb5oRS7ZOCx5hkTJGmzHRZi7xUm+QAB6zCIUOsvLDz
         4LW5MfKES1mfP+Qznbgrprvy03WNIcaPPbdhcNe9p/l9mUeErWGtgJLWFAibQ3vopTwy
         fzydIdFCA0YxwNeDcSlEM0Ub5FCxv1hJUwdZiL1Wkgmh0KKXwIwf2PLlbE+JMAVPgvle
         k9yCvn43oAXsFr2/vQqz4MiHdt9OwlrBy88kf2HZVtEvTDaQ2O63zn5Se8JShMHvh9RC
         xBAILkCjHVeBZPGQncaHrcAczNy0aK5mHdlEgYNcfxGmeV1IPePJJGq1cl3k2ewpNjhO
         ykNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725966407; x=1726571207;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UCCbavyEihwNVBphJesiHire7f9BtBrqKcNAqBxfKK8=;
        b=BPgUyY6e+Gq0zSnLVc37e1vpXgr0oxflavrwnrAR5Bk4E0JTcjX3rG3ZZa9Pr8FTK1
         F9KRj/+5vDz3NAwmUg9YcqOHJUvV5v9Ez9jtCBKBLoyU8gllF6EQhb1e7ERzAuU/4BbX
         0VTmxPTEbpi9y1VqtqKoeEKyzTZPX0a77ck4mIh3F4a6CMtwp/xLvHQrITYA29nTOGfq
         b3jJwZtLVkFqBfxPaEdJtLfxwBf+Inf51CjZTufOf4npE63ub26fQHPGYLh8l9YL6pGS
         c/eUd+TZQ/7szwLKbRcg6lVLIw0DMY5CvK89lgTLXqvwEQt+TxMgSHVkOJ8CxIj772re
         sKBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjco7Vlv+f/hPih8a/whgsahXZcuX3ldHSJny9Lwl3mhmrcYj4bm9R4a9PCf1Y+UMEwcGBYP2xNlQqyaHu@vger.kernel.org
X-Gm-Message-State: AOJu0YxVafFKtyoKEppiqtEAI5Fh9a859PkInQ5CnCjHEkn6jnc0fTJS
	wM5JOV5UzWlyWPcofL64aIk5P39uu9eFJlotHJ1OcJaJTCZ1V97fnGrFJFizklBmCORyMKbtvK1
	QwFJrBXV6rspSdUQGHirJGlVTrSZQCYA1fyDbPA==
X-Google-Smtp-Source: AGHT+IGaUD3Kl9sgFWBanJ/jqdGQUVaWn5REmu+dNclgfsVVSH0XeaP/G9sv4hdqxWANQMRS7ZxrjRu0+pPPXkl0zsA=
X-Received: by 2002:a05:690c:6e0a:b0:630:f7c9:80d6 with SMTP id
 00721157ae682-6db44f4228emr153561027b3.27.1725966407251; Tue, 10 Sep 2024
 04:06:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240909-tzmem-null-ptr-v1-0-96526c421bac@linaro.org>
 <20240909-tzmem-null-ptr-v1-2-96526c421bac@linaro.org> <20240909131842193-0700.eberman@hu-eberman-lv.qualcomm.com>
In-Reply-To: <20240909131842193-0700.eberman@hu-eberman-lv.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 10 Sep 2024 14:06:36 +0300
Message-ID: <CAA8EJpqSKbKJ=y0LAigGdj7_uk+5mezDgnzV5XEzwbxRJgpN1w@mail.gmail.com>
Subject: Re: [PATCH 2/2] firmware: qcom: scm: fall back to kcalloc() for no
 SCM device bound
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Andrew Halaney <ahalaney@redhat.com>, 
	Rudraksha Gupta <guptarud@gmail.com>, 
	"Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Sept 2024 at 00:04, Elliot Berman <quic_eberman@quicinc.com> wrote:
>
> On Mon, Sep 09, 2024 at 08:38:45PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Older platforms don't have an actual SCM device tied into the driver
> > model and so there's no struct device which to use with the TZ Mem API.
> > We need to fall-back to kcalloc() when allocating the buffer for
> > additional SMC arguments on such platforms which don't even probe the SCM
> > driver and never create the TZMem pool.
> >
> > Fixes: 449d0d84bcd8 ("firmware: qcom: scm: smc: switch to using the SCM allocator")
> > Reported-by: Rudraksha Gupta <guptarud@gmail.com>
> > Closes: https://lore.kernel.org/lkml/692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com/<S-Del>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/firmware/qcom/qcom_scm-smc.c | 28 ++++++++++++++++++++++++----
> >  1 file changed, 24 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/firmware/qcom/qcom_scm-smc.c b/drivers/firmware/qcom/qcom_scm-smc.c
> > index 2b4c2826f572..13f72541033c 100644
> > --- a/drivers/firmware/qcom/qcom_scm-smc.c
> > +++ b/drivers/firmware/qcom/qcom_scm-smc.c
> > @@ -147,6 +147,15 @@ static int __scm_smc_do(struct device *dev, struct arm_smccc_args *smc,
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

MSM8960 and MSM8660 don't have SCM devices. For MSM8960 it should be
trivial to get it, c&p from apq8064 should. For MSM8660 it might be a
bit harder. But even if we add such nodes, we shouldn't break existing
DT files.

> It's possible that some driver makes SCM call in parallel to SCM device
> probing. Then, it might be possible for qcom_scm_get_tzmem_pool() to
> return NULL at beginning of function and then a valid pointer by the
> time we're freeing the ptr.


-- 
With best wishes
Dmitry

