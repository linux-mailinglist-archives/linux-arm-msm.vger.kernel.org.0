Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EBD4183A2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2019 04:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbfEICQS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 May 2019 22:16:18 -0400
Received: from onstation.org ([52.200.56.107]:56930 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725842AbfEICQS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 May 2019 22:16:18 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id D17EA3E93E;
        Thu,  9 May 2019 02:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1557368177;
        bh=tmkrzCFkH/2BB60qHGR1FIeTOycpUvg0bsZt2RenJj4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vrIgonbPOsyhQUnSQavxiYuzFg2p2RJ6V0cNoEndlFVs9bQd14kx+Yn4NoHdfaTTA
         AheBy6TxmQlAuNm6VFM7ktM7MgtTlvwTKBBISivlWzlUyenbq0wClCIJf+Vfri0VX9
         /bZEl7e2Ig5Qcyqj9b8Gasm/3bC1mFgrD7lDx2CM=
Date:   Wed, 8 May 2019 22:16:16 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     robdclark@gmail.com, sean@poorly.run,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH RFC 4/6] ARM: dts: msm8974: add display support
Message-ID: <20190509021616.GA26228@basecamp>
References: <20190505130413.32253-1-masneyb@onstation.org>
 <20190505130413.32253-5-masneyb@onstation.org>
 <20190507063902.GA2085@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190507063902.GA2085@tuxbook-pro>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 06, 2019 at 11:39:02PM -0700, Bjorn Andersson wrote:
> On Sun 05 May 06:04 PDT 2019, Brian Masney wrote:
> > diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> [..]
> > +				clocks = <&mmcc MDSS_MDP_CLK>,
> > +				         <&mmcc MDSS_AHB_CLK>,
> > +				         <&mmcc MDSS_AXI_CLK>,
> > +				         <&mmcc MDSS_BYTE0_CLK>,
> > +				         <&mmcc MDSS_PCLK0_CLK>,
> > +				         <&mmcc MDSS_ESC0_CLK>,
> > +				         <&mmcc MMSS_MISC_AHB_CLK>;
> > +				clock-names = "mdp_core",
> > +				              "iface",
> > +				              "bus",
> > +				              "byte",
> > +				              "pixel",
> > +				              "core",
> > +				              "core_mmss";
> 
> Unless I enable MMSS_MMSSNOC_AXI_CLK and MMSS_S0_AXI_CLK I get some
> underrun error from DSI. You don't see anything like this?
> 
> (These clocks are controlled by msm_bus downstream and should be driven
> by interconnect upstream)
> 
> 
> Apart from this, I think this looks nice. Happy to see the progress.

No, I'm not seeing an underrun errors from the DSI. I think the clocks
are fine since I'm able to get this working with 4.17 using these same
clocks. I just sent out v2 and the cover letter has some details, along
with the full dmesg.

Brian
