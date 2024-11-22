Return-Path: <linux-arm-msm+bounces-38818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E675D9D5D06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 11:10:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A69DB24A65
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 10:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB7F1DE3C7;
	Fri, 22 Nov 2024 10:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BOymW9Fj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2A01DE2C6
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 10:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732270137; cv=none; b=hymlFVPa4HKWPloC7ahPp26T3zd1Vj2IhQ3YXAXCxmli9XTGQ5G3ohV0sOlq79xhZt6l10vTk8uii9AhJjQRgGHDWCxLgq48KUZF7VjyNkcNqF5pj2ExeY9lrwb2iS2WMx67YRvFj6sot8QREVCMdUSY0+G32OnHcEEKMN1qOAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732270137; c=relaxed/simple;
	bh=MjqTitXAjNnGGAR8OCd71W+zJSsqvxNeq1iDDW5twmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A2/uba6Nw5saTgzpdDLlMWlyBfpw91Z8K2sX6+yLSkhxaaZ2z9l4V+KGMjAgNM1JK4DxmRtMY3E3rB8Q3+NGTg+ix1H6B486NxFYwhc/9X3efenRT+RYK8PHjTQ6jcbUTRho1OQr7S59B9mRfJUEggbkbCk8T+iJRocBK0GMZ58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BOymW9Fj; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so20501691fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 02:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732270134; x=1732874934; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ozG0xW+TN6Pi4dywPncHsCDjL+EQbVR/bZYS04g6N7o=;
        b=BOymW9FjLbO8ie9ZU0Oxvypb5qmmJCThzNAEr9eFfidt8mBiOg5gFDkez8pMjF0uaC
         5Bus958WO35FZtlDrPpiXQvZIXbOocyk35z4xVc45vs4gWJZn9iimmfW14RBHUyQ+fHj
         BU3ShADWbQf0433492sA174BTujzHZ2A3sBkk0S+ulq4mj0qkA1qEcyvEUsni6XIfAo9
         3uUA/vp/OPfjsN7/fVVcD6fxH+RaUdxR5OiFdpsuIAieN6i8dHGj3N1L5SYOoC8YEJEj
         IdUOR3Se+hipzYSStQdzq7CB6IdPOT3ngchceccWKKSDGjBos+1bBRH7uUiGk1rs3vpl
         hFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732270134; x=1732874934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozG0xW+TN6Pi4dywPncHsCDjL+EQbVR/bZYS04g6N7o=;
        b=u8T0HTcbRTuy8UuISloOjI6nluTrSO2cBvtjSs5bC9qQCdVoVG7X5dw1PWQDG3ilyL
         I6g+GqjQOH9CKInGjBMaNl5aWWuKVyKeZKC8iy+xxdJuyZg2+IvUYpRqxhWZu9MmMzZm
         wavJqO39l+WFEvn5W/KFsCeWcW27o2s8oMtDO3qTX5EycWsMSa6+WsE3Xc0AhjV17TgD
         LVa4H4r/kzqREfPtDyBvwRjBW0Iu5vHOLEHJBkPSZWwUuevGApmWtD0AWm2MchfLKadN
         FgVSGhLXclGZdUwYuuF8CbKc99Q34mq532TtwawGQPzqjbYjp99Lz/P2suXtRcCkDwVl
         8vZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvnmOPJUW2/yp21RFHrymJ0FO3gePBNVsz9yXWC7nq6j/R9D1aZuuiRRbrnZx7XwnxtXcTs7ZK2grM0Ast@vger.kernel.org
X-Gm-Message-State: AOJu0YzZcmW98t5LBZFzkWvvihK/gEkk9vEMV4nRBg3ksVTwMr5/D9NT
	j8NjS8vGOv2XGUxbd69iBZ6RPa18ixOdrFRg5Dio+f0ZjgT9EKeeSno2575mpRo=
X-Gm-Gg: ASbGncvx2RlWAD7VZs/xPQMfB1Xgw7LillUECr9iTDQlOKu8uKZrFDm8UsS0b3egCo5
	N4G6HamUXC0OW76lv6Mc/MiRvtT0CPnYhYrrndFyQeZHKDFgdIdWxgvEjoVx2zaaJq4VJPzt/hL
	lSNlkdr15W/9pVkoJublikzcyMVLkv0Kd1FTeH8HzW5sxlSicK0y5aRhVYCTAkIOVKW0V6dOnAu
	WIJ6DnNXoF7ppiYuXQdD0+IieWfuWN7Pno4kaH0L4RyuNqYoIcjPVJAGH8op5clWifwUzgOWM1d
	NNq+cVm0bAU+aVwoY593NUOg0BdT+w==
X-Google-Smtp-Source: AGHT+IF1XEF/8Gyn2P+dzKuFrYGukbKDM9XOQg3PsZRAmJKFMQcRvEJoruUPypP/45RqggGEEbK2gw==
X-Received: by 2002:a2e:80ce:0:b0:2ff:a8e9:a64a with SMTP id 38308e7fff4ca-2ffa8e9a6e6mr6070311fa.6.1732270134081;
        Fri, 22 Nov 2024 02:08:54 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa4d58592sm2762491fa.68.2024.11.22.02.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 02:08:53 -0800 (PST)
Date: Fri, 22 Nov 2024 12:08:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 6/9] drm/msm/dsi: Add dsi phy support for SM6150
Message-ID: <nwgfas7oxaumusdeoaheph6rj535szahfkfnbmv55y3nhhmf5p@3gg3ddjgaysr>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-6-35252e3a51fe@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-6-35252e3a51fe@quicinc.com>

On Fri, Nov 22, 2024 at 05:56:49PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add phy configuration for SM6150
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 21 +++++++++++++++++++++
>  3 files changed, 24 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

