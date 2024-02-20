Return-Path: <linux-arm-msm+bounces-11843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EABB885BCE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 14:11:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2924B1C219A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 13:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9147E69E1A;
	Tue, 20 Feb 2024 13:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R4y1gYNE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CBA5A7A8
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 13:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708434710; cv=none; b=hcDAo6CBvBgiz4lHextLntTGAWCeXfdwCIAvKC84nWHE7UNhbFiRixst4wIS8ldOYDhkOgUIy0UjYBaF9KZFauc5i7dzYO34vx3s3mg0SE3SlXRsmRsG2fidS9tOQbzs/8iu/9pH2GgxbShT39ZHhlawMPtOUjRiNJo5pSF8RF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708434710; c=relaxed/simple;
	bh=2Ktu8zj6dWIh6kg3eHwy3CUY4nK/+DNcc8CukbuJQlY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o5wLn4wB4aJkan3twFz++qtlWrLMIGsN+DxpOI8MLPMy5uqEtkqxk+8tmItuRHAFrWlSLk+Pf/cl1GiLLtRXHhJpvq30Y3WakuG9E683AKksT0bvm+xgaqPegP480x+ejpUCwqEgPr0PH5DVegjZq/YhKAZamuCz0gqVPlGeAdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R4y1gYNE; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3392b12dd21so3167964f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 05:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708434707; x=1709039507; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jh0XLZKxGstbU+73Iunkxnq9ZWdTIJGh34NljKi+HTQ=;
        b=R4y1gYNEmTacmClj4aslhVUyzbpc05w7YMES/kTPYqxB1qHIoShyq2KzJIiQSd/NFQ
         rEp8/D2GV41rifXKpOrJz5I+ZymFU+LVZBqItIBbLO2XkPqpFRRhYeG30yPuDK4y0iyC
         GNw2KBMkQsEbG6d1RG35X5t8SYZAKKdChfsY7A9vbC6JHXwBuAYCmKPPLj7xgOyU8Xlr
         WUIhGFRbPedOLwi/04+vSrOvxdnuTR7LpJYO5kYLJnDuaNGtNwB2h7mRpzJxT0rJlYBQ
         RW4ntKAtJA2XqaQ3xJIJsey+RXlKwUXw/fKnZTYalI0lMBQKZmoq2w3Np0vbTXAkMrGa
         lTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708434707; x=1709039507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jh0XLZKxGstbU+73Iunkxnq9ZWdTIJGh34NljKi+HTQ=;
        b=NOIJBZrjkiVuTWHdvHUzFHpBpFva2EgfcuezKmhqmF/YKzOigoN3DDHN0vLAJxHxgB
         AQiz0i7d1Nj0rhp0GXcFo2rhEM4VLcqqtDQXJgB+n+B/aRmvX8xa9rXn5U0+2R8a6snG
         rr1Hx9cAGv/YXQcDvBIR1Rhw1vDCrNfxrq52Crs5+HCHKWWjyLqCIWx3nT8FXgn15emp
         mFQZVvscYbRK/3//AmY3k/sTAiznbb1XVQusOfivurM0dXcfOtbjuM/MeiT35c3j6cSJ
         ffhzewI0HmIlDZQhFAnl78c1ojKOLHwnRptJyqM3ZCTdNyGYGfyyOhixUJhuCCR2GK3T
         /ODw==
X-Forwarded-Encrypted: i=1; AJvYcCWYhf4Et6R1WLdKsMUncw9oUVYcRauzeQGbVUPLCA12ex+rm6UKYlzS/ICN6dDEjaylGj8cWKVKB2CFeepzKgYHmWoUVFjPmRCVS9OKcA==
X-Gm-Message-State: AOJu0Yzy43otsY04SXYHpxvxqGbydjYeGOVIvIlCV5tRRFcDHmHbCl9W
	ztl+entM4cPoCjr02fFud0OatC6zzD3WxPJBusTCHBh50jacanosPU96faDVIRQubhRbh9WX5m3
	wJBcObCEv46sF05yjevR4PHcF+rg=
X-Google-Smtp-Source: AGHT+IFnUvbzWhpd3T+gixNS1N5rv8Q8mcjl8T3JlDQNt374EKAfm+9Mxk0703OTixhgMtiaE7371hMTrKQScrdqjgo=
X-Received: by 2002:adf:f60d:0:b0:33d:27cf:6208 with SMTP id
 t13-20020adff60d000000b0033d27cf6208mr6344072wrp.7.1708434706815; Tue, 20 Feb
 2024 05:11:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240218134434.2531636-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20240218134434.2531636-1-dmitry.baryshkov@linaro.org>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 Feb 2024 13:11:35 +0000
Message-ID: <CACu1E7Hi7JgCAneOfK-M32o6Okzsqm_uOT_qsmiKWC5ZBzEMsA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: skip programming of UBWC registers for a618
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	Leonard Lausen <leonard@lausen.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 18, 2024 at 1:44=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Historically the Adreno driver has not been updating memory
> configuration registers on a618 (SC7180 platform) implying that the
> default configuration is fine. After the rework performed in the commit
> 8814455a0e54 ("drm/msm: Refactor UBWC config setting") the function
> a6xx_calc_ubwc_config() still contained this shortcut and did not
> calculate UBWC configuration. However the function which now actually
> updates hardware registers, a6xx_set_ubwc_config(), doesn't contain such
> check. Thus it ends up rewriting hardware registers with the default
> (incorrect) values. Add the !a618 check to this function.
>
> Reported-by: Leonard Lausen <leonard@lausen.nl>
> Link: https://gitlab.freedesktop.org/drm/msm/-/issues/49
> Fixes: 8814455a0e54 ("drm/msm: Refactor UBWC config setting")
> Cc: Connor Abbott <cwabbott0@gmail.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>
> Note, a proper fix would be to incorporate actual values for sc7180
> and drop the a618 shortcuts. However it might take some time to
> materialize and to be properly tested. As such, I propose to merge this
> for 6.8, keeping the existing behaviour.

If we do this then there's a chance that 6.8 will report a broken
value for MSM_PARAM_HIGHEST_BANK_BIT, which is going to require
otherwise unnecessary workarounds in [1] for quite a while once I fix
up a618 support. Can you at least dump what the default is to make
sure that the value we report matches what's being programmed?

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26578

Connor


>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index c9c55e2ea584..07d60dfacd23 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1325,6 +1325,11 @@ static void a6xx_calc_ubwc_config(struct adreno_gp=
u *gpu)
>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  {
>         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> +
> +       /* a618 is using the hw default values */
> +       if (adreno_is_a618(gpu))
> +               return;
> +
>         /*
>          * We subtract 13 from the highest bank bit (13 is the minimum va=
lue
>          * allowed by hw) and write the lowest two bits of the remaining =
value
> --
> 2.39.2
>

