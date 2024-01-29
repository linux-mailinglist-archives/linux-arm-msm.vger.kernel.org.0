Return-Path: <linux-arm-msm+bounces-8759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9200683FD6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 06:06:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5DF61C21BEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 05:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE725433C1;
	Mon, 29 Jan 2024 05:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iIuLQggL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BF7433C8
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 05:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706504739; cv=none; b=fv/1DmyI7jPraPFzZHxUKPcN5Q7F6jp1eRBGWekQ/bdU4s9lKbJzBD4jlxZR28xWOAxVdcEDf8xsMDrTNjOzYUSgCL38lT5AxVNf1ZUZgeuLOcn4pQqXABRguRZJhk/8DCHkBMUNMZFZB7rDmjgl4aveoPdZso2Av9UVstrhPKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706504739; c=relaxed/simple;
	bh=jYfXH8GUOSLknD83QboFHGoDgakaL3vA7YF0ixDdi6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rMqOnc2ZnTX4CEcFjeBjvikDYej6h5/GWAoePNWvYkA77gZwm+G4GJjQ/uNDfKVIBMcCvi40x3k99oPjYioIy4bb6RfB/ke0Ku1/gbPCl9/4WdFyzX+WhDBPO8wzUD7Dh4n0Ay5UxsMnRy58sNo0cR3RL8mO5QWfLMl94cJ+Exc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iIuLQggL; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6029e069e08so31465247b3.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jan 2024 21:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706504736; x=1707109536; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=36DxkH6EOQYVv8sFye0ArPdaaYXhn0u8iLVoIcGDUF8=;
        b=iIuLQggLTZXPGDfEKC9GrlRIbYkkBgMvWTQA2tt//0s58PZkEKicVGahlGsZl01Y07
         Fn1Cqalov2nu1mAT0BznrJiwJU9nSz1gr6gpuNxIouS8KSKpeBSEmXuWwdJL/3HR7MIz
         DZ0B4xAY538JVTNoACHQ1jB0HMttqw2G4fjQe/GQEOMiqRMC3R4M3uZGkM6AwI15REKS
         Q73GBnDbFVkbe5VkGjEDagUyObYHKSZ9N2844kID/9OfCg88Tq2vhqbep+aaqCcSBs4X
         x9IclyQ0Gh2SwP7SQUufWrn/5C+L2iHynXEu1tlXUMQHkqewmO5erZhFd2UU4Fd4T8lx
         IXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706504736; x=1707109536;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=36DxkH6EOQYVv8sFye0ArPdaaYXhn0u8iLVoIcGDUF8=;
        b=svj7PKPAPfitBU2Rp9zeiDvQfaBqU3e8uws0DKU6/MaVYgFe0LbDIR5cxUurwmRItZ
         C5ucQ+g99TKAOXm/oOXXax4T0BxLZ1I6L2s64CzkHWmtiGIcCdklkdUsA5Mc6Y/FV0Y4
         j9//1JOkg+x9+KTeD0MWkGaxTn1lTJ5oDRa4UwGfrhnmoSa3JCbZVG+EX5Kzim4KjNo+
         DMI+wmgWUpzkiM5g2h0jHngtgpCEFeybZuQ5COJRTum5Bw7PF70nF7YvRWaOmLszYfQz
         8LdKH3R8Z7t8HJBZvr45RmKCkJ48ZcDAT4KgT54CK9xZLgAiqTQTotJ6nAs97ScJbQiP
         GfNg==
X-Gm-Message-State: AOJu0Yw2At4mrA83qAEbMoK9823m9nEhdZoPiSkUdHaNw0wgXiC8rxOF
	LDHqhK77E51uCYFhL09j95GmcqTP0t4bXSRr0shL29dCDZBmtzgzP2qoqdN4n0033qg8I8mgaxC
	+XFSU1KwYQNrbtCn6R86OlsdAxk/JFp4Nj1BwQA==
X-Google-Smtp-Source: AGHT+IFTpEi+5wpjQGrqUTNDBhtl3rOEmxqgInQ/CfP+pGJfm9CWl8JLLWMENATmXQa2P6Q80sCt7FGxnNS4cvwZkds=
X-Received: by 2002:a0d:ca49:0:b0:600:3eca:564a with SMTP id
 m70-20020a0dca49000000b006003eca564amr3106647ywd.95.1706504736465; Sun, 28
 Jan 2024 21:05:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-18-quic_parellan@quicinc.com> <493926f1-90e9-493a-bd2f-ea1db16d7ee6@linaro.org>
 <72ca08ac-ae16-37f6-6f85-f203ddf79084@quicinc.com> <CAA8EJppj1xN8E==VGncvW5DKMtLPixynpgAqyZoJzPQXZEEYjg@mail.gmail.com>
 <1666a8c3-f1f0-f050-aa06-cf221bdbcbb9@quicinc.com>
In-Reply-To: <1666a8c3-f1f0-f050-aa06-cf221bdbcbb9@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Jan 2024 07:05:25 +0200
Message-ID: <CAA8EJprDUBb7yM-16QVa_i6ONRaNYSWRvJKMG=Z2rPhJ0JfwXw@mail.gmail.com>
Subject: Re: [PATCH 17/17] drm/msm/dp: allow YUV420 mode for DP connector when
 VSC SDP supported
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Paloma Arellano <quic_parellan@quicinc.com>, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
	quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com, 
	marijn.suijten@somainline.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jan 2024 at 06:30, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 1/28/2024 7:52 PM, Dmitry Baryshkov wrote:
> > On Mon, 29 Jan 2024 at 05:17, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 1/25/2024 2:05 PM, Dmitry Baryshkov wrote:
> >>> On 25/01/2024 21:38, Paloma Arellano wrote:
> >>>> All the components of YUV420 over DP are added. Therefore, let's mark the
> >>>> connector property as true for DP connector when the DP type is not eDP
> >>>> and when VSC SDP is supported.
> >>>>
> >>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >>>> ---
> >>>>    drivers/gpu/drm/msm/dp/dp_display.c | 5 ++++-
> >>>>    1 file changed, 4 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> b/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> index 4329435518351..97edd607400b8 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> @@ -370,11 +370,14 @@ static int dp_display_process_hpd_high(struct
> >>>> dp_display_private *dp)
> >>>>        dp_link_process_request(dp->link);
> >>>> -    if (!dp->dp_display.is_edp)
> >>>> +    if (!dp->dp_display.is_edp) {
> >>>> +        if (dp_panel_vsc_sdp_supported(dp->panel))
> >>>> +            dp->dp_display.connector->ycbcr_420_allowed = true;
> >>>
> >>> Please consider fixing a TODO in drm_bridge_connector_init().
> >>>
> >>
> >> I am not totally clear if that TODO can ever go for DP/HDMI usage of
> >> drm_bridge_connector.
> >>
> >> We do not know if the sink supports VSC SDP till we read the DPCD and
> >> till we know that sink supports VSC SDP, there is no reason to mark the
> >> YUV modes as supported. This is the same logic followed across vendors.
> >>
> >> drm_bride_connector_init() happens much earlier than the point where we
> >> read DPCD. The only thing which can be done is perhaps add some callback
> >> to update_ycbcr_420_allowed once DPCD is read. But I don't think its
> >> absolutely necessary to have a callback just for this.
> >
> > After checking the drm_connector docs, I'd still hold my opinion and
> > consider this patch to be a misuse of the property. If you check the
> > drm_connector::ycbcr_420_allowed docs, you'll see that it describes
> > the output from the source point of view. In other words, it should be
> > true if the DP connector can send YUV420 rather than being set if the
> > attached display supports such output. This matches ycbcr420_allowed
> > usage by AMD, dw-hdmi, intel_hdmi and even intel_dp usage.
> >
>
> hmmm I think I misread intel_dp_update_420(). I saw this is called after
> HPD so I thought they unset ycbcr_420_allowed if VSC SDP is not
> supported. But they have other DPCD checking there so anyway they will
> fail this bridge_connector_init() model.
>
> But one argument which I can give in my defense is, lets say the sink
> exposed YUV formats but did not support SDP, then atomic_check() will
> keep failing or should keep failing. This will avoid this scenario. But
> we can assume that would be a rogue sink.

This should be handled in DP's atomic_check. As usual, bonus point if
this is done via helpers that can be reused by other platforms.

> I think we can pass a yuv_supported flag to msm_dp_modeset_init() and
> set it to true from dpu_kms if catalog has CDM block and get rid of the
> dp_panel_vsc_sdp_supported().

These are two different issues. CDM should be checked in PDU (whether
the DPU can provide YUV data to the DP block).

>
> But that doesnt address the TODO you have pointed to. What is really the
> expectation of the TODO? Do we need to pass a ycbcr_420_allowed flag to
> drm_bridge_connector_init()?

Ugh. No. I was thinking about a `ycbcr420_allowed` flag in the struct
drm_bridge (to follow existing interlace_allowed) flag. But, this
might be not the best option. Each bridge can either pass through YUV
data from the previous bridge or generate YCbCr data on its own. So in
theory this demands two flags plus one flag for the encoder. Which
might be an overkill, until we end up in a situation when the driver
can not decide for the full bridge chain.

So let's probably ignore the TODO for the purpose of this series. Just
fix the usage of ycbcr420_allowed according to docs.

>
> That would need a tree wide cleanup and thats difficult to sign up for
> in this series and I would not as well.
>
> One thing which I can suggest to be less intrusive is have a new API
> called drm_bridge_connector_init_with_YUV() which looks something like
> below:
>
> struct drm_connector *drm_bridge_connector_init_with_ycbcr_420(struct
> drm_device *drm, struct drm_encoder *encoder)
> {
>         drm_bridge_connector_init();
>         connector->ycbcr_420_allowed = true;
> }
>
> But I don't know if the community would be interested in this idea or
> would find that useful.
>
> >>>>            drm_dp_set_subconnector_property(dp->dp_display.connector,
> >>>>                             connector_status_connected,
> >>>>                             dp->panel->dpcd,
> >>>>                             dp->panel->downstream_ports);
> >>>> +    }
> >>>>        edid = dp->panel->edid;
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry

