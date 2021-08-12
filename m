Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 737F73EA4E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 14:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237234AbhHLMuV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 08:50:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232200AbhHLMuU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 08:50:20 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADC0BC061765
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 05:49:55 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id bo18so9413029pjb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 05:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5z0VowACz7VDyFWYhf5Cy8tEEuH9sKtUeLjj1X1gkAI=;
        b=jV8XjH/ivkKLoOOqhHVooa/MFuAMdidUq1vkDJSP4ySAwN1feA+PcX3ryvq3u8M57C
         rXr/aWdju259m/4moctfZUigX9KJIpfaqLm0+epPxcoIhgAQ3VcqoGwqP9i70vreZect
         B91AfY2kHiDOmhmYVRT8FaW44YRZ8gN6VXvU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5z0VowACz7VDyFWYhf5Cy8tEEuH9sKtUeLjj1X1gkAI=;
        b=QEjK6PFoRdNsE1N23oQbAvvdaOPgiZ6QiB/BH18f3s10bnKNtYJ2Wkf9XJUqE7ac+s
         +ydVCTFRoYG8g2W8teY964ICx5S5ELUIlC4k0JBMlc5VfW/WrNV63G36LzQtHi2elmQu
         DNaT8tGnnPsF/7lFY2U7hO3XRmob/oBA/xjSCUJ9vfG82mkOoDTrhAt7iPrFVLBW2lUq
         PF6bDnldHG8ndOr9QviOt9k+3p8SA+KDfgEqRd0LMrFOsxMDJfhMVBWvy3A2vPu+Rs3V
         jz/uMtBBUprrxxy/75x3IBTx8oqD4kzBC7u20HhYvuLxiWGzEXRkHei8OOBm0DXFR8rq
         kPmg==
X-Gm-Message-State: AOAM533JT2s4AjVQ9QB+d8Q3QueD97FpZ4jK5fBs0wOnS9q3/5RoDBVb
        2KwNxHRVRQPUjX5W0n1yS9r41Q==
X-Google-Smtp-Source: ABdhPJygBWv3m1fW/5ZUmjk8RDvXWMWkUQJxUwExxcjgFYPujCdWcsdMIJo1hmZq6O7GOBVcp8LKHQ==
X-Received: by 2002:a63:5f15:: with SMTP id t21mr537152pgb.391.1628772595146;
        Thu, 12 Aug 2021 05:49:55 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:9d69:4059:b8a6:e36f])
        by smtp.gmail.com with UTF8SMTPSA id s15sm2461167pjr.9.2021.08.12.05.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Aug 2021 05:49:54 -0700 (PDT)
Date:   Thu, 12 Aug 2021 05:49:53 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     rajpat@codeaurora.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org
Subject: Re: [PATCH V4 2/4] arm64: dts: sc7280: Add QUPv3 wrapper_0 nodes
Message-ID: <YRUY8fpm2AuqNqN+@google.com>
References: <1627306847-25308-1-git-send-email-rajpat@codeaurora.org>
 <1627306847-25308-3-git-send-email-rajpat@codeaurora.org>
 <YP7cmkayoajJ+1yj@google.com>
 <bdfd39def9a11104c043090d920ef4df@codeaurora.org>
 <YRPkI8AQAjjFuXcf@google.com>
 <71fd47e7a83e2c56c96e2638004a7812@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <71fd47e7a83e2c56c96e2638004a7812@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 12, 2021 at 12:43:11PM +0530, rajpat@codeaurora.org wrote:
> On 2021-08-11 20:22, Matthias Kaehlcke wrote:
> > On Wed, Aug 11, 2021 at 05:43:48PM +0530, rajpat@codeaurora.org wrote:
> > > On 2021-07-26 21:32, Matthias Kaehlcke wrote:
> > > > On Mon, Jul 26, 2021 at 07:10:45PM +0530, Rajesh Patil wrote:
> > > > > From: Roja Rani Yarubandi <rojay@codeaurora.org>
> > > > >
> > > > > Add QUPv3 wrapper_0 DT nodes for SC7280 SoC.
> > > > >
> > > > > Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> > > > > Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
> > > > > ---
> > > > > Changes in V4:
> > > > >  - As per Bjorn's comment, added QUP Wrapper_0 nodes
> > > > >    other than debug-uart node
> > > > >  - Dropped interconnect votes for wrapper_0 node
> > > > >
> > > > > Changes in V3:
> > > > >  - Broken the huge V2 patch into 3 smaller patches.
> > > > >    1. QSPI DT nodes
> > > > >    2. QUP wrapper_0 DT nodes
> > > > >    3. QUP wrapper_1 DT nodes
> > > > >
> > > > > Changes in V2:
> > > > >  - As per Doug's comments removed pinmux/pinconf subnodes.
> > > > >  - As per Doug's comments split of SPI, UART nodes has been done.
> > > > >  - Moved QSPI node before aps_smmu as per the order.
> > > > >
> > > > >  arch/arm64/boot/dts/qcom/sc7280-idp.dts |  84 ++++
> > > > >  arch/arm64/boot/dts/qcom/sc7280.dtsi    | 720
> > > > > ++++++++++++++++++++++++++++++++
> > > > >  2 files changed, 804 insertions(+)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> > > > > b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> > > > > index b0bfd8e..f63cf51 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> > > > > +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> > > > > @@ -358,6 +358,16 @@
> > > > >  	vdda18-supply = <&vreg_l1c_1p8>;
> > > > >  };
> > > > >
> > > > > +&uart7 {
> > > > > +	status = "okay";
> > > > > +
> > > > > +	/delete-property/interrupts;
> > > > > +	interrupts-extended = <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				<&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
> > > > > +	pinctrl-names = "default", "sleep";
> > > > > +	pinctrl-1 = <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>,
> > > > > <&qup_uart7_sleep_tx>, <&qup_uart7_sleep_rx>;
> > > > > +};
> > > > > +
> > > > >  /* PINCTRL - additions to nodes defined in sc7280.dtsi */
> > > > >
> > > > >  &qspi_cs0 {
> > > > > @@ -428,3 +438,77 @@
> > > > >  		bias-pull-up;
> > > > >  	};
> > > > >  };
> > > > > +&qup_uart7_cts {
> > > > > +	/*
> > > > > +	 * Configure a pull-down on CTS to match the pull of
> > > > > +	 * the Bluetooth module.
> > > > > +	 */
> > > > > +	bias-pull-down;
> > > > > +};
> > > > > +
> > > > > +&qup_uart7_rts {
> > > > > +	/* We'll drive RTS, so no pull */
> > > > > +	drive-strength = <2>;
> > > > > +	bias-disable;
> > > > > +};
> > > > > +
> > > > > +&qup_uart7_tx {
> > > > > +	/* We'll drive TX, so no pull */
> > > > > +	drive-strength = <2>;
> > > > > +	bias-disable;
> > > > > +};
> > > > > +
> > > > > +&qup_uart7_rx {
> > > > > +	/*
> > > > > +	 * Configure a pull-up on RX. This is needed to avoid
> > > > > +	 * garbage data when the TX pin of the Bluetooth module is
> > > > > +	 * in tri-state (module powered off or not driving the
> > > > > +	 * signal yet).
> > > > > +	 */
> > > > > +	bias-pull-up;
> > > > > +};
> > > > > +
> > > > > +&tlmm {
> > > > > +	qup_uart7_sleep_cts: qup-uart7-sleep-cts {
> > > > > +		pins = "gpio28";
> > > > > +		function = "gpio";
> > > > > +		/*
> > > > > +		 * Configure a pull-down on CTS to match the pull of
> > > > > +		 * the Bluetooth module.
> > > > > +		 */
> > > > > +		bias-pull-down;
> > > > > +	};
> > > > > +
> > > > > +	qup_uart7_sleep_rts: qup-uart7-sleep-rts {
> > > > > +		pins = "gpio29";
> > > > > +		function = "gpio";
> > > > > +		/*
> > > > > +		 * Configure pull-down on RTS. As RTS is active low
> > > > > +		 * signal, pull it low to indicate the BT SoC that it
> > > > > +		 * can wakeup the system anytime from suspend state by
> > > > > +		 * pulling RX low (by sending wakeup bytes).
> > > > > +		 */
> > > > > +		bias-pull-down;
> > > > > +	};
> > > > > +
> > > > > +	qup_uart7_sleep_tx: qup-uart7-sleep-tx {
> > > > > +		pins = "gpio30";
> > > > > +		function = "gpio";
> > > > > +		/*
> > > > > +		 * Configure pull-up on TX when it isn't actively driven
> > > > > +		 * to prevent BT SoC from receiving garbage during sleep.
> > > > > +		 */
> > > > > +		bias-pull-up;
> > > > > +	};
> > > > >
> > > > > +	qup_uart7_sleep_rx: qup-uart7-sleep-rx {
> > > > > +		pins = "gpio31";
> > > > > +		function = "gpio";
> > > > > +		/*
> > > > > +		 * Configure a pull-up on RX. This is needed to avoid
> > > > > +		 * garbage data when the TX pin of the Bluetooth module
> > > > > +		 * is floating which may cause spurious wakeups.
> > > > > +		 */
> > > > > +		bias-pull-up;
> > > > > +	};
> > > > > +};
> > > >
> > > > How the patches of this series are split strikes me as a bit odd.
> > > > Supposedly
> > > > this patch adds the QUPv3 wrapper_0 DT nodes for the SC7280, however the
> > > > above is the pin configuration for the Bluetooth UART of the SC7280 IDP
> > > > board.
> > > > I don't see a good reason why that should be part of this patch. It
> > > > should be
> > > > a separate change whose subject indicates that it configures the
> > > > Bluetooth UART
> > > > of the SC7280 IDP.
> > > >
> > > 
> > > Okay will split this up.
> > > 
> > > > Without this conflation of SoC and board DT it would seem perfectly
> > > > reasonable
> > > > to squash this patch and '[4/4] arm64: dts: sc7280: Add QUPv3 wrapper_1
> > > > nodes'
> > > > into a single one, they are essentially doing the same thing, I see no
> > > > need to
> > > > have different patches for the wrapper 0 and 1 nodes.
> > > 
> > > Previously when QUP wrapper 0 and wrapper 1 nodes were added in single
> > > patch, we faced some git issues as the patch was huge. Hence we
> > > split it up.
> > > https://partnerissuetracker.corp.google.com/issues/177045897#comment12
> > 
> > That bug tracker entry isn't public, this is what the comment says:
> > 
> > > I suspect that diff is just having a hard time since your patch
> > > touches so
> > > much stuff. Presumably you could make it happier if you broke your
> > > patch
> > > into smaller changes. For instance:
> > > 
> > > One patch that adds the quad SPI. After all the quad SPI isn't really
> > > related to the other QUP stuff. One patch that fixes up the existing
> > > "uart5" and the QUP it's on to be how it's supposed to be. One patch
> > > that adds all the new stuff.
> > 
> > If I understand correctly the problem wasn't that the QUP wrappers are
> > added in a single patch (which should be pretty straightforward to
> > review), but that the previous patch(es) do too many things at once.
> > Adding both QUP wrappers is conceptionally a single thing, the problem
> > is intermingling that with adding board specific Bluetooth nodes, board
> > flash nodes, pinconf for UART, etc
> 
> Even after splitting the patches as suggested(i.e., additions and
> modifications separately), if I add qup wrapper0 and wrapper1 nodes in
> single patch the git diff is getting messed up. pasted the diff for
> reference
> 
> 
> +                       qup_spi14_cs_gpio: qup-spi14-cs_gpio {
> +                               pins = "gpio59";
> +                               function = "gpio";
> +                       };
> 
> -                       assigned-clocks = <&gcc
> GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> -                                         <&gcc GCC_USB30_PRIM_MASTER_CLK>;
> -                       assigned-clock-rates = <19200000>, <200000000>;
> +                       qup_spi15_data_clk: qup-spi15-data-clk {
> +                               pins = "gpio60", "gpio61", "gpio62";
> +                               function = "qup17";
> +                       };
> 
> -                       interrupts-extended = <&intc GIC_SPI 131
> IRQ_TYPE_LEVEL_HIGH>,
> -                                             <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
> -                                             <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
> -                                             <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
> -                       interrupt-names = "hs_phy_irq", "dp_hs_phy_irq",
> -                                         "dm_hs_phy_irq", "ss_phy_irq";
> +                       qup_spi15_cs: qup-spi15-cs {
> +                               pins = "gpio63";
> +                               function = "qup17";
> +                       };
> 
> 
> -                       power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
> +                       qup_spi15_cs_gpio: qup-spi15-cs_gpio {
> +                               pins = "gpio63";
> +                               function = "gpio";
> +                       };
> 

If the diffs actually end up more messy with a single patch in this case
then there is no point for it. Thanks for trying.
