Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 302726BC5DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 06:52:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbjCPFwS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Mar 2023 01:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbjCPFwQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Mar 2023 01:52:16 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11D6519121
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 22:52:14 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id gp15-20020a17090adf0f00b0023d1bbd9f9eso4258105pjb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 22:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678945933;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eebjIeSF3tSBSkrtu9vrZZuRaWiAHuMSV9kH5TvPW6U=;
        b=TbsZIG1+gvGplBzTyD7cwls8f8sm+eoQeZ2mI6mvb82YrnFUW7uMQo6pSyePOSHN+S
         Jn+BuiAnmxsLvKds/jVVfxMYrj3j1pueHaxmBwCLeLDFfQelEp0gkKAJ4MVRalDvr2+p
         ktUeONPE53oRKKtLgaQazsJFOWGLoA0bhqDedW547KAJYDB3FQPOpZXS3TYQmxyDe9hZ
         91pHvZleThoYqOZp7QF3eaZA5tQDfR5BojOhjUtRESiw1cguF1k/Fz/ZcHFzOB7tSJIP
         26m+IKBFWWvmeSyg2jO02lX+9rH+n7CKvsU4sHdnZlZPILoRrNU5wa/e1OalqxBF9wGx
         NufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678945933;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eebjIeSF3tSBSkrtu9vrZZuRaWiAHuMSV9kH5TvPW6U=;
        b=PpexS4wiWLNoZqqJkpEkJOMLOGFHHS6iqDJH+J+1MZQvo9WFN7sfzUMMeP9E7wTLD/
         Nv+iffZVBwyGgsEDoJk2TAyIrtM5H7TykPgJbkDS9uIYfy1zg5CFk3+zepLFMKP3qTSh
         qOscpwYiwYZMXSzaCmNjnI7YkfIS/xv+m/f8XShZxBnjDKMPccEjCCDySOcuk39dTlwa
         G/oSYAzeJ0SXfHWr/pDt2v/IK7gUDSis1d35Jz3LUIImIx/Jn5dg+RlAgjjijHNWaa6Q
         l5asP823PjkljaO3DAf8AoCvz+Wq6tAITjHKBKtorpubRlx0I5viZ2/yev1jL7wclhtu
         V95g==
X-Gm-Message-State: AO0yUKWnbtDnUlLUibGSole6mhnKXpLgTee+5a7yao2XTajs/0HGaBGZ
        IOEdAAnnCPrTsusLfXZCGyp/
X-Google-Smtp-Source: AK7set/eNrUKRwKD3v0yvfQDBHe2g1yvMJBTgUUfvvldyX7ByYdlFiGfYj1AcaCi0eMOCi0OIuX0NQ==
X-Received: by 2002:a17:903:2288:b0:1a0:742f:75cc with SMTP id b8-20020a170903228800b001a0742f75ccmr2708450plh.20.1678945933315;
        Wed, 15 Mar 2023 22:52:13 -0700 (PDT)
Received: from thinkpad ([117.207.30.24])
        by smtp.gmail.com with ESMTPSA id d10-20020a170902854a00b001a05bc70e97sm4545002plo.189.2023.03.15.22.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 22:52:12 -0700 (PDT)
Date:   Thu, 16 Mar 2023 11:22:06 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: Remove "iommus" property from PCIe
 nodes
Message-ID: <20230316055206.GA4386@thinkpad>
References: <20230308075648.134119-1-manivannan.sadhasivam@linaro.org>
 <20230316023155.avkvmqrsrys22lge@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230316023155.avkvmqrsrys22lge@ripper>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 15, 2023 at 07:31:55PM -0700, Bjorn Andersson wrote:
> On Wed, Mar 08, 2023 at 01:26:48PM +0530, Manivannan Sadhasivam wrote:
> > Currently, most of the Qualcomm SoCs specify both "iommus" and "iommu-map"
> > properties for the PCIe nodes. First one passes the SMR mask to the iommu
> > driver and the latter specifies the SID for each PCIe device.
> > 
> > But with "iommus" property, the PCIe controller will be added to the
> > iommu group along with the devices. This makes no sense because the
> > controller will not initiate any DMA transaction on its own. And moreover,
> > it is not strictly required to pass the SMR mask to the iommu driver. If
> > the "iommus" property is not present, then the default mask of "0" would be
> > used which should work for all PCIe devices.
> > 
> > On the other side, if the SMR mask specified doesn't match the one expected
> > by the hypervisor, then all the PCIe transactions will end up triggering
> > "Unidentified Stream Fault" by the SMMU.
> > 
> > So to get rid of these hassles and also prohibit PCIe controllers from
> > adding to the iommu group, let's remove the "iommus" property from PCIe
> > nodes.
> > 
> > Reported-by: Rob Herring <robh@kernel.org>
> > Link: https://lore.kernel.org/linux-arm-msm/20230227195535.GA749409-robh@kernel.org
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> 

I believe you are waiting for me to respin this patch on top of -next?

Thanks,
Mani

> > ---
> >  arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 --
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 --
> >  arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 --
> >  arch/arm64/boot/dts/qcom/sm8250.dtsi | 3 ---
> >  arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 --
> >  arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 --
> >  arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 --
> >  7 files changed, 15 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > index 8f4ab6bd2886..9f7269029a02 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > @@ -2133,8 +2133,6 @@ pcie1: pci@1c08000 {
> >  
> >  			dma-coherent;
> >  
> > -			iommus = <&apps_smmu 0x1c80 0x1>;
> > -
> >  			iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
> >  				    <0x100 &apps_smmu 0x1c81 0x1>;
> >  
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > index 479859bd8ab3..5f110b0062d9 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > @@ -2319,7 +2319,6 @@ pcie0: pci@1c00000 {
> >  				      "slave_q2a",
> >  				      "tbu";
> >  
> > -			iommus = <&apps_smmu 0x1c10 0xf>;
> >  			iommu-map = <0x0   &apps_smmu 0x1c10 0x1>,
> >  				    <0x100 &apps_smmu 0x1c11 0x1>,
> >  				    <0x200 &apps_smmu 0x1c12 0x1>,
> > @@ -2429,7 +2428,6 @@ pcie1: pci@1c08000 {
> >  			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
> >  			assigned-clock-rates = <19200000>;
> >  
> > -			iommus = <&apps_smmu 0x1c00 0xf>;
> >  			iommu-map = <0x0   &apps_smmu 0x1c00 0x1>,
> >  				    <0x100 &apps_smmu 0x1c01 0x1>,
> >  				    <0x200 &apps_smmu 0x1c02 0x1>,
> > diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > index 13e0ce828606..6a383e918329 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > @@ -1826,7 +1826,6 @@ pcie0: pci@1c00000 {
> >  				      "slave_q2a",
> >  				      "tbu";
> >  
> > -			iommus = <&apps_smmu 0x1d80 0x3f>;
> >  			iommu-map = <0x0   &apps_smmu 0x1d80 0x1>,
> >  				    <0x100 &apps_smmu 0x1d81 0x1>;
> >  
> > @@ -1925,7 +1924,6 @@ pcie1: pci@1c08000 {
> >  			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
> >  			assigned-clock-rates = <19200000>;
> >  
> > -			iommus = <&apps_smmu 0x1e00 0x3f>;
> >  			iommu-map = <0x0   &apps_smmu 0x1e00 0x1>,
> >  				    <0x100 &apps_smmu 0x1e01 0x1>;
> >  
> > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > index 2f0e460acccd..c7682fda9d8c 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > @@ -1871,7 +1871,6 @@ pcie0: pci@1c00000 {
> >  				      "tbu",
> >  				      "ddrss_sf_tbu";
> >  
> > -			iommus = <&apps_smmu 0x1c00 0x7f>;
> >  			iommu-map = <0x0   &apps_smmu 0x1c00 0x1>,
> >  				    <0x100 &apps_smmu 0x1c01 0x1>;
> >  
> > @@ -1977,7 +1976,6 @@ pcie1: pci@1c08000 {
> >  			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
> >  			assigned-clock-rates = <19200000>;
> >  
> > -			iommus = <&apps_smmu 0x1c80 0x7f>;
> >  			iommu-map = <0x0   &apps_smmu 0x1c80 0x1>,
> >  				    <0x100 &apps_smmu 0x1c81 0x1>;
> >  
> > @@ -2085,7 +2083,6 @@ pcie2: pci@1c10000 {
> >  			assigned-clocks = <&gcc GCC_PCIE_2_AUX_CLK>;
> >  			assigned-clock-rates = <19200000>;
> >  
> > -			iommus = <&apps_smmu 0x1d00 0x7f>;
> >  			iommu-map = <0x0   &apps_smmu 0x1d00 0x1>,
> >  				    <0x100 &apps_smmu 0x1d01 0x1>;
> >  
> > diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> > index 1c97e28da6ad..365b9d773b5c 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> > @@ -1526,7 +1526,6 @@ pcie0: pci@1c00000 {
> >  				      "aggre1",
> >  				      "aggre0";
> >  
> > -			iommus = <&apps_smmu 0x1c00 0x7f>;
> >  			iommu-map = <0x0   &apps_smmu 0x1c00 0x1>,
> >  				    <0x100 &apps_smmu 0x1c01 0x1>;
> >  
> > @@ -1610,7 +1609,6 @@ pcie1: pci@1c08000 {
> >  				      "ddrss_sf_tbu",
> >  				      "aggre1";
> >  
> > -			iommus = <&apps_smmu 0x1c80 0x7f>;
> >  			iommu-map = <0x0   &apps_smmu 0x1c80 0x1>,
> >  				    <0x100 &apps_smmu 0x1c81 0x1>;
> >  
> > diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > index 1a744a33bcf4..e3201b1b07a5 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > @@ -1790,7 +1790,6 @@ pcie0: pci@1c00000 {
> >  				      "aggre0",
> >  				      "aggre1";
> >  
> > -			iommus = <&apps_smmu 0x1c00 0x7f>;
> >  			iommu-map = <0x0   &apps_smmu 0x1c00 0x1>,
> >  				    <0x100 &apps_smmu 0x1c01 0x1>;
> >  
> > @@ -1904,7 +1903,6 @@ pcie1: pci@1c08000 {
> >  				      "ddrss_sf_tbu",
> >  				      "aggre1";
> >  
> > -			iommus = <&apps_smmu 0x1c80 0x7f>;
> >  			iommu-map = <0x0   &apps_smmu 0x1c80 0x1>,
> >  				    <0x100 &apps_smmu 0x1c81 0x1>;
> >  
> > diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > index 25f51245fe9b..6edb3acb91ef 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > @@ -1692,7 +1692,6 @@ pcie0: pci@1c00000 {
> >  			interconnect-names = "pcie-mem";
> >  			interconnects = <&pcie_noc MASTER_PCIE_0 0 &mc_virt SLAVE_EBI1 0>;
> >  
> > -			iommus = <&apps_smmu 0x1400 0x7f>;
> >  			iommu-map = <0x0   &apps_smmu 0x1400 0x1>,
> >  				    <0x100 &apps_smmu 0x1401 0x1>;
> >  
> > @@ -1796,7 +1795,6 @@ pcie1: pci@1c08000 {
> >  			interconnect-names = "pcie-mem";
> >  			interconnects = <&pcie_noc MASTER_PCIE_1 0 &mc_virt SLAVE_EBI1 0>;
> >  
> > -			iommus = <&apps_smmu 0x1480 0x7f>;
> >  			iommu-map = <0x0   &apps_smmu 0x1480 0x1>,
> >  				    <0x100 &apps_smmu 0x1481 0x1>;
> >  
> > -- 
> > 2.25.1
> > 

-- 
மணிவண்ணன் சதாசிவம்
