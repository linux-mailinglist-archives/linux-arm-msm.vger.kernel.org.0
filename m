Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFF5129103E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Oct 2020 08:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437190AbgJQGse (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Oct 2020 02:48:34 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:35408 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437182AbgJQGse (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Oct 2020 02:48:34 -0400
X-Greylist: delayed 406 seconds by postgrey-1.27 at vger.kernel.org; Sat, 17 Oct 2020 02:48:33 EDT
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 08C0F80608;
        Sat, 17 Oct 2020 08:41:44 +0200 (CEST)
Date:   Sat, 17 Oct 2020 08:41:43 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Jonas Karlman <jonas@kwiboo.se>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 0/2] Add LT9611UXC DSI to HDMI bridge support
Message-ID: <20201017064143.GI2242298@ravnborg.org>
References: <20200909092823.64810-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200909092823.64810-1-dmitry.baryshkov@linaro.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=EUspDBNiAAAA:8 a=8n8SyL_cAAAA:8
        a=9PYKBtNqa2uEeENYDCgA:9 a=CjuIK1q_8ugA:10 a=rMCfJy6NHDicN4J276Yl:22
        a=-K6Y0kWoOJXvxDHPO-NO:22
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry

On Wed, Sep 09, 2020 at 12:28:21PM +0300, Dmitry Baryshkov wrote:
> Hi,
> 
> This series adds support for Lontium LT9611UXC bridge chip which takes
> MIPI DSI as input and provides HDMI signal as output.
> 
> The chip can be found in Qualcomm RB5 platform [1], [2].
> 
> [1] https://www.qualcomm.com/products/qualcomm-robotics-rb5-platform
> [2] https://www.thundercomm.com/app_en/product/1590131656070623
> 
> Changes since v2:
>  - Squashed connector support into main patch
>  - Added comment on modes table
>  - Dropped display timings support, covered by EDID
>  - Dropped sleep mode support
>  - Dropped hpd_status reading from ISR handler
>  - Added "sentinel" comments to empty table entries
> 
> Changes since v1:
>  - Fix whitespaces/indentation
>  - Support working without DRM_BRIDGE_ATTACH_NO_CONNECTOR

Sorry for taking so long time to get back to you.
Which display driver will this be used together with?

The preference is that the display driver adds support for
creating the connector so we can drop this from the bridge
as this is not how things should be done these days.

All the rest looked good.

	Sam
