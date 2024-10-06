Return-Path: <linux-arm-msm+bounces-33289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B4B992169
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 22:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E1CFB212B7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 20:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4EA0189B9B;
	Sun,  6 Oct 2024 20:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SVTAStWi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE72474C08
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 20:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728247907; cv=none; b=n3XNQuNUyIrJiRlkPZx7CBpt6g22ePUXf8Gb5H8OHgtKA8QODCQEVa2bfVzk4j1riP12lhKapw37TtO40kUvxlyyEXXD7WDTTPweEWOU7n850HqxZgsPEXe4//VXgHW8ZlgdF3R+/RpKZHNxY7rNa6SmaT09xaTCm9rd5SJcbUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728247907; c=relaxed/simple;
	bh=W8tD2CFH2V3sC/LcttR86GEkCnj375hWHflq5r7CVqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hnJXTQdNlxn4HN55rYEtGdFWqe4hmC8cikw9GUsianX06MLoyEPeM7t972lOi8BoP/j2bCARtoyzASUsiGz07VzMWD6Es3d4xB6aCY5k1E3qmdoMli4VhIRPINDN8jEpx6Fp5RDACQl0ISp0nOAkJczs/a8okHgvAWNqwCUwXzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SVTAStWi; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fada911953so45630491fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 13:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728247904; x=1728852704; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6fDEjUTjzLtS905mTVQnS2WQIUmuG01B4JauAoWq8Cw=;
        b=SVTAStWiDIsRsX1sUZbKZ3QtuQxf+U5HSzuZhlz2L29AFBaNEAw83FXjvikjtlJmQB
         Sd1sgmA80aAsIOgpqhq6KA3JLcvQH3My+X8RNrj7CPhwgG3cfE5B6srs2EqlLV1Yl3Ht
         aJM6QIOqHlp8+mHO2NcXbmhUh9nSbF4D0df8YmwchXqp4IfcFUNblLtkPUaiSnUV9Vtb
         og5Mgwk+CHh8BdaZjbo0aPVghPmx4giQxRa9y9BEskDelOsJ68c6j+LkrNStRXlPaMQz
         zEII25ypxUXDW2KJotId2Lxft1zJs3on0c97Fs76ey4lbZwZuM/Bdu6X/y/z+NRuOGcJ
         0Z5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728247904; x=1728852704;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6fDEjUTjzLtS905mTVQnS2WQIUmuG01B4JauAoWq8Cw=;
        b=C1c7g5yrceqeXUT3+v7C1Ef4AW3jCnhotON022I7k+N+zXrNGlWtQBxyG1bs30YCrA
         2pM80S74ByTheavfTZvMgzk0gbfBSGwdSCR4OB91Vo+IGKX9JgEVIwdeoDeOr3Ne4iiG
         we98xK/t4+p4lWG6K2M58SPU42uobGWlsYOJOFBekED/9hbXk+9PCSk2p6ILLF2I/m2v
         Kj6rIEA5md3ueQLtvzfNj8oiaGhgPb+excKpwIUmaDZYzczLqkIWjylLhEGjPtUqIzTz
         H9u7e8e3qiugbToIk2NKtCj0fqjGiyG7s53uaBp7hLDlBnPaCCxvW//xwLOh9CXc8s1t
         BLgw==
X-Forwarded-Encrypted: i=1; AJvYcCWTz+FJgv1C0gafpbMfTymX12+x7AVwYSOHNnbic6pTnzSUmt5nhX63xDyhTqhULgE47UrAeYzNteTr91sw@vger.kernel.org
X-Gm-Message-State: AOJu0YyysUd3oHzNBwS571p5J2fk43R37YGq/wH5E9B2aywECjkaBMtx
	GixKEdrNFpaPKRiPMqoqaQQvPPuLyyoLpqNqYmCaJx20Egw4YjZV2u2iahc7Z8Y=
X-Google-Smtp-Source: AGHT+IHA1dhDE6pxQBeIXUSkV+5WjaiKuLQOgi9ZWdiP841coIo7OznF4+2/EqVdEHJp5/8gE8mjHw==
X-Received: by 2002:a05:6512:108e:b0:539:8dde:903e with SMTP id 2adb3069b0e04-539a627badcmr4336222e87.22.1728247904116;
        Sun, 06 Oct 2024 13:51:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff1d298sm611583e87.127.2024.10.06.13.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 13:51:43 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:51:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 2/4] drm/msm/dpu: Add support for MSM8953
Message-ID: <awjaaluhzpuuqjeqvcdduxeeqotbuxeqbqd6obhcy74q2qljs6@c5fyet73al2d>
References: <20240930-dpu-msm8953-msm8996-v2-0-594c3e3190b4@mainlining.org>
 <20240930-dpu-msm8953-msm8996-v2-2-594c3e3190b4@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240930-dpu-msm8953-msm8996-v2-2-594c3e3190b4@mainlining.org>

On Mon, Sep 30, 2024 at 08:35:57PM GMT, Barnabás Czémán wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Add support for MSM8953, which has MDP5 v1.16. It looks like
> trimmed down version of MSM8996. Less SSPP, LM and PP blocks. No DSC,
> etc.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> [Remove intr_start from CTLs config, reword the commit]
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   | 218 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  12 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  drivers/gpu/drm/msm/msm_drv.c                      |   1 +
>  5 files changed, 233 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

