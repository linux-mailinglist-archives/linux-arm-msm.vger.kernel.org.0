Return-Path: <linux-arm-msm+bounces-47838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 413A1A333BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 00:58:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E439B1661FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 23:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125302512EE;
	Wed, 12 Feb 2025 23:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CaCuilnj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB5B126C05
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 23:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739404695; cv=none; b=iyVgWf4i47nc1EPiTUQRHXMXRmXAIXqKTKL+H3NSK4j1k+Czjp9uiw3jzxd9aYzT+a0ZRxYl0VcZCYHRfjLj/zxKcf8toAmI6MMiFNfMOUyjlBeYACEn9YH36spos2ooASBGUGtgkiKULwxX7qRDYoicXg3Tp0cpi6OmGZxGDY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739404695; c=relaxed/simple;
	bh=GXgapAEMfDI8VVTx7ozZlmThk7UNNcxIVlFjSwQ0cck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dKS9pGq0lAxtxBzHqqdyeVnx3UMBTRySyrxv1Ong9jQZUmZyUqpiPlaPRL8pZruYFx4qZAhlq4cqpSx9OW2zmMUK/t5cB17xMMvEWBkHbp+7izCEhsD19J407RPav1IpmLhAfsMDe3ndT/LGUE1Ndo6g9FoxCmYxZSkGHF15sdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CaCuilnj; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54298ec925bso287229e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 15:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739404690; x=1740009490; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3BAFGjYw2QJwqRQ3fFZmP6lC2tUfHuW+BgEHuxf/+t0=;
        b=CaCuilnjIWPpF4ADeVQXGfZ7luYwoLrRGN2wG90qNAw4IyevC8bmuRdugCantGWkKq
         nbdmG/e1OBijeG0at22T5kUlNHkj03zoQgXDE1yTPe4UnoQZYTldbgMCaeZtAxHKfHW7
         JKQfRruz91AtPY1mN5uAN9UZ5Oc74CwaYezK14Fr0OMifO9SuEF3zsPbsrQa1fCSyTcM
         PZgmHH6N+QYoLsKeAeVsPqpbZszcNfkuG8LXanV8KEqPUAl6P9VaYN4poqpI5iRfQjZv
         FJ6WmbvxQSBC675d7dqMw6Uc4QmGc4E2uCT7zNp6E9Y88rsNBS7fJzC6FhPRAU/don0Y
         iLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739404690; x=1740009490;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3BAFGjYw2QJwqRQ3fFZmP6lC2tUfHuW+BgEHuxf/+t0=;
        b=WthhpOaUrnJiHmPVR8KhlZd3/yy/JPlleoPyg8kN8v/uAn1jm86i8X6hoZDXf490Bc
         5rW6UMvDbPwrrKTfuxBxn8WmceIRsORb3w1rTcYB8dDZPYyietXG2tWa6+9KMlYg50lj
         e20DGbREBlbeo3q1l5Y5pWvHZ/nhhS1/7ek7BRff3LLghDpj7NOjtKI3/lOQqB14H2ud
         MIk9vf+ADgTZq3NAzXGwKxFEfdYOS3EX0yLT6Az4CHSEWzOXkag288VS/vzLxSVn0qEk
         tBokR6OH1/HwlJoJ63qjZyeAQcr1beoOud2dwDKuBDwpcAKiH3EppZTMehFqrqB9NS3u
         /flw==
X-Forwarded-Encrypted: i=1; AJvYcCWg4U281unz60Sz42jR/snydi8f6HrZxKWXmKMO1pyeD+RM5JT/E80BHD4WoUtANqrnvbftP5N0dy2kA3cT@vger.kernel.org
X-Gm-Message-State: AOJu0YxROEJRI1rHxGstpfQql35P/UzuHshrQ4gwoLcZtgDdSsSKQoyI
	nsHuseIfpDU/GnbBr+2QhskL698nGu4wfeWqiXaROJHnT97WWK3AXFNTluNeuII=
X-Gm-Gg: ASbGncs+nzRYTHPYoiA7HfXmPNtdHIPLpWcw5BNGEElyBwRimfJ5bdDXLr2V4qxi2ts
	/Thu9gGWDEYDhFnnXlc3UDHO/8ezBDFtQQHvPt4KFQ7X3/b9vgiiEBlrSDlQ8FWbef3N+OZav2S
	t4C3QomXBVEK8F6YJQ7bKyGULBRHEwAa8FVdsVrAd7Ff1yWFq0c2r9/FvgERKChujkY9bGQqHOy
	Bwyhb5Dbh3NSKH78OofVBwTShYp4qTJJM6/C0ncyGo5AKJ6xAFTa5KIsSMUKEVqwQg0xLeixb9S
	hzThD71DNjBT6BMvU2vijtXBUZeMtKqlvSUAyoIV2qOrTIlNRAXSKOCIppD+q1MtAVBfS9I=
X-Google-Smtp-Source: AGHT+IFOzevMzwSqrsW5SI2f6zfmPKiGi7Ag3hljzjdY6B6YmBgvHDwMJG1evRLjw+6YvkchrmUSAA==
X-Received: by 2002:ac2:465b:0:b0:545:1d25:460d with SMTP id 2adb3069b0e04-5451d255120mr480534e87.12.1739404689779;
        Wed, 12 Feb 2025 15:58:09 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f09ab70sm13305e87.78.2025.02.12.15.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 15:58:08 -0800 (PST)
Date: Thu, 13 Feb 2025 01:58:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: "James A. MacInnes" <james.a.macinnes@gmail.com>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Chandan Uddaraju <chandanu@codeaurora.org>, 
	Stephen Boyd <swboyd@chromium.org>, Vara Reddy <quic_varar@quicinc.com>, 
	Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Guenter Roeck <groeck@chromium.org>, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v2 1/2] drm/msm/dp: Disable wide bus support for SDM845
Message-ID: <dk7udmgj3mexlvxxoxvgwut6p3cv4faxhtcbqrikvfp6h6odi3@myp4sxi7nh5c>
References: <20250212-sdm845_dp-v2-0-4954e51458f4@gmail.com>
 <20250212-sdm845_dp-v2-1-4954e51458f4@gmail.com>
 <voecekzdacvrxedltgkiq5vwnaomchv2dryi6ukvk2xynw72wp@5nre7uesyvkk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <voecekzdacvrxedltgkiq5vwnaomchv2dryi6ukvk2xynw72wp@5nre7uesyvkk>

On Thu, Feb 13, 2025 at 12:41:02AM +0100, Marijn Suijten wrote:
> On 2025-02-12 15:03:46, James A. MacInnes wrote:
> > SDM845 DPU hardware is rev 4.0.0 per hardware documents.
> > Original patch to enable wide_bus operation did not take into account
> > the SDM845 and it got carried over by accident.
> > 
> > - Incorrect setting caused inoperable DisplayPort.
> > - Corrected by separating SDM845 into its own descriptor.
> 
> If anything I'd have appreciated to see our conversation in v1 pasted here
> verbatim which is of the right verbosity to explain this.  I can't do much with
> a list of two items.
> 
> I don't have a clearer way of explaining what all I find confusing about this
> description, so let me propose what I would have written if this was my patch
> instead:
> 
> 	When widebus was enabled for DisplayPort in commit c7c412202623 ("drm/msm/dp:
> 	enable widebus on all relevant chipsets") it was clarified that it is only
> 	supported on DPU 5.0.0 onwards which includes SC7180 on DPU revision 6.2.
> 	However, this patch missed that the description structure for SC7180 is also
> 	reused for SDM845 (because of identical io_start address) which is only DPU
> 	4.0.0, leading to a wrongly enbled widebus feature and corruption on that
> 	platform.
> 
> 	Create a separate msm_dp_desc_sdm845 structure for this SoC compatible,
> 	with the wide_bus_supported flag turned off.
> 
> 	Note that no other DisplayPort compatibles currently exist for SoCs older
> 	than DPU 4.0.0 besides SDM845.

With more or less similar commit message:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Hope I'm not considered being too picky.  I first sketch **how** the original
> patch created a problem, then explain how this patch is intending to fix it,
> and finally describe that we went a step further and ensured no other SoCs
> are suffering from a similar problem.
> 
> - Marijn
> 
> > 
> > Fixes: c7c412202623 ("drm/msm/dp: enable widebus on all relevant chipsets")
> > Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_display.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index aff51bb973eb..e30cccd63910 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -126,6 +126,11 @@ static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
> >  	{}
> >  };
> >  
> > +static const struct msm_dp_desc msm_dp_desc_sdm845[] = {
> > +	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0 },
> > +	{}
> > +};
> > +
> >  static const struct msm_dp_desc msm_dp_desc_sc7180[] = {
> >  	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> >  	{}
> > @@ -178,7 +183,7 @@ static const struct of_device_id msm_dp_dt_match[] = {
> >  	{ .compatible = "qcom,sc8180x-edp", .data = &msm_dp_desc_sc8180x },
> >  	{ .compatible = "qcom,sc8280xp-dp", .data = &msm_dp_desc_sc8280xp },
> >  	{ .compatible = "qcom,sc8280xp-edp", .data = &msm_dp_desc_sc8280xp },
> > -	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sc7180 },
> > +	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sdm845 },
> >  	{ .compatible = "qcom,sm8350-dp", .data = &msm_dp_desc_sc7180 },
> >  	{ .compatible = "qcom,sm8650-dp", .data = &msm_dp_desc_sm8650 },
> >  	{ .compatible = "qcom,x1e80100-dp", .data = &msm_dp_desc_x1e80100 },
> > 
> > -- 
> > 2.43.0
> > 

-- 
With best wishes
Dmitry

