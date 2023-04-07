Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DCB36DB0CD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Apr 2023 18:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbjDGQpq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 12:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjDGQpq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 12:45:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E330F6A47;
        Fri,  7 Apr 2023 09:45:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7BBC460DCE;
        Fri,  7 Apr 2023 16:45:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DF11C433D2;
        Fri,  7 Apr 2023 16:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680885943;
        bh=tHJgQ5/rc7lyGam1OcOC6j1nFu/1mgMUv8ocZI2GKQA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kFOG3WpPP34gCnZFRop71lkodu0O+IZsHqStX/goJW0XqT/evHrbPi8aEyX9T69G2
         YltGw9NROKvYkwfH6Xyp9bhLuPc2BEjWlnVi7Obt/RXynBpl2n7g3IlKhh/1tVfuHg
         vQuxN3mjtuE0MklNLrZib+FcyETOe+IMrqfdc8vhDqvzxC21hwml7EzEoX0AEd+ysL
         BKUCBe0TE2ZFnJPxyGtLfL76OLDYOLFclk6xJRrZKKLcNCMewQRz1SHIQ2P0jdSu0f
         41yWLmJ007i9OT54ZdBeCAF2gi/jhxTT1Fn2NK66kbhlNo4Wnp7lruudnXl7EO5v6t
         sOD5iHys4UDCw==
Date:   Fri, 7 Apr 2023 09:48:33 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH] arm64: dts: qcom: add device tree for DB845c working
 in dual DSI mode
Message-ID: <20230407164833.2ws22rr4lu6g25dj@ripper>
References: <20230118082048.2198715-1-dmitry.baryshkov@linaro.org>
 <20230118173242.cjh5izohjros6wxd@builder.lan>
 <DFBA966D-3AAF-4E6D-880C-897CB901AEE1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DFBA966D-3AAF-4E6D-880C-897CB901AEE1@linaro.org>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 18, 2023 at 08:47:53PM +0200, Dmitry Baryshkov wrote:
> 18 января 2023 г. 19:32:42 GMT+02:00, Bjorn Andersson <andersson@kernel.org> пишет:
> >On Wed, Jan 18, 2023 at 10:20:48AM +0200, Dmitry Baryshkov wrote:
> >> While we are testing the DB845c working in dual DSI mode (which is
> >> required for the 4k support), create a separate device tree using this
> >> configuration.
> >> 
> >
> >I don't think it's right to change the DTB on your device depending on
> >your TV's ability to do 4k or not...
> >
> >I ran into this problem when playing around with 4k-support on the RB3
> >as well a while back. I was not able to figure out a way to run the
> >lt9611 off two inputs for the lower resolutions and ended never posted
> >anything because I couldn't come up with any good solution.
> 
> 
> This is implemented with the latest lt9611 patchset, referenced in the patch annotation.
> 
> I posted this as an RFC with the separate dts to let people test dual DSI, DPU wide planes, etc. and to compare that with plain old single link DSI/lt9611. 
> 
> >
> >
> >Would it be possible somehow to describe the two ports in DT, but have
> >the display driver use one or both depending on the number of inputs
> >needed by the lt9611?
> 
> This would be very problemsome. Even switching the number of lanes
> goes against the standard and is not supported by Linux kernel.
> Supporting switching the host off and on would be a real troublle.
> 

Does this imply that switching resolution in runtime is not possible for
any of these DSI->HDMI/DP/eDP bridges?

The immediate worry is that we need 4k and non-4k variants of every
mezzanine (unless we start doing overlays). But beyond that I still
don't like the fact that you need to change firmware depending on which
monitor/TV you're going to connect the board to. (And with the current
boot.img-based design, this is overly cumbersome)

Regards,
Bjorn

> Hopefully, this is is not necessary.
> 
> >
> >Regards,
> >Bjorn
> >
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> ---
> >> 
> >> Dependencies to be able to verify the 4k@30 mode:
> >> [1] https://lore.kernel.org/linux-arm-msm/20221229191856.3508092-1-dmitry.baryshkov@linaro.org/
> >> [2] https://lore.kernel.org/dri-devel/20230118081658.2198520-1-dmitry.baryshkov@linaro.org/
> >> 
> >> ---
> >>  arch/arm64/boot/dts/qcom/Makefile             |  1 +
> >>  .../boot/dts/qcom/sdm845-db845c-dual-dsi.dts  | 48 +++++++++++++++++++
> >>  2 files changed, 49 insertions(+)
> >>  create mode 100644 arch/arm64/boot/dts/qcom/sdm845-db845c-dual-dsi.dts
> >> 
> >> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> >> index 3e79496292e7..dc55c3b989a4 100644
> >> --- a/arch/arm64/boot/dts/qcom/Makefile
> >> +++ b/arch/arm64/boot/dts/qcom/Makefile
> >> @@ -139,6 +139,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r1.dtb
> >>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
> >>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
> >>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
> >> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c-dual-dsi.dtb
> >>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c-navigation-mezzanine.dtb
> >>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyln.dtb
> >>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyp.dtb
> >> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-dual-dsi.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c-dual-dsi.dts
> >> new file mode 100644
> >> index 000000000000..4a366dedc841
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-dual-dsi.dts
> >> @@ -0,0 +1,48 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * Copyright (c) 2023, Linaro Ltd.
> >> + */
> >> +
> >> +#include "sdm845-db845c.dts"
> >> +
> >> +&dsi0 {
> >> +	qcom,dual-dsi-mode;
> >> +	qcom,master-dsi;
> >> +};
> >> +
> >> +&dsi1 {
> >> +	vdda-supply = <&vreg_l26a_1p2>;
> >> +
> >> +	qcom,dual-dsi-mode;
> >> +
> >> +	/* DSI1 is slave, so use DSI0 clocks */
> >> +	assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
> >> +
> >> +	status = "okay";
> >> +
> >> +	ports {
> >> +		port@1 {
> >> +			endpoint {
> >> +				remote-endpoint = <&lt9611_b>;
> >> +				data-lanes = <0 1 2 3>;
> >> +			};
> >> +		};
> >> +	};
> >> +};
> >> +
> >> +&dsi1_phy {
> >> +	vdds-supply = <&vreg_l1a_0p875>;
> >> +	status = "okay";
> >> +};
> >> +
> >> +&lt9611_codec {
> >> +	ports {
> >> +		port@1 {
> >> +			reg = <1>;
> >> +
> >> +			lt9611_b: endpoint {
> >> +				remote-endpoint = <&dsi1_out>;
> >> +			};
> >> +		};
> >> +	};
> >> +};
> >> -- 
> >> 2.39.0
> >> 
> 
