Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC89C1BF44F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 11:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgD3Jmo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 05:42:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726631AbgD3Jmm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 05:42:42 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88BCEC035494
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 02:42:42 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x77so2648028pfc.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 02:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wEB7EJvoHa08WhVzrSqoOswP93rzBLbNHkeQBpjcXPU=;
        b=ewyQOJ19qGPQq6u8Ei9vOy+Or3amkDFX+sG4cagso1iecJK50FBmbycfQ3ZLR9fFoI
         906+GJaYz//n27hleiq67HflPmEjREFCrO1p7AehL2ervzFuwA/XhZl8yQl+hjnj9Keu
         8Ftz3JskjMPmK3ezhIt/7OknqFirkYWF508BQf4XozFJZAUQj0nLWQxur/MyyOv0YvX8
         f54BDoNOEAiP3rD/jugJ2Nnv4jY7cFq9bM+Hf9NZATm0xl2hfFQ6Y0pczO6gzNqx0YoT
         /ubMhsyJgNeo0AzY5HM1qPIuems7w8E7e0fcl/rAjnBE4cypDOTECUWRePOf2eSKW3vE
         9mLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wEB7EJvoHa08WhVzrSqoOswP93rzBLbNHkeQBpjcXPU=;
        b=ai4f72iZgnuTkQxGDZpmL3+El5bqCH6MaRXbTrhDi37q7n+VakhT59dqns/RVYEYH0
         ptXusZfOnu3+9tOGMM52cQxk41oKX+YN2XbXtOF3rn6Fy8k/X9sTWA9RIM+g95MVb9rO
         0eHEif01Z/URpBJm7PBTO8dasbj/dkcd+krlT2V5p/0NBnm2mLxBwi1gI+Io+ut+Zdrl
         Y9T0kDJrkJaxUttHJjbFPggjMpJv/eUjd9BvnHPbrB42c296H5c+5q8V0dIJbKAG8Jf8
         vRNT1YLDo2bC2h0JO1o5+HqpmbRfvh2ZIdXToq9LczHz69EcnSuwhN6B00LVjPNg2utu
         mxtg==
X-Gm-Message-State: AGi0PuYBUTlV9x266I+kpy+odbU7SLQEHJCZPZ9ci2SBGD17pRKLsbaQ
        PQEmL3CodxyDX0XtGVPBfir7
X-Google-Smtp-Source: APiQypJcnrd8rFaraSdu3qMtUXBdre/xWZ4CYeVP3JOi9LpDqktjRVIh4IcFXijClFpolHcGZE5NeA==
X-Received: by 2002:a62:2b82:: with SMTP id r124mr2824952pfr.242.1588239761766;
        Thu, 30 Apr 2020 02:42:41 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6081:946c:419e:a71:7237:1613])
        by smtp.gmail.com with ESMTPSA id z28sm3181994pfr.3.2020.04.30.02.42.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 02:42:40 -0700 (PDT)
Date:   Thu, 30 Apr 2020 15:12:33 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>,
        Raghavendra Rao Ananta <rananta@codeaurora.org>
Subject: Re: [PATCH 2/2] soc: qcom: ipcc: Add support for IPCC controller
Message-ID: <20200430094233.GD9449@Mani-XPS-13-9360>
References: <20200430063054.18879-1-manivannan.sadhasivam@linaro.org>
 <20200430063054.18879-2-manivannan.sadhasivam@linaro.org>
 <20200430072448.GF948789@vkoul-mobl.Dlink>
 <20200430090247.GC9449@Mani-XPS-13-9360>
 <20200430092358.GI948789@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430092358.GI948789@vkoul-mobl.Dlink>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 30, 2020 at 02:53:58PM +0530, Vinod Koul wrote:
> On 30-04-20, 14:32, Manivannan Sadhasivam wrote:
> > Hi,
> > 
> > On Thu, Apr 30, 2020 at 12:54:48PM +0530, Vinod Koul wrote:
> > > On 30-04-20, 12:00, Manivannan Sadhasivam wrote:
> > > 
> > > > +#define IPCC_SIGNAL_ID_MASK		GENMASK(15, 0)
> > > > +#define IPCC_CLIENT_ID_MASK		GENMASK(31, 16)
> > > > +#define IPCC_CLIENT_ID_SHIFT		16
> > > > +
> > > > +#define IPCC_NO_PENDING_IRQ		0xffffffff
> > > 
> > > Why not GENMASK(31, 0)
> > > 
> > 
> > Hmm, I usually use GENMASK for mask defines. But yeah it can be used here.
> 
> Well the idea behind genmask was to avoid coding mistakes which sounds
> apt here as well :)
> 

Agree.

> > 
> > > > +static struct qcom_ipcc_proto_data *ipcc_proto_data;
> > > 
> > > why do we need a global which is used only once.
> > > 
> > 
> > Ah, that's a left over. Will remove it.
> > 
> > > > +static void qcom_ipcc_mask_irq(struct irq_data *irqd)
> > > > +{
> > > > +	struct qcom_ipcc_proto_data *proto_data;
> > > > +	irq_hw_number_t hwirq = irqd_to_hwirq(irqd);
> > > > +	u16 sender_client_id = qcom_ipcc_get_client_id(hwirq);
> > > > +	u16 sender_signal_id = qcom_ipcc_get_signal_id(hwirq);
> > > 
> > > last three are used for debug log, fn can be much simpler if we get rid
> > > of noise.. Do we really need this to be production :)
> > > 
> > 
> > This is for debugging the production systems, that's why dev_dbg. So I don't
> > consider it as a noise :)
> 
> This in an irq chip, the debug code is much more than actual function!
> Anyone who wants to debug can add these lines :)
> 

I don't have a strong feeling so will remove :)

> > > > +	proto_data = irq_data_get_irq_chip_data(irqd);
> > > > +
> > > > +	dev_dbg(proto_data->dev,
> > > > +		"Disabling interrupts for: client_id: %u; signal_id: %u\n",
> > > > +		sender_client_id, sender_signal_id);
> > > > +
> > > > +	writel(hwirq, proto_data->base + IPCC_REG_RECV_SIGNAL_DISABLE);
> > > > +}
> > > > +
> > > > +static void qcom_ipcc_unmask_irq(struct irq_data *irqd)
> > > > +{
> > > > +	struct qcom_ipcc_proto_data *proto_data;
> > > > +	irq_hw_number_t hwirq = irqd_to_hwirq(irqd);
> > > > +	u16 sender_client_id = qcom_ipcc_get_client_id(hwirq);
> > > > +	u16 sender_signal_id = qcom_ipcc_get_signal_id(hwirq);
> > > 
> > > here as well
> > > 
> > > > +static int qcom_ipcc_domain_xlate(struct irq_domain *d,
> > > > +				  struct device_node *node, const u32 *intspec,
> > > > +				  unsigned int intsize,
> > > > +				  unsigned long *out_hwirq,
> > > > +				  unsigned int *out_type)
> > > 
> > > pls align these to match open parenthesis
> > > 
> > 
> > It is aligned. Perhaps diff is showing it as mangled due to ignoring
> > whitespaces?
> 
> Not sure, even checkpatch seems to think so
> 

I'm not sure too, this is what it says for me:

WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#66: 
new file mode 100644

CHECK: Alignment should match open parenthesis
#279: FILE: drivers/soc/qcom/qcom_ipcc.c:209:
+static struct mbox_chan *qcom_ipcc_mbox_xlate(struct mbox_controller *mbox,
+					const struct of_phandle_args *ph)

total: 0 errors, 1 warnings, 1 checks, 433 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplace.

Commit 01c2e8a8a53d ("soc: qcom: ipcc: Add support for IPCC controller") has style problems, please review.

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.

> > 
> > > > +static int qcom_ipcc_setup_mbox(struct qcom_ipcc_proto_data *proto_data,
> > > > +				struct device_node *controller_dn)
> > > > +{
> > > > +	struct mbox_controller *mbox;
> > > > +	struct device_node *client_dn;
> > > > +	struct device *dev = proto_data->dev;
> > > > +	struct of_phandle_args curr_ph;
> > > > +	int i, j, ret;
> > > > +	int num_chans = 0;
> > > > +
> > > > +	/*
> > > > +	 * Find out the number of clients interested in this mailbox
> > > > +	 * and create channels accordingly.
> > > > +	 */
> > > > +	for_each_node_with_property(client_dn, "mboxes") {
> > > > +		if (!of_device_is_available(client_dn))
> > > > +			continue;
> > > > +		i = of_count_phandle_with_args(client_dn,
> > > > +					       "mboxes", "#mbox-cells");
> > > > +		for (j = 0; j < i; j++) {
> > > > +			ret = of_parse_phandle_with_args(client_dn, "mboxes",
> > > > +							 "#mbox-cells", j,
> > > > +							 &curr_ph);
> > > 
> > > this sounds like something DT should do, not drivers :)
> > > 
> > 
> > Right. This is design discussion I'd like to have. Currently the driver checks
> > the DT and allocates the total number of mbox channels. But I think the more
> > cleaner way would be to have this driver allocating fixed number of channels
> > statically and let the clients use it.
> 
> Sorry my point was about code of checking mboxes and #mbox-cells, these
> seems generic enough and could be moved into of core code :)
> 
> But I think making fixed number of channels should not be done if DT can
> provide this information.
> 

That's not my call, it is Jassi :) All mailbox drivers statically declare the
number of channels in drivers and we don't have any API/property to fetch the
information from DT.

If Jassi is okay with it, I can add an API and corresponding DT property (and
ofcourse document it).

> > Maybe Raghavendra/Venkat can comment here?
> > 
> > > > +static int qcom_ipcc_probe(struct platform_device *pdev)
> > > > +{
> > > > +	struct qcom_ipcc_proto_data *proto_data;
> > > > +	int ret;
> > > > +
> > > > +	proto_data = devm_kzalloc(&pdev->dev, sizeof(*proto_data), GFP_KERNEL);
> > > > +	if (!proto_data)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	ipcc_proto_data = proto_data;
> > > > +	proto_data->dev = &pdev->dev;
> > > > +
> > > > +	proto_data->base = devm_platform_ioremap_resource(pdev, 0);
> > > > +	if (IS_ERR(proto_data->base)) {
> > > > +		dev_err(&pdev->dev, "Failed to ioremap the ipcc base addr\n");
> > > > +		return PTR_ERR(proto_data->base);
> > > > +	}
> > > > +
> > > > +	proto_data->irq = platform_get_irq(pdev, 0);
> > > > +	if (proto_data->irq < 0) {
> > > > +		dev_err(&pdev->dev, "Failed to get the IRQ\n");
> > > > +		return proto_data->irq;
> > > > +	}
> > > > +
> > > > +	/* Perform a SW reset on this client's protocol state */
> > > > +	writel(0x1, proto_data->base + IPCC_REG_CLIENT_CLEAR);
> > > > +
> > > > +	proto_data->irq_domain = irq_domain_add_tree(pdev->dev.of_node,
> > > > +						     &qcom_ipcc_irq_ops,
> > > > +						     proto_data);
> > > > +	if (!proto_data->irq_domain) {
> > > > +		dev_err(&pdev->dev, "Failed to add irq_domain\n");
> > > > +		return -ENOMEM;
> > > > +	}
> > > > +
> > > > +	ret = qcom_ipcc_setup_mbox(proto_data, pdev->dev.of_node);
> > > > +	if (ret) {
> > > > +		dev_err(&pdev->dev, "Failed to create mailbox\n");
> > > > +		goto err_mbox;
> > > > +	}
> > > > +
> > > > +	ret = devm_request_irq(&pdev->dev, proto_data->irq, qcom_ipcc_irq_fn,
> > > > +			       IRQF_TRIGGER_HIGH, "ipcc", proto_data);
> > > > +	if (ret < 0) {
> > > > +		dev_err(&pdev->dev, "Failed to register the irq: %d\n", ret);
> > > 
> > > Should the qcom_ipcc_setup_mbox() not be unroller here?
> > 
> > qcom_ipcc_setup_mbox() uses devm_ API for registering mbox controller. So what
> > is the issue?
> 
> Ah missed the devm parts, i think no unroll required here
> 
> > > > +		goto err_mbox;
> > > > +	}
> > > > +
> > > > +	enable_irq_wake(proto_data->irq);
> > > > +	platform_set_drvdata(pdev, proto_data);
> > > > +
> > > > +	return 0;
> > > > +
> > > > +err_mbox:
> > > > +	irq_domain_remove(proto_data->irq_domain);
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static int qcom_ipcc_remove(struct platform_device *pdev)
> > > > +{
> > > > +	struct qcom_ipcc_proto_data *proto_data = platform_get_drvdata(pdev);
> > > > +
> > > > +	disable_irq_wake(proto_data->irq);
> > > > +	irq_domain_remove(proto_data->irq_domain);
> > > 
> > > So you are calling this when your isr is active, we have possibility of
> > > race here. This function come with a warning:
> > > "The caller must ensure that all mappings within the domain have been disposed"
> > 
> > I thought it is not required since most of the interrupt controller drivers
> > don't do it. But checked with Marc Zyngier and he suggested to dispose the
> > mapping as that's the good practice. The usual pattern is an interrupt
> > controller is not built as a module and the assumption is it lives forever.
> > 
> > But one issue here is, currently we don't know the allocated irqs (in specific
> > hw irq numbers) as we don't create the mapping. It gets created when a client
> > calls platform_get_irq(). In the irq handler, we just read the current hw irq
> > number from a register. So, if we want to dispose the mapping then we need to
> > track the allocated irqs. Else we need to create the mapping for all possible
> > clients in this driver itself. I'm not sure which one is preferred.
> > 
> > Maybe Bjorn/qcom folks can comment what is preferred here?
> 
> Maybe this should also be lives forever cases then! :)
> 

Heh. Most of the drivers using irq_domain_add_tree() don't bother disposing the
interrupts. Currently this driver is defined as tristate. So either we should
dispose the interrupts or make it as built-in only. If this is ever going to get
removed, then there will be a warning from kernel saying irq tree is not empty!

Or there is also a case where we can make sure that all clients will dispose
their interrupts when they get unloaded. In that way, we can safely remove the
irq domain in this driver.

Thanks,
Mani

> -- 
> ~Vinod
