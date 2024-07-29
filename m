Return-Path: <linux-arm-msm+bounces-27208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EFC93F218
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 12:04:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18D23B22108
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 10:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27CF013FD69;
	Mon, 29 Jul 2024 10:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xQ9j9oUm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EEB78C9A
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 10:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722247450; cv=none; b=Hq61tUAZ7RUjaEep6m4rk61II9fmyFiqP9JydVjhIa1Wl+RSrwF+mTHKY0DRMbTGrn3aaB3Wa8bIKoeWiXEmEs/X7GuoB3bZ+6R0i2+MMkzdKY2q6bf915jUrHm3o8l1pxZB0/6h9wwFVsxJljFCeM/jQ1zZ8OJ3gx0JtDbYA6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722247450; c=relaxed/simple;
	bh=QgDh+hX2CfcVVZFKmfCfQ+4wGGlEPdOz/4DRO+xcBYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pt1hjApov7Oun+nFm0Pq3TXdTh2YiKp+gdJ1fHq7svFqB1u04SsPP1V2dYvbuxTi0YTkiRrfDYZcJLDO5lZIKk1fuUhE/w7xWrqDYe7UFnPbiywpu01oDC02fXzxBxk9RIV9S3Vi71fOwK1hdQbihQ37lquiUhaHuLM8GvRFsHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xQ9j9oUm; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f032cb782dso34651611fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 03:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722247446; x=1722852246; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t23oL5r7qrH6VMZ6nqcOfP88iRYOauRT235fj9H/sb4=;
        b=xQ9j9oUmkKxhWbfVN0+Po2II4OQTHAz3IDodDVzqWL+L1B08o8R9IOn502aL/aKNI1
         8HUJ7vRM4Xl4ix7l4LdJPcmZpnax0t6DDSQeOXQqoesinC3QDZWUDBKeXOZx8kiIi3cj
         VjahrDrdKeZ9jEMCR1RTRFwzcTEjxcSNigUXTSUVx5PJfn8/hoNHr/FaEjE4ZmffHWCh
         DnFPTps4aBrAcBFT+6k6cDRJ45pOHo/Hyt6T4iikiTmmNpIxkxhfpctFYYtS0seOR2Tv
         dBxXuPiCj6qcMwU6u0143uSagCF4/q2ZW/UDUEILHiB3L2vvkwFIkBkuGUma1tKuQ5I3
         UwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722247446; x=1722852246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t23oL5r7qrH6VMZ6nqcOfP88iRYOauRT235fj9H/sb4=;
        b=xTVuHdxTigcCw/9RS1h+YOn0Fc2yIX9OioH1lLDofmXewtPdnm20XTEdq9u9VLk2Jm
         P3R3vRWoYZNmAhJHRDKjAbc1vqbAwQnJVOyfeGK4hEaBY3EtfxT+4jjI/1H6gWxHBTLE
         vYMQsRfw35Jwc/RVfQOAnlKYdtd02RTyqOC+81/TlmyFe571o8RkYgzUyDvuJ/F3cptz
         pYufgWwGDvKCjiUXuvkiRhMdBsUif661BqmtmoUGA1Pexx9WigtX9/DpXaLR1xAG+Cfg
         ttWo17fcupC2s9kuWuroCTW5BLAXFYtf/9sDj9eP80scHyYGfrKASNuPJcZa7MN0BPsf
         oJUw==
X-Forwarded-Encrypted: i=1; AJvYcCW2q7lVAltk2hjBd0PdmGhqx27GmaFCCq3cpb8VeyOU/Sr3yMlLPRH8cENUHQuhS8MVTtbH4e7v865Eh2jqi4v2T7nHe79oslw5F41slA==
X-Gm-Message-State: AOJu0YxmwlYBs5+NZFRdNv8fne/dvq2+n6lHxBhScbhfMamoHngEspuW
	Du9locyl88gh7LGyiNP1noQ2/9CvsvIw1JuJCVxFrCMFLYYPh+6on0d877s6AjE7A298T63Ho0P
	ps52V705qTulm1EhbExGOUIK2CwcbzKjhbjYbKw==
X-Google-Smtp-Source: AGHT+IGq14q7ZB+CrHf7BL0wsC4WC1GH18TcWHVWGRmnWpnnGZoopVgB1sYJg+4GH1UMU/cFQxpVls2AeyCAqvBP318=
X-Received: by 2002:a2e:8057:0:b0:2ef:23a2:7efa with SMTP id
 38308e7fff4ca-2f12ee1b184mr45849721fa.27.1722247446521; Mon, 29 Jul 2024
 03:04:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729095542.21097-1-johan+linaro@kernel.org>
In-Reply-To: <20240729095542.21097-1-johan+linaro@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 29 Jul 2024 12:03:55 +0200
Message-ID: <CAMRc=McuqEv1Sk9O6kn4aHo9wOfzskZS0z2QxzNM=q2N8XZ3zw@mail.gmail.com>
Subject: Re: [PATCH] Revert "firmware: qcom: qseecom: convert to using the TZ allocator"
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Maximilian Luz <luzmaximilian@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Amirreza Zarrabi <quic_azarrabi@quicinc.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Elliot Berman <quic_eberman@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 11:58=E2=80=AFAM Johan Hovold <johan+linaro@kernel.=
org> wrote:
>
> This reverts commit 6612103ec35af6058bb85ab24dae28e119b3c055.
>
> Using the "TZ allocator" for qcseecom breaks efivars on machines like
> the Lenovo ThinkPad X13s and x1e80100 CRD:
>
>         qcom_scm firmware:scm: qseecom: scm call failed with error -22
>
> Reverting to the 6.10 state makes qseecom work again.
>
> Fixes: 6612103ec35a ("firmware: qcom: qseecom: convert to using the TZ al=
locator")
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
> Cc: regressions@lists.linux.dev
>
> #regzbot introduced: 6612103ec35a
>

How about at least giving me the chance to react to the report and fix
it instead of reverting it right away?

Are there any other messages about SHM bridge/SCM calls in the kernel log?

Do you have QCOM_TZMEM_MODE_GENERIC=3Dy or QCOM_TZMEM_MODE_SHM_BRIDGE=3Dy
in your config? If the latter: can you try changing it to the former
and retest?

>
> It's a little frustrating to find that no-one tested this properly or
> even noticed the regression for the past month that this has been
> sitting in linux-next.
>

I have tested many platforms and others have done the same but
unfortunately cannot possibly test every single use-case on every
platform. This is what next is for after all.

> Looks like Maximilian may have hit this with v9 too:
>
>         https://lore.kernel.org/lkml/CAMRc=3DMf_pvrh2VMfTVE-ZTypyO010p=3D=
to-cd8Q745DzSDXLGFw@mail.gmail.com/
>
> even if there were further issues with that revision.

This is a different issue that was fixed in a later iteration.

>
> Johan
>

Bartosz

