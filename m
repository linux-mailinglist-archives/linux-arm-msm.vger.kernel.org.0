Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C372E423B78
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 12:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237836AbhJFK3w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 06:29:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:44830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229824AbhJFK3w (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 06:29:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4BC9460EE3;
        Wed,  6 Oct 2021 10:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633516080;
        bh=qawfkhB10636aULlGfj0MJFZ7xewkyIgRTPQnKzfUaU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c8K6PDCqANe+rueqei9GcS9pAK9lK5SqlSZpr5IJa7df1RRtDC9GUgpLV9JqstGaE
         hOv+YE7ztB4xynGp54GmibeyEtcSlXJfe4VW0yp12fPXQ04tLrtQxULbFnvNiXlCni
         84dp1B/2OV8sIhw8dRANOxT7aXp0XunpLk1M89S9apWB1GCZOJRB4hK3yV1x8qcyYd
         W5/1iroJG9AFHGejcamURo79ZlpVlnxYQp+Bdajqv6ShK7Cw+6sBDwfKVxAbqSpisX
         4zlrSuzVOAj1FKRQcTu1L/PAr3vp+AJHPiWGHRkExormYlgLg/57ZhNZB+m2XgH4h4
         n0mL1Vdp4VOdA==
Date:   Wed, 6 Oct 2021 15:57:56 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     abhinavk@codeaurora.org
Cc:     Rob Clark <robdclark@gmail.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        freedreno@lists.freedesktop.org,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [Freedreno] [PATCH 04/11] drm/msm/disp/dpu1: Add DSC support in
 RM
Message-ID: <YV16LKpdRiYN955Y@matsya>
References: <20210715065203.709914-1-vkoul@kernel.org>
 <20210715065203.709914-5-vkoul@kernel.org>
 <7d656b2265ade461cae993c691d31ab8@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d656b2265ade461cae993c691d31ab8@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02-08-21, 16:24, abhinavk@codeaurora.org wrote:
> On 2021-07-14 23:51, Vinod Koul wrote:

> > @@ -476,6 +498,9 @@ static int _dpu_rm_reserve_intf(
> >  	}
> > 
> >  	global_state->intf_to_enc_id[idx] = enc_id;
> > +
> > +	global_state->dsc_to_enc_id[0] = enc_id;
> > +	global_state->dsc_to_enc_id[1] = enc_id;
> >  	return 0;
> >  }
> agree with dmitry again here, why are DSCs being reserved in the
> _dpu_rm_reserve_intf function?
> First, for clarity, they should be in a function of their own.
> Allocating the DSCs has to also account for the PP availability of that DSC
> and other factors need to
> be considered as well.
> I suggest checking _sde_rm_reserve_dsc() from downstream to improve the DSC
> reservation logic.

Yes I have moved to a new helper _dpu_rm_reserve_dsc(). PP availability
is already checked so no need to do that here as well

-- 
~Vinod
