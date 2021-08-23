Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7C13F4DD8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Aug 2021 17:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231766AbhHWP5T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Aug 2021 11:57:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231736AbhHWP5T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Aug 2021 11:57:19 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC7DCC06175F
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 08:56:36 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id i3-20020a056830210300b0051af5666070so27809262otc.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 08:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3lcZudzQ7vfqb/InrksY2qHfhZLERO9wRMG6pb4Ol/8=;
        b=jAsAHXLQAnFPW7dQtPCfuuO+9ZvsT/9HyBIrvKpkaCFuvJNqVTlFbwD2fPhhU78VHI
         D+WMnc3MHh42G6bRD2Yh4n9IU24YYE/3NVZgC2cRg6jLm7VUU6Ir2l113CSPqQcZfoB5
         rxZaLiPO2ZWc6b2k0z591InfO0UI/25ZwC2v5Epe1ViB+DY7iP0ot5zgAYIn07g9CZeL
         At2BsrmSgETGqwcw22eiV/AiyqgkII3MGhJaYsUam4FovDMB2aaY3g/E1XmEPaqgkYo5
         cm6xydqlMnEArK4spzJn4FwSPaCZUvl+zq2hcJ3ak2yc43kORMEGZ6TyNzBQjrLW8wRY
         qs+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3lcZudzQ7vfqb/InrksY2qHfhZLERO9wRMG6pb4Ol/8=;
        b=dAt+Ws3QD2YrJIDdVel1HH/tnidMV4/50kA16CiWzCv9B+QFPpRuiVa6QLXEYYRoCx
         PcSyI5F9o/FnVyvPVcqGXFvQvCuocykKfuQHV5qr7gusogw30n8wWGFg0aXdYE4f15ZQ
         azMVIEpbs15m+8WFccYNF0XUIE7d+8otPyvES+3Yf7ye+jKBOC13ifRv7GyfE6VrWfSw
         DKdq/s7jk6Qqueke2PwRVw+oih5+StLlfB2c4g99VXFnnZXxQNYux5XoWVxK3mu7YvqH
         h2A2jDohm3RjEBXrxKLzvjDZQp9YyHB/hoFe29K3EJvLV6l9J5WoP8f3vQgldrrfyzHu
         dkdg==
X-Gm-Message-State: AOAM530h0O971v2RZ1m758x4jWqTb7IAXtgqfIezE0dJNE1+NaxLJxip
        LlRCOOnt23Gv0FlxaaQRlric1A==
X-Google-Smtp-Source: ABdhPJzncQPxjyl/rnDKt15VwxFNkMsr5tahgz2GkveS2Z5VVpYOk4mpJdPuZoBCPTw0Lpkw8BSetA==
X-Received: by 2002:a9d:730a:: with SMTP id e10mr2467831otk.120.1629734195964;
        Mon, 23 Aug 2021 08:56:35 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 14sm3991315otl.78.2021.08.23.08.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 08:56:35 -0700 (PDT)
Date:   Mon, 23 Aug 2021 08:57:54 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Georgi Djakov <djakov@kernel.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/3] interconnect: qcom: sdm660: Add missing a2noc qos
 clocks
Message-ID: <YSPFgsWVW0pCYvBw@ripper>
References: <20210823095603.5538-1-shawn.guo@linaro.org>
 <20210823095603.5538-3-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210823095603.5538-3-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 23 Aug 02:56 PDT 2021, Shawn Guo wrote:

> It adds the missing a2noc clocks required for QoS registers programming
> per downstream kernel[1].  Otherwise, qcom_icc_noc_set_qos_priority()
> call on mas_ufs or mas_usb_hs node will simply result in a hardware hang
> on SDM660 SoC.
> 
> [1] https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/sdm660-bus.dtsi?h=LA.UM.8.2.r1-04800-sdm660.0#n43
> 

Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  drivers/interconnect/qcom/sdm660.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/interconnect/qcom/sdm660.c b/drivers/interconnect/qcom/sdm660.c
> index c89c991a80a0..661eb3635d21 100644
> --- a/drivers/interconnect/qcom/sdm660.c
> +++ b/drivers/interconnect/qcom/sdm660.c
> @@ -174,6 +174,16 @@ static const struct clk_bulk_data bus_mm_clocks[] = {
>  	{ .id = "iface" },
>  };
>  
> +static const struct clk_bulk_data bus_a2noc_clocks[] = {
> +	{ .id = "bus" },
> +	{ .id = "bus_a" },
> +	{ .id = "ipa" },
> +	{ .id = "ufs_axi" },
> +	{ .id = "aggre2_ufs_axi" },
> +	{ .id = "aggre2_usb3_axi" },
> +	{ .id = "cfg_noc_usb2_axi" },
> +};
> +
>  /**
>   * struct qcom_icc_provider - Qualcomm specific interconnect provider
>   * @provider: generic interconnect provider
> @@ -811,6 +821,10 @@ static int qnoc_probe(struct platform_device *pdev)
>  		qp->bus_clks = devm_kmemdup(dev, bus_mm_clocks,
>  					    sizeof(bus_mm_clocks), GFP_KERNEL);
>  		qp->num_clks = ARRAY_SIZE(bus_mm_clocks);
> +	} else if (of_device_is_compatible(dev->of_node, "qcom,sdm660-a2noc")) {
> +		qp->bus_clks = devm_kmemdup(dev, bus_a2noc_clocks,
> +					    sizeof(bus_a2noc_clocks), GFP_KERNEL);
> +		qp->num_clks = ARRAY_SIZE(bus_a2noc_clocks);
>  	} else {
>  		if (of_device_is_compatible(dev->of_node, "qcom,sdm660-bimc"))
>  			qp->is_bimc_node = true;
> -- 
> 2.17.1
> 
