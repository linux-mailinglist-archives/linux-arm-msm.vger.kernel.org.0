Return-Path: <linux-arm-msm+bounces-36886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B109BADBD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 09:09:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC5C428264C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 08:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D6B1A724C;
	Mon,  4 Nov 2024 08:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EMDhNSOa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2002F18C038
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 08:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730707790; cv=none; b=lQFZQITMOOiJNhmVjAXwqpQqoenGHXC8Cc9t/fk6RWFDt9gBetDomCMlnZoafIOPtIUq7N8UYVbpgGTf0L7NuYwgIMAjyZf0BJzJC441ru2Dm37IK6A7HKMjp3vQzbfvA4PlKLrgKiUmiP3z4Nst1lL7dxRJP/bsmENtetdMoUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730707790; c=relaxed/simple;
	bh=Yz31SLbOPrOYc3soJoY0aJGiMShQP5qyX8fLZnLuJzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xg0J0L3Jm0nKUoGVjbh5YEV8bjBWtJ4VUqM2xgtycwnR3xGmijyjW14AjjZPLKxamw5/DKnQ3k05hd0kHwhWWyz/pOmq3aKoexYIGxBkvY30YJYF8sjRjS1tp3Kihx7oVLpWyZpC74XmK0N+SsaatY4+gJ/tcH6Pe4KLPMu6c4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EMDhNSOa; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb5be4381dso33923271fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 00:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730707787; x=1731312587; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jdxm002ELEzRqrM4SMC60ngOqNzEBgO5QnfMayxWmU=;
        b=EMDhNSOaGB/qxmmG/559oHtWN1vmHR2wBDBXhXkic0Fimxc72zshMXQBpc6WElphSH
         I7hGl9WESNGTzBMxq4DoHDTJ+IfaGmHjNxnT9kTRfHGpRxeZeZSTP1+4IpyLFiy2WWmX
         /Hp7SNq76zvsJagc+yeWR8T+8Np3P4U9ouCnDwouyOJscpZ6BaV2KfoCZiYoUpgcD/Xe
         03EeQ4/AKwjcPDEyJ2cUxrSR6iTJuGUM+fI0LpNxeHRmNsH0qLp9M0RRecD3MGolnG13
         GWblNGanreCD+IO/8rqzjuubxM3AyDjttLfweWWXswaaZpXez7Xy2r4LfjcmtRfKZKZx
         1Isw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730707787; x=1731312587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3jdxm002ELEzRqrM4SMC60ngOqNzEBgO5QnfMayxWmU=;
        b=tLTOqlfhAxe0pNby62TrvhpPG6ODVIw0dsIKy70Z+Q/S7iBDsmpSQq/L1pebiGzlU5
         2jKhl4gE2KANUi0o1G7RvTQC7LGH76R3OOQw9C2yWDLYAWwzkt+2xQxroQCSmw/y852/
         70w7leefhykpJLWn1Eiiw7Vhd34VPY8KFmvccr5ne47/43MipM4jKlMjQO9Pf5Lpdd0o
         m3vs27sVdG5E4dx7cUOBQeOX/A4aEFslV1R7zxoZ1i6qM+kPlZlsPiXhjZrlZYdHtf93
         6Gh/dw9Fi0vjFRdFDQ9VWrCbt4y/t6ZqLMHkqpPIgGZhQnW8PweEEZ7Q3pN67DCw3RCP
         fbDA==
X-Gm-Message-State: AOJu0Yz15oyiwOaXrjuKyaPFs3qOgx0nUG6TKu6aird6yYqNZMWCehs9
	Ol2FFC7kP+M5tyVCMF1I26oyjWoJu8NMWeMIZ4nWdvq977OC4SK62S+cyHzN4WOT60CFD4A54GE
	6rP60eNncCMo1920PMf4nuyXr71vRmvpviBUpzw==
X-Google-Smtp-Source: AGHT+IEUJqYCSOK9mvoxQ0z9hQN77cUr9bmHztXbsHJLHPrlaXp8WRMBeNzUjFWI1hIuKtg4LUVOrCEwJe9ptMvknC4=
X-Received: by 2002:a2e:a98e:0:b0:2fa:ddb5:77f4 with SMTP id
 38308e7fff4ca-2fcbe096105mr139956391fa.38.1730707787042; Mon, 04 Nov 2024
 00:09:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014130303.123394-1-brgl@bgdev.pl>
In-Reply-To: <20241014130303.123394-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 4 Nov 2024 09:09:35 +0100
Message-ID: <CAMRc=Mfv5MnVAtwCSFwghEH67hbxDgw+Jg9W4dTGq2+Pj0ppTA@mail.gmail.com>
Subject: Re: [PATCH 1/2] soc: qcom: rmtfs: allow building the module with COMPILE_TEST=y
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 3:03=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Make it possible to build the module when COMPILE_TEST is enabled for
> better build coverage.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/soc/qcom/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 74b9121240f8..58e63cf0036b 100644
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
> 2.43.0
>

Gentle ping.

Bart

