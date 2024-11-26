Return-Path: <linux-arm-msm+bounces-39211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3739D9982
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 15:21:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77125164A23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 14:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99211CDFA7;
	Tue, 26 Nov 2024 14:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OKryEOr0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033AB3398E
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 14:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732630892; cv=none; b=TYIFzoQoNmommwvIajLY4jcGSacaaotldptO7VG8SYmtXd3R/t7nkE8E7Z7F47NjcmRsO+omRoZWEGdvilZmhzpwJSBzqjUBeVDqwFBOmR3N4n88Lh0WV41HLfBuhfXI3zVwWooQxXDckE902sVnQ7dQ7oeXnlFeZdxZuJUFHl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732630892; c=relaxed/simple;
	bh=hSchZdne2yL1Me73QcTXHzIkfVLw00TjinA2YwxeHME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbdr9UUbeb31wTKmieLzhE5f6VDtsMo4xibAKn6oA0yjaL/39wlRLMLztz2WBK23rEI8qokMeJdbXFIrplj0t3wEHOJYwOCPJfV/bKs2pjTjn4HSYJFwf/Y13AXaXGjaeMsJUc2nxQdjW6lAR9ImKKm75RaO3LU6lmMUU0/47zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OKryEOr0; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53ddd4705f8so2829975e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 06:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732630889; x=1733235689; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WsqG/pbjaTDjdBrbE8Gh7QedJI2HzzUU10Z4g5bMrfU=;
        b=OKryEOr0m46uCzQTwvHekXmTO56lqHguIFD64EYMVJZva/Jb6AWRHP31hFcSLTKM97
         Z7aPdshopn9MQKWLRyl/L5Pv6zCjCBDIq0aM9Wo+wt9/23fDhIt9Qy61LV9EgPsWG/It
         q+rRzdHZpGuzc8jN88ROARMWcksixPwYsY2FjfJAh5CG6GdI6J1BWVa9NkUmDamMcvq2
         6sbupb1A0gSUI4Q8OEY8D7sI83sFBci/csRtTvRdVd46pLuWYev+tmsL11UFU2FGlAy0
         lCPxL93pP/ceC+bLX+98hHrISBnHEHJO1acpPyHn+vPfowUgvhVZjU42YN46/HPL+dMN
         K29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732630889; x=1733235689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WsqG/pbjaTDjdBrbE8Gh7QedJI2HzzUU10Z4g5bMrfU=;
        b=pBZ286/Mo67/Exb586nfQ5bhtloVUirBpHnqZrBvYXArpD5NEfgkl/KfTpGbreDRD7
         Wg/u4pVNxw/rcnRAR13ESfSPD0IAvfgazho2X5iC+ik7HJsFc5Cb+sIvs0gaNbVG7OP7
         i3zrWnB9LEns7zgP8wU4hgsbT3lMuJMWDKhmI62rryX0O45S8VD3WH6ElRqAfWBHDeTZ
         dvnChhqd1g842YAj2DMcCVq5M1fgLdkL28N2Gb30nuGLWH99GBD5XJWIujDF64ph4ZHy
         VBFuPnNWLJ4a/ednMxIXB7DyJEaCJIxQNg/jm2cP0eoZWzg8Q/3+erKkcQKnhmPn2d7w
         WWuw==
X-Forwarded-Encrypted: i=1; AJvYcCXML7edlMCF9xgYPcAWIiUfqng0oRSyhcVghHo8vOjfa/ll4ebHBlI556D292mafpXAZn87/8c6/sqOdhMB@vger.kernel.org
X-Gm-Message-State: AOJu0YxrMZtaL2ZSV3Z81KDDy1LefafpBobNB3WgwtS5WhypxLVgbJvs
	VF0EKBQhlsDeNI5UmNmXV98fM+1vyARBYyzCe/lSTUFSrOVl9n8mb/IF8LqVfN8=
X-Gm-Gg: ASbGncvBfXcNuDabJqdiwoKFca9SmyvFQy1RxbwP3mQPzUTV+PVAfNUKupYa3EmZKJn
	lf7eGanw5QKiQOoHUIM/C04L3XNgGIBlZBHuOsK4QzAIQUiuVOTwRCIW9a5LAX82rViDlKI35mI
	UqlnW0hz3hp/rnrUx1LPwmrAAtJ+TD+0BE9e4jpfVeZJl98LsegBWj7EoTSJJHFwVu/1MtqXuA5
	3ih+Dor3V2zwjIEGgjlDdwYeFvg3qiuLoKNZBou0WyOGpQ+7frtM3ZnE5vU1ISDIkYSH4fnVHTo
	X98O54bR0VA1sRzEkK13QMOW5wOrww==
X-Google-Smtp-Source: AGHT+IEJeByCvQlDqy1R+C0A81cHp1AJ1H0PojsXjN2ky6dVBr3C2B16XhZSVyi5c5B271VuJ9O4Kw==
X-Received: by 2002:a05:6512:318b:b0:53d:eda7:6981 with SMTP id 2adb3069b0e04-53deda76a69mr556144e87.27.1732630889153;
        Tue, 26 Nov 2024 06:21:29 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd24518d7sm2025711e87.80.2024.11.26.06.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 06:21:28 -0800 (PST)
Date: Tue, 26 Nov 2024 16:21:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU
Message-ID: <x3jgyvzkb2p5txzmqvj2qdhj7ag5css7qgbynxlohbypz53dq2@io64rzakgmkd>
References: <20241126-qcs615-gpu-dt-v1-0-a87782976dad@quicinc.com>
 <20241126-qcs615-gpu-dt-v1-3-a87782976dad@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126-qcs615-gpu-dt-v1-3-a87782976dad@quicinc.com>

On Tue, Nov 26, 2024 at 07:36:49PM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Enable GPU for qcs615-ride platform and provide path for zap
> shader.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

