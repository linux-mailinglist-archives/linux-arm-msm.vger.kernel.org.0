Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4F4C2AA484
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Nov 2020 12:05:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726665AbgKGLFb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Nov 2020 06:05:31 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:36300 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726242AbgKGLFb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Nov 2020 06:05:31 -0500
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id A254C20023;
        Sat,  7 Nov 2020 12:05:27 +0100 (CET)
Date:   Sat, 7 Nov 2020 12:05:26 +0100
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
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v4 0/2] Add LT9611UXC DSI to HDMI bridge support
Message-ID: <20201107110526.GA912360@ravnborg.org>
References: <20201102011435.1100930-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201102011435.1100930-1-dmitry.baryshkov@linaro.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=EUspDBNiAAAA:8 a=8n8SyL_cAAAA:8
        a=gyEoD_T1ygFEYnNRWQQA:9 a=CjuIK1q_8ugA:10 a=rMCfJy6NHDicN4J276Yl:22
        a=-K6Y0kWoOJXvxDHPO-NO:22
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry

On Mon, Nov 02, 2020 at 04:14:33AM +0300, Dmitry Baryshkov wrote:
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
> Changes since v3:
>  - Support for firmware upgrades
>  - Simplified modes table to include only used fields (w, h, refresh)
>  - Added more entries to display modes table, as more modes are
>    supported by the firmware
>  - Wait for EDID to be available from the hardware before reading it
>  - Do not store EDID in the interim buffer, lowering the size of
>    per-device struct

Thanks, driver is now applied to drm-misc-next.

	Sam
