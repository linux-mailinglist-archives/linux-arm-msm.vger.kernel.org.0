Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1DC31BF3A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 11:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726782AbgD3JC5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 05:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726631AbgD3JC5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 05:02:57 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 309F1C035495
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 02:02:57 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id f7so2580165pfa.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 02:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=o0ylbaJJxRYJkYt9dU8gOqV6HQ6SaTR5QYZMMNZsLLU=;
        b=FLfFZ3bDtV27gmsNgunn881EGIhX6Nj10ko7iTpy6xGWSxO9Ejnx17ogDC384rGBC8
         nQpfFiI7mBiDaIoucUb4GQUk7r73Z0dzYc4m4e1aKwEFolNSmGfeSc032QoOmRu+0VKl
         kxnf43L/VHxFXCA7ztXp0vCU8TclFa6KlIOl4dz/cElkebmNtvfGmxbHU2pLf/zACTGr
         SMLkIHwVr59kHfqnHYupHirFcOjPHeabb3MlOYu3+2twh+Ta+Ot2VlWMtLl7taQI4VGm
         W1Q6pgamNHmIx0YCJw9A2Yg4yCdT1jw39P0Ac/Z3iSfP4u7h+XwrYMaLaHRao8GJJM0Q
         LdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=o0ylbaJJxRYJkYt9dU8gOqV6HQ6SaTR5QYZMMNZsLLU=;
        b=tFkivITgdjTh/Z1fppEPa4sgW6tq3vHLSSH/R0Rg/8+isfcv0XrndN7/OrdpJ3D70q
         tJ/IElN+7+Xkc3O4BCNuFXlCCp1cN8gfFmgqpo6nHv73Ncjm4FnykfRN+VGGFxotIyGT
         kH9oRDoJy77yOE17q/vc0NhaIrKsqLuDJ70/nWfg/RwoozjX/LKZ2iNxBQo/BFkmbZlj
         00jb4wyf7CmrB+AVdRJ/oN4wVCZvShSmhzFou47OXM3duePumNBqYlmNyL/enKB0ExH0
         DalrNXHzDsSqDu+Y8tT3gfa/HDtMaLVGW6Q/Y4X7ir/VH+jUQQoK+CE7p1/8baX7UE/X
         0eTw==
X-Gm-Message-State: AGi0PuZBbaBzamYFMBzSG6j9dvP/ygW8oaDAUSsCX+rLnxEk0qLTT/ix
        e7R0BZClaYlbD4q/6BSVW95J
X-Google-Smtp-Source: APiQypJSoPPAe7Hpds17aNNNGnGknCCNBSB6EgMvl5rOMHNFthsP0vuECBfaRygcf3/KvFZAh/rZKg==
X-Received: by 2002:a63:1c50:: with SMTP id c16mr2287909pgm.255.1588237376211;
        Thu, 30 Apr 2020 02:02:56 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6081:946c:419e:a71:7237:1613])
        by smtp.gmail.com with ESMTPSA id m7sm3070924pfb.48.2020.04.30.02.02.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 02:02:55 -0700 (PDT)
Date:   Thu, 30 Apr 2020 14:32:47 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>,
        Raghavendra Rao Ananta <rananta@codeaurora.org>
Subject: Re: [PATCH 2/2] soc: qcom: ipcc: Add support for IPCC controller
Message-ID: <20200430090247.GC9449@Mani-XPS-13-9360>
References: <20200430063054.18879-1-manivannan.sadhasivam@linaro.org>
 <20200430063054.18879-2-manivannan.sadhasivam@linaro.org>
 <20200430072448.GF948789@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430072448.GF948789@vkoul-mobl.Dlink>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Apr 30, 2020 at 12:54:48PM +0530, Vinod Koul wrote:
> On 30-04-20, 12:00, Manivannan Sadhasivam wrote:
> 
> > +#define IPCC_SIGNAL_ID_MASK		GENMASK(15, 0)
> > +#define IPCC_CLIENT_ID_MASK		GENMASK(31, 16)
> > +#define IPCC_CLIENT_ID_SHIFT		16
> > +
> > +#define IPCC_NO_PENDING_IRQ		0xffffffff
> 
> Why not GENMASK(31, 0)
> 

Hmm, I usually use GENMASK for mask defines. But yeah it can be used here.

> > +static struct qcom_ipcc_proto_data *ipcc_proto_data;
> 
> why do we need a global which is used only once.
> 

Ah, that's a left over. Will remove it.

> > +static void qcom_ipcc_mask_irq(struct irq_data *irqd)
> > +{
> > +	struct qcom_ipcc_proto_data *proto_data;
> > +	irq_hw_number_t hwirq = irqd_to_hwirq(irqd);
> > +	u16 sender_client_id = qcom_ipcc_get_client_id(hwirq);
> > +	u16 sender_signal_id = qcom_ipcc_get_signal_id(hwirq);
> 
> last three are used for debug log, fn can be much simpler if we get rid
> of noise.. Do we really need this to be production :)
> 

This is for debugging the production systems, that's why dev_dbg. So I don't
consider it as a noise :)

> > +
> > +	proto_data = irq_data_get_irq_chip_data(irqd);
> > +
> > +	dev_dbg(proto_data->dev,
> > +		"Disabling interrupts for: client_id: %u; signal_id: %u\n",
> > +		sender_client_id, sender_signal_id);
> > +
> > +	writel(hwirq, proto_data->base + IPCC_REG_RECV_SIGNAL_DISABLE);
> > +}
> > +
> > +static void qcom_ipcc_unmask_irq(struct irq_data *irqd)
> > +{
> > +	struct qcom_ipcc_proto_data *proto_data;
> > +	irq_hw_number_t hwirq = irqd_to_hwirq(irqd);
> > +	u16 sender_client_id = qcom_ipcc_get_client_id(hwirq);
> > +	u16 sender_signal_id = qcom_ipcc_get_signal_id(hwirq);
> 
> here as well
> 
> > +static int qcom_ipcc_domain_xlate(struct irq_domain *d,
> > +				  struct device_node *node, const u32 *intspec,
> > +				  unsigned int intsize,
> > +				  unsigned long *out_hwirq,
> > +				  unsigned int *out_type)
> 
> pls align these to match open parenthesis
> 

It is aligned. Perhaps diff is showing it as mangled due to ignoring
whitespaces?

> > +static int qcom_ipcc_setup_mbox(struct qcom_ipcc_proto_data *proto_data,
> > +				struct device_node *controller_dn)
> > +{
> > +	struct mbox_controller *mbox;
> > +	struct device_node *client_dn;
> > +	struct device *dev = proto_data->dev;
> > +	struct of_phandle_args curr_ph;
> > +	int i, j, ret;
> > +	int num_chans = 0;
> > +
> > +	/*
> > +	 * Find out the number of clients interested in this mailbox
> > +	 * and create channels accordingly.
> > +	 */
> > +	for_each_node_with_property(client_dn, "mboxes") {
> > +		if (!of_device_is_available(client_dn))
> > +			continue;
> > +		i = of_count_phandle_with_args(client_dn,
> > +					       "mboxes", "#mbox-cells");
> > +		for (j = 0; j < i; j++) {
> > +			ret = of_parse_phandle_with_args(client_dn, "mboxes",
> > +							 "#mbox-cells", j,
> > +							 &curr_ph);
> 
> this sounds like something DT should do, not drivers :)
> 

Right. This is design discussion I'd like to have. Currently the driver checks
the DT and allocates the total number of mbox channels. But I think the more
cleaner way would be to have this driver allocating fixed number of channels
statically and let the clients use it.

Maybe Raghavendra/Venkat can comment here?

> > +static int qcom_ipcc_probe(struct platform_device *pdev)
> > +{
> > +	struct qcom_ipcc_proto_data *proto_data;
> > +	int ret;
> > +
> > +	proto_data = devm_kzalloc(&pdev->dev, sizeof(*proto_data), GFP_KERNEL);
> > +	if (!proto_data)
> > +		return -ENOMEM;
> > +
> > +	ipcc_proto_data = proto_data;
> > +	proto_data->dev = &pdev->dev;
> > +
> > +	proto_data->base = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(proto_data->base)) {
> > +		dev_err(&pdev->dev, "Failed to ioremap the ipcc base addr\n");
> > +		return PTR_ERR(proto_data->base);
> > +	}
> > +
> > +	proto_data->irq = platform_get_irq(pdev, 0);
> > +	if (proto_data->irq < 0) {
> > +		dev_err(&pdev->dev, "Failed to get the IRQ\n");
> > +		return proto_data->irq;
> > +	}
> > +
> > +	/* Perform a SW reset on this client's protocol state */
> > +	writel(0x1, proto_data->base + IPCC_REG_CLIENT_CLEAR);
> > +
> > +	proto_data->irq_domain = irq_domain_add_tree(pdev->dev.of_node,
> > +						     &qcom_ipcc_irq_ops,
> > +						     proto_data);
> > +	if (!proto_data->irq_domain) {
> > +		dev_err(&pdev->dev, "Failed to add irq_domain\n");
> > +		return -ENOMEM;
> > +	}
> > +
> > +	ret = qcom_ipcc_setup_mbox(proto_data, pdev->dev.of_node);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Failed to create mailbox\n");
> > +		goto err_mbox;
> > +	}
> > +
> > +	ret = devm_request_irq(&pdev->dev, proto_data->irq, qcom_ipcc_irq_fn,
> > +			       IRQF_TRIGGER_HIGH, "ipcc", proto_data);
> > +	if (ret < 0) {
> > +		dev_err(&pdev->dev, "Failed to register the irq: %d\n", ret);
> 
> Should the qcom_ipcc_setup_mbox() not be unroller here?
> 

qcom_ipcc_setup_mbox() uses devm_ API for registering mbox controller. So what
is the issue?

> > +		goto err_mbox;
> > +	}
> > +
> > +	enable_irq_wake(proto_data->irq);
> > +	platform_set_drvdata(pdev, proto_data);
> > +
> > +	return 0;
> > +
> > +err_mbox:
> > +	irq_domain_remove(proto_data->irq_domain);
> > +
> > +	return ret;
> > +}
> > +
> > +static int qcom_ipcc_remove(struct platform_device *pdev)
> > +{
> > +	struct qcom_ipcc_proto_data *proto_data = platform_get_drvdata(pdev);
> > +
> > +	disable_irq_wake(proto_data->irq);
> > +	irq_domain_remove(proto_data->irq_domain);
> 
> So you are calling this when your isr is active, we have possibility of
> race here. This function come with a warning:
> "The caller must ensure that all mappings within the domain have been disposed"
> 

I thought it is not required since most of the interrupt controller drivers
don't do it. But checked with Marc Zyngier and he suggested to dispose the
mapping as that's the good practice. The usual pattern is an interrupt
controller is not built as a module and the assumption is it lives forever.

But one issue here is, currently we don't know the allocated irqs (in specific
hw irq numbers) as we don't create the mapping. It gets created when a client
calls platform_get_irq(). In the irq handler, we just read the current hw irq
number from a register. So, if we want to dispose the mapping then we need to
track the allocated irqs. Else we need to create the mapping for all possible
clients in this driver itself. I'm not sure which one is preferred.

Maybe Bjorn/qcom folks can comment what is preferred here?

Thanks,
Mani

> Has that been done?
> 
> -- 
> ~Vinod
