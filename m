Return-Path: <linux-arm-msm+bounces-42315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9589F2C22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 09:43:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AD48164F27
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 08:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1BAA1FFC61;
	Mon, 16 Dec 2024 08:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tV8LoLne"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F571FFC41
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 08:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734338584; cv=none; b=Cp8Vq8tKoSCSISoZnz2qPw5gLablR8pNoTN+OKK6GEN6U75ciYXpxv5e5BP5pPN4XsYUNEnwlNzR2ZOK1HdbKeKUXNeG8l3Auchf0G8Cck6/tHrfhMU2KHrIB+OszwH2rIOAIiglaSt2os67eVYrv9ZB5Bar2PQUAwXIt+yqfLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734338584; c=relaxed/simple;
	bh=6AhQFzxXrbWEhDNEdghzKF89RHERU3ypIVR6AiCVvJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tDN7O7DQ1RHJ3R+x/gYxENqCLI3Bska1tNKeRrNoWTGAREiI3/O/tfLk14f14Ez53Ql9JOJ8Eu5tNZbIvyAJ+xoyxuZEYwwFD7NT+meA9C/wbHVzhg35SuIBG9jNT2o02IXbRMiYcx9UgTOka6+tyDDIB77R14G5ocqkKyfMH3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tV8LoLne; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-540215984f0so4411901e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 00:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734338581; x=1734943381; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ESVbK/QGYyy+mXv8GIEzCsLxto0hs5j5kMmDAMrMjQ=;
        b=tV8LoLne/pjHt8QELU7Ac6awsUwFz9Ji3qKB5QebU7Pol7c6NHN/qvY/s7ZuNkYsx9
         kXsJZrSqsKtkDYpFe33X3WPqtWSbzhPezJZrYlTYWKAlcwJG4d3RJtQXG6hCyoQHMGei
         Ln3buwQWVektLqts7l7AIbUdSFK0EAhFU8rgX83PfLUb7iU78HD0eo742xsz7doF1Zhh
         rmNviVLGxObJlsiLLkXIK50+UFktwB6nclX0UJM/GzAHiXXMZdquaiL1X0GyIml+a3tL
         A9SEKNsxywe/sH7lvQyAbs/ZO4bpEzNsENbVxaRWl6WUY3O2DTC7lNrirHLj0wmVLM0G
         fHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734338581; x=1734943381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ESVbK/QGYyy+mXv8GIEzCsLxto0hs5j5kMmDAMrMjQ=;
        b=tn8zI09V78nGJCffuwXXVtyrzTRoUiIeIr272EEe6nGfFGM9gHiqnLtHB+Q9KITdGY
         J+uwczcItAnHRAP1KVtXwXn4A9ZvQuVFJPcwoMVfoJDCuaJgnHodE4tFJlIcFG/hAFt8
         nej4uZaVcoh3BSmFgjumPQpRDMnAiTqjYUXLEZ6nsdluVFbV4zEvReJKCVZNXTijfw6o
         JDA3HZPub67dcBQ+5kn9RchXHvRPyfUsNT4HivMBrdy9qD8uo4VBu0s1FpR16+zMUxN5
         DnRclM8JFNnfm18mQtQ1B82xRZbJUPqq3EFEBkRgMPVtqkSia36ChOD8LxH7TB8M0bEw
         Z8Zg==
X-Gm-Message-State: AOJu0YyzEtiWsUkDHR0MyvGefzdvbOi4oGtMkr4kLV5LngttU+Z0/exf
	C0SeJVmw3x2NTSlxB7t4KYIbuTpunH0Gt7FlPyBPdi9OC7WCozxsyQuaZjpxav4DlS4NPh9N7oL
	EBpB1ji0SqxD20txJs3J54qyEvMBNEVz0K9P81hFd7Gkm8vyG
X-Gm-Gg: ASbGncuF6zDX5MDHj0AFol4ZF+EvEpc7TUqP2H2gYx4ykPI/kntvzJDL62EBdpQn2/M
	C4QvFTfyEB9AI2qLi5ahRZtKjugQij2r87rbiA4+dMoJcYCGlytrsHETa9Qk9mPicgFezBw==
X-Google-Smtp-Source: AGHT+IGn4xA40nF8STOCkYbc5tmOp9UWOQNm06xrEtaIXFJmc7D+X5p16HTNyzUm5pQIidN72lQxmYOEHOyZCkLFBZQ=
X-Received: by 2002:a05:6512:1296:b0:540:3566:5b37 with SMTP id
 2adb3069b0e04-54099b6a827mr3801067e87.57.1734338581092; Mon, 16 Dec 2024
 00:43:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202094903.18388-1-brgl@bgdev.pl>
In-Reply-To: <20241202094903.18388-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Dec 2024 09:42:50 +0100
Message-ID: <CAMRc=MeEQT2aB_taL2FYUx3czA=a22mPYDgFyKt2W7jfKg6zBQ@mail.gmail.com>
Subject: Re: [RESEND PATCH 1/2] soc: qcom: rmtfs: allow building the module
 with COMPILE_TEST=y
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 2, 2024 at 10:49=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Make it possible to build the module when COMPILE_TEST is enabled for
> better build coverage.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/soc/qcom/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 74b9121240f89..58e63cf0036ba 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -139,7 +139,7 @@ config QCOM_RAMP_CTRL
>
>  config QCOM_RMTFS_MEM
>         tristate "Qualcomm Remote Filesystem memory driver"
> -       depends on ARCH_QCOM
> +       depends on ARCH_QCOM || COMPILE_TEST
>         select QCOM_SCM
>         help
>           The Qualcomm remote filesystem memory driver is used for alloca=
ting
> --
> 2.45.2
>

Gentle ping.

Bart

