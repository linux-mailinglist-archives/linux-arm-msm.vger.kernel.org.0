Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDD3B1BF07F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 08:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbgD3Gq3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 02:46:29 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:62729 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726449AbgD3Gq2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 02:46:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588229160; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=+9Cpn/ZecQ165+BryqoLCY0vh0xahyK2iWdM0lDGV5U=;
 b=VlyyaPDnjjAeszNsEodcw2RBtTqKsZWmG7Nz9Bk9OwmQr7am7lc/4D1JN2Bae8PjKVlqsuKH
 XlzLezJwXW4gXjCF+E4TPCSWJoCtnfKGEYLIJlXbCcLnnPihoGIC0SGUYxxzmd+QEivVSpUi
 cWZEwmQIJkrf0paNxfXwmGHdlb0=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eaa7408.7f82d1152420-smtp-out-n05;
 Thu, 30 Apr 2020 06:45:28 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 449CCC433BA; Thu, 30 Apr 2020 06:45:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rananta)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D0BA6C433D2;
        Thu, 30 Apr 2020 06:45:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 29 Apr 2020 23:45:27 -0700
From:   rananta@codeaurora.org
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Subject: Re: [PATCH 2/2] soc: qcom: ipcc: Add support for IPCC controller
In-Reply-To: <20200430063054.18879-2-manivannan.sadhasivam@linaro.org>
References: <20200430063054.18879-1-manivannan.sadhasivam@linaro.org>
 <20200430063054.18879-2-manivannan.sadhasivam@linaro.org>
Message-ID: <93afcf6810308580a299905da2b8dad0@codeaurora.org>
X-Sender: rananta@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-04-29 23:30, Manivannan Sadhasivam wrote:
> +static int qcom_ipcc_probe(struct platform_device *pdev)
> +{
> +	struct qcom_ipcc_proto_data *proto_data;
> +	int ret;
> +
> +	proto_data = devm_kzalloc(&pdev->dev, sizeof(*proto_data), 
> GFP_KERNEL);
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
We can skip doing a SW reset here. Few of the subsystems may be brought 
out of reset via the bootloader and the interrupts from them might be 
pending. Doing a SW reset here would clear those interrupts.

Thank you.
Raghavendra
