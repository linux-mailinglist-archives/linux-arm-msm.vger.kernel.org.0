Return-Path: <linux-arm-msm+bounces-49740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1160A485CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 17:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A834D1732E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 16:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 422FF1B394E;
	Thu, 27 Feb 2025 16:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHnkUzWJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAF614EC5B;
	Thu, 27 Feb 2025 16:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740674784; cv=none; b=ONo7sM4pVdQYAmqosm93JSM8kSFF/I2QxrHBnoD2JbVx1OWepHE/7Im/ZYUsfz81TRdOltPYAVdwhox+6ehYOzyrTsiatcM4l9nePU59VK1Yt1vyPLhQnuFmeMS1Ovg1dI8n48CagxOHU2/KETYIfY6rrB6Fu0RNBNy5Xkyt5w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740674784; c=relaxed/simple;
	bh=rnGxcvGrlOu9S8hRsJDfy1plNsFwEiDmUYFSaKrM2so=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uwJQ6imaCpkO2dd7xhTiOTZqm2qZccjKH1Xpk8yzRxTgg/Z7auLotWSBPGmbsHsTpPk21PFN3h5d3520ETJSSfZUYo9bvD/NQkzzfU3Rcg6hflBTyjLVjmXI86mu5XAs42tZwDRZKLRHj2Uduk4hPaWP8ATZZ0+IYL3inm5suJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHnkUzWJ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22356471820so16750995ad.0;
        Thu, 27 Feb 2025 08:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740674782; x=1741279582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRXDCZOpNFx7mEL7sD+vJQzvlE2qaUafze4CTsh+P/M=;
        b=KHnkUzWJnGd7j8+xLvr3ixfvZJHoowxna7z2uMhuuGjhoR8uG9pQWMMbvMbqTCUtBM
         qd5SIIaZq+GFtPtNoSvfi9zB1aqesxm58Y5KK+uhbL+YU1w2vP8QMljChwJ6QJdhr40C
         v5/v77G7vBW7+R0UZQ9SFUooTayk4KBRxIr67YjY0rv+YozPRmuHc7GYrcPnDhFzUO1E
         pCmeNUjjpz6DKY9fYgNqKUtriX6Uef+fPmyr3YGtPCxb39RCRbsCdSeouK4bzpUwQIB6
         l40so+jLsYaZXjpyTTmIoUVMlRjGClN6Vs0zhANZx0Etr25SZgGBkXaDH7mIzEUEPYlp
         plwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740674782; x=1741279582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DRXDCZOpNFx7mEL7sD+vJQzvlE2qaUafze4CTsh+P/M=;
        b=Z6BRpW36QCR1ZQZFFEtGzNpvlvKA4zWkNYJkt8xCmbxVrbHzpwo1apW0LiQ6MtCBcU
         yZUQRl1NKgZ2xfs2RwVevKBMdIG7W+btfBam+gqqQHvV59ZTnJP9t4D7AI0qrisfeUnh
         M5wZx2yGYfinud3P6YGTl4nTwnOoH7B0KV2seGAPHcRlkGaED++DgRSa15Xe71ayx7+D
         Tq/WFtbdPU12Jm7sX8HY9aHItBUSi3FwlFwUawXh/C662HfjqhId9KA5nUUAVAw/+ofH
         aDiglE/qpeUQJa2b1RelKkcLSMAzY18FXTH9HWoI1qA7sR8U7mUvVH1pMrQJnGkLzrIM
         m4TQ==
X-Forwarded-Encrypted: i=1; AJvYcCW98Obyta1LTuQBlY+uHWTCWXe1IihXRzvRhzaUZEwe5B1Gv1sdhhsS84UWDLvAWdsZatYV8PHPAqtbZwkj@vger.kernel.org, AJvYcCXJXJ3W/73oFxzu4fY9uwula9RYtq7+n1ZeJ6bGKUIbATWf4feHlbiOgaS+aoWzjZP2eXOm2zJz/agM8Ol8@vger.kernel.org
X-Gm-Message-State: AOJu0Yzny7+0DYtnl4/4R7apM9T1GgHa8wIDdwefImJmaU01rGXkydAY
	osG3a6u18JbqMTDEZqJPDMLvFpgN8/AOp1CRf0lfm0ag4jKA5hbv
X-Gm-Gg: ASbGncv3hINpTEZ1URmzmzTrht9GzZauOZn3vyqoUBMs0jlXEiYcZ/H1lClN7Pc71aP
	0T/5fl8ZwpuLQy74CH6KHkMaWWtpe76/AF93ci/SmGGMP9FPqRd3PEHDHy0Sir7F1foXZCZDjh5
	41X/VVt6kV3HdFLS0mf6VM2GqAwfFhpW9+Avr1GzzMW97uEoP9m9/mtDQ5pRNMrBHtPSNzNF5cV
	zO4jDC7CH9dk86jeee+nyes2wcwF0ZLE6c2Rj8Pku2TtB34FttM+Ld5TgojRu1sWYiFFe4AM1yo
	2Gs+8cFPKRBjPS4A8jJoHnWV2P82Zj8rWZphB+jC/Vyfc/f4pibu
X-Google-Smtp-Source: AGHT+IGSorrpazKalpJZWfzSOXdCZYUFDo74/mLdsFxqv0//LTvqdmRqtXwe49OfXxH70F6yYFLubQ==
X-Received: by 2002:a17:902:e946:b0:223:5945:ffd5 with SMTP id d9443c01a7336-22359460062mr37537585ad.32.1740674781845;
        Thu, 27 Feb 2025 08:46:21 -0800 (PST)
Received: from jamesmacinnes-VirtualBox ([66.119.214.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504dc7e1sm17097255ad.176.2025.02.27.08.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 08:46:21 -0800 (PST)
Date: Thu, 27 Feb 2025 08:46:14 -0800
From: "James A. MacInnes" <james.a.macinnes@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Chandan Uddaraju <chandanu@codeaurora.org>, Stephen Boyd
 <swboyd@chromium.org>, Vara Reddy <quic_varar@quicinc.com>, Tanmay Shah
 <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, Rob
 Clark <robdclark@chromium.org>
Subject: Re: [PATCH v2 1/2] drm/msm/dp: Disable wide bus support for SDM845
Message-ID: <20250227084614.527e428d@jamesmacinnes-VirtualBox>
In-Reply-To: <dk7udmgj3mexlvxxoxvgwut6p3cv4faxhtcbqrikvfp6h6odi3@myp4sxi7nh5c>
References: <20250212-sdm845_dp-v2-0-4954e51458f4@gmail.com>
	<20250212-sdm845_dp-v2-1-4954e51458f4@gmail.com>
	<voecekzdacvrxedltgkiq5vwnaomchv2dryi6ukvk2xynw72wp@5nre7uesyvkk>
	<dk7udmgj3mexlvxxoxvgwut6p3cv4faxhtcbqrikvfp6h6odi3@myp4sxi7nh5c>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 13 Feb 2025 01:58:06 +0200
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On Thu, Feb 13, 2025 at 12:41:02AM +0100, Marijn Suijten wrote:
> > On 2025-02-12 15:03:46, James A. MacInnes wrote:  
> > > SDM845 DPU hardware is rev 4.0.0 per hardware documents.
> > > Original patch to enable wide_bus operation did not take into
> > > account the SDM845 and it got carried over by accident.
> > > 
> > > - Incorrect setting caused inoperable DisplayPort.
> > > - Corrected by separating SDM845 into its own descriptor.  
> > 
> > If anything I'd have appreciated to see our conversation in v1
> > pasted here verbatim which is of the right verbosity to explain
> > this.  I can't do much with a list of two items.
> > 
> > I don't have a clearer way of explaining what all I find confusing
> > about this description, so let me propose what I would have written
> > if this was my patch instead:
> > 
> > 	When widebus was enabled for DisplayPort in commit
> > c7c412202623 ("drm/msm/dp: enable widebus on all relevant
> > chipsets") it was clarified that it is only supported on DPU 5.0.0
> > onwards which includes SC7180 on DPU revision 6.2. However, this
> > patch missed that the description structure for SC7180 is also
> > reused for SDM845 (because of identical io_start address) which is
> > only DPU 4.0.0, leading to a wrongly enbled widebus feature and
> > corruption on that platform.
> > 
> > 	Create a separate msm_dp_desc_sdm845 structure for this SoC
> > compatible, with the wide_bus_supported flag turned off.
> > 
> > 	Note that no other DisplayPort compatibles currently exist
> > for SoCs older than DPU 4.0.0 besides SDM845.  
> 
> With more or less similar commit message:
> 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> 
> > 
> > Hope I'm not considered being too picky.  I first sketch **how**
> > the original patch created a problem, then explain how this patch
> > is intending to fix it, and finally describe that we went a step
> > further and ensured no other SoCs are suffering from a similar
> > problem.
> > 
> > - Marijn
> >
Not too picky at all. I will use your text. I apologize as I had changed
the cover instead of the patch. I will do my best to balance too many
words and not enough.

Would it be appropriate to split this patch and the other into separate
submissions?

Thank you again.

 - James

> > > 
> > > Fixes: c7c412202623 ("drm/msm/dp: enable widebus on all relevant
> > > chipsets") Signed-off-by: James A. MacInnes
> > > <james.a.macinnes@gmail.com> ---
> > >  drivers/gpu/drm/msm/dp/dp_display.c | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> > > b/drivers/gpu/drm/msm/dp/dp_display.c index
> > > aff51bb973eb..e30cccd63910 100644 ---
> > > a/drivers/gpu/drm/msm/dp/dp_display.c +++
> > > b/drivers/gpu/drm/msm/dp/dp_display.c @@ -126,6 +126,11 @@ static
> > > const struct msm_dp_desc msm_dp_desc_sa8775p[] = { {}
> > >  };
> > >  
> > > +static const struct msm_dp_desc msm_dp_desc_sdm845[] = {
> > > +	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0 },
> > > +	{}
> > > +};
> > > +
> > >  static const struct msm_dp_desc msm_dp_desc_sc7180[] = {
> > >  	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0,
> > > .wide_bus_supported = true }, {}
> > > @@ -178,7 +183,7 @@ static const struct of_device_id
> > > msm_dp_dt_match[] = { { .compatible = "qcom,sc8180x-edp", .data =
> > > &msm_dp_desc_sc8180x }, { .compatible = "qcom,sc8280xp-dp", .data
> > > = &msm_dp_desc_sc8280xp }, { .compatible = "qcom,sc8280xp-edp",
> > > .data = &msm_dp_desc_sc8280xp },
> > > -	{ .compatible = "qcom,sdm845-dp", .data =
> > > &msm_dp_desc_sc7180 },
> > > +	{ .compatible = "qcom,sdm845-dp", .data =
> > > &msm_dp_desc_sdm845 }, { .compatible = "qcom,sm8350-dp", .data =
> > > &msm_dp_desc_sc7180 }, { .compatible = "qcom,sm8650-dp", .data =
> > > &msm_dp_desc_sm8650 }, { .compatible = "qcom,x1e80100-dp", .data
> > > = &msm_dp_desc_x1e80100 },
> > > 
> > > -- 
> > > 2.43.0
> > >   
> 


