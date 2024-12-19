Return-Path: <linux-arm-msm+bounces-42866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 753099F8785
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 23:08:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B60FA162871
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 22:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D004C1C07EC;
	Thu, 19 Dec 2024 22:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t5mZPAu/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3F91AA1FA
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 22:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734646133; cv=none; b=IFZ0481Xk+s3UaagjCcVlZCmdJ+ByuWltuj1+CT+D/R0YbIlCBHaDujfLVVIGYzwucgK2kXGfbnDWFVGTSSaYR6k72uh3pEmRKCIWP0GWpw+CmaZSxBrQnBcd+nGg7TyrSs+TacuDdszxpwI9yLcx56ZLVdT0hvAHknuZv/9x7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734646133; c=relaxed/simple;
	bh=UGtCEQ7OIfMkY9bu6MHPWoCog6or+uXLK37vB728UKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lv2B1K7pOijLizqwm3d7eaxNUFofcdNYYmLbYZcJ9oMDPXgHNDNXWPhZPaaG/ldOFzosU4VxdOsUfW/cjFpPD6imzuGlsCWZD1rD5zfg2iC/4h4CL6H2gVVOuU3R2q0Z8PHkzIgIy43eaUHlAyg7GN2AsvNOlKXWW49PCXnX5xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t5mZPAu/; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30227c56b11so13875521fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 14:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734646130; x=1735250930; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lyeuu4LJqYXKJsxeS5Q3cWA20lIzMdu0VE7mLfNw2CU=;
        b=t5mZPAu/w1ihN9euMu/0ZdNQt3cnOPBJ6vam83ysOOgut4M7IMCEJARq0X1gqOyVRG
         U5Q2kjCm1Dn2ujDFKJ+YP024i6xg/nHFSDuv3XDc12JKBndsfi/UwIDBO8J7zZahLiBj
         EoKEAktM7mDZiao1SnoRwUv4RkjKUzTokC3NXsvwxtOV4wrsbd5a8gO2K+hb45RMFOVD
         1laiWxmoU7/cbZOAVJxXRYOE5kGuuI/9OVW6h3oDWDtJupgtphf0QyaXhU2RegiZD17H
         qnav31qBMO5mNX8xsiZ5xKBEGXdyNOekvKA6PivlY57KqwFUz9Uvr8DUEtqq+OkdJbvv
         OPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734646130; x=1735250930;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lyeuu4LJqYXKJsxeS5Q3cWA20lIzMdu0VE7mLfNw2CU=;
        b=gehbJbuPq9vvjBnSRVrHbEgL5RFL/lOOa1VNerrQoRcLBocb+jHnRFtErZ8q4CFjLU
         TWmmDrpSedXflvRppHkWFveCl+nam88S13gGF6gO34iHcAaYxU0gNLkt4m4/P+LdqOrR
         ozG38utmg49lZmDY4NQ6uFjAYqxrn6+etR/mAFGbxOLju4zjLJ0ZVtK2gqsLVh38AYkP
         CL3wgXYUMQO3YtbGH+dWpZoqFdPgioyTtiBK4otauSYoVD6QCK7GJN2XerQSU+kwgyVq
         WzNJG9qaqJ+V9uvcgBdm4uJTOKc5QC4ztEFv7A9jEml0sd7bviWGPFZM/LXIKYK6YfS/
         1iVg==
X-Forwarded-Encrypted: i=1; AJvYcCXphTqi+yE6kvimf/FmoTBzIGyVZnkqN5bdNyst54Ao7CA2IXUV76MxunvU/++61dJ5gJUOSzLbqIVMuBCw@vger.kernel.org
X-Gm-Message-State: AOJu0YwgzX2BlZeS1IpYy6j7XT/LCFOigj1uMnXDok0E4PkVK8b1C+41
	BlN8w4vn59ObNSzfpkwW8dRcX1y/wxT2F3kck6av62TY9H5QQ2HKVY/6c1GXSc4=
X-Gm-Gg: ASbGncsMFQNqq9TBA+PFfUrC2O1sr25LzjwRUVyAtgcgMCuAC9GQ+wL65ym9Sly8EGW
	QksK39GvJpW/JORs8WGTwO9jbq+YLTx+/WkqFGo33kO0upz1qzLwUhCg/Pv7PsVxjNBJ5WQr4NH
	dekxi/D4AzgHvQSAPqZ9yO1lCv+T2bGpVYl4P5vx/JKSON1ETZtKHegN03x7zSZUzfhcnUdfQeY
	ZrDFemhcEhKf0KgmTmuPvG/Lpzg8TxV+thmiBWBvQrOzK+Q2caFe+QdQypnazDHzoHLe3AtAqMT
	4UgCuO9ymah2vfR7VsjkOraI73Ts3uXSf/YZ
X-Google-Smtp-Source: AGHT+IFcKO6Ujd7CnRHtc2hk0H7VRIDZhLYKvJDcgU5TwaYIn+ZggfF2HvZKmWqnYi29uXRcJLKjLw==
X-Received: by 2002:a05:651c:4ca:b0:302:4130:e19c with SMTP id 38308e7fff4ca-30468571039mr1513771fa.19.1734646130072;
        Thu, 19 Dec 2024 14:08:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b083b4asm3402501fa.112.2024.12.19.14.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 14:08:48 -0800 (PST)
Date: Fri, 20 Dec 2024 00:08:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/15] drm/msm/dpu: Do not fix number of DSC
Message-ID: <p74ehs7qyfcxh42h7245vebbkcdhy3vfkbeo3dno7judxv5xpd@l75g7pzpc3vt>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-1-92c7c0a228e3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-1-92c7c0a228e3@linaro.org>

On Thu, Dec 19, 2024 at 03:49:19PM +0800, Jun Nie wrote:
> If DSC is enabled, the only case is with 2 DSC engines so far. More
> usage case will be added,

Can't parse this, excuse me. The patch LGTM.

> such as 4 DSC in 4:4:2 topoplogy.
> So get real number of DSCs to decide whether DSC merge is needed.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry

