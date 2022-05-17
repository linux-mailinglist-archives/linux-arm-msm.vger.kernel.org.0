Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4296E52A5B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 May 2022 17:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349721AbiEQPLq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 May 2022 11:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349704AbiEQPLp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 May 2022 11:11:45 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0F4E3BF95
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 08:11:43 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id i8so3655012plr.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 08:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=cmLXabcPdJC5+Jr+geeae2kzppnXJw8ILHcl1Qm7vBw=;
        b=CMbAPHf6t+S5Kg1C4GszZxleCRPzPCJZatJ1Uhgf4vk0o6lS847ZRTFjB8hGXzHMWl
         ll+/Pk58qJPLoniMeyG8G08xqU5f8Y1cYHkaDkQ68EI4RSuceZvg8L88QzT3nG1ggMQh
         wpCPXtWUjd3VPVCZAzB0zNj9VYjpBbBGN0i5lSZugdLoFWYUYY403CgSeaPvbw/GJWfo
         KoWb+QmOkyIhZFiG13zp7J2QOwQr5UeggVUWxzffet1NnT0TxQlosvVe3iY8p187yVk4
         PGriacZsHbGjO6/cFvWrqRlURZJrIBSd0FdYh8B5fOKv/rRpHcFyySilRPJurX8HmkZ+
         GF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=cmLXabcPdJC5+Jr+geeae2kzppnXJw8ILHcl1Qm7vBw=;
        b=XbJ+juMApPRpvfvnpUZxfn31DGO0mswwR+Rvgr6pRV+kdy6LrkKSKciqqs8ipQIUDY
         kJNf3nEFXT85u89ttJpe3CPhAuPQ9n7uGbUWA8efNo0nBjd+HYB7wDE4wlJjuFfFysSO
         P2RAUjBg3vrMbSfd0C4NQKrDqCcfNCSkkL9ABTMzj9b4YEtsFkMIl3kF0wb4JvYrUWCM
         7+OV6+3/y/RKhk0ulZlYbITfhfpq3BrEeumsEVaQHI++R1yncFtYlkLm409ViRG/sp+K
         +dvl0ZT+astBV3ZAvdox4WPL4e7CFhbf8WJm3g8xJvr8DbN/3/YlNB9pYYlqS8uGVjiW
         Wkhw==
X-Gm-Message-State: AOAM530ooFaIFKVPlMBc4oh1fh+lgn3DRakCua9bUAqdu+vsvXzzm5is
        3Ot+h/P7thg+EEYrb/cM8/Pk
X-Google-Smtp-Source: ABdhPJy/8+de+j926ut7sfC02FyPhUMi0LcfxLj34YwOAks7Rl82lL4Rj6Y5maOSEeF2PjT7605A/g==
X-Received: by 2002:a17:902:dad1:b0:161:9abb:fb75 with SMTP id q17-20020a170902dad100b001619abbfb75mr6145785plx.135.1652800303244;
        Tue, 17 May 2022 08:11:43 -0700 (PDT)
Received: from thinkpad ([117.207.31.8])
        by smtp.gmail.com with ESMTPSA id ja1-20020a170902efc100b001617e18e253sm4280263plb.143.2022.05.17.08.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 08:11:42 -0700 (PDT)
Date:   Tue, 17 May 2022 20:41:34 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     bhelgaas@google.com, lorenzo.pieralisi@arm.com, kbusch@kernel.org,
        hch@lst.de, linux-nvme@lists.infradead.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, svarbanov@mm-sol.com,
        bjorn.andersson@linaro.org, axboe@fb.com,
        quic_vbadigan@quicinc.com, quic_krichai@quicinc.com,
        quic_nitirawa@quicinc.com, vidyas@nvidia.com, sagi@grimberg.me
Subject: Re: [PATCH 2/3] PCI: dwc: qcom: Set suspend_poweroff flag for SC7280
Message-ID: <20220517151134.GB4528@thinkpad>
References: <20220513110027.31015-3-manivannan.sadhasivam@linaro.org>
 <20220516201950.GA1047412@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516201950.GA1047412@bhelgaas>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 16, 2022 at 03:19:50PM -0500, Bjorn Helgaas wrote:
> On Fri, May 13, 2022 at 04:30:26PM +0530, Manivannan Sadhasivam wrote:
> > For aggressive power saving on SC7280 SoCs, the power for the PCI devices
> > will be taken off during system suspend. Hence, notify the same to the
> > PCI device drivers using "suspend_poweroff" flag so that the drivers can
> > prepare the PCI devices to handle the poweroff and recover them during
> > resume.
> 
> No doubt "power ... will be taken off during system suspend" is true,
> but this isn't very informative.  Is this a property of SC7280?  A
> choice made by the SC7280 driver?  Why is this not applicable to other
> systems?
> 

The SC7280's RPMh firmware is cutting off the PCIe power domain during system
suspend. And as I explained in previous patch, the RC driver itself may put the
devices in D3cold conditionally on this platform. The reason is to save power
as this chipset is being used in Chromebooks.

Thanks,
Mani

> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-qcom.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > index 6ab90891801d..4b0ad2827f8f 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > @@ -199,6 +199,7 @@ struct qcom_pcie_cfg {
> >  	unsigned int has_ddrss_sf_tbu_clk:1;
> >  	unsigned int has_aggre0_clk:1;
> >  	unsigned int has_aggre1_clk:1;
> > +	unsigned int suspend_poweroff:1;
> >  };
> >  
> >  struct qcom_pcie {
> > @@ -1220,6 +1221,10 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
> >  	if (pcie->cfg->pipe_clk_need_muxing)
> >  		clk_set_parent(res->pipe_clk_src, res->ref_clk_src);
> >  
> > +	/* Indicate PCI device drivers that the power will be taken off during system suspend */
> > +	if (pcie->cfg->suspend_poweroff)
> > +		pci->pp.bridge->suspend_poweroff = true;
> > +
> >  	ret = clk_bulk_prepare_enable(res->num_clks, res->clks);
> >  	if (ret < 0)
> >  		goto err_disable_regulators;
> > @@ -1548,6 +1553,7 @@ static const struct qcom_pcie_cfg sc7280_cfg = {
> >  	.ops = &ops_1_9_0,
> >  	.has_tbu_clk = true,
> >  	.pipe_clk_need_muxing = true,
> > +	.suspend_poweroff = true,
> >  };
> >  
> >  static const struct dw_pcie_ops dw_pcie_ops = {
> > -- 
> > 2.25.1
> > 

-- 
மணிவண்ணன் சதாசிவம்
