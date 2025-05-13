Return-Path: <linux-arm-msm+bounces-57671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5661FAB4FB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 11:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C1E43B2F21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 09:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ABBD221729;
	Tue, 13 May 2025 09:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EQCXBuIA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C665202C49
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 09:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747128428; cv=none; b=QL4qGnKSxBnB6YrgGPnMul0kIc3cvja9Kg/RundT6jDJ1XbEFjBhoL5rZfLWblpencdoEOwa+DC6r2i+wxeBDE9WfmbjUJRzzPsKb0BaKJkxL+o6XF6XhaD9RpmoZ6mkozh2UH+a3dkYnC6txk5WdTLj4BloZtNsJPw64bWrI0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747128428; c=relaxed/simple;
	bh=dBHjeKALgKb8PK7SZY/p8ey0dlC17faEy13K5JvMwtg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iuFNmSsMJT8H2oaR6q6SGYULg6huL9wZCk6RIm3H/9raY8Qhdrr2PfLj/vMMLcP0KhqBLxLLq9dY39FeMZUiC+EEUPjorJPnqTJPNRl8wWnhm845bed04iKjd+e1q2ILT+Zx2/hvzjo1RefDRLsa9azj83fSKB9GUN5Br7r62N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EQCXBuIA; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54fcc593466so4084340e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 02:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747128424; x=1747733224; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRI51hopg7WgPcKQ0KhMvn+lW2eJu7995NqNQ16hkew=;
        b=EQCXBuIAzkrJ0YcaH2GFD2Kn7IIkRf3EfASYuN9gmZmKU011yTL9ljYuZqcyDQgEjX
         DatySf72ZK7SO/csXBc9SsEQOhbG95HVAcWAnDdAk4rFptHFzcKZG7tsYxDbmvu0SOdj
         fYlQBpROD2x9mrbHBbHMsJ0G+mh9VHbn9HJ9FSCkrJKm48dfLbsFW6r6kVlsT2OilRG1
         moLllsokiYKYf/vq5+zzSFrPLAI6rdDF/q35GLKOKFTmBPJouZFE62KQE1UXe+xmGifh
         PNSwzVEGFN63bOlK8RoAokLHfdzXfA75TN4LXq11A9uq3/oimB9vsZKHIdBuHYEufTKX
         t14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747128424; x=1747733224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRI51hopg7WgPcKQ0KhMvn+lW2eJu7995NqNQ16hkew=;
        b=pcBbDckHj0uyDYZAa09GFcEj7zRBrNMKD/TcKtbwPFRMJpHPB5bnFEgdmLGy0Oc3MD
         25f2//eAA6Z0OmgWsk9cwH0PTNYzgeFOfK1mIg4ZyYH78cHDQQEWu7AWnJIN1iBvcjYD
         K16wQE49KM5xE3ykxaX24j0vezLGPkT7JMLvmbR1i57sthgZ7pznpR0o+lXpEgcSlMZz
         XkWY7lGQNC2hM4spD+yFT0g9qPT6T46Qt6sUSg5yhd95Dmm1R2M2ZejlhyP2OFDG9Auo
         n2FKwJxkBRZGp7UgjoczpyE5U7PclLBa0p/UR8hEpiqLaH/5VcdamtD81FVxyzBNxFB7
         U/zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhx/bJprAXyG6AGRfKh/eulav1r7puF6BO70IZGu4FoZl0TOwiw+4JVELlTB8+y7knospG/Wb096afkJhc@vger.kernel.org
X-Gm-Message-State: AOJu0YzqDO9Bhf7H7z5G7a3n3AARzgKmROWAtOTIRqAbVtd5XGTmqzYw
	gW9bZp/aQhU0R8BhWvLTB4imHeQRxqdV6I7W+9LF7BZY/q7bVPeONlQA0vUI5WhTtb0MGMlXQ3N
	Asx82gCskgmybrskVhKWkRlxFXeZPaNtpoBoACw==
X-Gm-Gg: ASbGncs9yaTomaz3z+SsRBy9vr14Rs24pVHGOWFKrLxYLhOZ3x50m4+/m3DECdFu3wS
	i5xHm3f2f2efj+/D+eg6K5oP259VIWEIU2qwtOsR7VRAP4yYQqD8QcB77akhfqjIUATwDbSGCop
	zxWok0cmHYME9b7Y25/67HCjKqwitfN+Yt
X-Google-Smtp-Source: AGHT+IG9aZSpEQxvWlu8ce2CXwCkeQw4aEsqx0A7UdazXuZrCCQu4J181mxHBoFbawXCJgTrKHYOmXCDjY2BLlsEQTo=
X-Received: by 2002:a05:6512:6408:b0:545:2950:5360 with SMTP id
 2adb3069b0e04-54fc67c2233mr4949153e87.22.1747128424591; Tue, 13 May 2025
 02:27:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
 <20250503-pinctrl-msm-fix-v1-1-da9b7f6408f4@oss.qualcomm.com> <CACMJSesqtkorg1akuXjMa9U1fe60aDhfGOSB_T6mX5CtCYDwtg@mail.gmail.com>
In-Reply-To: <CACMJSesqtkorg1akuXjMa9U1fe60aDhfGOSB_T6mX5CtCYDwtg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 11:26:52 +0200
X-Gm-Features: AX0GCFs-_g09qTgH6m_jk6ylbKM6K0LWLr1kjRESYHMTO1WN6HIA2pdGmO-YFt0
Message-ID: <CACRpkdbDNbEpNOLT31+8Jb_fdvnROOtONxFc0hxCFa5AotSwTw@mail.gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: qcom: don't crash on enabling GPIO HOG pins
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Josh Cartwright <joshc@codeaurora.org>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Doug Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

thanks for your patch!

On Tue, May 6, 2025 at 7:28=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@linaro.org> wrote:
> On Sat, 3 May 2025 at 07:32, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:

> > +       /*
> > +        * hog pins are requested before registering GPIO chip, don't c=
rash in
> > +        * gpiochip_line_is_valid().
> > +        */
> > +       if (!chip->gpiodev)
> > +               return 0;
> > +
>
> I really dislike you dereferencing gpiodev here which is (implicitly,
> I know...) very much a private structure for GPIOLIB. Can we move this
> into gpiochip_line_is_valid() itself?

I agree with Bartosz. Patch gpiochip_line_is_valid() so everyone
can benefit from the extended check.

Thanks!
Linus Walleij

