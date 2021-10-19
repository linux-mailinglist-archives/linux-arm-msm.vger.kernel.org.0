Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE445433807
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Oct 2021 16:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231209AbhJSOKJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 10:10:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:53322 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230162AbhJSOKJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 10:10:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 244E6610A1;
        Tue, 19 Oct 2021 14:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634652475;
        bh=SLWuDyENjrttrY/yKGmL/fqA3+noRXUboMcPH0sIE94=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oM0gZvjxdIWCCSyTgbkEwXNW+yBmqzUXnDXgyeJJjaOCCn/R6Q6eA3foe5S6et5NX
         UJszBzdPoyg/4NYkWZDhqmzKmFrr57nTVwL8CIFDxL8YXFOK+IXn13c90B2wsmknki
         uKXjWuUnoHzxUgT7P0Edeenpbdr296O1YL8rNJCwxm8MOfDMN/rXkZUnOF86ycdREN
         kDbI91dUD3k30j9iSl+bsl7djiew/9IHBYXi5Xd3yH8zWOI+R0QsLn4C266WrqR5Qz
         ks7DrZZCqMb4tVV9yP1Rr8/aq1avdYa4/U73x2nLPGuY91uswYtISAwAyp4QX+mSMq
         w7Uak4Sgc0S0A==
Date:   Tue, 19 Oct 2021 19:37:51 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 02/11] drm/msm/disp/dpu1: Add support for DSC
Message-ID: <YW7RNz/9vd/XS0+O@matsya>
References: <20211007070900.456044-1-vkoul@kernel.org>
 <20211007070900.456044-3-vkoul@kernel.org>
 <c9c77691-f6e8-576c-7e2d-a87295b13ba7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9c77691-f6e8-576c-7e2d-a87295b13ba7@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14-10-21, 17:40, Dmitry Baryshkov wrote:
> On 07/10/2021 10:08, Vinod Koul wrote:

> > +static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
> > +			      struct msm_display_dsc_config *dsc, u32 mode)
> > +{
> > +	struct dpu_hw_blk_reg_map *c = &hw_dsc->hw;
> > +	u32 data, lsb, bpp;
> > +	u32 initial_lines = dsc->initial_lines;
> > +	bool is_cmd_mode = !(mode & BIT(2));
> 
> DSC_MODE_VIDEO

Updated

> > +static void dpu_hw_dsc_config_thresh(struct dpu_hw_dsc *hw_dsc,
> > +				     struct msm_display_dsc_config *dsc)
> 
> I thought that it might make sense to pass just drm_dsc_rc_range_parameters
> here, but it's a matter of personal preference. I won't insist on doing
> that.

This is called from encoder, so prefer not to have encoder invoke
dsc->drm->rc_range_params

So will keep this.

-- 
~Vinod
