Return-Path: <linux-arm-msm+bounces-29829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D2896310D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 21:38:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 605F41C2125A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 19:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3B9C1A2554;
	Wed, 28 Aug 2024 19:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q66HfvfA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F015F433C1
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 19:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724873919; cv=none; b=a0pgbMOpOR9QqgAuTIQigTchvOvGKgeT7dT+QYJfVYODgSZXanTvn/KW9mq7xKB9br2PWUNHEn/XCgSi58BFNWltkbfc1EVY7l+ODUAHWhc6+bt+EWBwtBHs3x/hATFgAfRxXvol4aKV1f5ZBr6h4xOLfpJmg3+N19LVmwUpOGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724873919; c=relaxed/simple;
	bh=czIvoLCUNhtT+cdAWhA5HMEa42cJFm5CbUX5WTE7BmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nxQrp7w6YImLZ72/SweR5xI3rKS+Gi+7jbyNsk86ZB3LY52rKksJpDvUR6k1Yi7WF5twrvdqiEERUwkA09++03N52W8+rkZcm6CdnZyM2ZeLZfB2Rl0FJAuq9VAfnmNJkpFJ0tXZEeV4PmKSsIIRa1Azd6+8yjeN3Ce7q4AxUcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q66HfvfA; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-533488ffaf7so9792879e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 12:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724873916; x=1725478716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S2boCnau9cNyFJbbhnQn5xxnCB2xmtbbHbu9uGAoNXM=;
        b=q66HfvfAa8P5ArO9tzgFgNgfijQk0UKpkHviplg0bGv8opClY2WGY/aZT52CpLwmml
         zwZlMkEW3kHgSSR95NBCFR6zn3/AwIuDgNN+sVP45Fo+fcGtqOodOTRB+EM3G+KSCJOX
         MIuhompqo0jXS7NDLUoyV/u3Gc+YsiiSM4Bo+s1u4RySqsHm4c83TK4htv4Dm0ZJd2NJ
         3Y9dYvZsukOgr2TOxCabaugqMvEWCNBKd/FdA4SxZmloqFuN+HUG8yDXxugOGnCl+VUs
         V33Uc7Qs63OcRNUJedsrPUBkT54aiLpG1N5Tb/9sxBEIOqjC61sc/EzLlNXKUpOIbHMy
         TgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724873916; x=1725478716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2boCnau9cNyFJbbhnQn5xxnCB2xmtbbHbu9uGAoNXM=;
        b=pjFdpmQ4I33KKt5jLUXiQ6Hy2yI02bypAdLl3HWyl+85PWeQU2B0muSHl7RtNVepu8
         NHL4nZ5Up3xGTzw84bfSXR1V1YilJZ2CLQeJzKyvXEI3guewbCLWk82wopEqJBQPP/Ya
         PuszA1gEypKzqdJg22MvCxM1AoZf8nF4VoOWgE9oFZDouDvQy3Ap+fQjS75e9OktTXOi
         YDvI3CZaHuTytGmGwAOqB4HmMhx12bEZnR4+onBSo5PRF7RkbfdMkWuW1ktfWXhNFaz5
         DD7PveX8H1nlnXv/3C2WrdkAqdLrh63mJ85yEISSFDCGSyh67wI7s4WIPnA4gg/ROweB
         lyCg==
X-Forwarded-Encrypted: i=1; AJvYcCVR0MeObcQGv049iiWUU6ZjAQHZjV7GOZgcJWVz2hok3ivl1AgULqsW7SAwgLy4ds7+Gj0FNWjiWi9Dhy0M@vger.kernel.org
X-Gm-Message-State: AOJu0YyNOjib0CILC9Ib1GSxAjJOn/YdjE7Zdq5T3nwaofr5sujx03Ca
	8GCM1r0/tuJ/OCekg8BiTSo5HxEF0rebn/oJ9v1iMqXeLzxfrZdZyat3756gkeE=
X-Google-Smtp-Source: AGHT+IFX0ICTjWKM1raHcDBZYIJQJARuE3gnbn2GEX7Oc+LTxOmCamgvksbRuiWzNjzPy3Id1Vcj8w==
X-Received: by 2002:a05:6512:b84:b0:533:466d:698c with SMTP id 2adb3069b0e04-5353e5aad3bmr216482e87.39.1724873915220;
        Wed, 28 Aug 2024 12:38:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea5d34fsm2321105e87.192.2024.08.28.12.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 12:38:34 -0700 (PDT)
Date: Wed, 28 Aug 2024 22:38:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jeykumar Sankaran <jsanka@codeaurora.org>
Subject: Re: [PATCH v2 2/2] drm/msm/dpu: don't play tricks with debug macros
Message-ID: <sfdha2ywvtuffsyyrrbwzjt6nkjojpbnribp2vva6fp62swftp@mjhm6r74rq7e>
References: <20240802-dpu-fix-wb-v2-0-7eac9eb8e895@linaro.org>
 <20240802-dpu-fix-wb-v2-2-7eac9eb8e895@linaro.org>
 <1efd71c4-3bee-4c71-9e40-1284b9483824@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1efd71c4-3bee-4c71-9e40-1284b9483824@kernel.org>

On Tue, Aug 27, 2024 at 11:39:45AM GMT, Konrad Dybcio wrote:
> On 2.08.2024 9:47 PM, Dmitry Baryshkov wrote:
> > DPU debugging macros need to be converted to a proper drm_debug_*
> > macros, however this is a going an intrusive patch, not suitable for a
> > fix. Wire DPU_DEBUG and DPU_DEBUG_DRIVER to always use DRM_DEBUG_DRIVER
> > to make sure that DPU debugging messages always end up in the drm debug
> > messages and are controlled via the usual drm.debug mask.
> > 
> > I don't think that it is a good idea for a generic DPU_DEBUG macro to be
> > tied to DRM_UT_KMS. It is used to report a debug message from driver, so by
> > default it should go to the DRM_UT_DRIVER channel. While refactoring
> > debug macros later on we might end up with particular messages going to
> > ATOMIC or KMS, but DRIVER should be the default.
> > 
> > Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 14 ++------------
> >  1 file changed, 2 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > index e2adc937ea63..935ff6fd172c 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > @@ -31,24 +31,14 @@
> >   * @fmt: Pointer to format string
> >   */
> >  #define DPU_DEBUG(fmt, ...)                                                \
> > -	do {                                                               \
> > -		if (drm_debug_enabled(DRM_UT_KMS))                         \
> > -			DRM_DEBUG(fmt, ##__VA_ARGS__); \
> > -		else                                                       \
> > -			pr_debug(fmt, ##__VA_ARGS__);                      \
> > -	} while (0)
> > +	DRM_DEBUG_DRIVER(fmt, ##__VA_ARGS__)
> 
> Should we just get rid of these macros at this point and use
> DRM_DEBUG_DRIVER directly?

I was hoping to get this into 6.11 as shown by the series subject.
Reworking the debug macros is on my plate, but it going to be more
intrusive. As such, it will probably be a 6.13+ material.

-- 
With best wishes
Dmitry

