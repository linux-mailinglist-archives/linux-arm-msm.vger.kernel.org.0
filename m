Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54CCD3D7EEF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 22:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbhG0UNA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 16:13:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230486AbhG0UNA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 16:13:00 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2663C061760
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jul 2021 13:12:59 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id h11so194028ljo.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jul 2021 13:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hJdwyLZxDDjSqKjvoL1s3Fptuec9zrudAviiK5uIFq4=;
        b=y0LRG15gcOCPxxJbe0py1KfISZYQhkFjeH5E1xokuuMvdvs/NWiM3Xd63lkpG4ko7x
         MvwVioD+OFQXUjtPIVqmaoCh5mEzEjUIY5HnF4kMJF9gRrlAFbQvT++e/85Ao8mtVZF/
         GoWnJuF0jqG4l/isjur+jF9pDkSuvedHXcsx9HcrJWfTFxiz8hWv9S2DbVFu2ovrAwyX
         wCiciUlyMwucqM9KPegXWSb3876aeu5qJ42onef7iVb3HvFJU3fe9ahUabTg1C/sgKAT
         3CVbIu+EbixMFdGZlPRfgdbmkhKSt1CQiKnxgKjEcFfMMUS2nwm4WpCmBrB8B4pc359C
         VpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hJdwyLZxDDjSqKjvoL1s3Fptuec9zrudAviiK5uIFq4=;
        b=jv8FSJVfjc0igSn1XFjHmQEjTad8ikxKElHo1cGd+qvDeW3uAyZHDTgJhgHX8CsblY
         crqU+SPzqH+wlCURvZiq+6akdOMpPRiIcx9NJ8yfk3/eKLRSVq+E0h2SFB3qInqOGN2d
         tEujfnn1t2CFSDpYDD8TYOM20vtnjwiJZ/nTLirE6N00MnhwHOSw0xlA8sPgjLZuNwrv
         6AEjHaGXqSsO+mNN/uYNM6s5HoMzrGn+2qwtmbtHgaoOmqS5yYRcjyQlZqAGXBa7P6jO
         cG64ntZOzqepGGvTp63XpoF8OtZgQhqIhQ5OVDdJL5aZOwAar0Y6Nv3eKSmYEup8SYWt
         82dg==
X-Gm-Message-State: AOAM533nyiSZq5Uv9iRCXREAsFEZsIAmxGYI20R8mwcLwpc25OAwScT9
        0WhZr6XM37EXOf/jUKm5VKGj+g==
X-Google-Smtp-Source: ABdhPJy3k6+cYR+xRM1Hj9r8u1PajWhOMjCMjiWtJPurh8k1s+er0ecEA6MpkwFxPWuzVJw9wNJXdQ==
X-Received: by 2002:a05:651c:110:: with SMTP id a16mr15830333ljb.241.1627416778093;
        Tue, 27 Jul 2021 13:12:58 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t30sm357001ljo.124.2021.07.27.13.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jul 2021 13:12:57 -0700 (PDT)
Subject: Re: [PATCH v5 3/9] PM: runtime: add devm_pm_runtime_enable helper
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210718104901.454843-1-dmitry.baryshkov@linaro.org>
 <20210718104901.454843-4-dmitry.baryshkov@linaro.org>
 <CAPDyKFqws1iC+PtQ3iRzzFF1NQZ=huRbA3wNBbS2gmyVqgmhxQ@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <16a86c26-8930-c7bd-3afd-d92f56fe005f@linaro.org>
Date:   Tue, 27 Jul 2021 23:12:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFqws1iC+PtQ3iRzzFF1NQZ=huRbA3wNBbS2gmyVqgmhxQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/07/2021 13:26, Ulf Hansson wrote:
> On Sun, 18 Jul 2021 at 12:49, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> Add helper function handling typical driver action: call
>> pm_runtime_enable at the probe() time and disable it during remove().
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/base/power/runtime.c | 17 +++++++++++++++++
>>   include/linux/pm_runtime.h   |  4 ++++
>>   2 files changed, 21 insertions(+)
> 
> First, this needs to be sent to the correct maintainers (Rafael) and
> also the mailing list (linux-pm).
> 
> Second, to not stall the series by $subject patch as it will likely
> need to be funneled through Rafael's tree, perhaps it's just better to
> do the "open coding" in the qcom drivers for now.

Ack

> 
> Kind regards
> Uffe
> 
>>
>> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
>> index 8a66eaf731e4..ec94049442b9 100644
>> --- a/drivers/base/power/runtime.c
>> +++ b/drivers/base/power/runtime.c
>> @@ -1447,6 +1447,23 @@ void pm_runtime_enable(struct device *dev)
>>   }
>>   EXPORT_SYMBOL_GPL(pm_runtime_enable);
>>
>> +static void pm_runtime_disable_action(void *data)
>> +{
>> +       pm_runtime_disable(data);
>> +}
>> +
>> +/**
>> + * devm_pm_runtime_enable - devres-enabled version of pm_runtime_enable.
>> + * @dev: Device to handle.
>> + */
>> +int devm_pm_runtime_enable(struct device *dev)
>> +{
>> +       pm_runtime_enable(dev);
>> +
>> +       return devm_add_action_or_reset(dev, pm_runtime_disable_action, dev);
>> +}
>> +EXPORT_SYMBOL_GPL(devm_pm_runtime_enable);
>> +
>>   /**
>>    * pm_runtime_forbid - Block runtime PM of a device.
>>    * @dev: Device to handle.
>> diff --git a/include/linux/pm_runtime.h b/include/linux/pm_runtime.h
>> index aab8b35e9f8a..222da43b7096 100644
>> --- a/include/linux/pm_runtime.h
>> +++ b/include/linux/pm_runtime.h
>> @@ -59,6 +59,8 @@ extern void pm_runtime_put_suppliers(struct device *dev);
>>   extern void pm_runtime_new_link(struct device *dev);
>>   extern void pm_runtime_drop_link(struct device_link *link);
>>
>> +extern int devm_pm_runtime_enable(struct device *dev);
>> +
>>   /**
>>    * pm_runtime_get_if_in_use - Conditionally bump up runtime PM usage counter.
>>    * @dev: Target device.
>> @@ -253,6 +255,8 @@ static inline void __pm_runtime_disable(struct device *dev, bool c) {}
>>   static inline void pm_runtime_allow(struct device *dev) {}
>>   static inline void pm_runtime_forbid(struct device *dev) {}
>>
>> +static inline int devm_pm_runtime_enable(struct device *dev) { return 0; }
>> +
>>   static inline void pm_suspend_ignore_children(struct device *dev, bool enable) {}
>>   static inline void pm_runtime_get_noresume(struct device *dev) {}
>>   static inline void pm_runtime_put_noidle(struct device *dev) {}
>> --
>> 2.30.2
>>


-- 
With best wishes
Dmitry
