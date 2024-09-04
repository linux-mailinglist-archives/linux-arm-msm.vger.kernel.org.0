Return-Path: <linux-arm-msm+bounces-30776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A0896C610
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 20:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28766B20ADC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 18:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7F0E6E619;
	Wed,  4 Sep 2024 18:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jk7mEOwY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1460D1E00A7
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Sep 2024 18:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725473546; cv=none; b=HQvck0+rhCrfmQFi7nKlgg2sYSeAeZNBPdTnPoWpIlA8NQqxEl8jYSolcf8zRX9V51QE0rbGQVPwT9WSouukLVn8LFr62CUu5RpsAtjM4vsvviZqTIkx+Jym6l3OmUHTcyzwo7GVXY2icQtLwfT34xRza2lqYBtG2URzSWdV3bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725473546; c=relaxed/simple;
	bh=Q7Agty0zXBtBtOtFGvBFvozyDANzGd+EnAjH7EKjSOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gWqoRQpEBI40xm2Ua1p1xDGMvtTXQ+FT1d/HOI1bQq/KBc9POA/YeECUYW8cnKUyIy+5hYDWNHHFpjK8JoY3uv4wazh1+2npT8uSkVWia/GyIXvtsD7cAER5XvMw89JxjQvguEzPKDXhwg6N6SP1ln6ZkZAftrMTekwMWIKbwF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jk7mEOwY; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7a7f94938fcso441507685a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 11:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725473543; x=1726078343; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wdKYvJTYXyrjklFqOv07HIaDpIbI1w2LSQ7FPhX/UI=;
        b=jk7mEOwYs8jq3dt5MMmlPZeo2NGEKccKFnyJcDq6e89BGrgQ2lH6eDdwTE17D78z0X
         Y1F2T5vrF4jplDrClqRxHhomOqRyCMHqdwfwHM6FHLwgdWhk5h2cxmAZhgFpDhJFwaUE
         5aPGYPRj8zV+bK4YcZMUtQP1105yFOrNiMSoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725473543; x=1726078343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2wdKYvJTYXyrjklFqOv07HIaDpIbI1w2LSQ7FPhX/UI=;
        b=wBr3nlZVL9gHkxaAFff9KbWqkc0I6SFya4iP+t4sNijj+mCoJQje8Qo5+f/Te4UClL
         ojy/fJaysvXwjy5eMRj6Z7TUoxsBB8Txg1dKQa+oivJP5fkyrI0l+zdOxbeNAcOnyfl+
         P/EMMoQJfyRL8ibWx/mEkqZQOQOwVV++VypLILVz3l28stCqmVCBhWkyJqWQsBjWgBMu
         LqB3oF4qR2/W4uClTfP4HlOFmvPWodX2cWwu7KgO7rr9DyrI5N8aonxbDzSxVV3EURJl
         qukPMOQ9VYk3Zz3gvvw26d+T6J9HzTBGLy/vGYQSEio5yEszO4sU3IiH/gVBoJ0a2dCm
         n5BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHkhSL3eTEXXBYow7tezMfzENWlEbmwIeOntC1bZtzsdj9sghA0NJRrBwhXdpvsmVCguLN1JmcL26mQ2G7@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa441uQChfjav9wiF8obLm0HlgnNZpAG8ZN0o5Mt5e4etPDiAA
	z852IW8dKnQsSYD72XQswq0CrFSNeNbmyw4lvCW9oMztH+WIsdPrc2AU8DzIzQRa4rjFSKi98/g
	=
X-Google-Smtp-Source: AGHT+IEJE0QiXG3JP51kzmAufVtqamQJpdLvP7rGRXiQHlOCfOtMa+siP+iJvf/+GbU8L7EkhoFmFA==
X-Received: by 2002:a05:620a:4309:b0:79d:7777:1f52 with SMTP id af79cd13be357-7a804292322mr2330222185a.64.1725473542339;
        Wed, 04 Sep 2024 11:12:22 -0700 (PDT)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com. [209.85.219.53])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a98ef1f9afsm4510785a.9.2024.09.04.11.12.21
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 11:12:21 -0700 (PDT)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6bf7ad1ec3aso35719276d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 11:12:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV8OHHLKjG5w2zJF/m1K5K0v2ruZpY0NkXqISamHA2jrICUwHASPmIkxbIHMgmAmZ/J6PfSQ0lAd//xfs/6@vger.kernel.org
X-Received: by 2002:a05:6214:33c8:b0:6c3:63ea:377d with SMTP id
 6a1803df08f44-6c363ea387dmr141190726d6.43.1725473540667; Wed, 04 Sep 2024
 11:12:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904021943.2076343-1-ruanjinjie@huawei.com> <20240904021943.2076343-2-ruanjinjie@huawei.com>
In-Reply-To: <20240904021943.2076343-2-ruanjinjie@huawei.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 4 Sep 2024 11:12:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VyDk-e2KNiuiBcACFAdrQmihOH6X6BSpGB+T1MsgsiKw@mail.gmail.com>
Message-ID: <CAD=FV=VyDk-e2KNiuiBcACFAdrQmihOH6X6BSpGB+T1MsgsiKw@mail.gmail.com>
Subject: Re: [PATCH -next 1/3] spi: geni-qcom: Use devm_request_irq() helper
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: broonie@kernel.org, akashast@codeaurora.org, linux-arm-msm@vger.kernel.org, 
	linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 3, 2024 at 7:12=E2=80=AFPM Jinjie Ruan <ruanjinjie@huawei.com> =
wrote:
>
> Since spi_geni_probe() use managed function in most places, also use
> devm_request_irq() to request the interrupt, so we can avoid
> having to manually clean this up.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/spi/spi-geni-qcom.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index 37ef8c40b276..77eb874e4f54 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -1144,17 +1144,15 @@ static int spi_geni_probe(struct platform_device =
*pdev)
>         if (mas->cur_xfer_mode =3D=3D GENI_GPI_DMA)
>                 spi->flags =3D SPI_CONTROLLER_MUST_TX;
>
> -       ret =3D request_irq(mas->irq, geni_spi_isr, 0, dev_name(dev), spi=
);
> +       ret =3D devm_request_irq(dev, mas->irq, geni_spi_isr, 0, dev_name=
(dev), spi);
>         if (ret)
>                 goto spi_geni_release_dma;
>
>         ret =3D spi_register_controller(spi);
>         if (ret)
> -               goto spi_geni_probe_free_irq;
> +               goto spi_geni_release_dma;
>
>         return 0;
> -spi_geni_probe_free_irq:
> -       free_irq(mas->irq, spi);
>  spi_geni_release_dma:
>         spi_geni_release_dma_chan(mas);
>  spi_geni_probe_runtime_disable:

While the idea of using "devm" here is fine, this isn't quite the
correct usage. You need to be really careful that using "devm" doesn't
change the order that things happen in a way that breaks the driver.

Specifically, before your patch the order we init things:

1. We enable runtime PM
2. We allocate DMA chans (spi_geni_init=3D>spi_geni_grab_gpi_chan)
3. We request the IRQ

When we un-init in failed probe, we do the opposite order:

1. Free the IRQ
2. Free DMA chans
3. Disable runtime PM.

Your patch switches IRQ the devm. devm handles un-initting things in
the opposite order but all devm stuff happens _after_ the error
handling in probe. That means that after your patch, the un-init is:

1. Free DMA chans
2. Disable runtime PM
< start running devm stuff>
3. Free the IRQ

...so after your patch the IRQ stays enabled longer. I could imagine
that an IRQ could go off and try to use a DMA channel or do something
that needs runtime PM and then things will go boom.

In the very least, parch #2 needs to come before this one and that
would help, but it won't fix everything. Specifically in order to keep
the order proper you'll need to use devm_add_action_or_reset() to
"devm-ize" the freeing of the DMA channels.

-Doug

