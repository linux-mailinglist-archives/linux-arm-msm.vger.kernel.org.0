Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B37A1F3976
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 13:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728993AbgFILUJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 07:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727002AbgFILUH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 07:20:07 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECACEC05BD1E
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2020 04:20:06 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id c185so20336236qke.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2020 04:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4vbbsEa1uHDWb6XV9nSWbJE6AZC1+QscXr2WsFVfdlg=;
        b=KBLTK0dtfIy71HT/+n78qaq5LuFpORynM8pRT77MsxRZ5O33t4z0oAYrLv2SrM0R29
         WpRFkWTy3qANgKFRoV+Ck6M+A6U2SI+r6BvGxIgGVXs5+1bfVQ8CH16CrW4Ql/+hqa1V
         bwBNHpGx2H6qmtqx9CZLLk2ETY0imojIN0z9xzcNgTjntduaCp+JVN7qXvTmAv+T3ws6
         X52XbZmcup7Eytg6ZdzBpqg5v+O7/BNQWlqqTNTuYITHoOD002EgFS0mXiMVx/ts5ivN
         cn4wYsSDaRTFkH6j4VtCP9uLcBI5ws6Q2L7xBe3dv/75UZqCD8hSR/yhjMPohMSXr4ym
         gWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4vbbsEa1uHDWb6XV9nSWbJE6AZC1+QscXr2WsFVfdlg=;
        b=kyW92hZPd8p+uPIWCYLpOfOOujeQj/ZioYIZF2HrHwrzQRezhKKbF8QiKubxw+UqdM
         /ZtZf6KJ3mBIr3HjUo4qO++YLHjThln2bcJD2TCuyb+qPeLei9GCOhv8OFTnfEv48XIL
         wz0zWv7Q4pBm7rZ7kZF1hqK7IZoJKP9zA1daGUAaZL21k/AFks5NyzWmyGH2NRc28Ptj
         vLry7QRNJDmC1GDugdFcMrNgMvikD+lvGOsJkUbCpXljwgg2vA0PHvo5L7sVgckY2UTj
         Kyd+2gO8N8LC6yFCiJQiLynvVfwXahR5BuaE9vAFOX7C/hsHIFiHfaMiwW1gw9iTT3vc
         bPRg==
X-Gm-Message-State: AOAM530p8GEPTtllpGm5g1YOn7s2UKdknmxguTYvjVo8ecF8x7sTaD9K
        H3rXu8PjK5VgFxuTUUpxb4PPlw==
X-Google-Smtp-Source: ABdhPJzGJWLUixIeMGp2s5w5M+K/KN66kGS5c/6596VKFiPwBd+ENjZROdgaFYOPukx7ceM6miyzNw==
X-Received: by 2002:a37:9e10:: with SMTP id h16mr27201817qke.381.1591701606051;
        Tue, 09 Jun 2020 04:20:06 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id r37sm10260096qtk.34.2020.06.09.04.20.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2020 04:20:05 -0700 (PDT)
Subject: Re: [PATCH 2/5] soundwire: qcom: add support for mmio soundwire
 devices
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     alsa-devel@alsa-project.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200608204347.19685-1-jonathan@marek.ca>
 <20200608204347.19685-3-jonathan@marek.ca>
 <20200609043420.GA1084979@vkoul-mobl>
 <bbb552ce-4b13-0395-e1bc-0b6c5766f4ae@linaro.org>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <a1098c40-adba-7e49-6d82-d7c50a6d286a@marek.ca>
Date:   Tue, 9 Jun 2020 07:20:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <bbb552ce-4b13-0395-e1bc-0b6c5766f4ae@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/9/20 5:18 AM, Srinivas Kandagatla wrote:
> 
> 
> On 09/06/2020 05:34, Vinod Koul wrote:
>> Hi Jonathan,
>>
>> On 08-06-20, 16:43, Jonathan Marek wrote:
>>> Adds support for qcom soundwire devices with memory mapped IO registers.
>>
>> Please use 'SoundWire Master devices' instead :)
>>
>>>
>>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>>> ---
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
>>
>> this looks fine but regmap supports mmio also, so I am thinking we
>> should remove these and set regmap (mmio/slim)... Srini..?
> 
> That is doable, but not going to add great value in this case, unless we 
> are having another layer of abstraction. So keeping it as readl/writel 
> seems okay to me.
> 

Adding to this, the slim case doesn't use the regmap directly, it goes 
through AHB_BRIDGE registers. So using a single regmap path is not 
"doable" (at least not in a nice way IMO).

> --srini
> 
> 
>>
