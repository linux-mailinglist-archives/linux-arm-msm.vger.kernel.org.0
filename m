Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07E76433C18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Oct 2021 18:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231495AbhJSQ2R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 12:28:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:51172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229774AbhJSQ2R (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 12:28:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C08C61052;
        Tue, 19 Oct 2021 16:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634660764;
        bh=JTD0yxhNiwoaimOyKxDh67eqXCwBhnj/uYevNf6Vv3Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rfqMZQs6S02wfD8Lpp8XLsn1KTOo22eHxr2zRCkJ5Rx0usL24hdRRybMsoG+uo35G
         ACfcoy2t3M3NjUr35CHgJ2dhLnDVvI8KJW3Ew2w0ykiySlRrcjRcGwAdxAsO1HEN7Y
         7/ufr5N2LivOQxB3UnL0WBKVuSLT+++WBLT62149x183uP05AXTO71mZ3mmina9P0N
         23Vh8IX9t3poHfgli5j8e41bzbF5AHqHrd8W7hP8MCPyjbHWyBQAyLjT2i4yL4aCJD
         s22FNKlQ7QKgoM/YvdzwS8Zpw7uS8luNYqVf3YrScnBKWg8/d8ccVx72fdnoSP7kTG
         EZ6vGSIJjBzdA==
Date:   Tue, 19 Oct 2021 21:55:59 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH v2 04/11] drm/msm/disp/dpu1: Add DSC support in RM
Message-ID: <YW7xlyuIq1vh4Fg2@matsya>
References: <20211007070900.456044-1-vkoul@kernel.org>
 <20211007070900.456044-5-vkoul@kernel.org>
 <d249d880-1137-d5cc-6d96-83a730f7de29@linaro.org>
 <YW7koEt85EVMcUDs@matsya>
 <CAA8EJprNTUrh66yqaOCoReWdwLcBc9LfMm=WNDi54o9nzd8RRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJprNTUrh66yqaOCoReWdwLcBc9LfMm=WNDi54o9nzd8RRA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19-10-21, 18:52, Dmitry Baryshkov wrote:
> On Tue, 19 Oct 2021 at 18:30, Vinod Koul <vkoul@kernel.org> wrote:
> >
> > On 14-10-21, 17:11, Dmitry Baryshkov wrote:
> > > On 07/10/2021 10:08, Vinod Koul wrote:
> >
> > > > +static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> > > > +                          struct dpu_global_state *global_state,
> > > > +                          struct drm_encoder *enc)
> > > > +{
> > > > +   struct msm_drm_private *priv;
> > > > +
> > > > +   priv = enc->dev->dev_private;
> > > > +
> > > > +   if (!priv)
> > > > +           return -EIO;
> > > > +
> > > > +   /* check if DSC is supported */
> > > > +   if (!priv->dsc)
> > > > +           return 0;
> > > > +
> > > > +   /* check if DSC 0 & 1 and allocated or not */
> > > > +   if (global_state->dsc_to_enc_id[0] || global_state->dsc_to_enc_id[1]) {
> > > > +           DPU_ERROR("DSC 0|1 is already allocated\n");
> > > > +           return -EIO;
> > > > +   }
> > > > +
> > > > +   global_state->dsc_to_enc_id[0] = enc->base.id;
> > > > +   global_state->dsc_to_enc_id[1] = enc->base.id;
> > >
> > > Still hardcoding DSC_0 and DSC_1.
> >
> > Yes!
> >
> > > Could you please add num_dsc to the topology and allocate the requested
> > > amount of DSC blocks? Otherwise this would break for the DSI + DP case.
> >
> > It wont as we check for dsc and dont proceed, so it cant make an impact
> > in non dsc case.
> >
> > Nevertheless I agree with you, so I am making it based on dsc defined in
> > topology. Do we need additional field for num_dsc in topology, num_enc
> > should be it, right?
> 
> I'd vote for the separate num_dsc.

Okay will update... will move up topology patch up in the order for that
as well

-- 
~Vinod
