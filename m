Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BABF4954E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jan 2022 20:32:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347223AbiATTcH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jan 2022 14:32:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231733AbiATTcF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jan 2022 14:32:05 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E88E5C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jan 2022 11:32:04 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id s61-20020a17090a69c300b001b4d0427ea2so10880236pjj.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jan 2022 11:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=X5WAzIxDTkyxIZIfLA7zVlKDebLcwsAnnd4EsqerCs0=;
        b=PXAUFdrg39jWP9KQSJnqZHseJEry2XHsAATfJztAz4ao8s+ncqljBdum3TMtcq7hXY
         h+VpEzNzAdk3hxV/NMEZdUL8kzdX3qWWMzXEfqJuxtCaeH5JZRjDs/7crmLENOMcieu+
         iPHEVsSHXL2FUsXZfeFIaZdZSlipkW2bKvUQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=X5WAzIxDTkyxIZIfLA7zVlKDebLcwsAnnd4EsqerCs0=;
        b=LVBkYxD2sd/Bzuqh73KycZutXWUN+AXpv5XL6/zZoEM41Ten2fb9phWi5vvzkKNrmA
         ZkECmAvTsaWYIFowpz5rO5wElU5iKkJt979doSYzfljrW61XnoLB1mbnOxeKDNzFnj+5
         4bCZF14W0JOsm/wNGbtV6GRk+oToFTlIklEb9N77XOivRFe+WAHMYzooPP24C0PBH85n
         V4QBSGkf2A/twYYueXWk3dEDHUd4e5vhyeK/MmAloMSW9Jg1U1R3D/LgwGCd6e/8Agwa
         b9TtZggrNr5oHa7ltgd+Ml5U+QwXrC2rrptJeD7bS8JLA/M85CBHMvQgS1iT9KsuSAvJ
         jW6A==
X-Gm-Message-State: AOAM531hafgDvV+XUAJi9X2tsnnrOuI43nXr0i+Wx8TEbTumGQj0kF3r
        KcECMzQ/xiL6jaGc5keCEzH/EQ==
X-Google-Smtp-Source: ABdhPJysjmZstPUoFDXt61dN+xUALOtaMIIfAuYp0kfR47pU8wHWGaxbjf/YzPdWDERzDMsr6+j9ZQ==
X-Received: by 2002:a17:902:8e82:b0:149:b26a:b9c8 with SMTP id bg2-20020a1709028e8200b00149b26ab9c8mr443501plb.143.1642707124317;
        Thu, 20 Jan 2022 11:32:04 -0800 (PST)
Received: from benl-m5lvdt.local ([2600:1700:87d7:48f:b42f:611e:846e:37fd])
        by smtp.gmail.com with ESMTPSA id rj9sm3254062pjb.49.2022.01.20.11.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jan 2022 11:32:03 -0800 (PST)
Subject: Re: [PATCH v2] drivers: thermal: tsens: respect thermal_device_mode
 in threshold irq reporting
To:     Amit Kucheria <amitk@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Linux PM list <linux-pm@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20220114031730.25621-1-benl@squareup.com>
 <CAHLCerNYXxrW=K6hQ38mXd+3V-u=5_NFXKBoaOx+yUaYW5Zu7A@mail.gmail.com>
From:   Benjamin Li <benl@squareup.com>
Message-ID: <30c38867-78b0-d3a1-ffcf-9612a7befc3a@squareup.com>
Date:   Thu, 20 Jan 2022 11:32:01 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHLCerNYXxrW=K6hQ38mXd+3V-u=5_NFXKBoaOx+yUaYW5Zu7A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 1/19/22 4:33 PM, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks!

On 1/20/22 3:40 AM, Amit Kucheria wrote:
>> +                               dev_dbg(priv->dev, "[%u] %s: TZ update trigger (%d mC)\n",
>> +                                       hw_id, __func__, temp);
>> +                               thermal_zone_device_update(s->tzd, THERMAL_EVENT_UNSPECIFIED);
>> +                       } else {
>> +                               dev_dbg(priv->dev, "[%u] %s: TZ update trigger (%d mC) skipped as zone disabled\n",
> 
> Hmm. I don't like the fact that these messages won't be visible to
> users in dmesg unless they're debugging. This change puts the SoC in a
> potentially unsafe state. Perhaps we should print a ratelimited
> message in the logs that we're operating outside safety limits?

That seems fine, I'll change to dev_info_ratelimited and make the message
a bit scarier.

> 
>> +                                       hw_id, __func__, temp);
>> +                       }
>>                 } else {
>> -                       dev_dbg(priv->dev, "[%u] %s: no violation:  %d\n",
>> -                               hw_id, __func__, temp);
>> +                       dev_dbg(priv->dev, "[%u] %s: no violation:  %d\n", hw_id, __func__, temp);
> 
> Get rid of this hunk, it is unrelated to the above change.

Will do.


> 
>>                 }
>>
>>                 if (tsens_version(priv) < VER_0_1) {
>> --
>> 2.17.1
>>
