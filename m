Return-Path: <linux-arm-msm+bounces-8677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C98583F40F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jan 2024 06:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EDEF1C20E2E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jan 2024 05:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CAB26FB0;
	Sun, 28 Jan 2024 05:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HjmlM6Wv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0046FA9
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jan 2024 05:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706420027; cv=none; b=NS89BcTojuntHwwUkJG21StHiAbYrNbIM0dlWOgrLW0uh6Vyninjv0YxjjGabUndc0LXrp/nmVYcx4cv3oAsGrW3OZdTvicyYGcOT10wRS0e22qIyw3Bha7ttao6OJf+Sw7m9kuuC1YaGj7j0Jyv4Vn9/vNdlwnEze6vDQtp/JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706420027; c=relaxed/simple;
	bh=WC4nAqH2FPA4TDpfQUQ+C1j4VCd9Wn1QHKBDriGjTQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hd2WFdYN17U0u1x36Snarrb5xHOHG9y+hXt5M0sg0jswRcGTEv0O6nqAklxFtb+610Glj/Fb2cRBJVBzI4Ta1h9Ndl2MdEBRxoBrNlbj4jJrrZOm2fXXAsnJgt9z0dZkeXHK2z/alKsOwbHWuGwQYdg4DwLc6hGJDBlEIvBU69w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HjmlM6Wv; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6029b5946f5so20463717b3.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jan 2024 21:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706420024; x=1707024824; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=56XAf/FBuLB1j5RG9WDWEta1SAD1AD0IDjZoes74Lew=;
        b=HjmlM6WvAFuJNtavQuvH8pOHLB++bQJy6Y+y1D9/vG/9e8n52NFb8llt0CFh5fPYpd
         RQ0zFhoNo5XPRUojtHTv/0VqBUYJr3tKx410uWfJ+WKGcmwy3B4dsv02zDxXq87VlKy3
         5uzi+zw354ZjOfH2Q7eNrMl4sf7WjOd7PV+joKaS4DLGGNv97gXJggJQxNzS5EGacRuM
         gxLzAMNIPQLSaa92WWEMfEx0ZiEhNC7Cd9YEIk4KJwMiKMXrbpINKBnB4fKM0PfhurRv
         fhKoEjxw9yIccOSvXt82NNDo7KEL62E6N2ADnlQgbo5nN/k3JBdu3J5P83bu43R6sHTf
         ABww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706420024; x=1707024824;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=56XAf/FBuLB1j5RG9WDWEta1SAD1AD0IDjZoes74Lew=;
        b=k55zIITrzQWE5EKuxdVUcKskd9YSlyE/yQzkTIweH1n2xmVcSaXSPMFL82lMLSz1M2
         HM/FPEhnnzFF1e/gl5frUJ6UvoR0TNgDwmbYP8IAws5hbaifP/sqzTuSpYP+FSKveqM1
         HT6mXHsKPB88UEGSBh778Q9VC4b9BMMV+DLagnk/V5YfhMf/9oG4UkyeFVnjOXP3Cq3j
         d6gD7VVAltHYJNOJ3BOtRVlwzCqgODhX24rweiTFn6m+ykrnrmFva9sp2qlFqZIrDxbl
         mziJor5YmYq4zwkN+5A/ig/wyvfxo6BE2UWtcGjy+huAyvROOP6XqeBdpmXmraP19sZR
         B6Kg==
X-Gm-Message-State: AOJu0YznL/y52ZhiGGRb4FrC2nyHThVGOoA74YQLX89zhkKIltPqNwwj
	17bU1DyjpiXC9ci2lLW/Bv7FumkkO8jRvHU8P6CSwZdQPPZUXXLDbj15scsFo8OeuOGvPchfbT6
	u6VDcfIWM+es/0+5/T13z1sPBNbIxCrj9us9dog==
X-Google-Smtp-Source: AGHT+IEv2+PacdRXZDKioe8I+TcZjohETPUc05yqNHeQGeD9/yFMR3y1yGV/rRoXycuQG3f5WggV7ajr/dbVj0hPs9A=
X-Received: by 2002:a81:a803:0:b0:5ff:944b:6121 with SMTP id
 f3-20020a81a803000000b005ff944b6121mr1684730ywh.20.1706420024412; Sat, 27 Jan
 2024 21:33:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-8-quic_parellan@quicinc.com> <301cdbe2-7377-4b0f-bd24-5131f8928c29@linaro.org>
 <09a10811-ea7c-3e99-d5eb-755aac4ecf0e@quicinc.com>
In-Reply-To: <09a10811-ea7c-3e99-d5eb-755aac4ecf0e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 28 Jan 2024 07:33:33 +0200
Message-ID: <CAA8EJpqFcY8yBmdW8qpMiS1p3bqY2+pgXtvR0Br9-p_VAUnN+Q@mail.gmail.com>
Subject: Re: [PATCH 07/17] drm/msm/dpu: disallow widebus en in INTF_CONFIG2
 when DP is YUV420
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
	neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 28 Jan 2024 at 07:16, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
>
> On 1/25/2024 1:26 PM, Dmitry Baryshkov wrote:
> > On 25/01/2024 21:38, Paloma Arellano wrote:
> >> INTF_CONFIG2 register cannot have widebus enabled when DP format is
> >> YUV420. Therefore, program the INTF to send 1 ppc.
> >
> > I think this is handled in the DP driver, where we disallow wide bus
> > for YUV 4:2:0 modes.
> Yes we do disallow wide bus for YUV420 modes, but we still need to
> program the INTF_CFG2_DATA_HCTL_EN. Therefore, it is necessary to add
> this check.

As I wrote in my second email, I'd prefer to have one if which guards
HCTL_EN and another one for WIDEN

> >
> >>
> >> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 4 +++-
> >>   1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >> index 6bba531d6dc41..bfb93f02fe7c1 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >> @@ -168,7 +168,9 @@ static void
> >> dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
> >>        * video timing. It is recommended to enable it for all cases,
> >> except
> >>        * if compression is enabled in 1 pixel per clock mode
> >>        */
> >> -    if (p->wide_bus_en)
> >> +    if (dp_intf && fmt->base.pixel_format == DRM_FORMAT_YUV420)
> >> +        intf_cfg2 |= INTF_CFG2_DATA_HCTL_EN;
> >> +    else if (p->wide_bus_en)
> >>           intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN;
> >>         data_width = p->width;
> >



-- 
With best wishes
Dmitry

