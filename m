Return-Path: <linux-arm-msm+bounces-18291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 075E58AE646
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 14:37:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 269AB1C215BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 12:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88B0085C4E;
	Tue, 23 Apr 2024 12:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j1fJ76Hy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F8213442F
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 12:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713875762; cv=none; b=tTVOzbTY2Emnmd64jA2tWt5pnU51bOUvb1yDRCOEkbP1+dJmEwdf+sq9ujXm3sCinUnvY0S2m8dNgvDyj6TuBDb2uqRRvroAxnfMsdIpGw1/aFwT7GtMr3xfTiELvI9K8W7PNR/MTlFxeZCWz2EbPLtVeanVnrPPUXxjulRz8Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713875762; c=relaxed/simple;
	bh=ntq7IuyIVOsN/xiE7blnc7/zrkrEWbEFaH3sSdqcllA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z5bzLiVZqAMoBZRXtlL2p2TXW6LEDHdiEkGLfV5tLgeKeQKogNmGh2U1kaQuAbDuSEhToLnjS64u5AARjmEZ5ONuctoCXPUXEuI7Dabf+uf4xsHDLN+GwzjXMvublMMSg9gW86AoRE9qZK6Dkezd9TWt81MVKbAkzsApv++X5Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j1fJ76Hy; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2db2f6cb312so97599461fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 05:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713875759; x=1714480559; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nUm4YW1UwAedF7qs6RwnQnQDlQCeY2lio1mQAuIl2hA=;
        b=j1fJ76HyXWCsABW1aAa7jtpbVCL0EcHdLoxXGhy94E++z/ftgXd+EetZUECoB+XEaX
         EvyBGdTzx/EuRDXsfq+jvRij3w7QfHXa3d932K0mPbpgW50MCVeR8V8aYpM51U2QKiic
         yJtwNSNoxcqqafJUwl3koP66tOHwIMvbGSnXw2XuZIBIWH3z3W0B6MmfTr3MNbxIzJzy
         8W1EsyF17fi7QDAyO4oMRQ9n+P1/7QXuQHLaRPzemQ9HlGbSWpq8GABxNOcFvSauoMvU
         B3kiOPxUnUwwwSAWEVcr9X0z/BHYrDVjyRb5KEVJPJymo+y0P4o7uztAMbckkLeetMXQ
         S90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713875759; x=1714480559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUm4YW1UwAedF7qs6RwnQnQDlQCeY2lio1mQAuIl2hA=;
        b=bPcDH9+T/kwTdnPhcpAaV351K2t9gj7a/UBNJPH9pssNhfvV3XecEg4rKl5Z/LzcTf
         EcYNLgxwaZcUnQx/C/jeCjBDjRM3LudFbdtwePzsKF6CNcBtnYOEx8tk02g0sd33/JIQ
         5+hPwJUGqnKPQbxY68SYZk1twq/vzElA+X/ZA7M1MUVYaW9xaP8MM6GvEk8eEyLKeVZC
         ePaTwewwfLaL1KobNMIn2j+0AJ9hlQKNujQU4xh9RMp3pwnEDwWFbmlL4uzX0LBysXQf
         bypgCUfxK2bTM+5n9SgtD1jt2QZtXpfgQhQth/z9I7/2jvoniccn9gWhQBdeHZ4PVlCJ
         pdKA==
X-Forwarded-Encrypted: i=1; AJvYcCVhGwUV5UDG1lO6bVuRQt/H33vkqZxWXcAGwEzEZo26t0YZTM8//XBlxtMMqaoKM7P68yhrY+7gs2RNzE8d9XPeL/wzvfQypZxRlkXwbA==
X-Gm-Message-State: AOJu0YyYG/8Yhj+TmPD9rL9zGi7uBAqCzNHrMUeyStg283Obo4LmEbVo
	FCQbuI5SKSHxb9om0Nfw7GGvqXVoCAAKMMNxYmI0HL9DbFOb1K2gXm6ij49SU74=
X-Google-Smtp-Source: AGHT+IEjshmlgcGx5nklIUdU+NXP1sYIs4i4QNvD/BiRJQIPm+n+8UatxQVPrvg7Lboi3hBwptw75w==
X-Received: by 2002:a05:651c:2214:b0:2d8:5af9:90c5 with SMTP id y20-20020a05651c221400b002d85af990c5mr13373645ljq.39.1713875758967;
        Tue, 23 Apr 2024 05:35:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
        by smtp.gmail.com with ESMTPSA id o23-20020a2e9b57000000b002d46df91965sm1711649ljj.80.2024.04.23.05.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 05:35:58 -0700 (PDT)
Date: Tue, 23 Apr 2024 15:35:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/msm/dsi: Remove dsi_phy_read/write()
Message-ID: <njceeizdk2pea3oqni3qpzl323dwrjtdin4cd4hqqewyrg6y74@pkpi42gvrv74>
References: <20240423-topic-msm_cleanup-v1-0-b30f39f43b90@linaro.org>
 <20240423-topic-msm_cleanup-v1-1-b30f39f43b90@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240423-topic-msm_cleanup-v1-1-b30f39f43b90@linaro.org>

On Tue, Apr 23, 2024 at 12:36:59AM +0200, Konrad Dybcio wrote:
> These are dummy wrappers that do literally nothing interesting.
> Remove them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           |   2 -
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      | 273 +++++++++-----------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 215 ++++++++--------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c      | 109 ++++----
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      | 224 ++++++++---------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 205 +++++++--------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       | 320 ++++++++++++------------
>  7 files changed, 645 insertions(+), 703 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

