Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 064EE573942
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jul 2022 16:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231646AbiGMOwy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jul 2022 10:52:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbiGMOwy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jul 2022 10:52:54 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A16A3C14D
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jul 2022 07:52:53 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id ay25so6671643wmb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jul 2022 07:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=EGhT6oQLUBa+W/fyk6df1q5eONVnZeGwxski/kFteZ4=;
        b=pSgcyEdw0OMPfVzZ7hiuBQyBxbiO6YQHB2bIzLkBznHKWZN4EhLPZRbkheBwgecffS
         y6o8ok3k0AS+LxOIouzTFYnUgcr7U+cxElQI6CGLFnF01wFGbVlz6aqsFeI+m2TYw0Zj
         /Bi5IalvL1Bx+FI8RpLH7xMPMBFiEjzVsz1SSRJLD41378cgiBFXKJtu2GPELRYYXj+o
         XiDHAQYMzOMQX425adgDCdgUKQ6uNAumZEY8hgFtckWtoUPJXWHqZ/UIJRcviyYM1RLZ
         TnsypqIv7164hUxOH7N8VxHkSuRX5fTUvRUA5pDnPxZ9JsBuzTfGdXFg3WxKELRPXHsj
         SicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EGhT6oQLUBa+W/fyk6df1q5eONVnZeGwxski/kFteZ4=;
        b=OJw/26TfDL7ivBw63Jk+4cgspFsZcXx5BuHk2Zw9nDKFY+JAspI+6y3gmXhx065muI
         2jiKufJHmFOpuiZ0hfCmqw5GoJ1LY6nPtUJzidzqDr08/xjf1fJ2+ZUwjZhdMP3Kf4pg
         QFU2IO6lOrYrCpqrAwXyKFDwYhCj2qk5UWhPcL51ueBDOcTFixBJtWbSjSsCVdbOEL6J
         /5NC+Qbjyzioa5DZgyR6ePWxa6u6kOhtQWuRaNO+mMIAONgZqBMmr029TUng0fzwxdxW
         EyBJbKgPW/0yYjaBl9EW3uNmbuK/qOQtb0/W9pI/pxg9CsT042IL3TaIraDmHbSTya/o
         MwKw==
X-Gm-Message-State: AJIora8rsg0NwWvtPhjEMyD0g9Jw6WBOM69dh2KJtishEVWIU1N7xTb8
        rNKvJdUPDV20JmX3PpnLabTV6w==
X-Google-Smtp-Source: AGRyM1t9d1sJ+OIQ8vqqOHKXJXvMUn1FrgqN+sm2nQFxkb6mskex0F72PB+c+DGmeQjKW9EjKpVOTg==
X-Received: by 2002:a05:600c:1c0e:b0:3a1:9a4b:28ee with SMTP id j14-20020a05600c1c0e00b003a19a4b28eemr9744187wms.203.1657723971679;
        Wed, 13 Jul 2022 07:52:51 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bg11-20020a05600c3c8b00b003a1980d55c4sm2657615wmb.47.2022.07.13.07.52.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jul 2022 07:52:51 -0700 (PDT)
Message-ID: <ded0065e-0315-ce1f-01da-bdf3b83adf66@linaro.org>
Date:   Wed, 13 Jul 2022 15:52:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RESEND PATCH 4/5] cpufreq: qcom-cpufreq-nvmem: Rename qcs404
 data to cpr_genpd
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        ilia.lin@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        rafael@kernel.org, viresh.kumar@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20220629130303.3288306-1-bryan.odonoghue@linaro.org>
 <20220629130303.3288306-5-bryan.odonoghue@linaro.org>
 <e160364f-68b9-2ab6-e48d-86d12e4a2f0c@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <e160364f-68b9-2ab6-e48d-86d12e4a2f0c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/07/2022 14:50, Dmitry Baryshkov wrote:
> On 29/06/2022 16:03, Bryan O'Donoghue wrote:
>> At the moment the CPR genpd based code is named after the qcs404 however
>> msm8936, msm8939 and other antecedent processors of the qcs404 can also
>> make use of this data.
>>
>> Rename it to reflect a more generic use.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   drivers/cpufreq/qcom-cpufreq-nvmem.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c 
>> b/drivers/cpufreq/qcom-cpufreq-nvmem.c
>> index 6dfa86971a757..355c8b99e974a 100644
>> --- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
>> +++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
>> @@ -252,10 +252,10 @@ static const struct qcom_cpufreq_match_data 
>> match_data_krait = {
>>       .get_version = qcom_cpufreq_krait_name_version,
>>   };
>> -static const char *qcs404_genpd_names[] = { "cpr", NULL };
>> +static const char *cpr_genpd_names[] = { "cpr", NULL };
> 
> As a generic comment, as you are touching this piece of code, code you 
> please move cpr_genpd_names above match_data_kryo? So that all 
> match_data instances can use it.

NP.

This has been dropped in V3 per Stephan's preference to not touch 
anything CPR related until doing the whole thing for 8939.

---
bod

