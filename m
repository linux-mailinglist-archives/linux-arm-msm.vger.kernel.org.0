Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26A1536E480
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Apr 2021 07:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231899AbhD2FeV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Apr 2021 01:34:21 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:29792 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230103AbhD2FeU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Apr 2021 01:34:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619674414; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=bsA0nxUjD3KYsDuCWjb6jWZWnBa2V9HdYdOfdgr6mLY=;
 b=HWR8K4TWI3Ctb9WoEGphVT0Y1EzJLfiH0XkZoov4VfO+CAuujkKviL4OhyQvaY21O2yD3Yyr
 EQafd5qsuPpE71tXmffICruFHBVe9utCCfxtlc1CQiRvq9MDC1iV7/UL7TqwGoNKsZiiEh6n
 Zu+pPCFEQg9A/y7L0yqTQNcEhmA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 608a452de0e9c9a6b6864ede (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Apr 2021 05:33:33
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BB093C433D3; Thu, 29 Apr 2021 05:33:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E371DC4338A;
        Thu, 29 Apr 2021 05:33:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 29 Apr 2021 11:03:32 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     robh+dt@kernel.org, bjorn.andersson@linaro.org, sboyd@kernel.org,
        agross@kernel.org, mani@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] reset: qcom: Add PDC Global reset signals for WPSS
In-Reply-To: <0c5f747fe0a3f757a4160e4fd28cc2b56a57a39d.camel@pengutronix.de>
References: <1619508824-14413-1-git-send-email-sibis@codeaurora.org>
 <1619508824-14413-5-git-send-email-sibis@codeaurora.org>
 <0c5f747fe0a3f757a4160e4fd28cc2b56a57a39d.camel@pengutronix.de>
Message-ID: <e28b74712d66f298af793ceb873216bb@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Philipp,

Thanks for the review. Will get them
fixed in the next re-spin.

On 2021-04-27 13:28, Philipp Zabel wrote:
> Hi Sibi,
> 
> On Tue, 2021-04-27 at 13:03 +0530, Sibi Sankar wrote:
>> Add PDC Global reset signals for Wireless Processor Subsystem (WPSS)
>> on SC7280 SoCs.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>> 
>> v2:
>>  * place resets and num_resets adjacent to each other [Stephen]
> [...]
>> +struct qcom_pdc_reset_desc {
>> +	const struct qcom_pdc_reset_map *resets;
>> +	size_t num_resets;
>> +	unsigned int offset;
>> +};
> [...]
> 
> For consistency, please do the same here:
> 
>> +static const struct qcom_pdc_reset_desc sdm845_pdc_reset_desc = {
>> +	.resets = sdm845_pdc_resets,
>> +	.offset = RPMH_SDM845_PDC_SYNC_RESET,
>> +	.num_resets = ARRAY_SIZE(sdm845_pdc_resets),
>> +};
> [...]
> 
> and here:
> 
>> +static const struct qcom_pdc_reset_desc sc7280_pdc_reset_desc = {
>> +	.resets = sc7280_pdc_resets,
>> +	.offset = RPMH_SC7280_PDC_SYNC_RESET,
>> +	.num_resets = ARRAY_SIZE(sc7280_pdc_resets),
>> +};
> 
> [...]
>> @@ -54,19 +89,18 @@ static int qcom_pdc_control_assert(struct 
>> reset_controller_dev *rcdev,
>>  					unsigned long idx)
>>  {
>>  	struct qcom_pdc_reset_data *data = to_qcom_pdc_reset_data(rcdev);
>> +	const struct qcom_pdc_reset_map *map = &data->desc->resets[idx];
>> 
>> -	return regmap_update_bits(data->regmap, RPMH_PDC_SYNC_RESET,
>> -				  BIT(sdm845_pdc_resets[idx].bit),
>> -				  BIT(sdm845_pdc_resets[idx].bit));
>> +	return regmap_update_bits(data->regmap, data->desc->offset, 
>> BIT(map->bit), BIT(map->bit));
>>  }
> 
> Why not go one step further:
> 
> 	u32 mask = BIT(data->desc->resets[idx].bit);
> 
> 	return regmap_update_bits(data->regmap, data->desc->offset, mask, 
> mask);
> 
> That seems to be a common pattern in other qcom drivers.

will send out a separate patch for
the other reset driver.

> Either way, with the above reset/num_reset changes:
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> Also,
> 
> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> for the whole series to go through the qcom tree, or let me know if you
> want me to pick up patches 2-4 next round.
> 
> regards
> Philipp

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
