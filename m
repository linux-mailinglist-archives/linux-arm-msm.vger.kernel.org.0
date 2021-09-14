Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 386AC40B733
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 20:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbhINSxs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 14:53:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:59480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229869AbhINSxr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 14:53:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D22F261155;
        Tue, 14 Sep 2021 18:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631645550;
        bh=SDdnorZEBnhPn/ZG3jdmhisa2ptkXBcD2EonNKefoFI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=S7RbtLB1qRbR4v4VwraXBQIZ8iwL+5gKk1PEM7/bXtVm8NkB+yUCArSQOk45dHKQq
         peY2GS73m5H/HuM0rYE4HirMU2KMCAq8soy/9PDPCGiRBPK4jrxX5MWm3ugK2oF5MV
         N0cTZUYo1RC7RmLFJ6AJi6/NCb6H1weXwigDOTiqNdwdOGuUmIMoieZACM2wG/pcOx
         Nwa+hcljIyHBxrv7iGDYVqornqfXQKkPgCKHCybPanEHdZROfx6+bJo9X+1gOKNmIE
         kN2H2ybS0ap0GUH4Kj4/uvT3ZSZVidMbt+Xj0ZhQpoRdFwIa8EAyC0/jA0IOoSMnjB
         dDcR9uB5ijwEA==
Date:   Tue, 14 Sep 2021 13:52:28 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Prasad Malisetty <pmaliset@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, bhelgaas@google.com,
        robh+dt@kernel.org, swboyd@chromium.org, lorenzo.pieralisi@arm.com,
        svarbanov@mm-sol.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        mka@chromium.org, vbadigan@codeaurora.org, sallenki@codeaurora.org,
        manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH v7 4/4] PCI: qcom: Switch pcie_1_pipe_clk_src after PHY
 init in SC7280
Message-ID: <20210914185228.GA1443558@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1631643550-29960-5-git-send-email-pmaliset@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 14, 2021 at 11:49:10PM +0530, Prasad Malisetty wrote:
> On the SC7280, the clock source for gcc_pcie_1_pipe_clk_src
> must be the TCXO while gdsc is enabled. After PHY init successful
> clock source should switch to pipe clock for gcc_pcie_1_pipe_clk_src.
> 
> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 90 +++++++++++++++++++++++++++++-----
>  1 file changed, 79 insertions(+), 11 deletions(-)
> 
> +struct qcom_pcie_cfg {
> +	const struct qcom_pcie_ops *ops;
> +	bool pcie_1_pipe_clk_src_switch;

This is OK, but all things being equal I like "unsigned int x:1" a
little better.  Here's some background:

  https://lore.kernel.org/r/CA+55aFzKQ6Pj18TB8p4Yr0M4t+S+BsiHH=BJNmn=76-NcjTj-g@mail.gmail.com/
  https://lore.kernel.org/r/CA+55aFxnePDimkVKVtv3gNmRGcwc8KQ5mHYvUxY8sAQg6yvVYg@mail.gmail.com/

> @@ -1467,6 +1531,7 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>  	struct pcie_port *pp;
>  	struct dw_pcie *pci;
>  	struct qcom_pcie *pcie;
> +	const struct qcom_pcie_cfg *pcie_cfg = NULL;

No need to initialize this, since you always assign it before using
it.

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

Looks good, thanks for working on this!
