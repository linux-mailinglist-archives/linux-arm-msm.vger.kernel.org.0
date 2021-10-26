Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C195B43B139
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Oct 2021 13:27:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234218AbhJZL3q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Oct 2021 07:29:46 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:26063 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229887AbhJZL3p (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Oct 2021 07:29:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635247642; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=+VfAOGNRqKPzh6Cqta9+SYjWQCyLtNY13BI23W5daME=; b=L3VLDKq43uCavle89KAZS9iP8drz4zUpVUus4WfNly46UEHA/LZhlWV5x4VmvicvKLNW4gRZ
 6RSKYLQQLx+Axbh/u/m2OaL/vi9saZS4ZDbLYhB/Zbxus09SM59yDh+ztNymlOTSnIn7S00k
 JK7/kiTDcQ9dfMkRIneuxwhr6JM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6177e60dfd91319f0ffb7c84 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 26 Oct 2021 11:27:09
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 59418C43616; Tue, 26 Oct 2021 11:27:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.242.143.72] (unknown [202.46.23.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D3FDCC4338F;
        Tue, 26 Oct 2021 11:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org D3FDCC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v3] ASoC: qcom: soundwire: Enable soundwire bus clock for
 version 1.6
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org,
        Venkata Prasad Potturu <potturu@codeaurora.org>
References: <1633671232-30310-1-git-send-email-srivasam@codeaurora.org>
 <YWBXIIjPP7Qunyvf@ripper>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <11a57c35-5e38-1b74-bc70-c1eeeb81fbfe@codeaurora.org>
Date:   Tue, 26 Oct 2021 16:57:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YWBXIIjPP7Qunyvf@ripper>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/8/2021 8:05 PM, Bjorn Andersson wrote:
Thanks for Your time Bjorn!!!
> On Thu 07 Oct 22:33 PDT 2021, Srinivasa Rao Mandadapu wrote:
>
>> Add support for soundwire 1.6 version to gate RX/TX bus clock.
>>
> Are you really adding soundwire 1.6 support in order to gate RX/TX bus
> clock?
>
> Could it be that you're ungating the bus clock so that soundwire 1.6
> starts working? The commit message should properly describe why you're
> doing your change.
Yes. After updating RX/TX CGCR Register so it's started working. Will 
update proper commit message.
>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Venkata is the first who certified the origin of this patch, yet you're
> the author. Either this should be From Venkata (i.e. git commit
> --author) or perhaps you need a Co-developed-by here to say that you
> collaborated on this and both certify its origin.
Okay. Actually Venakta is the Co developer. Will change accordingly.
>> ---
>> Changes since v2:
>>      -- Update error check after ioremap.
> What about the other things I noted in v2?
Okay. Will update.
>
>> Changes since v1:
>>      -- Add const name to mask value.
>>
>>   drivers/soundwire/qcom.c | 15 ++++++++++++++-
>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>> index 0ef79d6..bd6fabd 100644
>> --- a/drivers/soundwire/qcom.c
>> +++ b/drivers/soundwire/qcom.c
>> @@ -109,6 +109,7 @@
>>   #define SWR_MAX_CMD_ID	14
>>   #define MAX_FIFO_RD_RETRY 3
>>   #define SWR_OVERFLOW_RETRY_COUNT 30
>> +#define SWRM_HCTL_REG_MASK ~BIT(1)
>>   
>>   struct qcom_swrm_port_config {
>>   	u8 si;
>> @@ -127,6 +128,7 @@ struct qcom_swrm_ctrl {
>>   	struct device *dev;
>>   	struct regmap *regmap;
>>   	void __iomem *mmio;
>> +	char __iomem *swrm_hctl_reg;
>>   	struct completion broadcast;
>>   	struct completion enumeration;
>>   	struct work_struct slave_work;
>> @@ -610,6 +612,12 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>>   	val = FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK, ctrl->rows_index);
>>   	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK, ctrl->cols_index);
>>   
>> +	if (ctrl->swrm_hctl_reg) {
>> +		val = ioread32(ctrl->swrm_hctl_reg);
>> +		val &= SWRM_HCTL_REG_MASK;
> Make a define with a name that clarifies what BIT(1) is and use that
> here, hiding a magic number in an empty define isn't making this more
> maintainable.
>
> Essentially put the name of the bit in the register description in a
> define and use that here.
Okay. Will change name appropriately.
>
>> +		iowrite32(val, ctrl->swrm_hctl_reg);
>> +	}
>> +
>>   	ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(0), val);
>>   
>>   	/* Enable Auto enumeration */
>> @@ -1200,7 +1208,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>>   	struct qcom_swrm_ctrl *ctrl;
>>   	const struct qcom_swrm_data *data;
>>   	int ret;
>> -	u32 val;
>> +	int val, swrm_hctl_reg = 0;
> Don't you get a warning from passing val as an int to a function that
> takes a u32 pointer?
Yeah. Will revert val variable type change.
> Also there's no reason to zero-initialize swrm_hctl_reg.
Okay. Will change.
>>   
>>   	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
>>   	if (!ctrl)
>> @@ -1251,6 +1259,11 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>>   	ctrl->bus.port_ops = &qcom_swrm_port_ops;
>>   	ctrl->bus.compute_params = &qcom_swrm_compute_params;
>>   
>> +	if (!of_property_read_u32(dev->of_node, "qcom,swrm-hctl-reg", &swrm_hctl_reg)) {
> As I said in my feedback of v2, this property is not documented in the
> DT binding.
Okay. Will update dt bindings.
>
> But more important, upstream we do not approve of the downstream
> methodology of having properties pointing to single registers in some
> memory block somewhere.
>
> Describe the hardware block that you reference fully in devicetree and
> make a proper reference to it.
>
> Unfortunately your patch lacks details necessary to know where this
> register lives, so it's not possible for me to recommend a proper
> design.

These Registers lies in LPASS_AUDIO_LPASS_AUDIO_CSR | 0x032A9000 Range.

Register description:

LPASS_AUDIO_SWR_RX_CGCR(0x032A90A0) & LPASS_AUDIO_SWR_TX_CGCR (0x032A90A8)

Bits  Field Name    Description
1        HW_CTL        HW Dynamic Clock Gating Control Register
                                  1: HW Controlled
                                  0: SW Controlled
0        CLK_ENABLE    Enabling the clock when in SW Controlled Mode
                                     1: Clock Enabled
                                      0: Clock Disabled
> Regards,
> Bjorn
>
>> +		ctrl->swrm_hctl_reg = devm_ioremap(&pdev->dev, swrm_hctl_reg, 0x4);
>> +		if (!ctrl->swrm_hctl_reg)
>> +			return -ENODEV;
>> +	}
>>   	ret = qcom_swrm_get_port_config(ctrl);
>>   	if (ret)
>>   		goto err_clk;
>> -- 
>> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
>> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

