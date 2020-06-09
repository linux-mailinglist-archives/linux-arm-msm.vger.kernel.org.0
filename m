Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBDFA1F36E1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 11:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728287AbgFIJSl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 05:18:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728464AbgFIJSi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 05:18:38 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27795C05BD1E
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2020 02:18:38 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id u26so1831603wmn.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2020 02:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tJGJ8BJzJg4ieVtius6n8SlkvkWPHRf40VIWTRbTGp4=;
        b=onLY9YXBv0zZ1owBUiEvSRRyNUTGRGTX851cnDVpoTsoiuXouSWpa2T2oevDIJG2CC
         iwNavKavGT1QQxAYnzUukRJeALf84jtVWigrgkG3IhMztEm6lcdYCDeRYfOytC3r/i1G
         Mh9+8zv77OQ4Squv7bwfM+DB3FZeA21LlKjZhWbZ7NGJoFuLJCrVNTw04fRAh2Ud2TMz
         W9+hsIA/3+DVLqg6OmYq+QlJ37FXtg2k1qwoHVHKYda9HrGOGSBsihPwihaSiZ3g/bqU
         w5vetSIcEgsjeBlHcr+yzajZIYpGw1AewYKllpm7hNud3qfTLBnG3PSQlpFreZBMsZR0
         SWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tJGJ8BJzJg4ieVtius6n8SlkvkWPHRf40VIWTRbTGp4=;
        b=fTvT51/yNkzm2afU6Y5vAVo5m2t0MASynxdhUvpguZ/pLguLL90K87+rTzE2njjbWV
         NVtS8UZJknBggxEkkUQ30tALx6ekbKjxguT4UJNK9DU545FI/63AdVwzqcWOW6szk1B1
         pWcaOQVcclGgdPPYI+trpwuE60ssB0KQqUNhUad0TQ/3lZnyHQBFodxqc35W4FtT7rKM
         3PEhfpo0jnTsFebxlwmoCjTt4WBVe72uBt7I2EFSlr/GycO8mjOz9Q5zFa9NaPn15PK/
         v5zaIe6w/4/KpQwKDtnpXeLYc8BWafSD8xmnB/2Kc2XOKchTdxBco1ceCMKMwHd5ZURU
         VPRQ==
X-Gm-Message-State: AOAM532GBMh5HxlVSY4PAfuCHbwXx4HpFJt5i2iYyX3QOwkL+eU1PnwC
        /pnWLCh8r5T2dQicZuNPo/29Hw==
X-Google-Smtp-Source: ABdhPJy3WHAQJGO4JkS4h3AF6dFtlj9Bma6Ox7rmVQPv43GtLZYFlXU4vOi1Pw23nUnmup0PobpffQ==
X-Received: by 2002:a7b:c7d4:: with SMTP id z20mr2999490wmk.35.1591694316851;
        Tue, 09 Jun 2020 02:18:36 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id y80sm2308211wmc.34.2020.06.09.02.18.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jun 2020 02:18:36 -0700 (PDT)
Subject: Re: [PATCH 2/5] soundwire: qcom: add support for mmio soundwire
 devices
To:     Vinod Koul <vkoul@kernel.org>, Jonathan Marek <jonathan@marek.ca>
Cc:     alsa-devel@alsa-project.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200608204347.19685-1-jonathan@marek.ca>
 <20200608204347.19685-3-jonathan@marek.ca>
 <20200609043420.GA1084979@vkoul-mobl>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <bbb552ce-4b13-0395-e1bc-0b6c5766f4ae@linaro.org>
Date:   Tue, 9 Jun 2020 10:18:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200609043420.GA1084979@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 09/06/2020 05:34, Vinod Koul wrote:
> Hi Jonathan,
> 
> On 08-06-20, 16:43, Jonathan Marek wrote:
>> Adds support for qcom soundwire devices with memory mapped IO registers.
> 
> Please use 'SoundWire Master devices' instead :)
> 
>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   drivers/soundwire/qcom.c | 25 +++++++++++++++++++++++--
>>   1 file changed, 23 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>> index f38d1fd3679f..628747df1c75 100644
>> --- a/drivers/soundwire/qcom.c
>> +++ b/drivers/soundwire/qcom.c
>> @@ -90,6 +90,7 @@ struct qcom_swrm_ctrl {
>>   	struct sdw_bus bus;
>>   	struct device *dev;
>>   	struct regmap *regmap;
>> +	void __iomem *mmio;
>>   	struct completion *comp;
>>   	struct work_struct slave_work;
>>   	/* read/write lock */
>> @@ -154,6 +155,20 @@ static int qcom_swrm_ahb_reg_write(struct qcom_swrm_ctrl *ctrl,
>>   	return SDW_CMD_OK;
>>   }
>>   
>> +static int qcom_swrm_cpu_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
>> +				  u32 *val)
>> +{
>> +	*val = readl(ctrl->mmio + reg);
>> +	return SDW_CMD_OK;
>> +}
>> +
>> +static int qcom_swrm_cpu_reg_write(struct qcom_swrm_ctrl *ctrl, int reg,
>> +				   int val)
>> +{
>> +	writel(val, ctrl->mmio + reg);
>> +	return SDW_CMD_OK;
>> +}
> 
> this looks fine but regmap supports mmio also, so I am thinking we
> should remove these and set regmap (mmio/slim)... Srini..?

That is doable, but not going to add great value in this case, unless we 
are having another layer of abstraction. So keeping it as readl/writel 
seems okay to me.

--srini


> 
