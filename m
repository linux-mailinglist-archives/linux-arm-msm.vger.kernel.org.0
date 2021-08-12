Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 901BE3E9F49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 09:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234281AbhHLHNo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 03:13:44 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:52206 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234547AbhHLHNn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 03:13:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628752398; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=E1QdHLZ0oxrRgaZAm7gQOCDfJqgmbLn+4sMn2tfI2Uc=;
 b=qXMbi6dTXqONL3SuboZjiFDyLdxN4vl24xRRWgzuOHtm27Kaq2AKpPyF1ax6BSHnRk4z5qHx
 /qHJv5LEwGL+LBnXy6fMAURvrRpGyXfMdPFTDy6MmmUwjkr8K3GHsIk1W31eY2o9SBY4PbZS
 cNaHOqHL9ywK0jhdEC2zxVxiVyg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6114ca0a454b7a558fbcab19 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 12 Aug 2021 07:13:14
 GMT
Sender: rajpat=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 955C2C43217; Thu, 12 Aug 2021 07:13:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rajpat)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BD122C433F1;
        Thu, 12 Aug 2021 07:13:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 12 Aug 2021 12:43:11 +0530
From:   rajpat@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org
Subject: Re: [PATCH V4 2/4] arm64: dts: sc7280: Add QUPv3 wrapper_0 nodes
In-Reply-To: <YRPkI8AQAjjFuXcf@google.com>
References: <1627306847-25308-1-git-send-email-rajpat@codeaurora.org>
 <1627306847-25308-3-git-send-email-rajpat@codeaurora.org>
 <YP7cmkayoajJ+1yj@google.com>
 <bdfd39def9a11104c043090d920ef4df@codeaurora.org>
 <YRPkI8AQAjjFuXcf@google.com>
Message-ID: <71fd47e7a83e2c56c96e2638004a7812@codeaurora.org>
X-Sender: rajpat@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-08-11 20:22, Matthias Kaehlcke wrote:
> On Wed, Aug 11, 2021 at 05:43:48PM +0530, rajpat@codeaurora.org wrote:
>> On 2021-07-26 21:32, Matthias Kaehlcke wrote:
>> > On Mon, Jul 26, 2021 at 07:10:45PM +0530, Rajesh Patil wrote:
>> > > From: Roja Rani Yarubandi <rojay@codeaurora.org>
>> > >
>> > > Add QUPv3 wrapper_0 DT nodes for SC7280 SoC.
>> > >
>> > > Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
>> > > Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
>> > > ---
>> > > Changes in V4:
>> > >  - As per Bjorn's comment, added QUP Wrapper_0 nodes
>> > >    other than debug-uart node
>> > >  - Dropped interconnect votes for wrapper_0 node
>> > >
>> > > Changes in V3:
>> > >  - Broken the huge V2 patch into 3 smaller patches.
>> > >    1. QSPI DT nodes
>> > >    2. QUP wrapper_0 DT nodes
>> > >    3. QUP wrapper_1 DT nodes
>> > >
>> > > Changes in V2:
>> > >  - As per Doug's comments removed pinmux/pinconf subnodes.
>> > >  - As per Doug's comments split of SPI, UART nodes has been done.
>> > >  - Moved QSPI node before aps_smmu as per the order.
>> > >
>> > >  arch/arm64/boot/dts/qcom/sc7280-idp.dts |  84 ++++
>> > >  arch/arm64/boot/dts/qcom/sc7280.dtsi    | 720
>> > > ++++++++++++++++++++++++++++++++
>> > >  2 files changed, 804 insertions(+)
>> > >
>> > > diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> > > b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> > > index b0bfd8e..f63cf51 100644
>> > > --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> > > +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> > > @@ -358,6 +358,16 @@
>> > >  	vdda18-supply = <&vreg_l1c_1p8>;
>> > >  };
>> > >
>> > > +&uart7 {
>> > > +	status = "okay";
>> > > +
>> > > +	/delete-property/interrupts;
>> > > +	interrupts-extended = <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
>> > > +				<&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
>> > > +	pinctrl-names = "default", "sleep";
>> > > +	pinctrl-1 = <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>,
>> > > <&qup_uart7_sleep_tx>, <&qup_uart7_sleep_rx>;
>> > > +};
>> > > +
>> > >  /* PINCTRL - additions to nodes defined in sc7280.dtsi */
>> > >
>> > >  &qspi_cs0 {
>> > > @@ -428,3 +438,77 @@
>> > >  		bias-pull-up;
>> > >  	};
>> > >  };
>> > > +&qup_uart7_cts {
>> > > +	/*
>> > > +	 * Configure a pull-down on CTS to match the pull of
>> > > +	 * the Bluetooth module.
>> > > +	 */
>> > > +	bias-pull-down;
>> > > +};
>> > > +
>> > > +&qup_uart7_rts {
>> > > +	/* We'll drive RTS, so no pull */
>> > > +	drive-strength = <2>;
>> > > +	bias-disable;
>> > > +};
>> > > +
>> > > +&qup_uart7_tx {
>> > > +	/* We'll drive TX, so no pull */
>> > > +	drive-strength = <2>;
>> > > +	bias-disable;
>> > > +};
>> > > +
>> > > +&qup_uart7_rx {
>> > > +	/*
>> > > +	 * Configure a pull-up on RX. This is needed to avoid
>> > > +	 * garbage data when the TX pin of the Bluetooth module is
>> > > +	 * in tri-state (module powered off or not driving the
>> > > +	 * signal yet).
>> > > +	 */
>> > > +	bias-pull-up;
>> > > +};
>> > > +
>> > > +&tlmm {
>> > > +	qup_uart7_sleep_cts: qup-uart7-sleep-cts {
>> > > +		pins = "gpio28";
>> > > +		function = "gpio";
>> > > +		/*
>> > > +		 * Configure a pull-down on CTS to match the pull of
>> > > +		 * the Bluetooth module.
>> > > +		 */
>> > > +		bias-pull-down;
>> > > +	};
>> > > +
>> > > +	qup_uart7_sleep_rts: qup-uart7-sleep-rts {
>> > > +		pins = "gpio29";
>> > > +		function = "gpio";
>> > > +		/*
>> > > +		 * Configure pull-down on RTS. As RTS is active low
>> > > +		 * signal, pull it low to indicate the BT SoC that it
>> > > +		 * can wakeup the system anytime from suspend state by
>> > > +		 * pulling RX low (by sending wakeup bytes).
>> > > +		 */
>> > > +		bias-pull-down;
>> > > +	};
>> > > +
>> > > +	qup_uart7_sleep_tx: qup-uart7-sleep-tx {
>> > > +		pins = "gpio30";
>> > > +		function = "gpio";
>> > > +		/*
>> > > +		 * Configure pull-up on TX when it isn't actively driven
>> > > +		 * to prevent BT SoC from receiving garbage during sleep.
>> > > +		 */
>> > > +		bias-pull-up;
>> > > +	};
>> > >
>> > > +	qup_uart7_sleep_rx: qup-uart7-sleep-rx {
>> > > +		pins = "gpio31";
>> > > +		function = "gpio";
>> > > +		/*
>> > > +		 * Configure a pull-up on RX. This is needed to avoid
>> > > +		 * garbage data when the TX pin of the Bluetooth module
>> > > +		 * is floating which may cause spurious wakeups.
>> > > +		 */
>> > > +		bias-pull-up;
>> > > +	};
>> > > +};
>> >
>> > How the patches of this series are split strikes me as a bit odd.
>> > Supposedly
>> > this patch adds the QUPv3 wrapper_0 DT nodes for the SC7280, however the
>> > above is the pin configuration for the Bluetooth UART of the SC7280 IDP
>> > board.
>> > I don't see a good reason why that should be part of this patch. It
>> > should be
>> > a separate change whose subject indicates that it configures the
>> > Bluetooth UART
>> > of the SC7280 IDP.
>> >
>> 
>> Okay will split this up.
>> 
>> > Without this conflation of SoC and board DT it would seem perfectly
>> > reasonable
>> > to squash this patch and '[4/4] arm64: dts: sc7280: Add QUPv3 wrapper_1
>> > nodes'
>> > into a single one, they are essentially doing the same thing, I see no
>> > need to
>> > have different patches for the wrapper 0 and 1 nodes.
>> 
>> Previously when QUP wrapper 0 and wrapper 1 nodes were added in single
>> patch, we faced some git issues as the patch was huge. Hence we split 
>> it up.
>> https://partnerissuetracker.corp.google.com/issues/177045897#comment12
> 
> That bug tracker entry isn't public, this is what the comment says:
> 
>> I suspect that diff is just having a hard time since your patch 
>> touches so
>> much stuff. Presumably you could make it happier if you broke your 
>> patch
>> into smaller changes. For instance:
>> 
>> One patch that adds the quad SPI. After all the quad SPI isn't really
>> related to the other QUP stuff. One patch that fixes up the existing
>> "uart5" and the QUP it's on to be how it's supposed to be. One patch
>> that adds all the new stuff.
> 
> If I understand correctly the problem wasn't that the QUP wrappers are
> added in a single patch (which should be pretty straightforward to
> review), but that the previous patch(es) do too many things at once.
> Adding both QUP wrappers is conceptionally a single thing, the problem
> is intermingling that with adding board specific Bluetooth nodes, board
> flash nodes, pinconf for UART, etc

Even after splitting the patches as suggested(i.e., additions and 
modifications separately), if I add qup wrapper0 and wrapper1 nodes in 
single patch the git diff is getting messed up. pasted the diff for 
reference


+                       qup_spi14_cs_gpio: qup-spi14-cs_gpio {
+                               pins = "gpio59";
+                               function = "gpio";
+                       };

-                       assigned-clocks = <&gcc 
GCC_USB30_PRIM_MOCK_UTMI_CLK>,
-                                         <&gcc 
GCC_USB30_PRIM_MASTER_CLK>;
-                       assigned-clock-rates = <19200000>, <200000000>;
+                       qup_spi15_data_clk: qup-spi15-data-clk {
+                               pins = "gpio60", "gpio61", "gpio62";
+                               function = "qup17";
+                       };

-                       interrupts-extended = <&intc GIC_SPI 131 
IRQ_TYPE_LEVEL_HIGH>,
-                                             <&pdc 14 
IRQ_TYPE_EDGE_BOTH>,
-                                             <&pdc 15 
IRQ_TYPE_EDGE_BOTH>,
-                                             <&pdc 17 
IRQ_TYPE_LEVEL_HIGH>;
-                       interrupt-names = "hs_phy_irq", "dp_hs_phy_irq",
-                                         "dm_hs_phy_irq", "ss_phy_irq";
+                       qup_spi15_cs: qup-spi15-cs {
+                               pins = "gpio63";
+                               function = "qup17";
+                       };


-                       power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
+                       qup_spi15_cs_gpio: qup-spi15-cs_gpio {
+                               pins = "gpio63";
+                               function = "gpio";
+                       };

