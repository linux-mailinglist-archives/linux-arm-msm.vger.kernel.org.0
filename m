Return-Path: <linux-arm-msm+bounces-6020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4608281ED9D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Dec 2023 10:09:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 471101C20BF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Dec 2023 09:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E872199CD;
	Wed, 27 Dec 2023 09:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qIHuRuOG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C168010960
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Dec 2023 09:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5e7f0bf46a2so40562987b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Dec 2023 01:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703668191; x=1704272991; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fwEu5R28XphpFnA42t09e1RbHp63w9bz44iIVwBNAUc=;
        b=qIHuRuOGYZY6sdOafW8wMj94D4MBaRJVLDCNYd/jYTV0d5DvQ7D+eyaBn5RkNzQYDK
         aI+ppaYoLid0/Q6WI+FX5H837Wm2aqzBmGmudSVrnGWrjs8Pug74zlkmP2rAMH8FeuTM
         SGkd7cIxMi5yKGYcyKBNdWQetdIm9JprMMf9x0qgqRtKNXaxirHCg/p91JsGZ8LWMwTy
         uLVqrJGLNWith2ws0ze+wtLgq0ilm3EV73+iT5EM17frKh6DrDqAV5QbeoVhB5UvEVIL
         hVzXT+zy9m1WUt7Jj1HmDl3ilhCqCqAgKyPcNjVZgRJxarYKa54prdqMGaUkH/W66r7h
         qedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703668191; x=1704272991;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fwEu5R28XphpFnA42t09e1RbHp63w9bz44iIVwBNAUc=;
        b=RojGQWUNKVZoLB2XpP5qSCnfCryd1lye9D6Vwqu7rJhib5ZhM9SgHP2XkirQCiSyAY
         0HcJshqiy3v9JgD0vzxEAnV5XdHaRVb14T12LeKNFWTt7CGUBNWzjL7+32GjODNhPdlM
         P5irdcOt7WM1uFeYd8kCho0jrRqdHa7/xNFDwFCRtVHZav3axP77+jNgg24V52cdUfJL
         5sfhkbJDJpJwbAjngLW+aDgOnzLO8Z1fZolGJUu/6JWm0MhEaWTV37NTZq8FRemVt3Wo
         cQUQxYDCEpZcgy+cKLm7sRMDQ+tcTrodAP7QzFpl1DtAUGVtZ9GH8+mVAsWZYbAgLNio
         bePA==
X-Gm-Message-State: AOJu0YyAH82o9tRnN9M2kDya4QSBtG49Mpg79qkmwYtAZlMEB6pbQc70
	t3GpwOs87brAtQ61dS2G4rVXwaNlLCBa7xxyWW47RB3TFMolcQ==
X-Google-Smtp-Source: AGHT+IGzAOf7UJ6bNjZfB8fXmc9A10p4UfDDlXfSVykTuCPbV230Jq5FCUITCLhKd8YqNo8CWH778G0MyDmSAaA6gl4=
X-Received: by 2002:a0d:dd96:0:b0:5c9:cb4c:35df with SMTP id
 g144-20020a0ddd96000000b005c9cb4c35dfmr4595433ywe.37.1703668191750; Wed, 27
 Dec 2023 01:09:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231226003447.3044365-1-dmitry.baryshkov@linaro.org>
 <20231226003447.3044365-5-dmitry.baryshkov@linaro.org> <3561f0ea-f6a7-42e5-a51a-3efa75de8661@linaro.org>
In-Reply-To: <3561f0ea-f6a7-42e5-a51a-3efa75de8661@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 27 Dec 2023 11:09:40 +0200
Message-ID: <CAA8EJprJEUtzSz-pDyJ+UeyTaPjmJ8i9mX_A8JuLzUDNxFOGtA@mail.gmail.com>
Subject: Re: [RFC PATCH 4/5] remoteproc: qcom: mss: add configuration for
 in-kernel pdm
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Dec 2023 at 03:43, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 26.12.2023 01:34, Dmitry Baryshkov wrote:
> > Add domain / service configuration for the in-kernel protection domain
> > mapper service.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/remoteproc/Kconfig         |  1 +
> >  drivers/remoteproc/qcom_q6v5_mss.c | 84 ++++++++++++++++++++++++++++++
> >  2 files changed, 85 insertions(+)
> >
> > diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> > index f1698d4c302e..8152e845f7a3 100644
> > --- a/drivers/remoteproc/Kconfig
> > +++ b/drivers/remoteproc/Kconfig
> > @@ -202,6 +202,7 @@ config QCOM_Q6V5_MSS
> >       depends on QCOM_SYSMON || QCOM_SYSMON=n
> >       depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
> >       depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
> > +     depends on QCOM_PD_MAPPER || QCOM_PD_MAPPER=n
> >       select MFD_SYSCON
> >       select QCOM_MDT_LOADER
> >       select QCOM_PIL_INFO
> > diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> > index 394b2c1cb5e2..0bc611165657 100644
> > --- a/drivers/remoteproc/qcom_q6v5_mss.c
> > +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> > @@ -26,6 +26,7 @@
> >  #include <linux/remoteproc.h>
> >  #include <linux/reset.h>
> >  #include <linux/soc/qcom/mdt_loader.h>
> > +#include <linux/soc/qcom/pd_mapper.h>
> >  #include <linux/iopoll.h>
> >  #include <linux/slab.h>
> >
> > @@ -163,6 +164,9 @@ struct rproc_hexagon_res {
> >       bool has_qaccept_regs;
> >       bool has_ext_cntl_regs;
> >       bool has_vq6;
> > +
> > +     size_t num_domains;
> > +     const struct qcom_pdm_domain_data * const *domains;
> >  };
> >
> >  struct q6v5 {
> > @@ -242,6 +246,9 @@ struct q6v5 {
> >       u64 mba_perm;
> >       const char *hexagon_mdt_image;
> >       int version;
> > +
> > +     size_t num_domains;
> > +     const struct qcom_pdm_domain_data * const *domains;
> My ocd says num_x should go below x, but that may be a DT leftover..
>
> [...]
>
> >
> > +static const struct qcom_pdm_domain_data mpss_root_pd = {
> > +     .domain = "msm/modem/root_pd",
> > +     .instance_id = 180,
> > +     .services = { NULL },
> > +};
> > +
> > +static const struct qcom_pdm_domain_data msm8996_mpss_root_pd = {
> > +     .domain = "msm/modem/root_pd",
> > +     .instance_id = 100,
> > +     .services = { NULL },
> > +};
> > +
> > +static const struct qcom_pdm_domain_data sm8150_mpss_root_pd = {
> > +     .domain = "msm/modem/root_pd",
> > +     .instance_id = 180,
> > +     .services = {
> > +             "gps/gps_service",
> > +             NULL,
> > +     },
> > +};
> > +
> > +static const struct qcom_pdm_domain_data mpss_wlan_pd = {
> > +     .domain = "msm/modem/wlan_pd",
> > +     .instance_id = 180,
> > +     .services = {
> > +             "kernel/elf_loader",
> > +             "wlan/fw",
> > +             NULL,
> > +     },
> > +};
> > +
> > +static const struct qcom_pdm_domain_data *msm8996_mpss_domains[] = {
> > +     &msm8996_mpss_root_pd,
> > +};
> couldn't find anything on 96

The file /lib/firmware/qcom/apq8096/modemr.jsn comes from db820c firmware.


>
> > +
> > +static const struct qcom_pdm_domain_data *sdm660_mpss_domains[] = {
> > +     &mpss_wlan_pd,
> > +};
> matches my findings
>
> > +
> > +static const struct qcom_pdm_domain_data *sdm845_mpss_domains[] = {
> > +     &mpss_root_pd,
> > +     &mpss_wlan_pd,
> > +};
> can't see this wlan one, maybe just on my device

And this is really interesting. I think modemuw.jsn is required to
make modem.mbn load the wcn3990 firmware (wlanmdsp.mbn) through
tqftpserv. What is the WiFi chip on the device you've checked against?

>
> > +
> > +static const struct qcom_pdm_domain_data *sm8350_mpss_domains[] = {
> > +     &sm8150_mpss_root_pd,
> > +};
> matches my findings
>
> >  static const struct rproc_hexagon_res msm8998_mss = {
> > @@ -2309,6 +2389,8 @@ static const struct rproc_hexagon_res msm8998_mss = {
> >       .has_ext_cntl_regs = false,
> >       .has_vq6 = false,
> >       .version = MSS_MSM8998,
> > +     .num_domains = ARRAY_SIZE(sdm845_mpss_domains),
> > +     .domains = sdm845_mpss_domains,
> >  };
> matches my findings
>
> Konrad



-- 
With best wishes
Dmitry

