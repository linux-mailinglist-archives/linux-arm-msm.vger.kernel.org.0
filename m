Return-Path: <linux-arm-msm+bounces-11084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C03C1855357
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 20:41:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 772F3281B4A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 19:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1025128368;
	Wed, 14 Feb 2024 19:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pid9Yvwz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D800A12D768
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 19:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707939708; cv=none; b=MObsrTw5pLaHACHBdDQjw/wJ+3AO3UNNPrWzV9vYFJT/fhzgacJcXbrfueVFPygtBfRh7BGNf/Mgalv42sSBJR+KeyOtsZn5p4beo0MFAcnsmXuTZ65MD3+qzBq1IZ/OcQZqDh4UvhKuJjWIyewOZ590uRk80Bg7HoKz0VrUZuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707939708; c=relaxed/simple;
	bh=RmDGSZsTte59jPLZ8KRp0jz/n/xZ1mDYib1MeSKLrdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pZlZRyLAPLnvLuqNoBg7ZXcWoFF2K4Lc/0WlnrrprBPv9eDPYUhbGEfFH82qzibVVcy/CeX8dRx9jEC6OZEXUUClUrZKbRh3+moBpDh7NE7ZI/LDmDkujUHRT4QOCltqeZ6hWmZ3c23WiMfSNBeDcY8ylBql2+yIuVSU838fgvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pid9Yvwz; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dbed0710c74so32391276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 11:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707939706; x=1708544506; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2OSlP3aylF8ytrd/OKr6EwoDt5u+yI0OOQzWZnhLnhY=;
        b=Pid9YvwzGfBhkN8Y2tg1ejEfL/wdL8ka9vSUBa0yMvshfYBRwGNNeG2qA8gmV8rFN6
         6vgZUAn+F6bfh2YTuZn4AqFWUp9HeSJ18aLN0JG82Nmyy/DBIt7HtdxVlRF2fyRgM2Pe
         r7ZSyoeDkpqiFt0KdCWJvMMB2AsW3xzVPM27ndY6P7JyzuNDYgt4eWQeYKEXZkzXi+pF
         3Xkz/wUqb0fgMsCfhvBLWgcN8KGpl550FZPhrR6FVHwdctPlVunaVI3DoaIrjymF2JJ5
         TI2ISk1vDwPxlp6eWIkgdIfY+wu/AhH/D4PAbfUXU/JkflKSL8yV2u0FnBrCHmTi0+oq
         gr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707939706; x=1708544506;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2OSlP3aylF8ytrd/OKr6EwoDt5u+yI0OOQzWZnhLnhY=;
        b=cTLv5HCBgohR/6p9rq+zGRVGyy6yzfdou5BkjBVd4H4ABMNVsEygEsznDcwX32wDaT
         jmnwJEaRaFyl+8atzG6l3ciZV9ONZqLjKTasHjzWYGrY8YX0t9eFVhEk0jfTazkyiVcU
         CSUlaooxsOeQd0i7eLYe0c8bVObtN+4bYfUijHqsw+DhXIHFXVpMBuezCAa+bVZ/eWWg
         LP4Q++IALontAtXh6yJ2FTlvADzddVdMnHbV+1yuRaxxcVkUpyTamx6vQl2bEJbANVv4
         +qQ+a3Dcp4ldb1Ni0Ry8GYzwgzuSyZk0SIGqxOK5C/15nyksUEUpbRdFiywNUsjw/zBM
         ACBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp6LrMrZZu4j6wr6TTDwHey91AEnDy0cKoMvj6J6ENMfwlA1O8Ej1bpbHKuWNjIzVEpSFqEKGaUHBqB4pwv1hmw3SmBmxYNgmvCRaeCA==
X-Gm-Message-State: AOJu0YzQHRe8T87s65+QgwlIvZdsDRyFoL0Zrn5xa0ZDuj1jUblGX/vL
	HIf7sSJ090h/O/y9K8ETd3BkYrEG7/uN+q7Wghznwu6l+8LBNLKRD+0hv+hNCFoOS6dc79OwPct
	CAvL3Oy7l2LZ8UPHpBKftjOiE5Uas2ChK3+BkBw==
X-Google-Smtp-Source: AGHT+IExXjIwVm/q6jwl+Mjt91XVjobuOr3lFXEA9VIx0V17RXPdddohBXeKHoGCqBjbyho89WdtudwJs61X/dngvcY=
X-Received: by 2002:a25:a1a4:0:b0:dcd:5e5d:51e5 with SMTP id
 a33-20020a25a1a4000000b00dcd5e5d51e5mr2715372ybi.60.1707939705764; Wed, 14
 Feb 2024 11:41:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214180347.1399-1-quic_parellan@quicinc.com> <20240214180347.1399-16-quic_parellan@quicinc.com>
In-Reply-To: <20240214180347.1399-16-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 14 Feb 2024 21:41:34 +0200
Message-ID: <CAA8EJpp43otRsAKthEgzJPrVf0j4_0=_kRMnqBNYhEgED=wiYg@mail.gmail.com>
Subject: Re: [PATCH v3 15/19] drm/msm/dp: enable SDP and SDE periph flush update
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
	neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Feb 2024 at 20:04, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> DP controller can be setup to operate in either SDP update flush mode or
> peripheral flush mode based on the DP controller hardware version.
>
> Starting in DP v1.2, the hardware documents require the use of
> peripheral flush mode for SDP packets such as PPS OR VSC SDP packets.
>
> In-line with this guidance, lets program the DP controller to use
> peripheral flush mode starting DP v1.2
>
> Changes in v3:
>         - Clear up that the DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE
>           macro is setting bits [24:23] to a value of 3
>
> Changes in v2:
>         - Use the original dp_catalog_hw_revision() function to
>           correctly check the DP HW version
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 17 +++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  1 +
>  drivers/gpu/drm/msm/dp/dp_reg.h     |  5 +++++
>  4 files changed, 24 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 61d5317efe683..823eeba7e71d3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -440,6 +440,23 @@ void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog,
>         dp_write_link(catalog, REG_DP_MISC1_MISC0, misc_val);
>  }
>
> +void dp_catalog_setup_peripheral_flush(struct dp_catalog *dp_catalog)
> +{
> +       u32 mainlink_ctrl, hw_revision;
> +       struct dp_catalog_private *catalog = container_of(dp_catalog,
> +                               struct dp_catalog_private, dp_catalog);
> +
> +       mainlink_ctrl = dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
> +
> +       hw_revision = dp_catalog_hw_revision(dp_catalog);
> +       if (hw_revision >= DP_HW_VERSION_1_2)
> +               mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE;
> +       else
> +               mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_UPDATE_SDP;
> +
> +       dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
> +}
> +
>  void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
>                                         u32 rate, u32 stream_rate_khz,
>                                         bool fixed_nvid, bool is_ycbcr_420)
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 4bf08c27a9bf3..eb05a37837beb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -98,6 +98,7 @@ void dp_catalog_ctrl_config_ctrl(struct dp_catalog *dp_catalog, u32 config);
>  void dp_catalog_ctrl_lane_mapping(struct dp_catalog *dp_catalog);
>  void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog, bool enable);
>  void dp_catalog_ctrl_psr_mainlink_enable(struct dp_catalog *dp_catalog, bool enable);
> +void dp_catalog_setup_peripheral_flush(struct dp_catalog *dp_catalog);
>  void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 cc, u32 tb);
>  void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
>                                 u32 stream_rate_khz, bool fixed_nvid, bool is_ycbcr_420);
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index beef86b1aaf81..f1e7b0a5ee5d1 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -170,6 +170,7 @@ static void dp_ctrl_configure_source_params(struct dp_ctrl_private *ctrl)
>
>         dp_catalog_ctrl_lane_mapping(ctrl->catalog);
>         dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, true);
> +       dp_catalog_setup_peripheral_flush(ctrl->catalog);
>
>         dp_ctrl_config_ctrl(ctrl);
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index 2983756c125cd..d4fb8572cd1e4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -6,6 +6,9 @@
>  #ifndef _DP_REG_H_
>  #define _DP_REG_H_
>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +
>  /* DP_TX Registers */
>  #define REG_DP_HW_VERSION                      (0x00000000)
>
> @@ -102,6 +105,8 @@
>  #define DP_MAINLINK_CTRL_ENABLE                        (0x00000001)
>  #define DP_MAINLINK_CTRL_RESET                 (0x00000002)
>  #define DP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER   (0x00000010)
> +#define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP      (0x00800000)

This define covers data from the same bit field. Please use FIELD_PREP too.

> +#define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE       FIELD_PREP(GENMASK(24, 23), 3)

#define DP_foo_MASK GENMASK(24,23)

>  #define DP_MAINLINK_FB_BOUNDARY_SEL            (0x02000000)
>
>  #define REG_DP_STATE_CTRL                      (0x00000004)
> --
> 2.39.2
>


-- 
With best wishes
Dmitry

