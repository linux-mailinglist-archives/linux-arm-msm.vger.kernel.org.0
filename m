Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A7FD40BDD6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Sep 2021 04:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233661AbhIOCod (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 22:44:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbhIOCod (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 22:44:33 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E86BC061764
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 19:43:15 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id m7-20020a9d4c87000000b0051875f56b95so1561492otf.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 19:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tNmrdyHBY85C8s/wAkstNSGLnQN601xfdUuYWcdHIhM=;
        b=DyMA4+7gLmsdBiTiE0z9HP894JM1HrHZrdGfm3HvfqosJWPO89OisfkTvwffxdVD6+
         Zad5B7YYUkt8+/hNW9EXpFKgwT+bd77rOrTRRXOdGhgPoGBw7BS2SJglDR6DDug7KvGJ
         z8LxKhmiGBKL/mu6bzYMBRKfMNx48hSELzrlKtvC6fgwmXOCGmcjEACaFiMbCTSjJDTy
         Rgs3rVLU/nYyNJaqm3dCftRXoot1Jelt/pv4oeYCzG4+2SjMp2Z6iBnhGnOHs3VrKET2
         R4mquCLlG9tmKP31w3yI8W850NBt+XZS3JWCxT8+VH6y1gEqxZfTaICEBUe4GoLIeATn
         hijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tNmrdyHBY85C8s/wAkstNSGLnQN601xfdUuYWcdHIhM=;
        b=U+UZpoyAPcV69y34iOu4Dh0m//dKr/PTltLVY8dN//LpOs/5sqNy6R6CyQU+dQdKwQ
         v7DWFDlvRvonQIwuMPrXdsUAyXuOE7VEyMgnb0NQ9AIL4Z1O3Bgv7lU42nrcatHACeuL
         VAVbO4+IBjKWpEFCXFsdRgsL/m1leLU74/IzJt2wJWeWUv+BuXeBemkXtd5eW5505uKo
         YI+5kCj+2QkDNGNvxooGvzKjfGfkiH4qgGx5HDsb6HLnuIDGff9KkO0ZATM/gJ4G2opi
         VjMjmyr4lSeC8e/vUSrdY1zkgd3XGn6Ouhp7cFsm9CPf3e4xgGGEYdio/+N/1jsy7rLf
         ZX6A==
X-Gm-Message-State: AOAM533ayhWHR1QDJjJErS5CPpWAyNypRUAnlxuIJRAb36wCx+ZC5vf8
        7LMJa2xK9mo2Nz8PE9SyI8eT8Q==
X-Google-Smtp-Source: ABdhPJzqQ3HdgDW2xWQDpyRLSFxaJF9zE9RR3EeLl1fWD+gRi6WH63pb7blLdz/zkO1cINCweaI8GQ==
X-Received: by 2002:a05:6830:10c8:: with SMTP id z8mr17165664oto.175.1631673794569;
        Tue, 14 Sep 2021 19:43:14 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s14sm2651965oiw.8.2021.09.14.19.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 19:43:14 -0700 (PDT)
Date:   Tue, 14 Sep 2021 19:44:05 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Prasad Malisetty <pmaliset@codeaurora.org>
Cc:     agross@kernel.org, bhelgaas@google.com, robh+dt@kernel.org,
        swboyd@chromium.org, lorenzo.pieralisi@arm.com,
        svarbanov@mm-sol.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        mka@chromium.org, vbadigan@codeaurora.org, sallenki@codeaurora.org,
        manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH v7 4/4] PCI: qcom: Switch pcie_1_pipe_clk_src after PHY
 init in SC7280
Message-ID: <YUFd9aTlTJ45b9Gg@ripper>
References: <1631643550-29960-1-git-send-email-pmaliset@codeaurora.org>
 <1631643550-29960-5-git-send-email-pmaliset@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1631643550-29960-5-git-send-email-pmaliset@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 14 Sep 11:19 PDT 2021, Prasad Malisetty wrote:

> On the SC7280, the clock source for gcc_pcie_1_pipe_clk_src
> must be the TCXO while gdsc is enabled. After PHY init successful
> clock source should switch to pipe clock for gcc_pcie_1_pipe_clk_src.
> 
> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 90 +++++++++++++++++++++++++++++-----
>  1 file changed, 79 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 8a7a300..380c962 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -166,6 +166,9 @@ struct qcom_pcie_resources_2_7_0 {
>  	struct regulator_bulk_data supplies[2];
>  	struct reset_control *pci_reset;
>  	struct clk *pipe_clk;
> +	struct clk *gcc_pcie_1_pipe_clk_src;

Afaict you have both 2 PCIe controllers on sc7280, so I think it seems
more reasonable to shorted this to "pipe_clk_src".

> +	struct clk *phy_pipe_clk;
> +	struct clk *ref_clk_src;
>  };
>  
>  union qcom_pcie_resources {
> @@ -189,6 +192,11 @@ struct qcom_pcie_ops {
>  	int (*config_sid)(struct qcom_pcie *pcie);
>  };
>  
> +struct qcom_pcie_cfg {
> +	const struct qcom_pcie_ops *ops;
> +	bool pcie_1_pipe_clk_src_switch;

Perhaps something little bit more generic, like pipe_clk_need_muxing?

> +};
> +
>  struct qcom_pcie {
>  	struct dw_pcie *pci;
>  	void __iomem *parf;			/* DT parf */
> @@ -197,6 +205,7 @@ struct qcom_pcie {
>  	struct phy *phy;
>  	struct gpio_desc *reset;
>  	const struct qcom_pcie_ops *ops;
> +	bool pcie_1_pipe_clk_src_switch;
>  };
>  
>  #define to_qcom_pcie(x)		dev_get_drvdata((x)->dev)
> @@ -1167,6 +1176,20 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
>  	if (ret < 0)
>  		return ret;
>  
> +	if (pcie->pcie_1_pipe_clk_src_switch) {

This looks much better, now it will easily scale to other platforms that
have inherited this need.

> +		res->gcc_pcie_1_pipe_clk_src = devm_clk_get(dev, "pipe_mux");
> +		if (IS_ERR(res->gcc_pcie_1_pipe_clk_src))
> +			return PTR_ERR(res->gcc_pcie_1_pipe_clk_src);
> +
> +		res->phy_pipe_clk = devm_clk_get(dev, "phy_pipe");
> +		if (IS_ERR(res->phy_pipe_clk))
> +			return PTR_ERR(res->phy_pipe_clk);
> +
> +		res->ref_clk_src = devm_clk_get(dev, "ref");
> +		if (IS_ERR(res->ref_clk_src))
> +			return PTR_ERR(res->ref_clk_src);
> +	}
> +
>  	res->pipe_clk = devm_clk_get(dev, "pipe");
>  	return PTR_ERR_OR_ZERO(res->pipe_clk);
>  }
> @@ -1185,6 +1208,10 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
>  		return ret;
>  	}
>  
> +	/* Set TCXO as clock source for gcc_pcie_1_pipe_clk_src */
> +	if (pcie->pcie_1_pipe_clk_src_switch)
> +		clk_set_parent(res->gcc_pcie_1_pipe_clk_src, res->ref_clk_src);
> +
>  	ret = clk_bulk_prepare_enable(res->num_clks, res->clks);
>  	if (ret < 0)
>  		goto err_disable_regulators;
> @@ -1256,6 +1283,10 @@ static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
>  {
>  	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
>  
> +	/* Set pipe clock as clock source for gcc_pcie_1_pipe_clk_src */
> +	if (pcie->pcie_1_pipe_clk_src_switch)
> +		clk_set_parent(res->gcc_pcie_1_pipe_clk_src, res->phy_pipe_clk);
> +
>  	return clk_prepare_enable(res->pipe_clk);
>  }
>  
> @@ -1456,6 +1487,39 @@ static const struct qcom_pcie_ops ops_1_9_0 = {
>  	.config_sid = qcom_pcie_config_sid_sm8250,
>  };
>  
> +static const struct qcom_pcie_cfg apq8084_cfg = {
> +	.ops = &ops_1_0_0,
> +};
> +
> +static const struct qcom_pcie_cfg ipq8064_cfg = {
> +	.ops = &ops_2_1_0,
> +};
> +
> +static const struct qcom_pcie_cfg msm8996_cfg = {
> +	.ops = &ops_2_3_2,
> +};
> +
> +static const struct qcom_pcie_cfg ipq8074_cfg = {
> +	.ops = &ops_2_3_3,
> +};
> +
> +static const struct qcom_pcie_cfg ipq4019_cfg = {
> +	.ops = &ops_2_4_0,
> +};
> +
> +static const struct qcom_pcie_cfg sdm845_cfg = {
> +	.ops = &ops_2_7_0,
> +};
> +
> +static const struct qcom_pcie_cfg sm8250_cfg = {
> +	.ops = &ops_1_9_0,
> +};
> +
> +static const struct qcom_pcie_cfg sc7280_cfg = {
> +	.ops = &ops_1_9_0,
> +	.pcie_1_pipe_clk_src_switch = true,
> +};
> +
>  static const struct dw_pcie_ops dw_pcie_ops = {
>  	.link_up = qcom_pcie_link_up,
>  	.start_link = qcom_pcie_start_link,
> @@ -1467,6 +1531,7 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>  	struct pcie_port *pp;
>  	struct dw_pcie *pci;
>  	struct qcom_pcie *pcie;
> +	const struct qcom_pcie_cfg *pcie_cfg = NULL;

First use of this variable is an assignment, so I don't see a need for
zero initialize it.

Regards,
Bjorn

>  	int ret;
>  
>  	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
> @@ -1488,7 +1553,9 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>  
>  	pcie->pci = pci;
>  
> -	pcie->ops = of_device_get_match_data(dev);
> +	pcie_cfg = of_device_get_match_data(dev);
> +	pcie->ops = pcie_cfg->ops;
> +	pcie->pcie_1_pipe_clk_src_switch = pcie_cfg->pcie_1_pipe_clk_src_switch;
>  
>  	pcie->reset = devm_gpiod_get_optional(dev, "perst", GPIOD_OUT_HIGH);
>  	if (IS_ERR(pcie->reset)) {
> @@ -1545,16 +1612,17 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id qcom_pcie_match[] = {
> -	{ .compatible = "qcom,pcie-apq8084", .data = &ops_1_0_0 },
> -	{ .compatible = "qcom,pcie-ipq8064", .data = &ops_2_1_0 },
> -	{ .compatible = "qcom,pcie-ipq8064-v2", .data = &ops_2_1_0 },
> -	{ .compatible = "qcom,pcie-apq8064", .data = &ops_2_1_0 },
> -	{ .compatible = "qcom,pcie-msm8996", .data = &ops_2_3_2 },
> -	{ .compatible = "qcom,pcie-ipq8074", .data = &ops_2_3_3 },
> -	{ .compatible = "qcom,pcie-ipq4019", .data = &ops_2_4_0 },
> -	{ .compatible = "qcom,pcie-qcs404", .data = &ops_2_4_0 },
> -	{ .compatible = "qcom,pcie-sdm845", .data = &ops_2_7_0 },
> -	{ .compatible = "qcom,pcie-sm8250", .data = &ops_1_9_0 },
> +	{ .compatible = "qcom,pcie-apq8084", .data = &apq8084_cfg },
> +	{ .compatible = "qcom,pcie-ipq8064", .data = &ipq8064_cfg },
> +	{ .compatible = "qcom,pcie-ipq8064-v2", .data = &ipq8064_cfg },
> +	{ .compatible = "qcom,pcie-apq8064", .data = &ipq8064_cfg },
> +	{ .compatible = "qcom,pcie-msm8996", .data = &msm8996_cfg },
> +	{ .compatible = "qcom,pcie-ipq8074", .data = &ipq8074_cfg },
> +	{ .compatible = "qcom,pcie-ipq4019", .data = &ipq4019_cfg },
> +	{ .compatible = "qcom,pcie-qcs404", .data = &ipq4019_cfg },
> +	{ .compatible = "qcom,pcie-sdm845", .data = &sdm845_cfg },
> +	{ .compatible = "qcom,pcie-sm8250", .data = &sm8250_cfg },
> +	{ .compatible = "qcom,pcie-sc7280", .data = &sc7280_cfg },
>  	{ }
>  };
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
