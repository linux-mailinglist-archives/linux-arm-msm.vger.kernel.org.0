Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29EED4A87E8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 16:47:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243438AbiBCPrF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 10:47:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240972AbiBCPrE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 10:47:04 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C311CC06173B
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 07:47:04 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id l12-20020a0568302b0c00b005a4856ff4ceso2875463otv.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 07:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8FrWpPu5qbqNeRR4utPcGWY/d5SeN3jaIZbvirN1ZeY=;
        b=hzflAUWbERV6Oz8blFR1GSVZRre0yUiQW8Iq1bcV0B3aGScfjNZzKTwT4u/6Clvce7
         AICroH8fFXBDplFdZ7sEwkKJD7xiWlWfZqAQQIbrJQkeburOWxiLVtzI8m4M57/VatPr
         MBq1UVghTsHttESmvfhMgO6q9NU00XTR87UmaBMF7P2NbLLIsqe4VfM6GXRWKinibVuX
         GkVNo7ov7PRes7SiH+E8bONY0I7gq0xeGxVH4qvZxPjnvk6mex8t+m6W/NdTnvUPx/db
         L6OHh7nFbHI/hliX+4MEk+86nRwsAvY22IDFXRyAQkfE8YChKioeqihCvG8rguIqi+PB
         Yuug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8FrWpPu5qbqNeRR4utPcGWY/d5SeN3jaIZbvirN1ZeY=;
        b=gunAIB0Z9AyJeUHQR9ENn8K8tS2ABzvLQXmcsUNKF3L9fx1C+83ry/V8e8qAzbym9p
         w0Q3kSSMqJEyTS0/2zd/sADewdwWC8Q9jJeSrLqywIkkxhGBCuBLUx2YJ8TXkLLhyt3k
         vyddJRNrjStYHE/AX+vQeYL9G40hmWq4YMDV4EzlgfDS5lC8UyHVsGgF3aieRwYXqtKL
         ki/ylWAcvQc6OPAgwdw8ErHCEpIKgeeqmRGlNrHEy57Aaz2rB74Z70s4n14Vs9jGhkEx
         XWPn2iSiLWChMjjpC9BlBcJgLZINz64Y1zcAnKoGGzGYiIvR1rYZtxt/dAtMMcJ6iqMd
         Kpug==
X-Gm-Message-State: AOAM530yQRNMrOgEaWA/DIkI/OkmnuL1UOEPjKIDwvt3D+Yit0st0ts6
        L60qgQ4lqwa0fxUvJgF+X9ha/g==
X-Google-Smtp-Source: ABdhPJyJi4QTZpyyU9/EKW4RaU+cJgbNbGo7KG2cOTmBJPYbC2MlQ4zyB4yEmiX7xC3Regx/MlnP0A==
X-Received: by 2002:a9d:2f25:: with SMTP id h34mr18912063otb.346.1643903223960;
        Thu, 03 Feb 2022 07:47:03 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id ay32sm13499901oob.16.2022.02.03.07.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 07:47:03 -0800 (PST)
Date:   Thu, 3 Feb 2022 07:47:20 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Wilczy??ski <kw@linux.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v5 2/5] PCI: qcom: Remove redundancy between qcom_pcie
 and qcom_pcie_cfg
Message-ID: <Yfv5CEex29bIX3D9@ripper>
References: <20211218141024.500952-1-dmitry.baryshkov@linaro.org>
 <20211218141024.500952-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211218141024.500952-3-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 18 Dec 06:10 PST 2021, Dmitry Baryshkov wrote:

> In preparation to adding more flags to configuration data, use pointer
> to struct qcom_pcie_cfg directly inside struct qcom_pcie, rather than
> duplicating all its fields. This would save us from the boilerplate code
> that just copies flag values from one struct to another one.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 31 +++++++++++---------------
>  1 file changed, 13 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 4e668da96ef4..1204011c96ee 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -200,8 +200,7 @@ struct qcom_pcie {
>  	union qcom_pcie_resources res;
>  	struct phy *phy;
>  	struct gpio_desc *reset;
> -	const struct qcom_pcie_ops *ops;
> -	unsigned int pipe_clk_need_muxing:1;
> +	const struct qcom_pcie_cfg *cfg;
>  };
>  
>  #define to_qcom_pcie(x)		dev_get_drvdata((x)->dev)
> @@ -225,8 +224,8 @@ static int qcom_pcie_start_link(struct dw_pcie *pci)
>  	struct qcom_pcie *pcie = to_qcom_pcie(pci);
>  
>  	/* Enable Link Training state machine */
> -	if (pcie->ops->ltssm_enable)
> -		pcie->ops->ltssm_enable(pcie);
> +	if (pcie->cfg->ops->ltssm_enable)
> +		pcie->cfg->ops->ltssm_enable(pcie);
>  
>  	return 0;
>  }
> @@ -1145,7 +1144,7 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
>  	if (ret < 0)
>  		return ret;
>  
> -	if (pcie->pipe_clk_need_muxing) {
> +	if (pcie->cfg->pipe_clk_need_muxing) {
>  		res->pipe_clk_src = devm_clk_get(dev, "pipe_mux");
>  		if (IS_ERR(res->pipe_clk_src))
>  			return PTR_ERR(res->pipe_clk_src);
> @@ -1180,7 +1179,7 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
>  	}
>  
>  	/* Set pipe clock as clock source for pcie_pipe_clk_src */
> -	if (pcie->pipe_clk_need_muxing)
> +	if (pcie->cfg->pipe_clk_need_muxing)
>  		clk_set_parent(res->pipe_clk_src, res->phy_pipe_clk);
>  
>  	ret = clk_bulk_prepare_enable(res->num_clks, res->clks);
> @@ -1243,7 +1242,7 @@ static void qcom_pcie_deinit_2_7_0(struct qcom_pcie *pcie)
>  	clk_bulk_disable_unprepare(res->num_clks, res->clks);
>  
>  	/* Set TCXO as clock source for pcie_pipe_clk_src */
> -	if (pcie->pipe_clk_need_muxing)
> +	if (pcie->cfg->pipe_clk_need_muxing)
>  		clk_set_parent(res->pipe_clk_src, res->ref_clk_src);
>  
>  	regulator_bulk_disable(ARRAY_SIZE(res->supplies), res->supplies);
> @@ -1336,7 +1335,7 @@ static int qcom_pcie_host_init(struct pcie_port *pp)
>  
>  	qcom_ep_reset_assert(pcie);
>  
> -	ret = pcie->ops->init(pcie);
> +	ret = pcie->cfg->ops->init(pcie);
>  	if (ret)
>  		return ret;
>  
> @@ -1346,8 +1345,8 @@ static int qcom_pcie_host_init(struct pcie_port *pp)
>  
>  	qcom_ep_reset_deassert(pcie);
>  
> -	if (pcie->ops->config_sid) {
> -		ret = pcie->ops->config_sid(pcie);
> +	if (pcie->cfg->ops->config_sid) {
> +		ret = pcie->cfg->ops->config_sid(pcie);
>  		if (ret)
>  			goto err;
>  	}
> @@ -1358,7 +1357,7 @@ static int qcom_pcie_host_init(struct pcie_port *pp)
>  	qcom_ep_reset_assert(pcie);
>  	phy_power_off(pcie->phy);
>  err_deinit:
> -	pcie->ops->deinit(pcie);
> +	pcie->cfg->ops->deinit(pcie);
>  
>  	return ret;
>  }
> @@ -1468,7 +1467,6 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>  	struct pcie_port *pp;
>  	struct dw_pcie *pci;
>  	struct qcom_pcie *pcie;
> -	const struct qcom_pcie_cfg *pcie_cfg;
>  	int ret;
>  
>  	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
> @@ -1485,15 +1483,12 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>  
>  	pcie->pci = pci;
>  
> -	pcie_cfg = of_device_get_match_data(dev);
> -	if (!pcie_cfg || !pcie_cfg->ops) {
> +	pcie->cfg = of_device_get_match_data(dev);
> +	if (!pcie->cfg || !pcie->cfg->ops) {
>  		dev_err(dev, "Invalid platform data\n");
>  		return -EINVAL;
>  	}
>  
> -	pcie->ops = pcie_cfg->ops;
> -	pcie->pipe_clk_need_muxing = pcie_cfg->pipe_clk_need_muxing;
> -
>  	pcie->reset = devm_gpiod_get_optional(dev, "perst", GPIOD_OUT_HIGH);
>  	if (IS_ERR(pcie->reset))
>  		return PTR_ERR(pcie->reset);
> @@ -1510,7 +1505,7 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>  	if (IS_ERR(pcie->phy))
>  		return PTR_ERR(pcie->phy);
>  
> -	ret = pcie->ops->get_resources(pcie);
> +	ret = pcie->cfg->ops->get_resources(pcie);
>  	if (ret)
>  		return ret;
>  
> -- 
> 2.34.1
> 
