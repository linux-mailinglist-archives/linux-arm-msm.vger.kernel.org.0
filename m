Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24EAE387CCF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 17:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346093AbhERPua (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 May 2021 11:50:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344819AbhERPua (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 May 2021 11:50:30 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C06F5C061756
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 May 2021 08:49:11 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id lz27so15311944ejb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 May 2021 08:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8wobWCeO9TnSsNp7Gs4zzmLKeoIRn3xZJv1FCbDfq60=;
        b=oW+DxoZfcvSH8LaRykrzTmc+KFKmiN+W881QfIJ+3wvCb2PclV+Ja5f2+YuzVzDvn/
         ayseq80JMuj25ZniVCywFM0AX+uoPAZ8oho3RGOE27Eg2VXdmKeoi1WmTmtMQIPo/EyG
         jNakzkGhU/ZV/Kf9GgEqAbPrfsygkXzU5C4HRUouVscXETCmuauBFDveTE7YRBVxo1KR
         JyILTxFoA7xFJIq0P4F+5GPGBVgVg28Ujq5BLPr9vbuBGeJDipg3dq0L5Iv74/isn1R4
         AwYlQwdPwnyj5oIwhh10sElqh9SBEal09w0XNIK62bwFgbOs2vSdTRnmkedTvQG17eHd
         zYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8wobWCeO9TnSsNp7Gs4zzmLKeoIRn3xZJv1FCbDfq60=;
        b=NjoqCDNOx2SbnSv3rXPcIZeUKT15An+/RwEJxs5+1y7gn/84QjqYiLZuVJHNLoHepu
         XcVKg+BnZZRRzCbQmmzaBtHftIVsr458cd26DwjyX0Cj1F6AkHO2SlG1SnSZxe37A8k3
         QsCqpr2KoWb3hQ6PXpAmqtcseGojPrJiFJutuU2EJbSdOL6X/yrwC8qy1RHIzClNLSL0
         Rl4JM+aiU6MhrYltBDAHQKK6WoQesW2D5SS39ADGtvjcyOgOc9EeJNn7xqhz1a5IkAo0
         jQj6UFNZDBCsRPa+MRQarBFNrFA2+eEf7wkfSL7dFlB43y8OYHP+NW7aZRQLD3W07uU1
         6F+g==
X-Gm-Message-State: AOAM530KmJA9wScBfCi5hywayXc5YgKpWmX2AmJRHOs6PCdnUT3uOS7d
        MDNOFujzXZ9+SXsY8NzcTVC7Xw==
X-Google-Smtp-Source: ABdhPJxg7/5WdMrCpZWoWIYBhCrSNmK+yH0GfICeh4qldNd0fp4m6LpEdfMGrLryK2Wtt3rQgMzMdA==
X-Received: by 2002:a17:906:4e8c:: with SMTP id v12mr6733093eju.365.1621352950499;
        Tue, 18 May 2021 08:49:10 -0700 (PDT)
Received: from [192.168.1.14] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id i5sm6739287edt.11.2021.05.18.08.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 May 2021 08:49:10 -0700 (PDT)
Subject: Re: [PATCH v5 13/25] media: venus: core: use
 pm_runtime_resume_and_get()
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <cover.1620314616.git.mchehab+huawei@kernel.org>
 <492e148ae1c7b0a8858c1670037925d3e4adb719.1620314616.git.mchehab+huawei@kernel.org>
 <adb102ab-c197-fdc8-4858-5683bd97baf4@linaro.org>
 <3f41387e-a15f-1e45-6b63-bd6ef647a47f@linaro.org>
 <20210518172014.68f7a655@coco.lan>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <cae92b86-39f3-b00a-76bd-0c81b439b464@linaro.org>
Date:   Tue, 18 May 2021 18:49:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210518172014.68f7a655@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mauro,

On 5/18/21 6:20 PM, Mauro Carvalho Chehab wrote:
> Em Mon, 17 May 2021 18:26:14 +0300
> Stanimir Varbanov <stanimir.varbanov@linaro.org> escreveu:
> 
>> Hi Mauro,
>>
>> On 5/10/21 4:54 PM, Stanimir Varbanov wrote:
>>>
>>>
>>> On 5/6/21 6:25 PM, Mauro Carvalho Chehab wrote:  
>>>> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
>>>> added pm_runtime_resume_and_get() in order to automatically handle
>>>> dev->power.usage_count decrement on errors.
>>>>
>>>> Use the new API, in order to cleanup the error check logic.
>>>>
>>>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>>>> ---
>>>>  drivers/media/platform/qcom/venus/pm_helpers.c | 3 +--
>>>>  1 file changed, 1 insertion(+), 2 deletions(-)  
>>>
>>> Tested-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>>> Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>>>   
>>
>> What is the plan for these venus patches. Do I need to take them through
>> my Venus pull request for v5.14 or you will take them directly?
> 
> Whatever works best for you. In principle, I should apply them on my
> tree probably tomorrow, if ok for you.
> 

It is perfectly fine, please apply them. Thank you!

-- 
regards,
Stan
