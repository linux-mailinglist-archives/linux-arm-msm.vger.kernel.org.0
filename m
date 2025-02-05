Return-Path: <linux-arm-msm+bounces-46957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A51DA29276
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 16:01:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0B6B3ADEC8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 14:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E4217ADF8;
	Wed,  5 Feb 2025 14:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SX2B4QGG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0DC193436
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Feb 2025 14:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738767109; cv=none; b=XzdFFPZXYf6Vmj5WoutCWV8qnHvmdPv1Jhg3PJK9HEajfzRQW/aMPTnZIV32nzG773dzc4qz12DTkjisd+3CDUybxbXsJSBZ/nZ3amRr1OAmVRsmMD5gK9mcnG2uGgVWCFGGkqnPA6FGhb/dAiqfZJ4FSclyHW4YAJ0YTmmpRmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738767109; c=relaxed/simple;
	bh=QYcp3HmoF0871IrSJxxz1VhiNKOgjRIr98gIlJZrNxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qg7Uj7u2OZQWpu+N84OBdG4En/PNwiLbReUEFqRJ5RLdNHzdTfbfxHKuPAwzLcR5ykkzuJZ1RmxG+A/HrEziOF5BrtSWFU8t4xQt5BS6cEpfdofLTS180Z0MATY1yq3+Y1pqSKG1FAjG+p2i4XUZATsoYOi8KR39FuV3dqp73Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SX2B4QGG; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5440d1f506aso61431e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Feb 2025 06:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738767105; x=1739371905; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LeT7aX20SX+o+IXO25YPOzITrejkM0fcygYCYn3nK6U=;
        b=SX2B4QGGwTvTnbUU6L1c47Rhvb4v5a0uWbB/x7h7jGRkC261bKpT9fXks7jeuUQm+v
         iaCBnwjqhdA3zXJm3exEn3Zs7S8p5foNi0Bdh/qmtQMSMGkCcRkuIH5OyicPSmGTqeEZ
         TmvrrIl3JWAkqiUXMA7aecmrFlvit/7bxBPPoCXuSc9nXEQd0QNdwCDWlCQD8YCvngN9
         qv535+JwrqnT0N8mtAD8Qld85A4cYaMkCE4zucVLkWRY7oWq7aja85lYznDyn/OCzA1T
         mS/A6lqMn68/sKAccpQCZGjQjTS7MwHU674LG3CIRHOvhsy7N+SS9/hPKzIcxndK3PU9
         ysaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738767105; x=1739371905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LeT7aX20SX+o+IXO25YPOzITrejkM0fcygYCYn3nK6U=;
        b=GLvt4shc9mtsoQuE0cvosOTPQS8IYyL5vYaol71jigcOMTpXjuyr2pRmmRMxMb5m16
         Gm8JhnonzY+8aJ+/zW6DZN2m5j7B/5bBGmU0kDKUwErRdxjTqP2W5aaCM24WRYeiqDGG
         4/hQdj5JY2u+QzM2R4hL6aVBlfccb5WDGM+G65eIuZkG4X09RJGNjziS5HyprcglHuo3
         1jSq0/lha92WAA4V0LQLxmOjPpwMQPo9UTf3CJHI8IPhm+yKzTvTPKJ5zHj7So+KyPbF
         4Y7hkl4F+2IdUAu0Ml6QhgAE94EBEDoHKQ3LjB2hcI8mX4cEB5QoC5AsT7+H25K8RD9D
         bJqw==
X-Forwarded-Encrypted: i=1; AJvYcCW/2FwZ9KQAig0gJ/TfJBx+PeUnQYmWZb4Wrzpt1i1WVcps3eD83fv4PapQzlFTNks6qd7UxwVT5d7oN07/@vger.kernel.org
X-Gm-Message-State: AOJu0YyfYw0HUyavrZWj+DkK5/BJ12kcKHdnE4HjWtPSyg9YVmtgVdyu
	Gt11daciohDxt9225iGRYle0KM+cdbzYaAlUpGIAsvzTRustKHS6uH0cCj2QZ1U=
X-Gm-Gg: ASbGncvYCN5bvHVMAB0gxJa/aAlNk7GbiwC+diLW5HRmr6mctOrm3Qw/jDQfCUdwoH9
	BTu+MoYVAcVc0mBqMfIXCDqDX5jAFdAWUx1Kp2HTrzfYVM1K6fJUpqEOQSMpdDVPsi2UUPA0AyM
	m45UPdl4OmNoaaIxsXurDMd6WjjNeYSU/YTryw/InhAIgemKJiikFTY1qJtfvnX+SDC8r4Z+Z2X
	TbPFgFZWBg4hKWZoBxpIkGOd3AsX/ZMR1CqBwLy/9m7qWfDTmgRZcKbTBNth7JQnA5u7ljI29NJ
	8xg+pMu3dGeuU1ix/W3uWfBqEpKJjoT9I9rh2YUhunlI/aQTGTOSSMc+o0c9Vq/DnJzShuY=
X-Google-Smtp-Source: AGHT+IHMwGQWUkbLcKi3Dfig/vQU6Jh5hxSytEhR95OvEgmcrJUUat9hAQK1cv5aJz4+KdddNT2XSw==
X-Received: by 2002:a05:6512:31c1:b0:540:1fd9:b634 with SMTP id 2adb3069b0e04-54405a4245dmr1174059e87.34.1738767105316;
        Wed, 05 Feb 2025 06:51:45 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54408acef1fsm50345e87.41.2025.02.05.06.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 06:51:44 -0800 (PST)
Date: Wed, 5 Feb 2025 16:51:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
Message-ID: <54y7vatcrenfty5n2z2i25w7dnjo7j4fhg2rb36f54e4dogd2b@geea3s4zlrmq>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-2-862b136c5d22@linaro.org>
 <u4qho7u2nu2x6qxkfxpeakotmbdgoha3e5csmsamaanlxziiif@22kzxupzibj7>
 <12275e11-eadc-48be-b8c3-9463cdf92698@linaro.org>
 <vfqfbpxc3zrerrb2hyis6h4kgk7aqfljwb7sxlduwlkqprmodg@rjjfsgwr5c6j>
 <2e96ae62-3114-4c7b-bea7-27f6e2009634@linaro.org>
 <t4zn2gv3mbn3nqlh5h3l3ej5zxs4wa74ncgymonci7v45w47ai@qmmtxbelichw>
 <6cba59b9-4852-4cad-95eb-dfecb2e44dc4@linaro.org>
 <CAA8EJppUkLYfHUcNcJA5or4ZVJsbTe74a6GGV1CR6zqCWmVjRA@mail.gmail.com>
 <1ac208a7-ec63-42fe-b496-5a2e7fd615f2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ac208a7-ec63-42fe-b496-5a2e7fd615f2@linaro.org>

On Wed, Feb 05, 2025 at 02:42:03PM +0100, Krzysztof Kozlowski wrote:
> On 05/02/2025 12:23, Dmitry Baryshkov wrote:
> >>>>>>>> +
> >>>>>>>> +static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
> >>>>>>>> +{
> >>>>>>>> +        dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
> >>>>>>>>  }
> >>>>>>>>
> >>>>>>>>  static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
> >>>>>>>>  {
> >>>>>>>> -        u32 data;
> >>>>>>>> +        u32 cfg_1 = BIT(5) | BIT(4);
> >>>>>>>
> >>>>>>> Please define these two bits too.
> >>>>>>
> >>>>>> Why? They were not defined before. This only moving existing code.
> >>>>>
> >>>>> Previously it was just a bit magic. Currently you are adding them as
> >>>>
> >>>> No, previous code:
> >>>>
> >>>> writel(data | BIT(5) | BIT(4), pll->phy->base +
> >>>> REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >>>>
> >>>> This is a mask and update in the same time, because:
> >>>>      (data & (BIT(5) | BIT(4)) | BIT(5) | BIT(4)
> >>>> is just redudant.
> >>>>
> >>>> I did not do any logical change, I did not add any mask or field.
> >>>> Everything was already there.
> >>>
> >>> Yes... and no. Previously it was just writel(foo | BIT(5) | BIT(4)). Now
> >>
> >> You did not address my comment. Previous code was:
> >>
> >> (foo & (BIT(5) | BIT(4)) | BIT(5) | BIT(4)
> >>
> >> Just for shorter syntax it was written different way:
> >>
> >> foo | BIT(5) | BIT(4)
> > 
> > Previously it was a simple writel() with some bit magic. Now you call
> 
> 
> The mask was already there, just implied.
> 
> > dsi_pll_cmn_clk_cfg1_update() passing the register bit field through
> > the 'mask' argument. I'm asking to get those masks defined. Is it
> > possible?
> 
> Just like before, because implied mask is being removed due to code
> redundancy.
> 
> I repeat it for third time already.
> 
> > 
> > Yes, the code is equivalent and results in the same values being
> > written to the same registers.
> > At the same time you have added a logical entity, a masked write. I
> > want to be able to understand if bits 4 and 5 are a part of the same
> > register field or they belong to two different fields and can be
> 
> I know you want to understand it and this is achieved in separate patch,
> because understanding this is not related to this commit.
> 
> > written separately. I really don't understand why are we spending so
> > much time arguing about a simple #define. Okay, in case of drm/msm it
> > is not a #define, it is <reg><bitfield/></reg>. The net result is the
> > same.
> 
> I also don't get why simple fix could not be just applied and it has to
> become some sort of big refactoring.

Well, you have refactored that in this patch. Anyway. Please post the
next iteration, let's continue the dicussion there.

> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry

