Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 744A929E6C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 10:03:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbgJ2JDS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Oct 2020 05:03:18 -0400
Received: from z5.mailgun.us ([104.130.96.5]:63407 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725779AbgJ2JDE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Oct 2020 05:03:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603962183; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=CUvnuWSKi9PCx3N72+GuDLIdwCG/3Z4EmE/ayIx4xow=; b=VuFzfH/XoVZBQuVJUDg+SIaMraGVsBjycCKFr05h2+8G62bXnjcrenuYCX8ojZQbRFqLagh4
 6lpggLWoir+zWihNSCpVzcnJwPqNNM2MrSrLeeqddvdAAMR5ZPGRddyp9ZzIn+CKK/4JXh2S
 47RP7yZP62Mwwb6bE0TkwS45WD4=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f9a851f940cfd47f1488951 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Oct 2020 09:02:23
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AFAD2C4339C; Thu, 29 Oct 2020 09:02:23 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 56DD3C433FF;
        Thu, 29 Oct 2020 09:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 56DD3C433FF
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v5 1/2] clk: qcom: lpasscc-sc7810: Use devm in probe
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
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <669a0546-f6d9-6b68-207f-eb75832041fa@codeaurora.org>
Date:   Thu, 29 Oct 2020 14:32:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201019154857.v5.1.I4567b5e7e17bbb15ef063d447cb83fd43746cb18@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reviewed-by: Taniya Das <tdas@codeaurora.org>

On 10/20/2020 4:19 AM, Douglas Anderson wrote:
> Let's convert the lpass clock control driver to use devm.  This is a
> few more lines of code, but it will be useful in a later patch which
> disentangles the two devices handled by this driver.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v4)
> 
> Changes in v4:
> - Fixed typo lapss => lpass
> - Moved lpass_pm_runtime_disable() lpass_pm_clk_destroy() in file.
> 
> Changes in v3:
> - ("clk: qcom: lpasscc-sc7810: Use devm in probe") new for v3.
> 
>   drivers/clk/qcom/lpasscorecc-sc7180.c | 38 +++++++++++++++------------
>   1 file changed, 21 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
> index 228d08f5d26f..2d15e33ec837 100644
> --- a/drivers/clk/qcom/lpasscorecc-sc7180.c
> +++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
> @@ -356,6 +356,16 @@ static const struct qcom_cc_desc lpass_audio_hm_sc7180_desc = {
>   	.num_gdscs = ARRAY_SIZE(lpass_audio_hm_sc7180_gdscs),
>   };
>   
> +static void lpass_pm_runtime_disable(void *data)
> +{
> +	pm_runtime_disable(data);
> +}
> +
> +static void lpass_pm_clk_destroy(void *data)
> +{
> +	pm_clk_destroy(data);
> +}
> +
>   static int lpass_core_cc_sc7180_probe(struct platform_device *pdev)
>   {
>   	const struct qcom_cc_desc *desc;
> @@ -418,34 +428,28 @@ static int lpass_core_sc7180_probe(struct platform_device *pdev)
>   	int ret;
>   
>   	pm_runtime_enable(&pdev->dev);
> +	ret = devm_add_action_or_reset(&pdev->dev, lpass_pm_runtime_disable, &pdev->dev);
> +	if (ret)
> +		return ret;
> +
>   	ret = pm_clk_create(&pdev->dev);
>   	if (ret)
> -		goto disable_pm_runtime;
> +		return ret;
> +	ret = devm_add_action_or_reset(&pdev->dev, lpass_pm_clk_destroy, &pdev->dev);
> +	if (ret)
> +		return ret;
>   
>   	ret = pm_clk_add(&pdev->dev, "iface");
>   	if (ret < 0) {
>   		dev_err(&pdev->dev, "failed to acquire iface clock\n");
> -		goto destroy_pm_clk;
> +		return ret;
>   	}
>   
> -	ret = -EINVAL;
>   	clk_probe = of_device_get_match_data(&pdev->dev);
>   	if (!clk_probe)
> -		goto destroy_pm_clk;
> -
> -	ret = clk_probe(pdev);
> -	if (ret)
> -		goto destroy_pm_clk;
> -
> -	return 0;
> -
> -destroy_pm_clk:
> -	pm_clk_destroy(&pdev->dev);
> -
> -disable_pm_runtime:
> -	pm_runtime_disable(&pdev->dev);
> +		return -EINVAL;
>   
> -	return ret;
> +	return clk_probe(pdev);
>   }
>   
>   static const struct dev_pm_ops lpass_core_cc_pm_ops = {
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
