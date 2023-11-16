Return-Path: <linux-arm-msm+bounces-761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEF77EDB31
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 06:26:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F0021C208D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 05:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F0523B1;
	Thu, 16 Nov 2023 05:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IdT7RGIh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3C4E1B9
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 21:26:24 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-d865854ef96so364274276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 21:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700112384; x=1700717184; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yqDHCBZleAowpUhWwykf6ZtGbHUaOJrU9HuRWep6kUI=;
        b=IdT7RGIhayhEzCgsPiwzG+FWkgu0YUh4OrwxbDNmfZltNrcGlvqI9ffMrVlIHvCkp9
         mzIcvcakMp0S7uTrzb+WvuTKPp7DOAzrKS4lBZ61p6Q1hem71qFWrcd3JEMkbbhYBNze
         BDQhERUpYfupDvYXJPNQ7TDDXP0F1VRIcC1VBn3eXyZIpPyBgphnzFo/6V/VDZNHTTIk
         OU6HYR40NmOkh31JyHSrF3MOGjC16bqbUWIONleNdE1UlI1Y0B/X/cS6c3D8LRXa4x3p
         ZLMYh1uaKx0MoLZ7sx5WmK8M6uibUZ1gPwc3MRfzexI0Kil8MQ2m8ZRWWHDQ0v4LVoNT
         2AzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700112384; x=1700717184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yqDHCBZleAowpUhWwykf6ZtGbHUaOJrU9HuRWep6kUI=;
        b=YiLsQBLCT3f7q22bbSH/0H9C32DHao/jI/o7FQp8Zs9tzZsz5q5M2DR0hkMGAEOkoW
         XkqLvawDdf5fe4Y2oz06u+4bFj673QS22WcoFj3XsK4O07PspwvZlY/sluAx7L8UmQDD
         TnjFBI7Czsbe8XChk3+HN8k/cVZYar2Ti0X1m7EN4ih8hpdJFYCZfmfWQXs/OkShMoW0
         9lxWlMUs9Iv3fZerBIniiDEkwpHj052Q45YeFZuMnIDgYLb8JvY8W9/ioFDToWsYnHUt
         SeQJKNeOeAGEZj2ptzhkCf7hmUt4UVDq7Mbf0qG7jkFAoyInANDzUw72ADTeJorhQ+cj
         v6SQ==
X-Gm-Message-State: AOJu0YzCPsE9Ry2bPwUBZo9LWcJzujN0eBlB0FnVTCj2m/Piyg7Bks6k
	f5ISscWi/QVAfVYAMJVgLGX0RGE+am1CPTO1z+xmmw==
X-Google-Smtp-Source: AGHT+IH4Hh02GCaPDvzQqHEwz8iMIIsTq0YxC8AwfYi/7ZFOFlASykq7O9a2NpeuSrDvxdXzSY+3k0ibpIMBNBtVrKg=
X-Received: by 2002:a25:b298:0:b0:da0:350f:fd6a with SMTP id
 k24-20020a25b298000000b00da0350ffd6amr15854525ybj.46.1700112384014; Wed, 15
 Nov 2023 21:26:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231116051401.4112494-1-quic_rohiagar@quicinc.com> <20231116051401.4112494-2-quic_rohiagar@quicinc.com>
In-Reply-To: <20231116051401.4112494-2-quic_rohiagar@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 16 Nov 2023 07:26:13 +0200
Message-ID: <CAA8EJprzSFrb1qC-khPmTTac5o2ZX8azYBNPmT8DjyeNo3SAZA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: defconfig: Enable GCC for SDX75
To: Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc: catalin.marinas@arm.com, will@kernel.org, quic_bjorande@quicinc.com, 
	geert+renesas@glider.be, konrad.dybcio@linaro.org, arnd@arndb.de, 
	krzysztof.kozlowski@linaro.org, neil.armstrong@linaro.org, 
	nfraprado@collabora.com, m.szyprowski@samsung.com, u-kumar1@ti.com, 
	peng.fan@nxp.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Nov 2023 at 07:14, Rohit Agarwal <quic_rohiagar@quicinc.com> wrote:
>
> Enable Global Clock controller framework support for
> Qualcomm's SDX75 SoC.

Please add:

... which is used for this and that board and/or device.

>
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index b60aa1f89343..d1be1efa8a23 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1252,6 +1252,7 @@ CONFIG_SDM_GPUCC_845=y
>  CONFIG_SDM_VIDEOCC_845=y
>  CONFIG_SDM_DISPCC_845=y
>  CONFIG_SDM_LPASSCC_845=m
> +CONFIG_SDX_GCC_75=y
>  CONFIG_SM_CAMCC_8250=m
>  CONFIG_SM_DISPCC_6115=m
>  CONFIG_SM_DISPCC_8250=y
> --
> 2.25.1
>


-- 
With best wishes
Dmitry

