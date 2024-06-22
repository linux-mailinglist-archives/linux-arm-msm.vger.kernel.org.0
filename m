Return-Path: <linux-arm-msm+bounces-23694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBF591336E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 13:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 715AC283E0A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 11:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3714214F121;
	Sat, 22 Jun 2024 11:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LPzAKJUq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669CA33F6
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 11:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719056693; cv=none; b=AIhwIMcqA/nm9cVtrH5Uyh67tO6S3yFeuZpoT4ygtJD2sY2b0sHWux6wfZRf+iOa8Xaq7eTgqLYq4lhysuNX5ooSXZAFmxVx9+/z6+CuHbp9K6xyy6Kx8uBJ81j6/+KNBNqoGvBAa/f+9rsLVdJm1Si3V4vyQGBaoVuWqRdQVzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719056693; c=relaxed/simple;
	bh=ILrMcRABfLu5odx0xmODTpZOJXAX3oCtYEXvGESWBRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PxwWjgA1/3Ic8l0Tlr0aLHo4GS7vByLIT2AZywq923IfFv6aKtX6dVYMUNcPw4Xb+Q2iqste+1vCFe44t0eEjL0b5T0dfBhDWKStwl7BSP7HwBzJM9QL+HhuQpx/Fe63Tb2yz+uLOicxFiXspceB6NlQRz+ddmzYWIpgo4j89jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LPzAKJUq; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52cdbc20faeso1273791e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 04:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719056689; x=1719661489; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ax1qSIZw8a9/jFifgEYbxj7FR9Vvqi+T0eMK+uliwIg=;
        b=LPzAKJUqGJ7VjvpE4c2PPsMgiG5pltezr9qHYz+ZbfnFhjPrTnYmrosoFux9kG34up
         knsTTGbMpb6a8lJZA7nKnmwtQ8NiembOY9m4n7fZA3wxvfDbEh2D+fH0PURJ85mn/P1f
         wSxTGD9VaVpGjBQ0XvaPW3ldY6aEpXoSLTz3THTyb2TYYQ77zrrsdJl9yBMG/KIrcVla
         1uF85LHfjXZ6EA6h/vJD9OM/Dmh+VSrwPMQ7Mhg5agy8WVGRMRrT/OUnSmc4PyyWFhAk
         CpMM5bbAfU+UCcKp8WFDwZdBaIS+s17jnDPfYpMOf08ng+nmtZ+A//90KG2pSaYiXcVP
         WCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719056689; x=1719661489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ax1qSIZw8a9/jFifgEYbxj7FR9Vvqi+T0eMK+uliwIg=;
        b=YoOzbkUg72zkxDJEtDmkpT0MgnCu466fnlsiWTjKB9NTdixYwPNOSltdI97F6U7FI0
         zz5x/xiAlgCHxDzCTcDzdsBaxdHOfglxBYk3Jmic4C3bdQB98BwWzuDH4hgr/AJ3iarl
         pP24l5XJA5D9u331DnAtDkO5eSGi1OnnvoFcfECD7A9fqrjklyX5GEg5USCX4bDhpcUl
         RBo+abSR3ZRIs93Sfw+kQ12e+ubcQK9r4Vpx/P8HIyIbSdacLh00Ef4t3GY4emiqy5q6
         NaEafgyyTFX3fAxVzQu1O3p6S+2MsflfO7XlzvU0abid8Am4tZi+xIi5R9m8daCuuFlW
         LF+A==
X-Forwarded-Encrypted: i=1; AJvYcCXGvC4jA9Tk0AK5aQUEaw7WploVmOrN5yu0EwcJ2OrHK3XlfGThayRO71pu1WwJ4ONmLt/5in45I34jI302HuJvE5Az/f8JL13XOoH8Tg==
X-Gm-Message-State: AOJu0YxW0grOTC2wbgjqVYvre57TKiXRvMaVYbi/kTQ7xhbpO4u0xorX
	QQxTOPwz/4E3MgnpnNtolUQRI7a28gafZ7M6i6IZ4BLnk3wuiLEIV7JZ2SeVUOw=
X-Google-Smtp-Source: AGHT+IEuZ2USoydSTh3MwiJDZ0wxf9ZiV0ueTgAhwf/h2tPzISGQ48W190i27F9kY7dhP1o1sgjyVw==
X-Received: by 2002:a05:6512:3496:b0:52c:d96d:6c7a with SMTP id 2adb3069b0e04-52cd96d6d3bmr1871338e87.60.1719056689522;
        Sat, 22 Jun 2024 04:44:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63cd698sm469653e87.118.2024.06.22.04.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 04:44:49 -0700 (PDT)
Date: Sat, 22 Jun 2024 14:44:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
	marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_rmccann@quicinc.com, 
	konrad.dybcio@linaro.org, neil.armstrong@linaro.org, jonathan@marek.ca, 
	swboyd@chromium.org, quic_khsieh@quicinc.com, quic_jesszhan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] drm/msm/dpu: Add SM7150 support
Message-ID: <oks3xgn3ks2fobtdys5b3ssw74fwn433q32glhebq37snz2df6@oc2h6pi34tlg>
References: <20240614215855.82093-1-danila@jiaxyga.com>
 <20240614215855.82093-3-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614215855.82093-3-danila@jiaxyga.com>

On Sat, Jun 15, 2024 at 12:58:53AM GMT, Danila Tikhonov wrote:
> Add definitions for the display hardware used on the Qualcomm SM7150
> platform.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  .../msm/disp/dpu1/catalog/dpu_5_2_sm7150.h    | 335 ++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   1 +
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>  4 files changed, 338 insertions(+)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

