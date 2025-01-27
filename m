Return-Path: <linux-arm-msm+bounces-46266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D12AA1D79D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 14:57:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 737D67A20C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 13:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22CD1FFC49;
	Mon, 27 Jan 2025 13:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gt3Xw6sL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E83B1FF7B3
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 13:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737986169; cv=none; b=daXvh6NwjhDDahHKA02GZ9jbS+v89tw5W3VuPED9A0uDU81H08N9u40ZSNzaZlXxXNCcBPkOXh5p1bvYVBs+VOs4UEJPD7/wy7yntL53wd/b7u+T060pp6PyoZWDsmJy4OwkGEjuTdLiTKKqwe1+k4d1mPstaz0uOYGFfCOmeD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737986169; c=relaxed/simple;
	bh=+6jz4tHMxHorEMU5+vxgQW0NALIa8XqK7viSuGah46c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GY72CNIw0hhIH8nOXjEZeNXQk9e7WP/1q4tNJIviSig8NXSOW/kyk1pmA/D3CyhUQnaipnbdCMy49vIbdbHnYU3wwv+d6/mMyqtH0MdF+Ndzd4B9gD0VLYQXENa7jmX4N+4Ilo02afDQfwArwcwv1IhQn1yaC+KEENemrEtGvmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gt3Xw6sL; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30613802a59so48601831fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 05:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737986166; x=1738590966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wt4sS6zTyCweAZYH++LZePNO/qvVROY3D8Q5U1D/3eY=;
        b=gt3Xw6sLC+IZi8QYYULKx60S6wWn4tCn53y3FxmdrgLp3z7rIcP7FjAJYa6vsvq2SK
         qjxBzQcHZBDg2d6/OxLyNiHsIk/BdTsiuNOBKjDPdB/adc1h2zDQ8Ayc+ykOS3z+qvay
         VZmpEKb1nWVPhT3dr/U2XEPqtqsbNCS2HPtPGv4cu7Mp096NofS/VjIS0ZAqRqV606/d
         RjqjAmbxhZl1+D7ytAKPXBABDgeEg+9dyhb9Z/PA3nAtmNheyxHNs14muLAj+/4hvKJs
         aWEJ+vQbSCOgNrOVbUp2s9JfSeoqgKt703IiReaL/k7LiXqdK0Z5s5BlFNIGkGsQ/HPw
         9y2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737986166; x=1738590966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wt4sS6zTyCweAZYH++LZePNO/qvVROY3D8Q5U1D/3eY=;
        b=SsnJt79e7wuxQUzVRJvFJgecAmqlPF/TkCwU5xbu/HFP9eyuz0WOjfKcgWP93du4WI
         eUWSgw/NMoQg377P7+ZrFxD4CmpL75ck43E7kaSk9SGPn0Gr9rm3GcEJS/ojT4vAgasm
         YClNkfYfaAcQcPrU0r4jkO9I9wVc3IxQ2POzk+Tl00zvLuqg8aKzZP12tiNHXT0rdaZk
         jIAcikHVQ7WZE60FZNTejUGFl81q4N5Fs59c34Mquqoyt6xv4WDJa0V3QTXSy00NOxGk
         MWX1MaL4KwfXqE+ETEuik+qxmrfdiW7s/DnEprRXt7N1pUMeO3v2bDF08wGWUo5tTp7b
         gBEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRRpRW8BoA/5380kF2xVvAi2+xSnF18iGB+e37gfmoTl4dgA3D2HPPvKj91THUcQ/+USMmv0ltWSQQ51k7@vger.kernel.org
X-Gm-Message-State: AOJu0YwEfW4LE9F0NoBhNmQEczta979EbJzvL4Wx7t+ugRTjTW+jlV3A
	hiuL4de1c/Njp72B0ndJnvGlUWGCuNyfdtEA/w6Q2YVThks0AlDwbTptkkKd6fw=
X-Gm-Gg: ASbGncvBgeYTrMtCe/kONx/A7VnB7D9JDQ46EhGgddyvNl5vXeXX28UAtSejq16ig6m
	CBNJ7RScp+y1DG25XNTbcc9hr4hVtxu5+/BahkEjKVXuNNIIDk4qbdPn6SD/ELDK8YVm82C5vaw
	K6XBeGOu34oQE5672MR0tqIMCPNukeqEu+OTuVxUZn1XNh1KhM3+rEuyWu5uE7Qtmq97LmciO0t
	z6P8q4daxbh6oCD/wkHeixpnQO/aOZjjGC/07tfmIvPOUuRSroofN2qGg1Q9555zgIDnxI/INL/
	c84lRcX2sjbnv7Zjg344q2rKfsO5YOu73Eunqv/6/VGhtAc55FLOJTME0OyK
X-Google-Smtp-Source: AGHT+IEndS/LVqeUqSpxsvwA84LzRH+l+YBnVxcXQWp9YfcsB2fe5zmaDUUkUk95OVNxnfDlx/rsmw==
X-Received: by 2002:a05:651c:2104:b0:301:12:1ef3 with SMTP id 38308e7fff4ca-3072ca5bc35mr153845421fa.4.1737986166078;
        Mon, 27 Jan 2025 05:56:06 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bc49b5fsm14359241fa.101.2025.01.27.05.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 05:56:05 -0800 (PST)
Date: Mon, 27 Jan 2025 15:56:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display/msm/dsi-phy: Add header with
 exposed clock IDs
Message-ID: <4vy6tjdvhkplly3uqqekdmz6brkcbac6pijrn6gdyz4x3hralr@meeugoua2ats>
References: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>

On Mon, Jan 27, 2025 at 02:21:04PM +0100, Krzysztof Kozlowski wrote:
> DSI phys, from earliest (28 nm) up to newest (3 nm) generation, provide
> two clocks.  The respective clock ID is used by drivers and DTS, so it
> should be documented as explicit ABI.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Patch for Display tree, although with Ack from clock.
> ---
>  .../devicetree/bindings/display/msm/dsi-phy-common.yaml  | 2 ++
>  MAINTAINERS                                              | 1 +
>  include/dt-bindings/clock/qcom,dsi-phy-28nm.h            | 9 +++++++++
>  3 files changed, 12 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,dsi-phy-28nm.h
> 

> diff --git a/include/dt-bindings/clock/qcom,dsi-phy-28nm.h b/include/dt-bindings/clock/qcom,dsi-phy-28nm.h
> new file mode 100644
> index 000000000000..ab94d58377a1
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,dsi-phy-28nm.h

I think this should be dt-bindings/phy/qcom,foo.h

Other than that LGTM

> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_DSI_PHY_28NM_H
> +#define _DT_BINDINGS_CLK_QCOM_DSI_PHY_28NM_H
> +
> +#define DSI_BYTE_PLL_CLK		0
> +#define DSI_PIXEL_PLL_CLK		1
> +
> +#endif
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

