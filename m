Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20F0BD1496
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2019 18:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731538AbfJIQvb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Oct 2019 12:51:31 -0400
Received: from onstation.org ([52.200.56.107]:53566 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731432AbfJIQva (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Oct 2019 12:51:30 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id BAD3A3E89B;
        Wed,  9 Oct 2019 16:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1570639889;
        bh=XuRSZUxqlEHuVzlpMa3RostZ9o3RMjnb4AAbLDyG678=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T06iGA5qp+VAkynZyImFdjFWH6v2KZuxbkYf0n8YKuB5Fyk1DpWhhk9uYLM7m7XeP
         IMpFzOiFszccfUZpJZTse7j+c2PP5dMpwJBMjFTjccmE0tPUwd0+CDRenOz6CsDInm
         2ErwCd4ddJOfkcQvPEqjDVwPWfP1Kn1310fpKS+k=
Date:   Wed, 9 Oct 2019 12:51:28 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     robdclark@gmail.com, sean@poorly.run, bjorn.andersson@linaro.org,
        a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
        airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, jonathan@marek.ca,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFC v2 4/5] ARM: dts: qcom: msm8974: add HDMI nodes
Message-ID: <20191009165128.GB1595@onstation.org>
References: <20191007014509.25180-1-masneyb@onstation.org>
 <20191007014509.25180-5-masneyb@onstation.org>
 <20191009022131.604B52070B@mail.kernel.org>
 <20191009060520.GA14506@onstation.org>
 <20191009153927.3DC5D21848@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009153927.3DC5D21848@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 09, 2019 at 08:39:26AM -0700, Stephen Boyd wrote:
> Quoting Brian Masney (2019-10-08 23:05:20)
> > On Tue, Oct 08, 2019 at 07:21:30PM -0700, Stephen Boyd wrote:
> > > Quoting Brian Masney (2019-10-06 18:45:08)
> > > > diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> > > > index 7fc23e422cc5..af02eace14e2 100644
> > > > --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> > > > +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> > > > @@ -1335,6 +1342,77 @@
> > > >                                 clocks = <&mmcc MDSS_AHB_CLK>;
> > > >                                 clock-names = "iface";
> > > >                         };
> > > > +
> > > > +                       hdmi: hdmi-tx@fd922100 {
> > > > +                               status = "disabled";
> > > > +
> > > > +                               compatible = "qcom,hdmi-tx-8974";
> > > > +                               reg = <0xfd922100 0x35c>,
> > > > +                                     <0xfc4b8000 0x60f0>;
> > > > +                               reg-names = "core_physical",
> > > > +                                           "qfprom_physical";
> > > 
> > > Is this the qfprom "uncorrected" physical address? If so, why can't this
> > > node use an nvmem to read whatever it needs out of the qfprom?
> > 
> > The MSM HDMI code is configured to look for this reg-name here:
> > 
> > https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/msm/hdmi/hdmi.c#L582
> > 
> > There is a qcom,qfprom configured for this board in DTS, however its at
> > a different address range, so maybe there are multiple qfproms?
> > 
> > https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/qcom-msm8974.dtsi#L424
> > 
> > msm8996.dtsi has the same style of configuration:
> > 
> > https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/qcom/msm8996.dtsi#L956
> > https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/qcom/msm8996.dtsi#L1736
> > 
> 
> There's only one qfprom and there's the address space that's
> "uncorrected" which is not supposed to be used and there's the space
> that is "corrected" and is supposed to be used. It looks like this is
> poking the uncorrected space and it should probably stop doing that and
> use the nvmem provider instead. Maybe someone with docs for this chip
> and 8996 can help confirm this.

Do you know of any publicly-available documentation that describes the
"uncorrected" and "corrected" addresses? I got that qfprom address for
the HDMI from here:

https://github.com/AICP/kernel_lge_hammerhead/blob/n7.1/arch/arm/boot/dts/msm8974-mdss.dtsi#L101

I assume the downstream kernel probably doesn't have the corrected
address anywhere else?

Brian

