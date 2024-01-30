Return-Path: <linux-arm-msm+bounces-8921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B249841741
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 01:04:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D04521F23600
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 00:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C850EAF0;
	Tue, 30 Jan 2024 00:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ITWot59l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB593D6A
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 00:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706573044; cv=none; b=rJfhJOFr46S0Jd09SFXhOd++jIfEC9RLUb07Z3KWlp71Pco9D0TUD/8CHfJ+KdF6H88JCSpFf6F67QIV7EFccezTcH0CRugUzxq8xxdSYAOIRQMZx/ZXTecc1iAWKDwv9hjak/EDZ+sNzuv1MTrNogyEhfiVbr/IELxo6v7wNKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706573044; c=relaxed/simple;
	bh=bQpOrT9d5GEbmbfuxkPhRiCOQTf4yOHp9nLzt6AfJNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DMvZfIhoDfY66PH/yHXhxcMIKN0TfWcPvZgXE3HJzwn+yiVlyPEb2CuryDlaDc69kD40PHGvLodN29PMTBgpZuaHFSnejFtptzXcVRJ6A8PeDJnzWm0Sn5ybromV7wb/uixPInhZq4LBs4ZNEWQgOAcNDQ/d1xk0/2ydlbI8TKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ITWot59l; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dc6a2e63203so5424276.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 16:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706573042; x=1707177842; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=10mGlGfE71kcUxZt+FhNspjVUeTHZj5MOphZVIYQcjY=;
        b=ITWot59lb4SIbO61x9RixwDyrbHShnuPOzx4/+3aDhMK/bFpWbuV3cidUuEpY8oTEs
         x45Y53ISMGFVaLXNwCXsET+NoMLtArdf5+kPWaJKT7PL3ViK6StAB4CN/gslqlpHQi/a
         iSXCTKj8x99JRDZodA/TzyJCPl6Ezi1CpW+07MomVYjWW1ICKeqbOAAMJ9bNC3+2LCuc
         toKswg9pu9HtCnudEJBs66Jy61wvDG4xVDJOtqIpumLOXWSOgcHaWX9jTRg1wYUGw89B
         V8iPg8n9BxTM8moG7pKCDVdeet/l3Rjx8T9X0/Hggc+oKmZgVyqpJk5U5LD6hdBNCHTb
         HkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706573042; x=1707177842;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=10mGlGfE71kcUxZt+FhNspjVUeTHZj5MOphZVIYQcjY=;
        b=P155zFiCbgIQV+6gksm+eJVNVGHLT3I9NB7pnu82yliT1Khb/cRUgI172GJipIIlK9
         Kjts0Uphn+T7nZ/7GhVKnbkN3YzZVSBUADfGaUUMG23HlXdKZMxOLR2+AP5vLcslzlTm
         ysfTheSVGA5nsjf3bULRZxUwP+gfvGji1541Gcpf7XNkFAMcUQeJUuvLlVvAnWguwgrj
         UMyAxj9mV/Ihcazb3B1mQtFb7bvB74so7ke8NDEhKbaEzrcKL08RHwq52zeQdT6Q3t5v
         CLA9vaDOBoq/Cvjtkoh5WHlsBHao78rYxyMMSDsEjR19DN2AcGQ/B3fGgM5URt36w2kF
         nD5g==
X-Gm-Message-State: AOJu0YzrzoO8tBrG5rwaiyYnXqVVAEt79WoGcCBUvCx/a28n8/e6t2xE
	/4cRmq2NOBuHIhz+HXgqx4MMM5FS+pQUvnCV4h/G5VG1lyb/OeHqi6ADe7vsy0oBeOByDiXvjpS
	bNZqoOVsp0RYDw8wx/UehiI8h4bjm8UdAjmlUNw==
X-Google-Smtp-Source: AGHT+IERWnWLJY81Yqz3Od8hw2QW6v4/H/M3UO4fhrq7GoPFBmVKV+8nMOjO7BBK1jYPCBJNapeh567NDuEe+GxoF68=
X-Received: by 2002:a25:8a8d:0:b0:dbd:b8fa:a0e9 with SMTP id
 h13-20020a258a8d000000b00dbdb8faa0e9mr3904706ybl.66.1706573042025; Mon, 29
 Jan 2024 16:04:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-8-quic_parellan@quicinc.com> <301cdbe2-7377-4b0f-bd24-5131f8928c29@linaro.org>
 <09a10811-ea7c-3e99-d5eb-755aac4ecf0e@quicinc.com> <CAA8EJpqFcY8yBmdW8qpMiS1p3bqY2+pgXtvR0Br9-p_VAUnN+Q@mail.gmail.com>
 <31630fe2-045d-c5f1-4019-e8a8b89928c3@quicinc.com>
In-Reply-To: <31630fe2-045d-c5f1-4019-e8a8b89928c3@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Jan 2024 02:03:50 +0200
Message-ID: <CAA8EJpr+tqWgj78LuPeDztQb+Tt_Zs0OKPaRsV1E-jqpRQJO6Q@mail.gmail.com>
Subject: Re: [PATCH 07/17] drm/msm/dpu: disallow widebus en in INTF_CONFIG2
 when DP is YUV420
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Paloma Arellano <quic_parellan@quicinc.com>, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
	quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com, 
	marijn.suijten@somainline.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Jan 2024 at 01:51, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 1/27/2024 9:33 PM, Dmitry Baryshkov wrote:
> > On Sun, 28 Jan 2024 at 07:16, Paloma Arellano <quic_parellan@quicinc.com> wrote:
> >>
> >>
> >> On 1/25/2024 1:26 PM, Dmitry Baryshkov wrote:
> >>> On 25/01/2024 21:38, Paloma Arellano wrote:
> >>>> INTF_CONFIG2 register cannot have widebus enabled when DP format is
> >>>> YUV420. Therefore, program the INTF to send 1 ppc.
> >>>
> >>> I think this is handled in the DP driver, where we disallow wide bus
> >>> for YUV 4:2:0 modes.
> >> Yes we do disallow wide bus for YUV420 modes, but we still need to
> >> program the INTF_CFG2_DATA_HCTL_EN. Therefore, it is necessary to add
> >> this check.
> >
> > As I wrote in my second email, I'd prefer to have one if which guards
> > HCTL_EN and another one for WIDEN
> >
> Its hard to separate out the conditions just for HCTL_EN . Its more
> about handling the various pixel per clock combinations.
>
> But, here is how I can best summarize it.
>
> Lets consider DSI and DP separately:
>
> 1) For DSI, for anything > DSI version 2.5 ( DPU version 7 ).
>
> This is same the same condition as widebus today in
> msm_dsi_host_is_wide_bus_enabled().
>
> Hence no changes needed for DSI.

Not quite. msm_dsi_host_is_wide_bus_enabled() checks for the DSC being
enabled, while you have written that HCTL_EN should be set in all
cases on a corresponding platform.

>
> 2) For DP, whenever widebus is enabled AND YUV420 uncompressed case
> as they are independent cases. We dont support YUV420 + DSC case.
>
> There are other cases which fall outside of this bucket but they are
> optional ones. We only follow the "required" ones.
>
> With this summary in mind, I am fine with what we have except perhaps
> better documentation above this block.
>
> When DSC over DP gets added, I am expecting no changes to this block as
> it will fall under the widebus_en case.
>
> With this information, how else would you like the check?

What does this bit really change?

>
> >>>
> >>>>
> >>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >>>> ---
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 4 +++-
> >>>>    1 file changed, 3 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >>>> index 6bba531d6dc41..bfb93f02fe7c1 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >>>> @@ -168,7 +168,9 @@ static void
> >>>> dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
> >>>>         * video timing. It is recommended to enable it for all cases,
> >>>> except
> >>>>         * if compression is enabled in 1 pixel per clock mode
> >>>>         */
> >>>> -    if (p->wide_bus_en)
> >>>> +    if (dp_intf && fmt->base.pixel_format == DRM_FORMAT_YUV420)
> >>>> +        intf_cfg2 |= INTF_CFG2_DATA_HCTL_EN;
> >>>> +    else if (p->wide_bus_en)
> >>>>            intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN;
> >>>>          data_width = p->width;
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry

