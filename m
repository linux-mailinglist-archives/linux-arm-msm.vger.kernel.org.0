Return-Path: <linux-arm-msm+bounces-12089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D96C285E67A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 19:39:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 080C81C24E4A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 18:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47DFB8565E;
	Wed, 21 Feb 2024 18:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="r8oIrkJy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7259281ABB
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 18:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708540773; cv=none; b=ZDMilaBR+X+NYWXKFQQ9BIgTONTC25ssbsALntj3E9AcnPyxSxdJW+7RJ332kAPZfGMJOD6X2fdFJZPzrcblFv04aRV+/yLEWwo92BlxI1FHJbaqqmmcUacRunP3BKBL97My632jYKZIsY5uIKPWGtCh/XTZWqaPIt0wHIHLC9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708540773; c=relaxed/simple;
	bh=ltCLerzsny1Mf/3etibB5mXyU8baMLxo3QojaxcO5q0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uj58+8IFGfuuQNC9J3yoI8IvrC3JYqeIfnZFzbimHGpt3py/4UeQVQXBuUvWCsi6grMTZtkK9Od89MuUZD1W0bwuiRMRyMY3/KNSOMuGc3y4xOObjKGLVp//0vrABIMcxeewb6Y//TAfwJ0OYwM5JwrlImOQabxfQMOo047v/LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=r8oIrkJy; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-7d5cbc4a585so2016529241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 10:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708540770; x=1709145570; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lr4IUMnYmNnkEtsozLmsyunjWbfVFxd6vy9GXcYNIEQ=;
        b=r8oIrkJyHaWr8XhJLfEQPt8izKBGUM6LFUa8XbPVZT0v77+KMhB47wg+Go9i0wz0Bc
         HTOAKv6agbZHZh5bwKY1nDe6lfNoVPwgmrWvUEJUWy75Tp1cJAV8m9UYyOp4ZCzvY19C
         9LXHI3Z+iYtg9xqcQrW3OHd28m+CokM/CZT585Cl3Mu7JopChb+6N128tyaYN1iVnW5O
         wMSIQW2zoUGSS9G+It/q+F9MzVnvfdg4GHwDr9BPV7UySBUDqdSXwAc/MboElL5e2iGs
         fmQfhLd8wYXP3QNcs3+Hd23rmZ4UMpsl0oMu5Bao4EO17RwiGJ2KlE0XYh6qu/3XOdXs
         98wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708540770; x=1709145570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lr4IUMnYmNnkEtsozLmsyunjWbfVFxd6vy9GXcYNIEQ=;
        b=D/m2q8LOFYTWEgbJwehDvHJA4iK8vTZWApwwDPJA9Ig+KoIlMTxjcD5hvTMoK4CiT2
         kXp0nPbdoCAQB3nYEhbiPODkRdjDt6d52WjU/lcE/UtEoX62UnGkUJ6DxEilqfhEEJwK
         edTvFF7j1GkKS8Hlqoc8l8ufKwnobiM/4MonhRv+4wbFY0MfqVhujDnLECVtuCBjJIzy
         d7BWwiw9XxIbMtDiae/sPWzulH6KzkNbvXD6lM/pGRUyhXwawOWoTbp3dcR9Ndf/ceBb
         nluny6jeG24TU8yaCLFPEEV07xpDcSa3x6QcnrbPeq0e4bxo/Z+IsuPhXzAQbv3xyOQj
         UoZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7vmTajHaP4lxhSJMJIrDWvWWJUi6Gv7xSaWo82VnAktP01bd/SSzOph4wQy1nAXeWpwdoaoGpsantfi/0RQOOkM/EFY3OD3Nmuo4irQ==
X-Gm-Message-State: AOJu0YyEFT6MDOZsmdZaKQd1Naw1VkgzXQOowuQnKe9qdxylb1v3qqvn
	8uhoGE8Axl/eDP1HbCHS512309J8qLO5BCr6B4iZ4sxz2mmcyDztnrFdGOf3H/t69jGKf1uVK1x
	/n3eC6wrjv16G6A3iNZYd1T4/dZjsMd8z4jY1yw==
X-Google-Smtp-Source: AGHT+IG2ipXt9OnxmfKd/LCnEEhoOhjocNBwR5gMMmYQiXx9HtJ4a5t2aa542TfW1o+iPUXCGhlTlsgBTdSGbf2UnXU=
X-Received: by 2002:a67:e8cf:0:b0:470:4744:704a with SMTP id
 y15-20020a67e8cf000000b004704744704amr6823220vsn.9.1708540770337; Wed, 21 Feb
 2024 10:39:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205182810.58382-1-brgl@bgdev.pl> <20240205182810.58382-3-brgl@bgdev.pl>
 <tnylagkmj36lve2ub5voumtkqjdy6j3hr6yyk4mqkaabvc3gdv@voaiu2oqi73o>
In-Reply-To: <tnylagkmj36lve2ub5voumtkqjdy6j3hr6yyk4mqkaabvc3gdv@voaiu2oqi73o>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 21 Feb 2024 19:39:19 +0100
Message-ID: <CAMRc=McmfufqqEvouRCjY1ukVB_ie1r5QEocqRUK0VBheEq5Hg@mail.gmail.com>
Subject: Re: [PATCH v7 02/12] firmware: qcom: scm: enable the TZ mem allocator
To: Bjorn Andersson <andersson@kernel.org>
Cc: Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Elliot Berman <quic_eberman@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Guru Das Srinagesh <quic_gurus@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Alex Elder <elder@linaro.org>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Deepti Jaggi <quic_djaggi@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 18, 2024 at 4:25=E2=80=AFAM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Mon, Feb 05, 2024 at 07:28:00PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Select the TrustZone memory allocator in Kconfig and create a pool of
> > memory shareable with the TrustZone when probing the SCM driver.
> >
> > This will allow a gradual conversion of all relevant SCM calls to using
> > the dedicated allocator.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
> > Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-think=
pad-x13s
> > Tested-by: Deepti Jaggi <quic_djaggi@quicinc.com> #sa8775p-ride
> > Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
> > ---
> >  drivers/firmware/qcom/Kconfig    |  1 +
> >  drivers/firmware/qcom/qcom_scm.c | 16 ++++++++++++++++
> >  2 files changed, 17 insertions(+)
> >
> > diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kcon=
fig
> > index f18686edf415..d24d83223867 100644
> > --- a/drivers/firmware/qcom/Kconfig
> > +++ b/drivers/firmware/qcom/Kconfig
> > @@ -7,6 +7,7 @@
> >  menu "Qualcomm firmware drivers"
> >
> >  config QCOM_SCM
> > +     select QCOM_TZMEM
> >       tristate
> >
> >  config QCOM_TZMEM
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/q=
com_scm.c
> > index 520de9b5633a..0d4c028be0c1 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -8,8 +8,10 @@
> >  #include <linux/completion.h>
> >  #include <linux/cpumask.h>
> >  #include <linux/dma-mapping.h>
> > +#include <linux/err.h>
> >  #include <linux/export.h>
> >  #include <linux/firmware/qcom/qcom_scm.h>
> > +#include <linux/firmware/qcom/qcom_tzmem.h>
> >  #include <linux/init.h>
> >  #include <linux/interconnect.h>
> >  #include <linux/interrupt.h>
> > @@ -20,9 +22,11 @@
> >  #include <linux/of_platform.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/reset-controller.h>
> > +#include <linux/sizes.h>
> >  #include <linux/types.h>
> >
> >  #include "qcom_scm.h"
> > +#include "qcom_tzmem.h"
> >
> >  static bool download_mode =3D IS_ENABLED(CONFIG_QCOM_SCM_DOWNLOAD_MODE=
_DEFAULT);
> >  module_param(download_mode, bool, 0);
> > @@ -41,6 +45,8 @@ struct qcom_scm {
> >       int scm_vote_count;
> >
> >       u64 dload_mode_addr;
> > +
> > +     struct qcom_tzmem_pool *mempool;
> >  };
> >
> >  struct qcom_scm_current_perm_info {
> > @@ -1887,6 +1893,16 @@ static int qcom_scm_probe(struct platform_device=
 *pdev)
> >       if (of_property_read_bool(pdev->dev.of_node, "qcom,sdi-enabled"))
> >               qcom_scm_disable_sdi();
> >
> > +     ret =3D qcom_tzmem_enable(__scm->dev);
> > +     if (ret)
> > +             return dev_err_probe(__scm->dev, ret,
> > +                                  "Failed to enable the TrustZone memo=
ry allocator\n");
> > +
> > +     __scm->mempool =3D devm_qcom_tzmem_pool_new(__scm->dev, SZ_256K);
>
> As we're not moving from the callers freely allocating what they need,
> to a fixed sized pool of 256kb. Please document why 256kb was choosen,
> so that we have something to fall back on when someone runs out of this
> space, or wonders "why not 128kb?".
>

If you worry about these pools being taken out of the total memory and
prefer to have a way to avoid it, I was thinking about another
build-time mode for the allocator - one where there's no pool but it
just allocates chunks using dma_alloc_coherent() like before and pool
size is ignored. Does it sound good?

Bart

> Regards,
> Bjorn
>
> > +     if (IS_ERR(__scm->mempool))
> > +             return dev_err_probe(__scm->dev, PTR_ERR(__scm->mempool),
> > +                                  "Failed to create the SCM memory poo=
l\n");
> > +
> >       /*
> >        * Initialize the QSEECOM interface.
> >        *
> > --
> > 2.40.1
> >

