Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8400255BCB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Aug 2020 16:00:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbgH1OAv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Aug 2020 10:00:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:33272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726614AbgH1OA3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Aug 2020 10:00:29 -0400
Received: from localhost (unknown [122.171.38.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1F9C22086A;
        Fri, 28 Aug 2020 14:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598623229;
        bh=e+NGXNVcRMFJD52on+AniSJrUCkn8PZHapatz4fw2l0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=w7X308tgOhAdUVjQ13X2pQxRIh9Ho/HbXNIDjUQmUOI6yJdLuP87eZ2XHLGyVLWuG
         uC1xIDikr424CFU/ASZoBR0/ZvC/yil00BfnMrDuxXNB1zeRvtSs98CWJ3bgHR9r4b
         RnELtxseoLz2iF0ioko8RHGk5YSRe3bFzjujwR0c=
Date:   Fri, 28 Aug 2020 19:30:25 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [PATCH v1 1/2] dt-bindings: display: bridge: Add documentation
 for LT9611UXC
Message-ID: <20200828140025.GW2639@vkoul-mobl>
References: <20200828120431.1636402-1-dmitry.baryshkov@linaro.org>
 <20200828120431.1636402-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200828120431.1636402-2-dmitry.baryshkov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28-08-20, 15:04, Dmitry Baryshkov wrote:
> Lontium LT9611UXC is a DSI to HDMI bridge which supports 2 DSI ports
> and I2S port as input and one HDMI port as output. The LT9611UXC chip is
> handled by a separate driver, but the bindings used are fully compatible
> with the LT9611 chip, so let's reuse the lt9611.yaml schema.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
