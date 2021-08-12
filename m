Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 211893E9E4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 08:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234514AbhHLGLp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 02:11:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234462AbhHLGLp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 02:11:45 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2B0EC061765
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 23:11:20 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id s22-20020a17090a1c16b0290177caeba067so13632765pjs.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 23:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AdSDRXkannLfQW9+0wIXjK1QxuAWsJpVgDG3Y9dksOM=;
        b=MK0bUkHzlsqpZuBMSSMJyyUbqrQ3sIb7BgT/1F31Lb+2rQ7jyhtv8dB9eglRZM9plF
         t7LeA4VvdOQeFNqLn5oEfwqn9WJviyjvbcL6NvYlXdIs1HMncjx9zUDaEz42Zh+VRLjG
         G8G9B72uAblpN96sIUTKFn5o/gwieY2J3PCHpxXhBfvsmRHqn+/Njti+X4s0KqEmtVZg
         nI36EupIAzhJlgubCjNpYUU7anx2j33fGFGCyTSlupqzTDAy2RZH2/UtBOm2LTHuiw+N
         YB7Dhank+IkcoyerLoq8Hv40pTBaeGsZuWFOb/9dFB3TSXIac8spPxa1zLRrGyffioYo
         dPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AdSDRXkannLfQW9+0wIXjK1QxuAWsJpVgDG3Y9dksOM=;
        b=nbs6UVxAZJc3juWUfUm1WHj/01A1hgw1fLiNPuiFe/jrY0eLH2bC646M36nqHLz1C6
         gI0lXfMh2DSrw7sS2hE/svZ3+o13fLHn5N18dC49Ir7va8wvwNO8bcCu4/Qa0Jc42AXX
         fTsoSq3UAfpV6yaDKZMxLiqt0r6EE72eKYQL80DNdRfCMIMpmA/lMINbETyqTkj9oMVz
         LOErons9D3QDOPnV10+smj6KzZMPgVd9TaLUWUEont99ItexIHyxHQ++po9+BvEwFfxg
         r5eM3rtQUAeUv/20AsRuim9JFFCTBBN/yLbAHOa7uVtVaX3maUr/4+VSh5ng6gCtjYfZ
         9vSA==
X-Gm-Message-State: AOAM532fDfgnQLRJgghR1U+RpS6P3RXQ2dy70DXpY3pSdYUedD1NrvGt
        PrsxiBvBOhNhn3UF9Xn/4y2g
X-Google-Smtp-Source: ABdhPJy5JhJN83aBinU0qFRL1e2LUsjLDZAT+Hr46w4wWY1am3TdZlDfobGcs2BA1dWutkaTqiPUlA==
X-Received: by 2002:a65:68d1:: with SMTP id k17mr2463057pgt.285.1628748680227;
        Wed, 11 Aug 2021 23:11:20 -0700 (PDT)
Received: from thinkpad ([2409:4072:99a:700c:52f1:f031:1fc2:c301])
        by smtp.gmail.com with ESMTPSA id t1sm1941053pgr.65.2021.08.11.23.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 23:11:19 -0700 (PDT)
Date:   Thu, 12 Aug 2021 11:41:10 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Prasad Malisetty <pmaliset@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, bhelgaas@google.com,
        robh+dt@kernel.org, swboyd@chromium.org, lorenzo.pieralisi@arm.com,
        svarbanov@mm-sol.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        mka@chromium.org, vbadigan@codeaurora.org, sallenki@codeaurora.org
Subject: Re: [PATCH v5 4/4] PCI: qcom: Switch pcie_1_pipe_clk_src after PHY
 init in SC7280
Message-ID: <20210812061110.GB72145@thinkpad>
References: <1628568516-24155-1-git-send-email-pmaliset@codeaurora.org>
 <1628568516-24155-5-git-send-email-pmaliset@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1628568516-24155-5-git-send-email-pmaliset@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 10, 2021 at 09:38:36AM +0530, Prasad Malisetty wrote:
> On the SC7280, By default the clock source for pcie_1_pipe is
> TCXO for gdsc enable. But after the PHY is initialized, the clock
> source must be switched to gcc_pcie_1_pipe_clk from TCXO.
> 
> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 8a7a300..39e3b21 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -166,6 +166,8 @@ struct qcom_pcie_resources_2_7_0 {
>  	struct regulator_bulk_data supplies[2];
>  	struct reset_control *pci_reset;
>  	struct clk *pipe_clk;
> +	struct clk *gcc_pcie_1_pipe_clk_src;
> +	struct clk *phy_pipe_clk;
>  };
>  
>  union qcom_pcie_resources {
> @@ -1167,6 +1169,16 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
>  	if (ret < 0)
>  		return ret;
>  
> +	if (of_device_is_compatible(dev->of_node, "qcom,pcie-sc7280")) {
> +		res->gcc_pcie_1_pipe_clk_src = devm_clk_get(dev, "pipe_mux");
> +		if (IS_ERR(res->gcc_pcie_1_pipe_clk_src))
> +			return PTR_ERR(res->gcc_pcie_1_pipe_clk_src);
> +
> +		res->phy_pipe_clk = devm_clk_get(dev, "phy_pipe");
> +		if (IS_ERR(res->phy_pipe_clk))
> +			return PTR_ERR(res->phy_pipe_clk);
> +	}
> +
>  	res->pipe_clk = devm_clk_get(dev, "pipe");
>  	return PTR_ERR_OR_ZERO(res->pipe_clk);
>  }
> @@ -1255,6 +1267,12 @@ static void qcom_pcie_deinit_2_7_0(struct qcom_pcie *pcie)
>  static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
>  {
>  	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
> +	struct dw_pcie *pci = pcie->pci;
> +	struct device *dev = pci->dev;
> +	struct device_node *node = dev->of_node;
> +
> +	if (of_property_read_bool(node, "pipe-clk-source-switch"))

Wondering why you didn't use the compatible here as well. This will break if the
property exist but the clocks are not.

Thanks,
Mani

> +		clk_set_parent(res->gcc_pcie_1_pipe_clk_src, res->phy_pipe_clk);
>  
>  	return clk_prepare_enable(res->pipe_clk);
>  }
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
