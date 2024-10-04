Return-Path: <linux-arm-msm+bounces-33135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BD09905B7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 16:14:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43F3F1F21B90
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 14:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906F92178ED;
	Fri,  4 Oct 2024 14:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Vs++4bNy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DCE217333
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Oct 2024 14:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728051210; cv=none; b=GYZQKmnwre7p9KCeaA1H5THzfCenpEZ5vxm+reBp2PV9YqNhjF8RVurVv5+a8Gzp+/T3V2azlNzI/vo3tVZ49pRBWBnqGCWDpwI+AafG4tCpf5Xptq/ctXJ7lUsOx0ojiXXQAyE2KgPMQATayJYZyfe82mzOVPmTh+iMrbr1kPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728051210; c=relaxed/simple;
	bh=Pfr1vMoDBmbi4ivUfyNjxgf28YzEK0jBtrK+GaS4D2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aVCs/0zVbpEDn3yAGtj37g4zRvtyBeWrsg+x5jIKXUUaw7qMB/DGBjEBu2ZDkYxsRo5EqiqVUav3RZU8ZYHLCwT4lHZaycDMi5P5qVepW/PIJijz3VY8F9XpxAVg+Qg5mUhBNIDFFz8U/cVfb5CwYB71xAcLOxiOnDND7+5hObU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Vs++4bNy; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5398e4ae9efso2529268e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Oct 2024 07:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728051206; x=1728656006; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pfr1vMoDBmbi4ivUfyNjxgf28YzEK0jBtrK+GaS4D2M=;
        b=Vs++4bNyYVBnVkvWIxWozSnAn3p3FkEfcUjph51SCmhXmbBnEicAyP65Sl4iu9xldT
         3K0DNo35cSnQl3kL9A2y8A44Thv7o2Bb2fxB12h/5SHdutYMIHE+A1sy9gDLda1dPjn4
         2fKPZZFkDUg6tvLsZ7dpJrP9zXw9F2Fk8HTOdCUZbqkbSmQxkoLVkUNbJn7hrYOx7YCm
         kzIMeZzhptmGVc68unarAx4v0nlOnNZ39igA6sa7iYMORx6Xfki3zxA8UbkOq3rY6TE4
         y+qCA4JSaz6eemHDfBmcS6NkjIrCKtdHHiunXJFSNicmdu5i0PzkcYezNrN+NVzPLeTX
         mNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728051206; x=1728656006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pfr1vMoDBmbi4ivUfyNjxgf28YzEK0jBtrK+GaS4D2M=;
        b=GiUs51DCmkOxcPb2NI44/sQupmeyvfKx4vIUPl2uQGrVn6xH4gaZvROMtCziEeXfGC
         YrZq0pLgFumRwlLdRFtfjIGSgMeVUccRoZZO4J0FkP8kOCQNycQbQ2DlJk0ghBSCQupz
         Tlb0NZNKkTpMcf7LaQTJNaxhRu8puB5sdWUYJuPQEXqjQ33Dc7SU1hlOwyK1Qt5a4j8O
         IDszcyP1jgl6WMeSb3QGTTckixCHNxFU7dbrHCJ09LLCHgrhCf5KyVrpcKObuu//QV7l
         zdE4DjWV9uLFN1s6dHVWVMK30XAkhUaQP4v1fihT9OkGxWTyH1ps8WombYlLZRoW1VcD
         s9Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUCC8d4wN//AeH9Oqj01NByCYIiq4gwO9THiSYoQrNcGUB3kmkXLexaItbfWh5oEWGFv4G+EwqAhnlKCu6a@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1iRSMuxoh6UL/L9d7TNXhIg5ULehDm/H9EtRSiCeQwMMaH28R
	b7IndrMjGt9nUVVaKZQdG7WKqEzW2/eD75oXfsRA6X7xjQqUAKTNAjG4wAVNjbmIyAerlzVdEeN
	9g9S5zZpyFOww1ZBhYuc8TQOdyOR6bTZwAKWFAg==
X-Google-Smtp-Source: AGHT+IE2U1cjYMuf7S0P6mRyvPGhbqF7gOednFYaJtrFTIN1Sq2Nm7gdftzNvEVY1wTl6WsotGbsgqMpB2rdjluKgC8=
X-Received: by 2002:a05:6512:39c9:b0:52d:b226:9428 with SMTP id
 2adb3069b0e04-539ab85bfadmr1859500e87.6.1728051206319; Fri, 04 Oct 2024
 07:13:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001-wrapped-keys-dts-v7-0-a668519b7ffe@linaro.org> <Zv/0DVQNEsJPoyCR@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <Zv/0DVQNEsJPoyCR@hu-bjorande-lv.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 4 Oct 2024 16:13:15 +0200
Message-ID: <CAMRc=Mc__SzjxA_XoYcco=zLUvtbSCyWmdhx=NOXt5CGLWGK1w@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] arm64: dts: qcom: extend the register range for
 ICE on sm8[56]50
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Om Prakash Singh <quic_omprsing@quicinc.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Gaurav Kashyap <quic_gaurkash@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 3:56=E2=80=AFPM Bjorn Andersson
<quic_bjorande@quicinc.com> wrote:
>
> On Tue, Oct 01, 2024 at 10:35:29AM +0200, Bartosz Golaszewski wrote:
> > The following changes extend the register range for ICE IPs on sm8550
> > and sm8650 in order to cover the registers used for wrapped key support
> > on these platforms.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Changes in v7:
> > - bring the ICE register range up to its full size of 0x18000
> > - Link to v6: https://lore.kernel.org/r/20240906-wrapped-keys-dts-v6-0-=
3f0287cf167e@linaro.org
> >
> > Changes in v6:
> > - split out the DT changes into a separate series
>
> Bartosz, this strategy of "let's split things such that the maintainers
> can't see the full picture" is just BS. It needs to stop.
>

You're exaggerating, I'm not doing anything like this. You're still
Cc'ed on the single big series containing the code changes for wrapped
keys. The full picture is over there.

> Now you will argue that these patches stands on their own, and that

Yes, that's precisely what I'm going to say, because it's true.
0x18000 is the true register size (as per QCom docs) for ICE on
sm8[56]50 and sa8775p too and that alone warrants this change. If we
can get the DTS changes out of the way of wrapped keys, then that's
just a bonus.

> might be a valid case, but the argumentation you're making in the commit
> message clearly ties them to the code changes you're making somewhere
> else.
>

Are you referring to "(...) registers used for wrapped key support on
these platforms"? I could argue that it just says what the additional
registers are used for but I can drop the mention of this from the
message and just say "0x18000 is the true register range for ICE on
sm8650" if that works for you.

Bart

