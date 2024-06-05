Return-Path: <linux-arm-msm+bounces-21709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB548FC4CF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 09:43:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74C061F22E2B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 07:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EDD618C351;
	Wed,  5 Jun 2024 07:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2tcxoikD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6056318C334
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 07:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717573397; cv=none; b=bBRolvGB8XScicxTbNS3QFGjyl5lR0JYRTAxC6YngPyyGtuEjxZfYb5Q+FrlPOXsKXUbtkutrozzvrwU1ICGmqeWK7OYiwzjQ4kCh526xmgE4hT2azlLaP5dqmH+/zzk6K6RXw/T7jvi7HfN6FBc31UhY3RgajxZ3DOsGcp8fkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717573397; c=relaxed/simple;
	bh=l9sh3+D2x2FynAmR7WZMbPzPELRCyU/6nGYVYGh1LAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ie/ftK/pOtZAJ19BhmQ20PvKrRb5ri09phPgsbLwCiUNtNVWIehjLGEtosG5TUSAnSVp7DwWA22BJedtCWrJJRGnrAjGHtLFPqkvBouk3LnAo3tTAlwdb8rbFKTlyHAWM0VaY07MJeQo9N74godMFK2Qafn8q14XFejxph/UIvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2tcxoikD; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2eaa80cb573so52308181fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2024 00:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717573394; x=1718178194; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iyjciw8omyqWPArx3sDq7VVjOnmIsURoasHM7cx8Qy0=;
        b=2tcxoikDuetee/IYolYrAaZsEuduc0ig0ACkbZnNXC+E7FtUebge+0dlrsdtSXU5Jx
         NSBrI6H4ec1LVyMy/EH6hnds4hGNDH0jpS8FDhLQquD1F3QLnAawPIt0ZQjXVpI7zN6J
         QNCBYE+a3A8U1/mEbffsf9KmALHFjar9NJkH+Qzn9JQGbwkef2JlKhb10ppTRr4FZN3l
         Y7nmkku5pq7yfrNOAP7XJC+2sXijopIXOLeLKeGDlzyRxQY+32ejw+Cg/eXxpL3amca5
         LMH3k/DYZXDVkz4hRlKOi9EkadNzlfhUVp4wMY4bgRAchTDotltw/3YamzwU6rdmqlar
         MOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717573394; x=1718178194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iyjciw8omyqWPArx3sDq7VVjOnmIsURoasHM7cx8Qy0=;
        b=D0SpsF5OlRGLgBlGIH6MpeP1PpDDcB0JifZU9O8fRf3+0qsN2LUp0RUYx73Muambkt
         zTYZH5FvpRg79FBhjU0QGU7RWOThqHgUUPgeyAWIQwo2bjEWjLxNXUcMxaa5e/ic6Wgi
         hK9nY6n06CHtbUQPFaTwsICKSPw7WV4PcnOJr+iFlGKsmWVRBvHmqY00a1dlODgUeVU8
         AqMv/tF6Uwi3RJ/I4eOZS1wCiLDFNYa6SMY5UpNVlEzbsfanVuUX1bCRGg6/cgHSOQ4G
         DgSMaTABGJZJEQlb1ar7JsY9CBvc/1c94w/GkrBeP576PMCuo/g87zCsIgC2+9Ox0baF
         anVA==
X-Forwarded-Encrypted: i=1; AJvYcCUtBHGkEL4MzhDcLrHyA5cunnGiO0jCV/f65kFSUsh2UhdJZ1oHVdpDPgPUnHezTXS60QQJF3nIEk7HEW/Koog21dwUdeS7yYdQGH0QRA==
X-Gm-Message-State: AOJu0YxM+QJdVTWJtG59Ww1sSSu/b2ThdVdhpasrChLFy1JXbXZkcvhY
	rc0tKlALr6S4Ei6lN2BWHf0AD2ziC+EATpCcMO0x0/8QLtfLCkIiGGmFOqj6fqW50wKQ9eG5onW
	3bg+eYvC/igOiuJrMvLzOVa7YLkmxvqiZajQdzA==
X-Google-Smtp-Source: AGHT+IFiHKKNVWneGGr50WzFkObsQ9oUM8GSCkWSrf/BaWFo5gFPEh8dKnIHSJrU2YjGwU9b3MU7THwqkd1DB3CAvSE=
X-Received: by 2002:a2e:2416:0:b0:2e2:72a7:843c with SMTP id
 38308e7fff4ca-2eac7a54169mr9164901fa.36.1717573393470; Wed, 05 Jun 2024
 00:43:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240528-pwrseq-v8-0-d354d52b763c@linaro.org> <20240528-pwrseq-v8-10-d354d52b763c@linaro.org>
 <20240605065245.GB3452034@maili.marvell.com>
In-Reply-To: <20240605065245.GB3452034@maili.marvell.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 5 Jun 2024 09:43:02 +0200
Message-ID: <CAMRc=MfyCJgOCBSh7AY4jEujWXGqZBB7Tnkq0VRrAKKCcJ9hAQ@mail.gmail.com>
Subject: Re: [PATCH v8 10/17] power: sequencing: implement the pwrseq core
To: Ratheesh Kannoth <rkannoth@marvell.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Elliot Berman <quic_eberman@quicinc.com>, Caleb Connolly <caleb.connolly@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Alex Elder <elder@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	Jeff Johnson <quic_jjohnson@quicinc.com>, ath12k@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel@quicinc.com, 
	Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 5, 2024 at 8:52=E2=80=AFAM Ratheesh Kannoth <rkannoth@marvell.c=
om> wrote:
>
> On 2024-05-29 at 00:33:18, Bartosz Golaszewski (brgl@bgdev.pl) wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Implement the power sequencing subsystem allowing devices to share
> > complex powering-up and down procedures. It's split into the consumer
> > and provider parts but does not implement any new DT bindings so that
> > the actual power sequencing is never revealed in the DT representation.
> >
> > Tested-by: Amit Pundir <amit.pundir@linaro.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> > +
> > +static struct pwrseq_unit_dep *pwrseq_unit_dep_new(struct pwrseq_unit =
*unit)
> nit. pwrseq_unit_dep_alloc/create rhymes well with pwrseq_unit_dep_free()=
,

So what?

> > +static void pwrseq_unit_free_deps(struct list_head *list)
> > +{
> > +     struct pwrseq_unit_dep *dep, *next;
> > +
> > +     list_for_each_entry_safe(dep, next, list, list) {
> no need of 'locks' to protect against simutaneous 'add' ?

No, this only happens once during release.

> > +
> > +static int pwrseq_unit_setup_deps(const struct pwrseq_unit_data **data=
,
> > +                               struct list_head *dep_list,
> > +                               struct list_head *unit_list,
> > +                               struct radix_tree_root *processed_units=
)
> > +{
> > +     const struct pwrseq_unit_data *pos;
> > +     struct pwrseq_unit_dep *dep;
> > +     struct pwrseq_unit *unit;
> > +     int i;
> > +
> > +     for (i =3D 0; data[i]; i++) {
> Can we add range for i ? just depending on data[i] to be zero looks to be=
 risky.
>

Why? It's perfectly normal to expect users to end the array with a
NULL pointer. The docs say these arrays must be NULL-terminated.

> > +             pos =3D data[i];
> > +
> > +             unit =3D pwrseq_unit_setup(pos, unit_list, processed_unit=
s);
> > +             if (IS_ERR(unit))
> > +                     return PTR_ERR(unit);
> > +
> > +             dep =3D pwrseq_unit_dep_new(unit);
> > +             if (!dep) {
> > +                     pwrseq_unit_decref(unit);
> This frees only one 'unit'. is there any chance for multiple 'unit', then=
 better clean
> up here ?

The references to those will be dropped in pwrseq_release().

> > +
> > +     /*
> > +      * From this point onwards the device's release() callback is
> > +      * responsible for freeing resources.
> > +      */
> > +     device_initialize(&pwrseq->dev);
> > +
> > +     ret =3D dev_set_name(&pwrseq->dev, "pwrseq.%d", pwrseq->id);
> > +     if (ret)
> > +             goto err_put_pwrseq;
> > +
> > +     pwrseq->owner =3D config->owner ?: THIS_MODULE;
> > +     pwrseq->match =3D config->match;
> > +
> > +     init_rwsem(&pwrseq->rw_lock);
> > +     mutex_init(&pwrseq->state_lock);
> > +     INIT_LIST_HEAD(&pwrseq->targets);
> > +     INIT_LIST_HEAD(&pwrseq->units);
> > +
> > +     ret =3D pwrseq_setup_targets(config->targets, pwrseq);
> > +     if (ret)
> > +             goto err_put_pwrseq;
> > +
> > +     scoped_guard(rwsem_write, &pwrseq_sem) {
> > +             ret =3D device_add(&pwrseq->dev);
> > +             if (ret)
> > +                     goto err_put_pwrseq;
> > +     }
> > +
> > +     return pwrseq;
> > +
> > +err_put_pwrseq:
> no need to kfree(pwrseq) ?

It's literally put on the next line?

Bart

