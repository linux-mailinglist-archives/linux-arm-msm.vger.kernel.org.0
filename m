Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53A5F46FFB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Dec 2021 12:22:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240267AbhLJL0X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Dec 2021 06:26:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240207AbhLJL0X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Dec 2021 06:26:23 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D3AFC0617A1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Dec 2021 03:22:48 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id n8so6074550plf.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Dec 2021 03:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Qxg6DxirLaC6DUB7IKjqDUJ0ykin6MxQpFRl97W03Dg=;
        b=gi1PGJ0nA5fY2Qybv9z8wfe7bPMKNji2xRTQfRmiL41kKq1vD0m5PpNFc02jRTGqax
         ozOfu5f638E2y0uKhr8AMCx2jPtBKM2SWktddZ3uPrZjaPAtYEl0S1nyvoNB4vPeXgC5
         ciaWGIqPoWbUe01Smx6FnCkTzkcBoDNDlcpzUP7US14ArN27IlsZoZdEK0LoVf3VU5KM
         itg+InpSZtmk8eXILQmxLv4vLIIKObUi25Ti2ZTmDduQOG6TUwzi4BCxecvbsxSbD1Qw
         IQGG+XvyXLki/USm/yj/reh22qsUxXuZN/iCO7TMCDiv3wbZJjor47ZEgor92h1n3jUW
         zMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Qxg6DxirLaC6DUB7IKjqDUJ0ykin6MxQpFRl97W03Dg=;
        b=IUbu6cNXgIjp/fIROFyOrEUtJg/a+JD9wkZjUM9MCwbOgFbx6o0vXSx1y/QTzpC+8q
         BVYxzlGRZfyynQ9Odcu5COwzUNIrN4Nj05dvjsFxdYxyuhRXJrVqGddBHurOtXMaoZcx
         NWmERwLQf6oTAKe1QWvR0+FBd8lVnO7VIgqAhO2J6go7sGflHo+FDTJaQHcYQs2eWlQT
         UC6t1IufPpQaqTBsuR2KnLZenHrLj+bJ0uu8aXK52yQ7QoGrC7Isi0pezSWIPoYhbCpj
         JkHkCoLq3befxkSHLYBBC1yX2X5ConICrW6q3vXPHllqhdVPaxO++oauEY2u/BWquXL4
         oKhw==
X-Gm-Message-State: AOAM530XtKVqC+W4vLqghvMm3cixGNp20rapUj72hpo8ao4eP/wW8xoE
        1DwubO2/lTrGVAN52AbZE1gR
X-Google-Smtp-Source: ABdhPJy6Tfp+7r+nz977lZcwgLbQS0hblxm4+TIkxiTlyrDg1PS/Cc9Q1FD3CaUZd6oX+s+ip839fA==
X-Received: by 2002:a17:90b:1b06:: with SMTP id nu6mr22962669pjb.155.1639135368104;
        Fri, 10 Dec 2021 03:22:48 -0800 (PST)
Received: from thinkpad ([202.21.42.75])
        by smtp.gmail.com with ESMTPSA id h15sm3251488pfc.134.2021.12.10.03.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 03:22:47 -0800 (PST)
Date:   Fri, 10 Dec 2021 16:52:41 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 05/10] PCI: qcom: Add ddrss_sf_tbu flag
Message-ID: <20211210112241.GE1734@thinkpad>
References: <20211208171442.1327689-1-dmitry.baryshkov@linaro.org>
 <20211208171442.1327689-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208171442.1327689-6-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 08, 2021 at 08:14:37PM +0300, Dmitry Baryshkov wrote:
> Qualcomm PCIe driver uses compatible string to check if the ddrss_sf_tbu
> clock should be used. Since sc7280 support has added flags, switch to
> the new mechanism to check if this clock should be used.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 51a0475173fb..803d3ac18c56 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -194,7 +194,9 @@ struct qcom_pcie_ops {
>  
>  struct qcom_pcie_cfg {
>  	const struct qcom_pcie_ops *ops;
> +	/* flags for ops 2.7.0 and 1.9.0 */

No need of this comment.

>  	unsigned int pipe_clk_need_muxing:1;

This should be added in the previous patch.

> +	unsigned int has_ddrss_sf_tbu_clk:1;

Wondering if we could make both the flags "bool" as the values passed to it
are of boolean type. I don't think we could save a significant amount of
memory using bitfields.

Thanks,
Mani
>  };
>  
>  struct qcom_pcie {
> @@ -1164,7 +1166,7 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
>  	res->clks[3].id = "bus_slave";
>  	res->clks[4].id = "slave_q2a";
>  	res->clks[5].id = "tbu";
> -	if (of_device_is_compatible(dev->of_node, "qcom,pcie-sm8250")) {
> +	if (pcie->cfg->has_ddrss_sf_tbu_clk) {
>  		res->clks[6].id = "ddrss_sf_tbu";
>  		res->num_clks = 7;
>  	} else {
> @@ -1512,6 +1514,7 @@ static const struct qcom_pcie_cfg sdm845_cfg = {
>  
>  static const struct qcom_pcie_cfg sm8250_cfg = {
>  	.ops = &ops_1_9_0,
> +	.has_ddrss_sf_tbu_clk = true,
>  };
>  
>  static const struct qcom_pcie_cfg sc7280_cfg = {
> -- 
> 2.33.0
> 
