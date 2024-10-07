Return-Path: <linux-arm-msm+bounces-33407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C86FC992FA2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 16:42:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7414DB208D6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EAD91D4159;
	Mon,  7 Oct 2024 14:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CBTSsIBD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A900918BB90
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 14:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728312155; cv=none; b=X7FiNSjelEgbw85LNXZ9r6zrGWfRadkv0H1brOzuowFaVMT5HyOeBiPhT9+XFyXiznLua51zOJjdy71Aj65qU4esHCKc4MKK3k7ftFBdvFHiJSaYDxeAhHk+H7DaDTfC6g9jjPTSGOsty4yjmyuu15GHJIWvr+Yj5daJibhteIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728312155; c=relaxed/simple;
	bh=7+PUGisIgdPujtqbJDkydZ+R2/by8q6Rd45lfxEcTJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S9Cg+locK92PECEKrG/IiltEpgEMkZSqu9ITsAeIjbaEdhU4uaEiCQCVZYGzrMOXE/cq4ke1SRv60p/yrUuSWKdmpivaT/Y15dKGN+lS9+cjO1rSYYYI9aIqAEBJYt1O70GiwvbU16IPnuwRDtc5jw5IjCqm62cZhAnRcAAAvjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CBTSsIBD; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e2e424ab49so13334627b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2024 07:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728312152; x=1728916952; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OQVz0vOtE/vhE4JxfRN39I/kekE4gMvxJaTmqdYN4Hk=;
        b=CBTSsIBD09AH0zmL+BdQcIHiQwCnF9IOSODocRRF83oVMOO6D3WTeoHzKQDmAbjS2K
         kNsd1egW74s5FBmZj55qp/eKyu//VwMF94LaE22jyHEOcwvKHrc+JZF2KdKmx/eG/FgA
         kVXmD6aegLhlKo0E+y/X7xInpTU9Up5DFfHuHcJTuMpILwExzx62DL9x2EJ5/tYQeSaW
         qLm96/SUIyxNcwCDCUuIFdJYdtAuww7kIKhYiWnAz2FlflnvLWAQRZZ2Rh8bIj2UuQsv
         CCvpdTey/E7rF5eefimDZJPzB4rHkB2jfFoIwwVqChElDxzqkc55rZR65XNxdh5oyPZC
         pVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728312152; x=1728916952;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OQVz0vOtE/vhE4JxfRN39I/kekE4gMvxJaTmqdYN4Hk=;
        b=R9WDvxVVVVYQndfv73r9WDPmCbGsG5ITecUxxwtSo5rhwtBbpyyW8z9eyQ4acktdPE
         iJufZ7VA2w2YsKognoGOdbTsiMg42uwg3MJbEGe38XCem1J0XVQNkd74W04VohZyj/Y3
         WNizUX+lSXa+iH1eYhuzytICbcv3bU6UI2epgdJJIax01bcZH5JezP1JcoYxpFp4GG1H
         yliE/VcFR+i2RzoOW/U6b6kx7jDeS1rmBX7xFHmiszk0EezL6LZUwKTWycstpjiAUcnt
         HU9kp0mPlPux+PENh4fvAS02CAZKs8uWw9HjTR5FGzMAddyY+j9o6ypHnX5IxCgke+E0
         qDog==
X-Forwarded-Encrypted: i=1; AJvYcCXSA+MQaW6IPSLDXM+XfV1uxiJ1T2M0jj+5fhkd9j9FYxRII0VWXOcCRq+tPnPXMdKzAmUFxF1UtCOu3nz3@vger.kernel.org
X-Gm-Message-State: AOJu0YxvrBmQ94s7d4xYxgQ3VvF+sVFlz914yNv/ZAvZ9M65hn3Fjvuk
	rdItizO0Mr+ooODLBU3i5wKPnE7mHwQbi9Za/SDa8z9/JIEf9E1fbmT3v16AL5A/U/609hiET/c
	tvSVr12s/IYMQrzc5hgO60z77TppJGZLUAhdvID6zPFGmtegVFUcy7emq
X-Google-Smtp-Source: AGHT+IFtLx92+g4Im4BYq0IF/nuPhymbQIsBhoZ0lME72v6xi/Y1yH6ePIkFIQAOuj840/kCSHbxUC0u4ACUasl+Ueg=
X-Received: by 2002:a05:690c:6ac8:b0:6de:a3:a7ca with SMTP id
 00721157ae682-6e2c728a25fmr86622347b3.32.1728312152659; Mon, 07 Oct 2024
 07:42:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240812-tdp158-v5-0-78684a84ec23@freebox.fr> <172536721812.2552069.2889737892670833119.b4-ty@kernel.org>
 <40ffacc2-fa04-4e6d-b817-c547aa75a21c@freebox.fr>
In-Reply-To: <40ffacc2-fa04-4e6d-b817-c547aa75a21c@freebox.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 7 Oct 2024 16:42:21 +0200
Message-ID: <CAA8EJpqYp8uBNVdNSAmSbeev=itxNKS_scb2xAwe63aS5bdhkg@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] Basic support for TI TDP158
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Robert Foss <rfoss@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>, 
	Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Oct 2024 at 16:33, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
>
> On 03/09/2024 14:40, Robert Foss wrote:
>
> > On Mon, 12 Aug 2024 16:51:00 +0200, Marc Gonzalez wrote:
> >
> >> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
> >>
> >> Like the TFP410, the TDP158 can be set up in 2 different ways:
> >> 1) hard-coding its configuration settings using pin-strapping resistors
> >> 2) placing it on an I2C bus, and defer set-up until run-time
> >>
> >> The mode is selected by pin 8 = I2C_EN
> >> I2C_EN = 1 ==> I2C Control Mode
> >> I2C_EN = 0 ==> Pin Strap Mode
> >>
> >> [...]
> >
> > Applied, thanks!
> >
> > [1/2] dt-bindings: display: bridge: add TI TDP158
> >       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/887665792b99
> > [2/2] drm/bridge: add support for TI TDP158
> >       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a15710027afb
>
> Hello Robert,
>
> I expected this series to be included in v6.12-rc1, since you applied it
> before the v6.12 merge window opened. Did I misunderstand the process?

drm-misc-next stops propagating new changes to drm-next one or two
weeks before the release.

> If not in v6.12, does that mean it will be in v6.13?

Yes.

-- 
With best wishes
Dmitry

