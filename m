Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 096403CBDE0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jul 2021 22:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232957AbhGPUlu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jul 2021 16:41:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232888AbhGPUlt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jul 2021 16:41:49 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8928DC061764
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jul 2021 13:38:54 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id c197so12332717oib.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jul 2021 13:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IJgvUkVXgZbTX3qLxhuoaY6GiCRRdHUowdy27+g8id0=;
        b=WYlwc/BFJ9kWsGN75fG2dA74wm3XlU6b8G8Wke/1foL7NJ5EyVJEqe39lpOgHP8P9h
         RhXzV3hwX/yfMgJkuEif5V3WxEPKBp8UkH2DIIHf64x42zX3F91QJZSuw0dMLkHxNk8f
         NeHkKB3soZxjiLtu5+urRBSBO3LSTVSnmHkWObBN8uUiU/1Su7iHdZ7B4F5PI88terZp
         of0xJsit2oozInoxrEkauDi8A1vMlJHm/gh6gDpTxCLku/Bnudhqj11Czu9MXRPw+3zi
         3rNWRP/wLY/EuD1lNWUHP+AkDNg2FLF7yRllunuJv9t3FIgBAO5xcjWouqumUWQy2FkT
         6/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IJgvUkVXgZbTX3qLxhuoaY6GiCRRdHUowdy27+g8id0=;
        b=PqmkS/OGkNKTDVUiVD1/Jd1U+7ijYYHMyeLZjKdxucR4o1PkmieIwyovSXrq1zGbsy
         pNZwvufLtdQMhviBE0ZE7hdH6aziSy45+CVwr/WXQizlAb9sB3VCNlL+1/e3p/PW12TV
         27YQqDvh5fv0HDsRMnDwn9qeZL8CyQHM7zoMByqY0SmXKXD/zD860zaygkZx5mRl9tJV
         v5RXbqVGxbYFAR9z60w+U77gNag0YJSwcWQy6sofXwjNRpWPglEmB4M8BMqOViyz3Gnx
         YLhVxyK1MV9Yjg+ayeNCbI2IevKBoNGWmcehSlRmPFVHELoFqeKGC7QwuuePVHSaYMVY
         QL0A==
X-Gm-Message-State: AOAM531+xLdIWH7XwQU+JR9kCh/Ff/91MutcGoagbzte4Yqb9XDthB8+
        1SNspVdPZnQjlrwtOLTN/rSUHQ==
X-Google-Smtp-Source: ABdhPJwAhm8v+4PMreO7KgFbhMG+0YSb1Zrl9zrkPOF6//abvy2P65VcBbjinuhdtUJVrZhCTANbig==
X-Received: by 2002:aca:1802:: with SMTP id h2mr13665437oih.146.1626467933729;
        Fri, 16 Jul 2021 13:38:53 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q9sm2087904otk.18.2021.07.16.13.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 13:38:53 -0700 (PDT)
Date:   Fri, 16 Jul 2021 15:38:50 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Prasad Malisetty <pmaliset@codeaurora.org>, agross@kernel.org,
        bhelgaas@google.com, robh+dt@kernel.org, swboyd@chromium.org,
        lorenzo.pieralisi@arm.com, svarbanov@mm-sol.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, mka@chromium.org, vbadigan@codeaurora.org,
        sallenki@codeaurora.org
Subject: Re: [PATCH v4 4/4] PCIe: qcom: Add support to control pipe clk src
Message-ID: <YPHuWudai/FO6SMN@yoga>
References: <1626443927-32028-5-git-send-email-pmaliset@codeaurora.org>
 <20210716150646.GA2098485@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210716150646.GA2098485@bjorn-Precision-5520>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 16 Jul 10:06 CDT 2021, Bjorn Helgaas wrote:

> Run this:
> 
>   $ git log --oneline drivers/pci/controller/dwc/pcie-qcom.c
> 
> and make your subject match the style and structure (in particular,
> s/PCIe/PCI/).  In this case, maybe something like this?
> 
>   PCI: qcom: Switch sc7280 gcc_pcie_1_pipe_clk_src after PHY init
> 
> On Fri, Jul 16, 2021 at 07:28:47PM +0530, Prasad Malisetty wrote:
> > This is a new requirement for sc7280 SoC.
> > To enable gdsc gcc_pcie_1_pipe_clk_src should be TCXO.
> > after PHY initialization gcc_pcie_1_pipe_clk_src needs
> > to switch from TCXO to gcc_pcie_1_pipe_clk.
> 
> This says what *needs* to happen, but it doesn't actually say what
> this patch *does*.  I think it's something like:
> 
>   On the sc7280 SoC, the clock source for pcie_1_pipe must be the TCXO
>   while gdsc is enabled.  But after the PHY is initialized, the clock
>   source must be switched to gcc_pcie_1_pipe_clk.
> 
>   On sc7280, switch gcc_pcie_1_pipe_clk_src from TCXO to
>   gcc_pcie_1_pipe_clk after the PHY has been initialized.
> 
> Nits: Rewrap to fill 75 columns or so.  Add blank lines between
> paragraphs.  Start sentences with capital letter.
> 
> > Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-qcom.c | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > index 8a7a300..9e0e4ab 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > @@ -166,6 +166,9 @@ struct qcom_pcie_resources_2_7_0 {
> >  	struct regulator_bulk_data supplies[2];
> >  	struct reset_control *pci_reset;
> >  	struct clk *pipe_clk;
> > +	struct clk *gcc_pcie_1_pipe_clk_src;
> > +	struct clk *phy_pipe_clk;
> > +	struct clk *ref_clk_src;
> >  };
> >  
> >  union qcom_pcie_resources {
> > @@ -1167,6 +1170,20 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
> >  	if (ret < 0)
> >  		return ret;
> >  
> > +	if (of_device_is_compatible(dev->of_node, "qcom,pcie-sc7280")) {
> > +		res->gcc_pcie_1_pipe_clk_src = devm_clk_get(dev, "pipe_mux");
> > +		if (IS_ERR(res->gcc_pcie_1_pipe_clk_src))
> > +			return PTR_ERR(res->gcc_pcie_1_pipe_clk_src);
> > +
> > +		res->phy_pipe_clk = devm_clk_get(dev, "phy_pipe");
> > +		if (IS_ERR(res->phy_pipe_clk))
> > +			return PTR_ERR(res->phy_pipe_clk);
> > +
> > +		res->ref_clk_src = devm_clk_get(dev, "ref");
> > +		if (IS_ERR(res->ref_clk_src))
> > +			return PTR_ERR(res->ref_clk_src);
> 
> Not clear why ref_clk_src is here, since it's not used anywhere.  If
> it's not necessary here, drop it and add it in a future patch that
> uses it.
> 
> > +	}
> > +
> >  	res->pipe_clk = devm_clk_get(dev, "pipe");
> >  	return PTR_ERR_OR_ZERO(res->pipe_clk);
> >  }
> > @@ -1255,6 +1272,11 @@ static void qcom_pcie_deinit_2_7_0(struct qcom_pcie *pcie)
> >  static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
> >  {
> >  	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
> > +	struct dw_pcie *pci = pcie->pci;
> > +	struct device *dev = pci->dev;
> > +
> > +	if (of_device_is_compatible(dev->of_node, "qcom,pcie-sc7280"))
> 
> Using of_device_is_compatible() follows existing style in the driver,
> which is good.  But I'm not sure that's good style in general because
> it's a little repetitious and wasteful.
> 

Following the style is good, but up until the recent sm8250 addition it
was just a hack to deal with legacy platforms that we don't know the
exact details about.

But, all platforms I know of has the pipe_clk from the PHY fed into the
pipe_clk_src mux in the gcc block and then ends up in the PCIe
controller. As such, I suspect that the pipe_clk handling should be moved
to the common code path of the driver and there's definitely no harm in
making sure that the pipe_clk_src mux is explicitly configured on
existing platforms (at least all 2.7.0 based ones).

> qcom_pcie_probe() already calls of_device_get_match_data(), which does
> basically the same thing as of_device_is_compatible(), so I think we
> could take better advantage of that by augmenting struct qcom_pcie_ops
> with these device-specific details.
> 

I agree.

Regards,
Bjorn

> Some drivers that use this strategy:
> 
>   drivers/pci/controller/cadence/pci-j721e.c
>   drivers/pci/controller/dwc/pci-imx6.c
>   drivers/pci/controller/dwc/pci-layerscape.c
>   drivers/pci/controller/dwc/pci-layerscape-ep.c
>   drivers/pci/controller/dwc/pcie-tegra194.c
>   drivers/pci/controller/pci-ftpci100.c
>   drivers/pci/controller/pcie-brcmstb.c
>   drivers/pci/controller/pcie-mediatek.c
> 
> > +		clk_set_parent(res->gcc_pcie_1_pipe_clk_src, res->phy_pipe_clk);
> >  
> >  	return clk_prepare_enable(res->pipe_clk);
> >  }
> > -- 
> > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > a Linux Foundation Collaborative Project
> > 
