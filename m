Return-Path: <linux-arm-msm+bounces-24833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E441D91E8E0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 21:49:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0991283D77
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 19:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F53E16F8F5;
	Mon,  1 Jul 2024 19:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x+FR/i5n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D18416F8E3
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jul 2024 19:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719863383; cv=none; b=EtUjYLNhd0WHdaZHWCddBk/Tu1rJ0yodX/NjN+XD3a8QGoU/r9WCFtv3GrSy6B8qgGQYpYIm1yApFHkpgIb9vOAs+58e+aEiiR/FmAVR+gUvV8lqG8nGgDjM6pEMmr/avstkXz1z2abbbcjaC34kHYodPcopJDeR6BDhKKAAWOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719863383; c=relaxed/simple;
	bh=pqI7V8vQsOtiU7I9Y39/jsazWXej4pS00F6++ibavZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QAjsVIxuu8uJa/k2G7V3m/nmopILivCdn3xnjKGxA/CLgq2M4j/oD1yaFX7p9Envb4PEuG+ouWsnen4bbk0WXyeossPdbSYSKqzokm+cBHfIs4+L4o51CCyDo9WvK/sNeK8XJlytp+geO1ikxZCzZDUiauWAkvEHmm1J9C+edqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x+FR/i5n; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5295e488248so4367441e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jul 2024 12:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719863380; x=1720468180; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/klhqOqQpfIffOoQHl0HUCf3/QjQJt9wAB8xWlns1fY=;
        b=x+FR/i5nOfFduDxnDDca3tYWn2A04Dzn1gaJl3b3nquNY8Cu+HgPm0PwiFlaHj4JKV
         qXDtFHLrvB2IObAOD2ZOw49u2XXKueSO/Cf7+HLAzZvVLmtdnNjPVFQ3tWBk4Gf21uFy
         sSP4rPBk4kUfBS4dwWXIL20kFcgSskasMYS9/VMZitBW1i5DxUwWzttCcJIVHybrvK7O
         did2w1UlhWHQoK8OBG9FXy0IucGWG1Ws0QrE57TfKTv9EJEZNFwEUsQYEaghb1LGRuBk
         0X2SplAhkv+ju/dULwcNUwd/3wjfOHGy0Aq7KXAi6AJhkV9G7GJwiLw26wh+D3DWpET6
         Qh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719863380; x=1720468180;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/klhqOqQpfIffOoQHl0HUCf3/QjQJt9wAB8xWlns1fY=;
        b=kEvoYs1nmD26CsxOadbXMrjfy+wNG4ZfDEe23X3856Bc/fKAoENb6hOUB3f4LTbd5R
         lzZtQzTkmnonAK7T/SOBLqhOTtV2C/6Y4aFxNTXTohpa82mB17MCK95Ueh4m9S8LgPkU
         jMKzmCeelVeOSNZJQcUcgi5sP5SKM7lVKqvnSudi42sOpwUBrvZ6CPRNgbuB9uv8cpo3
         w4VlEIC4/BIHifU5TpqUMveyj0XCgAe/nQVpBfPvxeajt1zPblvw50ZCoT+NuPnjSBhd
         QSjbKN5/1COWXsDVZPPuZO0QDYEkt87MvC1Lmlu/YhP7C3lPUuUhWTTi3/Z7ddiCepva
         jsYg==
X-Forwarded-Encrypted: i=1; AJvYcCWxMUKbUh1ZEOVzqNRNbb2T0VOo3cYYZhd+DSwD8QGiJbTN59K6GF8UHANGmyTpmIz0SdRhiRtw44ng/VkZ7TiJX4UUBHxdgFK2Jv1dNA==
X-Gm-Message-State: AOJu0Ywj4C382yV7WZF9oeyaOosowNFnyvE8qVQcrvvk/rHf1sOG71iv
	xF2HT35s96nO3oPYMgRRQkgse/K0KrpH5RGiP1QnbtDbWbjInuLCTomf9q946qk=
X-Google-Smtp-Source: AGHT+IHJBGPp9DoIDMpnlZhDen1TE3XHx0LDJutjYa34E6KdbzqTWgJM1qLlNf0PNE3DaT98F8B0kA==
X-Received: by 2002:a05:6512:3d91:b0:52c:c1aa:dd52 with SMTP id 2adb3069b0e04-52e8268aa24mr4398960e87.30.1719863379680;
        Mon, 01 Jul 2024 12:49:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab3b3c8sm1536851e87.292.2024.07.01.12.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 12:49:39 -0700 (PDT)
Date: Mon, 1 Jul 2024 22:49:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: check ubwc support before adding compressed
 formats
Message-ID: <yyoh3jpsc5cy3h4nu3nhnqdv52ajljjn63dzewyujam7d2scgt@j2mmtajldazc>
References: <20240628233927.4170966-1-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628233927.4170966-1-quic_abhinavk@quicinc.com>

On Fri, Jun 28, 2024 at 04:39:27PM GMT, Abhinav Kumar wrote:
> On QCM2290 chipset DPU does not support UBWC.
> 
> Add a dpu cap to indicate this and do not expose compressed formats
> in this case.
> 
> changes since RFC:
> 	- use ubwc enc and dec version of mdss_data instead of catalog
> 	  to decide if ubwc is supported
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

