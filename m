Return-Path: <linux-arm-msm+bounces-12107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 334B785ED26
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 00:39:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E75D1F23652
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 23:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA6EB12B15A;
	Wed, 21 Feb 2024 23:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GHWBp9rd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE5981726
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 23:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708558739; cv=none; b=fYc4KyUok4QO7UqpR1Z6aVX+oBF+XYbP8Nd85uHFAXFAc7u81rmOYWSynznpAJp9WIV7VvBsSYqo3E8z6nsYfP8DfUDnCylPPbbnKcKzlHHlSHsTGbrEhfB3pjnoy4bPVk0Sd3mk71OCOBLOqg2n/bSwi0sxVg0jTbMRJA2LJjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708558739; c=relaxed/simple;
	bh=zwQaUfTd5VGQ23NzTxo29zCF6MbG+EiG7CQ+klarN7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FAOG5Hvyd7sO24xkXOtXhHWHKNV1gGRwkQCImwuaSgzUrUoxriQn92ppH5xtANsqFJRc6oMEJJN1bgFBQCCtEb9aBBteLrAUkEUHenWIn1mTImUR5eTlKauAWlcsdRBkcam0hpQyuO5/6ePEtmDBzoAmgF2pKvhhQXnAionsSMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GHWBp9rd; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-607d9c4fa90so75486477b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 15:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708558737; x=1709163537; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/dnZ6qXwhjaIXNXWlJKsv9Hd+U+Uq/9NkmI5u+eHav8=;
        b=GHWBp9rdKNBLa9ItaUOjcsoQABVCL8u0XsemikGmqzKl1ZJtcac4+4OQs4HTZHNrie
         /FHnkZVV5Z8y9Eee6s16au2tUW4qaaPY7z51g64PU95wU9fjM8g7dGsxcWDqZF03QjLb
         ohLCtAMzwvPquEC+C2UyEqvcdUGdO2blu+SeJ6WcyBiW0LuWLtLRwSE1Pn0OvaR0oqvx
         YBLWcTXYMG9fWR3undOueHHMq+A9sjorLqCWPGtYz8Jc2NEdXO2hPy+C/WWPGofk8Lah
         Zss431F6P0VP1RE6H7WerMLZmmQyOdr8ABPEBiGTeOeLilD6KW+kvO9ZuPL6F+oeMwoo
         wU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708558737; x=1709163537;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/dnZ6qXwhjaIXNXWlJKsv9Hd+U+Uq/9NkmI5u+eHav8=;
        b=Kt30tdTR91k7MtrC7kjqkAGQ4fY9xVJO04VpPSG2tl5Jx0eBNQcwQkXMESO22xyL63
         P4Gu2xie6N8tIXG041uz/WlbVnm6pEKn8aLhUXpEuHOc/kEoUS5jOzrrHuZQ65aR8mLj
         3bYO1aY5nsMHWFoMFRn54ewpcb84pkFyi6n5ffWXGv+HE91V/0TOP9sA6rLU7hLfB/y9
         MrgEzpE6cbbmk+IUoeP2mSxR5/ZXSRhF3LfYkGk7Ztp3HyNEMSQ3+021GCezBcK61kSc
         //KADLoMJDmZODN1WCC67TmerSNt4wIQURu71LmYKG0dr2seDbDaRt3yWtC1kvuAtBAF
         lPrQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5npwq10YMABbjmW++dyWCjW0NntqRlgbeCpryG3GUZRAxXFe3X/fnn67S2GgZ+nEDN6qFXoXxSrzqRuyP/IFNqZmb9Nycf2Yliwctfw==
X-Gm-Message-State: AOJu0YzJ8pkSe1J45YF8NT+ZxGhPcfDj2UrMBCl3DnrGqqobv4FcOxwp
	PMYQgpBgbN3z5vNTimMUx78APQHiApSgPdvgexWJGgE3Zugxut8FpKLrUvzpUkPTilyQTkLTXMV
	tbmwNRG4iJITNyotFycLCM+DnPwHBi3NMOsEHZw==
X-Google-Smtp-Source: AGHT+IE0tGrX7UsWdp8xy5caWpOZ9THC0fnnletXSK4P9Z3hp437QPqk/DB8NiySph7r7h/gOnZ8DNQ5BKCpKPKAobA=
X-Received: by 2002:a81:7184:0:b0:604:230a:a823 with SMTP id
 m126-20020a817184000000b00604230aa823mr19674257ywc.50.1708558736962; Wed, 21
 Feb 2024 15:38:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com> <20240221-rb3gen2-dp-connector-v1-1-dc0964ef7d96@quicinc.com>
In-Reply-To: <20240221-rb3gen2-dp-connector-v1-1-dc0964ef7d96@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 01:38:45 +0200
Message-ID: <CAA8EJprXXjvanBU_HGv7X_dS3nyZ867AsvKj5+S3pnWcpsk1ug@mail.gmail.com>
Subject: Re: [PATCH 1/9] drm/msm/dp: Add DP support to combo instance in SC7280
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, cros-qcom-dts-watchers@chromium.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Feb 2024 at 01:19, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> When upstreamed the SC7280 DP controllers where described as one being
> DP and one eDP, but they can infact both be DP or eDP.
>
> Extend the list of DP controllers to cover both instances, and rely on
> the newly introduced mechanism for selecting which mode they should
> operate in.
>
> Move qcom,sc7280-edp to a dedicated list, to ensure existing DeviceTree
> will continue to select eDP.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 7b8c695d521a..1792ba9f7259 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -129,7 +129,12 @@ static const struct msm_dp_desc sc7180_dp_descs[] = {
>  };
>
>  static const struct msm_dp_desc sc7280_dp_descs[] = {
> -       { .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
> +       { .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_en = true },
> +       { .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_1, .wide_bus_en = true },

I think we need to keep .connector_type here, don't we?

> +       {}
> +};
> +
> +static const struct msm_dp_desc sc7280_edp_descs[] = {
>         { .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
>         {}
>  };
> @@ -182,7 +187,7 @@ static const struct msm_dp_desc x1e80100_dp_descs[] = {
>  static const struct of_device_id dp_dt_match[] = {
>         { .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_descs },
>         { .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_descs },
> -       { .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_descs },
> +       { .compatible = "qcom,sc7280-edp", .data = &sc7280_edp_descs },
>         { .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_descs },
>         { .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_descs },
>         { .compatible = "qcom,sc8280xp-dp", .data = &sc8280xp_dp_descs },
>
> --
> 2.25.1
>


-- 
With best wishes
Dmitry

