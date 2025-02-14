Return-Path: <linux-arm-msm+bounces-48047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D16D7A36171
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 16:21:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57943189651A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 15:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D48526739B;
	Fri, 14 Feb 2025 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cLNOzJl2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920DD266EE4
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 15:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739546318; cv=none; b=bE2wKIQ9T8qm003SLiGaerv2Zf6cUrVcMNo44Xiq4Wq4fFjTpRBj5qZb/6lCXi7KMyCj2GtcTrN4oyCehuQLeMdfdTZILBvqCeldX8OzXK80p0AzVSK0tqw9ZmwHMoa59t0nY7KkZv4NrrQ3ZhWm/14XA2E0cF7BUENQHEv2kAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739546318; c=relaxed/simple;
	bh=khiM/ryaaEil6pLN+/17eJzNX76ge6PFhXLfoJXCGLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BpmM20ntOw+zNmDgxpj6+fbsUm5EZXAr2IZKGPLhJV5dYz2lnoLpPFlUE7wcxxyQC44taDshr+TM1wTEWq2z1vK/TeO564Zh/dKSyq+PhcrAQ4GDijDU/z1gJBgjuzQV5C9Y9RjlO8+VU3wODi4T7Vd/8MMWKlPd7LJYKPf8mM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cLNOzJl2; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30613802a59so22439881fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 07:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739546315; x=1740151115; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OcMZLvgo2+3kThO/hfiHuPvII26oDwywV7kGrf9ppp8=;
        b=cLNOzJl2A1/vuizglh4nHJ6+tGN7YWDR+B9XPK9Zzr9AEnkTK5rHMFPcWm9oLniytX
         fTIhJY2ZWnLasJApXyNfLx9DolTHxRSwxS2pZ42/wI39SgbJEq8p49WCnoUkHxaVySLQ
         2jBzk/2CVOaZOXqbYaZJUzhz/drGb44iOjvcY9+sxPWZm5+Zwns8M84+0cnxCJyqjmhj
         zxpZZ3mbDSaYck/zgbdaVbGtwADZK8Cg3Tl54MM3vAtYuVHV6YsWlQUt414t8m0n8wjt
         DmZPwuufiwQAI8OobOD2bm+V4fvqcGNVVrlSC7xWEhOlrsOqTpHMMZorceqKLjHlFfeN
         sk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739546315; x=1740151115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OcMZLvgo2+3kThO/hfiHuPvII26oDwywV7kGrf9ppp8=;
        b=i4WuiLMnPUAtZuaJyEeuRgF3oEj/rJUVBI/D1i4sI1YoQ/FtsMNRw0oTE5GhRTOJpI
         P4D+E7Em974AoHH2URIJ3pAoYIwoZBRNmzkIqs1JoqaZ+T7x4dgjlvicByKZHIzo7ByT
         z5nKiKQSdTgd/KrwP8bAdIyUj0vtb3lNs/RxWUk/YiCuU4VHbFBJUqxoIZU6m3DEhqMh
         SECrllzxuGJqWsPJNknfo07sNSMlu2Uiwd3dhTQ8FMVbXSW8auiK4dHTcOKMJbz9G7pX
         F7ZF8GGDOAx8ULjVUYs6r/IE8VBHxSOlVj4Ri0NDE8UlgtHUdvq1qM9r4EFfVOMZoMLM
         CepA==
X-Forwarded-Encrypted: i=1; AJvYcCWJgccff88VhpcjoIOjEtwVceLSaX5utT/Pa6CaXt5NXmKMQK9uXopVhbzQCLMGHaWVGEVP7iWG+NjEMC6M@vger.kernel.org
X-Gm-Message-State: AOJu0YzsomGBuf26YOnAD0ksDLMh/FYUnTSPOJriXBxWCDZw6PcZdlNz
	ulGhcRHcXyKlUnrhPpQBBAOI7zQ3tQLjp5sdviebqT0hFN/reD99IlQm43yd2KQ=
X-Gm-Gg: ASbGncvwnzZqUilCceYNfF75vU7D95qinJvm7O2U7jr0sDjnhC/kmQ28mkPGWPHYp/E
	eG8r08QE5ECbIe+z/4erOI7NQK+wij3L3gTVFb13XYeSZSYkx41KgGru9bSTmsXpOPuXmF+mdmR
	84nboDDNUGgEGxNE98rAYW7emt/u5zSzonlTQLCw71NTeeNU2GcSXmQEK9RViWspsR58b+xefGD
	3+I94fuc55Ks/hV14/mECwAHwnpuoVP03J4Rj+XY8W/Aff+cNYCQ0IAeGaHraQ+DFDUkDQ2XuNI
	ksUzDT32A8cwbhS0PopHxsJwHldZpD5cuLHGrj+1JmWszm9/ZUG2/HpDH0t/hJe2pxVZXQ8=
X-Google-Smtp-Source: AGHT+IEezzYlzsneQzuZxQe4Yo+jf7QLilk9BuU0obW1zoL2W/XDA76D0mSIeKsRAt8vyBqyYw8shw==
X-Received: by 2002:a05:651c:b29:b0:306:10d6:28b0 with SMTP id 38308e7fff4ca-30903630202mr37322251fa.1.1739546314624;
        Fri, 14 Feb 2025 07:18:34 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-309100c528asm5887331fa.22.2025.02.14.07.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 07:18:34 -0800 (PST)
Date: Fri, 14 Feb 2025 17:18:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v3 2/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
Message-ID: <g6ddzfh6vsd7zgyopzassfp5ehife2t5mlq5jbjdcas3ewed2t@th37tsj7mmsw>
References: <20250214-drm-msm-phy-pll-cfg-reg-v3-0-0943b850722c@linaro.org>
 <20250214-drm-msm-phy-pll-cfg-reg-v3-2-0943b850722c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214-drm-msm-phy-pll-cfg-reg-v3-2-0943b850722c@linaro.org>

On Fri, Feb 14, 2025 at 04:08:42PM +0100, Krzysztof Kozlowski wrote:
> PHY_CMN_CLK_CFG1 register is updated by the PHY driver and by a mux
> clock from Common Clock Framework:
> devm_clk_hw_register_mux_parent_hws().  There could be a path leading to
> concurrent and conflicting updates between PHY driver and clock
> framework, e.g. changing the mux and enabling PLL clocks.
> 
> Add dedicated spinlock to be sure all PHY_CMN_CLK_CFG1 updates are
> synchronized.
> 
> While shuffling the code, define and use PHY_CMN_CLK_CFG1 bitfields to
> make the code more readable and obvious.
> 
> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

