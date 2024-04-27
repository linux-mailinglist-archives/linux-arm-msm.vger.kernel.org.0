Return-Path: <linux-arm-msm+bounces-18712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2ED58B438E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Apr 2024 03:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 012A81C22368
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Apr 2024 01:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05079383BF;
	Sat, 27 Apr 2024 01:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p94PWi38"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C0B3770B
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Apr 2024 01:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714181787; cv=none; b=WGaWUlGQ9P4IiaAgOH3y9X6goeZhDOmeFnuZSCV0VapLj5zc5KIz3zwEz2DTzSr9eRXjjB7WBpry0i6rdTdRIRoC3EcLupSbyH/G170+tfMGBJ70+wPA/UiwvV2EoA8tWpQr5EvVQZ0bSzgnyD8gDo7m0rT1EaxhDb/7f88BwZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714181787; c=relaxed/simple;
	bh=RdoQEjsfDLaQLxmZJ7q6grWn9U77AJJaiBSCfDtS9V4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UKxDEtem4y5dAvTLcSI4guukuOjOL/TBv+S/AnGx1NFDEkFSM20Za7PB9s1aeoi7OZOmOpd7XmyJlJIUKD1RYs85rSgBoPdt+flK8Gq6xRCn9IcoIWufIvq1L2+gjVx6y5r6WXRNbzKYqDJs6lhssjVfZuLPeBDOffXIUN8iUwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p94PWi38; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6184acc1ef3so26774837b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Apr 2024 18:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714181784; x=1714786584; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DNCnVj1Y2/lmMmkRb2EKBZBX4wqTajwlwp5m2yeDx44=;
        b=p94PWi38iBSTEVWR/dHuUERmQQewEYrXNycrqB5V2bLkpu4tDtJfDHtZQxTQHKrqmc
         18Y4oSMelvgYr4obxNFpurT4tmg5aOK5w+5SfM944Md3FbFFGIOgKgahabTtgZN6hU4i
         Uu53Qc8gXTX9bG9dl/7YPrAzuZYnfik+v7aFKetbXhXbUQ+wDVqf6MpUphQ/Vf3xXzxV
         zaJ2YDR0xvgY7MWyZVKguI6RR2lTZuXj7vKihi8XsyNBDaUQOZg2pFw8HekV/ZQDU+np
         yr8q7KL1Evt6CgsHcIESGx4vUXzflilZxR4AOY3HJzIsh9FWIzHVVZzLPiCpAXlIwC3o
         bUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714181784; x=1714786584;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DNCnVj1Y2/lmMmkRb2EKBZBX4wqTajwlwp5m2yeDx44=;
        b=TfniseEuK4arqlf1c3EtpQP5UhfOal/oeTiq0HHd45yoAzbyb/5H8qThJCgYnyKADi
         Enzpi2eJBKMfrDbOcoD9y/la5A9tMldfc8E1ISiII156LgdNb5pr6tgpBj1TFDzcPiTE
         ohZPzhFXIi9H70qui0ozyg5QGjerYl1X7epMeunMGN/03/jB3YF+E3Mba27WhacSU3YN
         f1c4EV8Gszqmh/NZ56nQf2YSIe05QZYtkOALuYqPztXSpx0RjDKy2KlEMSAw9rXouX9d
         TDQ1fMk5x+FTQ1PiNyoHkgmGJEEFfYrsN7kzuS/DBYZSzNbBX+0wRKKawUC92uJW6Quo
         FneQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGlu5adDwCZpgGrNCx9swm+u/LgCTq3V1RdZ6tpQyvvXw3qIWhgfv/vRZIbQSmf8V4XOGpwXHRqxnQ4lU8unIKtegsLmqMNTM9vmQWMg==
X-Gm-Message-State: AOJu0Yx4m/gJzUmBUm+Zl4Pd/6Je2HbULzjRuYSFL2TO7IT4D3wyAtX5
	+jRpim9ynNGKnzgvty5xoRjuR/lUIJLnm2VVgJgIDIKZi9Cm+l/N5fn7QGmb/846NjKiSjoC8Y9
	1eHWBr3Hhwo4IcH8cCQABjXi3FXxgVEYX34EHpw==
X-Google-Smtp-Source: AGHT+IFisVSHK3bri2d3dp8z+/w4P0d7YMFifFNKBTl5xkxnQFIHLo94xPnn1vjQbgMSAcY7JL1avzEt2+BlPwPhBn4=
X-Received: by 2002:a05:690c:630d:b0:618:9353:1023 with SMTP id
 ho13-20020a05690c630d00b0061893531023mr5892671ywb.17.1714181784203; Fri, 26
 Apr 2024 18:36:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240424-qcom-pd-mapper-v7-0-05f7fc646e0f@linaro.org>
 <20240424-qcom-pd-mapper-v7-6-05f7fc646e0f@linaro.org> <f1ee1fc0-64cb-5610-db92-3a06d477e8b8@quicinc.com>
In-Reply-To: <f1ee1fc0-64cb-5610-db92-3a06d477e8b8@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 27 Apr 2024 04:36:13 +0300
Message-ID: <CAA8EJpoDuKyy2_7Lwih6gLW3UO4sduV6Fun6RSzJg6RHSHgMsQ@mail.gmail.com>
Subject: Re: [PATCH v7 6/6] remoteproc: qcom: enable in-kernel PD mapper
To: Chris Lew <quic_clew@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Sibi Sankar <quic_sibis@quicinc.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
	Xilin Wu <wuxilin123@gmail.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 27 Apr 2024 at 04:03, Chris Lew <quic_clew@quicinc.com> wrote:
>
>
>
> On 4/24/2024 2:28 AM, Dmitry Baryshkov wrote:
> > diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> > index 1d24c9b656a8..02d0c626b03b 100644
> > --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> > +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> > @@ -23,6 +23,7 @@
> >   #include <linux/remoteproc.h>
> >   #include <linux/reset.h>
> >   #include <linux/soc/qcom/mdt_loader.h>
> > +#include <linux/soc/qcom/pd_mapper.h>
> >   #include <linux/soc/qcom/smem.h>
> >   #include <linux/soc/qcom/smem_state.h>
> >
> > @@ -375,10 +376,14 @@ static int adsp_start(struct rproc *rproc)
> >       int ret;
> >       unsigned int val;
> >
> > -     ret = qcom_q6v5_prepare(&adsp->q6v5);
> > +     ret = qcom_pdm_get();
> >       if (ret)
> >               return ret;
>
> Would it make sense to try and model this as a rproc subdev? This
> section of the remoteproc code seems to be focused on making specific
> calls to setup and enable hardware resources, where as pd mapper is
> software.
>
> sysmon and ssr are also purely software and they are modeled as subdevs
> in qcom_common. I'm not an expert on remoteproc organization but this
> was just a thought.

Well, the issue is that the pd-mapper is a global, not a per-remoteproc instance

>
> Thanks!
> Chris
>
> >
> > +     ret = qcom_q6v5_prepare(&adsp->q6v5);
> > +     if (ret)
> > +             goto put_pdm;
> > +
> >       ret = adsp_map_carveout(rproc);
> >       if (ret) {
> >               dev_err(adsp->dev, "ADSP smmu mapping failed\n");
> > @@ -446,6 +451,8 @@ static int adsp_start(struct rproc *rproc)
> >       adsp_unmap_carveout(rproc);
> >   disable_irqs:
> >       qcom_q6v5_unprepare(&adsp->q6v5);
> > +put_pdm:
> > +     qcom_pdm_release();
> >
> >       return ret;
> >   }
>


-- 
With best wishes
Dmitry

