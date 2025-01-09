Return-Path: <linux-arm-msm+bounces-44545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BEFA07460
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 12:14:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4D4F1605CE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 11:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 624202163BB;
	Thu,  9 Jan 2025 11:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="T5HYtOJs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74342163AA
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 11:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736421254; cv=none; b=KDrxgieaWPD2maE1aM9FeI1oo753dXtmGVYxs+Yd2vCwZ70dL9oE5rGezg0di68852nVXuRsioaq590PNgTXbumYywZfkHp5X9MAXJ76O6XtB4gKBnEj4Ix/n/++IkhghUlLG1LO6erCOsa2QR+6/Edu+bCneF+wuDXFu51fwSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736421254; c=relaxed/simple;
	bh=KvUX2tclb6EKtsU4ZwZgbH2IUTXdg6wsNE2k8/4WUpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=koGrnozWBrYJEEPs4kzy/tkxDzMA4hQcOOzgQFP3b2gFItpejpDS5XDZ1H12hNLv/yzUkZBCMczn+WD/CZ12/5GRDD1QtpNQLaINV8yGkEAvU6si3SfEoMmyDivLOlx1ycBf5nrejvo4OrRaFFdSJ1NOEAg/5VhdvInyqOsgYs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=T5HYtOJs; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5401c52000fso746593e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 03:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1736421251; x=1737026051; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6Ve+uFkYUk4Lm5RgYfqylcecewrY2YAyJ7YzDy4Row=;
        b=T5HYtOJsFkDPJkWY5bklE479t5GEa2yxEvfbsnq8XqiVUcgiv5w+05IbKU05R3Gp84
         ofNioUrHEVMqWmUN0C2N9b9acyAKE2jN9v9OZuxlialQwC4SZ9ixEYZ/mt9+PkViVL9J
         uehH+4Q3aYRqL29Nar90GtAUcPwZ/Sg0/5tfOOeumQU4AIyc0c99oz3+FQ+cBmsBZZBJ
         cpJQ00bfec2Cc6ol9p/FL56egzFmYvdNxe1tZYXFnSKoXz73sL4ifmqVIupQbxWPOh69
         KqXKeHbYdHB9p/Eev+5/r75yk/uOP3q3Bfn9XKLO+AlyWjSLEk8IqYxeKuZs3+ExN4f4
         f/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736421251; x=1737026051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6Ve+uFkYUk4Lm5RgYfqylcecewrY2YAyJ7YzDy4Row=;
        b=rG4s5rY8IcuyEjl5SdDB4Vr3rgW8GDMiysZbSSoqqln5PbVui6TEm7AaDfukOxqDxT
         qeivJJlofji3VIAhF+cLpAV8w/i4fwstYIJBpxjMnFjR70QzkFxGg8EWzwDRTWjHfodZ
         2VnCsC/VpfdX0SEY6yZUTF5IGDMOzo6k7adbrsukYth1jecUScCqqIz77bnzO6Rr1T8+
         2R0je5C2y36Fwz3S/Zfaa+ggfAI+CB/kmwcgoUbWG1X0YBfodASLFsSd9PX6GYD5hmUU
         nVE3JqLotYXwIan8OAnPtroLaM1gx5MnViFwGgLwQm+tTOjQlRTVtYb0EmNydkgQw4en
         EWVA==
X-Forwarded-Encrypted: i=1; AJvYcCWNWU0c0MDNOkC0mcFxw12IemKyz/KedQ/EcCI0HvrIZYM2lqTn88wGtL142zlytpMf1e1i0KK6xhrVIe/4@vger.kernel.org
X-Gm-Message-State: AOJu0YyNAt9rBc7lmmyJP6v9YOY0dRhaFepSb14F8A8KXbby5dfUqdUd
	h5LHsqaM5pvcRaB0WUoJKBVmXa8qY65CcnXRbQj8Ab6qHYeCVXSa6wH2K7qAGeouzjXSlZNpE4I
	WLuSWiMx6utUh7KzAFIjEVkKuRhuWGAtWDWhb3g==
X-Gm-Gg: ASbGncsrWsHm5FhbpRO+XXSaD+XsHUZSwBmclx509eVYOqUHivkNPtAfqqt+E6swSZR
	bG5Df1wv3np+Lygvq8uTeoaEhfOQdi3ijj+a0B6ZT5wf/ZCDJ3GYATB4lurgFNDuj1uawwQ==
X-Google-Smtp-Source: AGHT+IHecC8QmqBExM1dGrfhQre/7zM/1Fm5SR9RxF+uZC5W1SeIDuEDHii0elDzBRNM6iT1Hndoa4TC3Ur0xTS9gQM=
X-Received: by 2002:a05:6512:33c9:b0:542:214c:532 with SMTP id
 2adb3069b0e04-542845bcf5amr1575562e87.13.1736421250602; Thu, 09 Jan 2025
 03:14:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202094903.18388-1-brgl@bgdev.pl> <3b99b4c0-5880-4ee8-bbec-d07673d9ce11@oldschoolsolutions.biz>
In-Reply-To: <3b99b4c0-5880-4ee8-bbec-d07673d9ce11@oldschoolsolutions.biz>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 9 Jan 2025 12:13:59 +0100
X-Gm-Features: AbW1kvap-PzVkF3JlpPA3jROKajb-aE4e6XfI_ugmmD3DK0x_WN2ZyPQCGonMD4
Message-ID: <CAMRc=MdtbgSuwjv_h7+VVr5U2frc24NYmpifPQJ0O0iQt_sWKg@mail.gmail.com>
Subject: Re: [RESEND PATCH 1/2] soc: qcom: rmtfs: allow building the module
 with COMPILE_TEST=y
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 10:56=E2=80=AFAM Jens Glathe
<jens.glathe@oldschoolsolutions.biz> wrote:
>
> On 02.12.24 10:49, Bartosz Golaszewski wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Make it possible to build the module when COMPILE_TEST is enabled for
> > better build coverage.
>
> Hi Bartosz,
>
> no idea why this happens, but I just bisected my way to this patchset
> for this very odd error on the HP Omnibook X14:
>
> jglathe@x14-jg:~$ sudo dmesg|grep snps
> [    1.009307] qcom-snps-eusb2-hsphy 88e1000.phy: Registered Qcom-eUSB2 p=
hy
> [   24.035977] platform fd3000.phy: deferred probe pending:
> qcom-snps-eusb2-hsphy: failed to get repeater
> [   24.035987] platform fd9000.phy: deferred probe pending:
> qcom-snps-eusb2-hsphy: failed to get repeater
>
> This kills USB2 functionality on the type-c connectors.
>
> with best regards
>
> Jens
>

Well, that's weird. Are you 100% sure this commit is the culprit? I
have no idea how this could happen, it's just a Kconfig tweak.

Bartosz

