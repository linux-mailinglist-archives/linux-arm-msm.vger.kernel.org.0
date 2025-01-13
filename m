Return-Path: <linux-arm-msm+bounces-44857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7497A0B0FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 09:25:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08385188792B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 08:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85692233139;
	Mon, 13 Jan 2025 08:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VKuIxveU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692B91465AE
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 08:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736756717; cv=none; b=Tf1il/WeQW12QeSUOhXkA1v/S053SsUq+DICWQx/80GD5cWvRtD9/aBg3pQavGbYFKrQ7hCOEnWrVPlmRKgqYegEZHnleHB2cg2+205iYDiEHxEtdRnYo+jl6Be2weolZDfW8KdkQyDC0b20UJ143Dmygi51WQNs/96CA3978zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736756717; c=relaxed/simple;
	bh=5t/TrcuXNWNUZTuS5pgxHTJQKuHzmhw4UrOTlIJ4BOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z28UOIPZI4eVBL18LnDHT5H051tnSiuy1/6kGC92nWYmzTvepKvhAaPYEM81n1rXf1MvZ/tCKtX93bQG1ItEAFTwwehFkwqXNpeP6t9mH7aY0nreeu6l6E+gsH0+JBnIZRrg3Sw85GI4bW4OKqQYJIl4TCtbGOeRk9UT/xJ9Mr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VKuIxveU; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so3753546e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 00:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736756713; x=1737361513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HsOOejTFjVwFwvDCfWyTG69OVT7YoO10LJVJy5N++GA=;
        b=VKuIxveUwLt3RwsqOf2zdz43fjhwd0REq9TdceAA/AAgp+Mdq4Xba5PE9k0BGFuQYC
         os/xvPD2AjzWp+rKOF0LSlfm/D+H3qhAoETVYKVRvm0fXYE6AH3nNGSzfVN0WPORmacE
         JC3gAoqoXA9b8wBsoqzvLU7QtqIueS449tgcs1PLWEBQbV3Dnh/KR0RJnJU6AG66vLri
         cp6PF9f8RLLKT2F6gEng47/DpBkELHIAYTSNM4pJZ58RB2bj79hAMp6A1DfZhXsdRqxf
         u0jeUEuMvigo4bzKtMTApw4aMEQkPQmFClP7E1Yz2/Vfu45v5qrDCtsXDcscFEaw+Tr6
         6Ctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736756713; x=1737361513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsOOejTFjVwFwvDCfWyTG69OVT7YoO10LJVJy5N++GA=;
        b=S7UAIpL+7XkprZharjtF0zUNP/YHS/WP/axnXZwlh09ESyag9f7krFN8Z1NBPzNyUA
         4KxSGxRmCIXGZhwfRKu5a0L/xRdSQSVWZSXnPKN/w2Nqus2LEfuDtuykzYkSC+AR7qG8
         dxlNtmI2KHV2It8jiTWKWcvHI20F4uYb4x+g1LE/2A0SenTxvyyxsQTyxoHz9sVFYxq6
         yuGNGR8jf6/b+WIkq6KoAxVcduwUR/Vo/arOqk84vg6o11K1EUQXQhpD6QM4ijpV01zB
         hEza4dwq8+5usxe8hcNRBe5fmZVdMCj+ZJfpaJOXw6ZGQXg6+2iDInCFDmNsUoBzf5nU
         9k6A==
X-Forwarded-Encrypted: i=1; AJvYcCUHnDbqL0MzTZQlQYa+MGDdtkJtpeaJ6jM45D0mQQetjtHJVGl/EwKsDkkRJ4N0hzQ+MbpfHULppcb5ZrsB@vger.kernel.org
X-Gm-Message-State: AOJu0YzUk9TwRDMqdhTWTSpi86hobsiELLGvEYeXWqIyLnjScw2d65r/
	4/M0j+kZMz5+lZQi8zAmyJuLpelBdP1wgZKQ/v0zOzSyPfWdLt6OlwWnUj9D6p8=
X-Gm-Gg: ASbGncvCqqAc80jfDCaAzU077Gc/jbRy7iuqWo1QaVJwD2ZGbUxvQLmdEp5/crRLmpW
	4XA5wq7UEvI3J7lZPL86MFsAnuEGCX/BBFMeua5XSpNHN9dbNi2rIEvOXAzvHPx+Dh4qkezdAqh
	n1SQUxn3rbn7Snc/xLJS8RhmSnAKqshvI5uZDc6BLv8N+WudNV17qS3dw66CHJzo0IQmwmAXt4A
	NK5OdpP+pNVOOdvkmxc/KteElCwcnYSsakRpbYCS8jXYFLK5XSu5w4filRH55GM+HUvAthNKWUA
	DrpYIr5hl5v9V23CNn0ofkrK5oI/FOK/vlOK
X-Google-Smtp-Source: AGHT+IERZWZtkZrsbkHThnFiBHKfz//tsYW/urMLTgJODZNi9Tp473Grr1NqQ4M0NySCRCOoV5n3Rw==
X-Received: by 2002:a05:6512:138c:b0:540:2188:763c with SMTP id 2adb3069b0e04-542845b0b55mr6338144e87.37.1736756712614;
        Mon, 13 Jan 2025 00:25:12 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bec0659sm1286326e87.185.2025.01.13.00.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 00:25:11 -0800 (PST)
Date: Mon, 13 Jan 2025 10:25:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org, 
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v2 13/25] drm/msm: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <bbw2n4ccn5jlq7q7lsw3xdnbieazgexkwkycrqvk5aoiq5q3wx@nz6gd3unwkg4>
References: <20250109150310.219442-1-tzimmermann@suse.de>
 <20250109150310.219442-14-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109150310.219442-14-tzimmermann@suse.de>

On Thu, Jan 09, 2025 at 03:57:07PM +0100, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. The hardware requires the scnaline pitch to be a multiple
> of 32 pixels. Therefore compute the byte size of 32 pixels in the given
> color mode and align the pitch accordingly.

- scanline, not scnaline
- the statement about 32-pixel alignment needs an explanation that it is
  being currently handled by align_pitch().

With that in mind:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry

