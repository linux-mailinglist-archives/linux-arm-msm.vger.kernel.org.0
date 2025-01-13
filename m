Return-Path: <linux-arm-msm+bounces-44880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C553A0B674
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 13:13:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 530D21885B33
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 12:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26B62045B6;
	Mon, 13 Jan 2025 12:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gV/I7uiS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DFC1CAA96
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 12:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736770395; cv=none; b=V2rHlhf8p8UxB/2/kscxtDNwAWsaQwh6lpG49aJf6ZRb/nwMk65TlpNYgdBxPMI6x0xVMLfRRi78hIVDRlRaC/58Wv0LewvxclcUnprjnIaALTt7bbq4nSA/qbZ+DEmAKdj6wAmTF8i1FKwXP469D1DGPyI1x5gWwgGLX49wkSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736770395; c=relaxed/simple;
	bh=YcJgswyVfF8qmERj60cm/97mi+CK1gSrTvMLxRmsVn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oOB0DD7YqXqFFjcBDO1nhcpO52NlRnOp7Sp9d/8NycfChVB2w1McrTgpLt1rFxX0pw6orE83wclntl4Z/z434RGgtNSidDSJ2F2ZmjaF3qXZA5KY1y9mWzxdZ313WLoXOU4MzW0YhGD+3SPnivGZxNqh+qmlV6HyR0ELLaMtZV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gV/I7uiS; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54021daa6cbso3637397e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 04:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736770392; x=1737375192; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ggEttB+Ig+Bz7ybwolYRC3yeEiYX+HeeyppyvsOBIZc=;
        b=gV/I7uiS4G7k8eaPidBagvSHU0Ga5L38wNsNI7bLogdS48gAiC1vVYxwMClkuL8dny
         AFQ5RwpmWIItuBzVlobB9GBIK9IU5QHi5bEyC0eVG4u1LXlGPV0D8ow6cFW7Ukw26LRf
         6BifLyIBhayiRckm0/8NQeDvgQtaTUtNo+nez8lwr1MTVTlRnfR9nLWxXQkAc9s5OTd1
         AHibibTDjTgOLZGnmYXdxi2OVH96kjVztJigWaqV+QH7c8jQ84rNOOh9PcmZm9gyk8qV
         pUmywRGa3DDgPVx95uhK3yUfnvZLYXe6mouzrN8xjbYDTXzZYhP4oIy84RRDliXiJvFU
         Ni3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736770392; x=1737375192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggEttB+Ig+Bz7ybwolYRC3yeEiYX+HeeyppyvsOBIZc=;
        b=dxgJcAn4te0reAmsjqrRkf3C7JnRhq0twHUg+WA6kJftbI998hCKkhpPiWfGiezMYg
         qzLwJeWL9PISx1lZ8txl0L6rd8AvRiXarvQy3p7JgJtmfbTvU1mGq4adEmOZJF56+J1e
         VQ5sVPwh0yivR7j/nxMEQtPNL5gIY03FPCQw/Jj51Sm6IGslsKT23EPoJ779RZ8Yiv8g
         J8Y29nZ4pwz/Ph3mkYevoAEFBVYkWViFRsw4UivpNWES5baCAThYgB7RsMZutxDXs0EZ
         EwGFbFJwGKfkDnH1DWvSHQqgmM2yq7UYCdVvxF5VXXt8glVsGi01Jy+qONdU1kCyFzqM
         /tyA==
X-Forwarded-Encrypted: i=1; AJvYcCX3f4TgUDuZLVJCSlEPHwH+n7YFVDpZelxfaplN8hjaydNfCjZdX7PB3u2YDcmU2akJw83JgzZuoPlMdqBD@vger.kernel.org
X-Gm-Message-State: AOJu0YyCpe0w8fHOP3bgK2olDWEgeWRr+z4V8l4BXl2S2f/WYzy1baRz
	zTPKcMuMOrocNI7PhvKsruzRrHfaPoMmLDO4MdzOcK5c/k7ltEuYFdEXp2/O6qw=
X-Gm-Gg: ASbGnct3hjHyBNCmN4RDHE6f+XsNzj+ZjgwStbQ5BOuhceG7FXejnuEl1EeQDX0Jkxp
	pZINcpfIPHZlwlAMs7yXH5XpiH1sfA2wH0UZa5xzB6d9SMESknEhTeVSxr5qV/eknU72YDugxYG
	X0a5deP24Djxa7jnQyIVLJqwx889YVd160Y/3bPmg045xDk0CY7v3C0Kii+xbqLZZFA5EpV3yfM
	pvXTx1fD7MJc3acrEhjCms9Cz0eCCOWtin5twpj3WmaWdnj7xyNfrtGHS7IVJuxq8sGsBlq0bzR
	BnW3LZh+ehSWIdWo6RYIN0aAS5J8KouW6aB2
X-Google-Smtp-Source: AGHT+IHCGa5rn9lWyMqh8mQVDrsEl9vr/KAqV5tVASicZai5lykFeCgDGNkiRJea/sc3hviUH+ycOg==
X-Received: by 2002:a05:6512:1256:b0:540:1f2f:6ac8 with SMTP id 2adb3069b0e04-542845d61famr6629822e87.33.1736770391761;
        Mon, 13 Jan 2025 04:13:11 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be4a010sm1325391e87.35.2025.01.13.04.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:13:10 -0800 (PST)
Date: Mon, 13 Jan 2025 14:13:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH RFC 08/11] drm/msm/dsi: Add support for SM8750
Message-ID: <5irzvm4socrdjx3zqdxnogpai3bmfb52f63ddr3pisn5aa4jgf@mbc42kb3gyqd>
References: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
 <20250109-b4-sm8750-display-v1-8-b3f15faf4c97@linaro.org>
 <3p7kjok5jzwvgt7dxuad26xgdkjd52v4gbtuudvgkeoj33skqn@afl2ddtsq7s2>
 <4fc7fdd5-36cd-42e6-af4a-e0e429f9f50b@linaro.org>
 <7eupqawhdrbjgsj2p7e3ky7uj62m252i6dzkb6y23btocedp3q@qmw72nmbk2c4>
 <6ee02d22-7a00-4c7c-a5e9-63e91d7d84ba@linaro.org>
 <uyidfuh5ul5kcg4keeev6yagmjc5ksun626dyb6kdgwegc76d7@iu7ggdhgt5qr>
 <7255ae24-983d-452c-bd6d-85804c367f8f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7255ae24-983d-452c-bd6d-85804c367f8f@linaro.org>

On Mon, Jan 13, 2025 at 12:02:54PM +0100, Krzysztof Kozlowski wrote:
> On 13/01/2025 09:29, Dmitry Baryshkov wrote:
> > On Fri, Jan 10, 2025 at 01:43:28PM +0100, Krzysztof Kozlowski wrote:
> >> On 10/01/2025 10:17, Dmitry Baryshkov wrote:
> >>> On Fri, Jan 10, 2025 at 09:59:26AM +0100, Krzysztof Kozlowski wrote:
> >>>> On 10/01/2025 00:18, Dmitry Baryshkov wrote:
> >>>>> On Thu, Jan 09, 2025 at 02:08:35PM +0100, Krzysztof Kozlowski wrote:
> >>>>>> Add support for DSI PHY v7.0 on Qualcomm SM8750 SoC which comes with two
> >>>>>> differences worth noting:
> >>>>>>
> >>>>>> 1. ICODE_ACCUM_STATUS_LOW and ALOG_OBSV_BUS_STATUS_1 registers - their
> >>>>>>    offsets were just switched.  Currently these registers are not used
> >>>>>>    in the driver, so the easiest is to document both but keep them
> >>>>>>    commented out to avoid conflict.
> >>>>>>
> >>>>>> 2. DSI PHY PLLs, the parents of pixel and byte clocks, cannot be used as
> >>>>>>    parents before they are prepared and initial rate is set.  Therefore
> >>>>>>    assigned-clock-parents are not working here and driver is responsible
> >>>>>>    for reparenting clocks with proper procedure: see dsi_clk_init_6g_v2_9().
> >>>>>
> >>>>> Isn't it a description of CLK_SET_PARENT_GATE and/or
> >>>>
> >>>> No - must be gated accross reparent - so opposite.
> >>>>
> >>>>> CLK_OPS_PARENT_ENABLE ?
> >>>>
> >>>> Yes, but does not work. Probably enabling parent, before
> >>>> assigned-clocks-parents, happens still too early:
> >>>>
> >>>> [    1.623554] DSI PLL(0) lock failed, status=0x00000000
> >>>> [    1.623556] PLL(0) lock failed
> >>>> [    1.624650] ------------[ cut here ]------------
> >>>> [    1.624651] disp_cc_mdss_byte0_clk_src: rcg didn't update its
> >>>> configuration.
> >>>>
> >>>> Or maybe something is missing in the DSI PHY PLL driver?
> >>>
> >>> Do you have the no-zero-freq workaround?
> >>
> >> Yes, it is necessary also for my variant. I did not include it here, but
> >> I should mention it in the cover letter.
> > 
> > Could you please possibly backtrace the corresponding enable() calls?
> 
> 
> It's the same backtrace I shared some time ago in internal discussions:
> https://pastebin.com/kxUFgzD9
> Unless you ask for some other backtrace?
> 
> > I'd let Stephen and/or Bjorn or Konrad to correct me, but I think that
> > such requirement should be handled by the framework instead of having
> > the drivers to manually reparent the clocks.
> 
> I don't know how exactly you would like to solve it. The clocks can be
> reparented only after some other device specific enable sequence. It's
> the third device here, but not reflected in the clocks hierarchy. Maybe
> it's the result how entire Display device nodes were designed in the
> first place?
> 
> Assigned clocks are between DSI PHY and DISP cc, but they are a property
> of DSI controller. This looks exactly too specific for core to handle
> and drivers, not framework, should manually reparent such clocks.
> Otherwise we need
> "clk_pre_prepare_callback_if_we_are_called_when_phy_is_disabled" sort of
> callback.

What kind of PHY programming is required? Is enabling the PLL enough or
does it need anything else? Are the PLL supplies properly enabled at
this point?

-- 
With best wishes
Dmitry

