Return-Path: <linux-arm-msm+bounces-43818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1B9A003CC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 06:53:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BBA177A102C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 05:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37E9917B402;
	Fri,  3 Jan 2025 05:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b7OXM25s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0712EAE6
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 05:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735883625; cv=none; b=OripKQUFmMPQ8mBZB4I2mNBAgL9xIbQDRWXXOtEE2F7PhK7d+Eco4CFvDoTOQ5TrYHudwYdebtWRnrwhvRM94+vr20M2KExkwOw4JakmFh836lqB6RVNnH4FzYzOGexX2n8fDvTEw9aCB5nhxE9Lvv4wKXYbHdKNT1nzpk/juW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735883625; c=relaxed/simple;
	bh=9t2As+jtUq0IPZelx4vsIQTfC86ba7b6Xn4wrXrpTmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=awKef9y/80PBVHRjvCD/HO6vuTsaUH2kr+GfAR+aNed/dOasPODQa1Qd094Ecr8gGt3diCjpzzxV2TH3b/owyDAo2lGXHOXvS6adof/qGPIIEs4H0KGc15AaIfMiewBRuxFjoQ0CDpqU5na8lW0/CTl+fCSdmj2AP0tO2QefRcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b7OXM25s; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3003943288bso139185361fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jan 2025 21:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735883621; x=1736488421; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qkNJoCoRxwm8ZQeZPnRrEVk8C3xCcSASIfrl093JjTY=;
        b=b7OXM25s53waMPAb85ni1Q5xt14kDxb8qrXbPm9/k3oOfkHE4MOiUH1mjobftWQdJ3
         BwzGbHiBppQrC411ngVZysm2cZH6Djg8dYM+9GhwLGOPcfTpqBIdeCgu1B7vCQSaNgf5
         yTjEQtRb4NtAj9kdIeUVdAWyrR0hJtEQB6ysPs3TumvGdzR04PHD13CJXOMZZ62MR14J
         jwGxSYiYmMB3AsW8JsIYbF/ush02rvIuLT1c+l0WP0qvNdQ63bxufgz8DYBId7btMpG/
         GudBBykGdExp5VxltilE18N3DpBtuHOfzqafmm/KIMZ8I5lz3jci9md2XuwJeEjKfbhc
         wOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735883621; x=1736488421;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qkNJoCoRxwm8ZQeZPnRrEVk8C3xCcSASIfrl093JjTY=;
        b=h62WJBwQ/WawAeZet82EB4FFY8+gNT0AKwppi2L0Z8xBskoaJ9U3RP8UuHUevoNqDP
         SEq9vPB5hMlzRxZzl75AG/fiSgKtvJ8HXgAX58ORTM5NL74Rhp48VOdsU9PHUinvi4iG
         EpKQ8fS43qeVPTgjrtEyCHixcutPSPyqAkuI5y2rCI54e2Iz83ggkIGxRLOSwRBRqqb8
         9GMfIKEQDhS3UVbUFv87LI1ROT0QKGkBESnP5Yj85fyLpgU42N1B7w7L+jhLHiBn8Ym6
         KhOOi+XMoLCyfFDUsFPtcwdiZ5z9IBuFzhnnd73/rziQr5fWyGYgS5uXmjpVVkn3i3jm
         ULQA==
X-Forwarded-Encrypted: i=1; AJvYcCWiNW92fieUYDDt20WUkUG9JeJDzXr5KlQ+1YIxMnh1vCZvmtsgVeBTAVEbvBUXhlVa6p+easXJME40kAXQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwkIZTi0ntxGz1HGyopHZx/MHnmcgI2FkSbZJGRMDqF6esX6Wsk
	M59btcJ6mQd0oQdU6/7jpl+sXKhcZjliwddDc1oyQHcmY/eXWO8VRemTDI5at0U=
X-Gm-Gg: ASbGnctnRJoBIz7abqObnjkCGfDrF9nwKFQy/Vxb8PrIVPxKAAJTsJfsT+zOp6wokXq
	jqmZgDSFjaB/9SMij5bFeWIFev0lppC/jZ1yXf3dDwIaaZXK4jSqkYR1PNcj5Axq47PK6A3zG9n
	RBZ5q9gmkKngHJ9A7WnHEiQw1kYDCV1MGea4sZ4y+9vQ/yHZWSANuAytn1hI69RSLdQBP+pj6bz
	8EhysL2akJWmCU2igvYeugmq1O3I/bdHPTKsTfXe7Zk2S6JRcRll5NFbG6zVC7azkjy9DmsJDI3
	JdtvH1KRWIiSHY0tBdcp5XWLJo9eOZAAH++W
X-Google-Smtp-Source: AGHT+IG9b0alQREkaEiHqtBXd0kh8iROWWQMPrCvlmWxXFXPKbF6MPDMv5RJZi4ZRl74MddqmbgBpA==
X-Received: by 2002:a05:6512:159d:b0:540:3594:aa3a with SMTP id 2adb3069b0e04-5422952553dmr12674147e87.5.1735883621351;
        Thu, 02 Jan 2025 21:53:41 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832a45sm4131895e87.255.2025.01.02.21.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 21:53:40 -0800 (PST)
Date: Fri, 3 Jan 2025 07:53:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 2/2] venus: pm_helpers: Use dev_pm_genpd_set_hwmode to
 switch GDSC mode on V4
Message-ID: <y62rarxwakcyd7vhrjvr4ufcp2idq6yec7ot3s3o2nbjflzlji@w7u5lvlcv2qh>
References: <20241223-switch_gdsc_mode-v2-0-eb5c96aee662@quicinc.com>
 <20241223-switch_gdsc_mode-v2-2-eb5c96aee662@quicinc.com>
 <5dexy2uc34b3kv532r45p6oaqn7v6bjohfdpwy42folvsdv6nd@skj7o35dflj2>
 <4d3a2d5a-3791-4bc8-a43d-6087e8c35619@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d3a2d5a-3791-4bc8-a43d-6087e8c35619@quicinc.com>

On Thu, Jan 02, 2025 at 11:47:22AM +0800, Renjiang Han wrote:
> 
> On 12/23/2024 7:41 PM, Dmitry Baryshkov wrote:
> > > diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> > > index 33a5a659c0ada0ca97eebb5522c5f349f95c49c7..a2062b366d4aedba3eb5e4be456a005847eaec0b 100644
> > > --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> > > +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> > > @@ -412,7 +412,7 @@ static int vcodec_control_v4(struct venus_core *core, u32 coreid, bool enable)
> > >   	u32 val;
> > >   	int ret;
> > > -	if (IS_V6(core))
> > > +	if (IS_V6(core) || IS_V4(core))
> > >   		return dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[coreid], !enable);
> > It is being called only for v4 and v6 targets. Drop the rest of the
> > function and inline the result. I'd suggest keeping it as two patches
> > though: this one which adds IS_V4() all over the place and the next one
> > which performs cleanup of the dead code.
>  Thanks for your comment. poweron_coreid(), poweroff_coreid() and
>  vcodec_control_v4() are called only for v4 and v6. I will clean up
>  the dead code with another patch.
> > 
> > >   	else if (coreid == VIDC_CORE_ID_1) {
> > >   		ctrl = core->wrapper_base + WRAPPER_VCODEC0_MMCC_POWER_CONTROL;
> > > @@ -450,7 +450,7 @@ static int poweroff_coreid(struct venus_core *core, unsigned int coreid_mask)
> > >   		vcodec_clks_disable(core, core->vcodec0_clks);
> > > -		if (!IS_V6(core)) {
> > > +		if (!IS_V6(core) && !IS_V4(core)) {
> > >   			ret = vcodec_control_v4(core, VIDC_CORE_ID_1, false);
> > >   			if (ret)
> > >   				return ret;
> > > @@ -468,7 +468,7 @@ static int poweroff_coreid(struct venus_core *core, unsigned int coreid_mask)
> > >   		vcodec_clks_disable(core, core->vcodec1_clks);
> > > -		if (!IS_V6(core)) {
> > > +		if (!IS_V6(core) && !IS_V4(core)) {
> > >   			ret = vcodec_control_v4(core, VIDC_CORE_ID_2, false);
> > The poweron_coreid() and poweroff_coreid() functions are called only for
> > v4 and v6. The v6 case was masked out earlier. Now you've removed the v4
> > case too. Can we drop such vcodec_control_v4() calls completely?
> 
>  I cleaned up the code, and finally vcodec_control_v4() looks like this.
> 
> static int vcodec_control_v4(struct venus_core *core, u32 coreid, bool
> enable)
> {
>     return dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[coreid],
> !enable);
> 
> }
> 
>  Functionally, we can drop vcodec_control_v4(), but architecturally, I
>  don’t recommend removing this function, because I think it’s easier to
>  read the code with this function.

One-line wrappers don't make the code easier to read. Please inline it.

-- 
With best wishes
Dmitry

