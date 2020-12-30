Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A269D2E78A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Dec 2020 13:47:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbgL3Mpi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Dec 2020 07:45:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726719AbgL3Mpg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Dec 2020 07:45:36 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CF76C06179B
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Dec 2020 04:44:56 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id j13so3636806pjz.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Dec 2020 04:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/ISTjFMhfSxDFt0cwrxQ4AloSsyunPNsl39zSp8O+sk=;
        b=te03WToXPUMKh9V8YzBrXLGKIXRFreOYwnv93mPhoZ2P5R3RB8rbmztrFjZTRRvqW8
         DSwZFv2dglM9EcacmmAHq4GsyAK1ZhcLnrHJ21H8Ya7ezrPxrI5dN2XzvDpn0nIt0o6W
         H5AV8q1N/9NGHCKmeZXuPMYHeND3Ylh3ZT5DqummSUoQr8yRx7CayWDvy2QBD0qzdcf2
         YwsSS2dwxtgubqZhEOTEMocM51WN/oALjhDALnp3r6MLO0tc4XOmWOMLK06t0GgTeC2t
         ifKK3V2LMEP1vq/77J6ZQOQmwSJeeH6oV3J34Y9EGH7nbMbtboACX05S/UTeArQzVrwI
         lZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/ISTjFMhfSxDFt0cwrxQ4AloSsyunPNsl39zSp8O+sk=;
        b=jZz+eA/luxf1wAbPZhR7VZ3X/8jA5qu2bj3h1gbtMBxbgIP6nWN56ZmsQefyAwFUXL
         6WUcgD3uZULqDoTa5clnFutb4DLaas9FROrClL3teyCKUL1r2t0sH9yPnSXWtw0dfRZY
         v8wr3olMTaKqMpZkr1z+H07GOT0SGIHkuapV4FMWJrz+s1XSAScZ9B0c1yP4O06jreYi
         Mhy8DG9suOt/wdW1WLJR+KECuPeM6NuYRvmW+hBCB7DZi0mWtElelmPIaSwAxA4yDAn8
         F0Z4jrZpjJ+vlXJwchx/8t8AbwulYz1GigMuew9iv+SeqQf0jOts5pbLK+YJpvH5xKR6
         ePSA==
X-Gm-Message-State: AOAM531xrulbs5UMAYWD3QMn3cUpbMDxFYmMeb27eHA0A7rueTYkN2uk
        kzRotpySrd2O/3vOksM6eQ5P
X-Google-Smtp-Source: ABdhPJyElseUpoqOep9CscN1SHKSdY6De03j7XVMODm9juE98C0jFdSL6Mi+b5630QHfEtqR6+rDxQ==
X-Received: by 2002:a17:90b:697:: with SMTP id m23mr8464424pjz.35.1609332295861;
        Wed, 30 Dec 2020 04:44:55 -0800 (PST)
Received: from thinkpad ([2409:4072:6013:d529:8c5c:9ef7:2471:6df4])
        by smtp.gmail.com with ESMTPSA id 8sm27341034pfz.93.2020.12.30.04.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 04:44:55 -0800 (PST)
Date:   Wed, 30 Dec 2020 18:14:48 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 2/2] PCI: qcom: add support for ddrss_sf_tbu clock
Message-ID: <20201230124448.GB5679@thinkpad>
References: <20201230115408.492565-1-dmitry.baryshkov@linaro.org>
 <20201230115408.492565-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201230115408.492565-3-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 30, 2020 at 02:54:08PM +0300, Dmitry Baryshkov wrote:
> On SM8250 additional clock is required for PCIe devices to access NOC.
> Update PCIe controller driver to control this clock.
> 

If it is really required then why make it optional?

Thanks,
Mani

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: e1dd639e374a ("PCI: qcom: Add SM8250 SoC support")
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index affa2713bf80..658d007a764c 100644
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
> @@ -1153,10 +1154,15 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
>  	res->clks[4].id = "slave_q2a";
>  	res->clks[5].id = "tbu";
>  
> -	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(res->clks), res->clks);
> +	ret = devm_clk_bulk_get(dev, QCOM_PCIE_2_7_0_MAX_CLOCKS, res->clks);
>  	if (ret < 0)
>  		return ret;
>  
> +	/* Optional clock for SM8250 */
> +	res->clks[6].clk = devm_clk_get_optional(dev, "ddrss_sf_tbu");
> +	if (IS_ERR(res->clks[6].clk))
> +		return PTR_ERR(res->clks[6].clk);
> +
>  	res->pipe_clk = devm_clk_get(dev, "pipe");
>  	return PTR_ERR_OR_ZERO(res->pipe_clk);
>  }
> -- 
> 2.29.2
> 
