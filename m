Return-Path: <linux-arm-msm+bounces-28335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6BF94F65E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 20:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE2551C210B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 18:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA665189913;
	Mon, 12 Aug 2024 18:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jv0rL/Rd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298B21898EE;
	Mon, 12 Aug 2024 18:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723486347; cv=none; b=SSJ9IVJXfap19WkXfHWyRch+Sg7Inj2pBhyYMtc/fjszXUA2rq4WG7WdMjdpeZVmXAxPfOAOHrpZ8rOQ8ZrxRgOstfJCMa5Etowt4MekzZZutm3aCtFSCA+MuvQVASv/pnn09StrnSqkDZAWuO9fV3zuyifAVL5huJyGWtl3wE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723486347; c=relaxed/simple;
	bh=QsqnkDNBumoj+uOJ/jhWL0TgwdKeWRiQ9ujYF+2aH4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dL0Msmxc3B7tR7hD52DwQgcQfIoXeSe5TbfCViverB6bzfokQPVMoRSlNtkv6tEsZ9F5wy43qsN9BfIGQHrV7uBePCnkUdw1Fe+ZCrR8d5mMwL0jTzH3sxoQNSG8T58S+dyU6JkkptoO73y06s8X0TNT5F1DqWkKJx7LVwl7zoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jv0rL/Rd; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ef2cb7d562so47003721fa.3;
        Mon, 12 Aug 2024 11:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723486344; x=1724091144; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JESqKurG83p1EuSlHKY8UFmjpYQDpGQfUya4uolhwfQ=;
        b=Jv0rL/RdyX82YJYOUWi5Yvo/8Y+ASfQ9/FsRZWaGFd3D7Eu33LP8OBHnD68a/Y+xpG
         G5BfeataYr/3uJ8zCkADlmjp+RrVW9MUMr/zN18l1FByyjeKsqwqYwmZI3yRBFD1Fon3
         GKgR+wL6jZ4zGA4HQj/i6WujuqYKkY2jXMrpt6M8afOEVZwm1xTkp5kVspxwqWMGY3+q
         pX9uKqXW3VYYhnV+RKBVPQpa4o4PxMg5NdgrUjTBmOiTqYoemQCa7AmQ6hLFgvlWzbj8
         zbHsnDTJh5iS/AtfemBKJC1tCphul0R1pZadYB6GHKCdRN9dAvWSG2c/9dhp953EmNP7
         ZcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723486344; x=1724091144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JESqKurG83p1EuSlHKY8UFmjpYQDpGQfUya4uolhwfQ=;
        b=mEL49JTwNZIUyTy7x1aIvo7sntAizdCAw9flIAWQYsyOi5L/quQMxZ1rUsA0EAb7Dx
         DvhEJ5CwBUWiKC4vkoe/aZCuxv4SegeSF1sizsG9U8YXuk28QOUtZKMsLGcF0Vb9Y/1/
         l6E7aSqSDpANDXBxCOkrzEWn7Z7BKvy2Ec/2IFsgj6Qohat0i5XIHTbieUcCNZtWPO1x
         anjqhchNDE0ngZmHoX5y4MUsAAWJFjui1hbfL/Rk4wpxIcpzLTGZbjTAe7cZ37g0UmFB
         Dz0yM86I6TDPPNFaFJxKRrhfYrCuMMJtxgyv5i0Dwe9TVCDoWguRCdEY4fqYzuiUUVjF
         gc9A==
X-Forwarded-Encrypted: i=1; AJvYcCUgBnSBxPvEQZsu80mP7WiU4dF85o4+szs5+ggVpl2RdYgiRzEmCioZtj23CtC/aolCcsmeImHwe3WPNqTwqGNIQJ3o1XGDG6xf07Yk7aMvLd/kOmFLEzKA3lsZlumcYh+YPxIUd9SK02rZnA==
X-Gm-Message-State: AOJu0YwiR7GZnCZmuLkpXr5dl1FEMQq2attsnbaC/3UxYY+TDnOn0Ln4
	Qt+kRWEAdyzOkpQisjPDV4wR72bkzYntYNxMIrKLnb9xmFeINYWCkIqxYtH2XpBglZSuGX1MJs9
	tveSbs+b4nTtIUqBH9ff2G8K7xZ0=
X-Google-Smtp-Source: AGHT+IEaHHcoOSUhdthn7Ei/aIhCd/rHZDID8QRpi2Tn0d4rm/4HfwxhjeF8CwHo3ka3eJcTptWvYVO30ASr34N00/0=
X-Received: by 2002:a05:651c:154a:b0:2ef:2bdd:229 with SMTP id
 38308e7fff4ca-2f2b71569b4mr8650781fa.25.1723486343836; Mon, 12 Aug 2024
 11:12:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240808235227.2701479-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240808235227.2701479-1-quic_abhinavk@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 12 Aug 2024 11:12:11 -0700
Message-ID: <CAF6AEGvMRa4-33QZ2j7DE42exnmbh=XtyTiNsxMY4HVW4T5kVg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: fix the highest_bank_bit for sc7180
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, swboyd@chromium.org, dianders@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 8, 2024 at 4:52=E2=80=AFPM Abhinav Kumar <quic_abhinavk@quicinc=
.com> wrote:
>
> sc7180 programs the ubwc settings as 0x1e as that would mean a
> highest bank bit of 14 which matches what the GPU sets as well.
>
> However, the highest_bank_bit field of the msm_mdss_data which is
> being used to program the SSPP's fetch configuration is programmed
> to a highest bank bit of 16 as 0x3 translates to 16 and not 14.
>
> Fix the highest bank bit field used for the SSPP to match the mdss
> and gpu settings.
>
> Fixes: 6f410b246209 ("drm/msm/mdss: populate missing data")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mds=
s.c
> index d90b9471ba6f..faa88fd6eb4d 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -577,7 +577,7 @@ static const struct msm_mdss_data sc7180_data =3D {
>         .ubwc_enc_version =3D UBWC_2_0,
>         .ubwc_dec_version =3D UBWC_2_0,
>         .ubwc_static =3D 0x1e,
> -       .highest_bank_bit =3D 0x3,
> +       .highest_bank_bit =3D 0x1,
>         .reg_bus_bw =3D 76800,
>  };
>
> --
> 2.44.0
>

