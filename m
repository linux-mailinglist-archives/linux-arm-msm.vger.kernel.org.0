Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 105D5433A6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Oct 2021 17:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232842AbhJSPc6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 11:32:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:48066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231574AbhJSPc6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 11:32:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 89F6360FED;
        Tue, 19 Oct 2021 15:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634657445;
        bh=CDJwRfp4lbsW4khYSdoqXRDI59oiFc/31cccykvgx9o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=m3JYVas4tU9n5rzLCTrVyETOgE83I/9WfvnhWn41/NhigsgQIkenjqNTPRmpNjOTE
         O3nIp+hOzq/g6Vq/no3YHnzW18hA0MPrY6/5rWJwbjeexlwAkIWZqKuLqiB7XesQhT
         SOpJUVpBzOIxwJNCj7T+Ase1+ElhwuYJjFNlKFSnaNclfoqOtlrV3Sqn6AfmiBm6Et
         A/t7YXIG4r4AcVUFnqSzWE08gW+xm9KF8Lr8JZx4AX+0zRwHyN8DtN1K2lQh0aio6I
         grU0epgJxwRti3xS9ZM/x5GFL8ksLZ0sHXfke76SnEZlKKXrBX3JwHVQn3xpA0FpKy
         y/96wVWPJYY5Q==
Date:   Tue, 19 Oct 2021 21:00:40 +0530
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
Subject: Re: [PATCH v2 04/11] drm/msm/disp/dpu1: Add DSC support in RM
Message-ID: <YW7koEt85EVMcUDs@matsya>
References: <20211007070900.456044-1-vkoul@kernel.org>
 <20211007070900.456044-5-vkoul@kernel.org>
 <d249d880-1137-d5cc-6d96-83a730f7de29@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d249d880-1137-d5cc-6d96-83a730f7de29@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14-10-21, 17:11, Dmitry Baryshkov wrote:
> On 07/10/2021 10:08, Vinod Koul wrote:

> > +static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> > +			       struct dpu_global_state *global_state,
> > +			       struct drm_encoder *enc)
> > +{
> > +	struct msm_drm_private *priv;
> > +
> > +	priv = enc->dev->dev_private;
> > +
> > +	if (!priv)
> > +		return -EIO;
> > +
> > +	/* check if DSC is supported */
> > +	if (!priv->dsc)
> > +		return 0;
> > +
> > +	/* check if DSC 0 & 1 and allocated or not */
> > +	if (global_state->dsc_to_enc_id[0] || global_state->dsc_to_enc_id[1]) {
> > +		DPU_ERROR("DSC 0|1 is already allocated\n");
> > +		return -EIO;
> > +	}
> > +
> > +	global_state->dsc_to_enc_id[0] = enc->base.id;
> > +	global_state->dsc_to_enc_id[1] = enc->base.id;
> 
> Still hardcoding DSC_0 and DSC_1.

Yes!

> Could you please add num_dsc to the topology and allocate the requested
> amount of DSC blocks? Otherwise this would break for the DSI + DP case.

It wont as we check for dsc and dont proceed, so it cant make an impact
in non dsc case.

Nevertheless I agree with you, so I am making it based on dsc defined in
topology. Do we need additional field for num_dsc in topology, num_enc
should be it, right?

-- 
~Vinod
