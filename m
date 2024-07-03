Return-Path: <linux-arm-msm+bounces-25033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF739255B3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 10:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9664B23390
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 08:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4804813B29D;
	Wed,  3 Jul 2024 08:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0Wx03H80"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4A925760
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 08:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719996330; cv=none; b=NjnJVFkE4xjxBh/rYSyQzRvrlxf8eXGNspPNsbVmkC0rxSidJIigZOK851iuprMXwZN9s/JplF88xB38lAC8rtOJnxjinpANTRLdveIqX4wmZqZnbqRa9pjAiNn1WlPLjQjscd992SuaIu9Fj/bArmbTk+Zkft7uHGJAn60+JcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719996330; c=relaxed/simple;
	bh=1/78X+s0pwLYqNvet2Tcy5BBn4d0W8hkbGlv0yYIueY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XPGlODjZnB1bt6xTu/QC+Nu9pn5sj6tLTDtithb0bsjgfjZ9oQmjYyc++fRP6yLy15nX2QSRHIchIeRX/3h/c8BfTHwTobQnT4NHDD+rKOpBhjRawDk8RW3zozJ7CbCcdDMqINU3LuQ4i5O1F0jXEtqyEE8OIB+WRvKtyeltw5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0Wx03H80; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2eaa89464a3so52443861fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 01:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719996325; x=1720601125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnVZx57sQWGSbnJ3zKpnLdMuefpCU4Ga5SRMPYlDzsY=;
        b=0Wx03H80EQc74/PdjBeqLLJWkyt2wzJBTncu1h3lBfdmdC1cJeEGjY9BD/qDIvg2l0
         uilVxTPYaNEByY9uKABiFi3sTDD0ymcf6yMySxgmIUH1oBHm2osgh0mR6TS0bf0sbamJ
         aVxPvpuZscq9t3UdFiulRCGro2KO66xOe1DHQgD1byqYAeFu11vxCNHqtgF2MxAIW3Ha
         rqMh0XdN3+48/Exj9zmqJIMC7tRr/nqZO9amK52tc+pjVGb72JV/mN/qQ1POmLJIBZcP
         acShnn3JcKiEm+6D9rp9b/I1FDDhqCe4YuiekmNXY8+TLhib9gzG56011m+24+dFnmzp
         QWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719996325; x=1720601125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tnVZx57sQWGSbnJ3zKpnLdMuefpCU4Ga5SRMPYlDzsY=;
        b=VcrPEZ3ifv2ukfd4QGz5YFHAmXKV5TqeVvgwI7qwR5znU4qcqj/sn969D/m7OECHdl
         Z5EZ5A5KmfFyHM7LrsXRmmtvl36xHQcBPYMKFNzZY/OtqTkWxtOouy2WllK0aaoq6yAt
         30PXn9vatW/QaOyj7UWLc/0A8G+vGVVdnK+Ox9UIgqpXT3QBcaHpubDMkbIGUxAAW3eh
         eyV/Mj2wyynTMKdRO8ghnO8GyGhL7HJdPZ0d5n2ufUVfG5ynRHPJK8MFFhEOQ/p+A+Pi
         ldELvtxr1npk6tkoRV513ETqsZqZxoQoqwBbNH+bbOtEDQr1fuCWYxfD2rJpocx3Dt0J
         FslQ==
X-Forwarded-Encrypted: i=1; AJvYcCV83amdcUG6w0MSyS7NzwA3hai/pNrQWjbWuNdNt5N2SOBhHi8mZhj/5J2WwfcBLX5nS2xHj5bOHhu2duoqcTh6GNex4z8EXRJWxxKXYQ==
X-Gm-Message-State: AOJu0YzahN5mBUFDGe8zdj3sQaZwjrNxuuZ65a8EsBXFnUqrQfd66Mf1
	vk7CCXZqSxYM+tP64yTw4vyXyVebktdWyfGQj322A3NpiVMl/NxkMNjD5s87ecK3vz4u9UAggkZ
	A3fJ7bN2fylOUmVleUWW//GQZ8gOJW22kk0kSQQ==
X-Google-Smtp-Source: AGHT+IFDOft8KfHB385vJiuHxLREIXeKetDDnVDU4joFIwEfhZmdo3TLOETTixZXyQ8sBTgvse4OPp+ty0rpbAhQjKU=
X-Received: by 2002:a2e:be13:0:b0:2ee:4ec2:8232 with SMTP id
 38308e7fff4ca-2ee5e3c35e6mr75111591fa.25.1719996325489; Wed, 03 Jul 2024
 01:45:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240703083046.95811-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240703083046.95811-1-krzysztof.kozlowski@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Jul 2024 10:45:14 +0200
Message-ID: <CAMRc=MeW2ztyYkftJBy_ac30H+w0LinR9BFAmHMdsfQXa1EgFA@mail.gmail.com>
Subject: Re: [PATCH] firmware: qcom: tzmem: simplify returning pointer without cleanup
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 3, 2024 at 10:31=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Use 'return_ptr' helper for returning a pointer without cleanup for
> shorter code.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/firmware/qcom/qcom_tzmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/q=
com_tzmem.c
> index 5d526753183d..ab156ab3a6b4 100644
> --- a/drivers/firmware/qcom/qcom_tzmem.c
> +++ b/drivers/firmware/qcom/qcom_tzmem.c
> @@ -242,7 +242,7 @@ qcom_tzmem_pool_new(const struct qcom_tzmem_pool_conf=
ig *config)
>                 }
>         }
>
> -       return no_free_ptr(pool);
> +       return_ptr(pool);
>  }
>  EXPORT_SYMBOL_GPL(qcom_tzmem_pool_new);
>
> --
> 2.43.0
>
>

I'm not a big fan of this one. Same with any macro affecting flow
control statements.

But since it's there and the patch is not wrong:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

