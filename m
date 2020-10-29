Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4AC29E6C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 10:03:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbgJ2JDR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Oct 2020 05:03:17 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:22667 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726701AbgJ2JDD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Oct 2020 05:03:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603962181; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=NdzsoEdcRVXFcGy0mrVKMSKtPLAju5oVn97JEaJidDY=; b=UFiG3bObOZHOK8m0zEzeKPAsvdxJS6logyC4yEXYgi2q6U4gQkJMQ+CLZdLUI/L6KbA04kqL
 koGCg1/0Yl2Z1wcIVMFVq03+YuRzZzQDoB/GtBSgu9uM/HsNSw5QpTcNq0DEFPsDHGqCpAL9
 6+WXkORi4GlurE3o1SP6tGzy0wc=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f9a8545940cfd47f148cbe6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Oct 2020 09:03:01
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4CEA0C433CB; Thu, 29 Oct 2020 09:03:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.0.106] (unknown [49.204.180.142])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 06DA6C43382;
        Thu, 29 Oct 2020 09:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 06DA6C43382
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v5 2/2] clk: qcom: lpass-sc7180: Disentangle the two clock
 devices
To:     Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-soc@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201019154857.v5.1.I4567b5e7e17bbb15ef063d447cb83fd43746cb18@changeid>
 <20201019154857.v5.2.I75c409497d4dea9daefa53ec5f93824081c4ecbe@changeid>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <eb8b7d12-30fa-4a29-9adb-e1ad171e7dce@codeaurora.org>
Date:   Thu, 29 Oct 2020 14:32:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201019154857.v5.2.I75c409497d4dea9daefa53ec5f93824081c4ecbe@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reviewed-by: Taniya Das <tdas@codeaurora.org>

On 10/20/2020 4:19 AM, Douglas Anderson wrote:
> The sc7180 lpass clock driver manages two different devices.  These
> two devices were tangled together, using one probe and a lookup to
> figure out the real probe.  I think it's cleaner to really separate
> the probe for these two devices since they're really different things,
> just both managed by the same driver.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Note: this is now a 2-patch cleanup series with no actual bugfixes
> since the problem solved by patch #3 was better solved with:
> 
> https://lore.kernel.org/r/20201017020137.1251319-1-sboyd@kernel.org
> 
> Changes in v5:
> - Two blank lines inserted before "return" statements.
> 
> Changes in v3:
> - ("clk: qcom: lpass-sc7180: Disentangle the two clock devices") new for v3.
> 
>   drivers/clk/qcom/lpasscorecc-sc7180.c | 103 ++++++++++++++++----------
>   1 file changed, 64 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
> index 2d15e33ec837..1a3925badd7c 100644
> --- a/drivers/clk/qcom/lpasscorecc-sc7180.c
> +++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
> @@ -366,12 +366,39 @@ static void lpass_pm_clk_destroy(void *data)
>   	pm_clk_destroy(data);
>   }
>   
> +static int lpass_create_pm_clks(struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	pm_runtime_enable(&pdev->dev);
> +	ret = devm_add_action_or_reset(&pdev->dev, lpass_pm_runtime_disable, &pdev->dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = pm_clk_create(&pdev->dev);
> +	if (ret)
> +		return ret;
> +	ret = devm_add_action_or_reset(&pdev->dev, lpass_pm_clk_destroy, &pdev->dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = pm_clk_add(&pdev->dev, "iface");
> +	if (ret < 0)
> +		dev_err(&pdev->dev, "failed to acquire iface clock\n");
> +
> +	return ret;
> +}
> +
>   static int lpass_core_cc_sc7180_probe(struct platform_device *pdev)
>   {
>   	const struct qcom_cc_desc *desc;
>   	struct regmap *regmap;
>   	int ret;
>   
> +	ret = lpass_create_pm_clks(pdev);
> +	if (ret)
> +		return ret;
> +
>   	lpass_core_cc_sc7180_regmap_config.name = "lpass_audio_cc";
>   	desc = &lpass_audio_hm_sc7180_desc;
>   	ret = qcom_cc_probe_by_index(pdev, 1, desc);
> @@ -402,6 +429,11 @@ static int lpass_core_cc_sc7180_probe(struct platform_device *pdev)
>   static int lpass_hm_core_probe(struct platform_device *pdev)
>   {
>   	const struct qcom_cc_desc *desc;
> +	int ret;
> +
> +	ret = lpass_create_pm_clks(pdev);
> +	if (ret)
> +		return ret;
>   
>   	lpass_core_cc_sc7180_regmap_config.name = "lpass_hm_core";
>   	desc = &lpass_core_hm_sc7180_desc;
> @@ -409,55 +441,28 @@ static int lpass_hm_core_probe(struct platform_device *pdev)
>   	return qcom_cc_probe_by_index(pdev, 0, desc);
>   }
>   
> -static const struct of_device_id lpass_core_cc_sc7180_match_table[] = {
> +static const struct of_device_id lpass_hm_sc7180_match_table[] = {
>   	{
>   		.compatible = "qcom,sc7180-lpasshm",
> -		.data = lpass_hm_core_probe,
>   	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, lpass_hm_sc7180_match_table);
> +
> +static const struct of_device_id lpass_core_cc_sc7180_match_table[] = {
>   	{
>   		.compatible = "qcom,sc7180-lpasscorecc",
> -		.data = lpass_core_cc_sc7180_probe,
>   	},
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, lpass_core_cc_sc7180_match_table);
>   
> -static int lpass_core_sc7180_probe(struct platform_device *pdev)
> -{
> -	int (*clk_probe)(struct platform_device *p);
> -	int ret;
> -
> -	pm_runtime_enable(&pdev->dev);
> -	ret = devm_add_action_or_reset(&pdev->dev, lpass_pm_runtime_disable, &pdev->dev);
> -	if (ret)
> -		return ret;
> -
> -	ret = pm_clk_create(&pdev->dev);
> -	if (ret)
> -		return ret;
> -	ret = devm_add_action_or_reset(&pdev->dev, lpass_pm_clk_destroy, &pdev->dev);
> -	if (ret)
> -		return ret;
> -
> -	ret = pm_clk_add(&pdev->dev, "iface");
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "failed to acquire iface clock\n");
> -		return ret;
> -	}
> -
> -	clk_probe = of_device_get_match_data(&pdev->dev);
> -	if (!clk_probe)
> -		return -EINVAL;
> -
> -	return clk_probe(pdev);
> -}
> -
>   static const struct dev_pm_ops lpass_core_cc_pm_ops = {
>   	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
>   };
>   
>   static struct platform_driver lpass_core_cc_sc7180_driver = {
> -	.probe = lpass_core_sc7180_probe,
> +	.probe = lpass_core_cc_sc7180_probe,
>   	.driver = {
>   		.name = "lpass_core_cc-sc7180",
>   		.of_match_table = lpass_core_cc_sc7180_match_table,
> @@ -465,17 +470,37 @@ static struct platform_driver lpass_core_cc_sc7180_driver = {
>   	},
>   };
>   
> -static int __init lpass_core_cc_sc7180_init(void)
> +static const struct dev_pm_ops lpass_hm_pm_ops = {
> +	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
> +};
> +
> +static struct platform_driver lpass_hm_sc7180_driver = {
> +	.probe = lpass_hm_core_probe,
> +	.driver = {
> +		.name = "lpass_hm-sc7180",
> +		.of_match_table = lpass_hm_sc7180_match_table,
> +		.pm = &lpass_hm_pm_ops,
> +	},
> +};
> +
> +static int __init lpass_sc7180_init(void)
>   {
> -	return platform_driver_register(&lpass_core_cc_sc7180_driver);
> +	int ret;
> +
> +	ret = platform_driver_register(&lpass_core_cc_sc7180_driver);
> +	if (ret)
> +		return ret;
> +
> +	return platform_driver_register(&lpass_hm_sc7180_driver);
>   }
> -subsys_initcall(lpass_core_cc_sc7180_init);
> +subsys_initcall(lpass_sc7180_init);
>   
> -static void __exit lpass_core_cc_sc7180_exit(void)
> +static void __exit lpass_sc7180_exit(void)
>   {
> +	platform_driver_unregister(&lpass_hm_sc7180_driver);
>   	platform_driver_unregister(&lpass_core_cc_sc7180_driver);
>   }
> -module_exit(lpass_core_cc_sc7180_exit);
> +module_exit(lpass_sc7180_exit);
>   
>   MODULE_DESCRIPTION("QTI LPASS_CORE_CC SC7180 Driver");
>   MODULE_LICENSE("GPL v2");
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
