Return-Path: <linux-arm-msm+bounces-40097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 820BF9E2257
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 16:23:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7ADD6B241C2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 13:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB945189F3F;
	Tue,  3 Dec 2024 13:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PgkRrQt9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0781B1E47B1
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 13:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733234074; cv=none; b=Rxz96F/sRKsvS05k+w0AkEWb6yRl/KgPPfy/h93pPgxkJJ59gKLuTHwW41B2SqbmW50SPOvKcEiJy/vmA7jI5LM81WR33DJhPcrluqAFMyfU25Ywn82AhU4jaQZIW4LsZUmn3iWn9f6/U3XtycxzMIq3PTP1GWL9x2mR/FuWp7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733234074; c=relaxed/simple;
	bh=kLSOCNNYReXz1jS553P2CRUzqZ2tMoQtC5p9F+56GAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRjWkWyf+Xwtp0ptmsc/R5ZwjpOfm5RwpRWMCSaeAMscccA20qrJXwPwXXEg87VSK3MVTQe+1s0rlM9XNqFjxifpF1o9Avw/O2e9Wnp4UvnKEe+KDsakcOXi+aBOjMJNtFMYCtMasnDUNKYmjqlfaOH23rTu5v0guCR+T0PA0+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PgkRrQt9; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53de84e4005so6448082e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 05:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733234071; x=1733838871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7uNJWGh5QWIcANOkbpAmV+WuUq2lB7oYxMgbIDfhiSY=;
        b=PgkRrQt9QPVVC4KE/+vS/XdAxlZtMhoNoQI59TN3wKdhwQdhXoc/ZR+MHBID7QTt9W
         szoGmjr3C4lYTFeOFU/ZZ3cRcZX6kKD14GLPjF0x1TuEGONI59cOo+Hg26olUD8uhPZi
         jMVRCheK1SbzrT4TL4Y9MPzbTv/syfGoLVCQgqfmB3w+ztPZw5xTD3zY1M++u2CbClWc
         psbe8zNrxZ8H68M6LRvtmirkmBunro9mmwt14dgA9hR0IyCzpBMXnoyeXDRi2fmysLrp
         UXTNkdGfbnRX8Lfs0NdHxWCawjXufAapWf0uKK+uNEc+JHmab5PBU1uJesuDdQQkTPsN
         AvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733234071; x=1733838871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uNJWGh5QWIcANOkbpAmV+WuUq2lB7oYxMgbIDfhiSY=;
        b=wnofn8yfzooIRvzwqlVKKFpp6NVpdbJb8yEFg0jhRl6N3EkDgl1Nj85jPK16yWuDqy
         MLxGp+ZMI8nLoRjtOj/82GoUn06f/HopycotaGyPJdfRHdaPbbPvshNAOFEecFXGCvVS
         bUdNQL0v9Q6BBwjoaFKYmPG0gHKLyAy/o5MfsCJwEjcuKGNj31SSRyU9UZfh/WShtaKM
         Wxri/cc/t/RAsfUUV1K41y+B+1JJuHqbFsmYxftkHqiKTxs7SDQbTMMdufdY7VSRzvFf
         eZhMLWkDVSYNTuP/Fq9SOFq/0QyBX1IqEupcppk0bFxVPPLn20UJLtvVgG8LoVfsBln+
         baGg==
X-Forwarded-Encrypted: i=1; AJvYcCUHEGquP7MrFJPh150lzuOzvYfnkV89+vbuIEf+b+Fp3G1Q9TDOw+ZUAvi4cucmBK5OKivHOoFuy/VkghaN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz13cyfT/kizV8wLqqDB9ehsoPHEBojA2KGzui8BcgNTcqyU35P
	DITc7pdkhIUc7hFJpImV5b/OJnKeqPvIkBLAWbCxKS6uxG4ZLU5heZKgPhPnsfA=
X-Gm-Gg: ASbGnctDLpdWqnVJNsOPzRZKLBPBADKWR6lKiQ6nLHacNolEzT7Lulf3Mc4jNimZ3sc
	B3K8OZR6+U+Ry/A6rNSrOsfY3a5SZyGaU25xZoTUxQN8frRlrRLngycaSWr7J7JgRk0PCPlKfiC
	rBDX/2Me73a63a3DkGy6wjHoaeQKFXJWGe5XiMVp5hogtu7+F9GVlpU9osd/W2mJU/UFxWveBxI
	zJxUI0UJLlJQGZHxcKAY49SmfOpWt29EV8wmzMq/jyJjdwUP4ZL3T1JaD8S9qK+f0LegbmdrdLF
	EOxi2iJOfxsT3igWX/UWyLrqs5+iWQ==
X-Google-Smtp-Source: AGHT+IE7c1Kb8HtD45thYMsSVhmzZ9BdudadoQnajTE11NmQT7idsUke6l4BDT5LccQiDuRy+BsDXg==
X-Received: by 2002:a05:6512:3ba3:b0:53d:d443:1ab0 with SMTP id 2adb3069b0e04-53e12a22f2dmr1693409e87.43.1733234071182;
        Tue, 03 Dec 2024 05:54:31 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646f0e6sm1833037e87.154.2024.12.03.05.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:54:29 -0800 (PST)
Date: Tue, 3 Dec 2024 15:54:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>, 
	Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH 4/4] drm/msm/dp: remove ST_DISPLAY_OFF as a hpd_state
Message-ID: <3fy3klftm7tlr3oki26dros4xbfs62hw3edw3ebsbcuxpcd4w4@l7uesddnkjbs>
References: <20241202-hpd_display_off-v1-0-8d0551847753@quicinc.com>
 <20241202-hpd_display_off-v1-4-8d0551847753@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-hpd_display_off-v1-4-8d0551847753@quicinc.com>

On Mon, Dec 02, 2024 at 04:39:03PM -0800, Abhinav Kumar wrote:
> ST_DISPLAY_OFF check in msm_dp_bridge_atomic_enable() is used to check
> that if the display was disabled while still hotplugged, phy needs
> to be re-initialized. This can be replaced with a different check as
> it just means the hpd_state was still ST_CONNECTED but without display
> being powered on. Replace the ST_DISPLAY_OFF check with a combination
> of connected and power_on checks.
> 
> Since all consumers of ST_DISPLAY_OFF have now been removed,
> drop ST_DISPLAY_OFF from the list of hpd_states as technically
> this was never a 'hpd' state anyway.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

