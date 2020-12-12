Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D11D2D8583
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Dec 2020 11:00:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438507AbgLLJ7m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Dec 2020 04:59:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:33072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438506AbgLLJ73 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Dec 2020 04:59:29 -0500
Date:   Sat, 12 Dec 2020 14:49:15 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607764759;
        bh=FLPkffs0ej+f6UCcn1abKFcBS9Sb8C3X+ml/Wh7LSKg=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=a2rE/1Q3OvsOyoMapSairTv3GNJzZHGdK33c893iZRiIM3DlNs14xJTTxrk4qDsxs
         etEGCLgXoAVXRblD+04q02rM0/sB5kod9FTQjRD/vrexvW3P4BwW2+KOavlmtCO3ah
         scAIdOV1r43SxQddpXu2svwUBRUSsbpX5Odcby4RX1vYZEEFXX7rhdoReFnvWwyjLB
         OnFb0dOr3OlX9xvABUIMH4GYLCUZaRb/X4IEOBhiC6mc2SgnR27B6vsx15wnDf+pRh
         D5kW3uDrZBBFhwiLtcotRMUEdtSR8+yBzS55+kLj0qoW9aK2cdIPK9X0w6T2+xpPbM
         Jd2nd5B+DlHIA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, kalyan_t@codeaurora.org,
        tanmay@codeaurora.org, abhinavk@codeaurora.org,
        robdclark@gmail.com, bjorn.andersson@linaro.org,
        rnayak@codeaurora.org, dianders@chromium.org, sibis@codeaurora.org
Subject: Re: [PATCH v9 1/2] dt-bindings: msm: disp: add yaml schemas for DPU
 and DSI bindings
Message-ID: <20201212091915.GC8403@vkoul-mobl>
References: <1607670585-26438-1-git-send-email-mkrishn@codeaurora.org>
 <160772823551.1580929.17011175154206191008@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <160772823551.1580929.17011175154206191008@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11-12-20, 15:10, Stephen Boyd wrote:
> Quoting Krishna Manikandan (2020-12-10 23:09:44)
> >  .../bindings/display/msm/dpu-sc7180.yaml           | 235 +++++++++++++++++++
> >  .../bindings/display/msm/dpu-sdm845.yaml           | 216 ++++++++++++++++++
> >  .../devicetree/bindings/display/msm/dpu.txt        | 141 ------------
> >  .../display/msm/dsi-common-controller.yaml         | 235 +++++++++++++++++++
> >  .../bindings/display/msm/dsi-controller-main.yaml  | 119 ++++++++++
> >  .../bindings/display/msm/dsi-phy-10nm.yaml         |  64 ++++++
> >  .../bindings/display/msm/dsi-phy-14nm.yaml         |  64 ++++++
> >  .../bindings/display/msm/dsi-phy-20nm.yaml         |  68 ++++++
> >  .../bindings/display/msm/dsi-phy-28nm.yaml         |  64 ++++++
> >  .../devicetree/bindings/display/msm/dsi-phy.yaml   |  81 +++++++
> >  .../devicetree/bindings/display/msm/dsi.txt        | 249 ---------------------
> >  11 files changed, 1146 insertions(+), 390 deletions(-)
> 
> This is quite a bit to review. Any chance to split it up into different
> patches? Looks like that could be: dpu, phy, and dsi to make this a bit
> more reviewable.

Yes that would certainly be very helpful for review.

Also I noticed that phy binding seem quite similar with few additions,
can we add a single binding document which documents .. or maybe check
with Rob.. what is the guidance, single doc or multiple..?

-- 
~Vinod
