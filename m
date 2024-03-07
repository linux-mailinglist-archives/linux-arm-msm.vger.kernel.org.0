Return-Path: <linux-arm-msm+bounces-13639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A56E87592F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 22:24:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A66261C20E46
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 21:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5141613B7A2;
	Thu,  7 Mar 2024 21:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F7ICLbZE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE4A13AA2F
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Mar 2024 21:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709846655; cv=none; b=MDnHZP6YWOsfx9HE6zJwDqUihnr3u/xNeL9OPkWE3374kiWrrJt0nktNrgXN86MB8mC7EVn3vWI/R1m4lIDJUMAFKXoCuS0mVm7SktB2oAvOXC81rsLOvTmTQue4VCAbz03/cFAKnGPX5dI1PfBPvmkT1fdWFF7cPBeScsv2kqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709846655; c=relaxed/simple;
	bh=XhLpJmKl8D67t5fVzFGtRUMDvdKFUlQhaLIrJCBuf50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ltH8q3mdmaXwa3cdPexiNw9a+5XKDZ7tP9Iz5BJlQZ0dWm8Oq2zbc0d5JdFnvQI55MOLmLrpP+1OyXK8fIJn3jvyZ5Iit4zS63G/JxUSmeS3k+BwPQsnnWMLiAp8CbXf07/sr4Wy9YZOQybFP+aqmH6OcOz1hLJn7yG7tKZthjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F7ICLbZE; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc6d8bd612dso1415935276.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Mar 2024 13:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709846652; x=1710451452; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8Lcyhwp0hIu6sGE2SbZMpxEJNdbFhr0oYQvghcO+6Mo=;
        b=F7ICLbZEgwjVHbluNp+5edKKrOv74ynP1U1dSsvvYIv0+lIXlH2LRS1eQ8IJuMpLdn
         FDySmb8/P0sgeswHZ3c7WAIGTbPeV9UN8V1DOa2nxobKYWTMMYykyk0dxYR8vp7EOMmI
         igmiVGK2ulQi0RTHCctZM0l2U4UxKZEqofBf4RAIzunff1GBOPNy/JeA6b3fXFYVilXC
         FjBa9mcAntvCVMIl/+iVzuzFXggt6tRYx+zBiJTdS0pIU0ytHNti+VeMssUmWAnOjiFd
         sjAibN13vtQPu9h41Q/GyUo7FEvtm3pJhbrnbdkJOjEYTiS5+hO0/fybJx6lRSNuXt46
         3PrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709846652; x=1710451452;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Lcyhwp0hIu6sGE2SbZMpxEJNdbFhr0oYQvghcO+6Mo=;
        b=wX8nUGth+lVXxNMjcR16Y77T7TvYOUYNSlN9GAblG8tGr0uaLJ7wzv/peyquHnpVp8
         aOQRQ3zmfbJMFvVJGwcBV/POST8TmYh2k4h64jzd2Xfs7WPe1+trYVfvSnxXwzmLXuiX
         hsNA14iFhXIC7z7QXmnWTKVafV9be01z/D44vXgcE3LAPhp1ljtBeA9D4sIIP2kjf/na
         31d4+NByp2l2QyQzHtQkMSUJ6XCJI8sdWeZXlKbr1dZhK6j8k81uRft/IeSNqP8ujSt0
         VwloUZICmgWZ4N9+TUoWcGzKgZPtHCFQ4ZtN1vPNqO8y6zKOq4F2NKaopTRANezJSHV/
         EG5g==
X-Forwarded-Encrypted: i=1; AJvYcCXIkutxtnP3QZvDjIgzE3dUlxUo0EJu9aI6mL2vUhnr4w0pHZhiikfAiYuIHvCd8fsIoolaKGVGBolMgtK+upDLByNENaF04pv+zm3d8w==
X-Gm-Message-State: AOJu0YwRpYNnuxVsTsTCo9TvRFAgOg+dU4BNrkiAFNtR953aZ3O6TNoi
	Zgk5O7iUiBa81vBLuGwE01Mvuh7F259XgPC9vLepa67VaELJ36hMmd8NLEpdi1SIgugJ5ioZKK2
	Hnt1IfbP+90jXxOfK36sBRdRZAl93umNCb+QpLg==
X-Google-Smtp-Source: AGHT+IEZtKFfdvbPeUIrxS4XVLFE0P6vhrrsUowaIoDUL/3Q/uJbZtYQ3BrtlJvKHCcrPgR/wDY1Zvui/M/y85sx3Vw=
X-Received: by 2002:a25:dc12:0:b0:dcc:a5dc:e9d6 with SMTP id
 y18-20020a25dc12000000b00dcca5dce9d6mr17330947ybe.30.1709846652482; Thu, 07
 Mar 2024 13:24:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240307093605.4142639-1-quic_msavaliy@quicinc.com>
 <CAA8EJprndszVSjAVs_UzAjhb+x1B1Of4JCkygZ=8kgzuY2RwCQ@mail.gmail.com>
 <25ec87af-c911-46b7-87c9-b21065d70f9f@quicinc.com> <CAA8EJprky=tFjJbGTBL7+9E=kqxQKjxB_RcmzHUt31GqUVfNmQ@mail.gmail.com>
 <eeefab74-1303-470f-bd3c-618d9522d24b@quicinc.com>
In-Reply-To: <eeefab74-1303-470f-bd3c-618d9522d24b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Mar 2024 23:24:01 +0200
Message-ID: <CAA8EJpqt5H03P-FkpJZCE-9N4=qnd9v+LxcehZmfO6xFz0w9UA@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI mode
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: konrad.dybcio@linaro.org, vkoul@kernel.org, andi.shyti@kernel.org, 
	wsa@kernel.org, linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	quic_vdadhani@quicinc.com, Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Mar 2024 at 22:58, Mukesh Kumar Savaliya
<quic_msavaliy@quicinc.com> wrote:
>
>
>
> On 3/7/2024 8:15 PM, Dmitry Baryshkov wrote:
> > On Thu, 7 Mar 2024 at 15:46, Mukesh Kumar Savaliya
> > <quic_msavaliy@quicinc.com> wrote:
> >>
> >>
> >>
> >>
> >> On 3/7/2024 3:23 PM, Dmitry Baryshkov wrote:
> >>> On Thu, 7 Mar 2024 at 11:36, Mukesh Kumar Savaliya
> >>> <quic_msavaliy@quicinc.com> wrote:


> >>>> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> >>>> index 1c93864e0e4d..e3508d51fdc9 100644
> >>>> --- a/drivers/dma/qcom/gpi.c
> >>>> +++ b/drivers/dma/qcom/gpi.c
> >>>> @@ -1076,7 +1076,17 @@ static void gpi_process_xfer_compl_event(struct gchan *gchan,
> >>>>           dev_dbg(gpii->gpi_dev->dev, "Residue %d\n", result.residue);
> >>>>
> >>>>           dma_cookie_complete(&vd->tx);
> >>>> -       dmaengine_desc_get_callback_invoke(&vd->tx, &result);
> >>>> +       if (gchan->protocol == QCOM_GPI_I2C) {
> >>>> +               struct dmaengine_desc_callback cb;
> >>>> +               struct gpi_i2c_result *i2c;
> >>>> +
> >>>> +               dmaengine_desc_get_callback(&vd->tx, &cb);
> >>>> +               i2c = cb.callback_param;
> >>>> +               i2c->status = compl_event->status;
> >>>> +               dmaengine_desc_callback_invoke(&cb, &result);
> >>>> +       } else {
> >>>> +               dmaengine_desc_get_callback_invoke(&vd->tx, &result);
> >>>
> >>> Is there such error reporting for SPI or UART protocols?
> >>>
> >>
> >> Such errors are not there for SPI or UART because
> >> NACK/BUS_PROTO/ARB_LOST errors are protocol specific errors. These error
> >> comes in
> >> middle of the transfers. As these are like expected protocol errors
> >> depending on the slave device/s response.
> >
> > Yes, these particular errors are I2C specific. My question was more
> > generic: do we have any similar errors for SPI or UART GENI protocols
> > that we should report from GPI to the corresponding driver?
> >
>
> Got it. Reviewed and confirming that UART and SPI GENI drivers doesn't
> have such error bits unlike I2C, it simply reports transfer fail OR
> success.

Thank you for the confirmation!


-- 
With best wishes
Dmitry

