Return-Path: <linux-arm-msm+bounces-61886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF16AE1C57
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 15:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB84C4A03F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 13:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B1A28B40A;
	Fri, 20 Jun 2025 13:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T3E6a2dK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A053728A41B
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 13:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750426865; cv=none; b=dzpCnO/bxuu1RfA1HQNUBYucr2HZGs8dyxKkS1LMf2u14b3OapySP4rlDPZ7ltwKsBt9GoKfffYt5JDuAQoLMHOiYFdd766iBCCnUsb4qAaFRyy3y+MSENbciEU9mxX3eYMs6cMsD5rBlXZLJ+sfe/pBTn1lKXX579kvcn/2wx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750426865; c=relaxed/simple;
	bh=n9lamK2M4jeoV3u+ch8DUguzgx5u0p3/AcTzsc6YeHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GpeU3Y+JDkwhfUYFDVnyDpx/vQPwcwoPN+Z5nFGXMpo1jESDsq2iw452sphZem/kZV9LmPb/g7kHKi0PHhxsr/VMmethLryrzsHOKOPoG2AiRIt50tH/25eWh/e1XxoLfhnlHRcw6sJgyYDmCtTdB74/p2hRyLAnHdC0zz+zMLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T3E6a2dK; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad8826c05f2so350130166b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 06:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750426862; x=1751031662; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hpVfOGJFxIZYsmMRUwFwqfFQVYB9k3K3K32rB5+Q7vw=;
        b=T3E6a2dKO6EJt/ZGMyVidGSHj1EUtxwE22SI3/jIQ/uAT5pMzEaEzPVUfNxNcF01xa
         CLdo9gPcMO5OXPPEv6n/m4jRblrnfxJbHd+RcP3PLJC2u2dz+D67T1znsh07sPeBABLp
         K9a1c2r7Mk3pVhkpxegl/R/Ro4avbfSQEAkuDYvTSMYY7jGswN/xmcmE7699J+rAtx5t
         yDhUBvvxMxdzYpL3N9bT+4Wmaw0HsYXfPTj/dhqfUFRcrYX/fSUM4P2AtA5QuBXu2SwB
         pPTwGbdOZYqtllHLej3UTc+UfAjYgEGbUX4gFfVsrvHny3CzNobJkFAgE/YUiUWAKLoE
         E7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750426862; x=1751031662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpVfOGJFxIZYsmMRUwFwqfFQVYB9k3K3K32rB5+Q7vw=;
        b=f7YvUsw2qG2sez0t7upapN+Qprm6pahbEEEj8J6EJZw+/6HCrB5eHmWwJxkIv29Fvn
         3j+0T2Bw2EGiUH5MPefbjlPScWhjJE/JVTIa2jIGN8JFWqDIarB7WubVi59RbUTVQVF+
         ioIhXMGp3vdmjytg/TPClVulFzKefTqW6vcRPrO1QcPZ/LRVglQu8+3/3aav5nDlflEb
         NJI8GSrhpipIII0Djzx9dGQj8/O4rwpfQVd2R0jYrpDZO5+CEVIz7jggC8oy2KSbT9J7
         knJEaGYAlVF2C0Ot6+A4XVi2n+X5mbnTmSqPWzS72bZJdsseVKhjJp3v9RA7Dc8N2Zw9
         dIwA==
X-Forwarded-Encrypted: i=1; AJvYcCXq+btyS/XtbYlIz7mwSg7VDwJPv19uaLnNVj0lci2zYHmM/haA3Lt/2q+MVHWFvEA6SBUyMfFH8mphNNeJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwdUFH+vwbzCbj/vJBxewTJzGav3SslhlIqD1Fi0WXdn5Wcid5P
	bKaLnmjAwAz/EQDrKuUTGM4jSoTUjYm5o1Lkm8MVcoSb8+wfENR3lOFI5LjoLRl7PPA=
X-Gm-Gg: ASbGncv/IkbP4kk+sX5RKHpQIOyt5273YeITRUlq3YUnGIlUrJY0FI0Dw/cO3UnDkmW
	mzDmtRlwR/EHPfFyxo7OZ7vqgJ3ejfI3ASym2JY2vM0fl6N1N8aR4CFVM+l/66I8p8M64+qAvYK
	LmZnU+8GqYJz7Mw9NExTpfN7zVh/7x143hGeFsDhjwQgkS6wytobT//QjDTKOfGPvC27vd9p0lm
	C0HoeaHznRkyXcZhYuuiZ5d7OuWH8TTayXUh2vuta89kIoUtVY3CqyUtNm+2WbQXFDlUKOnhNzz
	hsNWfkqPjjWGnISMcEpWDdQIqrQ1FzDfdSMpj/LfLcFf9lefh2k1enKXbyI=
X-Google-Smtp-Source: AGHT+IGYKKslvR/1stzFoNBWMle6YgYw/c/0QW8ncwoZLD0lcIICIhoOzA/vRygSUJ7ruQCVGYAWdg==
X-Received: by 2002:a17:906:6a19:b0:ad8:9466:3344 with SMTP id a640c23a62f3a-ae057b98feamr276291966b.43.1750426861719;
        Fri, 20 Jun 2025 06:41:01 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054080a98sm168650466b.90.2025.06.20.06.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 06:41:00 -0700 (PDT)
Date: Fri, 20 Jun 2025 16:40:59 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Stephen Boyd <swboyd@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: include linux/io.h
Message-ID: <aFVk6+4pIMQs2imz@linaro.org>
References: <20250620124747.1928114-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620124747.1928114-1-arnd@kernel.org>

On 25-06-20 14:47:43, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The driver started using readl/writel, which are defined in linux/io.h,
> so this needs to be included here:
> 
> drivers/gpu/drm/msm/dp/dp_panel.c:33:9: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>    33 |         return readl_relaxed(panel->link_base + offset);
> 
> Fixes: 9d47325ee063 ("drm/msm/dp: drop the msm_dp_catalog module")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

