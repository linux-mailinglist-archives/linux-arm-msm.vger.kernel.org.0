Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 359371F52A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2020 12:55:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728316AbgFJKz3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Jun 2020 06:55:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728238AbgFJKz1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Jun 2020 06:55:27 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36E41C03E96F
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2020 03:55:27 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id x14so1747093wrp.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2020 03:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p2RFeiibpKE23Dhz521nn9ShSJ5sAPi1377fNv5lHps=;
        b=jDje1DsUWjt5BwPhCsIxSFOh4TVXM6BxGMjn2SXZHm4M5KayIthJd41xFmMn6abbFC
         we/86rJxUniHyQlzT3WDJ+xrVZyGh8Ebjd/Fva7BIRw7EiEPVZGq45uI9n2eUCmRqZbZ
         4uT5b3dekz9fqlIE9knKyVReElGHAfF56C0cA7S84OvNDEwBifaUB/OuIunopHsbiZx2
         6sm6kggCyoDQ2q3B7hsO/heTOg8OA2pPqvIpQd5PtzbLUNg8nlNZORT6SHX/Tz9YlwCt
         GNB3t+57OUwSn2Y0pm7Bwht0r2r1Q02kwM+mrIHPKdfmLuqMB/04JM1U4kvtGRJYwjdn
         Hg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p2RFeiibpKE23Dhz521nn9ShSJ5sAPi1377fNv5lHps=;
        b=AGu4jywIN5MKvBOLQZEJDaAhfxC33/XJQI/XDc1UFn+haYy1uu4rkW5YNOLu4/C9m8
         iYLJubjRdH5JQVCN5B8adC8u9u1HUNgfk2Bk7vIjimHkA6K9wS86OeTvkJR4/M4CMTro
         PgIaJY8UNFcUDzVBsDBVZlh0lQNlicbi/4mCrxgKNXbp3/cCjJvsAhFWKnmjRpnbHhIz
         BcvB6vhquiwi1Z/u7oKLQr9tqLkBhfui1vQ0CFHkc9w8xPrSFwIdYwbhqOeXooSIyrAx
         xtRLWmGWFGWDbFYdgEkhsJ6QoXRGwRLj9B9843nM0ZcQM5lNM9xQgzaogSOn9yTGuCNg
         ESYQ==
X-Gm-Message-State: AOAM530vHm33nmAcHU9Vv2VS++sQ3JhOdlzuz6PQ3NWZ9pjH0nGa/h8G
        pyrgHr8mKFi2lfVU2Bv8tdEW2A==
X-Google-Smtp-Source: ABdhPJy1TIM86aeyGmfk+tAc3Hlf5KZ9+WSN/YPjeDex6TRfEFnPxsUozlQeAdsky2C/99YWVoZ91A==
X-Received: by 2002:adf:d84a:: with SMTP id k10mr2999635wrl.336.1591786525398;
        Wed, 10 Jun 2020 03:55:25 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id g3sm8326829wrb.46.2020.06.10.03.55.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jun 2020 03:55:24 -0700 (PDT)
Subject: Re: [PATCH 2/5] soundwire: qcom: add support for mmio soundwire
 devices
To:     Jonathan Marek <jonathan@marek.ca>, alsa-devel@alsa-project.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200608204347.19685-1-jonathan@marek.ca>
 <20200608204347.19685-3-jonathan@marek.ca>
 <1b29db61-2394-8f88-9ebb-219568fb9306@linaro.org>
 <009dd6c1-276f-4ac5-b68b-1fe2de50ad8c@marek.ca>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <d72ffc03-c20e-60a6-19df-d8b4a1486358@linaro.org>
Date:   Wed, 10 Jun 2020 11:55:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <009dd6c1-276f-4ac5-b68b-1fe2de50ad8c@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 09/06/2020 12:04, Jonathan Marek wrote:
> On 6/9/20 5:19 AM, Srinivas Kandagatla wrote:
>>
>>
>> On 08/06/2020 21:43, Jonathan Marek wrote:
>>> Adds support for qcom soundwire devices with memory mapped IO registers.
>>>
>>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>>> ---
>>
>> In general patch itself looks pretty trivial, but I would like to see 
>> what 1.5.1 controller provides in terms of error reporting of 
>> SoundWire slave register reads/writes. On WCD based controller we did 
>> not have a mechanism to report things like if the read is ignored or 
>> not. I was hoping that this version of controller would be able to 
>> report that.
>>
>> I will be nice to those patches if that is something which is 
>> supported in this version.
>>
>> --srini
>>
> 
> It does seem to support additional error reporting (it gets an error 
> during enumeration after finding the 2 WSA slaves). However the 
> downstream driver seems to disable this by setting BIT(31) in 
> FIFO_CFG_ADDR (the comment says "For SWR master version 1.5.1, continue 
> execute on command ignore"). Outside of the initial enumeration, it 
> doesn't seem to produce any extra errors (still relying on the timeout 
> mechanism to know if read/write is ignored).

1.5.* versions support reporting CMD_NACKED in FIFO_STATUS register, so 
you should use that instead of timeout mechanism which is used for 1.3.0 
which did not have support for this.


thanks,
srini


> 
>>>   drivers/soundwire/qcom.c | 25 +++++++++++++++++++++++--
>>>   1 file changed, 23 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>>> index f38d1fd3679f..628747df1c75 100644
>>> --- a/drivers/soundwire/qcom.c
>>> +++ b/drivers/soundwire/qcom.c
>>> @@ -90,6 +90,7 @@ struct qcom_swrm_ctrl {
>>>       struct sdw_bus bus;
>>>       struct device *dev;
>>>       struct regmap *regmap;
>>> +    void __iomem *mmio;
>>>       struct completion *comp;
>>>       struct work_struct slave_work;
>>>       /* read/write lock */
>>> @@ -154,6 +155,20 @@ static int qcom_swrm_ahb_reg_write(struct 
>>> qcom_swrm_ctrl *ctrl,
>>>       return SDW_CMD_OK;
>>>   }
>>> +static int qcom_swrm_cpu_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
>>> +                  u32 *val)
>>> +{
>>> +    *val = readl(ctrl->mmio + reg);
>>> +    return SDW_CMD_OK;
>>> +}
>>> +
>>> +static int qcom_swrm_cpu_reg_write(struct qcom_swrm_ctrl *ctrl, int 
>>> reg,
>>> +                   int val)
>>> +{
>>> +    writel(val, ctrl->mmio + reg);
>>> +    return SDW_CMD_OK;
>>> +}
>>> +
>>>   static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *ctrl, 
>>> u8 cmd_data,
>>>                        u8 dev_addr, u16 reg_addr)
>>>   {
>>> @@ -746,6 +761,7 @@ static int qcom_swrm_probe(struct platform_device 
>>> *pdev)
>>>       struct sdw_master_prop *prop;
>>>       struct sdw_bus_params *params;
>>>       struct qcom_swrm_ctrl *ctrl;
>>> +    struct resource *res;
>>>       int ret;
>>>       u32 val;
>>> @@ -760,8 +776,13 @@ static int qcom_swrm_probe(struct 
>>> platform_device *pdev)
>>>           if (!ctrl->regmap)
>>>               return -EINVAL;
>>>       } else {
>>> -        /* Only WCD based SoundWire controller is supported */
>>> -        return -ENOTSUPP;
>>> +        res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> +
>>> +        ctrl->reg_read = qcom_swrm_cpu_reg_read;
>>> +        ctrl->reg_write = qcom_swrm_cpu_reg_write;
>>> +        ctrl->mmio = devm_ioremap_resource(dev, res);
>>> +        if (IS_ERR(ctrl->mmio))
>>> +            return PTR_ERR(ctrl->mmio);
>>>       }
>>>       ctrl->irq = of_irq_get(dev->of_node, 0);
>>>
