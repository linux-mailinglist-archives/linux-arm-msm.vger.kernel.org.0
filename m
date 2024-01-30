Return-Path: <linux-arm-msm+bounces-8946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB24841B6B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 06:28:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB2611F25924
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 05:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7335376F4;
	Tue, 30 Jan 2024 05:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="beL/5uxP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD9D376F6
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 05:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706592520; cv=none; b=cac8Urtplq31PytnadVntFVYbxqe7FXHe559MyDX62/WFv9WrwM+HLcLWEuBOR+tJH5QZXbBJp6E8WaXuAmG4JI/zwiPYQAp10WymxSxmdrFNDSQptmuUkn4ThVZgxlQZ8Se9ArU9DBqtI6w+Fep2ATMvr0iM6IMwRJFq5XiTuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706592520; c=relaxed/simple;
	bh=TI2t84NCpTtSAKOibMm9XQ2mqlRl9yLV43Y/hookWpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FSYKh701gA8RMMm7/VEgdJ4CGVWrXFvtkenDphWAMRvet2QJ0ypvqsZeEymnG9iqTRUh0Mfeaf3QQYTBcIi1l9QyaeueRSmi2E8v/nE0n4+St/PfzSHXNMukerUJ2kXqAoOzcozvLaXdUIvlymrHZMMDiOzTfKbNO/lP+HGOTmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=beL/5uxP; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5ff821b9acfso34468707b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 21:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706592518; x=1707197318; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2oJh1bKyRcnDu3I/s/TzC/Ns9zc3sl/RT0aJDndm2Vc=;
        b=beL/5uxPXlsSpl8EVH1ck/d7Qg0z023Fr6h3mNf+agA3TCNHf6cyS1fnLRXRc72dOm
         cbm3DGTlDZY2nurwlMSv9lLCjxph56dJDcNkadeWWQ74KYrSN+qFOxG3EtyHgpxKcS0q
         Ycf1dH70XpH49rZ9ib6TCiLO/chsAFsB+8qje32i/yEj6ilTkAMtiLnTYD0iETZ5amWf
         5mbMaF6nvN53hOphNLt2+voVEgM09enCx+sIeqsdw6zTDee7vE1+q9iWwEmZcfGuRiKc
         7oqe5iyAorz1UuZIm8Y/t0Gci+MVkZ1sOoPKt4FZej00jAV/826Vws79ZBoxjJqDkfh3
         +BOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706592518; x=1707197318;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2oJh1bKyRcnDu3I/s/TzC/Ns9zc3sl/RT0aJDndm2Vc=;
        b=uCjWgrH1mBdJEqHggbrJzcnJ0XKQMXqY/JASaYvew7m4CsHH2DTZxP2FD6IdCeT+6h
         nr6CHO7G8iwJXQZTXJBPuEiso0i5Km7iWikOu9Ec2DQU0eHfoi7/JRyjh4hmtMYJ0Lh3
         t2P9Y8tH/XEyRnt0jlrU0ij+zpx7gp/C3mh43bWFzKzZjw9I6Jca7+DIg5/LV3VobtDW
         tcOGefKlGonxq/ecWv580TsphMS6o3yJm1JTpqOGlM/WK5t6G6QrvAAunnQkyLqUcRv+
         CdIi6IaxZLKu0QJrzYJR90Sc8jaLxs64DNGxFG0nXyutYeW4cD9sdmb1QzhLN0VIhA5E
         gN2A==
X-Gm-Message-State: AOJu0YyA14MroZTdNYgUXO8GcbTxv8tJdVPlvxZOpPr9jj8oFS2m2GtN
	rZsiu6Qa4R2VBuenoOHb5zxzmMVfAR8LahgRecnSusp5n9heFkhAVddkuM/iJCR59hzyFpkwa1i
	G3Ssytu/EP1XATLs/d/v+jdZypnhSOg7V53zIDg==
X-Google-Smtp-Source: AGHT+IEBeZK6o5mTWaHuXZc5czAJkaQBsE1YXq8D2mI1bESooCew7XQ+bzt2Z20I5hi2iOCdiRQM/foKk25JAp6O7IA=
X-Received: by 2002:a81:e205:0:b0:5ff:bb43:2a69 with SMTP id
 p5-20020a81e205000000b005ffbb432a69mr4689799ywl.40.1706592517782; Mon, 29 Jan
 2024 21:28:37 -0800 (PST)
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
 <1727d3ab-900b-9c7b-2afa-a47b0bb3c713@quicinc.com> <CAA8EJprhZ+AyjjUM46_qmYeOytX60ncLbFw0mC7V5bBT4MoN6w@mail.gmail.com>
 <697b153b-fb8e-6b58-fc4f-92f814f86d0f@quicinc.com>
In-Reply-To: <697b153b-fb8e-6b58-fc4f-92f814f86d0f@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Jan 2024 07:28:26 +0200
Message-ID: <CAA8EJpp+k9u4L4O9_V4Ypu-8ROUkVkRt3pL5Tot+eGC39EqNaw@mail.gmail.com>
Subject: Re: [PATCH 07/17] drm/msm/dpu: disallow widebus en in INTF_CONFIG2
 when DP is YUV420
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Paloma Arellano <quic_parellan@quicinc.com>, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
	quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com, 
	marijn.suijten@somainline.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Jan 2024 at 06:10, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 1/29/2024 5:43 PM, Dmitry Baryshkov wrote:
> > On Tue, 30 Jan 2024 at 03:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 1/29/2024 4:03 PM, Dmitry Baryshkov wrote:
> >>> On Tue, 30 Jan 2024 at 01:51, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 1/27/2024 9:33 PM, Dmitry Baryshkov wrote:
> >>>>> On Sun, 28 Jan 2024 at 07:16, Paloma Arellano <quic_parellan@quicinc.com> wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 1/25/2024 1:26 PM, Dmitry Baryshkov wrote:
> >>>>>>> On 25/01/2024 21:38, Paloma Arellano wrote:
> >>>>>>>> INTF_CONFIG2 register cannot have widebus enabled when DP format is
> >>>>>>>> YUV420. Therefore, program the INTF to send 1 ppc.
> >>>>>>>
> >>>>>>> I think this is handled in the DP driver, where we disallow wide bus
> >>>>>>> for YUV 4:2:0 modes.
> >>>>>> Yes we do disallow wide bus for YUV420 modes, but we still need to
> >>>>>> program the INTF_CFG2_DATA_HCTL_EN. Therefore, it is necessary to add
> >>>>>> this check.
> >>>>>
> >>>>> As I wrote in my second email, I'd prefer to have one if which guards
> >>>>> HCTL_EN and another one for WIDEN
> >>>>>
> >>>> Its hard to separate out the conditions just for HCTL_EN . Its more
> >>>> about handling the various pixel per clock combinations.
> >>>>
> >>>> But, here is how I can best summarize it.
> >>>>
> >>>> Lets consider DSI and DP separately:
> >>>>
> >>>> 1) For DSI, for anything > DSI version 2.5 ( DPU version 7 ).
> >>>>
> >>>> This is same the same condition as widebus today in
> >>>> msm_dsi_host_is_wide_bus_enabled().
> >>>>
> >>>> Hence no changes needed for DSI.
> >>>
> >>> Not quite. msm_dsi_host_is_wide_bus_enabled() checks for the DSC being
> >>> enabled, while you have written that HCTL_EN should be set in all
> >>> cases on a corresponding platform.
> >>>
> >>
> >> Agreed. This is true, we should enable HCTL_EN for DSI irrespective of
> >> widebus for the versions I wrote.
> >>
> >> Basically for the non-compressed case.
> >>
> >> I will write something up to fix this for DSI. I think this can go as a
> >> bug fix.
> >>
> >> But that does not change the DP conditions OR in other words, I dont see
> >> anything wrong with this patch yet.
> >>
> >>>>
> >>>> 2) For DP, whenever widebus is enabled AND YUV420 uncompressed case
> >>>> as they are independent cases. We dont support YUV420 + DSC case.
> >>>>
> >>>> There are other cases which fall outside of this bucket but they are
> >>>> optional ones. We only follow the "required" ones.
> >>>>
> >>>> With this summary in mind, I am fine with what we have except perhaps
> >>>> better documentation above this block.
> >>>>
> >>>> When DSC over DP gets added, I am expecting no changes to this block as
> >>>> it will fall under the widebus_en case.
> >>>>
> >>>> With this information, how else would you like the check?
> >>>
> >>> What does this bit really change?
> >>>
> >>
> >> This bit basically just tells that the data sent per line is programmed
> >> with INTF_DISPLAY_DATA_HCTL like this cap is suggesting.
> >>
> >>           if (ctx->cap->features & BIT(DPU_DATA_HCTL_EN)) {
> >>                   DPU_REG_WRITE(c, INTF_CONFIG2, intf_cfg2);
> >>                   DPU_REG_WRITE(c, INTF_DISPLAY_DATA_HCTL,
> >> display_data_hctl);
> >>                   DPU_REG_WRITE(c, INTF_ACTIVE_DATA_HCTL, active_data_hctl);
> >>           }
> >>
> >> Prior to that it was programmed with INTF_DISPLAY_HCTL in the same function.
> >
> > Can we enable it unconditionally for DPU >= 5.0?
> >
>
> There is a corner-case that we should not enable it when compression is
> enabled without widebus as per the docs :(

What about explicitly disabling it in such a case?
I mean something like:

if (dpu_core_rev >= 5.0 && !(enc->hw_dsc && !enc->wide_bus_en))
   intf_cfg |= INTF_CFG2_HCTL_EN;


>
> For DP there will not be a case like that because compression and
> widebus go together but for DSI, it is possible.
>
> So I found that the reset value of this register does cover all cases
> for DPU >= 7.0 so below fix will address the DSI concern and will fix
> the issue even for YUV420 cases such as this one for DPU >= 7.0
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 6bba531d6dc4..cbd5ebd516cd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -168,6 +168,8 @@ static void dpu_hw_intf_setup_timing_engine(struct
> dpu_hw_intf *ctx,
>           * video timing. It is recommended to enable it for all cases,
> except
>           * if compression is enabled in 1 pixel per clock mode
>           */
> +
> +       intf_cfg2 = DPU_REG_READ(c, INTF_CONFIG2);
>          if (p->wide_bus_en)
>                  intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN |
> INTF_CFG2_DATA_HCTL_EN;
>
>
> But, this does not still work for DPU < 7.0 such as sc7180 if we try
> YUV420 over DP on that because its DPU version is 6.2 so we will have to
> keep this patch for those cases.
>
> >>
> >>>>
> >>>>>>>
> >>>>>>>>
> >>>>>>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >>>>>>>> ---
> >>>>>>>>      drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 4 +++-
> >>>>>>>>      1 file changed, 3 insertions(+), 1 deletion(-)
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >>>>>>>> index 6bba531d6dc41..bfb93f02fe7c1 100644
> >>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >>>>>>>> @@ -168,7 +168,9 @@ static void
> >>>>>>>> dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
> >>>>>>>>           * video timing. It is recommended to enable it for all cases,
> >>>>>>>> except
> >>>>>>>>           * if compression is enabled in 1 pixel per clock mode
> >>>>>>>>           */
> >>>>>>>> -    if (p->wide_bus_en)
> >>>>>>>> +    if (dp_intf && fmt->base.pixel_format == DRM_FORMAT_YUV420)
> >>>>>>>> +        intf_cfg2 |= INTF_CFG2_DATA_HCTL_EN;
> >>>>>>>> +    else if (p->wide_bus_en)
> >>>>>>>>              intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN;
> >>>>>>>>            data_width = p->width;
> >>>>>>>
> >>>>>
> >>>>>
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

