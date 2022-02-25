Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 086624C3EF4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Feb 2022 08:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238107AbiBYH0s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Feb 2022 02:26:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238083AbiBYH0r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Feb 2022 02:26:47 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EA9D254550
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 23:26:15 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id bx5so4081022pjb.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 23:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sJpiVWUtGJ1toTI22lBTbfejdWwjSpAkjXdT/oJlX68=;
        b=VkXvJvHWbBSHCoPEo4aSMInYMxICD5boQSdW7eVwiHfE/OH0V+8iUnrw8DLBpon7UZ
         5WLM6s77jLEr3D+IfsvsQ16/EZIUQghT7cW5MF4ATNb4WnJr610ZYmecWXJi535m+k3F
         SvW1DJ42wL4I5FUzfqRBP/SWStFV5T92Tuor2KPC+voyks6LSPpitedTwg3aITvZGdz2
         it1lTxTwNSvB7JPpIsPkyKf3Rw2GYiWdkqPO03Vz9GAGf61q6I88nXm0lGy9Du3ltPa3
         KNPyHoScqmU7ghMck3SJf11Qy5AVAlYXtUYK9+fWD1mYS6nUeyvu4fYIhJ2E8HiWaeyy
         iADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sJpiVWUtGJ1toTI22lBTbfejdWwjSpAkjXdT/oJlX68=;
        b=NJYPztnjKFxXzdu67nOR0xFXPTmVHww/O9YwrbYekIyU2ou4fbqB+4ZKq/I6JeTaBq
         zOfcvvhr4bgft2L4PTI/HcsakGnpXUIP+J9jpbxurtQn0HyU7dhonhb9dpeCMYEYvRYt
         /k4NP1gx+CrdCbuBhqD8lPn7qqi9WJgjYBOWi7DW4KTlWGiMstSGKYJ7d1SyjcOQBPum
         ALJ4g1YQ9qopcvOj3mOXjCg1reVbnIs3Isr/eIeINiJERd1Y/kL5r19WFRLmk8XDKtQr
         YBwpOrEfT7Ti6FvPOTHL/SWp74ZLUNcq5ah4XUE7MLC+WqsIZt3k9iGJ6/gWzDvWHKKM
         aWDg==
X-Gm-Message-State: AOAM531FGlI2QX3GEaUZ40HJ7qc0fc51Yy9PXjTrKMzwWfw489bqu9oU
        qs1uBw+qs+aHLHPY6uKkqGjg
X-Google-Smtp-Source: ABdhPJzap2PgLSv2mmmnlDYOEhoOwG726uf7EFnyz2n5bBiUAD5Vn+YQ91B1Nif1JvVNOC5Lbf7ZEA==
X-Received: by 2002:a17:90a:2849:b0:1bc:50a8:6970 with SMTP id p9-20020a17090a284900b001bc50a86970mr1922546pjf.193.1645773975145;
        Thu, 24 Feb 2022 23:26:15 -0800 (PST)
Received: from thinkpad ([220.158.159.240])
        by smtp.gmail.com with ESMTPSA id b3-20020a056a00114300b004cc39630bfcsm1843792pfm.207.2022.02.24.23.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 23:26:14 -0800 (PST)
Date:   Fri, 25 Feb 2022 12:56:09 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] clk: qcom: Add A7 PLL support for SDX65
Message-ID: <20220225072609.GB274289@thinkpad>
References: <1645505785-2271-1-git-send-email-quic_rohiagar@quicinc.com>
 <1645505785-2271-3-git-send-email-quic_rohiagar@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1645505785-2271-3-git-send-email-quic_rohiagar@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 22, 2022 at 10:26:22AM +0530, Rohit Agarwal wrote:
> Update A7 PLL Kconfig to reflect support for SDX65.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/clk/qcom/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 42c8741..5159a1d 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -29,11 +29,11 @@ config QCOM_A53PLL
>  	  devices.
>  
>  config QCOM_A7PLL
> -	tristate "SDX55 A7 PLL"
> +	tristate "A7 PLL driver for SDX55 and SDX65"
>  	help
> -	  Support for the A7 PLL on SDX55 devices. It provides the CPU with
> +	  Support for the A7 PLL on SDX55 and SDX65 devices. It provides the CPU with
>  	  frequencies above 1GHz.
> -	  Say Y if you want to support higher CPU frequencies on SDX55
> +	  Say Y if you want to support higher CPU frequencies on SDX55 and SDX65
>  	  devices.
>  
>  config QCOM_CLK_APCS_MSM8916
> -- 
> 2.7.4
> 
