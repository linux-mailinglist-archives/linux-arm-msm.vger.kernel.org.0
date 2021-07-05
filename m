Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 032943BB71A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jul 2021 08:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbhGEGVY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Jul 2021 02:21:24 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:31973 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbhGEGVY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Jul 2021 02:21:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625465927; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=yCrPkEAKmaz+cVp5YvGeM+Fn0+vuJCy4/YBCSelI6DE=;
 b=mf02zcorruy/+aih6dZSzEWPAaqY8HFoKIHW0P4cVo+dB8Eual8WwGW25loddOVMrCPTlRsd
 Qpz65hUrscOulc0mzn4eZy35QvRpMblIZ1SmtCDJrldKQAYYnIBlNQew7Sde2WifYDpSS/kM
 Hj2CaQ6NssSV9jhNmTe5E1Yk9LU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60e2a43e3a8b6d0a458b74d7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 05 Jul 2021 06:18:38
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 147B1C4360C; Mon,  5 Jul 2021 06:18:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2A775C433D3;
        Mon,  5 Jul 2021 06:18:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Mon, 05 Jul 2021 11:48:37 +0530
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, bhelgaas@google.com,
        robh+dt@kernel.org, swboyd@chromium.org, lorenzo.pieralisi@arm.com,
        svarbanov@mm-sol.com
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        mgautam@codeaurora.org, dianders@chromium.org, mka@chromium.org,
        sanm@codeaurora.org
Subject: Re: [PATCH v3 4/4] PCIe: qcom: Add support to control pipe clk mux
In-Reply-To: <1624377651-30604-5-git-send-email-pmaliset@codeaurora.org>
References: <1624377651-30604-1-git-send-email-pmaliset@codeaurora.org>
 <1624377651-30604-5-git-send-email-pmaliset@codeaurora.org>
Message-ID: <c334a6d11fae5bd135a94ab5c66b3f97@codeaurora.org>
X-Sender: pmaliset@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-22 21:30, Prasad Malisetty wrote:
> pipe-clk mux needs to switch between pipe_clk
> and XO as part of LPM squence. This is done by setting
> pipe_clk mux as parent of pipe_clk after phy init.
> This is a new requirement for sc7280.
> For accessing to DBI registers during L23,
> need to switch the pipe clock with free-running
> clock (TCXO) using GCC’s registers
> 
> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c
> b/drivers/pci/controller/dwc/pcie-qcom.c
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
> @@ -1167,6 +1170,20 @@ static int qcom_pcie_get_resources_2_7_0(struct
> qcom_pcie *pcie)
>  	if (ret < 0)
>  		return ret;
> 
> +	if (of_device_is_compatible(dev->of_node, "qcom,pcie-sc7280")) {
> +		res->pipe_clk_mux = devm_clk_get(dev, "pipe_mux");
> +		if (IS_ERR(res->pipe_clk_mux))
> +			return PTR_ERR(res->pipe_clk_mux);
> +
> +		res->pipe_ext_src = devm_clk_get(dev, "phy_pipe");
> +		if (IS_ERR(res->pipe_ext_src))
> +			return PTR_ERR(res->pipe_ext_src);
> +
> +		res->ref_clk_src = devm_clk_get(dev, "ref");
> +		if (IS_ERR(res->ref_clk_src))
> +			return PTR_ERR(res->ref_clk_src);
> +	}
> +
>  	res->pipe_clk = devm_clk_get(dev, "pipe");
>  	return PTR_ERR_OR_ZERO(res->pipe_clk);
>  }
> @@ -1255,6 +1272,11 @@ static void qcom_pcie_deinit_2_7_0(struct
> qcom_pcie *pcie)
>  static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
>  {
>  	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
> +	struct dw_pcie *pci = pcie->pci;
> +	struct device *dev = pci->dev;
> +
> +	if (of_device_is_compatible(dev->of_node, "qcom,pcie-sc7280"))
> +		clk_set_parent(res->pipe_clk_mux, res->pipe_ext_src);
> 
>  	return clk_prepare_enable(res->pipe_clk);
>  }


Hi All,

Greetings of the day !!

Could you please provide your comments on updated change series

Thanks
-Prasad
