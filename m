Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0F27423BBF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 12:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237843AbhJFKw1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 06:52:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:57276 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229824AbhJFKw1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 06:52:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3965A61039;
        Wed,  6 Oct 2021 10:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633517435;
        bh=v8y1N4gIhukedV+p7pkwbFPb5wyssQGcXOteiYdVAs0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DSY2cZ3YrqRxq8WBCGCQbM8+YMm1eFDmDfYPtcHVk7LSQSFtl1xhEnNh4P92pBXUn
         KXHLotS9hUcjB9439HF+g9ewZcAXF1qa0QPISFqmY4PYy5A3fXI+dWZIPJUx1aFx/F
         0fNRTQOHjPu9cX2HuwDRvlU7HuAb3tzs3tOmgNWZrlQ0l5bCwDDoe8Ngqj2v3Y1L0F
         xB4PJZJrGoqT7VvU8vkIysdTSbXv9IFVCQeU3foA/7vUI2SNxbOvj56AhY0mme9p+c
         HKOe/Ru7Xsn2F9S6eon/GiBDI72BzGODCo2h9tEcO3GeR5p+9erlVf86BYiXunhYn/
         RFfLp+ZVOBuTQ==
Date:   Wed, 6 Oct 2021 16:20:30 +0530
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
Subject: Re: [PATCH 05/11] drm/msm/disp/dpu1: Add DSC for SDM845 to hw_catalog
Message-ID: <YV1/dj3/5ej+soMb@matsya>
References: <20210715065203.709914-1-vkoul@kernel.org>
 <20210715065203.709914-6-vkoul@kernel.org>
 <927826ce-eae5-0089-6874-eb14d8e16169@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <927826ce-eae5-0089-6874-eb14d8e16169@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29-07-21, 23:25, Dmitry Baryshkov wrote:
> On 15/07/2021 09:51, Vinod Koul wrote:
> > This add SDM845 DSC blocks into hw_catalog
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> > Changes since RFC:
> >   - use BIT values from MASK
> > 
> >   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 22 +++++++++++++++++++
> >   1 file changed, 22 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > index b569030a0847..b45a08303c99 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > @@ -40,6 +40,8 @@
> >   #define PINGPONG_SDM845_MASK BIT(DPU_PINGPONG_DITHER)
> > +#define DSC_SDM845_MASK BIT(1)
> > +
> 
> This does not seem used. You can pass (0) as the feature mask.

Yes fixed

-- 
~Vinod
