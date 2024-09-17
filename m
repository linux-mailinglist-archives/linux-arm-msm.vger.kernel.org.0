Return-Path: <linux-arm-msm+bounces-31926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A93997B225
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 17:47:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFB1F1C24A12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 15:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FDAF15C148;
	Tue, 17 Sep 2024 15:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9eXdJni"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6BD18B46A;
	Tue, 17 Sep 2024 15:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726587043; cv=none; b=Csw51XsE9lB0fKMKUvdT38HubOUUYhzJhMCTSGhCQHb9j/oEazEuD9ZbuFiZ7l7uPJGqQjiAjyWEdcUpAdU+qi3iAr6VnkqJKP/BvzKqpJNCUc/Kh2+paR6Qz2URLijlCMLuAn2lDVAUMcbCKt+IWI2zFX2Nom2S1tUMoKWAHmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726587043; c=relaxed/simple;
	bh=OJzTjkSK+iJo8xCS+hitRPETuIrLbA19oFp+chpHtSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fLjjMv5f0C52fBUTPF8yz+ST6pBlxz8TTiR+wYL8J9FAA01ODrQy5tkMeHYk8+QHj8XyGfOtQKIXw/cmhWTGgI2yeOtfaslPr1yYYChixlPp9w2hfvYGb5+GfXBvBng10xXJwhUjZ2VJnh5AV0q6zZh6lClVl6Mcg8egz2v16ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9eXdJni; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3a0979cc639so14728615ab.2;
        Tue, 17 Sep 2024 08:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726587039; x=1727191839; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPW/AgdMn9HEEBlCh+UVWWKGsOQrfUimterFynorjKM=;
        b=Q9eXdJniOmSN4H4x+nHL1yHX8PwOBY0Wh9IKylMHv3ny5o2Lc30NocvM8odO/pMpOS
         b8P1fvxyYFJ+vZtBckuhPdEaGaGtC/XfHaN1vFI0HEaH9pLN/CL3Rey+iPAEDjmbGWEP
         tA6gDvvT2WLMq/l3BUFQCUimNRiGW0AIQ90l32TRRaHhZt9pms2bWvTtFErybpQXmFTc
         28G45Y9lZTiE6p5FXAs4u1DtlV38uqViYFBrmTdkqLbk729A357u5p4VKp81luDokZTC
         i8I2+SZrKtgeaXNI3Jf2VqK/uyKGLoV3/YaxBGBvEE9OZXT6gdrYFgSpT7n466NuFuP+
         9I/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726587039; x=1727191839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPW/AgdMn9HEEBlCh+UVWWKGsOQrfUimterFynorjKM=;
        b=Yi9mDBqd6P+qlw3A3vtSaGAFdELHdlkuKnd/1dPCF0WtUKoR1/NyNKsnWStIBPvVGw
         3XFlEiiXFzkPfimAFiTOQhWq3h76mQktB5Y2e6qBBwxPY4CoJg95TLH3jb4B9AHcNk+p
         QZHlvPMG64jIZkuXdf+SfDhsnCJbAzNroKzAjCCWEfIsAuz2rGgc1YNXhwmopiYeLY96
         3DLeJHnpxmC6zEtpzmc3Vl1Cc9rZ7lXXSFoY0Q/A7qW03bhRTMYQxQqh487EoJ8hyoDZ
         QGegE3sbFXC/eqQowQ9IbAFKgCFMYWlhORCWlktYxsyQfzkTfMvgm7pjI7LEjQ4kwEjD
         vRIw==
X-Forwarded-Encrypted: i=1; AJvYcCVFFi4F3nNEO5Qo7IaqKt8vPERR7prAAeBwY35gLQA3yQL+4HcNKxPztnPaFGUkJB2uRMvra3qExJVqlVdb@vger.kernel.org, AJvYcCWEXg36J7y//b4ixqArfNL/ckGKl07mPHdQ24rBtIUabqBcNk+3FCbB3u90iNuSRdO25v3inNpVz0GbtVHD@vger.kernel.org
X-Gm-Message-State: AOJu0YzR2sE/Dins54WEVn9j81EdV+SjPLmvzq97mpnFU3xRp9d0NQvL
	vMok2US843yAkVMMPJxV8VUxVpYNrxLAwOcFZJF3+6F16j4N6BUs1aqiYFAgpquDgNDcLRRHO1Q
	DN0vNUSfqGp7yoCve1KgFyl9E/Ns=
X-Google-Smtp-Source: AGHT+IFnQfX2Dm7t85FaLReCnsm/k3IVJHP6S0jDSauS+A3CY0LNPlrSmf9NZpTDLnGuUiYPAko0KJRt85OCKIPoMnY=
X-Received: by 2002:a05:6e02:5a9:b0:3a0:8c68:7705 with SMTP id
 e9e14a558f8ab-3a08c6877c6mr117243125ab.21.1726587038839; Tue, 17 Sep 2024
 08:30:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913195132.8282-1-robdclark@gmail.com> <e6991910-5058-4ef0-bfdf-6d33953535dd@kernel.org>
In-Reply-To: <e6991910-5058-4ef0-bfdf-6d33953535dd@kernel.org>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 17 Sep 2024 08:30:25 -0700
Message-ID: <CAF6AEGvgS-DD0+qGX_Mud75aES4AQQjmWx2j2gyz7uakTpnp0w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx+: Insert a fence wait before SMMU table update
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>, 
	Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>, 
	Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2024 at 6:47=E2=80=AFAM Konrad Dybcio <konradybcio@kernel.o=
rg> wrote:
>
> On 13.09.2024 9:51 PM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The CP_SMMU_TABLE_UPDATE _should_ be waiting for idle, but on some
> > devices (x1-85, possibly others), it seems to pass that barrier while
> > there are still things in the event completion FIFO waiting to be
> > written back to memory.
>
> Can we try to force-fault around here on other GPUs and perhaps
> limit this workaround?

not sure what you mean by "force-fault"... we could probably limit
this to certain GPUs, the only reason I didn't is (a) it should be
harmless when it is not needed, and (b) I have no real good way to get
an exhaustive list of where it is needed.  Maybe/hopefully it is only
x1-85, but idk.

It does bring up an interesting question about preemption, though

BR,
-R

> Akhil, do we have any insight on this?
>
> Konrad

