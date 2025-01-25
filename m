Return-Path: <linux-arm-msm+bounces-46117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFD4A1C004
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jan 2025 02:02:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E86A7A2C71
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jan 2025 01:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB7F779F2;
	Sat, 25 Jan 2025 01:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rG5nBplP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866474A05
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jan 2025 01:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737766970; cv=none; b=SNv+DNrLb13ovBil1TfrsBBcIJey0ZcBMGzL2SFPIyHwHaohJXLqkshRzekMcg3dXrHXtpVU+l2KngI54MYSvd92+0H1D/EfCmLxjK+7wc9nVPswEWM6AMOkiCIG86Wqb4Ad5YPaAanvrck0qKnoNqz/TiSb2zM5STTSNtoFs+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737766970; c=relaxed/simple;
	bh=7CMP11BOpQAgqEvg1pjuoZuFiYyngm+ytHB4FFY/3vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBg2fILFEmJdXYyox/DlxcAotLSbBLKZRgEHYgpBflTsqqzuA8Q1ihzugubIvxviY7mWNp4etV6xTve+fUVLa6Rx6gyREIjXPJMsZYFNy7yyOam0I0WYexnjKgdifBV/Q8Q1ffUs/oU3BRTd96P/ryoV3QzOwnT14lrJioCkp8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rG5nBplP; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-542af38ecd6so3236660e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 17:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737766966; x=1738371766; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a6C+SgRrtiXf7vPRyprsO7OZUY7tpAxx9NBtUiIiTKk=;
        b=rG5nBplPdXLXR50pE448I0CVrQNpRtBN8xdkNVmUUEnmTtnX5aQx7hpsaJc1KZRW2M
         jBz/rwapjZB4YdsBHWpcImKhq7S/d36w2gJPEbgW7WBH40zLxag3EqrNps1kB35adx+Q
         jDovrxAbC9B9xf7AIUQYl9OjbS/D5eSyUWynGOg/IbRJS6ai0wKrPKWPf2yCIBXZHVc9
         ZJukytX0XyIt+nMoukcv3YWmZ5zbOCXU1UzR1maPJYxBU9ZRwBhwLMczQM/UspmN0mNV
         ejqt6bhE44jJZ1EwtLBAgnRNjLi7elGjKgRsYmOhQ/N2sMr6QPv7cezFgPQp9bvF3Ut0
         v2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737766966; x=1738371766;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a6C+SgRrtiXf7vPRyprsO7OZUY7tpAxx9NBtUiIiTKk=;
        b=Vsbt1R7ywLzNGg03VFriQCDsPzW84VGFQVDyfbfaH8cIbxGwnU2AfrJX29KhHWkQlu
         5hDkaQ0YMpTdg8fojCW9Om8/SKrkbYdnNMItkvxRSfyvn5vdMjnC+WY5rV1l4UQNFzyc
         1tb4IGm4qtrZb6Iy6M2K4SGbz/TxRMA6+hRTmxpG92gFpT7RUWWgL1MUS9AKGFa6W0Vm
         exQdx+ylJOjV4LruY4iuKd+oWCkhUrR5ii4Mao9m5oJecpWxoaXmo7rskHSUCab/zRkI
         eci/Dn3K59tmXNVOh2gcWZQMTQ8reVovOnEna/R4+XYNdLPsigRHjoG3QAJitzutbxeq
         JwNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLHAcofQ3Td8IW6S0Ya0truH1vs1qDZRPFlXtT9qIC7n54MgmvFaPHm/I/9/kgwM87tOSgrOX5Qmbi6qQr@vger.kernel.org
X-Gm-Message-State: AOJu0YzoYlRTPlLTifE+vcB003GqPD/IFx/ZCLaFEaMV0VBnRsvfAz1O
	MhUFSvvwj4j0juqI8BZhRW0FBFwI05qK2NWJlR3ngJrXUoMAz8Wre3ZCDryHdEk=
X-Gm-Gg: ASbGnctmifYc+fXAKFhpSiKJDec518p3NNsuCicQ4GX5lCYZIhzn87OgNNdns0t8E2c
	3es0UB1HDhEfDjtK0trsO/hybAlg7n5cGjaoU3jg+tkhs5TBZneEnJOjy9GRfc90uI6HzuMEIF1
	3isvBBT34gxpZBL0WDWFcbknLDCXuxDIabFv3C4N4ZRBrTXWDbafCVd97x9hIa+M6NIzFodabjh
	HrJYwvze0iCpdPYGIPDF1GudrZsUjInWgw6j7dAP/pbuuCqUNOFcRnFM8CJC88ai8b1vKlYiaCg
	EB/8W2IjCy9ETDzlrFadTwOaBK+keKg2kwu9VQl2CV1xQqqK/j1n7CWtO2nS
X-Google-Smtp-Source: AGHT+IEbZ6iG9+yKkLLJdzC1wezeMeBsLCnkr6N0mg2c/nWG6aYfQmHCK0uUZF5Kk168cXdcXA41dw==
X-Received: by 2002:a05:6512:3d0:b0:542:6d01:f548 with SMTP id 2adb3069b0e04-5439c22d6bamr9856712e87.5.1737766966484;
        Fri, 24 Jan 2025 17:02:46 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c822f965sm456326e87.91.2025.01.24.17.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 17:02:45 -0800 (PST)
Date: Sat, 25 Jan 2025 03:02:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 18/35] drm/msm/dpu: get rid of DPU_PINGPONG_DSC
Message-ID: <3v7t7al43nol6ogrttzrqhpwazw4v2ocooqbeuqsgpnlzmaf5w@i2ijk5pwir6j>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
 <20241214-dpu-drop-features-v1-18-988f0662cb7e@linaro.org>
 <1b429f3f-2fff-45bb-86dd-48b1d164ccc8@quicinc.com>
 <c3c70f9a-7a1c-4575-af93-b519117d0084@quicinc.com>
 <esyb2hdp3rutcoiblqnxshta3x47ymdyotphasliprmkp643ic@eyopzwlihcpk>
 <7dc1f356-b1e0-4bca-bfb9-8de3717407bc@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7dc1f356-b1e0-4bca-bfb9-8de3717407bc@quicinc.com>

On Fri, Jan 24, 2025 at 04:08:17PM -0800, Abhinav Kumar wrote:
> 
> 
> On 1/23/2025 9:19 PM, Dmitry Baryshkov wrote:
> > On Thu, Jan 23, 2025 at 01:41:14PM -0800, Abhinav Kumar wrote:
> > > 
> > > 
> > > On 1/23/2025 1:32 PM, Abhinav Kumar wrote:
> > > > 
> > > > 
> > > > On 12/13/2024 2:14 PM, Dmitry Baryshkov wrote:
> > > > > Continue migration to the MDSS-revision based checks and replace
> > > > > DPU_PINGPONG_DSC feature bit with the core_major_ver < 7 check.
> > > > > 
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > ---
> > > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h |  2 --
> > > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h |  1 -
> > > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h |  2 --
> > > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  |  6 ++----
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 10
> > > > > ++--------
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           |  2 --
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c          |  2 +-
> > > > >    7 files changed, 5 insertions(+), 20 deletions(-)
> > > > > 
> > > > 
> > > > <snip>
> > > > 
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> > > > > b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> > > > > index 36c0ec775b92036eaab26e1fa5331579651ac27c..49e03ecee9e8b567a3f809b977deb83731006ac0
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> > > > > @@ -319,7 +319,7 @@ struct dpu_hw_pingpong
> > > > > *dpu_hw_pingpong_init(struct drm_device *dev,
> > > > >            c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
> > > > >        }
> > > > > -    if (test_bit(DPU_PINGPONG_DSC, &cfg->features)) {
> > > > > +    if (mdss_rev->core_major_ver < 7) {
> > > > >            c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
> > > > >            c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
> > > > >            c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
> > > > > 
> > > > 
> > > > So far in this series, we replaced the feature bits with >= checks of
> > > > core_revisions. That kind of works as usually feature bits get added
> > > > after a specific version.
> > > > 
> > > > With this patch and later, whenever we use < checks it gets a bit tricky
> > > > as we might also need an upper bound. Feature bits gave individual
> > > > control of chipsets but generalizing that all chipsets < 7 have PP DSC
> > > > is also not correct. I have to really cross-check but there could be
> > > > some old chipsets which do not have DSC at all.
> > > 
> > > This raises another question as well.
> > > 
> > > what if some register was introduced >= X version but was then dropped in a
> > > newer chipset.
> > > 
> > > Is it not difficult for the user to go back to the files of each of the
> > > sub-blocks and alter these checks rather than just fixing up the catalog.
> > 
> > Well, the obvious example we are going to have is the CTL_LAYER_EXT4,
> > but if I understand correctly the whole block is going to be dropped, so
> > maybe it's not that relevant.
> > 
> > Another example might be CWB, where we are going to have 5.x-7.x and
> > 8.x+ DPU ranges.
> > 
> > Basically, yes, when adding support for a new platform we have to audit
> > HW blocks. But this applied even beforehand, where new platforms could
> > be drooping existing regs (8.x+ dropping a part of the TOP region).
> > 
> 
> Right, I am wondering what is the trade-off here.
> 
> 1) Feature bits allow selective control for every chipset. IOW, the specific
> version is already checked for. I do admit that I have seen errors about
> using the correct feature mask sometimes but even with this change, evey
> developer will need to go and check every sub-block file which they might
> not even know about.
> 
> 2) core_revision certainly can generalize but we might still need absolute
> versions for some of the bits anyway. So the checks may not always be >= or
> < but it could also end up with something like
> 
> if (major_rev == xxx && minor_rev == yyy)
> 	ops = ops_a;
> else if (major_rev == aaa &&& minor_rev == bbb)
> 	ops = ops_b
> 
> So the revision check will most likely end up being more complicated than
> simple range checks. With each catalog feature bit atleast we are guaranteed
> that its applied only to that revision.

Yes... However I'd prefer uniformity. In other words, if we started
using core revisions, let's use just it. Having core revision in some
places and feature bits in some other places sounds like an easy way to
confuse developers.

> 
> I do see in the cover letter, about incorrect feature bits sometimes used
> but I am trying to assess the trade-offs even with this approach.

Sure :-)

-- 
With best wishes
Dmitry

