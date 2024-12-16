Return-Path: <linux-arm-msm+bounces-42316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 872A69F2C30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 09:47:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 300351888DC4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 08:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFD111FFC46;
	Mon, 16 Dec 2024 08:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a7WrOtIX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93E322619
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 08:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734338853; cv=none; b=T3hmC5u6ohQNhnkEBIJl2RBaK1LY5nZWzKmJemL2wO5hakAEYoFZCuzAbjmUxPfEf0jD4oDnaNCVsWN9gbExTBeWaNpFxdsV/EYylZBN1xebsRy9HKpUgnGOTtNcHHHat59UYkgMxTEMwElrsTrr1aiXRxhDaeR3GtutYTpbYYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734338853; c=relaxed/simple;
	bh=MecjR+hYpVLq58Mi2oX0DvVkh8q27KHPXWlvQw6z7Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hkDMT+3vCPxwQtQt+8D0Qz7zywLpz07l06npyaozhUKzkGHIJu36j1MyYZoUCh2r089SuDn45qiZaXedaOQsHYLVkXt+awe/2RMPRrgfVBXeWOKSPtE8DuFn9VTLG+shEUtsc2LbNs3XBGffchfYdQkcvhueKGKuDcmJGuxaXJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a7WrOtIX; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so3903373e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 00:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734338850; x=1734943650; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zzeD8yx+TMqcm5gDE+gRIinKwvYdm3w/pVg+Fc5PpMU=;
        b=a7WrOtIXvP9hRaAAjt8FSEcCCQNLl+nkNRJp3ZCtg++aMpXMJW1TFCgHAQFcIC8+jV
         gt8llwe7OQvxnEVF86gOWh1fRTzno8HaADeXmK3arvSYTr8eMj8fl/vxaTmHKi7HzFHc
         mdycrtb9OCwNWDjxXVXcn+cXfpIyYFG591sU5xd/Ns8dZE+sav9aclmH1RwWvjvGxMRU
         thLxMmWjPTsSL0p94POWEa0orYIukztYBw/6dcgEWSmS6zbIpzVED2H03q3rmlfL0pqe
         Mssg+FNqVn2Dz6bHMx97JK0sTC7ULh7PNGVYGX5CSLE1i8xKMy8wwCP1oq3lAa5r2BP4
         HQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734338850; x=1734943650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zzeD8yx+TMqcm5gDE+gRIinKwvYdm3w/pVg+Fc5PpMU=;
        b=d7icJz2LI00h9IVAuGGYEpXL63uL8XmXYne5E8yUY+Zwf3Ij8mTBZ7c72slaw44gPE
         dWqVwYQGYdwSPVYYG6aCXV4jNQUZS1yE+HJ5fvVp5TNTrTIxiewPWNTZLtQzZaBFlkZ8
         UTxtlmtTe7gEbZaQp9WbqvFQsPkZPL7rUgdtko3yqjVuaDNTTWy2xFsY4NRm8fCj2qKs
         X3omvLkkh/NTCftpCkKX2zbfEX2EfaCrFwVft6sQhWbwkwpHTARTaHGe165vSOFT8CSZ
         2FGYnmOEARmR7GHUlZxDd+h5B4qj9moNVxDSCa8dUCk0FPpQIT4VxQO5+IGm+vonYoB8
         +S1g==
X-Forwarded-Encrypted: i=1; AJvYcCUr/WcdNB+Zvm2u0RAA1dVw52Xlgarx4lh7Adp2ipfYMR2+U+Ya+UN/ALhAZFDd3TfCrx9yLNRai7UNRIEd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz36bTk5Tenl2A++LVlvzkrmhUlSKNlAM671Z3LOwRfueKoexJL
	fHKiocCGs+bPTeoj/QbA3Xbn/zpTtE78Mx7cp+NVApxNLGyYPKHCYJMX9qL4oMI=
X-Gm-Gg: ASbGncvFIlk/1DtKB4m7hobHV492Cbsc8hmg797lIuo+k7ywG6h6DFU5cw5MEaT3keY
	AarN7I58XrScXJ4YhkRa54wi9jPovCepdx+E01wvtP/Q0gXbZywZAjuRtKrSoI7tnqdZPQH9JgI
	KyFmj5PAtVRyhdZK1XcO8uDATbj1SznQoSGzzCe1qY57+xhas1MeHpxb9Dymp6Dzz+iJEkdHGRc
	IhcinC3z3oI8cdozKSRhXZ/OveSz7CQIYrefGCQhdK4Urmbhk0YqfsYqzAAtBOk0trYu1Hgw2k2
	NTdFEPuy/dSMVrDaSXmxvKZ+3c0VJR06T4Z/
X-Google-Smtp-Source: AGHT+IEJ5sTe3G9+gTy1m1ue9pwhxg6TL/Rf2dQWkQ9/Vzvc3a6UV9wPa7hVqJ6GvzWOli/HF0b54w==
X-Received: by 2002:a05:6512:3088:b0:540:2111:db71 with SMTP id 2adb3069b0e04-540905a6fd4mr3379358e87.42.1734338849696;
        Mon, 16 Dec 2024 00:47:29 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120b9f4cesm751665e87.14.2024.12.16.00.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 00:47:29 -0800 (PST)
Date: Mon, 16 Dec 2024 10:47:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Arnd Bergmann <arnd@arndb.de>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Akhil P Oommen <quic_akhilpo@quicinc.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, 
	=?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: fix -Wformat-security warnings
Message-ID: <4lyhh4ayevevk5nkyjo7kbn3r5vk66f4j34dgncycwprxs5dsa@pnkjgxstlfng>
References: <20241216083319.1838449-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216083319.1838449-1-arnd@kernel.org>

On Mon, Dec 16, 2024 at 09:33:13AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Passing a variable string as a printf style format is potentially
> dangerous that -Wformat-security can warn about if enabled. A new
> instance just got added:
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c: In function 'dpu_kms_mdp_snapshot':
> drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:1046:49: error: format not a string literal and no format arguments [-Werror=format-security]
>  1046 |                                             vbif->name);
>       |                                             ~~~~^~~~~~
> 
> Fix this one and the preexisting -Wformat-security warnings the in the
> DRM code for snapdragon.
> 
> Fixes: 1a40bb31fcf1 ("drm/msm/dpu: Add VBIF to DPU snapshot") # and others
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I have a larger series that I still plan to send eventually, sending this
> one now as I just saw another one get added. The warning is enabled by
> default because there are still over 100 other files with the same problem.
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c   |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 28 ++++++++++++++++---------
>  2 files changed, 19 insertions(+), 11 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

