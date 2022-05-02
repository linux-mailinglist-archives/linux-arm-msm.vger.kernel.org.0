Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74860516FF1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 15:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385156AbiEBNFf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 09:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385121AbiEBNFf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 09:05:35 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D647B186DA
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 06:02:05 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id l9-20020a056830268900b006054381dd35so9685134otu.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 06:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CtdcU9l/eHtmGbmVAGb3hipx1MyfPt8hYs/X++xA/Z0=;
        b=Ya3yCRPVQavN50597Nmysg2ex7niSVKPfGsl0FDOOHtfjZXz++DXVIqM8iQl8IqIye
         qlWQa6rT4Ka/uZGAYXrQeJ6vNKimjSASuzOG3/6NC6G3TIvyTUrlqLMVxCMR6AqP2rG0
         xGRql6dU/PdZryV+hLB7vHjgHl+f4WslJAGQJLD/AwgFMcPWv/ClHmui+T7kXVfjYeHB
         3owCU4xxX/DeC/MwGYNlNHq29MTdTr+6qF0kCLktPVvZ++mreh4nuzgxpH2moBRafT6M
         v9SUunzFZmzZz2+ZF8+CbACMhPE4bRWSVu5sWCg6m6MfTEK8UQDPa3WO04K+RLkAcVBf
         3MTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CtdcU9l/eHtmGbmVAGb3hipx1MyfPt8hYs/X++xA/Z0=;
        b=Y4zxQ5VB00UW0g6QX7TPYv4GpDlKQe+3YDPu1DIw1mkZ92Mo3qAJJFhY4CtMPK0x5M
         WjitYcJRqnFy9vqvZctlAfCO1HhCCiLsqlL+YFHzlSfEbiynAYrcI09FZ2sKRL/eqNE9
         O9phl6bANAjek3+3bh3GfAciCP3o8F5Swd50aF9mChLQilEY/bZiQ2p4zl9GI+ONQfZu
         t8G7kvlCRAelF5SnvSgWwk/f7hHQDFBD4+IGujbXDDyJVbU6ffaDZvQCsoj5ABytClcY
         bww6ZBXMnHBgoyfoohrHlAyTYDzMghMLxUMXT+ijvlHZ5mJiDwVQRe1qx09Vo3pc+GCg
         2wJg==
X-Gm-Message-State: AOAM532H62s7qxxjf4+vrPvHCq4mjcwnhhz4P0Zx9OFh6oR9zVh3s/bw
        wV1fwg7vK3TZYWV56WZonw4Asg==
X-Google-Smtp-Source: ABdhPJx2sMpmpPcUY0yXRX7INEvhJoOBK+SadoHUezaQq8ZRTfpqOrIOAL9cLBu8v6P+b1R6JS/R9w==
X-Received: by 2002:a05:6830:4b4:b0:606:1c6:9c1 with SMTP id l20-20020a05683004b400b0060601c609c1mr4066231otd.255.1651496523716;
        Mon, 02 May 2022 06:02:03 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id f9-20020a0568301c2900b0060603221247sm2814962ote.23.2022.05.02.06.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 06:02:03 -0700 (PDT)
Date:   Mon, 2 May 2022 06:03:50 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH v2 2/3] phy: qcom-qmp: fix reset-controller leak on probe
 errors
Message-ID: <Ym/Wtqjpdgaaf2tp@ripper>
References: <20220427063243.32576-1-johan+linaro@kernel.org>
 <20220427063243.32576-3-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427063243.32576-3-johan+linaro@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 26 Apr 23:32 PDT 2022, Johan Hovold wrote:

> Make sure to release the lane reset controller in case of a late probe
> error (e.g. probe deferral).
> 
> Note that due to the reset controller being defined in devicetree in
> "lane" child nodes, devm_reset_control_get_exclusive() cannot be used
> directly.
> 
> Fixes: e78f3d15e115 ("phy: qcom-qmp: new qmp phy driver for qcom-chipsets")
> Cc: stable@vger.kernel.org      # 4.12
> Cc: Vivek Gautam <vivek.gautam@codeaurora.org>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index a84f7d1fc9b7..3f77830921f5 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -6005,6 +6005,11 @@ static const struct phy_ops qcom_qmp_pcie_ufs_ops = {
>  	.owner		= THIS_MODULE,
>  };
>  
> +static void qcom_qmp_reset_control_put(void *data)
> +{
> +	reset_control_put(data);
> +}
> +
>  static
>  int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id,
>  			void __iomem *serdes, const struct qmp_phy_cfg *cfg)
> @@ -6099,6 +6104,10 @@ int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id,
>  			dev_err(dev, "failed to get lane%d reset\n", id);
>  			return PTR_ERR(qphy->lane_rst);
>  		}
> +		ret = devm_add_action_or_reset(dev, qcom_qmp_reset_control_put,
> +					       qphy->lane_rst);
> +		if (ret)
> +			return ret;
>  	}
>  
>  	if (cfg->type == PHY_TYPE_UFS || cfg->type == PHY_TYPE_PCIE)
> -- 
> 2.35.1
> 
