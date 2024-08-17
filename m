Return-Path: <linux-arm-msm+bounces-28874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF179558B3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Aug 2024 17:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 937141F21CC1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Aug 2024 15:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B36C1494DC;
	Sat, 17 Aug 2024 15:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IUqr1CKi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB9C25570
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Aug 2024 15:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723908865; cv=none; b=I8MWtwOI4nKZYCu3hVzZgdSbdgcQmdF8Vcs7AEDILvynItR6vy3aLTROFAFi7fQsgiPwPQIPOR01wLGlD7bbJ+X+wx1BUwJyV42GPORZAbbLVebSKjgEaX87CFP4DMCZyyKGnICEkSxSGY79F7tziY0TKlE8nCC7teib17Kq45w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723908865; c=relaxed/simple;
	bh=4W/Y6BiJMxSnwgO47spVbAk5tyI3nap6YIH8p8Sxih8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E4/MHGCxUHOyYGHi/BDvDAnMv5VBQ93nv9Nb2OQLT1M3xLIxWN7AQmkjGKC/fTSiG6IMNDRfsP+YALgz1mS3lfIjH2eRTkH4d6Hbs0ixP6WnrL+7i6n62QIJNBLxzuwzal1awIEMsXBzZJLiFZ9J1ezlYJXTYSgwL7s5kfDFy9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IUqr1CKi; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4929fd67c7bso910873137.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Aug 2024 08:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723908862; x=1724513662; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8eoWHKmZrDuz5TVj5RFNMVS0TvpziubW752S/ws51A=;
        b=IUqr1CKik/4LSJlesgHFoMQPD6x3PHg1AYphAfW7XdQTEzn5eoHd6HiE2Ci7k/90qK
         6ERBEd0RZtRUeUYbVxsBnRi4P5qb+rULIe/NOdrn969Qm878hwygyxQu1Cp3GccKysgJ
         b414ri4v9EMfBo2VBJBYDdAzCXOZad6TI0AJzEE2b+wY6Qrw64IHKPaee6tFqAguBkdK
         i4JhIkDiu9lLBi1dNn1bfCKeYVX0ndAgXBsY3Ngeg51sXdjxbjYVFaljeLezoPKCxT0j
         a/d+33QTFog46MwC5NQXQY+0i/KfuJpETP8TILZZzqRF/Mq3eeuJ1nOoQjfjUPcreu+u
         8ICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723908862; x=1724513662;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z8eoWHKmZrDuz5TVj5RFNMVS0TvpziubW752S/ws51A=;
        b=QjjkPeMdCAnHBlv+daN7ebAaZf2xk1K1PyyiRJunDv+mKcp0DVLySceqzT23/NEjsV
         jVJ0tlPVsermG1XylyS2Y9VVrX/3i4P0W8+Y/6ZHebRihkNfEo5t2IWPlsAgciwH8kuM
         GGDzN834gtzTVlhUU7HvRdj+jkxshewEqislYWttiLm/iB6VMtmmOGAONibdIwQUqo5r
         VHhySlV3tyTqGvRejc6Soh9rFLcOBjUtLKRTBvQx5XagpGLndTrUnhCBttUCXe0LOKTO
         hWeeleAq6+9v6T0vganAhjSoxFyHEd1j2kP4JLsNQgwDnnlR7/NXzCj/OCPEXZnxKMyG
         Uy2w==
X-Forwarded-Encrypted: i=1; AJvYcCUUtqgzZOYjDShAlahhNWLZwlXIAtr91LBbcqqxqm3iWEqtrCkgEPgX+MdEDtxXM3uyadZQxSiCKEXB8YT8FKU2k3HtdXtGlcAVzHUUCw==
X-Gm-Message-State: AOJu0Ywk1jDu0y5sRvGGXKOkBfuKG0JsyNXhuYpduxx/M2c/vSQtjU53
	AA673QsEHe7MTybvfc5at6I59ksT5vnShy8KdSmWP8Ee+pT365kNHNR/ky/lEZX87X5iXqH1Sw1
	j4fastTAOv3XjawTj5jqIlrhB8l0LAiT5AzrXQg==
X-Google-Smtp-Source: AGHT+IGryT/KxWwiBHtKufxRiy8ES1KCnuo4booGpak6/PFr/3xYW4X3k+uP5qw9d5dQpPL/X2iClWn1D103V2/VYxE=
X-Received: by 2002:a05:6102:304d:b0:48f:8ead:7b7 with SMTP id
 ada2fe7eead31-4977997fc1fmr7556666137.21.1723908862208; Sat, 17 Aug 2024
 08:34:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240816091210.50172-1-srinivas.kandagatla@linaro.org>
In-Reply-To: <20240816091210.50172-1-srinivas.kandagatla@linaro.org>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Sat, 17 Aug 2024 21:03:46 +0530
Message-ID: <CAMi1Hd1bYgmnL5O946rxVK2k8ygYm1ur2nCe3KNpmYHnvPa+hQ@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: codecs: lpass-va-macro: set the default codec
 version for sm8250
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dmitry.baryshkov@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Aug 2024 at 14:42, <srinivas.kandagatla@linaro.org> wrote:
>
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>
> sm8250 and sc7280 have lpass codec version 1.0, as these are very old
> platforms, they do not have a reliable way to get the codec version
> from core_id registers.
>
> On codec versions below 2.0, even though the core_id registers are
> available to read, the values of these registers are not unique to be
> able to determine the version of the codec dynamically.
>
> Add the version info into of_data, so that driver does not need to use
> core_id registers to get version number for such situations.
>

Thank you Srini for this patch. This (along with the DT patch [1])
fixes the HDMI audio regression on RB5.

Tested-by: Amit Pundir <amit.pundir@linaro.org>

[1] https://lore.kernel.org/all/20240815170542.20754-1-srinivas.kandagatla@linaro.org/

> Fixes: 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get codec version")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
> Changes since v1:
>         - updated commit text to add more details
>
>  sound/soc/codecs/lpass-va-macro.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> index 8454193ed22a..e95d1f29ef18 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -228,11 +228,13 @@ struct va_macro {
>  struct va_macro_data {
>         bool has_swr_master;
>         bool has_npl_clk;
> +       int version;
>  };
>
>  static const struct va_macro_data sm8250_va_data = {
>         .has_swr_master = false,
>         .has_npl_clk = false,
> +       .version = LPASS_CODEC_VERSION_1_0,
>  };
>
>  static const struct va_macro_data sm8450_va_data = {
> @@ -1587,7 +1589,14 @@ static int va_macro_probe(struct platform_device *pdev)
>                         goto err_npl;
>         }
>
> -       va_macro_set_lpass_codec_version(va);
> +       /**
> +        * old version of codecs do not have a reliable way to determine the
> +        * version from registers, get them from soc specific data
> +        */
> +       if (data->version)
> +               lpass_macro_set_codec_version(data->version);
> +       else /* read version from register */
> +               va_macro_set_lpass_codec_version(va);
>
>         if (va->has_swr_master) {
>                 /* Set default CLK div to 1 */
> --
> 2.25.1
>

