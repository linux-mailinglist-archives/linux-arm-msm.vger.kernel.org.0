Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7233D3AAE69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 10:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbhFQIIn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 04:08:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:49006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229666AbhFQIIn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 04:08:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD8C0610A0;
        Thu, 17 Jun 2021 08:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623917195;
        bh=YuScG7SzWSSRa8w1px2qbFZAuK3KvyU2T8TThbFj484=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KZtZND8jBB1VBzwKJ37okD6sz+7yOm9yfkVXZvMIlMjMbU+/QQz+2xByOFDnV5kBI
         6efKtbVV9eT5xS4zzlnh8n7ZsNw9HbZ9sDLEp85/CilwlCFxqxCmQTdmDzguDQa7Lp
         4x2Vb3YyD9PDnbpAeR5LjMTKQ1CrYzZ7y+T6cKTgZhf9ln2FEaUfw4ZsIG57QvUrn+
         mYwOMefXgMUm+fnsHxN3SSZb5+ntdFmtUv2FZAMaHM6Nw2i3Q4grHbNXZezuo5XuAw
         2Pb+WKjNG8oat7wV5SyAWARDp1KJqOMhozk0z+QSanSSEdBFilprNmu6ZdBXqQ2fFd
         yOrn1FJC0gCnw==
Date:   Thu, 17 Jun 2021 13:36:32 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     abhinavk@codeaurora.org
Cc:     Rob Clark <robdclark@gmail.com>, DTML <devicetree@vger.kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        David Airlie <airlied@linux.ie>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>
Subject: Re: [Freedreno] [RFC PATCH 00/13] drm/msm: Add Display Stream
 Compression Support
Message-ID: <YMsCiOThaPEvHs1S@vkoul-mobl>
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <CAOCk7Nqep_Db+z3fr5asHZ1u0j8+6fKkPFs2Ai8CbA_zGqV6ZA@mail.gmail.com>
 <YK3gxqXBRupN/N+Q@vkoul-mobl.Dlink>
 <CAOCk7NqvhGvYw8xCBctqj7H+o-Qwp2UuUJK1gatW9EWfXv56xA@mail.gmail.com>
 <CAF6AEGuoyPr8PgfwFX0JCYZ7S_pryn_OXacHBqoMAAPvSq6aRw@mail.gmail.com>
 <YLdlEB3Ea6OWaLw4@vkoul-mobl>
 <a14c18a2545408e8156dcafc846b17a2@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a14c18a2545408e8156dcafc846b17a2@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03-06-21, 16:40, abhinavk@codeaurora.org wrote:
> On 2021-06-02 04:01, Vinod Koul wrote:
> > On 27-05-21, 16:30, Rob Clark wrote:
> > 
> > yeah that is always a very different world. although it might make sense
> > to use information in tables and try to deduce information about the
> > system can be helpful...
> > 
> > > I'd worry more about what makes sense in a DT world, when it comes to
> > > DT bindings.
> > 
> > And do you have thoughts on that..?
> 
> At the moment, I will comment on the bindings first and my idea on how to
> proceed.
> The bindings mentioned here:
> https://lore.kernel.org/dri-devel/20210521124946.3617862-3-vkoul@kernel.org/
> seem to be just
> taken directly from downstream which was not the plan.
> 
> I think all of these should be part of the generic panel bindings as none of
> these are QC specific:

Okay so we have discussed this w/ Bjorn and Abhinav and here are the
conclusions and recommendations for binding

1. the properties are generic and not msm specific
2. The host supports multiple formats but the one we choose depends
mostly upon panel. Notably host runs the config which the panel supports.

So the recommendations is to add a table of dsc properties in the panel
driver. No DT binding here.

I should also note that for DP we should be able to calculate these
values from EDID like the i915 driver seems to do

With this I will drop the binding patch and move dsc properties to panel
driver

Thanks

-- 
~Vinod
