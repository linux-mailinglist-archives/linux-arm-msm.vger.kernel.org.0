Return-Path: <linux-arm-msm+bounces-25275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E5D9275C1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 14:16:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D28D91F23933
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 12:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD4851AE0AD;
	Thu,  4 Jul 2024 12:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cSRx0WJ7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709E41A08B5
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jul 2024 12:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720095362; cv=none; b=HN8ESwqc0uAldbBvdiVwdizGZ86EAphsZse60VY2Yvfg5Nt9y9muZoEDk6uddSZ5/R98XY8EhryPAvJcRAYapqCpfc1bTIBM+4bmJB3qGCuICwkUusVcupE5QfmUZuu/7vhIOLh99vTX2O2ltRk0MForaWQtarfWXk5iG290LTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720095362; c=relaxed/simple;
	bh=9re+ZPkirRwtA9q72yJ4ZBfrbSVVaq/MY2+zhm6rnEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oMx+OxmDaGjrXcUBZxNuGxSXYdnB25d2ilip7jzpjtVpZNzokcPDaWssD7ssKj995q1hYY5dSSSwX8Pq71swgeXrUxnlbs+zkYGyQd03DKUhMB48oAlFWR13rXyyk1+CiYbX70cmGdNkQOADLOCpG3vLEFn1bVy5K78hpZPd2OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cSRx0WJ7; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ee920b0781so761361fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jul 2024 05:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720095357; x=1720700157; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pxaBCPEGtzR3/vGobWG/WXT7hli0Br1nEUmusrFo3kM=;
        b=cSRx0WJ75+JuiLpHux9A34DaHj3cBZEF2LUxJ33Rvlszyc2UHpMg84WnnuhaLi+ItS
         HYxRmYut1SvLyVQue+zlfhClwe5Y7LVkqO2ShrMeRh3aG7yGhrWEZwT2Ps+5FhOUnR3H
         lwXZSzRhHbtpsqNGn6J+6MNnm0SyqEh1hHVGW5xJV/aWxsDxnAUbJH7Y6sOzLD1RWHaQ
         Xj1QGe76AzRh2F2D0T6tyruiLS3hinO1SOPJRn7GMnbxAOWC5W/Vb7FgKAapjQixkXXf
         uf9MuH6a0MUY06gWr1flvxqxv4qENPewokA/brPfPZPyrQGgjgar3ANo2SFZj+JCpRPM
         snPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720095357; x=1720700157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pxaBCPEGtzR3/vGobWG/WXT7hli0Br1nEUmusrFo3kM=;
        b=cDPwJZ/2rOAzrrCIr8iLlsxfO3I2or4qgLjBdGAGfqZUGgj22TsSWz7O3JLp0kDf0c
         1qAHXcFQKjb4FKIN6h5IIv/cV8Ri7x6uBylLof4mxu9ns8sxdQEu3TD1hx9o1YaQB2pz
         mb3rRr1Xle1UUtpwFK2iUqSTXG0uqTdeAg3nLaL7BCQYEPW26s2Y7swOtau1g7NIHfJG
         RzOP8jJtTkdx2sa8MyYKSDqVG2vqnCDhq7Sl8x5Vuj8giD8PPK+OwbfL+L7xuiYbJG3S
         6fpJv9zYB6XhIVnsqbOOj4rtwNFxkpjh2U3bwm+l2mVGtuLIGIq7CXweuLQUvXe7LYSC
         e70g==
X-Forwarded-Encrypted: i=1; AJvYcCUVS8AVF3/+IfAj3LOoKE/M1yxOCtetkDHo//hnvx9J6vr2MeVruRwczV5VmYp7FK23yaOIlV+BXGVJ29j1FsQzdGuDZnCOgQfVFW28eQ==
X-Gm-Message-State: AOJu0YweyCv+6EvMc3fw/EtRTXFR2/0toREIfMBiopGIkzsoge8sY+jY
	X2Yb75BSEs0oTybE5Q2aY6oZ++ZYRUjCuL+Br+4gQBgs+AKjTcQPLUUg+k2M1RANebWlv9Ql+Ll
	iLhmIXwY0V1KtJyUzRrOWZDociUKdaao6l9cLwQ==
X-Google-Smtp-Source: AGHT+IHrxcdp9tSDSTnbT0CEN4kOmSsHbK2wdi9lcOLJ/Qc2ZO8wqheJLZl5EDpk6Ys4tt63eobTezcbCEYujZRpYT0=
X-Received: by 2002:a05:651c:b95:b0:2ee:7caf:db5d with SMTP id
 38308e7fff4ca-2ee8ee2a014mr8177331fa.51.1720095357422; Thu, 04 Jul 2024
 05:15:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240704-shmbridge-blacklist-v1-1-14b027b3b2dc@linaro.org>
In-Reply-To: <20240704-shmbridge-blacklist-v1-1-14b027b3b2dc@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 4 Jul 2024 14:15:46 +0200
Message-ID: <CAMRc=MeczCNfRN_8T6YLja-8He-K6ESH82f1eNvxw-1w7_s_-g@mail.gmail.com>
Subject: Re: [PATCH] firmware: qcom: tzmem: blacklist more platforms for SHM Bridge
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Elliot Berman <quic_eberman@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 4, 2024 at 1:13=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The SHM bridge makes the Qualcomm RB3 and SM8150-HDK reset while probing
> the RMTFS (in qcom_scm_assign_mem()). Blacklist the SHM Bridge on
> corresponding platforms using SoC-level compat string. If later it's
> found that the bad behaviour is limited just to the particular boards
> rather than SoC, the compat strings can be adjusted.
>
> Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
> Fixes: f86c61498a57 ("firmware: qcom: tzmem: enable SHM Bridge support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/firmware/qcom/qcom_tzmem.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/q=
com_tzmem.c
> index 5d526753183d..c715729f071c 100644
> --- a/drivers/firmware/qcom/qcom_tzmem.c
> +++ b/drivers/firmware/qcom/qcom_tzmem.c
> @@ -78,6 +78,8 @@ static bool qcom_tzmem_using_shm_bridge;
>  /* List of machines that are known to not support SHM bridge correctly. =
*/
>  static const char *const qcom_tzmem_blacklist[] =3D {
>         "qcom,sc8180x",
> +       "qcom,sdm845", /* reset in rmtfs memory assignment */
> +       "qcom,sm8150", /* reset in rmtfs memory assignment */

Like I said on IRC: both these platforms were tested at some point
during development so it's worth figuring out what changed.

Ok for disabling them for now.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Bart

>         NULL
>  };
>
>
> ---
> base-commit: 82e4255305c554b0bb18b7ccf2db86041b4c8b6e
> change-id: 20240704-shmbridge-blacklist-021bd97b8a93
>
> Best regards,
> --
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
>

