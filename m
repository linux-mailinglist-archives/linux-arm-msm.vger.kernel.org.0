Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC3AD211F3E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2020 10:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbgGBIzh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jul 2020 04:55:37 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:43820 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725774AbgGBIzg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jul 2020 04:55:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593680135; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=6R0fs0rnnmdawC5ltF/lObSxGBvdioNRI/wjeKU4Swg=; b=iugHTp8bS9E/yPuho4wxz3qI9lGnujt9tOhxWho6sokv4VppeVwtxNIxUP25o1tLosR4hzkf
 iNXkKeVOFDk5Pn8oV780kpY9i1cKgBUNhE6GejxTOHb5VmQZYmahFErj0mdXtZ2YyOUppsF5
 Zs3onVHvhFRhdBlaxC6+sHiZXzM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n17.prod.us-west-2.postgun.com with SMTP id
 5efda106f3deea03f3b02597 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 02 Jul 2020 08:55:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2278BC433CA; Thu,  2 Jul 2020 08:55:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.11] (unknown [117.247.20.6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4B818C433C6;
        Thu,  2 Jul 2020 08:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4B818C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 2/4] drm/msm: dsi: Use OPP API to set clk/perf state
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     robdclark@gmail.com, sean@poorly.run, agross@kernel.org,
        bjorn.andersson@linaro.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1593518176-24450-1-git-send-email-rnayak@codeaurora.org>
 <1593518176-24450-3-git-send-email-rnayak@codeaurora.org>
 <20200701162726.GO39073@google.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <b67844d5-13d7-02c9-bed7-92be829677ed@codeaurora.org>
Date:   Thu, 2 Jul 2020 14:25:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200701162726.GO39073@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/1/2020 9:57 PM, Matthias Kaehlcke wrote:
> On Tue, Jun 30, 2020 at 05:26:14PM +0530, Rajendra Nayak wrote:
>> On SDM845 DSI needs to express a perforamnce state
> 
> nit: performance
> 
>> requirement on a power domain depending on the clock rates.
>> Use OPP table from DT to register with OPP framework and use
>> dev_pm_opp_set_rate() to set the clk/perf state.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi.h      |  2 ++
>>   drivers/gpu/drm/msm/dsi/dsi_cfg.c  |  4 +--
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 58 ++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 62 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
>> index 4de771d..ba7583c 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi.h
>> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
>> @@ -180,10 +180,12 @@ int msm_dsi_runtime_suspend(struct device *dev);
>>   int msm_dsi_runtime_resume(struct device *dev);
>>   int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host);
>>   int dsi_link_clk_set_rate_v2(struct msm_dsi_host *msm_host);
>> +int dsi_link_clk_set_rate_6g_v2(struct msm_dsi_host *msm_host);
>>   int dsi_link_clk_enable_6g(struct msm_dsi_host *msm_host);
>>   int dsi_link_clk_enable_v2(struct msm_dsi_host *msm_host);
>>   void dsi_link_clk_disable_6g(struct msm_dsi_host *msm_host);
>>   void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host);
>> +void dsi_link_clk_disable_6g_v2(struct msm_dsi_host *msm_host);
>>   int dsi_tx_buf_alloc_6g(struct msm_dsi_host *msm_host, int size);
>>   int dsi_tx_buf_alloc_v2(struct msm_dsi_host *msm_host, int size);
>>   void *dsi_tx_buf_get_6g(struct msm_dsi_host *msm_host);
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> index 813d69d..773c4fe 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> @@ -210,9 +210,9 @@ static const struct msm_dsi_host_cfg_ops msm_dsi_6g_host_ops = {
>>   };
>>   
>>   static const struct msm_dsi_host_cfg_ops msm_dsi_6g_v2_host_ops = {
>> -	.link_clk_set_rate = dsi_link_clk_set_rate_6g,
>> +	.link_clk_set_rate = dsi_link_clk_set_rate_6g_v2,
>>   	.link_clk_enable = dsi_link_clk_enable_6g,
>> -	.link_clk_disable = dsi_link_clk_disable_6g,
>> +	.link_clk_disable = dsi_link_clk_disable_6g_v2,
>>   	.clk_init_ver = dsi_clk_init_6g_v2,
>>   	.tx_buf_alloc = dsi_tx_buf_alloc_6g,
>>   	.tx_buf_get = dsi_tx_buf_get_6g,
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 11ae5b8..890531c 100644
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
>> @@ -537,6 +541,38 @@ int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
>>   	return 0;
>>   }
>>   
>> +int dsi_link_clk_set_rate_6g_v2(struct msm_dsi_host *msm_host)
>> +{
>> +	int ret;
>> +	struct device *dev = &msm_host->pdev->dev;
>> +
>> +	DBG("Set clk rates: pclk=%d, byteclk=%d",
>> +		msm_host->mode->clock, msm_host->byte_clk_rate);
>> +
>> +	ret = dev_pm_opp_set_rate(dev, msm_host->byte_clk_rate);
>> +	if (ret) {
>> +		pr_err("%s: dev_pm_opp_set_rate failed %d\n", __func__, ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = clk_set_rate(msm_host->pixel_clk, msm_host->pixel_clk_rate);
>> +	if (ret) {
>> +		pr_err("%s: Failed to set rate pixel clk, %d\n", __func__, ret);
>> +		return ret;
>> +	}
>> +
>> +	if (msm_host->byte_intf_clk) {
>> +		ret = clk_set_rate(msm_host->byte_intf_clk,
>> +				   msm_host->byte_clk_rate / 2);
>> +		if (ret) {
>> +			pr_err("%s: Failed to set rate byte intf clk, %d\n",
>> +			       __func__, ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
> 
> xThis function is essentially the same as dsi_link_clk_set_rate_6g(),
> except for the use of dev_pm_opp_set_rate() instead of clk_set_rate().
> 
> IIUC dev_pm_opp_set_rate() just calls clk_set_rate() if the device has
> no OPP table. If that's correct you could just call dev_pm_opp_set_rate()
> in dsi_link_clk_set_rate_6g().
> 
> 	/*
>      	* For IO devices which require an OPP on some platforms/SoCs
>      	* while just needing to scale the clock on some others
>      	* we look for empty OPP tables with just a clock handle and
>      	* scale only the clk. This makes dev_pm_opp_set_rate()
> 	* equivalent to a clk_set_rate()
> 	*/
> 	if (!_get_opp_count(opp_table)) {
> 		ret = _generic_set_opp_clk_only(dev, clk, freq);
> 		goto put_opp_table;
> 	}

ah, thats right, I think I had this code from before that support got
added to dev_pm_opp_set_rate() and I just did not update this driver to
make use of it. Thanks for catching it, I will fix it up and repost soon.

> 
> https://elixir.bootlin.com/linux/v5.7.6/source/drivers/opp/core.c#L855
> 
>>   int dsi_link_clk_enable_6g(struct msm_dsi_host *msm_host)
>>   {
>> @@ -665,6 +701,13 @@ void dsi_link_clk_disable_6g(struct msm_dsi_host *msm_host)
>>   	clk_disable_unprepare(msm_host->byte_clk);
>>   }
>>   
>> +void dsi_link_clk_disable_6g_v2(struct msm_dsi_host *msm_host)
>> +{
>> +	/* Drop the performance state vote */
>> +	dev_pm_opp_set_rate(&msm_host->pdev->dev, 0);
> 
> Couldn't you just do this in dsi_link_clk_disable_6g() ?

yes, looks like I can, I'll get rid of both of these additional functions.

thanks,
Rajendra

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
