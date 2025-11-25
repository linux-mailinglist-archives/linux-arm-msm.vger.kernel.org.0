Return-Path: <linux-arm-msm+bounces-83258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CE5C8545E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 14:55:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B4FB034F85C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 13:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB04D264A90;
	Tue, 25 Nov 2025 13:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EtLpDZYZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B39A2609D4
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 13:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078936; cv=none; b=ZJZG0DWjjZCTH3pNUWB8jwNRu31NlJ48VhF0uwr9BPUiZ72QZ3e2m4OKYnxVJquX9E1lQCrK2HQhhtrs4kcLqFw6lc3jhcycQEFTeb0pFAqHClBRD60jvhVhrqnnZ9G/StGTYSOEEdju3A2faJcgny9gpR4WQGrFyztUYY82Od4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078936; c=relaxed/simple;
	bh=6dCigi9C/RGN6J99aEObFy3kqNHHN3O6GWyCMbyPKdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z6+CrBmg2CTsQ5jNAEhB+JE7OLX+fcsD2eP5Vzz/Z4Z2YKGLp4hNaiDf8GQ7sbfSkxcunu0UHHNj2YmAoAl4C33W0+ItTawFs39jGYMqj7wy+FYNPmVca2kI2jgffeg5zYVmKgd0nBRqqpc0EUqgkWn2j9oxSttAU3s2RPTnIUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EtLpDZYZ; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-594516d941cso6321007e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 05:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764078933; x=1764683733; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dCigi9C/RGN6J99aEObFy3kqNHHN3O6GWyCMbyPKdw=;
        b=EtLpDZYZTm5sviqXmm1Yu9cGrOG/07X+Fs1xGAyH7WLdSTXHenCv1GrMTrA1/tUqfl
         odvZ3rlFiH5VB2UAZj/rEg20K8GzAlSDysB2laiGxyC7AfAV2pFwAGEwRghEhZSFRa1j
         6TUqRjvw6O6fmHzln74stI+G0yAY1Y470dD9E2pgsGW+7tH6QCtfvNLBrGgszszz+dKh
         XJbVIzp7kC8QvY7c6LMyaC0Cir0goTBrGACTzg10DFqg52VKaUlJ6b6n5+af4E64puQ8
         v0EAaRhythb+yHYvblt2Y9iySCyWfK/5/bzoBqPAWpMRlkDIEojtus/sOh4l1LTykoVR
         vgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764078933; x=1764683733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6dCigi9C/RGN6J99aEObFy3kqNHHN3O6GWyCMbyPKdw=;
        b=P9Lbi3ZrSvfmVG7P9Kg1+xgO49eaGTn1DVWi2VJWSPzyXc8TmEP3En14pmHXUu5In/
         64lUMqjM9kdPDL9b8hceEP0iBM0u+qMawr07u4vw/iG0rKGuND+jVxtU5cuHkfpZGMY4
         hii6r5wM8oS7f4O8pxfPMpSnm9FDN1C308LB7YFl984i76u9U4Z/JPAkJi58o/4y5B+A
         oWdSgGsaSr0nA0op9YVNdWkk3TgAC0kamaSfBMrcRbOxjO/CGMBNEGbB0D33x+wLN44n
         KI7Sj6SAo049zDO5ZeUQ2XBBEc/ueJD9ZLQP9sPI9fIgP4ehPzNBwn7GWb9VYDe1da7w
         ff7g==
X-Forwarded-Encrypted: i=1; AJvYcCX2JBoMl48NoUfGb1icDahamm/0Z+idj0jHkB9qgGFMUGWZXez8PcNdXlPGgwUrIqH+hn3vuC64Vk+8vh4T@vger.kernel.org
X-Gm-Message-State: AOJu0YyFw0g5axrg0LWqCXoNsK9IAekKNZzVpOa2i/LNQ0NbpxQeu5dV
	DGOerSrk1dfIo+Z6H9ktViuM4ixBsrFpoLD89ToNRx2imyBqzkYRLg+rat7vIyEWNlMcdsoGG7R
	fgnRNGwi5Plfbh00p7RJSdotiZRt3kJdYqDt2wxLu8g==
X-Gm-Gg: ASbGncuMRQvqBnEA2/Hc7f6XuVr5uKcalc2Hri5tzbsESTVvh9jX3vUMkD8v9GNXGUh
	pmTn/RHmrJi4EyslqLpl7kOktNDz7KosPw/yAPa25dzmchjyfX3otUuDADW/adyBgjJ7C8chxA2
	vymBLX9HOYu1CEJnhcIOY2T++7ZVZjqOyKVMQcHD4Bv9+H1GoFO+SFoonXsjbbvYAb/8hn84TfA
	d8QwCqpcHfRA8yJ/GSetyE9EstvA3UihysPk51Ia/69PhazA6ZIRvMOwvFDEsP1eqiUIjE07N+6
	v0qgcmr8UEM1O/OB6gaTzV+D5A8=
X-Google-Smtp-Source: AGHT+IHpODuwBQnk3mauQeq63RNOA2CwtokpJT3wujYxmcQIwnm5JZcn37KcCirO1/FKBMTqdAj2F0DUkO2X1fHKIP8=
X-Received: by 2002:a05:6512:e9d:b0:595:7e2f:cc61 with SMTP id
 2adb3069b0e04-596a3e987abmr6257240e87.3.1764078933200; Tue, 25 Nov 2025
 05:55:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124-pci-pwrctrl-rework-v1-0-78a72627683d@oss.qualcomm.com>
 <20251124-pci-pwrctrl-rework-v1-4-78a72627683d@oss.qualcomm.com>
 <CAMRc=MeRVLALxdPoFP2fXpq+inZpA7h-eCBRuegTkxWUGOpDew@mail.gmail.com> <rsfsl32fjfmke6ffvz6y3lvvh54rofnaetuxy4qo3niffjcaue@udb44lfwbfga>
In-Reply-To: <rsfsl32fjfmke6ffvz6y3lvvh54rofnaetuxy4qo3niffjcaue@udb44lfwbfga>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 25 Nov 2025 14:55:21 +0100
X-Gm-Features: AWmQ_bmYxURmm5WQPKpTKTEm06bHE4Lg4epdxsM3nQcjHmSJrDeaDSYcqbDrrE0
Message-ID: <CAMRc=MdcTWTWRRua=a5tUkmr3qtjMsRHcTOERGup+F0sgqwN1Q@mail.gmail.com>
Subject: Re: [PATCH 4/5] PCI/pwrctrl: Add APIs to power on/off the pwrctrl devices
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>, 
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@kernel.org>, 
	Brian Norris <briannorris@chromium.org>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Niklas Cassel <cassel@kernel.org>, 
	Alex Elder <elder@riscstar.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 2:50=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> >
> > This is not an error though, is it? If there are multiple deferalls, we=
'll
> > spam the kernel log.
> >
>
> Good question. Initially, I made it as a debug log, but then realized tha=
t
> people may wonder why their controller driver encounters probe deferral w=
ithout
> much clue, especially when the driver spits out other logs before calling=
 this
> API. So decided to make it dev_err() to give a visual indication.
>
> If it is not preferred, I can demote it to debug log.

If we must log it, I'd say a dev_dbg() is enough. Probe deferral is not unu=
sual.

It would be awesome to be able to synchronize the controller probe
with the pwrctl device binding but I don't have an idea on how to do
it yet. :(

Bart

