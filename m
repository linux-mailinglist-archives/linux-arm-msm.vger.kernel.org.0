Return-Path: <linux-arm-msm+bounces-21704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDED8FC36E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 08:29:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB6E2B21947
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 06:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4E93DABF2;
	Wed,  5 Jun 2024 06:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FHcRfxUn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED2ABA3F
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 06:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717568965; cv=none; b=WSV6pMrazLD7tHXqE3ifaRbBwtpt0Wm6z96dRIcBgjG+uAOdACNvitiFqZ/OUdspWaBccHSjpyGMluXaJfkFS8Gc7RoilQGX2hFhGFJGc+yiCuNl/aU22iJy8vHiyYPDGpgosIWMvjULEC1p18obOh5e7rVU4qgFCuCI7V4j8UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717568965; c=relaxed/simple;
	bh=8MKNSHs8EGOAIZ9jigkySNhXca9mZ6lM0o1BuxSWNBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jPRA/uEdt68pEUeJbvWm6oA76hs5z72LX0OWU1ibGZZd7g2ItPTyn0ud3IPiQJx1c7F1e6b3acwM4cSuMRlzsR23lXDxXPH4eg19O9vbzk21Qg1zBicw61eauJEzOhYquAoVOZS+QW5HkTVFsSX7/Hro4me7l/ekmA+u08B17QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FHcRfxUn; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52b7ffd9f6eso6404164e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 23:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717568960; x=1718173760; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RJ/23iqkxXhCu+0zyqHfXdCfh5GsXoO3Ru5EztY6RCw=;
        b=FHcRfxUn+BpbyI6o91DoMiD9KAgc4o4f2dWNdUbU66wrMlsNzGUvmByNSWC13Yjvx7
         CVNNYJ5bTn8krmLAlvpv9i3EJBdTV03UapQj3N8HQNO/bKuIdbx9VxCGKbeTPYLa3Er4
         HhzYV1FSPpIXqjVqjtid54+gDXkQL4iQfvJfpokh3DgZ7meIfHf6pATYR+NyRsCtV4pK
         s7C+/b1oVZnyGn85LGVwLipCa1yaJnQtJSj1TlbIeYRkpvr12K4aaYGXIr68jbCsLA2s
         +wFGyCWpHOWAlaAtoxty/6gZ7f0p2gRTch2nES90HcQM7UL+4IBJOVn4vGjfbmBUaLCK
         oCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717568960; x=1718173760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJ/23iqkxXhCu+0zyqHfXdCfh5GsXoO3Ru5EztY6RCw=;
        b=lRviOuvwDJ+ZLttFujpiz7ATcb2TvIAE37L9MmXmXgfV+Gq8d7TkZnhgVXqNrOr/8b
         +V0W7GlREHNL9ZVxEpMt+R4zDZ3MvCrPqEd1oWBX/gGYOKgz/8oMlpdtIu2WEp4AWscq
         Rx5fALPLCHdTtPntDNoOR1CIeu3zrmfeTbVJ8ZL7oxj7pPj8QeVXRrlqL3EX6FRMUeYq
         30ql+EPuHS5wxGOWPMiPzEhR+/FzQVqF3h+yhMP4702HI4m4e3MNM+G99v1Tm70Ipptl
         Gf0fE4bqcrHwZN0chYT+t6n/0Cq6Ip3HQrUthO5CPLMDPAN+IByLcDQx8OnupublFgQY
         XVlQ==
X-Forwarded-Encrypted: i=1; AJvYcCU56sJ3lArXPA9rYd7YywbJQr73IDkhdSa79cKRzUmXpliiXm4iLtXn58IqV5o95lfljTkjoHe7p65CS3/eknSpQl8WOv/I24ntoz+99w==
X-Gm-Message-State: AOJu0YyOUG3Y984fiCidGaNx9gGJPyoxnu0hD6vW4TXddSJSE7dfZnVf
	bsp12J7gfv4qNRBoa1iGcM723KdsVLR800G/445p00S625eHO7ATJj1yt5ARMBg=
X-Google-Smtp-Source: AGHT+IEMB9B/0I44cfP8n6kV1HLDOy5FxC94CDo+3545zQnZBjIiD9D2HCEXMElemi0yaQa7rQDptg==
X-Received: by 2002:a05:6512:3056:b0:52b:7945:a434 with SMTP id 2adb3069b0e04-52bab4bd908mr1013426e87.28.1717568960298;
        Tue, 04 Jun 2024 23:29:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b97a15436sm943344e87.96.2024.06.04.23.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 23:29:19 -0700 (PDT)
Date: Wed, 5 Jun 2024 09:29:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Connor Abbott <cwabbott0@gmail.com>, 
	dri-devel@lists.freedesktop.org, seanpaul@chromium.org, quic_jesszhan@quicinc.com, 
	Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/msm/a6xx: use __unused__ to fix compiler warnings
 for gen7_* includes
Message-ID: <zgg52ydg2w4gxgmsfwte5houkns3rikdfz375oty6bappf5eud@gekg6ynavdpv>
References: <20240605003829.4120343-1-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605003829.4120343-1-quic_abhinavk@quicinc.com>

On Tue, Jun 04, 2024 at 05:38:28PM -0700, Abhinav Kumar wrote:
> GCC diagnostic pragma method throws below warnings in some of the versions
> 
> drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:16:9: warning: unknown
> option after '#pragma GCC diagnostic' kind [-Wpragmas]
>   #pragma GCC diagnostic ignored "-Wunused-const-variable"
>           ^
> In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:18:0:
> drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h:924:19: warning:
> 'gen7_0_0_external_core_regs' defined but not used [-Wunused-variable]
>   static const u32 *gen7_0_0_external_core_regs[] = {
>                     ^
> In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:19:0:
> drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h:748:19: warning:
> 'gen7_2_0_external_core_regs' defined but not used [-Wunused-variable]
>   static const u32 *gen7_2_0_external_core_regs[] = {
>                     ^
> In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:20:0:
> drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h:1188:43: warning:
> 'gen7_9_0_sptp_clusters' defined but not used [-Wunused-variable]
>   static struct gen7_sptp_cluster_registers gen7_9_0_sptp_clusters[] = {
>                                             ^
> drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h:1438:19: warning:
> 'gen7_9_0_external_core_regs' defined but not used [-Wunused-variable]
>   static const u32 *gen7_9_0_external_core_regs[] = {
> 
> Remove GCC version dependency by using __unused__ for the unused gen7_* includes.
> 
> Changes in v2:
> 	- Fix the warnings in the commit text
> 	- Use __attribute((__unused__)) instead of local assignment
> 
> changes in v3:
> 	- drop the Link from the auto add
> 
> Fixes: 64d6255650d4 ("drm/msm: More fully implement devcoredump for a7xx")
> Suggested-by: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

