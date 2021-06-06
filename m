Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE82E39CC3B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jun 2021 04:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbhFFCRq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Jun 2021 22:17:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230060AbhFFCRq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Jun 2021 22:17:46 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 231F4C061767
        for <linux-arm-msm@vger.kernel.org>; Sat,  5 Jun 2021 19:15:42 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id v27-20020a056830091bb02903cd67d40070so10106511ott.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jun 2021 19:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WGAqf2Gr553OIGlC6DX5HQDS11N78fJFk5WKZkkHo5A=;
        b=LnksyxK+6J0/QxicUk4N733y/jGyqIHg5WJPTARNPI8SLWFDNr3bNDBd9KSTlbreks
         kQBk41tNfu8YOQDxf/AQUJmfobyXjBiESqidajwPfPkL28wHd6YtGMB4S248n8NYDvGv
         ZNJvanj8sWm5ZZxP+RdOSb3PChgsk8LWlF//bHP/u2h0OSyYuxznIVwjlhJ0gqfqdFI+
         mcaE+Eh7DPrnPBqZ6DN732u8NJB+UpiHtd2Fv0fnRKhUJ/4mVbEBZQ7EPNxzUyqc0CrQ
         oFsXhLT7lKOfuhjmYPEc+xfOLRkgFspBMCG60tiD7SpTG6JpmAWf8b/pv1C+XN1eN+XE
         4s0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WGAqf2Gr553OIGlC6DX5HQDS11N78fJFk5WKZkkHo5A=;
        b=BPzChAYuSuSyekc73KD4Oxv4/zOjfPoNyeSSS/+MrSAHaLbel2T78Aqonf4IS0rcsb
         qI9p9cSZPEXwujUlfIs5CXHK6K9gMf6qV2VoRXikoo4fICz+ipcu+zFoo2rEJr6+Q/NA
         uxZ6//dlHXx7Nx8fRR8K6BOBoN2dU2oBQhYPnW+dbwnk9mWu6cojNgq1J81kqLNgqMpO
         6I3TyHv61TudCnjcptk7e3xiEgJPvWXX+FRpThiB1Tam+BdjJ+rrI0KbCXDaRqTGqArm
         mMJNwiWSK9vClxlQGzOY0t3p92lRB6rzvObeYz5nGM9NmkmgZvxc2ZxNbEUApC/WhYE+
         vxqA==
X-Gm-Message-State: AOAM5300H6ERYuoHVEdgJJDM/z9DgwcrIC1BEFfMVIIK/eIFw1/CG9YJ
        U+wYzm6i33TaP0RmA6d93CB56g==
X-Google-Smtp-Source: ABdhPJzRNL3lYzoZ4Ra/kvexRUdWf7j0rbcgmqauvF5dxeXxMz5enckh1ivgzWiG0htk8ruFIRmE5A==
X-Received: by 2002:a05:6830:2459:: with SMTP id x25mr8763346otr.127.1622945741280;
        Sat, 05 Jun 2021 19:15:41 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 94sm1451218otj.33.2021.06.05.19.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 19:15:40 -0700 (PDT)
Date:   Sat, 5 Jun 2021 21:15:38 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Prasad Malisetty <pmaliset@codeaurora.org>
Cc:     agross@kernel.org, bhelgaas@google.com, robh+dt@kernel.org,
        swboyd@chromium.org, lorenzo.pieralisi@arm.com,
        svarbanov@mm-sol.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        dianders@chromium.org, mka@chromium.org, sanm@codeaurora.org
Subject: Re: [PATCH v2 3/4] PCIe: qcom: Add support to control pipe clk mux
Message-ID: <YLwvyiBzs0kU0oRk@builder.lan>
References: <1622904059-21244-1-git-send-email-pmaliset@codeaurora.org>
 <1622904059-21244-4-git-send-email-pmaliset@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1622904059-21244-4-git-send-email-pmaliset@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 05 Jun 09:40 CDT 2021, Prasad Malisetty wrote:

> In PCIe driver pipe-clk mux needs to switch between pipe_clk
> and XO for GDSC enable. This is done by setting pipe_clk mux
> as parent of pipe_clk after phy init.

But you're not switching between pipe_clk and XO, you're only making
sure that the pipe_clk is parented by the PHY's pipe clock.

Also, can you please elaborate on how this relates to the GDSC?

> 
> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 8a7a300..5cbbea4 100644
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
> +		res->pipe_clk_mux = devm_clk_get(dev, "pipe_src");
> +		if (IS_ERR(res->pipe_clk_mux))
> +			return PTR_ERR(res->pipe_clk_mux);
> +
> +		res->pipe_ext_src = devm_clk_get(dev, "pipe_ext");
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
> @@ -1255,6 +1272,11 @@ static void qcom_pcie_deinit_2_7_0(struct qcom_pcie *pcie)
>  static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
>  {
>  	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
> +	struct dw_pcie *pci = pcie->pci;
> +	struct device *dev = pci->dev;
> +
> +	if (of_device_is_compatible(dev->of_node, "qcom,pcie-sc7280"))

If this is something only found on 7280, you need to document (in the
commit message at least) why this does not apply to other platforms with
this controller.

Thanks,
Bjorn

> +		clk_set_parent(res->pipe_clk_mux, res->pipe_ext_src);
>  
>  	return clk_prepare_enable(res->pipe_clk);
>  }
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
