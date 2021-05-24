Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47C0138E199
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 May 2021 09:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232266AbhEXH2J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 May 2021 03:28:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:37498 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232128AbhEXH2H (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 May 2021 03:28:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 98B5260E0B;
        Mon, 24 May 2021 07:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621841199;
        bh=NGwm1jJDkT8JccuOTPA1VPiOYYl1wMQVrKM3KE+Lle0=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=O0bc9TnCRB9a5C8Qas5eSkTrPf0c7AZhULO+boeX9JvnAj7gCxTkW7P+IO9xKJsEl
         3WTl7e2di3txH6cG3jNwBq3AJSU1k8VUaNmbD+QqIINCr68Jgq102oGcBJl+TBaYlF
         b/GinEWG/8Vdov0OMBoI5ERXuQ38D7io/mDARFAz5C7jF3Dh6LaYOkbmJWfnGWBi7Y
         EI8u1g6Iikj51NMnSDrXrdvfCB98dnwNq5rRgelzNy1M65CrUBCK9HZcgki2TC8CYr
         G7et06woWEEZyQmiY8CcQpmAnz57EapjBLofP7IjsBb92QB4HP82N1dIWGL+OB3vtX
         Bun56XJXALeYg==
Date:   Mon, 24 May 2021 12:56:34 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [RFC PATCH 01/13] drm/dsc: Add dsc pps header init function
Message-ID: <YKtVKn/R5wF4nkHj@vkoul-mobl.Dlink>
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <20210521124946.3617862-2-vkoul@kernel.org>
 <YKfR1BGWa/CVYg9w@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKfR1BGWa/CVYg9w@phenom.ffwll.local>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21-05-21, 17:29, Daniel Vetter wrote:
> On Fri, May 21, 2021 at 06:19:30PM +0530, Vinod Koul wrote:
> > We required a helper to create and set the dsc_dce_header, so add the
> > dsc_dce_header and API drm_dsc_dsi_pps_header_init
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  drivers/gpu/drm/drm_dsc.c | 11 +++++++++++
> >  include/drm/drm_dsc.h     | 16 ++++++++++++++++
> >  2 files changed, 27 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_dsc.c b/drivers/gpu/drm/drm_dsc.c
> > index ff602f7ec65b..0c1b745090e2 100644
> > --- a/drivers/gpu/drm/drm_dsc.c
> > +++ b/drivers/gpu/drm/drm_dsc.c
> > @@ -49,6 +49,17 @@ void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header)
> >  }
> >  EXPORT_SYMBOL(drm_dsc_dp_pps_header_init);
> >  
> > +void drm_dsc_dsi_pps_header_init(struct dsc_dce_header *dsc_header)
> 
> Kerneldoc for anything exported to drivers please, also ideally for all
> the structures.

Sorry missed that, will add

-- 
~Vinod
