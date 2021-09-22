Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E579D414D8F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Sep 2021 17:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236417AbhIVP6d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 11:58:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236321AbhIVP6c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 11:58:32 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5DF7C061756
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Sep 2021 08:57:02 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id z11so5163212oih.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Sep 2021 08:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0TAuSYSSwu/GJwA4DB4HqE/mrXxipFRUmjMtx5UU3rs=;
        b=gUEgEvaooaC3Rqh2GLU31XmPoOzYuWuJ5Sskb5tB+AyYzFiBzKMOeflVscMCBcY1Fl
         ju4OLLHyp3bwd30OyerZmpR+u0dUZRIu0Y34lwrr5Uh9kDnToaBe9A/XTbnmVA+LfoLF
         LqkjgdBABCmepohEHtTWyqKYnA74b5OxF02h+k9pAbZzBJxBcdMUZ7NQFQ6EZx7T65S7
         VrSnKx14kLZfB/kF7RKGE5AQwbFMAZwk3N2hJAx9UP60+eU+fewj7X0gw/thRMWpCtVc
         C2YMi6+HOqMbcloLdcjFCpy3nbB/dPqIhULDDCVR8vLOw7dUzW4HV3167+SKn8I9pmfm
         aVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0TAuSYSSwu/GJwA4DB4HqE/mrXxipFRUmjMtx5UU3rs=;
        b=b0Hjr0u1N9rsgIMOnKDRJK9z6esWusELtRgYQ72XKC1DrqPMwlP1ftY2/zV2q94kUu
         q2nBMAOpRy5u2KTCPZWmobyC9/k7fK0oFGxzWeukd4KDhUxhhrFQibk5k68cI9kqQBK8
         OOiRIO7w+SQf75bfKghJBjZrscXokZDCc4HtH6ix4RuaF8Qx7WDVC+Hz2K+ijNCUh4Q7
         RmljXfyQsGFaoBwUqoK7IrXQdZkHCTA6XHba8HGN5P+ISCLL2bXyWbvjV0Hp/xIZfIWj
         Z/ReR/UNZEXRdbxZhasfNDPhDwlJxdAvbP5SjsvApnaK+lro92RLVCyBHtsMaOUnEsgm
         /SIw==
X-Gm-Message-State: AOAM5310UNRKwJLISYnvIdw8NnHMTgTJw8wToIHPvcOh73cGZZoQQr4S
        phnKXehSfieP2BVqC3WR49CpuF3G2giV8g==
X-Google-Smtp-Source: ABdhPJyB18sOla8PLG9hVwSLx4QL3NM8iJZfOnWgcu4HPxyrEyR7I/xU53vMEQ92DIrG/nMnOtESyg==
X-Received: by 2002:aca:5cc3:: with SMTP id q186mr8558866oib.17.1632326222200;
        Wed, 22 Sep 2021 08:57:02 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h17sm613189ooc.18.2021.09.22.08.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 08:57:01 -0700 (PDT)
Date:   Wed, 22 Sep 2021 08:57:43 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom-qmp: Make use of the helper function
 devm_add_action_or_reset()
Message-ID: <YUtSd7QxkSC0vPAa@ripper>
References: <20210922130017.692-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210922130017.692-1-caihuoqing@baidu.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 22 Sep 06:00 PDT 2021, Cai Huoqing wrote:

> The helper function devm_add_action_or_reset() will internally
> call devm_add_action(), and gif devm_add_action() fails then it will
> execute the action mentioned and return the error code. So
> use devm_add_action_or_reset() instead of devm_add_action()
> to simplify the error handling, reduce the code.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index f14032170b1c..084e3d96264e 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -5154,11 +5154,7 @@ static int phy_pipe_clk_register(struct qcom_qmp *qmp, struct device_node *np)
>  	 * Roll a devm action because the clock provider is the child node, but
>  	 * the child node is not actually a device.
>  	 */
> -	ret = devm_add_action(qmp->dev, phy_clk_release_provider, np);
> -	if (ret)
> -		phy_clk_release_provider(np);
> -
> -	return ret;
> +	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
>  }
>  
>  /*
> @@ -5350,11 +5346,7 @@ static int phy_dp_clks_register(struct qcom_qmp *qmp, struct qmp_phy *qphy,
>  	 * Roll a devm action because the clock provider is the child node, but
>  	 * the child node is not actually a device.
>  	 */
> -	ret = devm_add_action(qmp->dev, phy_clk_release_provider, np);
> -	if (ret)
> -		phy_clk_release_provider(np);
> -
> -	return ret;
> +	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
>  }
>  
>  static const struct phy_ops qcom_qmp_phy_gen_ops = {
> -- 
> 2.25.1
> 
