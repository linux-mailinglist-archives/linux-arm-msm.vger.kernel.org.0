Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 454313A3B23
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jun 2021 06:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbhFKEqt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Jun 2021 00:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbhFKEqs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Jun 2021 00:46:48 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4054AC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jun 2021 21:44:38 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id o17-20020a17090a9f91b029015cef5b3c50so5103512pjp.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jun 2021 21:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fRxLBozaN4SltyilUViQPuK+PpihOctfxY+FQg2HMuM=;
        b=Ie7xmferhpcr9Yhmc5415IDEf7zXz7R6ygX4f8Coa/dxeb6OEkqDtCYa1piGT+S4ca
         rOHGBVQRmKXx9L5V5i7ahqfzUgaJhW0fVzfXkwmJpYmlje7AQrNdhgv4lz+K3n4TA/A+
         tvR9qo1GRA2COvzwFlTlfJ8oWavvuW08bUEJLdbY7bLBZkZQVOdKFOPTxtRl+Pwk6j93
         LKuruUUTnqhUe6fs2kBlu57LqZwDLtL44mpnMWji4iBnhRmpwN1BXpOoQqlHly4XCtEL
         wPTVq/g0XSHsLqJQa4m/AXQHYXIOifhLHD1XXNsX2zlgaZMCwQJ/bMEJ4cCWBGBBsYMz
         t7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fRxLBozaN4SltyilUViQPuK+PpihOctfxY+FQg2HMuM=;
        b=FB44y9k5IsvDvwHiqSXO874kAmILzDqYB9Lf/7Aq6FHDiQMswhP8aEowpp/vjXWFO1
         VvER7W4Y3M5eXyDMOgZFn9NdhtHSkrOzGiEtl7sUv2hU8VQ45Ccq3vp6JgVOU+l+hn1t
         IxLD7+sbbL5lViPAfXJlHF/GXsTe6wTivZzz1QuP3rPJ78y2KjEz9TLKg19hSWu7GzGM
         DPcjtDR/Gd1AIQViQ13992oJK3Irbdv5HeK2QtlR07uW3qa87irJrPWFkVOZALLeO+S8
         MTDou9mTyVn5zruzFTgEcknC30hihwbnq0R6WP1O9eUmhUDzb5oC8d8SjUQnq/nsDg5b
         Mvpw==
X-Gm-Message-State: AOAM5318rr2b5585YNA4tiiVPwZyzJ3/DU6Hfo62qWEKPoyzKNwa8J7y
        WO07RbHS+Ew8hRbmLcdG8hUu
X-Google-Smtp-Source: ABdhPJyXE5YbnRFjaJKPHPKLkZ0eXnaLHFVXDGyku5AZygmgIdkaC9PWx9cEvRiPPkSF8vurPdsuOA==
X-Received: by 2002:a17:90a:a481:: with SMTP id z1mr6987736pjp.165.1623386677654;
        Thu, 10 Jun 2021 21:44:37 -0700 (PDT)
Received: from thinkpad ([2409:4072:6281:d9a2:40f:351d:828b:fc1a])
        by smtp.gmail.com with ESMTPSA id h6sm3730181pfk.40.2021.06.10.21.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 21:44:37 -0700 (PDT)
Date:   Fri, 11 Jun 2021 10:14:28 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     lorenzo.pieralisi@arm.com, robh@kernel.org, bhelgaas@google.com,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Siddartha Mohanadoss <smohanad@codeaurora.org>
Subject: Re: [PATCH v2 2/3] PCI: dwc: Add Qualcomm PCIe Endpoint controller
 driver
Message-ID: <20210611044428.GA6950@thinkpad>
References: <20210603103814.95177-1-manivannan.sadhasivam@linaro.org>
 <20210603103814.95177-3-manivannan.sadhasivam@linaro.org>
 <YLw744UeM6fj/xoS@builder.lan>
 <20210609085152.GB15118@thinkpad>
 <YMLmgQ2hWAxj+vuy@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMLmgQ2hWAxj+vuy@builder.lan>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 10, 2021 at 11:28:49PM -0500, Bjorn Andersson wrote:
> On Wed 09 Jun 03:51 CDT 2021, Manivannan Sadhasivam wrote:
> > On Sat, Jun 05, 2021 at 10:07:15PM -0500, Bjorn Andersson wrote:
> > > On Thu 03 Jun 05:38 CDT 2021, Manivannan Sadhasivam wrote:
> > > > diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> [..]
> > > > +static irqreturn_t qcom_pcie_ep_perst_threaded_irq(int irq, void *data)
> > > > +{
> > > > +	struct qcom_pcie_ep *pcie_ep = data;
> > > > +	struct dw_pcie *pci = &pcie_ep->pci;
> > > > +	struct device *dev = pci->dev;
> > > > +	u32 perst;
> > > > +
> > > > +	perst = gpiod_get_value(pcie_ep->reset);
> > > > +
> > > > +	if (perst) {
> > > > +		/* Start link training */
> > > > +		dev_info(dev, "PERST de-asserted by host. Starting link training!\n");
> > > > +		qcom_pcie_establish_link(pci);
> > > > +	} else {
> > > > +		/* Shutdown the link if the link is already on */
> > > > +		dev_info(dev, "PERST asserted by host. Shutting down the PCIe link!\n");
> > > > +		qcom_pcie_disable_link(pci);
> > > > +	}
> > > > +
> > > > +	/* Set trigger type based on the next expected value of perst gpio */
> > > > +	irq_set_irq_type(gpiod_to_irq(pcie_ep->reset),
> > > > +			 (perst ? IRQF_TRIGGER_LOW : IRQF_TRIGGER_HIGH));
> > > 
> > > Looks like you're manually implementing edge triggering, is there any
> > > reason for that? EDGE_BOTH seems to do the same thing...
> > > 
> > 
> > PERST is a level based signal, so I don't think we can use EDGE_BOTH here.
> > 
> 
> Afaict it's just a gpio and you define if the hardware should fire of
> interrupts given its level or if it should detect transitions.
> 
> That said, if the gpio is already high when registering the irq handler
> there's no transition.
> 

Right, that's one of the issue with edge triggering. PERST# can be deasserted by
the host before EP driver probes. So if we wait for edge transition then we'll
be stuck.

> > > > +
> > > > +	return IRQ_HANDLED;
> > > > +}
> [..]
> > > > +static struct platform_driver qcom_pcie_ep_driver = {
> > > > +	.probe	= qcom_pcie_ep_probe,
> > > > +	.driver	= {
> > > > +		.name		= "qcom-pcie-ep",
> > > 
> > > Skip the indentation of the '='.
> > > 
> > > > +		.suppress_bind_attrs = true,
> > > 
> > > Why do we suppress_bind_attrs?
> > > 
> > 
> > This driver doesn't support remove() callback and I don't think it is necessary
> > for this platform driver. So this flag is here to prevent unbind from sysfs.
> > 
> 
> Right, that part makes sense. But do you know why this is, why it's not
> possible to have the PCI controller built as a module? (GKI should
> want this).
> 

For an endpoint, making this driver built-in makes sense since this forms the
basic functionality of the device and we do want it to probe asap (without
initramfs dance). But looking at other drivers, most of them (including Qcom RC)
doesn't support tristate.

But for the GKI requirement, I can add it.

Thanks,
Mani

> Regards,
> Bjorn
