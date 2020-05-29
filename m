Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 605721E73C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 05:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407604AbgE2Dnk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 23:43:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389653AbgE2Dni (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 23:43:38 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFBAAC08C5C7
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 20:43:37 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id u5so700581pgn.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 20:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3XR7QJKmL5fxVgpEHnbXhWBYoXXokdRRh1j2h2NbRQU=;
        b=VZzDCliJGfOlt4tH8T34NNHm24YmzWjQH6Vz5bL2rCq9/BiO69K98p/HefqFg4eFaD
         BDshO8R2j+NA4WugUeEK/EwnBbpcl8fxh01FMWj2CCx/aK6KLE9OlyknJwguWrWyyuij
         jp5GIr0dKrc3tp1JJzyxazBJ2XX83usJ442iL2lWZZuPAgbsidrmzTU4YR59CY+ItGev
         PAN7rSWOUpy2sL3siqvaqfsrUsupUZuf4kLZCPwkrlZpG1+Tm/Gyi4CW0Z8xzb1mB+ki
         9ZTYCVl3CsiEAfa7Xv81ahzmdceuGnnnggCDyiJkp5kZg1uVx/b/1Ho8TYO+IyzGk2O2
         rMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3XR7QJKmL5fxVgpEHnbXhWBYoXXokdRRh1j2h2NbRQU=;
        b=tvt6taDpQwPdgEpMGXtN0lt7NlZWjt0Ue+JYViQdUqvdCgv6Ku2hU22+TfY7mKmxN9
         +MwsrN2HbX3R8EFJZisiPXtlU2XnMNAiC5FBToqPTuYEiG7oCcvx63Ij8ees8rWUm895
         v1tmMlvjL/OXtFcND90nP8y60Y0wLCtACmH2FFn175PODVGrNLqPJ3CwuwI8XtzKHEy4
         mKoN8nOu6LkOh6B71Uy7U+pEKt0fjds74wxqfswvJdncFI8eP6sv/aiPZEioHOn6KPID
         NyX1dB9WuHtVHsVRgCL55Z+ugBwbvG4chxoCUpcFv5BNuaJZoSkJdE34mfada4pptlpw
         EMgA==
X-Gm-Message-State: AOAM530DCjwchjr1oQOCs/JZ0XyWHCByhSAaZac0przbyQawdouu1wae
        YKUjpTFGqyI/ob1EXzBTesURQHC82nI=
X-Google-Smtp-Source: ABdhPJwHfgoT1qJoRd8XA+Tzc9s/OsDLzwP+ALpVeOVyed8xHlA7HDd8qgf/35ZMZ5FMJUCCmtFqAw==
X-Received: by 2002:a63:6605:: with SMTP id a5mr6122534pgc.50.1590723817296;
        Thu, 28 May 2020 20:43:37 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b63sm5930269pfg.86.2020.05.28.20.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 20:43:36 -0700 (PDT)
Date:   Thu, 28 May 2020 20:42:31 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sm8150: add apps_smmu node
Message-ID: <20200529034231.GB1799770@builder.lan>
References: <20200524023815.21789-1-jonathan@marek.ca>
 <20200524023815.21789-2-jonathan@marek.ca>
 <20200529025246.GV279327@builder.lan>
 <d0908f34-a698-3449-35b9-7a98e9641295@marek.ca>
 <20200529031520.GA1799770@builder.lan>
 <00b8f010-1ae1-45b2-8dd0-a1b582861a2e@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00b8f010-1ae1-45b2-8dd0-a1b582861a2e@marek.ca>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 28 May 20:34 PDT 2020, Jonathan Marek wrote:

> On 5/28/20 11:15 PM, Bjorn Andersson wrote:
> > On Thu 28 May 20:02 PDT 2020, Jonathan Marek wrote:
> > 
> > > 
> > > 
> > > On 5/28/20 10:52 PM, Bjorn Andersson wrote:
> > > > On Sat 23 May 19:38 PDT 2020, Jonathan Marek wrote:
> > > > 
> > > > > Add the apps_smmu node for sm8150. Note that adding the iommus field for
> > > > > UFS is required because initializing the iommu removes the bypass mapping
> > > > > that created by the bootloader.
> > > > > 
> > > > 
> > > > Unrelated to the patch itself; how do you disable the splash screen on
> > > > 8150? "fastboot oem select-display-panel none" doesn't seem to work for
> > > > me on the MTP - and hence this would prevent my device from booting.
> > > > 
> > > > Thanks,
> > > > Bjorn
> > > > 
> > > 
> > > I don't have a MTP, but on HDK855, "fastboot oem select-display-panel none"
> > > combined with setting the physical switch to HDMI mode (which switches off
> > > the 1440x2560 panel) gets it to not setup the display at all (just the
> > > fastboot command isn't enough).
> > > 
> > 
> > Okay, I don't think we have anything equivalent on the MTP, but good to
> > know.
> > 
> > > With HDK865 though that doesn't work and I have a hack to work around it
> > > (writing 0 to INTF_TIMING_ENGINE_EN early on in boot will stop video mode
> > > scanout and it won't crash).
> > > 
> > 
> > Then we need to sort this out in the arm-smmu driver before we can
> > enable the apps_smmu node on 8250. I did receive some guidance from Will
> > on the subject and have started looking into this.
> > 
> 
> That's annoying because a lot depends on apps_mmu. GPU is an exception with
> its own MMU but pretty much everything else uses apps_smmu (does it make
> sense to add USB nodes if it won't work without apps_smmu?) Is this
> something that will get resolved soon?
> 

We have a number of boards where this is becoming a critical issue, so
we better find an acceptable solution to this very soon.

Regards,
Bjorn

> FWIW, I have another sm8250 board which does not need the workaround (its
> bootloader does not set up the display). AFAIK modifying the bootloader to
> not set up any display is a trivial modification (assuming that's an
> option).
> 
> > Thanks,
> > Bjorn
> > 
> > > > > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > > > > ---
> > > > >    arch/arm64/boot/dts/qcom/sm8150.dtsi | 91 ++++++++++++++++++++++++++++
> > > > >    1 file changed, 91 insertions(+)
> > > > > 
> > > > > diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > > > > index a36512d1f6a1..acb839427b12 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > > > > +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > > > > @@ -442,6 +442,8 @@ ufs_mem_hc: ufshc@1d84000 {
> > > > >    			resets = <&gcc GCC_UFS_PHY_BCR>;
> > > > >    			reset-names = "rst";
> > > > > +			iommus = <&apps_smmu 0x300 0>;
> > > > > +
> > > > >    			clock-names =
> > > > >    				"core_clk",
> > > > >    				"bus_aggr_clk",
> > > > > @@ -706,6 +708,7 @@ usb_1_dwc3: dwc3@a600000 {
> > > > >    				compatible = "snps,dwc3";
> > > > >    				reg = <0 0x0a600000 0 0xcd00>;
> > > > >    				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> > > > > +				iommus = <&apps_smmu 0x140 0>;
> > > > >    				snps,dis_u2_susphy_quirk;
> > > > >    				snps,dis_enblslpm_quirk;
> > > > >    				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
> > > > > @@ -742,6 +745,94 @@ spmi_bus: spmi@c440000 {
> > > > >    			cell-index = <0>;
> > > > >    		};
> > > > > +		apps_smmu: iommu@15000000 {
> > > > > +			compatible = "qcom,sdm845-smmu-500", "arm,mmu-500";
> > > > > +			reg = <0 0x15000000 0 0x100000>;
> > > > > +			#iommu-cells = <2>;
> > > > > +			#global-interrupts = <1>;
> > > > > +			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>;
> > > > > +		};
> > > > > +
> > > > >    		remoteproc_adsp: remoteproc@17300000 {
> > > > >    			compatible = "qcom,sm8150-adsp-pas";
> > > > >    			reg = <0x0 0x17300000 0x0 0x4040>;
> > > > > -- 
> > > > > 2.26.1
> > > > > 
