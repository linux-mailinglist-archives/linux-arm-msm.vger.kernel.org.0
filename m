Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7ACD36DFD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Apr 2021 21:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239706AbhD1TpX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Apr 2021 15:45:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238948AbhD1TpS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Apr 2021 15:45:18 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BC26C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 12:44:31 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id l2so12017910wrm.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 12:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Sn7CSGIgmGn5VKzZbm8BRN6Y1B3vMVtXzAiBVY8ViXE=;
        b=uv/K0P/Q182pdyPl5FpzzqZhMn45UrPIPQALeC9OD7sSme6UpfvHw0/R/1YCWlN2q2
         CsnI3gnu3GZAwDve0cqzlzFNIHxFsdGEOEaibi21FxFoD3s43Qwbmp7tI3hWEaHztLxd
         c0hDUzNY3G8xKjcx7mzp9kcjJCEVyMRn7iTADXAV3e/T/xfwVHuYv7COt2dDGXIpk+Hg
         rzXPvmNFz8qIZJsCzv67dywANmiZ2SyEk0+QIGo2b38l4K3tUG4R9Mli88wUto9KblMW
         g2NPN0vIxZdaj2rHJ2vQSa90VvsT4zm3FCvYLfuKgDSEm951TzlCkvKusd0yiIR5Jox7
         82IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Sn7CSGIgmGn5VKzZbm8BRN6Y1B3vMVtXzAiBVY8ViXE=;
        b=itMM53Dv1Z0LIuJwI1+EiH0IIICHUstc7fMHfe00YckOFbZz/VL0fA4zs9HJgUQYUl
         DcbT4/MYSOMr98BdDdxF/7yB+OgCFnYoaO0rcttKyMFo09Tu3PxglFb+BdYAzbZ7Reho
         6pAyvrp5XN9IFBiFV6TYHj4p0MCbs3CTEeqUAashTX2JDVemQ/6XpfD/dIsytv3MnzXA
         BiSIH3PsXR2C54ekZ/smmRjtRiTFNv72PWuMsVp5sOy6gt5k47HJbZpkxkWcxS1l35GB
         9vDaClSkmBgfx6ZIDP3o6JvzYw7OT8K/ix4qbKCPmDhfEwOI9QYkGE8fB3z2sXd8LTKU
         vsyQ==
X-Gm-Message-State: AOAM532gnIpNAI8sZ0uL8JFU9J5t34qRYk2aFY2obax5fJ5JgS9qfHJG
        ARnVoSAonVzE903B9l0p3/szzA==
X-Google-Smtp-Source: ABdhPJwwjzkfU75PzDn/R1kusWKNjG+LnE3S357agzvLt5nuHXVuDf1062RUlHvxyoT7V243QHMmaQ==
X-Received: by 2002:adf:efca:: with SMTP id i10mr37850612wrp.316.1619639070055;
        Wed, 28 Apr 2021 12:44:30 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:c98e:c214:1762:12d3? ([2a01:e34:ed2f:f020:c98e:c214:1762:12d3])
        by smtp.googlemail.com with ESMTPSA id 3sm9510689wma.45.2021.04.28.12.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Apr 2021 12:44:29 -0700 (PDT)
Subject: Re: [thermal-next PATCH 2/2] thermal: qcom: tsens: simplify debugfs
 init function
To:     Thara Gopinath <thara.gopinath@linaro.org>,
        Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210419012930.7727-1-ansuelsmth@gmail.com>
 <20210419012930.7727-2-ansuelsmth@gmail.com>
 <8e679407-07e7-244a-48fa-0d4d451d744d@linaro.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <6c5208b3-8bbd-d00f-9147-c4a35ae202c7@linaro.org>
Date:   Wed, 28 Apr 2021 21:44:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8e679407-07e7-244a-48fa-0d4d451d744d@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/04/2021 18:47, Thara Gopinath wrote:
> Hi,
> 
> Please include a cover letter next time describing the patch series.

Yes, a cover letter helps for the understanding of a patch series but in
this case the changes are simple enough to get rid of it.

> On 4/18/21 9:29 PM, Ansuel Smith wrote:
>> Simplify debugfs init function.
>> - Drop useless variables
>> - Add check for existing dev directory.
>> - Fix wrong version in dbg_version_show (with version 0.0.0, 0.1.0 was
>>    incorrectly reported)
>>
>> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
>> ---
>>   drivers/thermal/qcom/tsens.c | 16 +++++++---------
>>   1 file changed, 7 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
>> index f9d50a67e..b086d1496 100644
>> --- a/drivers/thermal/qcom/tsens.c
>> +++ b/drivers/thermal/qcom/tsens.c
>> @@ -692,7 +692,7 @@ static int dbg_version_show(struct seq_file *s,
>> void *data)
>>               return ret;
>>           seq_printf(s, "%d.%d.%d\n", maj_ver, min_ver, step_ver);
>>       } else {
>> -        seq_puts(s, "0.1.0\n");
>> +        seq_printf(s, "0.%d.0\n", priv->feat->ver_major);
>>       }
>>         return 0;
>> @@ -704,21 +704,19 @@ DEFINE_SHOW_ATTRIBUTE(dbg_sensors);
>>   static void tsens_debug_init(struct platform_device *pdev)
>>   {
>>       struct tsens_priv *priv = platform_get_drvdata(pdev);
>> -    struct dentry *root, *file;
>>   -    root = debugfs_lookup("tsens", NULL);
>> -    if (!root)
>> +    priv->debug_root = debugfs_lookup("tsens", NULL);
>> +    if (!priv->debug_root)
>>           priv->debug_root = debugfs_create_dir("tsens", NULL);
>> -    else
>> -        priv->debug_root = root;
>>   -    file = debugfs_lookup("version", priv->debug_root);
>> -    if (!file)
>> +    if (!debugfs_lookup("version", priv->debug_root))
>>           debugfs_create_file("version", 0444, priv->debug_root,
>>                       pdev, &dbg_version_fops);
>>         /* A directory for each instance of the TSENS IP */
>> -    priv->debug = debugfs_create_dir(dev_name(&pdev->dev),
>> priv->debug_root);
> 
> Unconditionally creating priv->debug here is correct. The below if
> (!priv->debug) will never be true because as per your patch 1, we call
> tsens_debug_init once per instance of tsens.
> 
>> +    priv->debug = debugfs_lookup(dev_name(&pdev->dev),
>> priv->debug_root);
>> +    if (!priv->debug)
>> +        priv->debug = debugfs_create_dir(dev_name(&pdev->dev),
>> priv->debug_root);
>>       debugfs_create_file("sensors", 0444, priv->debug, pdev,
>> &dbg_sensors_fops);
>>   }
>>   #else
>>
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
