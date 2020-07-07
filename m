Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64E7B21655C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2020 06:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbgGGE2R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jul 2020 00:28:17 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:29331 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727072AbgGGE2R (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jul 2020 00:28:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594096097; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=hBwuuK2aRbrgFHjBZz5RaQYAa9SdTOUKi0y8gBqMwBk=; b=xdNQHYrIfPPFcuQWOnScC4l+tD5mkzynZoTgHZJPPwCfBBdCsdwPvmbLpuEb8DGfMGbCm4WH
 8fQwD/d56fp4YzwiNKClAqgMdmJJCn+467rVXgC4W3HBiJglWx9Fs7wlTBU7cYEZ4taJf2Cr
 SMo3Zx8m0ADGAX5192WxIvp2f0A=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5f03f9e00082b2784812b02f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 07 Jul 2020 04:28:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 696C6C433A0; Tue,  7 Jul 2020 04:28:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.11] (unknown [61.3.20.137])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CBD46C433C6;
        Tue,  7 Jul 2020 04:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CBD46C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v2 2/4] drm/msm: dsi: Use OPP API to set clk/perf state
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     robdclark@gmail.com, sean@poorly.run, agross@kernel.org,
        bjorn.andersson@linaro.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1593688151-22616-1-git-send-email-rnayak@codeaurora.org>
 <1593688151-22616-3-git-send-email-rnayak@codeaurora.org>
 <20200706161057.GG3191083@google.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <7472e916-4cfa-6462-9d16-6d3dc5127a42@codeaurora.org>
Date:   Tue, 7 Jul 2020 09:58:09 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200706161057.GG3191083@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/6/2020 9:40 PM, Matthias Kaehlcke wrote:
> On Thu, Jul 02, 2020 at 04:39:09PM +0530, Rajendra Nayak wrote:
>> On SDM845 and SC7180 DSI needs to express a performance state
>> requirement on a power domain depending on the clock rates.
>> Use OPP table from DT to register with OPP framework and use
>> dev_pm_opp_set_rate() to set the clk/perf state.
>>
>> dev_pm_opp_set_rate() is designed to be equivalent to clk_set_rate()
>> for devices without an OPP table, hence the change works fine
>> on devices/platforms which only need to set a clock rate.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 26 ++++++++++++++++++++++++--
>>   1 file changed, 24 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 11ae5b8..09e16b8 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -14,6 +14,7 @@
>>   #include <linux/of_graph.h>
>>   #include <linux/of_irq.h>
>>   #include <linux/pinctrl/consumer.h>
>> +#include <linux/pm_opp.h>
>>   #include <linux/regmap.h>
>>   #include <linux/regulator/consumer.h>
>>   #include <linux/spinlock.h>
>> @@ -111,6 +112,9 @@ struct msm_dsi_host {
>>   	struct clk *pixel_clk_src;
>>   	struct clk *byte_intf_clk;
>>   
>> +	struct opp_table *opp_table;
>> +	bool has_opp_table;
>> +
>>   	u32 byte_clk_rate;
>>   	u32 pixel_clk_rate;
>>   	u32 esc_clk_rate;
>> @@ -512,9 +516,10 @@ int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
>>   	DBG("Set clk rates: pclk=%d, byteclk=%d",
>>   		msm_host->mode->clock, msm_host->byte_clk_rate);
>>   
>> -	ret = clk_set_rate(msm_host->byte_clk, msm_host->byte_clk_rate);
>> +	ret = dev_pm_opp_set_rate(&msm_host->pdev->dev,
>> +				  msm_host->byte_clk_rate);
>>   	if (ret) {
>> -		pr_err("%s: Failed to set rate byte clk, %d\n", __func__, ret);
>> +		pr_err("%s: dev_pm_opp_set_rate failed %d\n", __func__, ret);
>>   		return ret;
>>   	}
>>   
>> @@ -658,6 +663,8 @@ int dsi_link_clk_enable_v2(struct msm_dsi_host *msm_host)
>>   
>>   void dsi_link_clk_disable_6g(struct msm_dsi_host *msm_host)
>>   {
>> +	/* Drop the performance state vote */
>> +	dev_pm_opp_set_rate(&msm_host->pdev->dev, 0);
>>   	clk_disable_unprepare(msm_host->esc_clk);
>>   	clk_disable_unprepare(msm_host->pixel_clk);
>>   	if (msm_host->byte_intf_clk)
>> @@ -1879,6 +1886,18 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>>   		goto fail;
>>   	}
>>   
>> +	msm_host->opp_table = dev_pm_opp_set_clkname(&pdev->dev, "byte");
>> +	if (IS_ERR(msm_host->opp_table))
>> +		return PTR_ERR(msm_host->opp_table);
>> +	/* OPP table is optional */
>> +	ret = dev_pm_opp_of_add_table(&pdev->dev);
>> +	if (!ret) {
>> +		msm_host->has_opp_table = true;
>> +	} else if (ret != -ENODEV) {
>> +		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
> 
>    		dev_pm_opp_put_clkname(msm_host->opp_table);
> 
>> +		return ret;
>> +	}
> 
> With the missing _put_clkname() fixed:

Thanks, I'll fix and resend.

> 
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
