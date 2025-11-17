Return-Path: <linux-arm-msm+bounces-82067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CF234C632A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 10:29:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EB97B355E3B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 09:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FAC0328241;
	Mon, 17 Nov 2025 09:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tuj5jgil"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F683277B8
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 09:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763371396; cv=none; b=ZqEPgCNBtaLuxpZNluvSZrwSYxYgn+wNpINkTIyyqIP+JGY0WQUmcOB92osNakAZGZ4p5ouOibMfu5zins+JOr+jhNJaTyDblWzay7lN7kg9fHW6Gza5LZ57AGuoTJywv3U7yVhuuEmwSxORPGhM+bb5sgUD7nn4t5I6nU7sZcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763371396; c=relaxed/simple;
	bh=RKnqT2KqSctfNJ2pjaGPOJIT/d6bo6yTQYK/NCByHWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lv89Rt5p+v2qNS5EC2OSQfRHPVTqlpy4EaVHx2mmsrm7mHE1fmddL0oo/yo+W4aUh1IzwnAKD1wR7llg20E4pJ61ifzCO/WjQUfGk6xY6PdsmeIcR7bM2GPt8vBtUjQ7IeLu7In4pPSwU8Np0zuazGtK3S6F5OF01Vlo0MmvY70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tuj5jgil; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6575e760f06so35284eaf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 01:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763371393; x=1763976193; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4chC1UhzWHG1RzGT/1Z6xNEi5tzSJCzbJWUJbZLzDE=;
        b=Tuj5jgil75KznJLK9fyoZK/0HS4bAiBBgTULaHws2oT4PD5+03N9hVD70DRK9Fjglo
         NK4LO0KQ55GlrzczJ7rFQbmC8oyANHPHoBS9yNCxMq4FiDXfXDYQo5UZCv6BQow2TqjD
         /zK6FX6qWXrEigrFKX3tQNLouTRLoJcJ6A54dToVB1ijmoNPsjLRSTIEqZMFCVbJR/GD
         MWIZ1LWVYXpZr5NjWy9KZyCBEfOmeq5N+D0oOxtg0Lvp9ioocQDamxyt1bBe5lOHkFGg
         YutnzQo0sBEo3R/+34N6CSgT0qgJn87/AEecZd/Ks1TSCac2xToNgprJgUjMM4HuHyXj
         pj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763371393; x=1763976193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t4chC1UhzWHG1RzGT/1Z6xNEi5tzSJCzbJWUJbZLzDE=;
        b=v46aQ5qlYmXpD96AjmfaDgm82WzNav5VztAIBWu4PVb7o9vHjo3Cy7f0qY1ZHYvhJ4
         OWN8cuYgo08SbFh6AMN+RYQtfDExHCkMM5MAhDgMXv2lacStoTvuQWqXC5vFLWYuuZWz
         JYR61AlfsNUyg7ebm4QKYkwd052cITXyfV4eHwLdUpu3IkSdg4s2eHCqxyi5XS4C265O
         tjBEdu1FYxum8IkD6gAkKCanjR53gu6q2fjcKnGMBkQh/nN1oOHNJiUwMMAp8GO4cwQ5
         wVjSCWRD8IhmNubmnqt/g9noCNyj+qip0aeXkNIQKDspX/obPovAHoKEQMSAMVdbxVn8
         rYEw==
X-Forwarded-Encrypted: i=1; AJvYcCVXxF/jCJTkU6p/i9QOpXVaRBknGasKW6qezogVketPHM6dRnezkgHY7h+PfkPa6ajPkQL3sZA3t91YmpCe@vger.kernel.org
X-Gm-Message-State: AOJu0YyuBuYXd7erUC0D8RJ16dD9tWGQqScNqB15lrObkBKKPVJbvWff
	LohvZZ1kEng08tmF++NbZLudEAtk2P8hvIeKKyLXO1lIe8aXmXt6TfK7CFv/3yDVCUNRqp+WVwZ
	n9tzQPlXKDKX7U7TBBj7Ftjeby8AVnzEdV64OcQ42QA==
X-Gm-Gg: ASbGnct61/KnZajKKFEeP7H2O2hT3nuB5+czlHqdVAQdAk+RkRDTCoz4sxtnkxsjQ7B
	XyrljQkr4hcfesJNlkVlfP05lUeN0UncfztB3u9g/EPMUNgirAw2oConw93URCZt4r4AxPXnb/f
	SCUfeXT5STB3aaGgz0senwfFGjUuPiTmNMGNSewFztcwODVVdkDyHfWDro7pKvb0vd4xbcDsGTh
	0Y+bHn3+VuAEoVJj5kPvRYKlKVl82orAvI/A90Gqc9YDnYzxEKOx/K5Xj8bfCX1fYmTwQ==
X-Google-Smtp-Source: AGHT+IFx1aobTjTOI8ZRdrI0Bw6ObhW09daX2hM3HwlY057J92B1d/Buq4CAcijX9jS+ZbaU0OkIProQV+z6GMnaMYM=
X-Received: by 2002:a05:6808:2182:b0:43f:5552:1e7a with SMTP id
 5614622812f47-4509743a3f7mr4635755b6e.29.1763371392833; Mon, 17 Nov 2025
 01:23:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251113-qcom-tee-fix-warning-v2-1-915a460e7d21@oss.qualcomm.com>
In-Reply-To: <20251113-qcom-tee-fix-warning-v2-1-915a460e7d21@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 17 Nov 2025 10:23:01 +0100
X-Gm-Features: AWmQ_bkPAg3yOV5rQU_WBqbrbqLrRN6sXdiJvxHXUM0qS-Qn2nmmQQu7FERO02M
Message-ID: <CAHUa44G_5jRy8YfDCAFKoR1+ODn3kOJh=XDdjS9=bkXEgxV9-A@mail.gmail.com>
Subject: Re: [PATCH v2] tee: qcomtee: initialize result before use in release worker
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 4:38=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> Initialize result to 0 so the error path doesn't read it
> uninitialized when the invoke fails. Fixes a Smatch warning.
>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/op-tee/7c1e0de2-7d42-4c6b-92fe-0e4fe5d650=
b5@oss.qualcomm.com/
> Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
> Changes in v2:
> - Update subject to tee: qcomtee:.
> - Link to v1: https://lore.kernel.org/r/20251110-qcom-tee-fix-warning-v1-=
1-d962f99f385d@oss.qualcomm.com
> ---
>  drivers/tee/qcomtee/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I'm picking up this.

Thanks,
Jens

>
> diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
> index b6715ada7700..ecd04403591c 100644
> --- a/drivers/tee/qcomtee/core.c
> +++ b/drivers/tee/qcomtee/core.c
> @@ -82,7 +82,7 @@ static void qcomtee_do_release_qtee_object(struct work_=
struct *work)
>  {
>         struct qcomtee_object *object;
>         struct qcomtee *qcomtee;
> -       int ret, result;
> +       int ret, result =3D 0;
>
>         /* RELEASE does not require any argument. */
>         struct qcomtee_arg args[] =3D { { .type =3D QCOMTEE_ARG_TYPE_INV =
} };
>
> ---
> base-commit: ab40c92c74c6b0c611c89516794502b3a3173966
> change-id: 20251110-qcom-tee-fix-warning-3d58d74a22d8
>
> Best regards,
> --
> Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>

