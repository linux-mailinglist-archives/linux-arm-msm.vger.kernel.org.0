Return-Path: <linux-arm-msm+bounces-19162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CFB8BA7C2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2024 09:28:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EFF9281F93
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2024 07:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043DD146D5B;
	Fri,  3 May 2024 07:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bWCxnhYi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBD8146D4D
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 May 2024 07:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714721334; cv=none; b=fl5OF9ImAMQgc2DZPOzwPfcihA9WO5nkVHEVMkIYuR1qSjIwmIo95ZppNAnR/Bls0yTSGrdKT0vGFMGK86TIeM1k3t9MSQ6PlVEyonLnEOScx73YZtsAs0TLXPxZqUmCReVLbIh+Ud+hlDWYpW54KoGc/p2mUe9JX++cqgXuMMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714721334; c=relaxed/simple;
	bh=Hn+kibtNuVGY16LR1Tui4J9dCha04H++GGopC0OUDOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R93rINJPGuWenfy2rClU2nLP5tMWMMFDZplQHEKgz/QcRouWwig43rcKM+VRL8RL1oCCtQ28WWbLdkLqhvYmANuKCxO1N9frCDcueaocYzWIrjPfZ4HmSgjBZR1hPjItpe12f6zrT0wXzGLCMQ4JB6i79DrVSfHE+fyruF3IVKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bWCxnhYi; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-de462f3d992so9345732276.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 May 2024 00:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714721332; x=1715326132; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hn+kibtNuVGY16LR1Tui4J9dCha04H++GGopC0OUDOA=;
        b=bWCxnhYi1vzW7akPHe39Sq0l65OBVtnxZfGzJmGAVxFKRT8QpSInC5K9T8Uj1at039
         JNC5tHoPar9bSAoQasXba6ZWaFA9NKZFei2ThX655NfNkUxBqRo1igwSDyoJsEsoyjFV
         k4BxBmx+7gPWX5RoJo4C469uIC2EGbWstwzYaDrXFJT6l3KF8jNyV0JLskKyl1BBAJNI
         wqw/qFCgXY6lJkVAKmB7s5CQcHtVOD8qkU5yVCDaSmaTHog9/lPfCJ+e+7ty0YFKXdty
         MWJFFvkhHtfmmivbA+WqevsBGzrXpbmQiBBOXsU4EpCnz2trDDM/Vc5ahIlvuYchXD/S
         b3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714721332; x=1715326132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hn+kibtNuVGY16LR1Tui4J9dCha04H++GGopC0OUDOA=;
        b=Qc95uFmW5BUzMUF+a0e5TMn0CANMQiapYf+VCgFnRYffz1mcHR4U1+57zQV0cIpcWK
         Rxn6fepgum55TmJtOXmMLJtVE0mFsa3s/zR2sNSrB4r+eNBtPFcofdT427uvuCZmrZYT
         mEohHt59YnBSzn8dmuqs3Zw9juYnZmTFE4SOxW1mDKWbS9DDZ2hPVXm2ISnVLm24v6wz
         9IXn5sP7v0n2KMAvPKMg2rr/qb9wnP0U5FcVWW7wLifJhTMaXOm7xHIpKRZgXS3MvyMR
         DHa13xqquHy0n5oox3rz9xiVitV3ShHcnmYpArxbuUDulamfDbM/pkmsOK7+H/Z059tm
         porQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWdJMuOR69yDAXw8Dug7gXC47lSJAubbHlqdGrOgtkmPIv0C5PPmF2lDfC7mMEx8epmxmmUmqNBdqU1wxmZC3jx7t3sgKf8axPalO1Tg==
X-Gm-Message-State: AOJu0YzWYSVfKtiDY1adrwkahVlpR/NyX6dz/m5oLahddCA8TTE4/6MQ
	AiPxmlfxF6oG4B7Blrh0hxnJxnvtMOPYOcuMqyivGSfaBArplFOTWUgUxZlJo37IJgV6m9JQ1jH
	aL8a4i1VEZZJ+PEKw5Vfit8mNLiFcETefvMofsQ==
X-Google-Smtp-Source: AGHT+IF0xjlVgsvZVFX4uIc9xGkdM4zN5rBjDCjVF5rIBWnC2grAED83RKEyEUanO8Zm+9uvlUebxitXHnTav2HLKug=
X-Received: by 2002:a25:dc08:0:b0:de6:723:3035 with SMTP id
 y8-20020a25dc08000000b00de607233035mr2121144ybe.13.1714721332503; Fri, 03 May
 2024 00:28:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240424-tlmm-open-drain-v1-1-9dd2041f0532@quicinc.com>
In-Reply-To: <20240424-tlmm-open-drain-v1-1-9dd2041f0532@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 3 May 2024 09:28:41 +0200
Message-ID: <CACRpkdYw8jzFH5n377G76iMqri70Tf-1Vc=P5D6ESU_U0qRXWQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Fix behavior in abscense of open-drain support
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Brian Norris <computersforpeace@gmail.com>, 
	Jaiganesh Narayanan <njaigane@codeaurora.org>, Johan Hovold <johan@kernel.org>, 
	Doug Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2024 at 5:46=E2=80=AFAM Bjorn Andersson
<quic_bjorande@quicinc.com> wrote:

> When a GPIO is configured as OPEN_DRAIN gpiolib will in
> gpiod_direction_output() attempt to configure the open-drain property of
> the hardware and if this fails fall back to software emulation of this
> state.
>
> The TLMM block in most Qualcomm platform does not implement such
> functionality, so this call would be expected to fail. But due to lack
> of checks for this condition, the zero-initialized od_bit will cause
> this request to silently corrupt the lowest bit in the config register
> (which typically is part of the bias configuration) and happily continue
> on.
>
> Fix this by checking if the od_bit value is unspecified and if so fail
> the request to avoid the unexpected state, and to make sure the software
> fallback actually kicks in.
>
> It is assumed for now that no implementation will come into existence
> with BIT(0) being the open-drain bit, simply for convenience sake.
>
> Fixes: 13355ca35cd1 ("pinctrl: qcom: ipq4019: add open drain support")
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>

I tried to follow the discussion but couldn't get to a verdict on this patc=
h,
should it be applied or not, and if it should be applied, should the Fixes:
tag be dropped or left and considered a nonurgent fix as it does not
affect current behaviour?

Yours,
Linus Walleij

