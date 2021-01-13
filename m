Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94C052F4C3A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 14:29:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbhAMN3b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 08:29:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbhAMN3b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 08:29:31 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE729C061795
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jan 2021 05:28:50 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id p12so1148344pju.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jan 2021 05:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1a26J2pt0woeVx4bIfaN5UtsEdi1kQh8hJAuYj0/z/U=;
        b=ad2oVk5EYIuGQzPPirooQkGjTnsDflsbm42q9qsnD1m2XFsnj7iafnfXSSHGxDo9pR
         DzhFdrw+ruDwouNXr1QUS7EtbBbs1jZRdfsXFCzRtuJtOQ3xnPymTg9Rq9lACbTSnIP/
         xNKlWqKmFNYRhNcPJLVFSRL6wAdQNvAL/C/eeJJUtqYKqju10SoHjurmhBtYydnRyAma
         XnX08R8zyhNSV2SkFgSlLlj+fM8dAVB95gcxXNPom5TfFWMRScC78uX1jWXy3OVX8O3D
         SqA6GxVZw1Iq7fFlLlVl/WQSUUbnlzm4U9vg95zv7PvG7ejg3vb44pc94q65rLQzeWJg
         vgyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1a26J2pt0woeVx4bIfaN5UtsEdi1kQh8hJAuYj0/z/U=;
        b=dgmqCCLelrBpHMTGUoY1LypljYJNL+WcJV/SD4GSfVNibRGJ5IexsC89NjmtZFkA+m
         2WJoL6a7N9n+bexH9wd8JnvePNZ2BLjjzvLGEiEJuUbo01l2OsrlVFTwQMwT0RuEdp+I
         wu1JfWajTYkjLbIQ+wknwLbczRyyDfTOUwBE+p0/v0Mn1JuRCoekUKHsrpgESzcnBm8G
         NQSHVhcn0Qspt5VCQuSKVGQVemGsEEVvYhFY1VE0e9N0g+Ly2DAHf7PvFdZB8o/eM2Pm
         /NfFhYgp+3NlsLLQkUI/Pvy/4vcBfc3a7hWLtzTsft7s/6GlC1btEJlW4sD1j65nMBwi
         1WSQ==
X-Gm-Message-State: AOAM532AqE810XoHcCzSZcPLqpwySEdWdjjAJTE9USsGEebLn0sl09A/
        P53eRiOmtOuuhHugCwNbgmta
X-Google-Smtp-Source: ABdhPJzYySj3ufSCsLDTJxJdxrp558QO6CVU179s4Ht2qUU8ppPfDZITVYbkJfW8uLtrNZEYTpKjSg==
X-Received: by 2002:a17:90a:b296:: with SMTP id c22mr2434205pjr.91.1610544530222;
        Wed, 13 Jan 2021 05:28:50 -0800 (PST)
Received: from work ([103.77.37.157])
        by smtp.gmail.com with ESMTPSA id 92sm3105554pjv.15.2021.01.13.05.28.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jan 2021 05:28:49 -0800 (PST)
Date:   Wed, 13 Jan 2021 18:58:45 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v3 2/2] PCI: qcom: add support for ddrss_sf_tbu clock
Message-ID: <20210113132845.GA30246@work>
References: <20201231123731.651908-1-dmitry.baryshkov@linaro.org>
 <20201231123731.651908-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201231123731.651908-3-dmitry.baryshkov@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

On Thu, Dec 31, 2020 at 03:37:31PM +0300, Dmitry Baryshkov wrote:
> On SM8250 additional clock is required for PCIe devices to access NOC.
> Update PCIe controller driver to control this clock.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: e1dd639e374a ("PCI: qcom: Add SM8250 SoC support")
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index affa2713bf80..84c5a0a897dd 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -159,8 +159,9 @@ struct qcom_pcie_resources_2_3_3 {
>  	struct reset_control *rst[7];
>  };
>  
> +#define QCOM_PCIE_2_7_0_MAX_CLOCKS	6
>  struct qcom_pcie_resources_2_7_0 {
> -	struct clk_bulk_data clks[6];
> +	struct clk_bulk_data clks[QCOM_PCIE_2_7_0_MAX_CLOCKS + 1]; /* + 1 for sf_tbu */
>  	struct regulator_bulk_data supplies[2];
>  	struct reset_control *pci_reset;
>  	struct clk *pipe_clk;
> @@ -1153,7 +1154,7 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
>  	res->clks[4].id = "slave_q2a";
>  	res->clks[5].id = "tbu";
>  
> -	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(res->clks), res->clks);
> +	ret = devm_clk_bulk_get(dev, QCOM_PCIE_2_7_0_MAX_CLOCKS, res->clks);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -1161,6 +1162,22 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
>  	return PTR_ERR_OR_ZERO(res->pipe_clk);
>  }
>  
> +static int qcom_pcie_get_resources_1_9_0(struct qcom_pcie *pcie)
> +{
> +	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
> +	struct dw_pcie *pci = pcie->pci;
> +	struct device *dev = pci->dev;
> +	int ret;
> +
> +	ret = qcom_pcie_get_resources_2_7_0(pcie);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Required clock for SM8250 */

Since you are using a dedicated ops for getting the resources, why can't
you use a dedicated resource struct as "qcom_pcie_resources_1_9_0" and
just use the total no of clocks as 7?

Also as I mentioned in previous iteration, the "sf_tbu" clock is not
optional.

Thanks,
Mani

> +	res->clks[6].clk = devm_clk_get_optional(dev, "ddrss_sf_tbu");
> +	return PTR_ERR_OR_ZERO(res->clks[6].clk);
> +}
> +
>  static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
>  {
>  	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
> @@ -1437,7 +1454,7 @@ static const struct qcom_pcie_ops ops_2_7_0 = {
>  
>  /* Qcom IP rev.: 1.9.0 */
>  static const struct qcom_pcie_ops ops_1_9_0 = {
> -	.get_resources = qcom_pcie_get_resources_2_7_0,
> +	.get_resources = qcom_pcie_get_resources_1_9_0,
>  	.init = qcom_pcie_init_2_7_0,
>  	.deinit = qcom_pcie_deinit_2_7_0,
>  	.ltssm_enable = qcom_pcie_2_3_2_ltssm_enable,
> -- 
> 2.29.2
> 
