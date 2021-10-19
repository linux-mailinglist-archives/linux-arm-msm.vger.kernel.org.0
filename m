Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4949A433B47
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Oct 2021 17:53:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232929AbhJSPzS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 11:55:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231795AbhJSPzQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 11:55:16 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C374C06161C
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Oct 2021 08:53:03 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id g20so389635qka.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Oct 2021 08:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bob0Tm0hIP2HTFKrFxEk/0E7roQxECXmiqtYRxqYzx8=;
        b=txnXSm72izF/umXW7pS/1I1fY1Jm8SKkXyctJzTcb0Ypz1SY6Y3N01Xf7T0uskdus2
         vpt/QqFXb85JhzmEWKSPJ065DLdAfzrl7FgtYQvlJoqEyXY3magNT76XtyHgpBuvzlmZ
         PC0AI3mcA6dJ1kEm4z54+HSKMuFlgThPRm+/d4EysBslovH9xFtpmze9S93eeatqzuSP
         IYHJKqnCNPUeeAJrgA2KS7Zz4O2hguI1/bRajbOUQ35eAa/movR8N5GvJ331lgPCYdvP
         pl1J0F7oZpgHJHBJ/m5PRo4EucqyccM46A4yuQe6R2k38BaAWWECM0qch28IDCevE4qV
         YyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bob0Tm0hIP2HTFKrFxEk/0E7roQxECXmiqtYRxqYzx8=;
        b=AJ7aVNfeK82fxdDw7jqZsRKz9hgDqNmxulAAAO6800S7pt0nZdjqSmEOcD0C66eMRE
         tOM9//WpGWhnpgqcGwqgIBAR13yUdzY9Ttkn4mlm35RvM+LdE/GsWmV6z541j+NttGlR
         KBdtt0suINd4Lhon1rT0VOgY4b4I++LO1xhFOcM/QXBkEOBz77Zq9ShHfeVbfGOVnIDU
         KeGLno8YqN1oumyoN8CnuiheCFAwFyAaJGwDHpZ8ZYT+2bTAHj+D62As+PGhyqoxSWHe
         i82imboFmwx4t+bv3khoVXEbHZO/cdQPL5jRhVP5EE7r5frdvMi5fNxlWxVrxAYEWPvT
         jp5g==
X-Gm-Message-State: AOAM531nYca5NGgf//v5HX8D8BqFvFxZz6Tx5nCPJPxhHq1RJ8NEtTZW
        zXVcIAF/Z1iFkFO78gGjuhJw1iQ6uOUOyZOkSSeh2g==
X-Google-Smtp-Source: ABdhPJwpFNhYWXDb/DzF5v8VV25OUExn8Buf7i5lwqgaX4fpFPV3/6c9goK2M4HSHXCOSKeZxeg7CcSMg0fOiMKxmQ8=
X-Received: by 2002:a05:620a:1a05:: with SMTP id bk5mr615795qkb.195.1634658782471;
 Tue, 19 Oct 2021 08:53:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211007070900.456044-1-vkoul@kernel.org> <20211007070900.456044-5-vkoul@kernel.org>
 <d249d880-1137-d5cc-6d96-83a730f7de29@linaro.org> <YW7koEt85EVMcUDs@matsya>
In-Reply-To: <YW7koEt85EVMcUDs@matsya>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 19 Oct 2021 18:52:51 +0300
Message-ID: <CAA8EJprNTUrh66yqaOCoReWdwLcBc9LfMm=WNDi54o9nzd8RRA@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] drm/msm/disp/dpu1: Add DSC support in RM
To:     Vinod Koul <vkoul@kernel.org>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 19 Oct 2021 at 18:30, Vinod Koul <vkoul@kernel.org> wrote:
>
> On 14-10-21, 17:11, Dmitry Baryshkov wrote:
> > On 07/10/2021 10:08, Vinod Koul wrote:
>
> > > +static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> > > +                          struct dpu_global_state *global_state,
> > > +                          struct drm_encoder *enc)
> > > +{
> > > +   struct msm_drm_private *priv;
> > > +
> > > +   priv = enc->dev->dev_private;
> > > +
> > > +   if (!priv)
> > > +           return -EIO;
> > > +
> > > +   /* check if DSC is supported */
> > > +   if (!priv->dsc)
> > > +           return 0;
> > > +
> > > +   /* check if DSC 0 & 1 and allocated or not */
> > > +   if (global_state->dsc_to_enc_id[0] || global_state->dsc_to_enc_id[1]) {
> > > +           DPU_ERROR("DSC 0|1 is already allocated\n");
> > > +           return -EIO;
> > > +   }
> > > +
> > > +   global_state->dsc_to_enc_id[0] = enc->base.id;
> > > +   global_state->dsc_to_enc_id[1] = enc->base.id;
> >
> > Still hardcoding DSC_0 and DSC_1.
>
> Yes!
>
> > Could you please add num_dsc to the topology and allocate the requested
> > amount of DSC blocks? Otherwise this would break for the DSI + DP case.
>
> It wont as we check for dsc and dont proceed, so it cant make an impact
> in non dsc case.
>
> Nevertheless I agree with you, so I am making it based on dsc defined in
> topology. Do we need additional field for num_dsc in topology, num_enc
> should be it, right?

I'd vote for the separate num_dsc.

-- 
With best wishes
Dmitry
