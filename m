Return-Path: <linux-arm-msm+bounces-31939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FA497B546
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 23:34:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BCB01F22DC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 21:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B051917E0;
	Tue, 17 Sep 2024 21:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hROdkSIp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2162B1422D8
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2024 21:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726608879; cv=none; b=AJS6gnBIbutRES0Q6yhlj60r6jiUa7UvU67zRHvjVVXsemAemVGhwiKYCWhssKLKP8emT+N32Wi/DnF3eIBIBzzOF0uZnDBNAAdAJUJbmMiS9hRgdV0BnXcNLGKQgD6rEnZP8zO9H/qn+RBTYVNU1yW9jKqr+TxisQR8gZYYwmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726608879; c=relaxed/simple;
	bh=rh7nRe4B03Dq504xeP30bf7OYhgoXF86h7JIINMUCUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FaEVEEqMAlvOauxWaa6wC4TCUkLe1eW/Mz8iZMDrbgEtq7/HGaTeEoss6XmCkbopU2qTAzyzbB4TJLP+OaHgZjeGvos8Li+nL5a1yVTQyrta/V3/GD40Yek90Q1sKA+FsAb5pNG17HjxKXNvfp7BhyNuUJijwlX/CN5DqdTAyfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hROdkSIp; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f74e468baeso56827231fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2024 14:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726608875; x=1727213675; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HFldS9Osdx5r6O9PMhBljuz6I+61/ph8KM1Rie1JbL4=;
        b=hROdkSIpVDVIFYOrIuypCLKOPA7qBci/7FBi5DHiPnoEG4kHJiHuA4MYdnnN8DUIbb
         c3efNmjTk1vqryV1MH1UIFrgGNEXtSw7OYTOYRflJoq2s/1XkQsKB0+QQNmLnZGXDqhe
         LfuJ+BHoAzxS/BGRIML30a+9rwQmgc341p9Qy+xaCCSgMor9JPR21T4KMYV2WYnFWMeJ
         c4Ou5hHK6J8a1OZT8CT7ynUJ4eS7kp2X9NedlnTXIOgQCTM+A0OTzkMnPBwFNBfgJ1EG
         Bp/Jw9ZOau2e62B0D6fdQljgUY8pMyw/wM5qS3NetrsZlZlUt5gwnxUMylrF0XvwaNbT
         tEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726608875; x=1727213675;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFldS9Osdx5r6O9PMhBljuz6I+61/ph8KM1Rie1JbL4=;
        b=XJMqnD2+NX/Wf3ox7qruYVrvx68H33f0gK3nBD3UCwSRkd3X6wJvIQ9WADAjm4RiHS
         np+wKxRjEfVGDu4udgOzwnJyUhSyQKhAVMokU3llKrPyTLWHwXksCHLjegTcgq66xy+m
         R3fPbXHyalRrd/7/Me3E5FgtxuTINw1UWn5yG5QHols3hqT3cDVTAwocT1DRUY23/pOg
         RmuZF3MRJ4k8kJtb9tjUQj4O78VRhiPKMiMu1ncyK3q6kz88QBQqmIN5qoFbqltcZtPx
         RGQYWYu/NClX2BdBvvWDqXA5zk+MAUR/zzN7PwLj60rub4aUX5cT2zno4jFXy2O0/tZL
         Fh1A==
X-Forwarded-Encrypted: i=1; AJvYcCWu3MvzKalz74eWkZkc6ZLzNFjdeJjNMZIVMN86yv37Sz1AA4YOnA8gGVY9fPFIYSSNsL/Zl6j3cvgHqt/X@vger.kernel.org
X-Gm-Message-State: AOJu0YwUyMj7MOdDkjlY5n0YoIhme5BF8rcqB4pTYtx+TtTGLCC705mq
	8A7ihxwIyvatlPgx63+0XChiRRvMn5oUCokscz6ISlzrw+RzgL1E/6EuNOXBKBo=
X-Google-Smtp-Source: AGHT+IFP+a/C17oarNAKaUkNRdE2Hq0QrQUtL8hBbqvyTR7hjc/+lmNIHk6fTZvBOLwdgfVvs5vVbA==
X-Received: by 2002:a05:651c:509:b0:2f3:f5aa:b3d0 with SMTP id 38308e7fff4ca-2f791a58278mr74395181fa.35.1726608874759;
        Tue, 17 Sep 2024 14:34:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f79d2e1c91sm12083751fa.17.2024.09.17.14.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 14:34:34 -0700 (PDT)
Date: Wed, 18 Sep 2024 00:34:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Subject: Re: [PATCH 0/3] DRM/MSM: Support for Adreno 663 GPU
Message-ID: <5fxmsbtyagtzt2pizdjoadiwxt3klafaulrhxoz4adevapxyoj@5jg7qaqhwkgr>
References: <20240918-a663-gpu-support-v1-0-25fea3f3d64d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240918-a663-gpu-support-v1-0-25fea3f3d64d@quicinc.com>

On Wed, Sep 18, 2024 at 02:08:40AM GMT, Akhil P Oommen wrote:
> This series adds support for Adreno 663 gpu found in SA8775P chipsets.
> The closest gpu which is currently supported in drm-msm is A660.
> Following are the major differences with that:
> 	1. gmu/zap firmwares
> 	2. Recommended to disable Level2 swizzling
> 
> Verified kmscube with the below Mesa change [1]. This series is rebased
> on top of msm-next.

Is there a chance of you sharing Vulkan CTS results?

> 
> Patch (1) & (2) for Rob Clark and Patch (3) for Bjorn
> 
> [0] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/31211
> 
> To: Rob Clark <robdclark@gmail.com>
> To: Sean Paul <sean@poorly.run>
> To: Konrad Dybcio <konrad.dybcio@linaro.org>
> To: Abhinav Kumar <quic_abhinavk@quicinc.com>
> To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> To: Marijn Suijten <marijn.suijten@somainline.org>
> To: David Airlie <airlied@gmail.com>
> To: Daniel Vetter <daniel@ffwll.ch>
> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> To: Maxime Ripard <mripard@kernel.org>
> To: Thomas Zimmermann <tzimmermann@suse.de>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Bjorn Andersson <andersson@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
> Puranam V G Tejaswi (3):
>       drm/msm/a6xx: Add support for A663
>       dt-bindings: display/msm/gmu: Add Adreno 663 GMU
>       arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
> 
>  .../devicetree/bindings/display/msm/gmu.yaml       |  1 +
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi         |  8 +++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 75 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 19 ++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  8 ++-
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c              | 33 ++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  5 ++
>  7 files changed, 148 insertions(+), 1 deletion(-)
> ---
> base-commit: 15302579373ed2c8ada629e9e7bcf9569393a48d
> change-id: 20240917-a663-gpu-support-b1475c828606
> 
> Best regards,
> -- 
> Akhil P Oommen <quic_akhilpo@quicinc.com>
> 

-- 
With best wishes
Dmitry

