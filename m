Return-Path: <linux-arm-msm+bounces-12092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE7385E6FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 20:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 839121F2695E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 19:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270E385946;
	Wed, 21 Feb 2024 19:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEjfYt9k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCCB53E0D
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 19:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708542760; cv=none; b=rrRlsivegPDjORIAXAffqwe5yrbKS/xgsWDAgfwvSQPSn7000ga092poZMxd9Yi8ma+iAU51k+oOJtXJssBu5/VdK08yWxBXqO6TxPRuzmcmAKSJDL6I6cMEVmJjD4eW2p/1Rgl5tSzIzuR65Y0YLefUqSFZNi2ycHnpyjRlDaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708542760; c=relaxed/simple;
	bh=hR6rE53zh35KL0lhGrjzSvBvYTTRntq7NyJYz0euc3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UxC1eJNEyBTg5YYymP25IRlrSgqUyc+68KD9FvHRMwPfTZ++C6IruGjhmWv1ERJ3Dp/Y4DVTr6YKT3HWuF89AI9ZN9KE56ufAWsABUO70Udrn9jHnKvGufzDZRjTjeESu4OQ4fvRp/Yu2ejEjtB/KpPEUzXXv3f+RmrCk+UYTx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEjfYt9k; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4127a0d8ae1so3111385e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 11:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708542757; x=1709147557; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fdMTQBKI2yKY2jABhK10F1qxiB1GKnnPjOlYF9Y2al4=;
        b=TEjfYt9kVXC8On0c1af1GFMsZCCqm2FOEIfYCpG8i4jFANmAmB3zmI8rJ1lNC1zQ8N
         uCgDCHwTdBrRTws5hS/56HCaHJTERCq8kPJOIehYVdSGNmi7/jnQ9B/1BhjwIkEnAzRa
         IKklAobz03/AvgfTsbWCbZ829z6IMeH/26oZomCg8guBnBkdmAqTD0ciP3Z+lPu+C49l
         fKqmbdrFOke6G+deTxoNOL/TCpr1gcCURQBd4/kuKYzNyUMIG3lrux/wncWaynEegZP7
         1hwuF9PlkhVxmQ5ZYcVJfAjtkP/62g2x451Eq04TmUax0VXGLACYQDcsJFjngx/kbT4T
         zB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708542757; x=1709147557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fdMTQBKI2yKY2jABhK10F1qxiB1GKnnPjOlYF9Y2al4=;
        b=d5tq2kPCJ9GKtux2+l2vSZpMz8A6KlHA2AguM7ywPL50/C0ZxPv9aS3R1DPZ+RqlpL
         ekRMgzHwmYMvFG7DbHXTVfNOzZdPtkNo1yd6bAvC8KOwhOVAOzeY2xd/JCVfgdpmqi6d
         YXbBocQh9vHCXZ7zkVlNf3y4B7XxYnfBXu82Y8ao37/IfTlf0jaCM2rGZw9w8DiKYM4v
         jFYz3jpjwg0V4sTI6VV55nCPX09FFBj80mJwNrbgrtvEE/U3PlDvdyNUIyzldZrkaSgw
         sI/6niIPYZ7412JYq11MCQXf7Eb8SmDl4uXct38quiTbnDtfDSJAJnzCbyQT/zPuj9QF
         Yoyg==
X-Forwarded-Encrypted: i=1; AJvYcCUEwMFr4dgy1LHuc3cTl1qtok7H0qxOSpg3DTaoyLrJgdijn5VDKw2kgJRuKtpj0vrIu6ZLkjiTI8DrSNgWFOxHu7J2jv70z1RJ7eUAag==
X-Gm-Message-State: AOJu0YzzzlTjkWI0PUMseyg36w/zrYm6mUX/gabxWuLi6aBXRrTS9mBH
	ElVCFElfXgrVkZQB5J/kwAFE7RV7O9+KmV7YUGoqWZJvHEXayHfsYacgWoCRRVcQhP9WbgZbexH
	Ri0aTyoqXajYmp9NMjwjHzumhDNEm4wEvPoo=
X-Google-Smtp-Source: AGHT+IGD7ehTmv5eFbRAQGIiNkkDuDo7MnHWuKvd9ELBymc/9wxgFnsfKcZhnfnKyI5cHiG44phK22cbnVo2wRf+Nv0=
X-Received: by 2002:a05:600c:3788:b0:410:c148:2a4b with SMTP id
 o8-20020a05600c378800b00410c1482a4bmr15875081wmr.37.1708542756436; Wed, 21
 Feb 2024 11:12:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220-fd-sc7180-explicit-ubwc-v1-1-611a58091724@linaro.org>
In-Reply-To: <20240220-fd-sc7180-explicit-ubwc-v1-1-611a58091724@linaro.org>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 21 Feb 2024 19:12:25 +0000
Message-ID: <CACu1E7Gi_-a4u_B7NmKAX70OgWwVBe1CMpSSGKwdUtAS1v5hdQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: specify UBWC config for sc7180
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	Leonard Lausen <leonard@lausen.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 5:12=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Historically the Adreno driver has not been updating memory
> configuration registers on a618 (SC7180 platform) implying that the
> default configuration is fine. After the rework performed in the commit
> 8814455a0e54 ("drm/msm: Refactor UBWC config setting") the function
> a6xx_calc_ubwc_config() still contained this shortcut and did not
> calculate UBWC configuration. However the function which now actually
> updates hardware registers, a6xx_set_ubwc_config(), doesn't contain such
> check.
>
> Rather than adding the check to a6xx_set_ubwc_config(), fill in the
> UBWC config for a618 (based on readings from SC7180).
>
> Reported-by: Leonard Lausen <leonard@lausen.nl>
> Link: https://gitlab.freedesktop.org/drm/msm/-/issues/49
> Fixes: 8814455a0e54 ("drm/msm: Refactor UBWC config setting")
> Cc: Connor Abbott <cwabbott0@gmail.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks!

Reviewed-by: Connor Abbott <cwabbott0@gmail.com>

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index c9c55e2ea584..dc80e5940f51 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1292,9 +1292,8 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu=
 *gpu)
>                 gpu->ubwc_config.ubwc_mode =3D 1;
>         }
>
> -       /* a618 is using the hw default values */
>         if (adreno_is_a618(gpu))
> -               return;
> +               gpu->ubwc_config.highest_bank_bit =3D 14;
>
>         if (adreno_is_a619_holi(gpu))
>                 gpu->ubwc_config.highest_bank_bit =3D 13;
>
> ---
> base-commit: 41c177cf354126a22443b5c80cec9fdd313e67e1
> change-id: 20240220-fd-sc7180-explicit-ubwc-40953fa55947
>
> Best regards,
> --
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>

