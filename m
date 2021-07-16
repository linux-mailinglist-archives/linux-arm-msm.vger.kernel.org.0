Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B440C3CB965
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jul 2021 17:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240711AbhGPPJn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jul 2021 11:09:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:47566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240662AbhGPPJm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jul 2021 11:09:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94E0E613CF;
        Fri, 16 Jul 2021 15:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626448007;
        bh=JzWPW35335QIwmM3xBK4Cw2sjgXHcx4/lh7YkVBiYxQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=NoFIpHbfGl2knocCnlE5XBaMliHj15VAx5uOkGdww3jszoiFDHIhFMV4TIb9wQ7rT
         qJ2LrtMk1L+75j3wKzo0u3n8xjVOVz/c23fhf9dhY0usXaFoPkCl0AV2m5U26F71OR
         cg5QOpd47dZUlglCXhzEC+mJJIWbuO4QS/hstStC4dn7vSsI7/jpfBqGyV3Wvl5wMh
         67Jm5g+vHGSMdgZZS5UlLJ7fUwpI3vCiXdFTmos/dFlKoEENYTF0GtTzAOL0mZrPgE
         pTpt2C8rSl98l+8jLO2CBUz78/tmN3tsHZ8EVfPrBqLKtosIqXfw0h/qi46R7ma925
         lsIYmb8llgnIg==
Date:   Fri, 16 Jul 2021 10:06:46 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Prasad Malisetty <pmaliset@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, bhelgaas@google.com,
        robh+dt@kernel.org, swboyd@chromium.org, lorenzo.pieralisi@arm.com,
        svarbanov@mm-sol.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        mka@chromium.org, vbadigan@codeaurora.org, sallenki@codeaurora.org
Subject: Re: [PATCH v4 4/4] PCIe: qcom: Add support to control pipe clk src
Message-ID: <20210716150646.GA2098485@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1626443927-32028-5-git-send-email-pmaliset@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Run this:

  $ git log --oneline drivers/pci/controller/dwc/pcie-qcom.c

and make your subject match the style and structure (in particular,
s/PCIe/PCI/).  In this case, maybe something like this?

  PCI: qcom: Switch sc7280 gcc_pcie_1_pipe_clk_src after PHY init

On Fri, Jul 16, 2021 at 07:28:47PM +0530, Prasad Malisetty wrote:
> This is a new requirement for sc7280 SoC.
> To enable gdsc gcc_pcie_1_pipe_clk_src should be TCXO.
> after PHY initialization gcc_pcie_1_pipe_clk_src needs
> to switch from TCXO to gcc_pcie_1_pipe_clk.

This says what *needs* to happen, but it doesn't actually say what
this patch *does*.  I think it's something like:

  On the sc7280 SoC, the clock source for pcie_1_pipe must be the TCXO
  while gdsc is enabled.  But after the PHY is initialized, the clock
  source must be switched to gcc_pcie_1_pipe_clk.

  On sc7280, switch gcc_pcie_1_pipe_clk_src from TCXO to
  gcc_pcie_1_pipe_clk after the PHY has been initialized.

Nits: Rewrap to fill 75 columns or so.  Add blank lines between
paragraphs.  Start sentences with capital letter.

> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 8a7a300..9e0e4ab 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -166,6 +166,9 @@ struct qcom_pcie_resources_2_7_0 {
>  	struct regulator_bulk_data supplies[2];
>  	struct reset_control *pci_reset;
>  	struct clk *pipe_clk;
> +	struct clk *gcc_pcie_1_pipe_clk_src;
> +	struct clk *phy_pipe_clk;
> +	struct clk *ref_clk_src;
>  };
>  
>  union qcom_pcie_resources {
> @@ -1167,6 +1170,20 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
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
> +
> +		res->ref_clk_src = devm_clk_get(dev, "ref");
> +		if (IS_ERR(res->ref_clk_src))
> +			return PTR_ERR(res->ref_clk_src);

Not clear why ref_clk_src is here, since it's not used anywhere.  If
it's not necessary here, drop it and add it in a future patch that
uses it.

> +	}
> +
>  	res->pipe_clk = devm_clk_get(dev, "pipe");
>  	return PTR_ERR_OR_ZERO(res->pipe_clk);
>  }
> @@ -1255,6 +1272,11 @@ static void qcom_pcie_deinit_2_7_0(struct qcom_pcie *pcie)
>  static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
>  {
>  	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
> +	struct dw_pcie *pci = pcie->pci;
> +	struct device *dev = pci->dev;
> +
> +	if (of_device_is_compatible(dev->of_node, "qcom,pcie-sc7280"))

Using of_device_is_compatible() follows existing style in the driver,
which is good.  But I'm not sure that's good style in general because
it's a little repetitious and wasteful.

qcom_pcie_probe() already calls of_device_get_match_data(), which does
basically the same thing as of_device_is_compatible(), so I think we
could take better advantage of that by augmenting struct qcom_pcie_ops
with these device-specific details.

Some drivers that use this strategy:

  drivers/pci/controller/cadence/pci-j721e.c
  drivers/pci/controller/dwc/pci-imx6.c
  drivers/pci/controller/dwc/pci-layerscape.c
  drivers/pci/controller/dwc/pci-layerscape-ep.c
  drivers/pci/controller/dwc/pcie-tegra194.c
  drivers/pci/controller/pci-ftpci100.c
  drivers/pci/controller/pcie-brcmstb.c
  drivers/pci/controller/pcie-mediatek.c

> +		clk_set_parent(res->gcc_pcie_1_pipe_clk_src, res->phy_pipe_clk);
>  
>  	return clk_prepare_enable(res->pipe_clk);
>  }
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
