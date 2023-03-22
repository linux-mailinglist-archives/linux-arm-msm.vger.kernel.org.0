Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C09156C40F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 04:24:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbjCVDYB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 23:24:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbjCVDXp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 23:23:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CF014212;
        Tue, 21 Mar 2023 20:23:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7886C61F2A;
        Wed, 22 Mar 2023 03:23:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4149BC433D2;
        Wed, 22 Mar 2023 03:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679455415;
        bh=je02Z/TKE4O/HgMdaU8V9uRRkmAivYuVWu2gWGWp1iY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pZohNQV81zh/odMAFQ1lh/YKhqGwqhCliPbJZHaxK6C0p+2vuVOirQLTjTN6n7siK
         FObABQf+U6hSlL634tN7kaWDthxXjBJBaXcF+3u9iHM3cUdPe4GYQax3liHVkZ14cu
         G96xJnbnf78ILgy1oaeqmlDdVidgFPU9qCfAtGuGkpK3rYdY9YWp0PGpIpp7nkgmEK
         Z6cEia9o68cIvdtVDAr9CWGB3sYHCYXNLD35h4Tr5S6BmtJlLZSHddgj/Hh0U+qPWg
         g9JcPpN7NXmoECO2wuTYYQMbhZU4Zi1GrN0IWlztMLDWGtsRXDPcfU3UvorHxumBaM
         ycJ12UdfF9sjQ==
Date:   Tue, 21 Mar 2023 20:26:48 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: Remove "iommus" property from PCIe
 nodes
Message-ID: <20230322032648.ti6v47cos65h3jey@ripper>
References: <20230308075648.134119-1-manivannan.sadhasivam@linaro.org>
 <20230316023155.avkvmqrsrys22lge@ripper>
 <20230316055206.GA4386@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230316055206.GA4386@thinkpad>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 16, 2023 at 11:22:06AM +0530, Manivannan Sadhasivam wrote:
> On Wed, Mar 15, 2023 at 07:31:55PM -0700, Bjorn Andersson wrote:
> > On Wed, Mar 08, 2023 at 01:26:48PM +0530, Manivannan Sadhasivam wrote:
> > > Currently, most of the Qualcomm SoCs specify both "iommus" and "iommu-map"
> > > properties for the PCIe nodes. First one passes the SMR mask to the iommu
> > > driver and the latter specifies the SID for each PCIe device.
> > > 
> > > But with "iommus" property, the PCIe controller will be added to the
> > > iommu group along with the devices. This makes no sense because the
> > > controller will not initiate any DMA transaction on its own. And moreover,
> > > it is not strictly required to pass the SMR mask to the iommu driver. If
> > > the "iommus" property is not present, then the default mask of "0" would be
> > > used which should work for all PCIe devices.
> > > 
> > > On the other side, if the SMR mask specified doesn't match the one expected
> > > by the hypervisor, then all the PCIe transactions will end up triggering
> > > "Unidentified Stream Fault" by the SMMU.
> > > 
> > > So to get rid of these hassles and also prohibit PCIe controllers from
> > > adding to the iommu group, let's remove the "iommus" property from PCIe
> > > nodes.
> > > 
> > > Reported-by: Rob Herring <robh@kernel.org>
> > > Link: https://lore.kernel.org/linux-arm-msm/20230227195535.GA749409-robh@kernel.org
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> > Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> > 
> 
> I believe you are waiting for me to respin this patch on top of -next?
> 

No that's fine, the conflict is trivial.

It caused a merge conflict with the sm8150 change in my fixes branch, so
I was just going to propagate that change and merge it back before
picking this up...

Regards,
Bjorn

> Thanks,
> Mani
> 
> > > ---
> > >  arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 --
> > >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 --
> > >  arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 --
> > >  arch/arm64/boot/dts/qcom/sm8250.dtsi | 3 ---
> > >  arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 --
> > >  arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 --
> > >  arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 --
> > >  7 files changed, 15 deletions(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > index 8f4ab6bd2886..9f7269029a02 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > @@ -2133,8 +2133,6 @@ pcie1: pci@1c08000 {
> > >  
> > >  			dma-coherent;
> > >  
> > > -			iommus = <&apps_smmu 0x1c80 0x1>;
> > > -
> > >  			iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
> > >  				    <0x100 &apps_smmu 0x1c81 0x1>;
> > >  
> > > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > index 479859bd8ab3..5f110b0062d9 100644
> > > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > @@ -2319,7 +2319,6 @@ pcie0: pci@1c00000 {
> > >  				      "slave_q2a",
> > >  				      "tbu";
> > >  
> > > -			iommus = <&apps_smmu 0x1c10 0xf>;
> > >  			iommu-map = <0x0   &apps_smmu 0x1c10 0x1>,
> > >  				    <0x100 &apps_smmu 0x1c11 0x1>,
> > >  				    <0x200 &apps_smmu 0x1c12 0x1>,
> > > @@ -2429,7 +2428,6 @@ pcie1: pci@1c08000 {
> > >  			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
> > >  			assigned-clock-rates = <19200000>;
> > >  
> > > -			iommus = <&apps_smmu 0x1c00 0xf>;
> > >  			iommu-map = <0x0   &apps_smmu 0x1c00 0x1>,
> > >  				    <0x100 &apps_smmu 0x1c01 0x1>,
> > >  				    <0x200 &apps_smmu 0x1c02 0x1>,
> > > diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > > index 13e0ce828606..6a383e918329 100644
> > > --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > > @@ -1826,7 +1826,6 @@ pcie0: pci@1c00000 {
> > >  				      "slave_q2a",
> > >  				      "tbu";
> > >  
> > > -			iommus = <&apps_smmu 0x1d80 0x3f>;
> > >  			iommu-map = <0x0   &apps_smmu 0x1d80 0x1>,
> > >  				    <0x100 &apps_smmu 0x1d81 0x1>;
> > >  
> > > @@ -1925,7 +1924,6 @@ pcie1: pci@1c08000 {
> > >  			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
> > >  			assigned-clock-rates = <19200000>;
> > >  
> > > -			iommus = <&apps_smmu 0x1e00 0x3f>;
> > >  			iommu-map = <0x0   &apps_smmu 0x1e00 0x1>,
> > >  				    <0x100 &apps_smmu 0x1e01 0x1>;
> > >  
> > > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > index 2f0e460acccd..c7682fda9d8c 100644
> > > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > @@ -1871,7 +1871,6 @@ pcie0: pci@1c00000 {
> > >  				      "tbu",
> > >  				      "ddrss_sf_tbu";
> > >  
> > > -			iommus = <&apps_smmu 0x1c00 0x7f>;
> > >  			iommu-map = <0x0   &apps_smmu 0x1c00 0x1>,
> > >  				    <0x100 &apps_smmu 0x1c01 0x1>;
> > >  
> > > @@ -1977,7 +1976,6 @@ pcie1: pci@1c08000 {
> > >  			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
> > >  			assigned-clock-rates = <19200000>;
> > >  
> > > -			iommus = <&apps_smmu 0x1c80 0x7f>;
> > >  			iommu-map = <0x0   &apps_smmu 0x1c80 0x1>,
> > >  				    <0x100 &apps_smmu 0x1c81 0x1>;
> > >  
> > > @@ -2085,7 +2083,6 @@ pcie2: pci@1c10000 {
> > >  			assigned-clocks = <&gcc GCC_PCIE_2_AUX_CLK>;
> > >  			assigned-clock-rates = <19200000>;
> > >  
> > > -			iommus = <&apps_smmu 0x1d00 0x7f>;
> > >  			iommu-map = <0x0   &apps_smmu 0x1d00 0x1>,
> > >  				    <0x100 &apps_smmu 0x1d01 0x1>;
> > >  
> > > diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> > > index 1c97e28da6ad..365b9d773b5c 100644
> > > --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> > > @@ -1526,7 +1526,6 @@ pcie0: pci@1c00000 {
> > >  				      "aggre1",
> > >  				      "aggre0";
> > >  
> > > -			iommus = <&apps_smmu 0x1c00 0x7f>;
> > >  			iommu-map = <0x0   &apps_smmu 0x1c00 0x1>,
> > >  				    <0x100 &apps_smmu 0x1c01 0x1>;
> > >  
> > > @@ -1610,7 +1609,6 @@ pcie1: pci@1c08000 {
> > >  				      "ddrss_sf_tbu",
> > >  				      "aggre1";
> > >  
> > > -			iommus = <&apps_smmu 0x1c80 0x7f>;
> > >  			iommu-map = <0x0   &apps_smmu 0x1c80 0x1>,
> > >  				    <0x100 &apps_smmu 0x1c81 0x1>;
> > >  
> > > diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > > index 1a744a33bcf4..e3201b1b07a5 100644
> > > --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > > @@ -1790,7 +1790,6 @@ pcie0: pci@1c00000 {
> > >  				      "aggre0",
> > >  				      "aggre1";
> > >  
> > > -			iommus = <&apps_smmu 0x1c00 0x7f>;
> > >  			iommu-map = <0x0   &apps_smmu 0x1c00 0x1>,
> > >  				    <0x100 &apps_smmu 0x1c01 0x1>;
> > >  
> > > @@ -1904,7 +1903,6 @@ pcie1: pci@1c08000 {
> > >  				      "ddrss_sf_tbu",
> > >  				      "aggre1";
> > >  
> > > -			iommus = <&apps_smmu 0x1c80 0x7f>;
> > >  			iommu-map = <0x0   &apps_smmu 0x1c80 0x1>,
> > >  				    <0x100 &apps_smmu 0x1c81 0x1>;
> > >  
> > > diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > > index 25f51245fe9b..6edb3acb91ef 100644
> > > --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > > @@ -1692,7 +1692,6 @@ pcie0: pci@1c00000 {
> > >  			interconnect-names = "pcie-mem";
> > >  			interconnects = <&pcie_noc MASTER_PCIE_0 0 &mc_virt SLAVE_EBI1 0>;
> > >  
> > > -			iommus = <&apps_smmu 0x1400 0x7f>;
> > >  			iommu-map = <0x0   &apps_smmu 0x1400 0x1>,
> > >  				    <0x100 &apps_smmu 0x1401 0x1>;
> > >  
> > > @@ -1796,7 +1795,6 @@ pcie1: pci@1c08000 {
> > >  			interconnect-names = "pcie-mem";
> > >  			interconnects = <&pcie_noc MASTER_PCIE_1 0 &mc_virt SLAVE_EBI1 0>;
> > >  
> > > -			iommus = <&apps_smmu 0x1480 0x7f>;
> > >  			iommu-map = <0x0   &apps_smmu 0x1480 0x1>,
> > >  				    <0x100 &apps_smmu 0x1481 0x1>;
> > >  
> > > -- 
> > > 2.25.1
> > > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்
