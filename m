Return-Path: <linux-arm-msm+bounces-7545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15575831853
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 12:19:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCF2C281686
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 11:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7694423776;
	Thu, 18 Jan 2024 11:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RsNSXV6B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAE62376E
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 11:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705576746; cv=none; b=ZdYqJzWXTpZdcxtScmXV5F4aNQknTmmh39oqonRoEQGvVd9Qv/bP+Byf7twgpxzcqORtVWEkELAlPjiD3vag0yxOUPetby34wuigU7dssViCRWEPE5EVUuMxvMBPkG/Rr4Ogpxn4NX8y0bX0OI+OBMwKNc86C6nqljkRO4HyQqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705576746; c=relaxed/simple;
	bh=im3zEfwggW0pRsIdyfxoeIUGy9kClHNiijPnCJvVGP4=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:
	 To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=b1QyLKSuR9ds4nAbyFPvp7yshBerHcPSSGNo88NjBEdRBntq+i9wd1lZ2xxUt0yY7ceyFdNgLw4vqKj5UrMWDzmV+OCVGBS6HQ0W1HjxzGcpzn7M+9m3MZalt3nTy4RqnLbJVVLCxCNE7ighhgiNrPNeHUQGpMkOZTPFGoisQmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RsNSXV6B; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50e7b273352so13585334e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 03:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705576743; x=1706181543; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MDFd66KcIbKFIIX/WcgTl2/WLahORWiu0MGU1O5cSMo=;
        b=RsNSXV6BOwge1dBMebdlVmIsgYNpZDol4G0nxAzqZ8gH2aujSCq+f08yGW/v74CtL+
         wsrCjHSwkKBaW63MoCL0231vRLGudcQv6rYzCLCSA+XjKFEkYBclsXObnUd6NeBLAdas
         DlBUUqwG2TSwaAG7DU5tnNlJV3jFMvhieoG7oWW4NuBjzvboCqXG2YyoHdLXCBblofkY
         R9ya/ueVog094sTWe56hr8WrfU7mlfbJLHQuCWfbn17N/D81zEQ+b5Ryi2w9ulhNPzHn
         +0YvIDgxHCpCOZwdyzr0GpA0yoEac3djguQDk/yuUi2zNrqRMwYxSAR/DABDqBtUENO6
         slmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705576743; x=1706181543;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MDFd66KcIbKFIIX/WcgTl2/WLahORWiu0MGU1O5cSMo=;
        b=SwyYNHL8MvL19A02Bc40Eexbew5yKEVSTUzeXdp1hXFTnk2q2zjaEb9UHKKqsKR1ZR
         9NZL5nN1VDVFaSsgi2nUF065opzyAqLLnitgloqGlX7fBcYN2GLh+blfSl3qFH90cBxK
         A2slgkP06Nr9f44Z4IHSdHp9jFBGMtAiQwDPlIGypjelM6BuYRi2T3Ai5kdCoWfcgmsZ
         /zsdWeLBIr/z/7vwpRY7rqYnH40yeVs85iZFkZDtJswOEhZsKMo0KUrm7wyaN5n8szcy
         uw4bAXM0gRSfQWQm++83sVjIi/WjGd0A9UtV+zxSJnPYKZvTybUJwYNy6xMouwzezrgN
         201w==
X-Gm-Message-State: AOJu0YxPhseP3GNtPqghygK/KZoEjLYaoEH//v28j4QugyTZCmz6+L6E
	Wy0eERSli4JFsINqSls9URTqcSwbfMfyKYi4W19t2a53esie+iCc7iZKDBoEImQ=
X-Google-Smtp-Source: AGHT+IHqoe2TVTZTVhMTb7zPOZYWEj/lioFMe60pwfbBpenxG7wEQKyuG3YE/bPiO2Lu8eFVuFv6CQ==
X-Received: by 2002:a05:6512:4897:b0:50e:d5ad:9414 with SMTP id eq23-20020a056512489700b0050ed5ad9414mr386800lfb.50.1705576742745;
        Thu, 18 Jan 2024 03:19:02 -0800 (PST)
Received: from [172.30.204.173] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id n22-20020a0565120ad600b0050ef97332cbsm601903lfu.32.2024.01.18.03.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 03:19:02 -0800 (PST)
Message-ID: <4c4d7469-c28b-412d-aa30-7123d3c98d1e@linaro.org>
Date: Thu, 18 Jan 2024 12:19:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: Update generated headers
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Connor Abbott <cwabbott0@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20240117203744.394260-1-robdclark@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240117203744.394260-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/17/24 21:37, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This updates the GPU headers to latest from mesa, using gen_header.py
> (which is used to generate headers at bulid time for mesa), rather than
> headergen2 (which doesn't have proper support for A6XX vs A7XX register
> variants).
> 
> Mostly just uninteresting churn, but there are a couple spots in a7xx
> paths which update REG_A6XX_foo to REG_A7XX_foo for registers which are
> a7xx specific.
> 
> Cc: Connor Abbott <cwabbott0@gmail.com>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

