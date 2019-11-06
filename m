Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B80C5F1E6E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 20:16:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732085AbfKFTPh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 14:15:37 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38418 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727547AbfKFTPg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 14:15:36 -0500
Received: by mail-pg1-f193.google.com with SMTP id 15so4613808pgh.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Nov 2019 11:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WzHqm4hUE8MNt+qyeWiz/5PjTIeCqwMc1ND2S9oehxw=;
        b=y27zd/CUez7bdedi/6sc9qYeGcIIbrrCwH+aCzNMdjmXJPQJtNbIfJFvC7zWmLnAH6
         QGreh1pGI2/4dsOHHLlNgcK6nX7U3iG8zMOcagfLAJ/AkOUrZVt4PoF+f8/VZFHxRWX4
         Rb4UqdvwR2qR4eJQihfKgcJ78Yx9+y04KzTT4eQvcCHTpcTHiS740C8UALMvAMQeVIsd
         5FbbP2PRSQr7edTe3anPWEdUW3Ejd6/OxjN5pZVVuqkpvb/MUI7aAiXN5TkfBuYz+Wbt
         xx3nOTIndLnUQG7ub2NRUQvzovE4tWrDdWMCEwfsy9xA8E5xhyn9kfGPgcn+wZMoo8Te
         az5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WzHqm4hUE8MNt+qyeWiz/5PjTIeCqwMc1ND2S9oehxw=;
        b=C42YlD9BLMGzAH3B3vzx4ttJz+Puly6zDv6jBTD2atSzDgevshg/mQ9J58CbeYbjDC
         IZzA1618eSQ2M2tPud+tAeSa/i77ytpmKYAGQ98P5oAOwPMWdHFiuXTqlsFdLbNHwZ32
         xX/q0Hmt+SFpSK3Dgc9xmHiZw1rBfpHgzPPMgj1abX1wGINe5+LqsghujlQkdBAZsKUr
         Q9CyGNYmGQWT7DTyxQ6wvbsSWQXpMjHkpLVU6C0q6vJMvp3vO6X7Y2DbBeynVNWhCDzA
         aFOm6oSBw+hOlMuwQZxHjTJR97ds2sI8bF7ADwfYBqhDgulvueIqk6+fc20RSUyevfO8
         6WKA==
X-Gm-Message-State: APjAAAXxwT+fU++culOwysota/TmlLJj1wkCuzaFOHd6x+wawdkRntPg
        hvBTt1MSc1iksiU+MmkYPlAy1g==
X-Google-Smtp-Source: APXvYqzc0iN22btKd/Vtw/Fr+WSYW5egm0HT79orf9yYFiFTGDPRkTZdI1o+twBnWnoKnvoFhCdCpw==
X-Received: by 2002:a17:90a:340c:: with SMTP id o12mr5993956pjb.18.1573067735490;
        Wed, 06 Nov 2019 11:15:35 -0800 (PST)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c9sm35655913pfb.114.2019.11.06.11.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 11:15:34 -0800 (PST)
Date:   Wed, 6 Nov 2019 11:15:32 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sdm845: Add second PCIe PHY and
 controller
Message-ID: <20191106191532.GD36595@minitux>
References: <20191102003148.4091335-1-bjorn.andersson@linaro.org>
 <20191102003148.4091335-3-bjorn.andersson@linaro.org>
 <af66ac9a-f473-44b7-8604-2153c680960b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af66ac9a-f473-44b7-8604-2153c680960b@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 06 Nov 05:53 PST 2019, Georgi Djakov wrote:

> Hi Bjorn,
> 
> On 2.11.19 ??. 2:31 ??., Bjorn Andersson wrote:
> > Add the second PCIe controller and the associated QHP PHY found on
> > SDM845.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 111 +++++++++++++++++++++++++++
> >  1 file changed, 111 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > index b93537b7a59f..0cdcc8d6d223 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > @@ -1468,6 +1468,117 @@
> >  			};
> >  		};
> >  
> > +		pcie1: pci@1c08000 {
> > +			compatible = "qcom,pcie-sdm845", "snps,dw-pcie";
> > +			reg = <0 0x01c08000 0 0x2000>,
> > +			      <0 0x40000000 0 0xf1d>,
> > +			      <0 0x40000f20 0 0xa8>,
> > +			      <0 0x40100000 0 0x100000>;
> > +			reg-names = "parf", "dbi", "elbi", "config";
> > +			device_type = "pci";
> > +			linux,pci-domain = <1>;
> > +			bus-range = <0x00 0xff>;
> > +			num-lanes = <1>;
> > +
> > +			#address-cells = <3>;
> > +			#size-cells = <2>;
> > +
> > +			ranges = <0x01000000 0x0 0x40200000 0x0 0x40200000 0x0 0x100000>,
> > +				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
> > +
> > +			interrupts = <GIC_SPI 307 IRQ_TYPE_EDGE_RISING>;
> > +			interrupt-names = "msi";
> > +			#interrupt-cells = <1>;
> > +			interrupt-map-mask = <0 0 0 0x7>;
> > +			interrupt-map = <0 0 0 1 &intc 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
> > +					<0 0 0 2 &intc 0 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
> > +					<0 0 0 3 &intc 0 438 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
> > +					<0 0 0 4 &intc 0 439 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
> > +
> > +			clocks = <&gcc GCC_PCIE_1_PIPE_CLK>,
> > +				 <&gcc GCC_PCIE_1_AUX_CLK>,
> > +				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
> > +				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
> > +				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
> > +				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
> > +				 <&gcc GCC_PCIE_1_CLKREF_CLK>,
> > +				 <&gcc GCC_AGGRE_NOC_PCIE_TBU_CLK>;
> > +			clock-names = "pipe",
> > +				      "aux",
> > +				      "cfg",
> > +				      "bus_master",
> > +				      "bus_slave",
> > +				      "slave_q2a",
> > +				      "ref",
> > +				      "tbu";
> > +
> > +			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
> > +			assigned-clock-rates = <19200000>;
> > +
> > +			iommus = <&apps_smmu 0x1c00 0xf>;
> > +			iommu-map = <0x0   &apps_smmu 0x1c00 0x1>,
> > +				    <0x100 &apps_smmu 0x1c01 0x1>,
> > +				    <0x200 &apps_smmu 0x1c02 0x1>,
> > +				    <0x300 &apps_smmu 0x1c03 0x1>,
> > +				    <0x400 &apps_smmu 0x1c04 0x1>,
> > +				    <0x500 &apps_smmu 0x1c05 0x1>,
> > +				    <0x600 &apps_smmu 0x1c06 0x1>,
> > +				    <0x700 &apps_smmu 0x1c07 0x1>,
> > +				    <0x800 &apps_smmu 0x1c08 0x1>,
> > +				    <0x900 &apps_smmu 0x1c09 0x1>,
> > +				    <0xa00 &apps_smmu 0x1c0a 0x1>,
> > +				    <0xb00 &apps_smmu 0x1c0b 0x1>,
> > +				    <0xc00 &apps_smmu 0x1c0c 0x1>,
> > +				    <0xd00 &apps_smmu 0x1c0d 0x1>,
> > +				    <0xe00 &apps_smmu 0x1c0e 0x1>,
> > +				    <0xf00 &apps_smmu 0x1c0f 0x1>;
> > +
> > +			resets = <&gcc GCC_PCIE_1_BCR>;
> > +			reset-names = "pci";
> > +
> > +			power-domains = <&gcc PCIE_1_GDSC>;
> > +
> > +			interconnects = <&rsc_hlos MASTER_PCIE_0 &rsc_hlos SLAVE_EBI1>;
> > +			interconnect-names = "pcie-mem";
> 
> Maybe leave this hunk out (although it looks good), until we conclude on these
> refactoring patches [1].
> 

Yes that makes sense and it's not necessary for it to be functional,
will drop it for now.

Regards,
Bjorn

> Thanks,
> Georgi
> 
> [1]
> http://lore.kernel.org/r/1571278852-8023-1-git-send-email-daidavid1@codeaurora.org
