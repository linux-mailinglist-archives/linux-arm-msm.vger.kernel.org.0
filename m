Return-Path: <linux-arm-msm+bounces-63687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C984AF914F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 13:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B63427B75CC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 11:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06BA2882CC;
	Fri,  4 Jul 2025 11:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tQyS3S4B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D4D270579
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 11:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751627770; cv=none; b=V2FV26zR+yvz7y+N0rLhe9s4AHKxuj7y7Fv4+yKC3KZfdXmAibhadtfO9s5XgaWg778N589EhylRuhNsmh4gljazM9jlXuKmDN0crRQ+jwa4wyREtMmZdXv9g8AUPx9XPGRhCVIfhVj1vhvhbMVJki2iKOF1gES0i0RZoq5JuL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751627770; c=relaxed/simple;
	bh=b9rtoKDrBAYC3BaF1M9Ck1YA+omLHf3ebvKNPvZnx2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jaa5slROf7KDSz1OqQbNPjnu8Ey8R2VG+YF5x1fDmkERDLy/cViTr8mEOvfMC4kjEYJxiPpDjbLhJG9JgCrkn6x4UDakkAdlu2JwHXgz90rBDY1zsmwy84BBGZrKjuIKkF3vko0nLvuimjQyx9LwKb9VMsYkVADDGekPAFfjdfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tQyS3S4B; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-70e447507a0so6533257b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 04:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751627767; x=1752232567; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PjpGYVa/Cr3/NCJD8CT9IY6HzXhXvTQMbsQZwOON6l4=;
        b=tQyS3S4B2wbGP1Dqsu7JNrBtVdj91LQh2w8veoQ7h0MrGDi1p7vqMTB2KnEfYSxOYT
         nCeOIdg0bzfoUS9fknPL6U/uxlkZoBZmwNkMV4zBDt1GmAfbMkwVeKutU2q2RNlrQDpR
         6prf8vynMeEeFXAOcHn0YsENBARqw9mHcSL6Sq/8ElrEo3wIGrX7fqJWQ1wie3U8xryT
         7IezF6IwbQ86ZUR+nRM3Q2oweyf2+uWHTZWLmUmL7uDSz65WecELfxdVUzs3c92fAZIL
         AGmaOLE0mGwpaUqqqNHdyNAHU9oKyisiMgEfGXhUHqOvRVJrQrtdTvhr+8krET00XqJ5
         CoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751627767; x=1752232567;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PjpGYVa/Cr3/NCJD8CT9IY6HzXhXvTQMbsQZwOON6l4=;
        b=wxCbgIvuRC/Tw5VU4yxrH58qptlDF1OnIry7toI3rPBfa7l/BVIz3RcJLmektKLJMS
         9bNuc9Op0deZYmXOaHP7nboRaCvbab+mWx+JnArzCd2PtW3Fkf8tOcZf04TnHpsymRB3
         5k+uFVybVCktKoXctIhLDenbGAgdz9gX+88OEYi2IOIWx0pNOh07ToU4ft9o6VwY3uAu
         LBwAnckOtBDKRnl1rAoRd0NYBReN/O6bpf5+zakldpO9hDEdUUjmcsMGUcJI7tAV0ALC
         jZoNFr3WKhyqCgmgN9ErnnfCIfmIkEeTWpcS0beHBHnL6+kfcr7Jlc+fopX1SaKwO0gJ
         BIlg==
X-Forwarded-Encrypted: i=1; AJvYcCVMTnwgjZoScELdP+ebunIYHvhtNSmnQGn+zQMF7dW5MCezhH9l7wziD0PpjTc9erNEbBW6RkO6eea/RS79@vger.kernel.org
X-Gm-Message-State: AOJu0YxUyVbyEbPs1L9YoBXajD1zCqRnZDv/LDJ0a5D5GfBxyTNOF1mF
	vfZZBEviDnO9udZXCUtUnt+hf2M0MDqXdXapj77iWhyxTRKxDhqEylGfsjVjiRXkJtmkAf0oUvI
	JfFB5I+ruOFs7jAyMWnS2ZpTEqzqg8HtvtvkK1plfpg==
X-Gm-Gg: ASbGncv8ALqRTgk+aQdAEFQcJWzF9I2dN7UrGfva35QhNEJV1yhFpKrlpgTCSj63HkL
	abDRGVCwyh/3/iBCtJGoIZe+3j2/NaA2Qs/lUiGTbesQiT7EDfRaRo/Sga3a5k4P+itTvwkY+gj
	ZGBRaj8BciEUrLM7NXJRBetQXAiWotvPYOM2XkA7vu5DLS
X-Google-Smtp-Source: AGHT+IHAW8UyCQ9W+pvHvcTvef9aFULLZGbhQe98R4X9+6EEdiQxhHHKyUMUuOYP0+BDeQPC3PK4UvgN4CdOsI4nxiQ=
X-Received: by 2002:a05:690c:9c09:b0:70f:9fcd:2075 with SMTP id
 00721157ae682-71668c0e0ddmr26398687b3.3.1751627767124; Fri, 04 Jul 2025
 04:16:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703112708.1621607-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250703112708.1621607-1-claudiu.beznea.uj@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 4 Jul 2025 13:15:31 +0200
X-Gm-Features: Ac12FXwfheYVCqCiLAFVR27m9ptp6dfE-AwljIFg4O16ch_FdabejHZIDOFh5ww
Message-ID: <CAPDyKFoznqfdX7Dvu3VPa5Me10VHGphnRRHrU17w-fie7HrQ5g@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] PM: domains: Detach on device_unbind_cleanup()
To: Claudiu <claudiu.beznea@tuxon.dev>, rafael@kernel.org
Cc: linux@armlinux.org.uk, gregkh@linuxfoundation.org, 
	david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org, 
	dakr@kernel.org, len.brown@intel.com, pavel@kernel.org, andersson@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	wsa+renesas@sang-engineering.com, mathieu.poirier@linaro.org, 
	vkoul@kernel.org, yung-chuan.liao@linux.intel.com, 
	pierre-louis.bossart@linux.dev, broonie@kernel.org, robh@kernel.org, 
	jirislaby@kernel.org, saravanak@google.com, jic23@kernel.org, 
	dmitry.torokhov@gmail.com, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-serial@vger.kernel.org, bhelgaas@google.com, geert@linux-m68k.org, 
	linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	fabrizio.castro.jz@renesas.com, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Jul 2025 at 13:27, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Hi,
>
> Series drops the dev_pm_domain_detach() from platform bus remove and
> adds it in device_unbind_cleanup() to avoid runtime resumming the device
> after it was detached from its PM domain.
>
> Please provide your feedback.
>
> Thank you,
> Claudiu
>
> Changes in v5:
> - added PD_FLAG_ATTACH_POWER_ON, PD_FLAG_DETACH_POWER_OFF;
>   due to this a new patch was introduced
>   "PM: domains: Add flags to specify power on attach/detach"
>
> Changes in v4:
> - added a flag in dev_pm_info that is saved in dev_pm_domain_attach()
>   and used in device_unbind_cleanup()
>
> Changes in v3:
> - add devm_pm_domain_attach()
>
> Changes in v2:
> - dropped the devres group open/close approach and use
>   devm_pm_domain_attach()
> - adjusted patch description to reflect the new approach
>
>
> Claudiu Beznea (3):
>   PM: domains: Add flags to specify power on attach/detach
>   PM: domains: Detach on device_unbind_cleanup()
>   driver core: platform: Drop dev_pm_domain_detach() call
>
>  drivers/amba/bus.c                       |  4 ++--
>  drivers/base/auxiliary.c                 |  2 +-
>  drivers/base/dd.c                        |  2 ++
>  drivers/base/platform.c                  |  9 +++------
>  drivers/base/power/common.c              |  9 ++++++---
>  drivers/clk/qcom/apcs-sdx55.c            |  2 +-
>  drivers/gpu/drm/display/drm_dp_aux_bus.c |  2 +-
>  drivers/i2c/i2c-core-base.c              |  2 +-
>  drivers/mmc/core/sdio_bus.c              |  2 +-
>  drivers/rpmsg/rpmsg_core.c               |  2 +-
>  drivers/soundwire/bus_type.c             |  2 +-
>  drivers/spi/spi.c                        |  2 +-
>  drivers/tty/serdev/core.c                |  2 +-
>  include/linux/pm.h                       |  1 +
>  include/linux/pm_domain.h                | 10 ++++++++--
>  15 files changed, 31 insertions(+), 22 deletions(-)
>
> --
> 2.43.0
>

The series looks good to me, please add:
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Rafael, do you intend to pick this via your tree?

Another note, the similar thing that is being done in patch3 from the
platform bus, is needed for other buses too (at least the amba bus for
sure). Claudiu, are you planning to do that as a step on top - or are
you expecting others to help out?

Kind regards
Uffe

