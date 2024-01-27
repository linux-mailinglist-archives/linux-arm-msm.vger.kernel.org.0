Return-Path: <linux-arm-msm+bounces-8583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 272D383EB54
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jan 2024 06:42:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5506C1C22051
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jan 2024 05:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BAE42F32;
	Sat, 27 Jan 2024 05:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xE340seO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16747F
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jan 2024 05:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706334158; cv=none; b=tsdVtxMhAWeJLv1/xZc0/KoZeQKsrP5v9V/3vkNwe7AMEeFmtr7SFNiWsEZCF7gKLX4K752TGNJc8aofD9iIfbuPCHP709N6UQuNi8toqNC/QlRdNApjepeM+XP2M7cwoPN1LvI3gG6DwgzNPox0y+3s4FpfNWrRegRt/8x7OGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706334158; c=relaxed/simple;
	bh=DsyVGo9hjoRSm4gV0FPcIovbr63iQxzgfptuFbPFKNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KgfTS1BXneOsRRMQMQCCJiOpz+ZdGvzLajP/mz0tkJaoFovW3nrv9cfAgYW5AIVIzUgZuXYG9/C/upUa/5PLKGH2LrgZ2Mr7X9gVMSEtGqp6J5WXfUZ2waw1nO41R8snWEb6AXGDgF6wOkO/VDJeEguwtIBUo2kfHSoWpGJ3T+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xE340seO; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc372245aefso937285276.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 21:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706334155; x=1706938955; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gLO6g7N21Idqil6jwJTMgSDzHCEwfR00dveBCYg6xrc=;
        b=xE340seOsqsJ5s5p/fpP9zCLWsgl6ZT1b4M9Ru3N8PN243Dzg5zOR3iWHKLunkCagF
         XlXB/OkhKHsBOUfheLSspzhPEQHjTd4Ui35hWgicUI13fxJ7aazOZRMt78N7TOCz7Wor
         1+mBpkNYLqSU7cYSMKI3gATEudF6uq3TraDTzyDXScDyFul8o9z/n9/hdkywVEzf0a4d
         AeJ5D/X72+KAmJe33DTUQudLIy3L31zO8L5ofXioQFQCFeQV/y90wlVdk1SeZuCvKCsW
         72ycHS0658QbBBaTBQkb5QoR7sgwrJPBN73PpogJCwvahff+qkKwMtMS9tYGktvSkftz
         e0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706334155; x=1706938955;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gLO6g7N21Idqil6jwJTMgSDzHCEwfR00dveBCYg6xrc=;
        b=YsgYU14R9JcW7+wtxLaI6o+qs5dPgCj0tLtagkkaNNrkf7hzCYUGhPQC8e9DrBs4zk
         LtcE3Nl017FWaPavYJ1YqmDlTjW5vgpsBe1LtHDSFzevKQ3ZDUA/nDK/8epcBMk2xdjI
         cPQhZc1WYk7xxU+iUf+Annrc3iOQoUTvnA7yp7zzwsj9kpF3OXxj2ZZaQmpYRu/ZDPnM
         ph8mAcr8rUw3pKLydhLrCT6jFtozwdLi6YR/lgqooBq7P8Pq52Q3VrkKfFg/ekIHq9Oo
         lbVpgp1E5uglrHj3eYDmUYsSFFFlM5lihSs6t7h4zGdyM63150yFLrqwIXb+vs8dOpKO
         nfIA==
X-Gm-Message-State: AOJu0Yy1DgDo6JZSnE0TnE+oRRxUfoXQlZb/uDNGMNsxL4lNIeP+D99F
	vRMgEzP8LvjVEGH5Lm4XEKTEf/CpE7q7IRYf0Lws3cRhpjwAXRW4XYbzLVIXnZOugmMGW2qCuVU
	3rO35iFgHlUlzrLvtNi7TZkBNz+qjKeEs7cMiXQ==
X-Google-Smtp-Source: AGHT+IGfG9ECWJtlGCx/XgHVaYHNizDSKPDhJ1K4b2ASfHNN+HUB98imY4w0O2vIuwpSbFfsezaSH4jff5xrFAtDuuI=
X-Received: by 2002:a05:690c:3388:b0:5ff:6e27:cb4d with SMTP id
 fl8-20020a05690c338800b005ff6e27cb4dmr1007714ywb.72.1706334155548; Fri, 26
 Jan 2024 21:42:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-8-quic_parellan@quicinc.com> <301cdbe2-7377-4b0f-bd24-5131f8928c29@linaro.org>
In-Reply-To: <301cdbe2-7377-4b0f-bd24-5131f8928c29@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 27 Jan 2024 07:42:24 +0200
Message-ID: <CAA8EJppLsGhU=1O4XcbW6ydQ87=7rk4CBv-GN=-Gp76AUiTDCA@mail.gmail.com>
Subject: Re: [PATCH 07/17] drm/msm/dpu: disallow widebus en in INTF_CONFIG2
 when DP is YUV420
To: Paloma Arellano <quic_parellan@quicinc.com>, freedreno@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
	quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com, 
	marijn.suijten@somainline.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jan 2024 at 23:26, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 25/01/2024 21:38, Paloma Arellano wrote:
> > INTF_CONFIG2 register cannot have widebus enabled when DP format is
> > YUV420. Therefore, program the INTF to send 1 ppc.
>
> I think this is handled in the DP driver, where we disallow wide bus for
> YUV 4:2:0 modes.

Maybe this needs some explanation from my side:
I think it will be better to have separate conditionals for setting
HCTL_EN and for DATABUS_WIDEN.


>
> >
> > Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > index 6bba531d6dc41..bfb93f02fe7c1 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > @@ -168,7 +168,9 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
> >        * video timing. It is recommended to enable it for all cases, except
> >        * if compression is enabled in 1 pixel per clock mode
> >        */
> > -     if (p->wide_bus_en)
> > +     if (dp_intf && fmt->base.pixel_format == DRM_FORMAT_YUV420)
> > +             intf_cfg2 |= INTF_CFG2_DATA_HCTL_EN;
> > +     else if (p->wide_bus_en)
> >               intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN;
> >
> >       data_width = p->width;
>
> --
> With best wishes
> Dmitry
>


--
With best wishes
Dmitry

