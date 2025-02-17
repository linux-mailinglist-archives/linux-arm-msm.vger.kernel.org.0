Return-Path: <linux-arm-msm+bounces-48132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD9BA37944
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 01:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72E451889E1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 00:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C5FF7483;
	Mon, 17 Feb 2025 00:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fV5LIySg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B90DDAB
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 00:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739753293; cv=none; b=RugMBeDeS9DDopsA1n2zdU50Yh5WUjGa9OXU7YuO2jQEiG6bDCIFwSHwIMToDfSJrOshNcl6BMA1iJd47WkkMOvH8nt+OJOF8EIEIckRGoHKeeMGr5H6uz9wlkam7xk72eN4JQw7rXuivefvAhU76MRNW58mkrk33rce5P7H4I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739753293; c=relaxed/simple;
	bh=eCvLy50k9fOPmroPraS8tsBbrd6h4Cvr978MhURjtew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dc4OMo49jQUFIpJwkb/scZfpxsY4SIJY6JckgRmMplZgWFXyVSukaoDFD2Z1sRd/oJRG7mUpAYTbWfiMKNL8xOytQPK2nBu31H7Nxmx3fCgyLplDRLnzHB5mcI18X3OKzT+aBYLHk8CUlC/+ACyeiM39Zf+BttDL/fDsaywAYDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fV5LIySg; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6f6ca9a3425so32876957b3.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Feb 2025 16:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739753291; x=1740358091; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jiE7dDyQpEcuMgGEFZxqBiwxreB1F7LNocjU7g22r7Y=;
        b=fV5LIySgv5oWA6oMgOCmPPsaYlacjwOgzJOeS5tTloiMazIzI4h7VQpvjQZZB2597o
         QWYCBd9VEZQmpXlXaH+9d8fag2XWEEAhVfsIoe19LcMa5bivxdp58ky4uidwsX680sMq
         C3E44Wneh3IHAhTIz1I9Do9n2A2oLVnlDMzzAKE4knhVHnPWROWJ4sLPw1+EW1xpE6Dh
         xd7HsTtPLHKiUCrcQPkgzGLJC+SjCJ073ptM2pwLYqatMDTX9wGNyscJM/Mv7Je5snEg
         cQaTYIvcJ6dVz1CbUkOtR7n07BRnJ5zKf0AWrre62yYwTVsKiMxO4VppTNHzVpf+FBO2
         j7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739753291; x=1740358091;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jiE7dDyQpEcuMgGEFZxqBiwxreB1F7LNocjU7g22r7Y=;
        b=vKoV+ugGZis9UVRnnfT61Y700CQHZJoLmKrcXUu5xZwEew8dBGz+PVyqcOTOg0WZr0
         RZuXOd311OiQ00XMHtq77b5/BaUNnVrV1zZeKXPgB63cJIRLXjXUqLP0OSzl1fDrr1hD
         sL05r2nYXESJsoG6b5oh6yVhPpECr+1TLIcVjh4OUHwdOXGEdN6yr5CwP2a/JqdPgnWp
         0FC1ZUppih82G4sW2ROW+sCb9xXjQ+RA/BZXwwGvH3zidcfwgC6VzAgsfgoAhaOK6aJu
         4WKNmXb4PMIM1Ukcil3+dxQe6Bad9Wj1iFTMcgU2cC/rF4oLSJGJjsFf1PGK1/nUlpm6
         Hukg==
X-Forwarded-Encrypted: i=1; AJvYcCXsHJOdXZGYRNXe16E+T8HTCaOIt870Od22KNhn9LltF3K2E+hFGJzIhgiY3YBqCBiI4O5u48N2hZnUC2Di@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ9xGb9CtxJlkWNQY7OtMH0Fy+OFcSZ0L92gtOYuJweoDlmUH0
	Qflypa0Var/KZgYnwhKPfjmw4MvpmvYmUmR151jbT8RfLa9kGU7TWcM5/zGQnKjLbbKss7Le+Ow
	VSXqxeQaeejke0KxfO9sAdXkYKDbw2Zoib9XW9g==
X-Gm-Gg: ASbGncvNzEu+sZem7csif6QFF9BKX/YXJHUck/Al0m0eB3ArE/Nl2MGZHCtYYniL1Ag
	i22z7a8cAKv5NwLGGh+kkyrOOV5JJsNOPw0BJITMn5c4e6EcfBu5qja1j8Sm1yY+EFVOEsizr6l
	pnDx/xYQTOZt1cWjPvyNXMhJ2uzGbn
X-Google-Smtp-Source: AGHT+IEMhSRFHPDYkw5GeVrG2kqJaVOkuZfxzT78iT6QhZXjbf5bNidkqWZ4fujnyRRGkAao4NrfMknk7hZDlpY2vkc=
X-Received: by 2002:a05:690c:6e0a:b0:6ef:5097:5daa with SMTP id
 00721157ae682-6fb5835b290mr64408277b3.34.1739753290871; Sun, 16 Feb 2025
 16:48:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-0-9a60184fdc36@somainline.org>
 <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-2-9a60184fdc36@somainline.org>
 <nzm3tokbvho3hxz3e5vblp5ndagfcv5ah3j7gtkqjmt7ynr6f3@v36juvu73i5v>
 <vsxfi43d7rxh5xxc7ctivjslf6w4yy5iprqpqid3u3diylrtwd@wayafjlgzz7v>
 <x4jced57uhdfnq4d7tdqsozxbdosu2fcmsjlqtuuvh25ltx2rc@2eqsa7e4vcdv>
 <c5503020-0224-428a-9452-f8d668b47caf@quicinc.com> <ca80bd37-3b3f-48d3-a57d-2440d20d0c6c@quicinc.com>
 <hvwpqzvdoeosz34ptbksc44ad7ohi6uwioy6o7qc4ewwcvx4d4@g3kksn3rwk6j> <xtcwuscf3nz6o6qhv4lerpeoxep34iloj6kvxxuad7yoqsus22@tmuv2jqvfpo7>
In-Reply-To: <xtcwuscf3nz6o6qhv4lerpeoxep34iloj6kvxxuad7yoqsus22@tmuv2jqvfpo7>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 17 Feb 2025 02:48:00 +0200
X-Gm-Features: AWEUYZnr5JEM_NzM6_fTTLE79Hxcuewl699FSlC_aTSNnkIVaJZXXU_BNMa4HAc
Message-ID: <CAA8EJppoeuO-JWPzG=OB_HQXKokf_aj-JOW4GDfgGF1r3n+u=g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/msm/dsi: Set PHY usescase (and mode) before
 registering DSI host
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Jordan Crouse <jordan@cosmicpenguin.net>, 
	~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Martin Botka <martin.botka@somainline.org>, Jami Kettunen <jami.kettunen@somainline.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Feb 2025 at 01:06, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2025-02-13 04:13:06, Dmitry Baryshkov wrote:
> > On Wed, Feb 12, 2025 at 05:13:08PM -0800, Abhinav Kumar wrote:
> > > Hi Marijn
> > >
> > > On 2/10/2025 2:17 PM, Abhinav Kumar wrote:
> > > >
> > > >
> > > > On 2/10/2025 6:24 AM, Dmitry Baryshkov wrote:
> > > > > On Mon, Feb 10, 2025 at 01:54:29PM +0100, Marijn Suijten wrote:
> > > > > > On 2025-02-10 01:11:59, Dmitry Baryshkov wrote:
> > > > > > > On Sun, Feb 09, 2025 at 10:42:53PM +0100, Marijn Suijten wrote:
> > > > > > > > Ordering issues here cause an uninitialized (default STANDALONE)
> > > > > > > > usecase to be programmed (which appears to be a MUX) in some cases
> > > > > > > > when msm_dsi_host_register() is called, leading to the slave PLL in
> > > > > > > > bonded-DSI mode to source from a clock parent (dsi1vco) that is off.
> > > > > > > >
> > > > > > > > This should seemingly not be a problem as the actual
> > > > > > > > dispcc clocks from
> > > > > > > > DSI1 that are muxed in the clock tree of DSI0 are way
> > > > > > > > further down, this
> > > > > > > > bit still seems to have an effect on them somehow and causes the right
> > > > > > > > side of the panel controlled by DSI1 to not function.
> > > > > > > >
> > > > > > > > In an ideal world this code is refactored to no longer have such
> > > > > > > > error-prone calls "across subsystems", and instead model the "PLL src"
> > > > > > > > register field as a regular mux so that changing the clock parents
> > > > > > > > programmatically or in DTS via `assigned-clock-parents` has the
> > > > > > > > desired effect.
> > > > > > > > But for the avid reader, the clocks that we *are* muxing into DSI0's
> > > > > > > > tree are way further down, so if this bit turns out to be a simple mux
> > > > > > > > between dsiXvco and out_div, that shouldn't have any effect as this
> > > > > > > > whole tree is off anyway.
> > > > > > > >
> > > > > > > > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > > > > > > > ---
> > > > > > > >   drivers/gpu/drm/msm/dsi/dsi_manager.c | 30
> > > > > > > > ++++++++++++++++++ +-----------
> > > > > > > >   1 file changed, 19 insertions(+), 11 deletions(-)
> > > > > > >
> > > > > > >
> > > > > > > Fixes: 57bf43389337 ("drm/msm/dsi: Pass down use case to PHY")
> > > > > >
> > > > > > I'm not exactly confident about that.  Abhinav pointed out in
> > > > > > https://gitlab.freedesktop.org/drm/msm/-/issues/41#note_2375646 that
> > > > > > msm_dsi_host_register() was not supposed to be enabling the PHY, which I
> > > > > > provided a counter-stacktrace for to show that is indeed the case.
> > > > > >
> > > > > > Either this was always a problem that's only become visible now
> > > > > > (and it's an
> > > > > > issue with that patch), or a different change causes
> > > > > > msm_dsi_host_register()
> > > > > > to enable the PHY and program the usecase too early?
> > > > >
> > > > > As currently usecase is being programmed after the DSI host being
> > > > > registered, there might be a race condition between panel driver probe
> > > > > _and_ usecase programming.
> > > > >
> > > > > >
> > > > > > What do you think?
> > > > > >
> > > > > > - Marijn
> > > > > >
> > > >
> > > > Yes I agree with Dmitry's explanation. The race condition between the
> > > > two can cause this. Hence I am also fine with this change.
> > > >
> > > > > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > >
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > > > > > > > b/drivers/gpu/ drm/msm/dsi/dsi_manager.c
> > > > > > > > index a210b7c9e5ca281a46fbdb226e25832719a684ea..b93205c034e4acc73d536deeddce6ebd694b4a80
> > > > > > > > 100644
> > > > > > > > --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > > > > > > > +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > > > > > > > @@ -74,17 +74,33 @@ static int dsi_mgr_setup_components(int id)
> > > > > > > >       int ret;
> > > > > > > >       if (!IS_BONDED_DSI()) {
> > > > > > > > +        /* Set the usecase before calling
> > > > > > > > msm_dsi_host_register(), which would
> > > > > > > > +         * already program the PLL source mux based on
> > > > > > > > a default usecase.
> > > > > > > > +         */
> > > > > > > > +        msm_dsi_phy_set_usecase(msm_dsi->phy,
> > > > > > > > MSM_DSI_PHY_STANDALONE);
> > > > > > > > +        msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> > > > > > > > +
> > > > > > > >           ret = msm_dsi_host_register(msm_dsi->host);
> > > > > > > >           if (ret)
> > > > > > > >               return ret;
> > > > > > > > -
> > > > > > > > -        msm_dsi_phy_set_usecase(msm_dsi->phy,
> > > > > > > > MSM_DSI_PHY_STANDALONE);
> > > > > > > > -        msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> > > > > > > >       } else if (other_dsi) {
> > > > > > > >           struct msm_dsi *master_link_dsi = IS_MASTER_DSI_LINK(id) ?
> > > > > > > >                               msm_dsi : other_dsi;
> > > > > > > >           struct msm_dsi *slave_link_dsi = IS_MASTER_DSI_LINK(id) ?
> > > > > > > >                               other_dsi : msm_dsi;
> > > > > > > > +
> > > > > > > > +        /* PLL0 is to drive both DSI link clocks in bonded DSI mode.
> > > > > > > > +         *
> > > > > > > > +        /* Set the usecase before calling
> > > > > > > > msm_dsi_host_register(), which would
> > > > > > > > +         * already program the PLL source mux based on
> > > > > > > > a default usecase.
> > > > > > > > +         */
> > >
> > > My compiler is throwing a warning here
> > >
> > > drivers/gpu/drm/msm/dsi/dsi_manager.c: In function
> > > 'dsi_mgr_setup_components':
> > > drivers/gpu/drm/msm/dsi/dsi_manager.c:94:3: warning: "/*" within comment
> > > [-Wcomment]
> > >    /* Set the usecase before calling msm_dsi_host_register(), which would
> > >    ^
> > > drivers/gpu/drm/msm/dsi/dsi_manager.c: At top level:
> > >
> > > Can you pls address this one so that I can pick this one up?
>
> Whoops, that looks like copy-paste mistake when copying the comment from
> !IS_BONDED_DSI() and merging it with the original comment about PLL0.
> Will resend when I understand Dmitry's question below;
>
> >
> > While you are at it, Marijn, could you please also fix the first comment
> > to be properly formatted?
>
> What exactly do you need to be reformatted about the first comment?  It's
> exactly the same in both branches.  No multiline comments in dsi_manager.c
> start with a newline after the first /*.  Anything I'm missing?

Yes. But those, I think, are older comments. Please use proper
formatting for new comments.

>
> - Marijn
>
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry

