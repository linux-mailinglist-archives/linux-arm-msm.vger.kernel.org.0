Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F00F75DDC2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jul 2023 19:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbjGVRZe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 22 Jul 2023 13:25:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbjGVRZd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 22 Jul 2023 13:25:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3283CB3
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jul 2023 10:25:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B928E60B96
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jul 2023 17:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E370C433C8;
        Sat, 22 Jul 2023 17:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690046730;
        bh=/vRI6BECfRAd9vqEQJECAVCAiNDdtKYAD8gNyCE94Ug=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wq9gqdOg8ASRe/Y+IhBLODaIPzY+vDchsnKSUZ+EN03alvO+2hoPxR2x1ChSlX5Z+
         aL1/sVVsI/sYCBSffvLSgd05zDPDs5tp0+KAvAcVr5On8KmshV7DCrB9flQKMhOgtm
         vwGa0MdUWIyRriujNah/rMkJPkIRcW8O9R+FlUpBYhNycCPH/PqWpefhmuNdx9LuLF
         QTSXxJ+Ozv2IDo3PaQqvIFR3AjljtYx37ai51nmaRH2TDlBKrNe4AsvMGTmDNfp8ip
         lrll2/3cqEMGZj9sTxlklRIZWna73yIdytAtEZ1wvivvU1fXifn0m6sjLYr5uY4ER4
         ytRGAkZUXzTQg==
Date:   Sat, 22 Jul 2023 10:28:48 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Yuanjun Gong <ruc_gongyuanjun@163.com>
Cc:     quic_bjorande@quicinc.com, agross@kernel.org,
        konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        vkoul@kernel.org
Subject: Re: [PATCH v2 1/1] Soundwire: fix the return value checks of
 clk_prepare_enable()
Message-ID: <ifwveelccyycyb4jglyehhgdstoiflq666obqhswpprzliw6a7@thawh5jjctbv>
References: <20230721034540.GA1428172@hu-bjorande-lv.qualcomm.com>
 <20230722132419.37197-1-ruc_gongyuanjun@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230722132419.37197-1-ruc_gongyuanjun@163.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jul 22, 2023 at 09:24:19PM +0800, Yuanjun Gong wrote:
> in qcom_swrm_probe() and swrm_runtime_resume(), the return value
> of function clk_prepare_enable() should be checked, since it may
>  fail.
> 
> Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
> ---
>  drivers/soundwire/qcom.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 7970fdb27ba0..cf1e13a35023 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -1555,7 +1555,9 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  		goto err_init;
>  	}
>  
> -	clk_prepare_enable(ctrl->hclk);
> +	ret = clk_prepare_enable(ctrl->hclk);
> +	if (ret)
> +		goto err_init;

FWIW, this is correct.

>  
>  	ctrl->dev = dev;
>  	dev_set_drvdata(&pdev->dev, ctrl);
> @@ -1673,7 +1675,9 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
>  			disable_irq_nosync(ctrl->wake_irq);
>  	}
>  
> -	clk_prepare_enable(ctrl->hclk);
> +	ret = clk_prepare_enable(ctrl->hclk);
> +	if (ret)
> +		return ret;

On the lines above this the wakeup IRQ is disabled, if you return here
without re-enabling that, this device will no longer be able to
wake the system up.

The significance of the ordering here (and the irq handler also
disabling of the irq) is a little bit unclear to me, so I'd like to hear
what Vinod and Srinivas has to say, before you send another version.

Regards,
Bjorn
