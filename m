Return-Path: <linux-arm-msm+bounces-13287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1415D87093C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 19:13:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45C8E1C2048A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 18:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29E9660261;
	Mon,  4 Mar 2024 18:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C6VbNKzw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7E261689
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Mar 2024 18:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709576022; cv=none; b=NzWBv30SqhzmKa5x3nhUsvDg6MBPyTDdSWvGgFPphG7wFTUKciN/dw/lXiBk2Dpt3kA7hSwIBZZa7iLh5vBW6rYbyp3VquYw9IH5KGhJ0b7TUmbPyaoZJpV+su0HaXz6h8iqPtKtLkv338obNTFB3G8UbhByCfk86Cgm5mQEBMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709576022; c=relaxed/simple;
	bh=3F/A0H6R/22hcoodKfGiPkYHlGjl2g7ELSfDnPaMILg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=doaXG3D5WM3ChD7++ZkGBSdrXSB2W/8MX+ApC/uSypatEjS1nh8dnBjx2Y3mCdosNQt/uKS5sAYGEbwnpEBNHjKfUrLP0/h/aLpsG542uW8l6iVrZN3VMJi21pbpGyHcbqG0vs7nZO8wkHzMfhdn+PvO0QbL8JfdAV3uFkjuaRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C6VbNKzw; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-608342633b8so47663197b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Mar 2024 10:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709576019; x=1710180819; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EjE93o2p/BNRD6duwy1hrbCPE/L1Bz04gG2eWZQ12G8=;
        b=C6VbNKzwYJbVuZSVY7TLXAIrytGs1eabWh7HV4vXAnAgP/RR3SUqGH0IfSD41TaIv+
         vNx0zQxjNmrbhNVt5rA1Q3369dudOklkb0a9WsyHPsVFffCAf/BZgvJNARlKGIfh822H
         u/zHI2zn+SMFjLwRCT9wo4o7it+Vrmj1BgpjoMa9DUgOed59YSBq4gnB3zqR+CDrXie4
         +D2vGWcElDv0k41V7q1Jn4LfGgui3AklIy2U/Ca4rRcRg5IB4xoxO7HIOMW0qjIKq/Qe
         jQSTep3OZ/gb8Og7zgNP8gMzDkQcrSc6AEMKF/XcuAEtsz1xQDyfI0aIdFX1JlnDcSOD
         tzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709576019; x=1710180819;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EjE93o2p/BNRD6duwy1hrbCPE/L1Bz04gG2eWZQ12G8=;
        b=jNGkDtR1KUCARZ1isX8ZwS65oAs/qbNOjmqJnvMNZzbmhc0KGywqz6y0qkSWa14mWp
         e4jlyHvKA5+wBXxvhUqP2U7m+OmhBecRGdKBw+BTswXdMLnsKvaqTpVnSTPXidKcx9EU
         cfxBwU9xuKVHOjPZ2LDQYzHkrJ5trUxIje33sjjCUC2+80uu/vpwvWz9IeQKx2Nc1Cbz
         KoTCXPgTA4mFvyAVGzwp5WGepHKheQ1v471PyAAD84GKAVqOG5z0JL9hjbv9p5mVUNXO
         A9ZiewnH/iSda3DB7GD2pxuMX9RhrotOJU+CiSBRfYOg38m9ueovGg591NpOTnYQ14cB
         PQgg==
X-Gm-Message-State: AOJu0YxBscYWXK8ANazdxnNLlGc3J/Gf2J8+hkgKPFqlumGCDELG1QAp
	VW+CWnE8QDwuIhgjW1t6wIRY8mXizJvPtmR+11CKXW9Q83qPfURUXsEjTNiQZ1TGYT/VF5/h7IO
	rDecH20z3HXXJCQM2L08cUxsv7flQPwe8NDwH8iBfeCcSeH+M98Y=
X-Google-Smtp-Source: AGHT+IHEsG0xIbxTLt0nqR9d2jAuFPIONsiU/QGgPiLY+SElLJU2fbWTW9Q10bJjRdOjSCCR3L+cVAZZv/zuB053MDw=
X-Received: by 2002:a0d:d491:0:b0:609:8132:79b3 with SMTP id
 w139-20020a0dd491000000b00609813279b3mr10243342ywd.10.1709576019520; Mon, 04
 Mar 2024 10:13:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240304175152.1199270-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240304175152.1199270-1-andriy.shevchenko@linux.intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Mar 2024 20:13:28 +0200
Message-ID: <CAA8EJpqAzWdntbmg-NyQcbLHtUoh-m=g_u=ZWiMimubsWW22sQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] drm/msm/hdmi: Replace of_gpio.h by proper one
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Mar 2024 at 19:51, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> of_gpio.h is deprecated and subject to remove.
> The driver doesn't use it directly, replace it
> with what is really being used.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/hdmi/hdmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index c8ebd75176bb..24abcb7254cc 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -5,8 +5,8 @@
>   * Author: Rob Clark <robdclark@gmail.com>
>   */
>
> +#include <linux/gpio/consumer.h>
>  #include <linux/of_irq.h>
> -#include <linux/of_gpio.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>
> --
> 2.43.0.rc1.1.gbec44491f096
>


-- 
With best wishes
Dmitry

