Return-Path: <linux-arm-msm+bounces-8937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 757BB84189D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 02:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A97A1C24355
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 01:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 280901A723;
	Tue, 30 Jan 2024 01:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NBQoIIwT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5220436AE7
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 01:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706579030; cv=none; b=evRQM/BevfB9LqaK2qOHMrFWwPcLv7GO2JZZyKPeFWzdXT/40JgCyJw/9BSyf6KmtL2uDGEgYR4r6HH8wvWRyjYPA+tpkTbsyLjWSVazyr/xD0lfoS1X0fmkxIv46Axgc6C7AotRwLLmSSQVCkuZWJ7HjTin/OUnMSX35IO6jS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706579030; c=relaxed/simple;
	bh=XNeGnc+xvbtVw7JCKscfgoLQXnonVQLyMcXCYegq/HY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oMhwjWyh+buVjxakW1inh4BWJAks5WseRXY65gz87fZGoX6TSQQr5ZM+D3m8rHuWvGLC0mKYqu5PY3Qd1UgQ4EhS3pOeYiKx9VjL1hJGCVpQBH2Gq7hYtVozsfTE5pyp+LrPDdVTI3TpUx1K6QeFMkf6zplfXB7hz8q2uP6H/P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NBQoIIwT; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dc6782e92c2so1495995276.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 17:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706579027; x=1707183827; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iNMtLiszpO2MGJDFT0qOweGWQ3laIBi7SMw0diUHki0=;
        b=NBQoIIwT4O2HyaR2b51cKiaa/b1av8c0swSSWBpvw+nlc1YKLmt8E/irtqKuCFPbpp
         nIYkD8868/N61Er9IbbvkuTZU7qsb+3vWbPBjCjbmQ1Rfz8bjGL6Ju0PUcidwTYpwQ/G
         x9zbqcqCt1QaH/uS881BxmherW0iXyNEgGIp3nQOHS5E+yQcLeD+fNd3GHdZ3ZIiSBxs
         79mcW/7PnlOBW5llGNHXLVDxnDdzgqQqdpo14i4Z3Kr5yYO3RPcYUfqM9ijdc165OZ65
         cqOYkYjuql989UXbEGc/N/lh47UFldHLj0atSjzkahDI7EVXosZxIg5A+tUnpMtxpl+n
         kPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706579027; x=1707183827;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iNMtLiszpO2MGJDFT0qOweGWQ3laIBi7SMw0diUHki0=;
        b=CODWrpzeT8FhRCAJehIGIoiubUEZgfcjeCwJ0cZZwNXvl2OmU6vFEQawv9fv1Eczhf
         DejOII74Az3sIXeWh3aYFYSmmzv6wVbuhEbMrukEWC3oQsgwZG+2AcJw9wbXBOnWHe2r
         knaO/PR5KM6utV5asB5Logqey4jGa/ti2HfwrCkUfQsgEDtJGUra3bFB8TXUi1i92uVC
         xR1B3jmraCFgZ7AryaAnudUS5OSdxmvvmSShz95ruJARX0jl43HamY0/jq8aSeH61UAj
         nTjxXZR6joBhiNBO9PrGH+Fpdsov/MuC0ZUHDw8Bz4ci4h2Pz0yIPTtjgJJlTjK6c6kO
         9UbQ==
X-Gm-Message-State: AOJu0Yzx91IZEsDgiosYYKKPyagfvxxonx1cbkfcS79jP8TYbtLimylX
	iQ8DgP/nv5VDxEDAeA/ylX+fwXIpGMcvyqVoui+TLS2j/W53dNbt+GshquzYlRI2nlprSIHPt/6
	FcmFdoD49jcyLgAENMSfDvOsp35eYhbsxKomcDLC/xUx8udsl
X-Google-Smtp-Source: AGHT+IHIu5PhwPZl03Fg/NYNNhrMV8Duy4ndL5qYE/uWqbZ5FA8+a2uCRFBFcO1YdeOiMjWWzPTEJb0554SpYJyq3sk=
X-Received: by 2002:a25:c5ca:0:b0:dc2:2266:a111 with SMTP id
 v193-20020a25c5ca000000b00dc22266a111mr3860868ybe.78.1706579027235; Mon, 29
 Jan 2024 17:43:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-8-quic_parellan@quicinc.com> <301cdbe2-7377-4b0f-bd24-5131f8928c29@linaro.org>
 <09a10811-ea7c-3e99-d5eb-755aac4ecf0e@quicinc.com> <CAA8EJpqFcY8yBmdW8qpMiS1p3bqY2+pgXtvR0Br9-p_VAUnN+Q@mail.gmail.com>
 <31630fe2-045d-c5f1-4019-e8a8b89928c3@quicinc.com> <CAA8EJpr+tqWgj78LuPeDztQb+Tt_Zs0OKPaRsV1E-jqpRQJO6Q@mail.gmail.com>
 <1727d3ab-900b-9c7b-2afa-a47b0bb3c713@quicinc.com>
In-Reply-To: <1727d3ab-900b-9c7b-2afa-a47b0bb3c713@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Jan 2024 03:43:36 +0200
Message-ID: <CAA8EJprhZ+AyjjUM46_qmYeOytX60ncLbFw0mC7V5bBT4MoN6w@mail.gmail.com>
Subject: Re: [PATCH 07/17] drm/msm/dpu: disallow widebus en in INTF_CONFIG2
 when DP is YUV420
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Paloma Arellano <quic_parellan@quicinc.com>, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
	quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com, 
	marijn.suijten@somainline.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Jan 2024 at 03:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 1/29/2024 4:03 PM, Dmitry Baryshkov wrote:
> > On Tue, 30 Jan 2024 at 01:51, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 1/27/2024 9:33 PM, Dmitry Baryshkov wrote:
> >>> On Sun, 28 Jan 2024 at 07:16, Paloma Arellano <quic_parellan@quicinc.com> wrote:
> >>>>
> >>>>
> >>>> On 1/25/2024 1:26 PM, Dmitry Baryshkov wrote:
> >>>>> On 25/01/2024 21:38, Paloma Arellano wrote:
> >>>>>> INTF_CONFIG2 register cannot have widebus enabled when DP format is
> >>>>>> YUV420. Therefore, program the INTF to send 1 ppc.
> >>>>>
> >>>>> I think this is handled in the DP driver, where we disallow wide bus
> >>>>> for YUV 4:2:0 modes.
> >>>> Yes we do disallow wide bus for YUV420 modes, but we still need to
> >>>> program the INTF_CFG2_DATA_HCTL_EN. Therefore, it is necessary to add
> >>>> this check.
> >>>
> >>> As I wrote in my second email, I'd prefer to have one if which guards
> >>> HCTL_EN and another one for WIDEN
> >>>
> >> Its hard to separate out the conditions just for HCTL_EN . Its more
> >> about handling the various pixel per clock combinations.
> >>
> >> But, here is how I can best summarize it.
> >>
> >> Lets consider DSI and DP separately:
> >>
> >> 1) For DSI, for anything > DSI version 2.5 ( DPU version 7 ).
> >>
> >> This is same the same condition as widebus today in
> >> msm_dsi_host_is_wide_bus_enabled().
> >>
> >> Hence no changes needed for DSI.
> >
> > Not quite. msm_dsi_host_is_wide_bus_enabled() checks for the DSC being
> > enabled, while you have written that HCTL_EN should be set in all
> > cases on a corresponding platform.
> >
>
> Agreed. This is true, we should enable HCTL_EN for DSI irrespective of
> widebus for the versions I wrote.
>
> Basically for the non-compressed case.
>
> I will write something up to fix this for DSI. I think this can go as a
> bug fix.
>
> But that does not change the DP conditions OR in other words, I dont see
> anything wrong with this patch yet.
>
> >>
> >> 2) For DP, whenever widebus is enabled AND YUV420 uncompressed case
> >> as they are independent cases. We dont support YUV420 + DSC case.
> >>
> >> There are other cases which fall outside of this bucket but they are
> >> optional ones. We only follow the "required" ones.
> >>
> >> With this summary in mind, I am fine with what we have except perhaps
> >> better documentation above this block.
> >>
> >> When DSC over DP gets added, I am expecting no changes to this block as
> >> it will fall under the widebus_en case.
> >>
> >> With this information, how else would you like the check?
> >
> > What does this bit really change?
> >
>
> This bit basically just tells that the data sent per line is programmed
> with INTF_DISPLAY_DATA_HCTL like this cap is suggesting.
>
>          if (ctx->cap->features & BIT(DPU_DATA_HCTL_EN)) {
>                  DPU_REG_WRITE(c, INTF_CONFIG2, intf_cfg2);
>                  DPU_REG_WRITE(c, INTF_DISPLAY_DATA_HCTL,
> display_data_hctl);
>                  DPU_REG_WRITE(c, INTF_ACTIVE_DATA_HCTL, active_data_hctl);
>          }
>
> Prior to that it was programmed with INTF_DISPLAY_HCTL in the same function.

Can we enable it unconditionally for DPU >= 5.0?

>
> >>
> >>>>>
> >>>>>>
> >>>>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >>>>>> ---
> >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 4 +++-
> >>>>>>     1 file changed, 3 insertions(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >>>>>> index 6bba531d6dc41..bfb93f02fe7c1 100644
> >>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >>>>>> @@ -168,7 +168,9 @@ static void
> >>>>>> dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
> >>>>>>          * video timing. It is recommended to enable it for all cases,
> >>>>>> except
> >>>>>>          * if compression is enabled in 1 pixel per clock mode
> >>>>>>          */
> >>>>>> -    if (p->wide_bus_en)
> >>>>>> +    if (dp_intf && fmt->base.pixel_format == DRM_FORMAT_YUV420)
> >>>>>> +        intf_cfg2 |= INTF_CFG2_DATA_HCTL_EN;
> >>>>>> +    else if (p->wide_bus_en)
> >>>>>>             intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN;
> >>>>>>           data_width = p->width;
> >>>>>
> >>>
> >>>
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry

