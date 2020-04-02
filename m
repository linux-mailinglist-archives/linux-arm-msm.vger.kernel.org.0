Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C61D19C8D0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2020 20:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389607AbgDBScC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 14:32:02 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:49593 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732330AbgDBScC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 14:32:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585852321; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=bwdgE6SDnCj91cAVMlb3J56Z9tUcAowCrODV+AuEXSo=; b=CCZFphUwlv2NAyFJSrEYETiUh9wsMEXjlkA+r/KRFeEqOqLdNjJ4X58tt3f9wtC33VkXSVrd
 7AhHQZb/ILIwVtvotm+mz2AiCeS3mB2p6WxMyonhjKL86rcXXTQv57GgxndSTvl3mQKmRJAm
 wZy9z6ZblMrjtQ8Yu5W/LVo6e4A=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e862f8f.7f132e278928-smtp-out-n01;
 Thu, 02 Apr 2020 18:31:43 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 720DBC43636; Thu,  2 Apr 2020 18:31:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.122.98] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 17244C433D2;
        Thu,  2 Apr 2020 18:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 17244C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v4 4/4] phy: qcom-qmp: Use proper PWRDOWN offset for
 sm8150 USB
To:     Manu Gautam <mgautam@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, kishon@ti.com, robh+dt@kernel.org,
        mark.rutland@arm.com, p.zabel@pengutronix.de
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <1585597017-30683-1-git-send-email-wcheng@codeaurora.org>
 <1585597017-30683-5-git-send-email-wcheng@codeaurora.org>
 <d61723e3-17a3-366d-f476-c33931766efd@codeaurora.org>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <b70f88cd-bbc7-96ab-3890-e15cbe94b258@codeaurora.org>
Date:   Thu, 2 Apr 2020 11:31:40 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <d61723e3-17a3-366d-f476-c33931766efd@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Manu,

Thanks for the feedback and review.

On 4/2/2020 12:35 AM, Manu Gautam wrote:
> 
> On 3/31/2020 1:06 AM, Wesley Cheng wrote:
>> The register map for SM8150 QMP USB SSPHY has moved
>> QPHY_POWER_DOWN_CONTROL to a different offset.  Allow for
>> an offset in the register table to override default value
>> if it is a DP capable PHY.
>>
>> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp.c | 15 ++++++++++++---
>>  1 file changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
>> index cc04471..4c0517e 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
>> @@ -164,6 +164,7 @@ enum qphy_reg_layout {
>>  	[QPHY_SW_RESET]			= 0x00,
>>  	[QPHY_START_CTRL]		= 0x44,
>>  	[QPHY_PCS_STATUS]		= 0x14,
>> +	[QPHY_COM_POWER_DOWN_CONTROL]	= 0x40,
> Since this is in PCS block please rename it to -
> 
> QPHY_PCS_POWER_DOWN_CONTROL
> 

Sure, will add another enum value to the register layout, and rename it
where needed.

>>  };
>>  
>>  static const unsigned int sdm845_ufsphy_regs_layout[] = {
>> @@ -1627,6 +1628,9 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
>>  	if (cfg->has_phy_com_ctrl)
>>  		qphy_setbits(serdes, cfg->regs[QPHY_COM_POWER_DOWN_CONTROL],
>>  			     SW_PWRDN);
>> +	else if (cfg->has_phy_dp_com_ctrl && cfg->regs[QPHY_COM_POWER_DOWN_CONTROL])
>> +		qphy_setbits(pcs, cfg->regs[QPHY_COM_POWER_DOWN_CONTROL],
>> +			     cfg->pwrdn_ctrl);
>>  	else
>>  		qphy_setbits(pcs, QPHY_POWER_DOWN_CONTROL, cfg->pwrdn_ctrl);
> Since, this register is in PCS block why check for dp_com_ctrl here?
> Something like:
> 
>  	if (cfg->has_phy_com_ctrl) {
>  		qphy_setbits(serdes, cfg->regs[QPHY_COM_POWER_DOWN_CONTROL],
>  			     SW_PWRDN);
> 	} else {
> 		if (cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL]) 
> 			qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
> 			     cfg->pwrdn_ctrl);
>  		else
>  			qphy_setbits(pcs, QPHY_POWER_DOWN_CONTROL, cfg->pwrdn_ctrl);
> 	}
> 

Agree with this.

>>  
>> @@ -1671,10 +1675,12 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
>>  	return ret;
>>  }
>>  
>> -static int qcom_qmp_phy_com_exit(struct qcom_qmp *qmp)
>> +static int qcom_qmp_phy_com_exit(struct qmp_phy *qphy)
>>  {
>> +	struct qcom_qmp *qmp = qphy->qmp;
>>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
>>  	void __iomem *serdes = qmp->serdes;
>> +	void __iomem *pcs = qphy->pcs;
>>  	int i = cfg->num_resets;
>>  
>>  	mutex_lock(&qmp->phy_mutex);
>> @@ -1691,6 +1697,9 @@ static int qcom_qmp_phy_com_exit(struct qcom_qmp *qmp)
>>  			     SW_RESET);
>>  		qphy_setbits(serdes, cfg->regs[QPHY_COM_POWER_DOWN_CONTROL],
>>  			     SW_PWRDN);
>> +	} else if (cfg->has_phy_dp_com_ctrl && cfg->regs[QPHY_COM_POWER_DOWN_CONTROL]) {
> 
> Can we add change similar to init() here ?
> 
> 

Sure.  I will move this check to where the current code writes to the
PWR DOWN CONTROL in

static int qcom_qmp_phy_disable(struct phy *phy)
{
	...
	qphy_clrbits(qphy->pcs, QPHY_POWER_DOWN_CONTROL, cfg->pwrdn_ctrl);

We wouldn't want the SW to write to an incorrect register.

>> +			     cfg->pwrdn_ctrl);
>>  	}
>>  
>>  	while (--i >= 0)
>> @@ -1829,7 +1838,7 @@ static int qcom_qmp_phy_enable(struct phy *phy)
>>  	if (cfg->has_lane_rst)
>>  		reset_control_assert(qphy->lane_rst);
>>  err_lane_rst:
>> -	qcom_qmp_phy_com_exit(qmp);
>> +	qcom_qmp_phy_com_exit(qphy);
>>  
>>  	return ret;
>>  }
>> @@ -1855,7 +1864,7 @@ static int qcom_qmp_phy_disable(struct phy *phy)
>>  	if (cfg->has_lane_rst)
>>  		reset_control_assert(qphy->lane_rst);
>>  
>> -	qcom_qmp_phy_com_exit(qmp);
>> +	qcom_qmp_phy_com_exit(qphy);
>>  
>>  	qmp->phy_initialized = false;
>>  
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
