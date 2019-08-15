Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC2D18F728
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2019 00:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733054AbfHOWoU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Aug 2019 18:44:20 -0400
Received: from onstation.org ([52.200.56.107]:49656 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731244AbfHOWoU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Aug 2019 18:44:20 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id B4B0B3E998;
        Thu, 15 Aug 2019 22:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1565909059;
        bh=czM1Vfno+UFHpzvoNlZgvzbIsi/W/guZt8ysTusqBg8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z707lNUjzuIsbtPXSccR8bANmWJFP6d0utJUK+yc8rOPnV4fltz0acMoPYc0Gth9O
         9UmsjR4gMyWahWR+mUwz0JP9vIZHWTzezy6ZO8awAhHdaSSFZsP5nzvVceVqRxtZ6G
         FF0g1ay6/KWQatmMJPp2UFMvfQyb5QJEn8UXok28=
Date:   Thu, 15 Aug 2019 18:44:17 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        freedreno <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH 09/11] ARM: dts: qcom: pm8941: add 5vs2 regulator node
Message-ID: <20190815224417.GA32072@onstation.org>
References: <20190815004854.19860-1-masneyb@onstation.org>
 <20190815004854.19860-10-masneyb@onstation.org>
 <CACRpkdYU-6LvFKRkj0yMMCmAnX0XtGe7rMwbXbhf2GCp77Ciyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYU-6LvFKRkj0yMMCmAnX0XtGe7rMwbXbhf2GCp77Ciyw@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 15, 2019 at 10:34:17AM +0200, Linus Walleij wrote:
> On Thu, Aug 15, 2019 at 2:49 AM Brian Masney <masneyb@onstation.org> wrote:
> 
> > pm8941 is missing the 5vs2 regulator node so let's add it since its
> > needed to get the external display working. This regulator was already
> > configured in the interrupts property on the parent node.
> >
> > Note that this regulator is referred to as mvs2 in the downstream MSM
> > kernel sources.
> 
> When I looked at it it seemed like this convention is used for power
> supplies that appear on both the main PMIC and the "extra (boot? basic?
> low power?) PMIC that the main 80xx PMIC has mvs1 and the
> other 89xx PMIC has mvs2.

According to the downstream MSM sources, the 5vs1 and 5vs2 rails are
both on the second pm8941 PMIC:

https://github.com/AICP/kernel_lge_hammerhead/blob/n7.1/arch/arm/boot/dts/msm8974-regulator.dtsi#L18

> I suppose it is named "mvs" on both PMICs and this is just a rail
> name so as not to confuse the schematic?

That sounds reasonable.

> > Signed-off-by: Brian Masney <masneyb@onstation.org>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thank you!

Brian
