Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 478BF3E93F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 16:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232624AbhHKOwr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 10:52:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232284AbhHKOwr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 10:52:47 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C50FC061765
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 07:52:23 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id mq2-20020a17090b3802b0290178911d298bso5365436pjb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 07:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=75ur5KKGa4AeVyjOxEPV5aTd7FRhCKJwfef00vGVoM8=;
        b=dNeuNSPR72XMt8HQMXbWd0apuJjW2wFi8Fq39ovyBunvm4StUIArQlVFfEWxkO+dr3
         YnCzViRy11XsYT234s4SI7537yMvGLoUrEqokKtsmbSztl1LbI58xxGUq7TN2PqjbC3s
         VuEbafnY9ZB7yNoW/q2ldEKYN1zKG9JZxFHJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=75ur5KKGa4AeVyjOxEPV5aTd7FRhCKJwfef00vGVoM8=;
        b=lFPfsYLcLXG5FMn1NqN0DyGn0h/hGxlcualOwdj24XXIW+VNZCe9W3exLZlgFWs36d
         e8wY43C4VXW6yPP3/vcByUOwPkULwDTI0bYwXBsb8OeychVMOnFK5UmcT9YfKWMuD4zp
         bvqv+7AQO4Sxdo4AcDLyFm8d7cdJGSjborwLyq7BgQp6E5NjB6ITqQ/ZIGm26HZy1Ozj
         hRp5Y9KqIjnrNkDVZfblEqmtL+FHpyPBRSQITKAOnrb9B02ch54ZleEeJCWP8dfd5ft2
         FCWhsnbI87LpsU+ud6PDPfRar74mvSgkoish2ByFxk2brbOmcDUlpYID2NwAfmir9qgn
         16IA==
X-Gm-Message-State: AOAM530MRvPCh+D+smCb+Tl5lv7LuN0OuX4kVZiB7vSF9Hh3ju0z7vbo
        5ZTZqUiEMj9V9/t4Er9JN+n6nw==
X-Google-Smtp-Source: ABdhPJzz0asiYJyz4gYdnrRfwCnsqIypLFkB42hUmXHvd7RDrvQ7eqJaIfLwxn0gFrIY1yTLkMQi3Q==
X-Received: by 2002:a63:712:: with SMTP id 18mr327582pgh.277.1628693542848;
        Wed, 11 Aug 2021 07:52:22 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:ee27:bab:1cec:afe5])
        by smtp.gmail.com with UTF8SMTPSA id b12sm28966736pff.63.2021.08.11.07.52.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Aug 2021 07:52:21 -0700 (PDT)
Date:   Wed, 11 Aug 2021 07:52:19 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     rajpat@codeaurora.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: Re: [PATCH V4 2/4] arm64: dts: sc7280: Add QUPv3 wrapper_0 nodes
Message-ID: <YRPkI8AQAjjFuXcf@google.com>
References: <1627306847-25308-1-git-send-email-rajpat@codeaurora.org>
 <1627306847-25308-3-git-send-email-rajpat@codeaurora.org>
 <YP7cmkayoajJ+1yj@google.com>
 <bdfd39def9a11104c043090d920ef4df@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bdfd39def9a11104c043090d920ef4df@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 11, 2021 at 05:43:48PM +0530, rajpat@codeaurora.org wrote:
> On 2021-07-26 21:32, Matthias Kaehlcke wrote:
> > On Mon, Jul 26, 2021 at 07:10:45PM +0530, Rajesh Patil wrote:
> > > From: Roja Rani Yarubandi <rojay@codeaurora.org>
> > > 
> > > Add QUPv3 wrapper_0 DT nodes for SC7280 SoC.
> > > 
> > > Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> > > Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
> > > ---
> > > Changes in V4:
> > >  - As per Bjorn's comment, added QUP Wrapper_0 nodes
> > >    other than debug-uart node
> > >  - Dropped interconnect votes for wrapper_0 node
> > > 
> > > Changes in V3:
> > >  - Broken the huge V2 patch into 3 smaller patches.
> > >    1. QSPI DT nodes
> > >    2. QUP wrapper_0 DT nodes
> > >    3. QUP wrapper_1 DT nodes
> > > 
> > > Changes in V2:
> > >  - As per Doug's comments removed pinmux/pinconf subnodes.
> > >  - As per Doug's comments split of SPI, UART nodes has been done.
> > >  - Moved QSPI node before aps_smmu as per the order.
> > > 
> > >  arch/arm64/boot/dts/qcom/sc7280-idp.dts |  84 ++++
> > >  arch/arm64/boot/dts/qcom/sc7280.dtsi    | 720
> > > ++++++++++++++++++++++++++++++++
> > >  2 files changed, 804 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> > > b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> > > index b0bfd8e..f63cf51 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> > > +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> > > @@ -358,6 +358,16 @@
> > >  	vdda18-supply = <&vreg_l1c_1p8>;
> > >  };
> > > 
> > > +&uart7 {
> > > +	status = "okay";
> > > +
> > > +	/delete-property/interrupts;
> > > +	interrupts-extended = <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
> > > +				<&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
> > > +	pinctrl-names = "default", "sleep";
> > > +	pinctrl-1 = <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>,
> > > <&qup_uart7_sleep_tx>, <&qup_uart7_sleep_rx>;
> > > +};
> > > +
> > >  /* PINCTRL - additions to nodes defined in sc7280.dtsi */
> > > 
> > >  &qspi_cs0 {
> > > @@ -428,3 +438,77 @@
> > >  		bias-pull-up;
> > >  	};
> > >  };
> > > +&qup_uart7_cts {
> > > +	/*
> > > +	 * Configure a pull-down on CTS to match the pull of
> > > +	 * the Bluetooth module.
> > > +	 */
> > > +	bias-pull-down;
> > > +};
> > > +
> > > +&qup_uart7_rts {
> > > +	/* We'll drive RTS, so no pull */
> > > +	drive-strength = <2>;
> > > +	bias-disable;
> > > +};
> > > +
> > > +&qup_uart7_tx {
> > > +	/* We'll drive TX, so no pull */
> > > +	drive-strength = <2>;
> > > +	bias-disable;
> > > +};
> > > +
> > > +&qup_uart7_rx {
> > > +	/*
> > > +	 * Configure a pull-up on RX. This is needed to avoid
> > > +	 * garbage data when the TX pin of the Bluetooth module is
> > > +	 * in tri-state (module powered off or not driving the
> > > +	 * signal yet).
> > > +	 */
> > > +	bias-pull-up;
> > > +};
> > > +
> > > +&tlmm {
> > > +	qup_uart7_sleep_cts: qup-uart7-sleep-cts {
> > > +		pins = "gpio28";
> > > +		function = "gpio";
> > > +		/*
> > > +		 * Configure a pull-down on CTS to match the pull of
> > > +		 * the Bluetooth module.
> > > +		 */
> > > +		bias-pull-down;
> > > +	};
> > > +
> > > +	qup_uart7_sleep_rts: qup-uart7-sleep-rts {
> > > +		pins = "gpio29";
> > > +		function = "gpio";
> > > +		/*
> > > +		 * Configure pull-down on RTS. As RTS is active low
> > > +		 * signal, pull it low to indicate the BT SoC that it
> > > +		 * can wakeup the system anytime from suspend state by
> > > +		 * pulling RX low (by sending wakeup bytes).
> > > +		 */
> > > +		bias-pull-down;
> > > +	};
> > > +
> > > +	qup_uart7_sleep_tx: qup-uart7-sleep-tx {
> > > +		pins = "gpio30";
> > > +		function = "gpio";
> > > +		/*
> > > +		 * Configure pull-up on TX when it isn't actively driven
> > > +		 * to prevent BT SoC from receiving garbage during sleep.
> > > +		 */
> > > +		bias-pull-up;
> > > +	};
> > > 
> > > +	qup_uart7_sleep_rx: qup-uart7-sleep-rx {
> > > +		pins = "gpio31";
> > > +		function = "gpio";
> > > +		/*
> > > +		 * Configure a pull-up on RX. This is needed to avoid
> > > +		 * garbage data when the TX pin of the Bluetooth module
> > > +		 * is floating which may cause spurious wakeups.
> > > +		 */
> > > +		bias-pull-up;
> > > +	};
> > > +};
> > 
> > How the patches of this series are split strikes me as a bit odd.
> > Supposedly
> > this patch adds the QUPv3 wrapper_0 DT nodes for the SC7280, however the
> > above is the pin configuration for the Bluetooth UART of the SC7280 IDP
> > board.
> > I don't see a good reason why that should be part of this patch. It
> > should be
> > a separate change whose subject indicates that it configures the
> > Bluetooth UART
> > of the SC7280 IDP.
> > 
> 
> Okay will split this up.
> 
> > Without this conflation of SoC and board DT it would seem perfectly
> > reasonable
> > to squash this patch and '[4/4] arm64: dts: sc7280: Add QUPv3 wrapper_1
> > nodes'
> > into a single one, they are essentially doing the same thing, I see no
> > need to
> > have different patches for the wrapper 0 and 1 nodes.
> 
> Previously when QUP wrapper 0 and wrapper 1 nodes were added in single
> patch, we faced some git issues as the patch was huge. Hence we split it up.
> https://partnerissuetracker.corp.google.com/issues/177045897#comment12

That bug tracker entry isn't public, this is what the comment says:

> I suspect that diff is just having a hard time since your patch touches so
> much stuff. Presumably you could make it happier if you broke your patch
> into smaller changes. For instance:
> 
> One patch that adds the quad SPI. After all the quad SPI isn't really
> related to the other QUP stuff. One patch that fixes up the existing
> "uart5" and the QUP it's on to be how it's supposed to be. One patch
> that adds all the new stuff.

If I understand correctly the problem wasn't that the QUP wrappers are
added in a single patch (which should be pretty straightforward to
review), but that the previous patch(es) do too many things at once.
Adding both QUP wrappers is conceptionally a single thing, the problem
is intermingling that with adding board specific Bluetooth nodes, board
flash nodes, pinconf for UART, etc
