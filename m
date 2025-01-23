Return-Path: <linux-arm-msm+bounces-45959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA80A1A36E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 12:45:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFAE5188BE24
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 11:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6473020F06C;
	Thu, 23 Jan 2025 11:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DVsp65uR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFF620E32F
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 11:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737632569; cv=none; b=Kaz9n4VpvKVyEHy3jIV9I0fc4svDe41peOSnlVNKSZRrtnoEtLTfoJ+sLxrEXXf4e+x5lRv223dv+shKSaxNGMO+unxcSI5/5K+Ox8Umvq4pzdg95XnGmjLjZAjbCtheUmmJbO330anfeUWqVcWHeYMCwDCuVBFQTckChG+f4U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737632569; c=relaxed/simple;
	bh=ud3tE0h7JjyTq6IApBzsJSox04IZQvJRJRP626++F0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ss6NTg130wHv2j3NOTlMillrHPOkvEXcN89gIovrBzAPBFL9qBCaE/Hc/n9OxELfpSkjpIk6urYjWvEsGY6IvEIKEJpBoJaCb+XVLmQMX45nq/P71Wtu1738WDBUtYayR220tmVhPZSfAWsYg5hyMjpm2VYcHvhP/7dZFVMbKE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DVsp65uR; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5401c52000fso678902e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 03:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737632565; x=1738237365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i3P39NTqsEmG+qD3A8uUKR2alt74v//DeAhcZsNNbA0=;
        b=DVsp65uRnzFSZ6tx7C3PFaQk4ja0QqxSeJw20LBBSs129/B9AHQT732RS7euG6TTLf
         sxAoHTJiN6K6+NfxaafvDy4idrFpjcdFFpvfl2Z9czUc7yOPFW3wBZ2jvfLOUnx+g1yi
         xorRejfFtYu5eK/IEwV5J5wr+aPUuNJccpwJueey5OwEjHf1Urd6ELT2A01i50SGjV0S
         Dq+3SRPWgOpkpW47P5+szIfVBhMdGFKqPvL/dG9OSANXJLYwzsCc3KemYSNv9eAHg3QQ
         yg0afYD3lFXb3mMHbmo1rmVK2Hpp949es49sMTzWtNU/Py6TpV36htRh5kJBbbw6MCRu
         fX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737632565; x=1738237365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3P39NTqsEmG+qD3A8uUKR2alt74v//DeAhcZsNNbA0=;
        b=l1ic5pDzdHhWMQ6CEJNUJELIvTsXqsgNkjEa2o1+mM1S5b95t/LttZKRQz9IcifjHX
         Qx566SuwRHRX43sW3DLDg6IAGkTokYdadUz1x+US2vPRIW0OSbhwvtaKSiRg5BXmD7U+
         stGttlV07zu8RVe7SejhlQo8IMj/D+lSKdIvVpAW8igKPe6EEL0Bah3lXLtyWRUImW5I
         9pOVP0w371Ed23XatLqNsS+lN9ohQFE7UY7K/aAqaFmBSKgGZ1HqbWunlNunbfXe7LBJ
         Am52QwBtBIHgM+IO0o6EHqVGL2rgVIbKIxwTm63hD0LFHv/mimkF6MCaF738Djh8tLtn
         dSlg==
X-Forwarded-Encrypted: i=1; AJvYcCVoadTQ75cHvn+FUOifi0Zwf/5TTgdYe2ip2ad2YYmFUnJV3ln9zZg8WhM8AgGpkImME86wyWO9NGHsmrp0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0OepQ0SOE2V7yUbj7Sht/MSKe4FZIIDwIJrPz+HRAGBmXYvsV
	D/g5m4cuE2r8smDjc7RmVgwj7Yt81ie2K4AiOCfdCEjvip8jsblV7JZlOJ215yk=
X-Gm-Gg: ASbGncsZe4UDiydIFPZiU9lAxnbx6aYthgQMnJV+61NNYOQq6y02mc3k450IHOZ7Z8c
	n+Z1tyfJNY1K40X3Ip6ZYrAdayXe+tN9a4ZglgiVAk6oGQVV+qm+wrcDkBqWbbQDhbvNfoAhXqd
	6Y1T8osUToIK3XBNAFaii3xmEOWsazK6kissnUo6WfkSNWj8+Bg9Ai9+6nn6sqho/Ur664Puz+5
	sFWlIhNLXP4OqHqMOXGE8p0d2W/rN6bd4MzHJ+1vuUr/7UN0qpIHPevRxUmdnvAw+At1PQTRjNN
	ZDFcQLkjf+H+M4EEOxXhIiEepnCT9mIpnvVNcmNwLdR3OvnfMz7ruSqpX1H2
X-Google-Smtp-Source: AGHT+IE+Ia87Yzw0G3ah3eRZORLnjYGt9PngsTrMv1Yrk3tLzpNB1AsQiaezzDF9LgUfWKQxNA3NSg==
X-Received: by 2002:a05:651c:896:b0:306:10d6:28b3 with SMTP id 38308e7fff4ca-3072ca5da94mr102237171fa.1.1737632565289;
        Thu, 23 Jan 2025 03:42:45 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a344579sm29966991fa.28.2025.01.23.03.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:42:44 -0800 (PST)
Date: Thu, 23 Jan 2025 13:42:43 +0200
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
Message-ID: <uqolptkewqkavtnb6wkc5o6hq6nmqe62mi7y43uu7td7vz722d@ddouvp2z46ti>
References: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
 <20250109-b4-sm8750-display-v1-8-b3f15faf4c97@linaro.org>
 <3p7kjok5jzwvgt7dxuad26xgdkjd52v4gbtuudvgkeoj33skqn@afl2ddtsq7s2>
 <4fc7fdd5-36cd-42e6-af4a-e0e429f9f50b@linaro.org>
 <7eupqawhdrbjgsj2p7e3ky7uj62m252i6dzkb6y23btocedp3q@qmw72nmbk2c4>
 <6ee02d22-7a00-4c7c-a5e9-63e91d7d84ba@linaro.org>
 <uyidfuh5ul5kcg4keeev6yagmjc5ksun626dyb6kdgwegc76d7@iu7ggdhgt5qr>
 <7255ae24-983d-452c-bd6d-85804c367f8f@linaro.org>
 <5irzvm4socrdjx3zqdxnogpai3bmfb52f63ddr3pisn5aa4jgf@mbc42kb3gyqd>
 <4adeffe7-ca07-4441-86fe-10a4891b7b4b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4adeffe7-ca07-4441-86fe-10a4891b7b4b@linaro.org>

On Thu, Jan 23, 2025 at 12:34:28PM +0100, Krzysztof Kozlowski wrote:
> On 13/01/2025 13:13, Dmitry Baryshkov wrote:
> > On Mon, Jan 13, 2025 at 12:02:54PM +0100, Krzysztof Kozlowski wrote:
> >> On 13/01/2025 09:29, Dmitry Baryshkov wrote:
> >>> On Fri, Jan 10, 2025 at 01:43:28PM +0100, Krzysztof Kozlowski wrote:
> >>>> On 10/01/2025 10:17, Dmitry Baryshkov wrote:
> >>>>> On Fri, Jan 10, 2025 at 09:59:26AM +0100, Krzysztof Kozlowski wrote:
> >>>>>> On 10/01/2025 00:18, Dmitry Baryshkov wrote:
> >>>>>>> On Thu, Jan 09, 2025 at 02:08:35PM +0100, Krzysztof Kozlowski wrote:
> >>>>>>>> Add support for DSI PHY v7.0 on Qualcomm SM8750 SoC which comes with two
> >>>>>>>> differences worth noting:
> >>>>>>>>
> >>>>>>>> 1. ICODE_ACCUM_STATUS_LOW and ALOG_OBSV_BUS_STATUS_1 registers - their
> >>>>>>>>    offsets were just switched.  Currently these registers are not used
> >>>>>>>>    in the driver, so the easiest is to document both but keep them
> >>>>>>>>    commented out to avoid conflict.
> >>>>>>>>
> >>>>>>>> 2. DSI PHY PLLs, the parents of pixel and byte clocks, cannot be used as
> >>>>>>>>    parents before they are prepared and initial rate is set.  Therefore
> >>>>>>>>    assigned-clock-parents are not working here and driver is responsible
> >>>>>>>>    for reparenting clocks with proper procedure: see dsi_clk_init_6g_v2_9().
> >>>>>>>
> >>>>>>> Isn't it a description of CLK_SET_PARENT_GATE and/or
> >>>>>>
> >>>>>> No - must be gated accross reparent - so opposite.
> >>>>>>
> >>>>>>> CLK_OPS_PARENT_ENABLE ?
> >>>>>>
> >>>>>> Yes, but does not work. Probably enabling parent, before
> >>>>>> assigned-clocks-parents, happens still too early:
> >>>>>>
> >>>>>> [    1.623554] DSI PLL(0) lock failed, status=0x00000000
> >>>>>> [    1.623556] PLL(0) lock failed
> >>>>>> [    1.624650] ------------[ cut here ]------------
> >>>>>> [    1.624651] disp_cc_mdss_byte0_clk_src: rcg didn't update its
> >>>>>> configuration.
> >>>>>>
> >>>>>> Or maybe something is missing in the DSI PHY PLL driver?
> >>>>>
> >>>>> Do you have the no-zero-freq workaround?
> >>>>
> >>>> Yes, it is necessary also for my variant. I did not include it here, but
> >>>> I should mention it in the cover letter.
> >>>
> >>> Could you please possibly backtrace the corresponding enable() calls?
> >>
> >>
> >> It's the same backtrace I shared some time ago in internal discussions:
> >> https://pastebin.com/kxUFgzD9
> >> Unless you ask for some other backtrace?
> >>
> >>> I'd let Stephen and/or Bjorn or Konrad to correct me, but I think that
> >>> such requirement should be handled by the framework instead of having
> >>> the drivers to manually reparent the clocks.
> >>
> >> I don't know how exactly you would like to solve it. The clocks can be
> >> reparented only after some other device specific enable sequence. It's
> >> the third device here, but not reflected in the clocks hierarchy. Maybe
> >> it's the result how entire Display device nodes were designed in the
> >> first place?
> >>
> >> Assigned clocks are between DSI PHY and DISP cc, but they are a property
> >> of DSI controller. This looks exactly too specific for core to handle
> >> and drivers, not framework, should manually reparent such clocks.
> >> Otherwise we need
> >> "clk_pre_prepare_callback_if_we_are_called_when_phy_is_disabled" sort of
> >> callback.
> > 
> > What kind of PHY programming is required? Is enabling the PLL enough or
> > does it need anything else? Are the PLL supplies properly enabled at
> > this point?
> > 
> 
> I don't know exactly and checking is tricky. I tried to use
> CLK_OPS_PARENT_ENABLE - with equivalent code, setting proper parents but
> without enabling the DSI PHY PLL manually just with
> CLK_OPS_PARENT_ENABLE - but then you have multiple:
> 
> dsi0_pll_bit_clk: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set

This really looks as if a part of the DSI PHY is unpowered. If you are
sure about your DSI and DSI PHY supplies (and power domains) then I also
have no other ideas.

Abhinav? Any input from your side? Or from Taniya Das?

> 
> So how do you supposed to test it? Any assigned-clocks-xxx will be way
> too early. Moving code around? Well, if I move preparing the DSI PLL
> clocks out of dsi_link_clk_set_rate_6g, then dsi_link_clk_set_rate_6g()
> will fail. Always and CLK_OPS_PARENT_ENABLE does not help because of above.
> 
> If you have specific code in mind, I can try it, but I don't see easy
> methods to see what has to be enabled exactly because of how everything
> is entangled together.
> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry

