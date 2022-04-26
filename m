Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D26B8510CBE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Apr 2022 01:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355264AbiDZXiG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 19:38:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349182AbiDZXiF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 19:38:05 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4B5E6A43D
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 16:34:56 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-e93bbb54f9so262440fac.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 16:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rqUfSOGZ1teIwHlqjTqKW5qefctpAygnKO2drKsH9dI=;
        b=D/qioClAQ+KU8gvRilbYlhEYHKiT+0H/WIBXw23GyCqUBT5D8fmk9R1OIc44TEA7js
         +LJywEt/aWtxDDGmaIb3x7OIM9HUv4+VQCyEeqSNT3F9YE2mgLgWg6InNomvU/TLopSj
         SPjIXyKBWIW+4Pe3DeDI3Y01BJlrBk79IPWZmRFqwmC3rPlB0eiLtSEBBUrueNP3krfd
         GsXNnOCv1ouynGD/puxrVQzOADywScBxVEXDVOp35gElrUGBKctk4MTsxyXLlwt9RSfb
         YLeojdMQg5/efwjxkeMR2EADPGvVf5NrUJgSFqU0870iNFTTEF0O21XVoVCBFHEDoZVn
         HBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rqUfSOGZ1teIwHlqjTqKW5qefctpAygnKO2drKsH9dI=;
        b=8BW9zXhOArjqGUt9RXH/KuyFI6e3rJlXbWo4CFUT98lO14rQ/QIobns04jKKBTM3Vk
         KAQn4XoAueeWHagltTC6yiEZeAdPEkJd9btXqWnhaf33zHUFlFa6dCNTAiabgQKnwhWc
         vq/ImClLfv9MEOOifMOpk67bLPMen/bmca1o2TrwNGRZmZKsZfTUILbQ1TZ3ymqiswqR
         8/QHAdywYS3dit/OXZTxiTFjJUgVCloYGd4DvKHPBVTIsLCzlTxiA2Jpdz3B4FepXgpn
         zms3FgF+XppGycu55B43UbNC6mtyE7F3p/uJsN3Vn83WnqnqNfnXqC1VHCjWu1iL2L7r
         ak7Q==
X-Gm-Message-State: AOAM5330PYxjKjXcehrifIjsOWSjR0V0xmXGJ23ZDJik52FnCGvUFIgc
        I11wsyr3UjCDkSrrXk244Mf15g==
X-Google-Smtp-Source: ABdhPJwVdqnpXywCFOoorgAPIFV29CT0TZAoi/FfYZqaI//R10zdLuGPYfllUCuqMHyeD6k33aytKw==
X-Received: by 2002:a05:6870:d5a2:b0:de:f682:6c4d with SMTP id u34-20020a056870d5a200b000def6826c4dmr10417337oao.283.1651016095986;
        Tue, 26 Apr 2022 16:34:55 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id t22-20020a056870e75600b000e915a9121csm1341699oak.52.2022.04.26.16.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 16:34:55 -0700 (PDT)
Date:   Tue, 26 Apr 2022 16:36:51 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH 1/2] phy: qcom-qmp: fix struct clk leak on probe errors
Message-ID: <YmiCE35hvUzQW2Bc@ripper>
References: <20220422130941.2044-1-johan+linaro@kernel.org>
 <20220422130941.2044-2-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422130941.2044-2-johan+linaro@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 22 Apr 06:09 PDT 2022, Johan Hovold wrote:

> Make sure to release the pipe clock reference in case of a late probe
> error (e.g. probe deferral).
> 
> Fixes: e78f3d15e115 ("phy: qcom-qmp: new qmp phy driver for qcom-chipsets")
> Cc: stable@vger.kernel.org      # 4.12
> Cc: Vivek Gautam <vivek.gautam@codeaurora.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 7d2d1ab061f7..a84f7d1fc9b7 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -6077,7 +6077,7 @@ int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id,
>  	 * all phys that don't need this.
>  	 */
>  	snprintf(prop_name, sizeof(prop_name), "pipe%d", id);
> -	qphy->pipe_clk = of_clk_get_by_name(np, prop_name);
> +	qphy->pipe_clk = devm_get_clk_from_child(dev, np, prop_name);
>  	if (IS_ERR(qphy->pipe_clk)) {
>  		if (cfg->type == PHY_TYPE_PCIE ||
>  		    cfg->type == PHY_TYPE_USB3) {
> -- 
> 2.35.1
> 
