Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1021A423B74
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 12:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbhJFK2e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 06:28:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:43624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229824AbhJFK2e (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 06:28:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4258260EE3;
        Wed,  6 Oct 2021 10:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633516002;
        bh=CBXQOuJ3lyLrw+FXgbcjsTqZ+jCdlPSPS40XXbYz3oY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YBgiRIaJhh+HctK74haEIEU34HFnWsiKETTgEDCXtvp3klygqMrWOAhjdcxdizE83
         Eyy73E0+4h3E67iuwamf17YzDPh+eMRBqgztxrCimpOeIp7YrGs7UbUCtRhs9tr9f5
         VXed6hc26HwMz8sNa6h5eAUQR3+/j/6RSDA5rlw3C8do4YdKIF4rCSl3LGuegnAmpC
         NUlb+a1Bo8oSxJtJW5Eu0S9GABSzMdcXv2ZSYMSepOkCivm3medKHEHK6rBJCuzggm
         YGmirJ+RnQXePKwLjy6VVip4skjNeCbz8nrRSQEqbWqpOEOixvhh0lW0ujuD3FcO13
         o2qcM0yf3dW+A==
Date:   Wed, 6 Oct 2021 15:56:37 +0530
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
Subject: Re: [PATCH 04/11] drm/msm/disp/dpu1: Add DSC support in RM
Message-ID: <YV153cn39rZeqcJT@matsya>
References: <20210715065203.709914-1-vkoul@kernel.org>
 <20210715065203.709914-5-vkoul@kernel.org>
 <c8e9b236-4438-c2b3-a9a3-80f1c1c517a9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8e9b236-4438-c2b3-a9a3-80f1c1c517a9@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29-07-21, 23:23, Dmitry Baryshkov wrote:
> On 15/07/2021 09:51, Vinod Koul wrote:

> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > index fd2d104f0a91..4da6d72b7996 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > @@ -11,6 +11,7 @@
> >   #include "dpu_hw_intf.h"
> >   #include "dpu_hw_dspp.h"
> >   #include "dpu_hw_merge3d.h"
> > +#include "dpu_hw_dsc.h"
> >   #include "dpu_encoder.h"
> >   #include "dpu_trace.h"
> > @@ -75,6 +76,14 @@ int dpu_rm_destroy(struct dpu_rm *rm)
> >   			dpu_hw_intf_destroy(hw);
> >   		}
> >   	}
> > +	for (i = 0; i < ARRAY_SIZE(rm->dsc_blks); i++) {
> > +		struct dpu_hw_dsc *hw;
> > +
> > +		if (rm->intf_blks[i]) {
> 
> rm->dsc_blks[i]

Thanks for spotting, fixed!

> 
> > +			hw = to_dpu_hw_dsc(rm->dsc_blks[i]);
> > +			dpu_hw_dsc_destroy(hw);
> > +		}
> > +	}
> >   	return 0;
> >   }
> > @@ -221,6 +230,19 @@ int dpu_rm_init(struct dpu_rm *rm,
> >   		rm->dspp_blks[dspp->id - DSPP_0] = &hw->base;
> >   	}
> > +	for (i = 0; i < cat->dsc_count; i++) {
> > +		struct dpu_hw_dsc *hw;
> > +		const struct dpu_dsc_cfg *dsc = &cat->dsc[i];
> > +
> > +		hw = dpu_hw_dsc_init(dsc->id, mmio, cat);
> > +		if (IS_ERR_OR_NULL(hw)) {
> > +			rc = PTR_ERR(hw);
> > +			DPU_ERROR("failed dsc object creation: err %d\n", rc);
> > +			goto fail;
> > +		}
> > +		rm->dsc_blks[dsc->id - DSC_0] = &hw->base;
> > +	}
> > +
> >   	return 0;
> >   fail:
> > @@ -476,6 +498,9 @@ static int _dpu_rm_reserve_intf(
> >   	}
> >   	global_state->intf_to_enc_id[idx] = enc_id;
> > +
> > +	global_state->dsc_to_enc_id[0] = enc_id;
> > +	global_state->dsc_to_enc_id[1] = enc_id;
> 
> This is not correct. At least this should be guarded with an if, checking
> that DSC is requested. Also we'd need to check that DSC 0 and 1 are not
> allocated.

Correct, so I have done few changes here and for DSC block reservation..
- Calling dpu_rm_get_assigned_resources() for DSC only when DSC is
  required from dpu encoder
- moved the above code to dsc helper: _dpu_rm_reserve_dsc() as suggested
  by Abhinav as well
- Check if DSC is supported and then check if DSC 0|1 are not allocated
  and then assign as above

-- 
~Vinod
