Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3208290B7E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 20:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392565AbgJPSkz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 14:40:55 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:16183 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392566AbgJPSkx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 14:40:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602873653; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=c2o5YCIQjDVjgBCRa4wpxtljkpoQ6dNVLnRmNfQugqI=; b=ILFhcXPvhQPr5LhM/DjH3TYPPGMIzl2rQz8RzuWygh3zB0YE5H2R7kUlEYc/jrdJ9ra981XN
 wcEg9LdQWQpljlysmBwPUN/ktUXQsE0geFhh/rtIHA52xRYhN+LjxTAbs4SwLpzurPDH2WjB
 jGG8VQzImpkGz0uZ3rm12A+wurs=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f89e9340764f13b00627de1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Oct 2020 18:40:52
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6B7A3C433F1; Fri, 16 Oct 2020 18:40:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.0.105] (unknown [49.204.183.234])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AF45CC433C9;
        Fri, 16 Oct 2020 18:40:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AF45CC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v2 3/3] clk: qcom: camcc: Add camera clock controller
 driver for SC7180
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org
References: <1602609110-11504-1-git-send-email-tdas@codeaurora.org>
 <1602609110-11504-4-git-send-email-tdas@codeaurora.org>
 <160264075146.310579.8765964662995263828@swboyd.mtv.corp.google.com>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <9c9c374c-3c4f-f2d4-93e6-751176e8d493@codeaurora.org>
Date:   Sat, 17 Oct 2020 00:10:45 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <160264075146.310579.8765964662995263828@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks for your review Stephen.

On 10/14/2020 7:29 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2020-10-13 10:11:50)
>> diff --git a/drivers/clk/qcom/camcc-sc7180.c b/drivers/clk/qcom/camcc-sc7180.c
>> new file mode 100644
>> index 0000000..e954d21
>> --- /dev/null
>> +++ b/drivers/clk/qcom/camcc-sc7180.c
>> @@ -0,0 +1,1737 @@
> [...]
>> +
>> +enum {
>> +       P_BI_TCXO,
>> +       P_CAM_CC_PLL0_OUT_EVEN,
>> +       P_CAM_CC_PLL1_OUT_EVEN,
>> +       P_CAM_CC_PLL2_OUT_AUX,
>> +       P_CAM_CC_PLL2_OUT_EARLY,
>> +       P_CAM_CC_PLL3_OUT_MAIN,
>> +       P_CORE_BI_PLL_TEST_SE,
>> +};
>> +
>> +static struct pll_vco agera_vco[] = {
> 
> Can this be const?
> 
>> +       { 600000000, 3300000000, 0 },
>> +};
>> +
>> +static struct pll_vco fabia_vco[] = {
> 
> Can this be const?
> 
>> +       { 249600000, 2000000000, 0 },
>> +};
>> +
> [...]

Will take care of the above in the next patch.

>> +
>> +static int cam_cc_sc7180_probe(struct platform_device *pdev)
>> +{
>> +       struct regmap *regmap;
>> +       int ret;
>> +
>> +       pm_runtime_enable(&pdev->dev);
>> +       ret = pm_clk_create(&pdev->dev);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = pm_clk_add(&pdev->dev, "xo");
>> +       if (ret < 0) {
>> +               dev_err(&pdev->dev, "Failed to acquire XO clock\n");
>> +               goto disable_pm_runtime;
>> +       }
>> +
>> +       ret = pm_clk_add(&pdev->dev, "iface");
>> +       if (ret < 0) {
>> +               dev_err(&pdev->dev, "Failed to acquire iface clock\n");
>> +               goto disable_pm_runtime;
>> +       }
>> +
>> +       ret = pm_clk_runtime_resume(&pdev->dev);
>> +       if (ret) {
>> +               dev_err(&pdev->dev, "pm runtime resume failed\n");
>> +               goto destroy_pm_clk;
>> +       }
>> +
>> +       regmap = qcom_cc_map(pdev, &cam_cc_sc7180_desc);
>> +       if (IS_ERR(regmap)) {
>> +               ret = PTR_ERR(regmap);
>> +               goto destroy_pm_clk;
>> +       }
>> +
>> +       clk_fabia_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
>> +       clk_fabia_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
>> +       clk_agera_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
>> +       clk_fabia_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
>> +
>> +       ret = qcom_cc_really_probe(pdev, &cam_cc_sc7180_desc, regmap);
>> +       if (ret) {
>> +               dev_err(&pdev->dev, "Failed to register CAM CC clocks\n");
>> +               goto suspend_pm_runtime;
> 
> ret is non-zero here
> 
>> +       }
>> +
>> +suspend_pm_runtime:
>> +       ret = pm_clk_runtime_suspend(&pdev->dev);
> 
> But then it is overwritten here.
> 
>> +       if (ret)
>> +               dev_err(&pdev->dev, "pm runtime suspend failed\n");
>> +
>> +       return 0;
> 
> And we return 0 when there was a failure to probe the clks?
> 

I will clean the error path in the next patch.

>> +
>> +destroy_pm_clk:
>> +       pm_clk_destroy(&pdev->dev);
>> +
>> +disable_pm_runtime:
>> +       pm_runtime_disable(&pdev->dev);
>> +
>> +       return ret;
>> +}

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
