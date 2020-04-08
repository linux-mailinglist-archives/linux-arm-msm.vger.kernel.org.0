Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE351A1E13
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 11:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727891AbgDHJeB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 05:34:01 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:37647 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbgDHJeB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 05:34:01 -0400
Received: by mail-ed1-f65.google.com with SMTP id de14so7725462edb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2020 02:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2DcDCqVTMNKY36u7MJYqn6b1kTHpvPZvtfUjgMB5f78=;
        b=o0kCQLSe8hPzdMWV/tWqDPpSlFvGtfh90ZpeXmkO0FyuwoAJ3NlN6hp+7w6B8BH/lp
         bTEOZqY7Ppqh4k+lHuzu906S+jIwAUyLWo1KgNN6wCamQBL1Mf8HqEx4FPXFHQ6SZfnw
         RLMBK11vc0TnqC5WvGjKNncn//L3GsaB60/bVSfr28cECkHAeCmpk0jjmAdtVqPwatlc
         HuegGxb/9dBHI2UQxiR7hLT1fInU9oKdZCz5gUArUMMf8aG2bLy5u5ED+tqFPbB1mDC4
         3V++g+/351GY/sppMKEmEJ6MHzXPuDggjgihKaUjAsQfiCpIMwBLEhXavVQ9h7Hlv8bY
         QTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2DcDCqVTMNKY36u7MJYqn6b1kTHpvPZvtfUjgMB5f78=;
        b=VyzCSAU29RlUVKoIWIMcappkEA8B9kom63XWxlVAj9mKIZTGjhGi28dV9Gg4B4ySUD
         T8hwp/Mi2T8oyFI+NoGdYMwtu1m4E/NzZeDXLVOJrtYThI5d2VbSCny9klAstyIgu4rg
         OnyoZNMISCmgw315innE4ReZrkw9fmIMHU1o15EP1DvZpT3P1FtjIaNI3UKEKzCZpWnB
         6N5mVGivkzPB9aINdnmD9D2frrLhE1gDQuvCoW8eCb7srsHAhEEuBxPmL8RIO5DBj1P4
         5CooSyeC8N/814S3Im+rvUzN4oK3C164afZaN3JBlZ824UesnZeafvEej40RhXry/yX0
         yqhQ==
X-Gm-Message-State: AGi0Pub6ddGa+h+6Z6tcEV6sE/8gSvSZbvqF2OP07CRV6ZA/ML9YK6QF
        5wD1Xi9YVZ5XxHpTtOR9a5elxw==
X-Google-Smtp-Source: APiQypK04DWarWU6cpyNyVMM+K5cRWTwR+acaaY4DEgmkJh+93LkW9IEAUSoGuHYohu74J26GyLicg==
X-Received: by 2002:a17:906:6d45:: with SMTP id a5mr5813396ejt.212.1586338437971;
        Wed, 08 Apr 2020 02:33:57 -0700 (PDT)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id ch5sm427994ejb.60.2020.04.08.02.33.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2020 02:33:57 -0700 (PDT)
Subject: Re: [PATCH] phy: qualcomm: usb-hs-28nm: Prepare clocks in init
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Shawn Guo <shawn.guo@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200408012854.3070187-1-bjorn.andersson@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <5ce82a89-5235-0a07-aa0a-7d41f72acaaa@linaro.org>
Date:   Wed, 8 Apr 2020 10:34:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200408012854.3070187-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/04/2020 02:28, Bjorn Andersson wrote:
> The AHB clock must be on for qcom_snps_hsphy_init() to be able to write
> the initialization sequence to the hardware, so move the clock
> enablement to phy init and exit.
> 
> Fixes: 67b27dbeac4d ("phy: qualcomm: Add Synopsys 28nm Hi-Speed USB PHY driver")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c | 32 ++++++++++++++-------
>   1 file changed, 21 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c b/drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c
> index d998e65c89c8..a52a9bf13b75 100644
> --- a/drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c
> +++ b/drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c
> @@ -160,18 +160,11 @@ static int qcom_snps_hsphy_power_on(struct phy *phy)
>   	ret = regulator_bulk_enable(VREG_NUM, priv->vregs);
>   	if (ret)
>   		return ret;
> -	ret = clk_bulk_prepare_enable(priv->num_clks, priv->clks);
> -	if (ret)
> -		goto err_disable_regulator;
> +
>   	qcom_snps_hsphy_disable_hv_interrupts(priv);
>   	qcom_snps_hsphy_exit_retention(priv);
>   
>   	return 0;
> -
> -err_disable_regulator:
> -	regulator_bulk_disable(VREG_NUM, priv->vregs);
> -
> -	return ret;
>   }
>   
>   static int qcom_snps_hsphy_power_off(struct phy *phy)
> @@ -180,7 +173,6 @@ static int qcom_snps_hsphy_power_off(struct phy *phy)
>   
>   	qcom_snps_hsphy_enter_retention(priv);
>   	qcom_snps_hsphy_enable_hv_interrupts(priv);
> -	clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
>   	regulator_bulk_disable(VREG_NUM, priv->vregs);
>   
>   	return 0;
> @@ -266,21 +258,39 @@ static int qcom_snps_hsphy_init(struct phy *phy)
>   	struct hsphy_priv *priv = phy_get_drvdata(phy);
>   	int ret;
>   
> -	ret = qcom_snps_hsphy_reset(priv);
> +	ret = clk_bulk_prepare_enable(priv->num_clks, priv->clks);
>   	if (ret)
>   		return ret;
>   
> +	ret = qcom_snps_hsphy_reset(priv);
> +	if (ret)
> +		goto disable_clocks;
> +
>   	qcom_snps_hsphy_init_sequence(priv);
>   
>   	ret = qcom_snps_hsphy_por_reset(priv);
>   	if (ret)
> -		return ret;
> +		goto disable_clocks;
> +
> +	return 0;
> +
> +disable_clocks:
> +	clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
> +	return ret;
> +}
> +
> +static int qcom_snps_hsphy_exit(struct phy *phy)
> +{
> +	struct hsphy_priv *priv = phy_get_drvdata(phy);
> +
> +	clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
>   
>   	return 0;
>   }
>   
>   static const struct phy_ops qcom_snps_hsphy_ops = {
>   	.init = qcom_snps_hsphy_init,
> +	.exit = qcom_snps_hsphy_exit,
>   	.power_on = qcom_snps_hsphy_power_on,
>   	.power_off = qcom_snps_hsphy_power_off,
>   	.set_mode = qcom_snps_hsphy_set_mode,
> 

Makes sense to me

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
