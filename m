Return-Path: <linux-arm-msm+bounces-10169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D9884DF4F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 12:07:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED48528ED96
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 11:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EC6E6E2AC;
	Thu,  8 Feb 2024 11:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bKrdyjPV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C206DD07
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Feb 2024 11:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707390268; cv=none; b=STLwZEOgCqCH0TX5pLe2BIYc8hGPpzOzk2/n7i3pQgmZVLSX4HmbtF3Z/tD5f4L6Wq2iMSy6HAVmvyhSbQfTaiWYkGC+UOkKSSdSz5EaLavyQYdi1pcK1nEJaVds8kR2xuVt3Qnksk5qDd5khIWsk6EdhtdkwZIeGU55kSsovSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707390268; c=relaxed/simple;
	bh=M+dRcp4Mdg3swizMqeWm8YTp95g9PXZ/wHhoSa3YnNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HyGwUSYsRQSo54Qhz5shf159orvYoSyuWbC/vqGP6QSyKLJ2quGJ9l5woWwlbxFCCOaP62EM9XFbhRgg8o+B61AzYPXX8OrOnRwfJE5UI0jW4iXV5XU25wC4gXkZ9VjwApRR5iXOcnUopB28xsvkOJ99EP9hz5YXhPe6rBmeYKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bKrdyjPV; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dc6af9a988eso1365316276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Feb 2024 03:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707390265; x=1707995065; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E20n7hLeTsUtRZUlgw3etseFcnhWUpdK3reOyYMqK5E=;
        b=bKrdyjPVW+/8ztLhVFJ5J5j8My1PmgpxfYr4pvL14Kx9cdV8qRajmh+ebUTwMIqnKc
         /U8ZbT4+2RQtER1Q7Hdoy04dL9jzsZOj2GLz/6F5rqmCtgYeoUQkwiro3r7GXdhcc4tm
         CmVThu0RtU1IvdtcooxLHyVB5KAvmln349KEw8LWrztc/xeZkCF17+kwHuDhBxK3Li7G
         uq/VL0ChQOt/Za+Wq3Zdp+J+NrSJNQhWW34FDynHLzm/VsGzWwqp6J6v8S2mJlEAAhJB
         gLtGz8ycvLvZzk6M5sWnvET9iZHBb7F4RvgYhRJ1viOm5h4/mRkAaCXY7OrCY01bnkxt
         mijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707390265; x=1707995065;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E20n7hLeTsUtRZUlgw3etseFcnhWUpdK3reOyYMqK5E=;
        b=ubJ6zrJp6FG9qemqqYm9wejzAFgBvlsv2dQFSE2OHM9BrT/be8LoNkTRhqFHUhiOE8
         e5DWxMKY+WScHFENrm99EVPTDckmsW5A75WuhZfcdm0L+mKciYYe5EsCjiHYEto7z0U2
         m2y3Y7q7VLHUyuA/WJQ0qJlT4yGuVrLIYt7eJTocXOst9jBzWplELDho3d2r2hdSgNHq
         VlA1tg9DI/LpdWfptBFUVwCBkCu/+o8Afbm4mhr0r+MZoxmEu0LBcIwS8V74ji/mhpWI
         UZx4u5TxS6PHwbl0uSevAQLIG119P3F+ribBO9xDN1uEQdyUm83Zo4Epidgkdq6aSkPS
         S57w==
X-Forwarded-Encrypted: i=1; AJvYcCW5hS2exVaxhAyX1NaKLe+7OvHr6Pubr+JRxOAltBLwanUZADWETAjl2jiMFsXO5NdUV8kI42VkkVemgI0KrRSnNG1rGxAprwwZftuSxw==
X-Gm-Message-State: AOJu0Yw8oKcMWKkhdXCKeXpOsqDwm1FrM+sU4tSPtXNw+GsnEZZb5Fer
	/R3YHMNshPBu5saNgPmZxFe6wuZ0yzecTBXqcqovpNCBF0iAWhk3xywXitAiE3jwXgD4xQQIm39
	2tAK/kwoM2dyMUMa3h1R4hENJa0xnmeONU8u8+g==
X-Google-Smtp-Source: AGHT+IGH6rdGfZLnWOM4BwmqKZJ//O8CWQTsF9VAkaFLM7YEQKP6ujHgl3G6xP1O6Q/bGTCGVocyNtRUwa1dAw1KBgM=
X-Received: by 2002:a05:6902:1243:b0:dc6:c2b2:c039 with SMTP id
 t3-20020a056902124300b00dc6c2b2c039mr7995213ybu.41.1707390265487; Thu, 08 Feb
 2024 03:04:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240201101323.13676-1-quic_vdadhani@quicinc.com>
 <CAA8EJpqQtHDRK2pex+5F-fMRTosJuFCx59e89MWhnie1O3dHKA@mail.gmail.com>
 <60b5e755-352b-476d-8c6e-2170594ae80d@quicinc.com> <uswznu3h53gcefpdc4vxozz32ecdcjvzmr7admwc4h54o27bfy@qqoevrl3dcyt>
In-Reply-To: <uswznu3h53gcefpdc4vxozz32ecdcjvzmr7admwc4h54o27bfy@qqoevrl3dcyt>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 8 Feb 2024 13:04:14 +0200
Message-ID: <CAA8EJpqzdp4xYSp+JCExP+Oeu9KhLpsXNUbDxfZ0g+C07xR6dg@mail.gmail.com>
Subject: Re: [V3] i2c: i2c-qcom-geni: Correct I2C TRE sequence
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andersson@kernel.org, 
	konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, vkoul@kernel.org, 
	quic_bjorande@quicinc.com, manivannan.sadhasivam@linaro.org, 
	bryan.odonoghue@linaro.org, quic_msavaliy@quicinc.com, 
	quic_vtanuku@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Feb 2024 at 12:02, Andi Shyti <andi.shyti@kernel.org> wrote:
>
> Hi Viken, Dmitry,
>
> On Fri, Feb 02, 2024 at 04:13:06PM +0530, Viken Dadhaniya wrote:
> >
> > On 2/1/2024 5:24 PM, Dmitry Baryshkov wrote:
> > > On Thu, 1 Feb 2024 at 12:13, Viken Dadhaniya <quic_vdadhani@quicinc.com> wrote:
> > > >
> > > > For i2c read operation in GSI mode, we are getting timeout
> > > > due to malformed TRE basically incorrect TRE sequence
> > > > in gpi(drivers/dma/qcom/gpi.c) driver.
> > > >
> > > > TRE stands for Transfer Ring Element - which is basically an element with
> > > > size of 4 words. It contains all information like slave address,
> > > > clk divider, dma address value data size etc).
> > > >
> > > > Mainly we have 3 TREs(Config, GO and DMA tre).
> > > > - CONFIG TRE : consists of internal register configuration which is
> > > >                 required before start of the transfer.
> > > > - DMA TRE :    contains DDR/Memory address, called as DMA descriptor.
> > > > - GO TRE :     contains Transfer directions, slave ID, Delay flags, Length
> > > >                 of the transfer.
> > > >
> > > > Driver calls GPI driver API to config each TRE depending on the protocol.
> > > > If we see GPI driver, for RX operation we are configuring DMA tre and
> > > > for TX operation we are configuring GO tre.
> > > >
> > > > For read operation tre sequence will be as below which is not aligned
> > > > to hardware programming guide.
> > > >
> > > > - CONFIG tre
> > > > - DMA tre
> > > > - GO tre
> > > >
> > > > As per Qualcomm's internal Hardware Programming Guide, we should configure
> > > > TREs in below sequence for any RX only transfer.
> > > >
> > > > - CONFIG tre
> > > > - GO tre
> > > > - DMA tre
> > > >
> > > > In summary, for RX only transfers, we are reordering DMA and GO TREs.
> > > > Tested covering i2c read/write transfer on QCM6490 RB3 board.
> > >
> > > This hasn't improved. You must describe what is the connection between
> > > TRE types and the geni_i2c_gpi calls.
> > > It is not obvious until somebody looks into the GPI DMA driver.
> > >
> > > Another point, for some reason you are still using just the patch
> > > version in email subject. Please fix your setup so that the email
> > > subject also includes the `[PATCH` part in the subject, which is there
> > > by default.
> > > Hint: git format-patch -1 -v4 will do that for you without a need to
> > > correct anything afterwards.
> > >
> >
> > At high level, let me explain the I2C to GPI driver flow in general.
> >
> > I2C driver calls GPI driver exposed functions which will prepare all the
> > TREs as per programming guide and
> > queues to the GPI DMA engine for execution. Upon completion of the Transfer,
> > GPI DMA engine will generate an
> > interrupt which will be handled inside the GPIO driver. Then GPI driver will
> > call DMA framework registered callback by i2c.
> > Upon receiving this callback, i2c driver marks the transfer completion.
>
> Any news about this? Dmitry do you still have concerns? We can
> add this last description in the commit log, as well, if needed.

I was looking for pretty simple addition to the commit message, that
links existing commit message to the actual source code change: that
geni_i2c_gpi(I2C_WRITE) results in the GO TRE and
geni_i2c_gpi(I2C_READ) generates DMA TRE. But I haven't seen anything
sensible up to now. So far we have a nice description of required
programming sequence in terms of CONFIG, GO, DMA TREs and then source
code change that seems completely unrelated to the commit message,
unless one actually goes deep into the corresponding GPI DMA driver.

-- 
With best wishes
Dmitry

