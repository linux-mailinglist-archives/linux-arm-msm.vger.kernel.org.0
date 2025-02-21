Return-Path: <linux-arm-msm+bounces-48965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA76CA3FBD0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 17:46:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61D14173E97
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 004371F3FE2;
	Fri, 21 Feb 2025 16:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JL/FJjnI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A3D1F2C56
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 16:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740155879; cv=none; b=MONCQWNOvVjiyBZhFpB4Cu72AhBLq3wV6ND9FpToMdUz4b32Y11pivvtCn1PClXnUPRSySsIX190yKXIUm2fH3ZqAZa+ZqvAP+ibaExACUqvCGh5novY7w0EqO2fDLX6zTF39CBReWSfCYOl92V6r36xtVgoDkI+VsWFyKOTFxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740155879; c=relaxed/simple;
	bh=PNc2UA/ZLsZQUeWdLDl3KKGsX49tWcp0C8Wye1i/fTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VEsfTSfFekvcRswM4G86VRZSZiqTnUi0IHTRyisAgTJs8bOjxSUmA4wAwKCWbgkZrYGbR/q+Yf9uIh8zlMqEMFJ0e3tb7C3AOS2lyd6Qt/+6d9vevAAzm/kN17t6INm3QWGIfSBZK7x5hXa22L851a0s7TuKnnh139cXsYZmvSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JL/FJjnI; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54622940ef7so2525763e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 08:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740155876; x=1740760676; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HiCM9rHR9ep2t2LpEOjyyuBT+CM+zVgh9rP3wMq2c10=;
        b=JL/FJjnIcXB8ITWohaDRlmX9UYR8swzsBZM1H8FTIEFvFdiLbtf92NaIUJ+Ff/dDmc
         VVAv2Fl5AsCtNmidypQ2CJ3kTgGmTv5q9CoCa/iTwCiJig0W0ueaEOnJwFk8lrXUQquQ
         5AorFv4Wyac5Hpw7Bs6EAxhkJEJORdXRJsiuYPUdLZgFJ7NNaY+uI4+vOIHKksuf0Ykc
         BY6CV3lLMgZWzQVPrAoihufuElePshMMECdnrhLQS//0diG1fLcNH5sIZ7K8BwJ/q88l
         MpI8nxZrEVlwb+UAQPlQlBeTtW8o0M4fHuiIR+ZROA3K25mki+yCn8jWHd+P3UmuQF8x
         P5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740155876; x=1740760676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HiCM9rHR9ep2t2LpEOjyyuBT+CM+zVgh9rP3wMq2c10=;
        b=U5quY6+bqWZBe+JmBNp7/lm/+boEU6D2QGj+fMQnzK8HY/qHBlO4HxPOegZLr3vqQ3
         hHZHgdJvmDLiyaX+gdtILX/rEvi7X6t6KenZc81rjB/1m26sHi3NomqqB2+bk2OGL4DV
         x3v/5mboYkYcpxUR6rytUt3k2HZlH2QXjdlQj9vX7wlR8dSFOgxD0P4RDSQeRUgaa7IO
         BsKaN7/OtEkMcHLjyWdEkFsWrurD/h8a+8arvgq0nBBPrekW6xKvt93vjhAQ5sJHvN6Q
         afDoi2LpInojLn6uXXpchfXW35evlb8VTP3t8SzvYAgg/L5rnhxdiHq4DdANXn+oQ3tM
         EX5g==
X-Forwarded-Encrypted: i=1; AJvYcCUyW8miHcc0znjHoSXOW3e53j1cdJUPA+pVqz5r5HLS4BkBLPUhBIIFDHWZQuZsK6/eCnrGZlEy9WbZkt1k@vger.kernel.org
X-Gm-Message-State: AOJu0YwGYoU/TjeXGfctxo6jSG/edBHNa09NLJjWxb9b420YL3UPHsmx
	vTIlDrcGBwkzVrtrMuZ0pkAPfdE7kpQtTW/4PhO9cqD8dnNipd34lDbqcQf4QZo=
X-Gm-Gg: ASbGnct2rfqRNyDJqDLn/rLtoakBaMQ9KcfFiaTMwQ7MTRUdONyhpsNnmnW7dInbaOO
	vot3K+qxZdKuczp4/+Cw8/CIs50EzvZ72c7uzFmjmQhJ8RgQnWhYyqjvGtfD5QNqJ3YO1o2nMBR
	30wdTExLHZfCw+fVrSosNDCYZmhjzB/NhlS6+AEaja4xhY3JDa830hdHkhF2UKE2saX9HUMDbkJ
	bduRLLRahuPlh7dtf/0C3S7khH9K9Z+anwOh8AW2ChyMDmy7twmRbF+8fyKfTyxBv044sF0FG/g
	2M6DWD5OTOpQ36bo/PHqP+cKxkSlLk0rhPp9vHoB7+kTJJzxBfb6i+cTDydRn+dvNfC268pMOxo
	cK8+ejg==
X-Google-Smtp-Source: AGHT+IGoFXuun5GJ97Xvt7Zgkc3Ne28NUcJZxPJK51Drj8l8NBtis2PX6e4XOtShtMwtO68U8U2oOQ==
X-Received: by 2002:a05:6512:e99:b0:545:c51:4a0f with SMTP id 2adb3069b0e04-54838edd8e6mr1785885e87.4.1740155876184;
        Fri, 21 Feb 2025 08:37:56 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5461dea980dsm1758346e87.63.2025.02.21.08.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 08:37:54 -0800 (PST)
Date: Fri, 21 Feb 2025 18:37:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 14/15] drm/msm/dpu: support plane splitting in
 quad-pipe case
Message-ID: <5sio6so2dcdadxps4russkuk4i4duui3oxcl3aeiafkbsw4ag2@g6l42epivgpz>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
 <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-14-c11402574367@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-14-c11402574367@linaro.org>

On Mon, Feb 17, 2025 at 10:16:03PM +0800, Jun Nie wrote:
> The content of every half of screen is sent out via one interface in
> dual-DSI case. The content for every interface is blended by a LM
> pair in quad-pipe case, thus a LM pair should not blend any content
> that cross the half of screen in this case. Clip plane into pipes per
> left and right half screen ROI if topology is quad pipe case.
> 
> The clipped rectangle on every half of screen is futher handled by two
> pipes if its width exceeds a limit for a single pipe.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 134 +++++++++++++++++++++---------
>  3 files changed, 107 insertions(+), 40 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

