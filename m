Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6C6175102
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2020 00:36:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgCAXgG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Mar 2020 18:36:06 -0500
Received: from mail-qv1-f68.google.com ([209.85.219.68]:39815 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726562AbgCAXgF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Mar 2020 18:36:05 -0500
Received: by mail-qv1-f68.google.com with SMTP id fc12so3315122qvb.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2020 15:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/GiNJ2/rlUqhbIJraZkyEPs9JjHC6+JCTtQcTcJawY0=;
        b=CujpEhgd9L0R3Jf2z/rdQGP/G7t3hzTjm/Uql+k6sF6s4QYY0IvvZ2JBmdwcwKfq+M
         wc+m6pJQ1FWv5vdBfNO0i8wOUw56eq1hrg1V1uqL0IA4JNCHO5i3dQRSu3IiJAJFtuYJ
         ji9MafTThebIT+6EIX2KkTOZHL6EGN7Amhwdef1TWVXr4z/N53hbQj+yVvhXp6W4F+hV
         LPAABheXoy/KO5sJMwWFOXnSR1F/Vjz+JVBb318toxoj+bpCjIKBpFKeHpaLQhOg5HHd
         OhyF0esTMQH+aypeq7CVlxpe7Qo7+C+ArLOEVtuXn6SvSd6s/ZHeawjRXWishHI2M5RW
         Qztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/GiNJ2/rlUqhbIJraZkyEPs9JjHC6+JCTtQcTcJawY0=;
        b=Tl0mTqvrGr+Aw5Q0LK1Uc/uLh0gs8gLCP1u6apJnlVzWTpRNUFZC3a8uqzumppf3KW
         i6Y6em8p/3nEeLAHYWjOEZ0h+513DJwZSYOErlA3YGqkIdt7o0URjHggOSlC+fUpILFo
         zzEqcUN5ddfTVw4vLj3lA6bIljNYhr1LfcU8ExpjQfkCUNn6NC4gc+SNzlqf4c10zf/n
         cT2s/+u0bCx1o9+10A/rdLjEWfl8nnA9cKpDf8IbM7KvshIbypJORKudP+GbG4Br04S5
         Kb5LcZlEir0zzeIH9dWepTiyKmrDhnR7KQIzp7iDlffB/fYx3S7VTq+4TFq1HJeKRn3S
         n1BA==
X-Gm-Message-State: APjAAAWupkQnOWZ6zRmycV0Kh3MpfasOcLqa8H7+tSSE0gTKB4eE5vFG
        Rr2vTdGkHhrDswsxsOahbChjnA==
X-Google-Smtp-Source: APXvYqyt73PBX7UJXStbchmC2Xz7xmShwdxTmmvosxvC9QGdkDP3Gs7j2pTPHXjsPVG6k5A1PsIA2A==
X-Received: by 2002:ad4:40c7:: with SMTP id x7mr13166097qvp.176.1583105764533;
        Sun, 01 Mar 2020 15:36:04 -0800 (PST)
Received: from [192.168.1.92] (pool-71-255-246-27.washdc.fios.verizon.net. [71.255.246.27])
        by smtp.gmail.com with ESMTPSA id n138sm9100868qkn.33.2020.03.01.15.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2020 15:36:03 -0800 (PST)
Subject: Re: [Patch v4 5/7] soc: qcom: Extend RPMh power controller driver to
 register warming devices.
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux PM <linux-pm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <1574254593-16078-1-git-send-email-thara.gopinath@linaro.org>
 <1574254593-16078-6-git-send-email-thara.gopinath@linaro.org>
 <CAPDyKFopiajhFymXo3q558AYBkdDYzU6Ye9HU9XSdN4r8j+qaw@mail.gmail.com>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <6292d698-38f4-6a75-551c-629bbfa3c896@linaro.org>
Date:   Sun, 1 Mar 2020 18:36:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAPDyKFopiajhFymXo3q558AYBkdDYzU6Ye9HU9XSdN4r8j+qaw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/4/20 12:40 PM, Ulf Hansson wrote:
> On Wed, 20 Nov 2019 at 13:56, Thara Gopinath <thara.gopinath@linaro.org> wrote:
>>
>> RPMh power control hosts power domains that can be used as
>> thermal warming devices. Register these power domains
>> with the generic power domain warming device thermal framework.
>>
>> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
>> ---
>> v3->v4:
>>          - Introduce a boolean value is_warming_dev in rpmhpd structure to
>>            indicate if a generic power domain can be used as a warming
>>            device or not.With this change, device tree no longer has to
>>            specify which power domain inside the rpmh power domain provider
>>            is a warming device.
>>          - Move registering of warming devices into a late initcall to
>>            ensure that warming devices are registerd after thermal
>>            framework is initialized.
>>
>>   drivers/soc/qcom/rpmhpd.c | 38 +++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 37 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
>> index 9d37534..5666d1f 100644
>> --- a/drivers/soc/qcom/rpmhpd.c
>> +++ b/drivers/soc/qcom/rpmhpd.c
>> @@ -11,6 +11,7 @@
>>   #include <linux/of_device.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/pm_opp.h>
>> +#include <linux/pwr_domain_warming.h>
>>   #include <soc/qcom/cmd-db.h>
>>   #include <soc/qcom/rpmh.h>
>>   #include <dt-bindings/power/qcom-rpmpd.h>
>> @@ -48,6 +49,7 @@ struct rpmhpd {
>>          bool            enabled;
>>          const char      *res_name;
>>          u32             addr;
>> +       bool            is_warming_dev;
>>   };
>>
>>   struct rpmhpd_desc {
>> @@ -55,6 +57,8 @@ struct rpmhpd_desc {
>>          size_t num_pds;
>>   };
>>
>> +const struct rpmhpd_desc *global_desc;
>> +
>>   static DEFINE_MUTEX(rpmhpd_lock);
>>
>>   /* SDM845 RPMH powerdomains */
>> @@ -89,6 +93,7 @@ static struct rpmhpd sdm845_mx = {
>>          .pd = { .name = "mx", },
>>          .peer = &sdm845_mx_ao,
>>          .res_name = "mx.lvl",
>> +       .is_warming_dev = true,
>>   };
>>
>>   static struct rpmhpd sdm845_mx_ao = {
>> @@ -396,7 +401,14 @@ static int rpmhpd_probe(struct platform_device *pdev)
>>                                                 &rpmhpds[i]->pd);
>>          }
>>
>> -       return of_genpd_add_provider_onecell(pdev->dev.of_node, data);
>> +       ret = of_genpd_add_provider_onecell(pdev->dev.of_node, data);
>> +
>> +       if (ret)
>> +               return ret;
>> +
>> +       global_desc = desc;
> 
> I assume this works fine, for now.
> 
> Although, nothing prevents this driver from being probed for two
> different compatibles for the same platform. Thus the global_desc
> could be overwritten with the last one being probed, so then how do
> you know which one to use?

Yes. It works fine for now. There are multiple ways to fix this in 
future. One is to make global_desc an array. Other would be to move
the code in rpmhpd_init_warming_device to this init and make this a 
post_core init considering thermal subsytem uses core init. Like you 
said I will leave this at this for now and we can fix this if a need 
arises. I don't think there is a need for multiple compatibles for the 
same platform now. Thanks for the reviewed by! I will add it in the next 
version.

> 
>> +
>> +       return 0;
>>   }
>>
>>   static struct platform_driver rpmhpd_driver = {
>> @@ -413,3 +425,27 @@ static int __init rpmhpd_init(void)
>>          return platform_driver_register(&rpmhpd_driver);
>>   }
>>   core_initcall(rpmhpd_init);
>> +
>> +static int __init rpmhpd_init_warming_device(void)
>> +{
>> +       size_t num_pds;
>> +       struct rpmhpd **rpmhpds;
>> +       int i;
>> +
>> +       if (!global_desc)
>> +               return -EINVAL;
>> +
>> +       rpmhpds = global_desc->rpmhpds;
>> +       num_pds = global_desc->num_pds;
>> +
>> +       if (!of_find_property(rpmhpds[0]->dev->of_node, "#cooling-cells", NULL))
>> +               return 0;
>> +
>> +       for (i = 0; i < num_pds; i++)
>> +               if (rpmhpds[i]->is_warming_dev)
>> +                       pwr_domain_warming_register(rpmhpds[i]->dev,
>> +                                                   rpmhpds[i]->res_name, i);
>> +
>> +       return 0;
>> +}
>> +late_initcall(rpmhpd_init_warming_device);
> 
> For the record, there are limitations with this approach, for example
> you can't deal with -EPROBE_DEFER.
> 
> On the other hand, I don't have anything better to suggest, from the
> top of my head. So, feel free to add:
> 
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> 
> Kind regards
> Uffe
> 

-- 
Warm Regards
Thara
