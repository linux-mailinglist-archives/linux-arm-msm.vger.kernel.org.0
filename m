Return-Path: <linux-arm-msm+bounces-2770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7427FFD76
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 22:25:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7DE59B20E8C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 21:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D5353E09;
	Thu, 30 Nov 2023 21:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b="AZXKaZgl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C90A10D1
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 13:25:04 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-54c11430624so1657324a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 13:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1701379502; x=1701984302; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8c4Eu/Dubr5HSF4fDhNSD3Be+bs9dIetpJRDNp7v/M=;
        b=AZXKaZglrga8zJSFfonIzWWCD8rBCBLroR7NAUEwCCey2gOBjhJlv1Zppywp8uWrEx
         Ac2JxQ6SiMbT5igfh8/EyvPwoKZ8WK8DfFCbFf+foXp0D75W2ZftdWdZBsk2wLngef30
         mZ/tEyLdt8lNdXgTIPG781oAyyF9VEOLH9T0MvuaNYA3sUJyfMo9HQ3xdjC3lJwQEd35
         M5XvYOTG46VwCX1sJTB9Ir3DDGw4ifjEs3PvVGigbLqZp1Y0cOBJ3ZSOthgROZ7Mfgxj
         8+8TAykkqkfkOHfPK1ld47rLhmb529L9FslMLElS3cZyHaozSDIaPU6zPUHhuYXJi3PD
         UHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701379502; x=1701984302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8c4Eu/Dubr5HSF4fDhNSD3Be+bs9dIetpJRDNp7v/M=;
        b=nOHVlKIQhCX17khggD/pn/HWWOtEU+h3smWuJRL154wlLlG4qb8im/jZ5qbK6dq4wl
         cgktVamf/tqSJ1k9QefuNRhSGOFab4BOeY6omqilefCtX9A4zmg6aObE/dS+o6jTqn7U
         SnMA4zL63pgHsp5s80retNNu1Lysj/Qsn7Rr6+KPOx2TZAoNF2dlrdnDT0e4JFv8Vvxi
         voMar+tblbkBQwrMiXM0qLzAt+foiN1iCx4UrBArNMlwXaEdsYptraPrJemWNwue3/nl
         Sc3Hr7Br53AHSs1Nr+QmkQIs+oJvEoBC7cNLrYOPDjNzNhCJClKvfTT399lhJlA+3uik
         r66w==
X-Gm-Message-State: AOJu0Ywlshrh7kdWXuAJfNj9Q+3XQMlazggD7OXyXKD9tgFEASBjUBoZ
	hPCT29woxHReKKmPA8UWr/cnNVGClEcQToTIFsfdMA==
X-Google-Smtp-Source: AGHT+IG0ta2XtylneHDppsL8gcmXtn/Q/+7/EPbWdZikXUYS2NOvcQ4OqXc4VNcjnztwP5GcK+tdQYNKGciNXohB/fY=
X-Received: by 2002:a50:aa9b:0:b0:545:3b25:d142 with SMTP id
 q27-20020a50aa9b000000b005453b25d142mr198098edc.15.1701379502435; Thu, 30 Nov
 2023 13:25:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231130192119.32538-1-robdclark@gmail.com>
In-Reply-To: <20231130192119.32538-1-robdclark@gmail.com>
From: Steev Klimaszewski <steev@kali.org>
Date: Thu, 30 Nov 2023 15:24:51 -0600
Message-ID: <CAKXuJqgrKLw7rFdJcgueR4=tUdpP52i0P8pJoins6-9z6=sxfQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Correct UBWC settings for sc8280xp
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Danylo Piliaiev <dpiliaiev@igalia.com>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 1:21=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> From: Rob Clark <robdclark@chromium.org>
>
> The UBWC settings need to match between the display and GPU.  When we
> updated the GPU settings, we forgot to make the corresponding update on
> the display side.
>
> Reported-by: Steev Klimaszewski <steev@kali.org>
> Fixes: 07e6de738aa6 ("drm/msm/a690: Fix reg values for a690")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mds=
s.c
> index 6865db1e3ce8..29bb38f0bb2c 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -545,7 +545,7 @@ static const struct msm_mdss_data sc8280xp_data =3D {
>         .ubwc_dec_version =3D UBWC_4_0,
>         .ubwc_swizzle =3D 6,
>         .ubwc_static =3D 1,
> -       .highest_bank_bit =3D 2,
> +       .highest_bank_bit =3D 3,
>         .macrotile_mode =3D 1,
>  };
>
> --
> 2.42.0
>
Tested on Lenovo Thinkpad X13s
Tested-by: Steev Klimaszewski <steev@kali.org>

