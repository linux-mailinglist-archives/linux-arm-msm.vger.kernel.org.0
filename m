Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B12D28E542
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 19:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgJNRW3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 13:22:29 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:36201 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728912AbgJNRW3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 13:22:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602696148; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=/WiCKZgABcCtQ7yaRnJzgeqNLWkv78uh7AEEZ3EoiUI=; b=WWBVnXBVKWXafrd3kTel4O9bhK2iE0HM/LGH+hpm72TTIZ83yQT2Rxq/h9pXeR/SLypAIqzY
 +9yjKFQMuxyBZSJKko7WkPlpKIG9UFlWRNHf/Lwtpa14XztC7kJxsmNGeIphr0Tjg0w9GCrV
 K1CXYKP8SnJXqtPpshvA2p4ehgs=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f8733a2aad2c3cd1c499bf3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 14 Oct 2020 17:21:37
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2FB44C43385; Wed, 14 Oct 2020 17:21:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.0.102] (unknown [49.204.181.141])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 418FCC433C9;
        Wed, 14 Oct 2020 17:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 418FCC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v2] clk: qcom: lpasscc: Re-configure the PLL in case lost
To:     Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-soc@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201014085758.v2.1.Id0cc5d859e2422082a29a7909658932c857f5a81@changeid>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <711a8178-dcf7-d541-a468-ac34d6d14bb1@codeaurora.org>
Date:   Wed, 14 Oct 2020 22:51:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201014085758.v2.1.Id0cc5d859e2422082a29a7909658932c857f5a81@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Doug for the patch.

On 10/14/2020 9:28 PM, Douglas Anderson wrote:
> From: Taniya Das <tdas@codeaurora.org>
> 
> In the case where the PLL configuration is lost, then the pm runtime
> resume will reconfigure before usage.
> 
> Fixes: edab812d802d ("clk: qcom: lpass: Add support for LPASS clock controller for SC7180")
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I took the liberty of fixing my own nits that I had with Taniya's
> patch, AKA:
> 
> https://lore.kernel.org/r/1602614008-2421-2-git-send-email-tdas@codeaurora.org
> 
> Changes in v2:
> - Don't needlessly have a 2nd copy of dev_pm_ops and jam it in.
> - Check the return value of pm_clk_resume()
> - l_val should be unsigned int.
> 
>   drivers/clk/qcom/lpasscorecc-sc7180.c | 23 ++++++++++++++++++++++-
>   1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
> index 228d08f5d26f..ee23eb5b9bf2 100644
> --- a/drivers/clk/qcom/lpasscorecc-sc7180.c
> +++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
> @@ -356,6 +356,25 @@ static const struct qcom_cc_desc lpass_audio_hm_sc7180_desc = {
>   	.num_gdscs = ARRAY_SIZE(lpass_audio_hm_sc7180_gdscs),
>   };
>   
> +static int lpass_core_cc_pm_clk_resume(struct device *dev)
> +{
> +	struct regmap *regmap = dev_get_drvdata(dev);
> +	unsigned int l_val;
> +	int ret;
> +
> +	ret = pm_clk_resume(dev);
> +	if (ret)
> +		return ret;
> +
> +	/* Read PLL_L_VAL */
> +	regmap_read(regmap, 0x1004, &l_val);
> +	if (!l_val)
> +		clk_fabia_pll_configure(&lpass_lpaaudio_dig_pll, regmap,
> +				&lpass_lpaaudio_dig_pll_config);
> +
> +	return 0;
> +}
> +
>   static int lpass_core_cc_sc7180_probe(struct platform_device *pdev)
>   {
>   	const struct qcom_cc_desc *desc;
> @@ -373,6 +392,8 @@ static int lpass_core_cc_sc7180_probe(struct platform_device *pdev)
>   	if (IS_ERR(regmap))
>   		return PTR_ERR(regmap);
>   
> +	dev_set_drvdata(&pdev->dev, regmap);
> +
>   	/*
>   	 * Keep the CLK always-ON
>   	 * LPASS_AUDIO_CORE_SYSNOC_SWAY_CORE_CLK
> @@ -449,7 +470,7 @@ static int lpass_core_sc7180_probe(struct platform_device *pdev)
>   }
>   
>   static const struct dev_pm_ops lpass_core_cc_pm_ops = {
> -	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
> +	SET_RUNTIME_PM_OPS(pm_clk_suspend, lpass_core_cc_pm_clk_resume, NULL)

There are two devices and "lpass_hm_core" and the PLL is not part of the 
HM_CORE, thus was the reason to separate out the pm_ops.

>   };
>   
>   static struct platform_driver lpass_core_cc_sc7180_driver = {
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
