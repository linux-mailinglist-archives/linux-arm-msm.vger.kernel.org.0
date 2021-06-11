Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27FEB3A3B08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jun 2021 06:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbhFKEbD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Jun 2021 00:31:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbhFKEbD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Jun 2021 00:31:03 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA559C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jun 2021 21:28:52 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so1967852otl.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jun 2021 21:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kXOnYtSbHsP5X52mqhdl8R+kJt1644GbTqVsWCBSr+8=;
        b=gT2z31cM9KvYyLM1VaJUYef+UGZQBTFA92jC/G9pD8dujw7uhHDUncjWyBavgJ4LCj
         ci1Buo3O7Q6WUU+FMLFR/K65uns48zfUaH35BqxbXyVr8TqzyhsAPLFVbfQiTGXRJLK3
         SVZyeB8Cn6eEwo8+tKmNKvxnpNrETzUBv1sO5mVApdrSgv2hQuyr6Ex5Dz6yGo1IVT+2
         S3vVQ6rdZ5SjAijr7w0TMrRexGarUgJTjpSIEtpLkith3zzM0PZjOZk/ZQw/Mtqtj/z5
         5WZdzZsVaKFn/SvOx9n7PcbBnn8r2aAYZxXcJSMs6hEqYkWi/IJ/Lt53Kzh9w1T9ynzu
         72uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kXOnYtSbHsP5X52mqhdl8R+kJt1644GbTqVsWCBSr+8=;
        b=Y/h3tHFnZI/nXtlsrp9UjdgM14YO3aACS4KkskNWTcLU7NCMQuAVuhZzo8q9pOCjgs
         XxSM32jKjW7rgz5LqhyUarCxriS/XcWIaUMIxot6i4kynt+sQduGeeTjDAaDDfFwk1UG
         7NySmjSFvgcbh3+qR0YFetUaSJNsrDyHwHH9Ntf/vphWddeKftuFBoYwGPaMwarmqx9Y
         FlLfWiuiCVJ2qHw+XwoAhnmApsTJP4pJNka0FV7ys18XTMl8lPZBaV+wWVQlMg3E9XCz
         aIdJoZxN3D4RstJ0yk3ptvGC3uiFzk2C9+lXRtGZlhdj9ElnAfpY3c0VLkj1gZnQP/tK
         ut+g==
X-Gm-Message-State: AOAM530nSIvBbumUb5SJfcG3+iUwlpPRaMhvKleULbe5ZsVG1+rPtrag
        emjBEB7bTkBV2zTHvTRTH22OWAGTa2n2Vw==
X-Google-Smtp-Source: ABdhPJxjl7kJ0ta7lOiS9PdPWC9LD3KY43aOF9j4vvoPej0A02/M5+YQvExPRPViZI7+Spg/BywjSA==
X-Received: by 2002:a05:6830:30a8:: with SMTP id g8mr1444380ots.122.1623385732053;
        Thu, 10 Jun 2021 21:28:52 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u10sm934709otj.75.2021.06.10.21.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 21:28:51 -0700 (PDT)
Date:   Thu, 10 Jun 2021 23:28:49 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     lorenzo.pieralisi@arm.com, robh@kernel.org, bhelgaas@google.com,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Siddartha Mohanadoss <smohanad@codeaurora.org>
Subject: Re: [PATCH v2 2/3] PCI: dwc: Add Qualcomm PCIe Endpoint controller
 driver
Message-ID: <YMLmgQ2hWAxj+vuy@builder.lan>
References: <20210603103814.95177-1-manivannan.sadhasivam@linaro.org>
 <20210603103814.95177-3-manivannan.sadhasivam@linaro.org>
 <YLw744UeM6fj/xoS@builder.lan>
 <20210609085152.GB15118@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210609085152.GB15118@thinkpad>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 09 Jun 03:51 CDT 2021, Manivannan Sadhasivam wrote:
> On Sat, Jun 05, 2021 at 10:07:15PM -0500, Bjorn Andersson wrote:
> > On Thu 03 Jun 05:38 CDT 2021, Manivannan Sadhasivam wrote:
> > > diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
[..]
> > > +static irqreturn_t qcom_pcie_ep_perst_threaded_irq(int irq, void *data)
> > > +{
> > > +	struct qcom_pcie_ep *pcie_ep = data;
> > > +	struct dw_pcie *pci = &pcie_ep->pci;
> > > +	struct device *dev = pci->dev;
> > > +	u32 perst;
> > > +
> > > +	perst = gpiod_get_value(pcie_ep->reset);
> > > +
> > > +	if (perst) {
> > > +		/* Start link training */
> > > +		dev_info(dev, "PERST de-asserted by host. Starting link training!\n");
> > > +		qcom_pcie_establish_link(pci);
> > > +	} else {
> > > +		/* Shutdown the link if the link is already on */
> > > +		dev_info(dev, "PERST asserted by host. Shutting down the PCIe link!\n");
> > > +		qcom_pcie_disable_link(pci);
> > > +	}
> > > +
> > > +	/* Set trigger type based on the next expected value of perst gpio */
> > > +	irq_set_irq_type(gpiod_to_irq(pcie_ep->reset),
> > > +			 (perst ? IRQF_TRIGGER_LOW : IRQF_TRIGGER_HIGH));
> > 
> > Looks like you're manually implementing edge triggering, is there any
> > reason for that? EDGE_BOTH seems to do the same thing...
> > 
> 
> PERST is a level based signal, so I don't think we can use EDGE_BOTH here.
> 

Afaict it's just a gpio and you define if the hardware should fire of
interrupts given its level or if it should detect transitions.

That said, if the gpio is already high when registering the irq handler
there's no transition.

> > > +
> > > +	return IRQ_HANDLED;
> > > +}
[..]
> > > +static struct platform_driver qcom_pcie_ep_driver = {
> > > +	.probe	= qcom_pcie_ep_probe,
> > > +	.driver	= {
> > > +		.name		= "qcom-pcie-ep",
> > 
> > Skip the indentation of the '='.
> > 
> > > +		.suppress_bind_attrs = true,
> > 
> > Why do we suppress_bind_attrs?
> > 
> 
> This driver doesn't support remove() callback and I don't think it is necessary
> for this platform driver. So this flag is here to prevent unbind from sysfs.
> 

Right, that part makes sense. But do you know why this is, why it's not
possible to have the PCI controller built as a module? (GKI should
want this).

Regards,
Bjorn
