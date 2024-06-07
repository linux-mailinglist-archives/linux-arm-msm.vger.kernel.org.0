Return-Path: <linux-arm-msm+bounces-22095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7816B900CED
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 22:30:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 131F51F23742
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 20:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4065518C3B;
	Fri,  7 Jun 2024 20:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jPgcznK4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D8C14036D
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jun 2024 20:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717792221; cv=none; b=CPkxW4zn/9OZfNljX60TZtzGRiDwZUIBzl3SsAHIWyVPohgI+LgABTDey0qHzdJ6x5Llr+Za4ZfUeuJsn98C7jl6VSOMDsmDSCQQG0r/jg2kHMd1/B4lceBBD93RWM0YAefmbdJmNUd8TA3aAda2X9Zy/gWOSH4PCpcjEUvsR5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717792221; c=relaxed/simple;
	bh=ROYTdcM3h5PdNH7jMsNq6wgFbtlVF4K63MVqa1RfUTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EtxxlUB+30KGcp2ooTAvrwCjrBGjQ6ZZU941I83zKPXxji0COlBZSJTw8nmnWk0ATegP1d75RJH3zQVdpWRE/EAiLVjnKQ0BD/+ZlS9etq5yPAYJiJd3jZ2tpF1Hym6efQ1XiSUcpb9S62ONGbZXlVY4dDewDy7Yqz0+wkm87CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jPgcznK4; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52961b77655so2862923e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2024 13:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717792217; x=1718397017; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SJTzxe5ddw3ZN3ejg2VHMhuR5Wz3A7+WGmdxaZHLCtc=;
        b=jPgcznK4RAkh5ubL6/776sukf9fOifb8Q3nuqaIvGnB8rXMWK2r0LVjzK1Ar73g+fu
         k1ZO6/dZrJtO+9fuDmDRuaU9r3WfxCn83Fvpw8sEg2Mtfg9XlllH+km0bd37ogiZocEX
         ZWOir99w1mUS9LnKGy54FmCzHE4WHF+iRhRDWGqXs4ARZt2dtjIcwbYmbnRDMuOnK03F
         71tB172xx9hiZzvXTCsYh/bA++AN1kV2QhAkaZhI7LyIRZx5BJ1F1PDu334/sHvALEmA
         Mq4OqkumimzGq/vxxqSqHudjZBWQwPU0VBd2EeYys7T9Um5oWN6FAJQQTvZIde62wt0N
         F+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717792217; x=1718397017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJTzxe5ddw3ZN3ejg2VHMhuR5Wz3A7+WGmdxaZHLCtc=;
        b=tGI+h/Xmud14DUERjSug1pOfg/m4axS4LiFveHzjyxK/g5XDOHB7vLEMrHgy3B0vwN
         CcTpFbbbgGv9G1ylS9RvNdVjMIPcS/yjeCpKTIvmPlZhgtpJvyd8vx7LAodaFxqXd1YN
         us9A1biZzfw1W/nhP1YDjZbhvMezfITy2Ayf823ynuYVYmJqXlNfSpR9GypDgt3RnvH7
         XWFrlpf7JFdTyKQsI73GhP5nI/SBkYXmGwVRt3KtknpaigewM5itjNdGLyW3MbzjeVoK
         7qpJubbiOaQPlxpxIAmfi7u8ZNt/RpIF2R1Zk+kOclWsUy26cghPTVjfHNMgIArrBMAD
         4AvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtgKdEvjqLQJZONNPtajp70MBBdzitG+jMnr+jyGOFI8OS+zUwCt21hx4qS4w2Ao0gcYKhNRLT+TTQ5Wz+MzRKPFDjNEHkQKbXVd6KgQ==
X-Gm-Message-State: AOJu0YwbQK7DqGeft8wJ4ui8KsPtsDnJfEj9H8SHzrWmpbcxswVrmPXY
	r4e2PtcSVahDqR7QoiVTQfjxxQNL7bWHIUFsZT/ZjVj5Ns58NkTkEUbo1uptmMY=
X-Google-Smtp-Source: AGHT+IGXgq8j9ZQSdjhR2WRP238Fqx1W2VoFAvOkFfDn+JlkqIE2s+YVCpbU2MO5IYDF067L6l+FEQ==
X-Received: by 2002:a19:ad45:0:b0:52b:f2ab:1303 with SMTP id 2adb3069b0e04-52bf2ab143dmr524832e87.28.1717792217335;
        Fri, 07 Jun 2024 13:30:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb4347001sm646147e87.288.2024.06.07.13.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 13:30:16 -0700 (PDT)
Date: Fri, 7 Jun 2024 23:30:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kiarash Hajian <kiarash8112hajian@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/a6xx: request memory region
Message-ID: <ugh3ohzktjxyus4t43jywmrwatz6t4zqz66nm2wdfjou7zu3yd@g64z7gp27wl2>
References: <20240607-memory-v1-1-8664f52fc2a1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607-memory-v1-1-8664f52fc2a1@gmail.com>

On Fri, Jun 07, 2024 at 10:00:04AM -0400, Kiarash Hajian wrote:
> The driver's memory regions are currently just ioremap()ed, but not
> reserved through a request. That's not a bug, but having the request is
> a little more robust.
> 
> Implement the region-request through the corresponding managed
> devres-function.

Please at least compile-test the patch before sending.

> 
> Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
> ---
> To: Rob Clark <robdclark@gmail.com>
> To: Abhinav Kumar <quic_abhinavk@quicinc.com>
> To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> To: Sean Paul <sean@poorly.run>
> To: Marijn Suijten <marijn.suijten@somainline.org>
> To: David Airlie <airlied@gmail.com>
> To: Daniel Vetter <daniel@ffwll.ch>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
> 
> Changes in v5:
>     - Fix errorhanlding problems.
>     - Link to v4: https://lore.kernel.org/r/20240512-msm-adreno-memory-region-v4-1-3881a64088e6@gmail.com
>     
>     Changes in v4:
>     - Combine v3 commits into a singel commit
>     - Link to v3: https://lore.kernel.org/r/20240512-msm-adreno-memory-region-v3-0-0a728ad45010@gmail.com
>     
>     Changes in v3:
>     - Remove redundant devm_iounmap calls, relying on devres for automatic resource cleanup.
>     
>     Changes in v2:
>     - update the subject prefix to "drm/msm/a6xx:", to match the majority of other changes to this file.
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 33 +++++++++++++++------------------
>  1 file changed, 15 insertions(+), 18 deletions(-)
> 

-- 
With best wishes
Dmitry

