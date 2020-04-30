Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F21831BF14A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 09:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgD3HY6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 03:24:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:38834 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726411AbgD3HY6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 03:24:58 -0400
Received: from localhost (unknown [122.182.217.38])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 77DFC20838;
        Thu, 30 Apr 2020 07:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588231497;
        bh=o73DKXIEQot4ZVxoi7BxJN16vV5Yb1ZLvKCoQhLubJ0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f7b9emFtHoOiSqqRHJ54gOM4Cx0fZQgblsaPLl93yJ2LokNR72LI8KEUkfEnmFQxP
         2YuBlKUfhU3xDJCIHQRlwLs3E2xfU+5NABXbJEkkJqZB5ArASqkcdvYBSmwFRT7Ji1
         ghTxGBTUVfzTHoc7lx8lMXCEyOPe8RwhBI8L6KOA=
Date:   Thu, 30 Apr 2020 12:54:48 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>,
        Raghavendra Rao Ananta <rananta@codeaurora.org>
Subject: Re: [PATCH 2/2] soc: qcom: ipcc: Add support for IPCC controller
Message-ID: <20200430072448.GF948789@vkoul-mobl.Dlink>
References: <20200430063054.18879-1-manivannan.sadhasivam@linaro.org>
 <20200430063054.18879-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430063054.18879-2-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30-04-20, 12:00, Manivannan Sadhasivam wrote:

> +#define IPCC_SIGNAL_ID_MASK		GENMASK(15, 0)
> +#define IPCC_CLIENT_ID_MASK		GENMASK(31, 16)
> +#define IPCC_CLIENT_ID_SHIFT		16
> +
> +#define IPCC_NO_PENDING_IRQ		0xffffffff

Why not GENMASK(31, 0)

> +static struct qcom_ipcc_proto_data *ipcc_proto_data;

why do we need a global which is used only once.

> +static void qcom_ipcc_mask_irq(struct irq_data *irqd)
> +{
> +	struct qcom_ipcc_proto_data *proto_data;
> +	irq_hw_number_t hwirq = irqd_to_hwirq(irqd);
> +	u16 sender_client_id = qcom_ipcc_get_client_id(hwirq);
> +	u16 sender_signal_id = qcom_ipcc_get_signal_id(hwirq);

last three are used for debug log, fn can be much simpler if we get rid
of noise.. Do we really need this to be production :)

> +
> +	proto_data = irq_data_get_irq_chip_data(irqd);
> +
> +	dev_dbg(proto_data->dev,
> +		"Disabling interrupts for: client_id: %u; signal_id: %u\n",
> +		sender_client_id, sender_signal_id);
> +
> +	writel(hwirq, proto_data->base + IPCC_REG_RECV_SIGNAL_DISABLE);
> +}
> +
> +static void qcom_ipcc_unmask_irq(struct irq_data *irqd)
> +{
> +	struct qcom_ipcc_proto_data *proto_data;
> +	irq_hw_number_t hwirq = irqd_to_hwirq(irqd);
> +	u16 sender_client_id = qcom_ipcc_get_client_id(hwirq);
> +	u16 sender_signal_id = qcom_ipcc_get_signal_id(hwirq);

here as well

> +static int qcom_ipcc_domain_xlate(struct irq_domain *d,
> +				  struct device_node *node, const u32 *intspec,
> +				  unsigned int intsize,
> +				  unsigned long *out_hwirq,
> +				  unsigned int *out_type)

pls align these to match open parenthesis

> +static int qcom_ipcc_setup_mbox(struct qcom_ipcc_proto_data *proto_data,
> +				struct device_node *controller_dn)
> +{
> +	struct mbox_controller *mbox;
> +	struct device_node *client_dn;
> +	struct device *dev = proto_data->dev;
> +	struct of_phandle_args curr_ph;
> +	int i, j, ret;
> +	int num_chans = 0;
> +
> +	/*
> +	 * Find out the number of clients interested in this mailbox
> +	 * and create channels accordingly.
> +	 */
> +	for_each_node_with_property(client_dn, "mboxes") {
> +		if (!of_device_is_available(client_dn))
> +			continue;
> +		i = of_count_phandle_with_args(client_dn,
> +					       "mboxes", "#mbox-cells");
> +		for (j = 0; j < i; j++) {
> +			ret = of_parse_phandle_with_args(client_dn, "mboxes",
> +							 "#mbox-cells", j,
> +							 &curr_ph);

this sounds like something DT should do, not drivers :)

> +static int qcom_ipcc_probe(struct platform_device *pdev)
> +{
> +	struct qcom_ipcc_proto_data *proto_data;
> +	int ret;
> +
> +	proto_data = devm_kzalloc(&pdev->dev, sizeof(*proto_data), GFP_KERNEL);
> +	if (!proto_data)
> +		return -ENOMEM;
> +
> +	ipcc_proto_data = proto_data;
> +	proto_data->dev = &pdev->dev;
> +
> +	proto_data->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(proto_data->base)) {
> +		dev_err(&pdev->dev, "Failed to ioremap the ipcc base addr\n");
> +		return PTR_ERR(proto_data->base);
> +	}
> +
> +	proto_data->irq = platform_get_irq(pdev, 0);
> +	if (proto_data->irq < 0) {
> +		dev_err(&pdev->dev, "Failed to get the IRQ\n");
> +		return proto_data->irq;
> +	}
> +
> +	/* Perform a SW reset on this client's protocol state */
> +	writel(0x1, proto_data->base + IPCC_REG_CLIENT_CLEAR);
> +
> +	proto_data->irq_domain = irq_domain_add_tree(pdev->dev.of_node,
> +						     &qcom_ipcc_irq_ops,
> +						     proto_data);
> +	if (!proto_data->irq_domain) {
> +		dev_err(&pdev->dev, "Failed to add irq_domain\n");
> +		return -ENOMEM;
> +	}
> +
> +	ret = qcom_ipcc_setup_mbox(proto_data, pdev->dev.of_node);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to create mailbox\n");
> +		goto err_mbox;
> +	}
> +
> +	ret = devm_request_irq(&pdev->dev, proto_data->irq, qcom_ipcc_irq_fn,
> +			       IRQF_TRIGGER_HIGH, "ipcc", proto_data);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "Failed to register the irq: %d\n", ret);

Should the qcom_ipcc_setup_mbox() not be unroller here?

> +		goto err_mbox;
> +	}
> +
> +	enable_irq_wake(proto_data->irq);
> +	platform_set_drvdata(pdev, proto_data);
> +
> +	return 0;
> +
> +err_mbox:
> +	irq_domain_remove(proto_data->irq_domain);
> +
> +	return ret;
> +}
> +
> +static int qcom_ipcc_remove(struct platform_device *pdev)
> +{
> +	struct qcom_ipcc_proto_data *proto_data = platform_get_drvdata(pdev);
> +
> +	disable_irq_wake(proto_data->irq);
> +	irq_domain_remove(proto_data->irq_domain);

So you are calling this when your isr is active, we have possibility of
race here. This function come with a warning:
"The caller must ensure that all mappings within the domain have been disposed"

Has that been done?

-- 
~Vinod
