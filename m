Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAE4169FA96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Feb 2023 18:57:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbjBVR5V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 12:57:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbjBVR5U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 12:57:20 -0500
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1F893BDB8;
        Wed, 22 Feb 2023 09:57:18 -0800 (PST)
Received: from srv01.abscue.de (localhost [127.0.0.1])
        by spamfilter.srv.local (Postfix) with ESMTP id 157F71C0048;
        Wed, 22 Feb 2023 18:57:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
Received: from fluffy-mammal.metal.fwg-cag.de (dslb-092-073-092-061.092.073.pools.vodafone-ip.de [92.73.92.61])
        by srv01.abscue.de (Postfix) with ESMTPSA id 8F7521C0046;
        Wed, 22 Feb 2023 18:57:15 +0100 (CET)
Date:   Wed, 22 Feb 2023 18:57:08 +0100
From:   Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: qcom: Add global clock controller driver for
 MSM8917
Message-ID: <Y/ZXdO67/9X5xabE@fluffy-mammal.metal.fwg-cag.de>
References: <20230221174909.164029-1-otto.pflueger@abscue.de>
 <20230221174909.164029-3-otto.pflueger@abscue.de>
 <10b2ce9a-d838-6063-1646-90f91ce819e6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10b2ce9a-d838-6063-1646-90f91ce819e6@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 22, 2023 at 09:51:21AM +0100, Krzysztof Kozlowski wrote:
> On 21/02/2023 18:49, Otto Pflüger wrote:
> > This driver provides clocks, resets and power domains needed for various
> > components of the MSM8917 SoC and the very similar QM215 SoC.
> > 
> > According to [1] in the downstream kernel, the GPU clock has a different
> > source mapping on QM215 (gcc_gfx3d_map vs gcc_gfx3d_map_qm215).
> > 
> > [1]: https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/blob/LF.UM.8.6.2-28000-89xx.0/include/dt-bindings/clock/msm-clocks-hwio-8952.h#L298
> > 
> > Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> > ---
> >  drivers/clk/qcom/Kconfig       |    8 +
> >  drivers/clk/qcom/Makefile      |    1 +
> >  drivers/clk/qcom/gcc-msm8917.c | 3283 ++++++++++++++++++++++++++++++++
> >  3 files changed, 3292 insertions(+)
> >  create mode 100644 drivers/clk/qcom/gcc-msm8917.c
> > 
> > diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> > index 70d43f0a8919..3ef58b09385a 100644
> > --- a/drivers/clk/qcom/Kconfig
> > +++ b/drivers/clk/qcom/Kconfig
> > @@ -196,6 +196,14 @@ config MSM_GCC_8916
> >  	  Say Y if you want to use devices such as UART, SPI i2c, USB,
> >  	  SD/eMMC, display, graphics, camera etc.
> >  
> > +config MSM_GCC_8917
> > +	tristate "MSM8917 Global Clock Controller"
> 
> I propose to add here:
> 
> depends on ARM64 || COMPILE_TEST

Why should this driver only be enabled on ARM64 systems? In my opinion,
this should also be supported on 32-bit ARM, just like the other clock
drivers for the 64-bit SoCs. Users should be able to boot a 32-bit
kernel if they have to, e.g. if their device has broken firmware that
prohibits booting 64-bit kernels (there have been such cases with
MSM8916) or if they think that 64-bit systems use too much memory (my
QM215 device with 512MB RAM shipped with a 32-bit kernel for this very
reason).

> 
> > +	select QCOM_GDSC
> > +	help
> > +	  Support for the global clock controller on msm8917 devices.
> > +	  Say Y if you want to use devices such as UART, SPI i2c, USB,
> > +	  SD/eMMC, display, graphics, camera etc.
> > +
> 
> (...)
> > +
> > +static int gcc_msm8917_probe(struct platform_device *pdev)
> > +{
> > +	struct regmap *regmap;
> > +
> > +	regmap  = qcom_cc_map(pdev, &gcc_msm8917_desc);
> > +	if (IS_ERR(regmap))
> > +		return PTR_ERR(regmap);
> > +
> > +	if (of_device_is_compatible(pdev->dev.of_node, "qcom,gcc-qm215"))
> 
> Use data in of_device_id instead. This scales poorly if any new variant
> is added here. Unless no new variants will be added? Ever?

Thanks. There are a lot of other related SoCs (MSM8920, MSM8937, MSM8940,
MSM8952, SDM429 and SDM439) which could get added here as variants, so
I'll implement this using data in of_device_id.

Regards,
Otto Pflüger
