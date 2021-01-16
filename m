Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E23EB2F8DD2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Jan 2021 18:12:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728149AbhAPRKR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Jan 2021 12:10:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728079AbhAPRKQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Jan 2021 12:10:16 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81E56C061363
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jan 2021 08:26:54 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id 15so8106741pgx.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jan 2021 08:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HGassjs4YfIo0gswfD27WZAICbwIB2v8UR8Uah7tKc4=;
        b=VSE1tuN9o8hWnE1GXKyRrvp0Cg+H79pS8+o0RZ0vkQ+fJridL/3HMBildacNgaJmAS
         yOgo+Bgj0MxK1bGrqL3qMEzhr5Xtk/xXsghTh79khm7y6rFDScPAFTLNGSlBV1Lq4Kt5
         rQhPu+joeq4k3V0eSofGCkcYo+SrwKKADjUwxsqTyw9/7u3A3UYE1NEOBFLKAGisagq6
         mVBxpCcHP8z5v6nXFbfoZNRZHXxSehE89AQg1LZbuIDPIZJhSKjjXlV1ijbIlsuZClK/
         sE5ej8xkg+UMruO2qLJ5LFQp7+Qq4rqgQVVFJiEFOQ9/LgXmYrvvhc/9WTEriIr1JRlF
         LtHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HGassjs4YfIo0gswfD27WZAICbwIB2v8UR8Uah7tKc4=;
        b=GoYcjJaZMGlV4Ct66sOEmTabuvf53M9iFD19EwZbxbiIfwdKaTwbSWV46Y21njn7n3
         3LX9j6Gla5qnjYFJeA/6Y2O0AxB61ngmw8UShyDI6G8hgg9qGVKjlCWuC0OGARbugCSd
         clFAFCVB6YroHkgNBPHyH+c8BxDVyrmMdOdCRddXvRZLtDyCwnJKOlpI/wMtEXO+LQPN
         fjUyTjmWvDwQXJeIST5RVeuG3zF3QZUfuFeR8B5l6oRHvT7nd804Aix1ATlTqqP6R/p6
         NRmfIxHcWa0pyaB56Zh8ZjXwcIJjoegPCKh3jjc3naQ/C+ZLLPkS0IqRy1NbtM2VnoxT
         QyuA==
X-Gm-Message-State: AOAM533AEHp3qXn39IkzdbT85LV1uvbBbgsP4ElMOELAwfagSesN+3o9
        AQqv+Ujcqwy5qfoxcn2SL5uZ
X-Google-Smtp-Source: ABdhPJxdRPVC2uPqbiQmSrw3v0UMWKRr/1WKaxyerjsZ6AfF2/ot1WrpOUiGtFtL6pYsITpPNVX2lQ==
X-Received: by 2002:a63:db54:: with SMTP id x20mr18119098pgi.200.1610814412372;
        Sat, 16 Jan 2021 08:26:52 -0800 (PST)
Received: from thinkpad ([2409:4072:608b:8490:791f:4eb5:4fa4:c241])
        by smtp.gmail.com with ESMTPSA id y21sm12612347pfr.90.2021.01.16.08.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jan 2021 08:26:50 -0800 (PST)
Date:   Sat, 16 Jan 2021 21:56:46 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v4 2/2] PCI: qcom: add support for ddrss_sf_tbu clock
Message-ID: <20210116162646.GA7011@thinkpad>
References: <20210113154935.3972869-1-dmitry.baryshkov@linaro.org>
 <20210113154935.3972869-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113154935.3972869-3-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 13, 2021 at 06:49:35PM +0300, Dmitry Baryshkov wrote:
> On SM8250 additional clock is required for PCIe devices to access NOC.
> Update PCIe controller driver to control this clock.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: e1dd639e374a ("PCI: qcom: Add SM8250 SoC support")

Just couple of comments below, with that addressed:

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index affa2713bf80..e2140aba220a 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -159,8 +159,10 @@ struct qcom_pcie_resources_2_3_3 {
>  	struct reset_control *rst[7];
>  };
>  
> +#define QCOM_PCIE_2_7_0_MAX_CLOCKS	7
>  struct qcom_pcie_resources_2_7_0 {
> -	struct clk_bulk_data clks[6];
> +	struct clk_bulk_data clks[QCOM_PCIE_2_7_0_MAX_CLOCKS];

Just use 7 directly and mention in comment that SM8250 needs an extra clock.

> +	int num_clks;
>  	struct regulator_bulk_data supplies[2];
>  	struct reset_control *pci_reset;
>  	struct clk *pipe_clk;
> @@ -1133,6 +1135,7 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
>  	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
>  	struct dw_pcie *pci = pcie->pci;
>  	struct device *dev = pci->dev;
> +	bool has_sf_tbu = of_device_is_compatible(dev->of_node, "qcom,pcie-sm8250");
>  	int ret;
>  
>  	res->pci_reset = devm_reset_control_get_exclusive(dev, "pci");
> @@ -1152,8 +1155,14 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
>  	res->clks[3].id = "bus_slave";
>  	res->clks[4].id = "slave_q2a";
>  	res->clks[5].id = "tbu";
> +	if (has_sf_tbu) {

Here also you can use the of_device_is_compatible() call directly and avoid a
local variable.

Thanks,
Mani

> +		res->clks[6].id = "ddrss_sf_tbu";
> +		res->num_clks = 7;
> +	} else {
> +		res->num_clks = 6;
> +	}
>  
> -	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(res->clks), res->clks);
> +	ret = devm_clk_bulk_get(dev, res->num_clks, res->clks);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -1175,7 +1184,7 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
>  		return ret;
>  	}
>  
> -	ret = clk_bulk_prepare_enable(ARRAY_SIZE(res->clks), res->clks);
> +	ret = clk_bulk_prepare_enable(res->num_clks, res->clks);
>  	if (ret < 0)
>  		goto err_disable_regulators;
>  
> @@ -1227,7 +1236,7 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
>  
>  	return 0;
>  err_disable_clocks:
> -	clk_bulk_disable_unprepare(ARRAY_SIZE(res->clks), res->clks);
> +	clk_bulk_disable_unprepare(res->num_clks, res->clks);
>  err_disable_regulators:
>  	regulator_bulk_disable(ARRAY_SIZE(res->supplies), res->supplies);
>  
> @@ -1238,7 +1247,7 @@ static void qcom_pcie_deinit_2_7_0(struct qcom_pcie *pcie)
>  {
>  	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
>  
> -	clk_bulk_disable_unprepare(ARRAY_SIZE(res->clks), res->clks);
> +	clk_bulk_disable_unprepare(res->num_clks, res->clks);
>  	regulator_bulk_disable(ARRAY_SIZE(res->supplies), res->supplies);
>  }
>  
> -- 
> 2.29.2
> 
