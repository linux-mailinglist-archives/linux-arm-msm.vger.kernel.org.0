Return-Path: <linux-arm-msm+bounces-38456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C93EC9D3932
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 12:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5DA0B2DB05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 11:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23CCA1A01C5;
	Wed, 20 Nov 2024 11:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lj9YPvUn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6DF19F108
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 11:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732100818; cv=none; b=nPZfbMnSU1Om7N+pn6kWvGD7R4GG5WQPcpal9bVJm6OjpaZmt43ZWwFUkcWKsIeLIWVrxvwEj3Q37tJS9ROS/CyuFBqLmrW6NQiiw++8MSuZuoxqtVMWEU9BkzgCz315cFemY1gvSIBmYuvG3TOaFIaBzzh6J2/vcKvd+RDlKrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732100818; c=relaxed/simple;
	bh=E1fMywgxDcHRktEbljCMO94I8Q/I8jzTUKls+5BAhJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JJegeNEw7AsFOa5lmrEmLNkdV9MdaD1COaHP5LnWyEJvcWiyziNMeAT/brT4aHD0ZEjpgn+BraxFaLXH77BQKayTwnSufA+DmAgbuIOYOJ5svxTp5dhSYWCyiOM+XDPeNuG0bDrRCE8WAyoUWBFA/E/w0ZVWedvMES4Lq6aLTuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lj9YPvUn; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53d9ff8ef3aso2329218e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 03:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732100814; x=1732705614; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0a2Q1YpX3f2jZn2lmKVw7Bna28DOeMJLfMK/S0CPYlw=;
        b=lj9YPvUn05IVyLaRmn4dTDNIJteFggyRpj0lgo7m1P8q0XM2dmqemTP3q+vdjO17/y
         QRq/BbIgNoMwuV5rfzlujhzhF6CKo7kpyqhGKhdYRyyFIcPPTdrJEptbChfBpRd0QLvO
         Y6aeo5878e0nxb6ZwPMDXdob4eAr+i1RS4qj9pLk5BCVYbjXNX80IDe4e/JRhWV3vaqj
         jgR5YRgMt8NVfAYE8QP/qRRA/rFFAPP6PVy+FBR7YGnHOavNU0i87MfqRjPoFWox5TXA
         xvaHklBb2vMv+0nTkCkqMF5tPiINZRWbI4/2HVmyyl5P3x8SKw3gUw1vekXMge8ysqEw
         7B2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732100814; x=1732705614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0a2Q1YpX3f2jZn2lmKVw7Bna28DOeMJLfMK/S0CPYlw=;
        b=GF0SBLmdZc8CCjBEFzTkaNQpDemeXeujLZPiZYPLzYXBiNaKO+BGUCPOv5jIwcLQic
         KSn0ZnHL9t9zYoc/pwr5x6pwjLEjBZoggi33uk9+tqXpXuor9GzYmAUtekzBtWEHL8dS
         3zEsctJE5gFHqu1QIyGfbWx/gueSiW8lCiX1O6ZFcYxPMt2TC/btmfMGTNGfIgmYfdiS
         co+peGOp2YxCaSs/wkH8mRNdJC0ZVLyoy+ZdxFfQNuKoc6gsN6lxUKFzaVaCgezYSZ6U
         oUZRH/K3os3gyT28aIeln7UooMyG8jhwBfPWtIMFsrAnCOQFxa+535/x0FtOxf1vjOaF
         Wy5g==
X-Forwarded-Encrypted: i=1; AJvYcCWCu6HUIr3H6XxFNLqzXb4lySnUh1tgMO2M8bskxU7+ZbgYO3FH8HwCOKNUZqU5zppwjV/jBIPyKDO1/dFJ@vger.kernel.org
X-Gm-Message-State: AOJu0YylSb17ouNspnpuVxtRObRAJX9DOAs67wUs3U7cBsmhqqAQKeab
	1M5qmGSNomzoZCDULhjXMBE9LzAw5Ekr7xLUxyK15oOiw2eiLexZGv0jxsgQLZ2K2XvOUu39k2H
	XcGR/egs/D90beSK2gBKmq65mUMrSzSl6vUwQ4g==
X-Gm-Gg: ASbGncvRQ7rvW22klbldNqW0z0Huw4hcDbNPmzCkX5y3X31DfuhG3NW92sQ2mullB0y
	W/OufO0hrBwlFNMWI+0IGD3Tkv9YFYKQtWVqP9yuJe4885HYNcUigXNBwUUVZzl4=
X-Google-Smtp-Source: AGHT+IE/x949hrTGW5Uqy8CIyatEY/kXsSYucKCpBxkcG1D4ERCx0WrgFXmLbfvQh49sIz3CfwXECwr/RgGqRvj1Xag=
X-Received: by 2002:a05:6512:4012:b0:539:e97c:cb10 with SMTP id
 2adb3069b0e04-53dc136cfaamr867566e87.40.1732100814608; Wed, 20 Nov 2024
 03:06:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241119-qcom-scm-missing-barriers-and-all-sort-of-srap-v1-0-7056127007a7@linaro.org>
 <20241119-qcom-scm-missing-barriers-and-all-sort-of-srap-v1-6-7056127007a7@linaro.org>
In-Reply-To: <20241119-qcom-scm-missing-barriers-and-all-sort-of-srap-v1-6-7056127007a7@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 20 Nov 2024 12:06:43 +0100
Message-ID: <CAMRc=Me1n0u5jMCgAi6yXPxEK2dBp4Nz55r378h+qBru4ZKzVQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] firmware: qcom: scm: smc: Narrow 'mempool' variable scope
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Mukesh Ojha <quic_mojha@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Kuldeep Singh <quic_kuldsing@quicinc.com>, 
	Elliot Berman <quic_eberman@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>, 
	Avaneesh Kumar Dwivedi <quic_akdwived@quicinc.com>, Andy Gross <andy.gross@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 7:38=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Only part of the __scm_smc_call() function uses 'mempool' variable, so
> narrow the scope to make it more readable.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/firmware/qcom/qcom_scm-smc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/qcom/qcom_scm-smc.c b/drivers/firmware/qcom=
/qcom_scm-smc.c
> index 3f10b23ec941b558e1d91761011776bb5c9d11b5..574930729ddd72d98013770da=
97cc018a52554ff 100644
> --- a/drivers/firmware/qcom/qcom_scm-smc.c
> +++ b/drivers/firmware/qcom/qcom_scm-smc.c
> @@ -152,7 +152,6 @@ int __scm_smc_call(struct device *dev, const struct q=
com_scm_desc *desc,
>                    enum qcom_scm_convention qcom_convention,
>                    struct qcom_scm_res *res, bool atomic)
>  {
> -       struct qcom_tzmem_pool *mempool =3D qcom_scm_get_tzmem_pool();
>         int arglen =3D desc->arginfo & 0xf;
>         int i, ret;
>         void *args_virt __free(qcom_tzmem) =3D NULL;
> @@ -173,6 +172,8 @@ int __scm_smc_call(struct device *dev, const struct q=
com_scm_desc *desc,
>                 smc.args[i + SCM_SMC_FIRST_REG_IDX] =3D desc->args[i];
>
>         if (unlikely(arglen > SCM_SMC_N_REG_ARGS)) {
> +               struct qcom_tzmem_pool *mempool =3D qcom_scm_get_tzmem_po=
ol();
> +
>                 if (!mempool)
>                         return -EINVAL;
>
>
> --
> 2.43.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

