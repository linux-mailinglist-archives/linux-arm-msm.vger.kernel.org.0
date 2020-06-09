Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 583AD1F38F1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 13:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbgFILEG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 07:04:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgFILEE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 07:04:04 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 913C8C05BD1E
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2020 04:04:03 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id v79so20263601qkb.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2020 04:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FUbD1hcVcPbnPun6PBCVIx0Ht2zCmKmDBbH5Z3sFvOM=;
        b=yy6lP6vs08nS7FeDvrnPdx0yKjfD+ShIyb1E+9Gnyf/sJaiau+d1vdUiMBzo3WAy7r
         RGJlMkR1FFSLtDUeShrARCAzIf/qyXvv6EJ10vdoZZGA2hemnUspib320JpDdmI6++eK
         No486PMTsADE0isEqV1zOkhzh6I+5A8pFf6k5JiYd8vZJXqPK91Qo3aQJEiMwCWZxPtr
         O9uNo4WUGNkMerG8o0FY+bSCATW0qwNfMEXd7bVO/WukG6bB1avoKigpQYTXrZTbL3wX
         lmc3aAPWeQWPbb8PIt7V51LfcKYHof9UEg5gEvkglSBXUpYUMhMmWBERcRrh4GkYq3xN
         Jt9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FUbD1hcVcPbnPun6PBCVIx0Ht2zCmKmDBbH5Z3sFvOM=;
        b=Mx7H05XlGiRYAZF62frXJ+rkfn9e5OzATIo1aYTvjYl5Q0oCDB7MeEcbXZS81fNudL
         dRpu7rEia2bcEsuan4lwAdW+qh5GpX7yXjwtT/KKoWav/zRFpkduhfOXJ+M5aecGK/oz
         uLXrp/0j2cdDFdPmcoFYihZpNG6NIkJMh7mlO5V+ch+Z2NDbuvWhRh9/Drp0bzh69eSh
         AgIladEoEuIUTCZM7qw4oeSUJuWyK+a1Col0v3srCLeU/zhmx0aRvLoDMmLovtWtr28x
         q2Adz9Ch1oCPIgYDJ/5DBC++zWFAW6BZk+3LSlbD31zU3BW0inK2Z7BUvtA1NMt/3Y5T
         oSzw==
X-Gm-Message-State: AOAM530q1aH3AoPAyE2DnwVfeH8cEKmrLEG/KTGvvB1bT+S/PxjNcZg4
        Yyuqcx63ySUynxQr072Lzfxnjw==
X-Google-Smtp-Source: ABdhPJzVP/VSTlS3oR2RXDNjAgvgFJkJGGymfO50aefBhyTaFFEWDxk4bJsnOh1sX1aJUK4mXE15JQ==
X-Received: by 2002:a37:9f0b:: with SMTP id i11mr25948765qke.481.1591700642784;
        Tue, 09 Jun 2020 04:04:02 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id u25sm10050138qtc.11.2020.06.09.04.04.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2020 04:04:02 -0700 (PDT)
Subject: Re: [PATCH 2/5] soundwire: qcom: add support for mmio soundwire
 devices
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        alsa-devel@alsa-project.org
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
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <009dd6c1-276f-4ac5-b68b-1fe2de50ad8c@marek.ca>
Date:   Tue, 9 Jun 2020 07:04:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1b29db61-2394-8f88-9ebb-219568fb9306@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/9/20 5:19 AM, Srinivas Kandagatla wrote:
> 
> 
> On 08/06/2020 21:43, Jonathan Marek wrote:
>> Adds support for qcom soundwire devices with memory mapped IO registers.
>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
> 
> In general patch itself looks pretty trivial, but I would like to see 
> what 1.5.1 controller provides in terms of error reporting of SoundWire 
> slave register reads/writes. On WCD based controller we did not have a 
> mechanism to report things like if the read is ignored or not. I was 
> hoping that this version of controller would be able to report that.
> 
> I will be nice to those patches if that is something which is supported 
> in this version.
> 
> --srini
> 

It does seem to support additional error reporting (it gets an error 
during enumeration after finding the 2 WSA slaves). However the 
downstream driver seems to disable this by setting BIT(31) in 
FIFO_CFG_ADDR (the comment says "For SWR master version 1.5.1, continue 
execute on command ignore"). Outside of the initial enumeration, it 
doesn't seem to produce any extra errors (still relying on the timeout 
mechanism to know if read/write is ignored).

>>   drivers/soundwire/qcom.c | 25 +++++++++++++++++++++++--
>>   1 file changed, 23 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>> index f38d1fd3679f..628747df1c75 100644
>> --- a/drivers/soundwire/qcom.c
>> +++ b/drivers/soundwire/qcom.c
>> @@ -90,6 +90,7 @@ struct qcom_swrm_ctrl {
>>       struct sdw_bus bus;
>>       struct device *dev;
>>       struct regmap *regmap;
>> +    void __iomem *mmio;
>>       struct completion *comp;
>>       struct work_struct slave_work;
>>       /* read/write lock */
>> @@ -154,6 +155,20 @@ static int qcom_swrm_ahb_reg_write(struct 
>> qcom_swrm_ctrl *ctrl,
>>       return SDW_CMD_OK;
>>   }
>> +static int qcom_swrm_cpu_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
>> +                  u32 *val)
>> +{
>> +    *val = readl(ctrl->mmio + reg);
>> +    return SDW_CMD_OK;
>> +}
>> +
>> +static int qcom_swrm_cpu_reg_write(struct qcom_swrm_ctrl *ctrl, int reg,
>> +                   int val)
>> +{
>> +    writel(val, ctrl->mmio + reg);
>> +    return SDW_CMD_OK;
>> +}
>> +
>>   static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *ctrl, u8 
>> cmd_data,
>>                        u8 dev_addr, u16 reg_addr)
>>   {
>> @@ -746,6 +761,7 @@ static int qcom_swrm_probe(struct platform_device 
>> *pdev)
>>       struct sdw_master_prop *prop;
>>       struct sdw_bus_params *params;
>>       struct qcom_swrm_ctrl *ctrl;
>> +    struct resource *res;
>>       int ret;
>>       u32 val;
>> @@ -760,8 +776,13 @@ static int qcom_swrm_probe(struct platform_device 
>> *pdev)
>>           if (!ctrl->regmap)
>>               return -EINVAL;
>>       } else {
>> -        /* Only WCD based SoundWire controller is supported */
>> -        return -ENOTSUPP;
>> +        res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +
>> +        ctrl->reg_read = qcom_swrm_cpu_reg_read;
>> +        ctrl->reg_write = qcom_swrm_cpu_reg_write;
>> +        ctrl->mmio = devm_ioremap_resource(dev, res);
>> +        if (IS_ERR(ctrl->mmio))
>> +            return PTR_ERR(ctrl->mmio);
>>       }
>>       ctrl->irq = of_irq_get(dev->of_node, 0);
>>
