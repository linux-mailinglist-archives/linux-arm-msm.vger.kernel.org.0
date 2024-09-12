Return-Path: <linux-arm-msm+bounces-31548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5626E976035
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 07:03:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 893981C22CEA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 05:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F44126C18;
	Thu, 12 Sep 2024 05:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GVwJrt/5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7FB8F45
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 05:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726117426; cv=none; b=jUtdArlgA0Imap4Mh7ZTZnPyNWD0jh67Akx0bZiy6hrAlJe1HY+Iaji7XeisUa/7VW+5rzmq4km7VZuYgQ/hEZzYVwHGFnbzB4JKmshNx5sVePBVhTM6uBpTEpKWoj4jLNYfypi+CRNL4rEfCIdXC/RkObA+Hl9vFV5y29AdhNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726117426; c=relaxed/simple;
	bh=F4VxXzrLOAEWzMVJOBXTjy1IslzXS0RyN2UyGwo5AEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g4YJerEFxIg7siHxTrPzN9KI40JDJW3UMxlLFIxzRE3UXKfu6sLneeMpY22QH+Yv93HsQuXFsktEQs/Cf8IKim+QSqg0TEceQfwKuLOo2tNCBtXmNwmMOEIYTBxPGl13O9N1OilqGiMLwqmdcmycrUCQsjlLsbp/e2k+gGNQH88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GVwJrt/5; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5366fd6fdf1so669258e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2024 22:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726117423; x=1726722223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=noD0uf88q3RdaLafoUYt98P8HM8wv8kHm5RyRAQfAOE=;
        b=GVwJrt/5Dh9hb9+393jhhQCE/Is7BOJelG2/76Qx6+R9fIXicLwmRVm0hvLjGxA6Of
         XIP0Hyd1nWJuUmMgJRTwnwWS+MVbCzgHEzFfd0bg7vcwB/fiG6TDuWuauMADr2hRK51u
         azakALD/4JLFIXgMs21phRoEGqui76jHelDlnqyOHUdu5AROmONJbyoLqO7m46fz1LVG
         LnN/4joE1ClVBjnAzEioysdewdmMiaM5Q/18BYmHLIQUoRoKemBB4HAUMN9JMDPkwPDs
         xkCNX6+7rNGa+P0JGr10R09I8yawHJI2me1W334/rIvOLofO9zg4OM4VL+gi2Fi/nBcE
         5ukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726117423; x=1726722223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=noD0uf88q3RdaLafoUYt98P8HM8wv8kHm5RyRAQfAOE=;
        b=XvnqNP2FcHjXJAf+wi44mZuIkSJoueJ/CvaLxUWMmhcGSsqNKYnu6gQfyvVe0B1D2O
         D9Lb0kr5Ba7YAYuF2rtIQjOHgElUmftgXYYODq5CZ6GbtHs0z54r1bCfTOs/wmpDeL7a
         yTgwJ/Ibm3pW0D45E3cmodfSNx13+7BTls/a2zGoOoiZUbdDOKhWEIQ4uhLnp54X1F/1
         6bnSMCVoLSnIbFmrziZ6bYcn4XATh3cHXwvYmEVSd2KQ5OUo7F5DAvigQWvzJcC6LmTA
         Q1YVP9DjhTN1bKay9i3sV5oFqlGA5Y2mIj0odWcoDBDXAwr4KwS4dsVemwAY1HxhYC6b
         ZmqA==
X-Forwarded-Encrypted: i=1; AJvYcCWqDFdA6B4AOxPJ73pQh1jN30CelLXlyfFkldBNK8FxeTsPU7qkgkzWkq+uuSIdgfwdWvs1wz4dB9Zr4UnM@vger.kernel.org
X-Gm-Message-State: AOJu0YzDfDcoQdwiPpTWb+8MunmmLx/gv8qRwan2jIG3b/3bqWozc13C
	0u9Ni1IhN/a+JADuk8WjXbNa21j/TfdhJ0mmqcix0RyIse9nduEJh7i6f/ofCHI=
X-Google-Smtp-Source: AGHT+IEhvubGxjrEQVdVXNSpslGFKwSw4CRUWLIiO5R3/3qcm6MQuihMMnkeCR9XhehXo7BfZGCjhA==
X-Received: by 2002:a05:6512:a87:b0:52c:d626:77aa with SMTP id 2adb3069b0e04-53678ff4d11mr738269e87.58.1726117421945;
        Wed, 11 Sep 2024 22:03:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f868c5asm1775717e87.43.2024.09.11.22.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 22:03:41 -0700 (PDT)
Date: Thu, 12 Sep 2024 08:03:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Shen Lichuan <shenlichuan@vivo.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, airlied@gmail.com, 
	simona@ffwll.ch, sean@poorly.run, konradybcio@kernel.org, 
	marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH v1] drm/msm/dpu: Fix some typos in comment
Message-ID: <pd76zf55h3kjpmgiydiu4br35bwlzsey2losublklv4o4ta7ko@z3gzy2eec5qh>
References: <20240912042425.4703-1-shenlichuan@vivo.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912042425.4703-1-shenlichuan@vivo.com>

On Thu, Sep 12, 2024 at 12:24:25PM GMT, Shen Lichuan wrote:
> Fixed some spelling errors, the details are as follows:
> 
> -in the code comments:
> 	collpase->collapse
> 	firwmare->firmware
> 	everwhere->everywhere
> 
> Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>

Missing Fixes tag.

> ---
>  drivers/gpu/drm/msm/adreno/a5xx_power.c | 2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.c    | 2 +-

Subject prefix is incorrect, none of these files belong to the DPU
subdriver.

>  3 files changed, 3 insertions(+), 3 deletions(-)
> 

-- 
With best wishes
Dmitry

