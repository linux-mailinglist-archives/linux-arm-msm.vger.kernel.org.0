Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB38EB36C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2019 11:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731547AbfIPJBx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Sep 2019 05:01:53 -0400
Received: from onstation.org ([52.200.56.107]:40528 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729814AbfIPJBw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Sep 2019 05:01:52 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 9B6193E8F9;
        Mon, 16 Sep 2019 09:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1568624511;
        bh=u3nzc9gqP8MUC4JhGKxS32T+hxVY4syKzPf8LbbTamQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aOBRGkMlz/PhmAyVxvgfThua6X09O9qLt8s9Z4+G/dU8zpnBGCcD6NpbPyO3rS0Qw
         /GzuKCU0+FITC5ilWRJR5bvkSsGr0+bVtYVhSl/2Boz+5tl0ZiyVzEOgwWP1hg2fOz
         E5dvSFXBtHXZtL88w+C57HA9DPyvfZwZz6KJQBQA=
Date:   Mon, 16 Sep 2019 05:01:50 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Andrzej Hajda <a.hajda@samsung.com>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org,
        narmstrong@baylibre.com, robdclark@gmail.com, sean@poorly.run,
        airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@siol.net, linus.walleij@linaro.org,
        enric.balletbo@collabora.com, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 00/11] ARM: dts: qcom: msm8974: add support for external
 display
Message-ID: <20190916090150.GA349@onstation.org>
References: <CGME20190815004916epcas3p4d8a62e215eff5e227721d3449e6bfbd3@epcas3p4.samsung.com>
 <20190815004854.19860-1-masneyb@onstation.org>
 <2da29e80-73fb-8620-532e-0b5f54b00841@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2da29e80-73fb-8620-532e-0b5f54b00841@samsung.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Andrzej,

On Mon, Sep 16, 2019 at 10:13:58AM +0200, Andrzej Hajda wrote:
> Hi Brian,
> 
> On 15.08.2019 02:48, Brian Masney wrote:
> > This patch series begins to add support for the external display over
> > HDMI that is supported on msm8974 SoCs. I'm testing this series on the
> > Nexus 5, and I'm able to communicate with the HDMI bridge via the
> > analogix-anx78xx driver, however the external display is not working
> > yet.
> >
> > When I plug in the HDMI cable, the monitor detects that a device is
> > hooked up, but nothing is shown on the external monitor. The hot plug
> > detect GPIO (hpd-gpios) on the analogix-anx78xx bridge and MSM HDMI
> > drivers do not change state when the slimport adapter or HDMI cable is
> > plugged in or removed. I wonder if a regulator is not enabled somewhere?
> > I have a comment in patch 10 regarding 'hpd-gdsc-supply' that may
> > potentially be an issue.
> >
> > I'm still digging in on this, however I'd appreciate any feedback if
> > anyone has time. Most of these patches are ready now, so I marked the
> > ones that aren't ready with 'PATCH RFC'.
> >
> > I'm using an Analogix Semiconductor SP6001 SlimPort Micro-USB to 4K HDMI
> > Adapter to connect my phone to an external display via a standard HDMI
> > cable. This works just fine with the downstream MSM kernel using
> > Android.
> 
> 
> This patchset risks to be forgotten. To avoid it, at least partially, I
> can merge patches 1-5, is it OK for you?

That would be great if you could do that.

Thanks,

Brian
