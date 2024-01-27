Return-Path: <linux-arm-msm+bounces-8579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFC883E9BA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jan 2024 03:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA7AF28723C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jan 2024 02:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 831F68F7D;
	Sat, 27 Jan 2024 02:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wl88rQWB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC182F46
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jan 2024 02:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706322587; cv=none; b=IaLtuhXmCXGq6sCPZCnMOJL43QpzRWSn0w8Ctqmtlwn3DGqQWaBVEASdpoX/PmYVtgR1pTglDa3HKyiotxflBDJs0VXHAjMf0xiuiR2mefyYezDlcw1YXOyJTcM2bRJr2wRh+BllybdYJarTvQZuiLs2GHxaiThnqBwpZ3DKHeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706322587; c=relaxed/simple;
	bh=ktd6V2qSTjmaWsFHHOis91wt++tg2EHm4w7n9kwZspg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IExrJpJTAfRlUtZ4tgtbrrGj7/AJyWt8fvBXmf/1Siw5d1osbvB3SXtlej9HVljkE6tKr0BLa1OP8fftWSSbQcuYcl6KT3Bbn9su7x3LiAy4DOrbtrGzlOGi4/ZT0yHd5N+tqvvTMZFSIsVIu5sv52ujQnSUp+tRsDZ6i2OGChU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wl88rQWB; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-602d0126e80so9656737b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 18:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706322585; x=1706927385; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wpsqw69PdTzTbpXVvFlS4sbbBUhS9ggqJuFkfLVYFbI=;
        b=wl88rQWBmBA5armA3Di2cE3eCkkwdPi30GVJfrugF9IGniZlh3KuEOM2kpv7ntWgQy
         zhY1oCUkSh4C8xPc2i2TEA4BRQMT6sV7CyWbOtU2C+FmV/pujfgMsN2694q/G1/DU3rT
         HHDVE7HJD8HleR4BP4gvM6hDxGYvhjxkpuqpd3ITvfTanfh9Cf771FSpywFSMqvxaiqv
         UZz0rYeOVrr//el3PdaTTflzHt9zwA4aaxWwZlHHioV9W+adjxh2DBJ/IKn3wqFvtH8w
         pPcsGwWkefsVVh7tKoCyG/GGol4VfU9412g5lXVaUx4paFWCqz7kQprTVuelUkmlavV7
         rhfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706322585; x=1706927385;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wpsqw69PdTzTbpXVvFlS4sbbBUhS9ggqJuFkfLVYFbI=;
        b=AZhdh36klfGqT+0oqZ+FTsoDMIjpkmypPzzU4n/uRt4VNDUnCEfvGlfLoe7cFP+oqK
         bktRNT7Ubfh2mmPVhhojqZSBwKhJs49ZsdHbfX7dqcu+ZrBeM30LdQt9yUBYZykwbPCd
         0LdtvZovyINu3PxLPgln/hlfinZtImTK4bAA/o17vyBxg2xmYuP/ayxDnDFNTtXLno0f
         e/AcKgFm4pHJR2g9N55KYOkrIPEbeJYtkLSN3sawUqHBXn4j+LSwWg9mY2EJh3try+8a
         ktdF7ArQGuxwZBW71oNWkISa6jDCeNqO9wtc5v9gpKJWpbAfk6XOxFGCoFlD93LYxIm/
         d8Zw==
X-Gm-Message-State: AOJu0YzyRbGUIOJHKuiwKluYcNEOYAhH+T6ztWKO2yqelCjnbO/MQybC
	FkoNksToeoH68H6qmbBdVtiTOB3LrmbzFiQUsHpI7iOJmCiFGnHfHKJ3dmRLLrM2JYWZznx2ylf
	YxGJMcj/Zto8u5+qJzaaxvawMfi3vZAOSJduP7g==
X-Google-Smtp-Source: AGHT+IG2vGntEr90KPuH0Vnt8yyCvpdzPWEYqwk3E89bQCaR3ArjcaVx1rD0lHo909RHwhmoS2SrQlZi0lSmEfF0+40=
X-Received: by 2002:a05:690c:338f:b0:5ff:b07c:3b72 with SMTP id
 fl15-20020a05690c338f00b005ffb07c3b72mr844425ywb.62.1706322584299; Fri, 26
 Jan 2024 18:29:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-5-quic_parellan@quicinc.com> <0c6e94ef-4e9f-420b-92d9-785ee9f6ae30@linaro.org>
 <332892f0-41a4-1110-a39a-2571a5f5704e@quicinc.com>
In-Reply-To: <332892f0-41a4-1110-a39a-2571a5f5704e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 27 Jan 2024 04:29:33 +0200
Message-ID: <CAA8EJposAA0PdD8a4hc9Hr+Btb-eSMXX5+usnyPiVzg8Bmpa_g@mail.gmail.com>
Subject: Re: [PATCH 04/17] drm/msm/dp: store mode YUV420 information to be
 used by rest of DP
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
	neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 27 Jan 2024 at 02:48, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
>
> On 1/25/2024 1:20 PM, Dmitry Baryshkov wrote:
> > On 25/01/2024 21:38, Paloma Arellano wrote:
> >> Wide bus is not supported when the mode is YUV420 in DP. In preparation
> >> for changing the DPU programming to reflect this, the value and
> >> assignment location of wide_bus_en for the DP submodules must be
> >> changed. Move it from boot time in dp_init_sub_modules() to run time in
> >> dp_display_mode_set.
> >>
> >> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++++++++++----
> >>   drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
> >>   2 files changed, 14 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> >> b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index 9df2a8b21021e..ddac55f45a722 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -784,10 +784,6 @@ static int dp_init_sub_modules(struct
> >> dp_display_private *dp)
> >>           goto error_ctrl;
> >>       }
> >>   -    /* populate wide_bus_supported to different layers */
> >> -    dp->ctrl->wide_bus_en = dp->wide_bus_supported;
> >> -    dp->catalog->wide_bus_en = dp->wide_bus_supported;
> >> -
> >>       return rc;
> >>     error_ctrl:
> >> @@ -808,6 +804,7 @@ static int dp_display_set_mode(struct msm_dp
> >> *dp_display,
> >>       drm_mode_copy(&dp->panel->dp_mode.drm_mode, &mode->drm_mode);
> >>       dp->panel->dp_mode.bpp = mode->bpp;
> >>       dp->panel->dp_mode.capabilities = mode->capabilities;
> >> +    dp->panel->dp_mode.out_fmt_is_yuv_420 = mode->out_fmt_is_yuv_420;
> >
> > Why do we need it in dp_panel too?
> Not sure if you saw in the other later patches, but I use the
> out_fmt_is_yuv_420 derived from dp_panel throughout dp_ctrl.c and dp_panel.c

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> >
> >> dp_panel_init_panel_info(dp->panel);
> >>       return 0;
> >>   }


-- 
With best wishes
Dmitry

