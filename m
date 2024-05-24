Return-Path: <linux-arm-msm+bounces-20386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 390B68CE340
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 11:20:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CADD91F22E87
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 09:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB69E84FAC;
	Fri, 24 May 2024 09:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AasbsFK8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CA984DE6
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2024 09:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716542371; cv=none; b=oUTeLZ7YMJmRBYqTY4lz1u8XET6Z4xVVsV9A2rJrRqjIEZz1pmUzvr4sBAaaa5ZPvN1O2jisRuF3/0Q0gR9cqTqk47upiSU0+00Hb6AOO9vCEZxQ700LAzoaOvjI+qgqDDD+fU6OVgSZEidAZvKLJVPR2AhVIedMoB+SVOIvbdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716542371; c=relaxed/simple;
	bh=S5WIHfo/GVVFuV2a8N3J3V/bskkP4vgyxo9cxv7VQAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZHi22atNYCwrMhGK+JFV9aLz16qhFParr3xTmcMc78TZeWDqVHLb6823MOQqK2p+aNfJzLLz2eTGnf6wCP1MIGbpqig2Jl/M4SdXuEvRiPmMxnBC28kczDYlJTgAxy/vfVscSl1JF6g2KgASjKwrCaD2ol63rSAiniCugi2Sz3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AasbsFK8; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-df4d60c59f7so3162101276.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2024 02:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716542369; x=1717147169; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BFC/Wq6r2ZnocxgGVbxbRurbvlwJyoIDrYIsqw3lJqc=;
        b=AasbsFK8Mt/PBkyaFq4wDhGGCDNTzpxMQ1Mwa29niqtT3epguk2PVIEfb9sc3EadZP
         FklJq+xk0xVWrT4Oc7bdebK+3oHdLd0476OGs+6I9Tl6C+tslihGZZjAA8jurcuO7S0E
         WPvda+m4XLP+XP4E9CGlLt2qTM6nthiWNjd8k4HVi/EnK7Ouf4dywmuElXhqbyHKgqgs
         BUb67NX40RL9ApGWYisP4HvOAocfawqNpguvbSGYvgJerlevu1vlxKAUyD8qsV7wkU0E
         jyrJoiGUNr/PyPc0Dqu6L/MXrvX11cdH3cpGY6Iigvu8GwMDeViM8r3Xf9bF9E8uIvGv
         e7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716542369; x=1717147169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BFC/Wq6r2ZnocxgGVbxbRurbvlwJyoIDrYIsqw3lJqc=;
        b=g9jTMVShspc69Fnqn5ha8dRUg5kuquCPddxaaZWCSaOrJNSwYqchCSJtJPFUkU07/o
         eDUtN7ZVO9xwjQ89IGjEiKPGC+d9wR11nl7S0CGxQoIG7ymPt836OxOFjji3K9cErAYn
         illtqBz3J5K1dT8mvAT4HcOxPnh6y9I/9d32KQ9GGp2WMKxB74rFKd/8FzhJ6p1xg8Zs
         tDRloSLNCHfOp7R9g3RnXyIPtusvinHwTb5ordIH8VDUkRpqO2Lvp9qUFL7wp1J9Ko3w
         UN6PwyHhxCAk7huN6IFRiXoSDwYiy1AoGVzhjFvfLxZMKI5U8H3Qt3jR4HIzgMQHkN1E
         OZcA==
X-Forwarded-Encrypted: i=1; AJvYcCX+ez94pjZQztay2fyIy3nl6d8yvXrV4mjQ3bOChi7fnU53y0d4QqlhCJ18GmI5zn05yfZib/EBJwesYzD5Q85SmbCPlPtK3ehzHlib5Q==
X-Gm-Message-State: AOJu0YxCOavfmUWl0aOwjKbrIwBkQd99IMeUKJiN3kumLtpuHZr5gF1W
	TSyyUMrLe93mrynkzGui9LtE24tts4kTc0JGVER8wxtNz1gVt1a8227U8F8jQ72fRCmQzgQ5x3c
	T4EikDsE321M2Nx6uMaalCc4zHYGS9IuKrDJ8cw==
X-Google-Smtp-Source: AGHT+IHQOGkX6tTv+H0dG9M4HcslJIDthMVJK/fTaxTSoTTh7UEYLllN3SvzcSDRZhpNnspLGW/VvYGgTEt21HlMSwo=
X-Received: by 2002:a25:adc2:0:b0:df7:695a:1cee with SMTP id
 3f1490d57ef6-df77221c3b5mr1532190276.50.1716542369346; Fri, 24 May 2024
 02:19:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240524035350.3118981-1-quic_mohs@quicinc.com> <865adb41-fd27-d303-5f0f-a68a814f41ab@quicinc.com>
In-Reply-To: <865adb41-fd27-d303-5f0f-a68a814f41ab@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 May 2024 12:19:18 +0300
Message-ID: <CAA8EJprDb0fk0G1wrzB99EG=HAm5tw1Mz=mSd5mDMptDOoUb2Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add support for QCM6490 and QCS6490
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_rohkumar@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 May 2024 at 07:06, Mohammad Rafi Shaik <quic_mohs@quicinc.com> wrote:
>
> On 5/24/2024 9:23 AM, Mohammad Rafi Shaik wrote:
> > This patchset adds support for sound card on Qualcomm QCM6490 IDP and
> > QCS6490 RB3Gen2 boards.
>
> Please ignore this abounded patch series. No need for review.

In future please use a logical prefix for the cover letter too. This
helps other developers to understand whether they are interested or
not.

>
> Thanks,
> Rafi.
> >
> > Changes since v1:
> >       - Use existing sc8280xp machine driver instead of separate driver.
> >       - Modify qcs6490 compatible name as qcs6490-rb3gen2.
> >
> > Mohammad Rafi Shaik (2):
> >    ASoC: dt-bindings: qcom,sm8250: Add QCM6490 snd QCS6490 sound card
> >    ASoC: qcom: sc8280xp: Add support for QCM6490 and QCS6490
> >
> >   Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
> >   sound/soc/qcom/sc8280xp.c                                | 2 ++
> >   2 files changed, 4 insertions(+)
> >
>
>


-- 
With best wishes
Dmitry

