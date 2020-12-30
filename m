Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4F0D2E7CF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Dec 2020 23:33:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbgL3WdW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Dec 2020 17:33:22 -0500
Received: from onstation.org ([52.200.56.107]:47492 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726247AbgL3WdW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Dec 2020 17:33:22 -0500
X-Greylist: delayed 564 seconds by postgrey-1.27 at vger.kernel.org; Wed, 30 Dec 2020 17:33:21 EST
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id AE59F3E8D2;
        Wed, 30 Dec 2020 22:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1609366996;
        bh=IO97hBKclf62Z6XkzLno8Gm7zc22qf/az+/t9PnUGAM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hYqvGK+XceG5NJzvdmWyLxqZHUCkrankRcEpKEntEfIcwc9gk2CQ2+gomUBqY3swu
         xgS2F0Yq6qFcBl8BZsJQkf5equZDpOWAj93d7apqYPLfRaXkSPsMPn1G2jv4MV+ial
         0bmLFLbU1STmQlnHuhkhCA9zGgdkZi8ntEBxoPbY=
Date:   Wed, 30 Dec 2020 17:23:14 -0500
From:   Brian Masney <masneyb@onstation.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Rob Clark <robdclark@gmail.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Craig Tatlor <ctatlor97@gmail.com>
Subject: Re: [PATCH 1/2] drm/msm: Call msm_init_vram before binding the gpu
Message-ID: <20201230222314.GB8627@onstation.org>
References: <20201230152944.3635488-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201230152944.3635488-1-iskren.chernev@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 30, 2020 at 05:29:42PM +0200, Iskren Chernev wrote:
> From: Craig Tatlor <ctatlor97@gmail.com>
> 
> vram.size is needed when binding a gpu without an iommu and is defined
> in msm_init_vram(), so run that before binding it.
> 
> Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>

For the series:

Reviewed-by: Brian Masney <masneyb@onstation.org>

Next time, please include a cover letter so that tags added to the cover
letter can be applied to all patches in the series via patchwork.

Brian
