Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6C853C600B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jul 2021 18:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbhGLQGl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jul 2021 12:06:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbhGLQGk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jul 2021 12:06:40 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1776C0613E5
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jul 2021 09:03:51 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id l26so25005105oic.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jul 2021 09:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=VYQdhl8WGpNZn7IHwYKLRg9DV0FPfiQGFVFR4KPgX0c=;
        b=XSGbCrKyqK3ndOMFIBRp2HQGP9z52L4aOKWsy8RvSGGGFh+fx3biWqeYIqZwHykyu+
         Jcz6zYKUDqSUwEDhLxYnftrY/LDZX+WEpNDBmyv5I2nyjHXPMnqLTTSz3nxLEFV4QbBA
         OzW8SlBs5mCHHjCVVZp+b4mYvXXm94EtBVfHm8v4IbrykDmgM3De6gIKrVvbt8W/A/V6
         beYDXOsm92b/ca0dXkn3rruOtDznbLyGfWxJ+Sd15Rnj7dUS6BJDVG6yFhb5jqSr3Bk8
         OmDrAWqDlaIC5k70/KHUtRyrmVlHJQjkgnK05uzjpXXYWEeIXFNV0SDmJaLPUVr5vAIX
         131Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=VYQdhl8WGpNZn7IHwYKLRg9DV0FPfiQGFVFR4KPgX0c=;
        b=IDp1CfdDElp2coMzy8sm/2ZZ1+P5dIAyadjve1H9l1Ba+WWChJUwd8OdlZWUmZ94XG
         j/M5IzLqk6rP/Uz9s2LMkKBDJ/m/Kb/OcluOhRCczuuFaDlUsti3ndJWdETq/5OpXNhA
         UIJZ6LrfCc/nYSuXG6cXPijwO6PDh2iRwZ21NvgISE9bzyVwSL78Y9fkR5CB0fARm2eI
         AR43PmMzohDLBqUBzD1XCSBygJ6JTYi3dKupsmeRgdAvPSypSkm4j2LKlFVAaeiVPkCR
         qcq8YGyEmaJ25N0RzHbzIAcob1nFdKaG5hQn6pk7vN2WMAcifJKWb4ll/XHhpTU51J0x
         sf7w==
X-Gm-Message-State: AOAM530jMuS8xIW/KHgqdb4Mj4cw8+zx+osR7Gdpa05kN2tj1x8rfZzh
        ABc/1CDFh8s4efoiZi6EGchdTg==
X-Google-Smtp-Source: ABdhPJxWVvHGQqmw4XVHZ9oLKOii3peGSB6g8nki90kRoK68heA+KbKagj74e1DGjUmoUOwQsea0jA==
X-Received: by 2002:aca:acc5:: with SMTP id v188mr10863888oie.167.1626105831020;
        Mon, 12 Jul 2021 09:03:51 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z5sm3229154oib.14.2021.07.12.09.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 09:03:50 -0700 (PDT)
Date:   Mon, 12 Jul 2021 11:03:48 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Prasad Malisetty <pmaliset@codeaurora.org>
Cc:     agross@kernel.org, bhelgaas@google.com, robh+dt@kernel.org,
        swboyd@chromium.org, lorenzo.pieralisi@arm.com,
        svarbanov@mm-sol.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        dianders@chromium.org, mka@chromium.org, sanm@codeaurora.org
Subject: Re: [PATCH v3 4/4] PCIe: qcom: Add support to control pipe clk mux
Message-ID: <YOxn5GWQsEH/+bSm@yoga>
References: <1624377651-30604-1-git-send-email-pmaliset@codeaurora.org>
 <1624377651-30604-5-git-send-email-pmaliset@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1624377651-30604-5-git-send-email-pmaliset@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 22 Jun 11:00 CDT 2021, Prasad Malisetty wrote:

> pipe-clk mux needs to switch between pipe_clk

If you spell "pipe-clk mux" as "gcc_pcie_N_pipe_clk_src" there's no
ambiguity in which clock you refer to.

> and XO as part of LPM squence. This is done by setting
> pipe_clk mux as parent of pipe_clk after phy init.

I thought the two possible cases where:

xo -> gcc_pcie_N_pipe_clk_src -> gcc_pcie_N_pipe_clk
PHY::pipe_clk -> gcc_pcie_N_pipe_clk_src -> gcc_pcie_N_pipe_clk

But here you're saying that you're setting the parent of PHY::pipe_clk
to gcc_pcie_N_pipe_clk?

> This is a new requirement for sc7280.
> For accessing to DBI registers during L23,
> need to switch the pipe clock with free-running
> clock (TCXO) using GCC’s registers

So in previous platforms we could access DBI registers, in L23, without
any clock?

What happens if we use xo as parent for the pipe clock

> 
> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 8a7a300..80e9ee4 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -166,6 +166,9 @@ struct qcom_pcie_resources_2_7_0 {
>  	struct regulator_bulk_data supplies[2];
>  	struct reset_control *pci_reset;
>  	struct clk *pipe_clk;
> +	struct clk *pipe_clk_mux;
> +	struct clk *pipe_ext_src;
> +	struct clk *ref_clk_src;
>  };
>  
>  union qcom_pcie_resources {
> @@ -1167,6 +1170,20 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
>  	if (ret < 0)
>  		return ret;
>  
> +	if (of_device_is_compatible(dev->of_node, "qcom,pcie-sc7280")) {

So this is the first 2.7.0 that has this need? Are we just going to add
more compatibles to this list going forward?

> +		res->pipe_clk_mux = devm_clk_get(dev, "pipe_mux");
> +		if (IS_ERR(res->pipe_clk_mux))
> +			return PTR_ERR(res->pipe_clk_mux);

So this is gcc_pcie_N_pipe_clk_src?

> +
> +		res->pipe_ext_src = devm_clk_get(dev, "phy_pipe");
> +		if (IS_ERR(res->pipe_ext_src))
> +			return PTR_ERR(res->pipe_ext_src);

And this is the pipe_clk coming out of the PHY (What I call
PHY::pipe_clk above)?

> +
> +		res->ref_clk_src = devm_clk_get(dev, "ref");
> +		if (IS_ERR(res->ref_clk_src))
> +			return PTR_ERR(res->ref_clk_src);

And this is TCXO?

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
> +		clk_set_parent(res->pipe_clk_mux, res->pipe_ext_src);
>  

So after phy_power_on() (not "phy init" as you say in the commit
message, perhaps you don't mean phy_init() but in general terms "phy
initialization") you need to make sure that gcc_pcie_N_pipe_clk_src is
actually fed by PHY::pipe_clk?

1) What's the gcc_pcie_N_pipe_clk_src parent before this?

2) Will the PHY initialization really succeed if the pipe_clk feeding
back from gcc isn't based on the PHY's pipe_clk? Is this a change in
sc7280?

3) In the commit message you're talking about the need to make XO the
parent of gcc_pcie_N_pipe_clk_src during L23, where in this patch does
that happen?

Regards,
Bjorn

>  	return clk_prepare_enable(res->pipe_clk);
>  }
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
