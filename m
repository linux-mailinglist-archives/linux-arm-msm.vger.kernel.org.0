Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4697FB3859
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2019 12:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbfIPKkH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Sep 2019 06:40:07 -0400
Received: from onstation.org ([52.200.56.107]:40854 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726055AbfIPKkH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Sep 2019 06:40:07 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id BA7C13E8F9;
        Mon, 16 Sep 2019 10:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1568630406;
        bh=wtwhbwzLFX1hOxjHI6Km7YJYGl4UdbLbrZnDLLvMrxY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZCbe4Dvg00xGUQPAJF2/aulQkpQnoxQ9lj5hlCcH+yDvWz62utM+p5k/NFiRgU5g7
         ejeE3yaBaSO72f5dG0dLexNQgj3mUW/ZcK9AIHSwI0LwXFUiGBSvVZMgPYYx4dpRRy
         Q2xqU7xpuIY37lxivUDxElfp7rj2ouOFcdwdZimc=
Date:   Mon, 16 Sep 2019 06:40:04 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     Andrzej Hajda <a.hajda@samsung.com>, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, agross@kernel.org, narmstrong@baylibre.com,
        robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, mark.rutland@arm.com,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@siol.net, linus.walleij@linaro.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 05/11] drm/bridge: analogix-anx78xx: correct value of
 TX_P0
Message-ID: <20190916104004.GB1644@onstation.org>
References: <20190815004854.19860-1-masneyb@onstation.org>
 <CGME20190815004918epcas3p135042bc52c7e3c8b1aca7624d121af97@epcas3p1.samsung.com>
 <20190815004854.19860-6-masneyb@onstation.org>
 <dc10dd84-72e2-553e-669b-271b77b4a21a@samsung.com>
 <98199a9b-f7e0-ef95-62d7-401273457692@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <98199a9b-f7e0-ef95-62d7-401273457692@collabora.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 16, 2019 at 12:36:19PM +0200, Enric Balletbo i Serra wrote:
> Hi Andrzej and Brian
> 
> On 16/9/19 12:02, Andrzej Hajda wrote:
> > On 15.08.2019 02:48, Brian Masney wrote:
> >> When attempting to configure this driver on a Nexus 5 phone (msm8974),
> >> setting up the dummy i2c bus for TX_P0 would fail due to an -EBUSY
> >> error. The downstream MSM kernel sources [1] shows that the proper value
> >> for TX_P0 is 0x78, not 0x70, so correct the value to allow device
> >> probing to succeed.
> >>
> >> [1] https://github.com/AICP/kernel_lge_hammerhead/blob/n7.1/drivers/video/slimport/slimport_tx_reg.h
> >>
> >> Signed-off-by: Brian Masney <masneyb@onstation.org>
> >> ---
> >>  drivers/gpu/drm/bridge/analogix-anx78xx.h | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/analogix-anx78xx.h b/drivers/gpu/drm/bridge/analogix-anx78xx.h
> >> index 25e063bcecbc..bc511fc605c9 100644
> >> --- a/drivers/gpu/drm/bridge/analogix-anx78xx.h
> >> +++ b/drivers/gpu/drm/bridge/analogix-anx78xx.h
> >> @@ -6,7 +6,7 @@
> >>  #ifndef __ANX78xx_H
> >>  #define __ANX78xx_H
> >>  
> >> -#define TX_P0				0x70
> >> +#define TX_P0				0x78
> > 
> > 
> > This bothers me little. There are no upstream users, grepping android
> > sources suggests that both values can be used [1][2]  (grep for "#define
> > TX_P0"), moreover there is code suggesting both values can be valid [3].
> > 
> > Could you verify datasheet which i2c slave addresses are valid for this
> > chip, if both I guess this patch should be reworked.
> > 
> 
> On my case the valid i2c slave address is 0x70 (from datasheet, very sorry I
> can't share it) and the bridge used is an ANX7814, it could be that ANX7808 or
> ANX7812 have different slave addresses?

I haven't been able to find any of the datasheets for these devices
online. Product briefs are online (such as 
https://www.analogix.com/en/system/files/ANX7808_product_brief.pdf), but
they don't provide this type of information.

Brian
