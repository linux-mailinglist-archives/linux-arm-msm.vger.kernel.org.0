Return-Path: <linux-arm-msm+bounces-48537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0176A3C5BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 18:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3FB8F7A199E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 17:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44EBB189906;
	Wed, 19 Feb 2025 17:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gz8gf+6X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619A61AC88B
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 17:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739985038; cv=none; b=EU8BoMgJm9JQHzAjcNSGW7zT/cotiwbth9ja66368EoT41mUivwbAqaNDc/LJayrBr64EvZ0WQjpCEszPNmXcW/3MZvIp4Y1UyhAiYu8mjJhanG51OOzlSXobC8hZgmxq743+n9591NE/RWP31LzNd3ofJ66Npeb72Ww228Gk70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739985038; c=relaxed/simple;
	bh=DT407O8jihlnsbhNvGUckusypfdt9llGjD4z/2ElTKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SdwIb0NEsecokH3aLFkA9fL+bZxCNieqQf5geUcXBO4RO6cC7p5jEFKnumWe4syKdpAVWcJg9eLBwxV9d+IhQtoSXBX8sJVpWyfDYI7flqPy96ZEwbiCgSjP/bzWMbY28ddz2PXlEMi8sF24QjFKyKSRVhsCdmAuo/mqDTKPlf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gz8gf+6X; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5461cb12e39so44324e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 09:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739985034; x=1740589834; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F35gCuOu8YlsVwzY+YGVE1BEl6QJE8ppkj0geSACBWg=;
        b=gz8gf+6Xh5kLMquF0iKwSaA89HaTK1pT5wCp5FTNOerRfYIuF4o4lEfwNvvMhds+Gw
         W43a0VKzwaPewg2xRXX2UBaHZZYslJnp2A0+QtGH8ncEONj5gIq3h8Nva14l7TXcT2+r
         YZdysDiQCM+e7KOjmSnWVaxSKy9NuaqVSobvj5rkL3lUjAdL4EqHu4pmdsH5puXyn7BP
         4OTerx+ns8Rac/vKa2HuOLY9MFRnAva9Exy1938MReWzOzwWejBP4bF3nRdWckj6TMNG
         lNSJaIUWZbOs7MPIE5Vsksx9pN4kvYL4IK9xZWKMn0Eb/jHVHL/TRpry4Kp8wkZ9qUlj
         9AJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739985034; x=1740589834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F35gCuOu8YlsVwzY+YGVE1BEl6QJE8ppkj0geSACBWg=;
        b=tUfcFMm1ug1DTvC9UGAUFdRZYWCmqBvcHUCZp0yEwkM80PYTJ0b3VQj5k9Qr8mzcUy
         iJpDLRiEzTFm3URUrbg6KvuiFSQlLUUeMBjuybxFFCeCvVFzXezwDpgKpmbg9yxiPZZm
         YNS1M6adpYtUry/Iv4SGWFAhYJ+Hn4PpRWebU4V47wy/pGShFka5+HxY23P/ablUAsda
         YU1obQdex2hV9hlZ+SaYWYQGKDt6xmGKneAIAWflOqLzcZzVZzamSNFlhSxeGpO/I+e3
         gAc2zNCMHKhhCfLM+yZoV5woTkTYbvZ5+kcIRRfCB20SmPjWpE7Y0SlhilYWsEZPKgSr
         zL4w==
X-Forwarded-Encrypted: i=1; AJvYcCUkAok1n/l/hwFy5z2t4tNmeRS0OKei5fA6bmF38Lmg/ICLN/HoAEmwBwjAZO4A9pP9Mo7FXqdjEqhMjEYp@vger.kernel.org
X-Gm-Message-State: AOJu0YzOFzUVg4OkT3EAwqSbRkwbYE6PxCdaF1HEhSdYQFov6KVN1Iax
	d+O5GfSCzMj1aqWfxt0LV/wi30T+m6QBwpY2ZHgKZ9+OTpe2pMJOf0hMlmVTpfM=
X-Gm-Gg: ASbGncuuBeId9szj64CqzZODriRY9PRY78VltpsFnmHlVDIsbRxll2l88kaJHNNMEHW
	56ZX919ATsBh6KroBppkc+R36/soRUUKe4ImQ6BvPGi2vjKC01fYdyLEL3S1vHsL61e4Yx4iZL1
	gR4232HeYqzzjT6tKZUZAmSVfzuOfDuFkwWokQuylgfr6ARmHEGeDBsqf2NVQ5NgRPTFpINsGNf
	wS4PvQT69XWSUMhhwbyqitGdxYjAB2afkpeBaF7hxtYw+Tmxuy5sm6yl5WAYGLx9AZGffe8GcVw
	rH82sCR4KKdUYRhl0vLCtKw93x7p05Y9FK2llk64P8E6sI/kZtFU8mRVbhduDaTpezVE3ow=
X-Google-Smtp-Source: AGHT+IFNdrdyD9GAVtk7sxhJJ4dLAUs6KGeB5DVJLnVCoJxAbOFvAQQeAKi5DJMc6n1MUTqkvNcKFw==
X-Received: by 2002:a05:6512:1054:b0:545:f70:8a95 with SMTP id 2adb3069b0e04-5452fe8bee7mr6037250e87.32.1739985034390;
        Wed, 19 Feb 2025 09:10:34 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54623984659sm947630e87.73.2025.02.19.09.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 09:10:32 -0800 (PST)
Date: Wed, 19 Feb 2025 19:10:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v5 1/2] drm/msm/dsi/phy: Use
 dsi_pll_cmn_clk_cfg1_update() when registering PLL
Message-ID: <mjgyuej55v3oyq57lqsm2cqjmmwy4jtkufing227gtzlsivrn5@jmscpw7ot4mr>
References: <20250219-drm-msm-phy-pll-cfg-reg-v5-0-d28973fa513a@linaro.org>
 <20250219-drm-msm-phy-pll-cfg-reg-v5-1-d28973fa513a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219-drm-msm-phy-pll-cfg-reg-v5-1-d28973fa513a@linaro.org>

On Wed, Feb 19, 2025 at 05:23:32PM +0100, Krzysztof Kozlowski wrote:
> Newly added dsi_pll_cmn_clk_cfg1_update() wrapper protects concurrent
> updates to PHY_CMN_CLK_CFG1 register between driver and Common Clock
> Framework.  pll_7nm_register() still used in one place previous
> readl+writel, which can be simplified with this new wrapper.
> 
> This is purely for readability and simplification and should have no
> functional impact, because the code touched here is before clock is
> registered via CCF, so there is no concurrency issue.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Changes in v5:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 8 +++-----
>  drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml | 1 +
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

