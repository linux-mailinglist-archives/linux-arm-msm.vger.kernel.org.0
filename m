Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D1823839FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 May 2021 18:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243382AbhEQQfA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 May 2021 12:35:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239933AbhEQQey (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 May 2021 12:34:54 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 519BBC0784B3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 May 2021 08:26:17 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id s6so7378967edu.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 May 2021 08:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FMXziopFsM5hZJ5tJCaOnr2WSysiINJBqzAKuPzSazg=;
        b=zMnyJdRkgrggyXHkBPAoTzSgccs/deh3e9nQLHDXHS4oVzpWXsyeSHEqbgsHyMAGhu
         hwaWpvMvCrv1Ow6jDJi1X7IhekkkkVTVFZmWxqdjFSrY4zBU0DceGjgtMqMKixH7UBeB
         Z5RvPCxWGrq8RkegMijDx9uQC2JeY/ntjxv2Khu/ovOBezsdBdAEB9DbiTjHhLs35otL
         BgU09nq8smNwZNADM7BYrtlXaK4ViiR5sbvIiBvVQLeqOmSa1w9JEbHO7I7pWm/TsYC2
         Im7Vo2AOhSfwv6wiy/zcVVlB/e5c/re8cFxlfXoN1UP9c8s+GYes92/n3Smu5sT2oDt9
         MAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FMXziopFsM5hZJ5tJCaOnr2WSysiINJBqzAKuPzSazg=;
        b=hDcr/M6HKK8Xf92/X92VJxXQGCs0dsnrObSUHNDQzxB9ure5wAL+8y7fm63LQA7aS0
         +3YuTCpq83MLiFtwtbqxAWpFKe45zBj4gvfNXYnmKgqZzyI8VAhGLSMc7dsGqSobmd86
         ospvEyma4l3SRLKt3GRdVfLquggy6JIkXJBc6h1uV3dMCmJCwpe2//ptykbBTIrCDXLJ
         L0nAnl25u2eKcRqvK/TMC8vnhFYLCR9zJHrMZ4pkqv1ijydkqf1TJ7BvMEAGmkylnZrh
         VWuUxh3J6ZAwDmt0X3gopHnm8tfszmVhIN5gLaNAG1q8DLBEWFeoAcZkVhAQGZGOFBHh
         8ehg==
X-Gm-Message-State: AOAM533t41ftpdLZuh3GH5wQ0dYzKE7V7f1qmGblfQlc6mbOIAZ45WPk
        HZBE6saINDbz05HJEvbjX+343w==
X-Google-Smtp-Source: ABdhPJz/rWM+jlM8kM4engSuvbup9nLXtzNT6IXPnl8FUn+YJnPEInF+khKW0iXcv4OdpH4knwBVxg==
X-Received: by 2002:a50:f1ca:: with SMTP id y10mr695954edl.294.1621265176124;
        Mon, 17 May 2021 08:26:16 -0700 (PDT)
Received: from [192.168.1.14] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id qx18sm2481396ejb.113.2021.05.17.08.26.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 08:26:15 -0700 (PDT)
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
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <3f41387e-a15f-1e45-6b63-bd6ef647a47f@linaro.org>
Date:   Mon, 17 May 2021 18:26:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <adb102ab-c197-fdc8-4858-5683bd97baf4@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mauro,

On 5/10/21 4:54 PM, Stanimir Varbanov wrote:
> 
> 
> On 5/6/21 6:25 PM, Mauro Carvalho Chehab wrote:
>> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
>> added pm_runtime_resume_and_get() in order to automatically handle
>> dev->power.usage_count decrement on errors.
>>
>> Use the new API, in order to cleanup the error check logic.
>>
>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>> ---
>>  drivers/media/platform/qcom/venus/pm_helpers.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> Tested-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> 

What is the plan for these venus patches. Do I need to take them through
my Venus pull request for v5.14 or you will take them directly?

>>
>> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
>> index c7e1ebec47ee..d0fddf5e9a69 100644
>> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
>> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
>> @@ -990,9 +990,8 @@ static int core_power_v4(struct venus_core *core, int on)
>>  
>>  	if (on == POWER_ON) {
>>  		if (pmctrl) {
>> -			ret = pm_runtime_get_sync(pmctrl);
>> +			ret = pm_runtime_resume_and_get(pmctrl);
>>  			if (ret < 0) {
>> -				pm_runtime_put_noidle(pmctrl);
>>  				return ret;
>>  			}
>>  		}
>>
> 

-- 
regards,
Stan
