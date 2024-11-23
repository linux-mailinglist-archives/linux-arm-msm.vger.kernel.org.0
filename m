Return-Path: <linux-arm-msm+bounces-38888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC99E9D668F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 01:00:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35E9F161244
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 00:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07401157E99;
	Sat, 23 Nov 2024 00:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gCibfN9F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40492A1D1
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Nov 2024 00:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732320023; cv=none; b=qcZzlrLoSrbefU4c8089FIpEII/gPCrGoXK6VOoOKBrUq4SCEB41AtKCX5rF0YB0cxS0qaZtc0xq+LgtU5uiJNrMKKX2YnT5uGS4Cv19oUp0JIEst0T9nXswj2dnEIGcuvxpuEL+7kPcNXfxONZIfGyGlSEfzumYyQzsnHeKrAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732320023; c=relaxed/simple;
	bh=u3GVNbfepnp7N5qDFxe94e68p+Ai5fxqeOp9tDEO4gA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=be7gMW8LpP3IucPriqALkzCBPXIDfDOrCxvjhjbL6igqd1gqJKAqV+Do28r2wncoUqe1nXyrVhcCWSRAwV+r3bXkkKl/TUIPhDwjtw2E19FslRki1tXd8/wCmp14YKzf3JqfccGV9GzrLHqRdo5CfCCaRl6jrgl5O5X7UEWr4Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gCibfN9F; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53dd9e853ccso790298e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 16:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732320020; x=1732924820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jsBEPts/nIbbNaoUTj1vxVlfNzP9ab+ytNZuDFKdOsk=;
        b=gCibfN9FzwbZtSCG5X66rDLBjseMPx7NLp5v0BO0eoEQZySfEW9gzqC+vKePeeU8LM
         m4dMbByVeQICwi+LndXPOz0Zx161PtPgw6k46cqadMEoSYzVnaFVOS/NjWNDZ0DPFwFF
         CWPxjStDs8YCxxAJmjpPNuB1fhBgS1+ENqveUgwf+gFt3DKrr/ie6/sbfI8jAVHP0vq1
         Ikl95BYz/zTLDJFFovZz54W5Om+84a9vRK+I/lrtRXfI3GVZvAbbpgVLxF6BeDsbSd1K
         yr9ndSbOtMrVgp4pMzC4osCiQeamUobWlcWgambKOI054zrfxVrJc8qtI8H7h/lSLgFC
         xXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732320020; x=1732924820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jsBEPts/nIbbNaoUTj1vxVlfNzP9ab+ytNZuDFKdOsk=;
        b=CLvuLdJRnHKSr345KRZoECq5114mpPr+ah1iYN9a0DlrHkn+p87OVyqrUMEbnMS+Bi
         RioHbIfJmLqWnKxHXKUrxte0afU1YRLhNlD0YP8Vz5RhVU5b17SbXDkgvgwq4zFyV6qy
         3grP4URpYFOnb5WyjKFHJyr3EkVqTQk2qbfviYHaEQhNIbzu/gnmcpxr7y8FoTgvEIaF
         7xvdszBm8vBnnr9j5AAGkOK+YyWvkwOot8GUNdOIWRBgoy3Cu1g7bF/sIWWr3ubvPWwJ
         pxGRm2R9SMd/GRO9qYpC6d52hgPHDOzz3cR4gx+NxxiLXId0UBd1dWBuOja5sryLYCnn
         Tnlw==
X-Forwarded-Encrypted: i=1; AJvYcCXauT+Ifp4ss8HAkOm1KOK0jcvkewDJWRZaYj+Kz3wAo0JWbYEtzmZUFuX4xHz1plPpgLW4eGXvVPQY+HMs@vger.kernel.org
X-Gm-Message-State: AOJu0YxpGsozO7MZy/q/7TY6VFBLKVEQNVscpYObADwlDMMrJ9mWebUa
	cFqsHu8FjN1K7w5Eh4DEc4dmT2FeXFx26pR05dxqj9mz5+7msnVU8huIcZ/HjAk=
X-Gm-Gg: ASbGncuu9lJaRdaazHwG+v3RsyQ4amjcBr1gVVLHJkhdnIy1OBqUCR5bNMJLc2zzgHU
	vIHpA2RGYFn+XXzPB67qTwWTPAQY1jyXR50ekOMCfU89U1MZVhfyaJrotyGAJuET+bZ70Fr+r1x
	IufWd1kdrbwF/e7L1K74h7bNQndFooyqJs8HSi8YF+n82+oheIkHaXg/i9/I+LIOFpgV1gaKBGk
	N1DdYWHLNEpK7YBT8XJ2YNi9928XxZza+GXo3sEB5LTGJKPLtDtEAA0J4vg1PPLHPIo9jUmqgwC
	i7J9i2q43s/lo/zjCuwAwUxg8xNwgQ==
X-Google-Smtp-Source: AGHT+IFzdu68PpAVcH2MaPOLobnSuhzBLFuGpwZtzC/B7jvw+8UWRjpP5qmwwColoKW5tz3fO1q7LQ==
X-Received: by 2002:a05:6512:118d:b0:53d:dc12:7cb4 with SMTP id 2adb3069b0e04-53ddc127db7mr103246e87.29.1732320019290;
        Fri, 22 Nov 2024 16:00:19 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2497cfdsm610900e87.248.2024.11.22.16.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 16:00:18 -0800 (PST)
Date: Sat, 23 Nov 2024 02:00:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Add VBIF to DPU snapshot
Message-ID: <mue2tzzik4hiu3i4jjl457inbrveq7oifsy35fzwclfbqwn5xz@awtruuphsjzb>
References: <20241122-vbif-snapshot-v1-1-6e8fedd16fdf@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-vbif-snapshot-v1-1-6e8fedd16fdf@quicinc.com>

On Fri, Nov 22, 2024 at 03:09:10PM -0800, Jessica Zhang wrote:
> Add VBIF registers to the DPU snapshot to help with debugging.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

