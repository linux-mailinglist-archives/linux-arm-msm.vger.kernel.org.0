Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13FD34BD588
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Feb 2022 06:45:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242205AbiBUFlO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Feb 2022 00:41:14 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:59558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235498AbiBUFlN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Feb 2022 00:41:13 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 705104AE2B
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Feb 2022 21:40:51 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id q8-20020a17090a178800b001bc299b8de1so2770532pja.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Feb 2022 21:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IaYk0/7MCZS2WivmuGCsvre1k3PlmI9ZSnYN3jlruDA=;
        b=mtDdWUx7cHaFVR3YSjzA8M74X5/BI99pC5C3bqdO4v4LMhYYovmviuR+BcU+E+yuUc
         k83y89b+9ZNGcnpN761qDCzm+cLkZLz4v27sf9BKyAbK7BbuPinpypWjWkn553lfVbbP
         DRET8nrGfewlEqTiPW1NitgcH86ywianPHsA9Fg36M/LN8BS2dfV1Ft7neOayfq8aqo5
         S5qxA3p31YCBHDG/HGbKLTnPKW2yX/Kvytrxd3rcqzAtfsalo18hAhUlDStunpVSvOOr
         7L31fGYvp1UL1DU1iYhyFXku9Z72srT4Nbc6agiRcjh3DCJKYdeUCakCW3QSec6g18Yh
         0buA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IaYk0/7MCZS2WivmuGCsvre1k3PlmI9ZSnYN3jlruDA=;
        b=kusQZqwfY34Semn1Pbt3D8vioLy4inzDQ6S5XmL2XMBF8j2pq1IJMd0zAGcG8TtOcL
         uMs6SqBYG/DORG+1TDWgmCJAD1vGYdVyfvjO+xYfKxXl9ceLYRHV8XXjpVKzDvF6aNIA
         VcKRr3QiCR5AKg+ySMi5FRJgD/DkMZWk5Eqz6xkzKfAWq131QRtBll5xSJQGc2sM2zro
         3ur3xhKkbenVrr8n+aHqy/24r7JfBDu31t0XmODMSAXnB6BA/n6eavboZa2qZIbC6/gt
         62L50oBQPH+sS+gWN2S8qhpHgJS8DUcdK0rFWOtNp9cp0W68WLfBYxLvaMbWWzm9jpnx
         vpXw==
X-Gm-Message-State: AOAM530QUPp4MNbszbn263vjErqtGTPte1vcTZk1NYHfPYJynurn2gfy
        YtBEMbLTfBRP80XiFwvQlQ2f
X-Google-Smtp-Source: ABdhPJxyJfwFCp1kl1AFx8zZBW1DVRgmS1pydQJuMyELNybiIrdZZrXTyxPgufASVxJNUErxYB55gA==
X-Received: by 2002:a17:90a:bb8e:b0:1b9:256c:6c3 with SMTP id v14-20020a17090abb8e00b001b9256c06c3mr20023954pjr.16.1645422050950;
        Sun, 20 Feb 2022 21:40:50 -0800 (PST)
Received: from thinkpad ([220.158.158.223])
        by smtp.gmail.com with ESMTPSA id v3-20020a17090abb8300b001bc0740c35dsm5283533pjr.18.2022.02.20.21.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 21:40:50 -0800 (PST)
Date:   Mon, 21 Feb 2022 11:10:45 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/7] clk: qcom: Add A7 PLL support for SDX65
Message-ID: <20220221054045.GC15108@thinkpad>
References: <1645420953-21176-1-git-send-email-quic_rohiagar@quicinc.com>
 <1645420953-21176-5-git-send-email-quic_rohiagar@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1645420953-21176-5-git-send-email-quic_rohiagar@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 21, 2022 at 10:52:30AM +0530, Rohit Agarwal wrote:
> Add support for PLL found in Qualcomm SDX65 platforms which is used to
> provide clock to the Cortex A7 CPU via a mux. This PLL can provide high
> frequency clock to the CPU above 1GHz as compared to the other sources
> like GPLL0.
> 
> In this driver, the power domain is attached to the cpudev. This is
> required for CPUFreq functionality and there seems to be no better place
> to do other than this driver (no dedicated CPUFreq driver).
> 

This tells what the driver is doing but not essentially what this patch does
i.e., you need to mention how the SDX65 PLL is added to the driver. Since you
are reusing the existing driver, this needs to be mentioned.

> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig  | 6 +++---
>  drivers/clk/qcom/a7-pll.c | 1 +
>  2 files changed, 4 insertions(+), 3 deletions(-)
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
> diff --git a/drivers/clk/qcom/a7-pll.c b/drivers/clk/qcom/a7-pll.c
> index c4a53e5..adb2121 100644
> --- a/drivers/clk/qcom/a7-pll.c
> +++ b/drivers/clk/qcom/a7-pll.c
> @@ -84,6 +84,7 @@ static int qcom_a7pll_probe(struct platform_device *pdev)
>  
>  static const struct of_device_id qcom_a7pll_match_table[] = {
>  	{ .compatible = "qcom,sdx55-a7pll" },
> +	{ .compatible = "qcom,sdx65-a7pll" },

I think here also you can just reuse the "qcom,sdx55-a7pll" compatible.

Thanks,
Mani

>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, qcom_a7pll_match_table);
> -- 
> 2.7.4
> 
