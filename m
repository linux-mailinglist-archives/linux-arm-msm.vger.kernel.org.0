Return-Path: <linux-arm-msm+bounces-47845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1FFA3355A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 03:13:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2143D188A63C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 02:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99879146588;
	Thu, 13 Feb 2025 02:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HyyqECEt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE62BA2D
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 02:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739412794; cv=none; b=ZeT0+YSMRddmO1CUQSSrcjPrQW1CLfzYV22hxpQWJNrYPqL+Tg34kViZ87sUm2NolEGR8MAx5lvRxmACsWZ28qdjf+cHeqgBubKLvSZ66F5R3HpnUWPikhtq+acpeg865DHd6vMT2fiz4f1wl6wkLO6ClgovxHRRsBWIzvWK7Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739412794; c=relaxed/simple;
	bh=8MJIRbb7WsM8a3n0MKIH5Jbu69Pr1rZ/BDRDPU7I4wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=scPBULV9/H58rJvDWhF5HFzkkWnPjQJ+IWiYg+NAK9mlfyO6h18hE9vwpx5HrZdrPpkAjN2+rDhuha+6N993J1g8I0cwWd0QcMYvQ8MAPyyR45C6LjnlBYqYO0pdjwE0B6OMQ3WcX8VAuPT1RC4eS49H1XYjTnsygLZV1jUXS0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HyyqECEt; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-308e3bd8286so3765721fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 18:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739412790; x=1740017590; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JGMi3Hp+9/bQmjultqdLIF1nZcd4s1BR7J7PwlZZx/0=;
        b=HyyqECEt1uqagSxdVMcR85dODeGb63118e6yXi/xPpEF7dW0RfzmKx+DR/qaEISmkv
         4/mAVvDfvkQwOE4mYiNpK4KusiCYNYQvTt6Eo7iE/E6SQgfIooDb7TaauouqkSNn3usc
         py5OuQWLp5DrrS+zxxXklL2amh07DGjlh2Ak6M7+2i1jWlkmogC22/zOADCtYO27vb91
         b4lxkgWN50V0TpJcwRDlC1L/bUu965U4Q5XJSwe60PYQACYbCKo8UYCNSXiUuBYrR0Le
         SLC8r5G0xza4vGWytySZzCmgCwt5wRTZwQIpqaJeDYBY1CyAE3l39jEoO7A+LLXbNXg0
         /DTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739412790; x=1740017590;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JGMi3Hp+9/bQmjultqdLIF1nZcd4s1BR7J7PwlZZx/0=;
        b=kVzCVWdYX101+TPMzn4oVmwFE9rWmlGzcQSG9nWVUN5k1mUVaeV5mWemA+TVZeXiec
         kOy+tlF7CeyJO/1hElSGviXttraJElFs3i5mugTXRFsFBPyvE6fAdcWLcm7i57MmZ7cy
         NXyoYxHawsg0NH3Bvr0qrQ0aFG6uyIunBXqhPs9kSWuRUMSHiQoU2clC5zmmKgYDHzgD
         MzyiBsszQoIjpF2a5Y3pVp2f/IcW3LDjMjjYegI/e8KDrOjohpjteO5aFnd2oaqYcqrN
         0Xa56XZHqh1qXVCkdRDLDdpG4VLM66c6r0ADRCaHkqHrUVGhcBAHPJSg2wmRz9/hR1Rp
         9szQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSMrs8NqPovV2VaZM9Poc3+w0rw6AYnNZpBNnTzjvuKeaCzJ6JxbhRL4eRy0Xhid8lwmyz4gdtIuZ5gMIj@vger.kernel.org
X-Gm-Message-State: AOJu0YyIFfiyxvaJo7z/fl6wwfWlDf3vlh+IBYEt5CBwoqpTBesWtYCF
	YrwzZpSPj3ixQnlN27qLSXpxNy6KGvzDD6D2lCgboDwqq8MqdqLn1vqSDxIngdw=
X-Gm-Gg: ASbGnct328rXuMEUf/Zdz94FpOLcApzz5g/j+f12/M3XxYUlSlVFaOUjjM5LMFbq1UF
	VDycUzcDHAIrmFWD3LNZitPZmtnd6NR9jJrryXMfpAxDUbHvlg5JY3YyU8A+6za+atR5Yrs2uir
	s08jI6nTqDEHy+21+dt5agZPgRWm23J8psBQVVC/MHw/oHGLEgTFbEtmCYDdau7U9Jl3v5CtGdh
	Wou+fRSLxrAASFteh1wKAgOCAJ/cHK0amEbNQCT5VMQabVr2CJ1jGP+L0UEwHLkYleYypog1Zzp
	6vLC9f5TwlXT5ZULyTqVJwQKxQBcJ9BPFQdlCeDF/ZPL/nS5sDBI0EUFGe8GNb4SPctUUtY=
X-Google-Smtp-Source: AGHT+IEmMbELCnUbRJwClshsnX4iixkLoQEOYZtcE+7298TlajRpBP1u+uXg5U1gx43ozlPd0fUbow==
X-Received: by 2002:a05:651c:211b:b0:308:fac7:9cc3 with SMTP id 38308e7fff4ca-3090dce23b7mr6496371fa.14.1739412790482;
        Wed, 12 Feb 2025 18:13:10 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-309100effbasm548781fa.29.2025.02.12.18.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 18:13:09 -0800 (PST)
Date: Thu, 13 Feb 2025 04:13:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Vinod Koul <vkoul@kernel.org>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jordan Crouse <jordan@cosmicpenguin.net>, ~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Martin Botka <martin.botka@somainline.org>, 
	Jami Kettunen <jami.kettunen@somainline.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] drm/msm/dsi: Set PHY usescase (and mode) before
 registering DSI host
Message-ID: <hvwpqzvdoeosz34ptbksc44ad7ohi6uwioy6o7qc4ewwcvx4d4@g3kksn3rwk6j>
References: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-0-9a60184fdc36@somainline.org>
 <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-2-9a60184fdc36@somainline.org>
 <nzm3tokbvho3hxz3e5vblp5ndagfcv5ah3j7gtkqjmt7ynr6f3@v36juvu73i5v>
 <vsxfi43d7rxh5xxc7ctivjslf6w4yy5iprqpqid3u3diylrtwd@wayafjlgzz7v>
 <x4jced57uhdfnq4d7tdqsozxbdosu2fcmsjlqtuuvh25ltx2rc@2eqsa7e4vcdv>
 <c5503020-0224-428a-9452-f8d668b47caf@quicinc.com>
 <ca80bd37-3b3f-48d3-a57d-2440d20d0c6c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca80bd37-3b3f-48d3-a57d-2440d20d0c6c@quicinc.com>

On Wed, Feb 12, 2025 at 05:13:08PM -0800, Abhinav Kumar wrote:
> Hi Marijn
> 
> On 2/10/2025 2:17 PM, Abhinav Kumar wrote:
> > 
> > 
> > On 2/10/2025 6:24 AM, Dmitry Baryshkov wrote:
> > > On Mon, Feb 10, 2025 at 01:54:29PM +0100, Marijn Suijten wrote:
> > > > On 2025-02-10 01:11:59, Dmitry Baryshkov wrote:
> > > > > On Sun, Feb 09, 2025 at 10:42:53PM +0100, Marijn Suijten wrote:
> > > > > > Ordering issues here cause an uninitialized (default STANDALONE)
> > > > > > usecase to be programmed (which appears to be a MUX) in some cases
> > > > > > when msm_dsi_host_register() is called, leading to the slave PLL in
> > > > > > bonded-DSI mode to source from a clock parent (dsi1vco) that is off.
> > > > > > 
> > > > > > This should seemingly not be a problem as the actual
> > > > > > dispcc clocks from
> > > > > > DSI1 that are muxed in the clock tree of DSI0 are way
> > > > > > further down, this
> > > > > > bit still seems to have an effect on them somehow and causes the right
> > > > > > side of the panel controlled by DSI1 to not function.
> > > > > > 
> > > > > > In an ideal world this code is refactored to no longer have such
> > > > > > error-prone calls "across subsystems", and instead model the "PLL src"
> > > > > > register field as a regular mux so that changing the clock parents
> > > > > > programmatically or in DTS via `assigned-clock-parents` has the
> > > > > > desired effect.
> > > > > > But for the avid reader, the clocks that we *are* muxing into DSI0's
> > > > > > tree are way further down, so if this bit turns out to be a simple mux
> > > > > > between dsiXvco and out_div, that shouldn't have any effect as this
> > > > > > whole tree is off anyway.
> > > > > > 
> > > > > > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > > > > > ---
> > > > > >   drivers/gpu/drm/msm/dsi/dsi_manager.c | 30
> > > > > > ++++++++++++++++++ +-----------
> > > > > >   1 file changed, 19 insertions(+), 11 deletions(-)
> > > > > 
> > > > > 
> > > > > Fixes: 57bf43389337 ("drm/msm/dsi: Pass down use case to PHY")
> > > > 
> > > > I'm not exactly confident about that.  Abhinav pointed out in
> > > > https://gitlab.freedesktop.org/drm/msm/-/issues/41#note_2375646 that
> > > > msm_dsi_host_register() was not supposed to be enabling the PHY, which I
> > > > provided a counter-stacktrace for to show that is indeed the case.
> > > > 
> > > > Either this was always a problem that's only become visible now
> > > > (and it's an
> > > > issue with that patch), or a different change causes
> > > > msm_dsi_host_register()
> > > > to enable the PHY and program the usecase too early?
> > > 
> > > As currently usecase is being programmed after the DSI host being
> > > registered, there might be a race condition between panel driver probe
> > > _and_ usecase programming.
> > > 
> > > > 
> > > > What do you think?
> > > > 
> > > > - Marijn
> > > > 
> > 
> > Yes I agree with Dmitry's explanation. The race condition between the
> > two can cause this. Hence I am also fine with this change.
> > 
> > > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > 
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > > > > > b/drivers/gpu/ drm/msm/dsi/dsi_manager.c
> > > > > > index a210b7c9e5ca281a46fbdb226e25832719a684ea..b93205c034e4acc73d536deeddce6ebd694b4a80
> > > > > > 100644
> > > > > > --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > > > > > +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > > > > > @@ -74,17 +74,33 @@ static int dsi_mgr_setup_components(int id)
> > > > > >       int ret;
> > > > > >       if (!IS_BONDED_DSI()) {
> > > > > > +        /* Set the usecase before calling
> > > > > > msm_dsi_host_register(), which would
> > > > > > +         * already program the PLL source mux based on
> > > > > > a default usecase.
> > > > > > +         */
> > > > > > +        msm_dsi_phy_set_usecase(msm_dsi->phy,
> > > > > > MSM_DSI_PHY_STANDALONE);
> > > > > > +        msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> > > > > > +
> > > > > >           ret = msm_dsi_host_register(msm_dsi->host);
> > > > > >           if (ret)
> > > > > >               return ret;
> > > > > > -
> > > > > > -        msm_dsi_phy_set_usecase(msm_dsi->phy,
> > > > > > MSM_DSI_PHY_STANDALONE);
> > > > > > -        msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> > > > > >       } else if (other_dsi) {
> > > > > >           struct msm_dsi *master_link_dsi = IS_MASTER_DSI_LINK(id) ?
> > > > > >                               msm_dsi : other_dsi;
> > > > > >           struct msm_dsi *slave_link_dsi = IS_MASTER_DSI_LINK(id) ?
> > > > > >                               other_dsi : msm_dsi;
> > > > > > +
> > > > > > +        /* PLL0 is to drive both DSI link clocks in bonded DSI mode.
> > > > > > +         *
> > > > > > +        /* Set the usecase before calling
> > > > > > msm_dsi_host_register(), which would
> > > > > > +         * already program the PLL source mux based on
> > > > > > a default usecase.
> > > > > > +         */
> 
> My compiler is throwing a warning here
> 
> drivers/gpu/drm/msm/dsi/dsi_manager.c: In function
> 'dsi_mgr_setup_components':
> drivers/gpu/drm/msm/dsi/dsi_manager.c:94:3: warning: "/*" within comment
> [-Wcomment]
>    /* Set the usecase before calling msm_dsi_host_register(), which would
>    ^
> drivers/gpu/drm/msm/dsi/dsi_manager.c: At top level:
> 
> Can you pls address this one so that I can pick this one up?

While you are at it, Marijn, could you please also fix the first comment
to be properly formatted?

-- 
With best wishes
Dmitry

