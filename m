Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 560763DA1D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 13:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236414AbhG2LNZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 07:13:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236297AbhG2LNZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 07:13:25 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F143C0613C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jul 2021 04:13:21 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id 184so5545949qkh.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jul 2021 04:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lOUMoQBJlC2PCMiLNu33SBSE7t64eq8DXrVqVBCho9I=;
        b=EM3yDiQ0U4Yp+T7AVgTDPkCJyMrodtUCZlGSw85FNQNPdx0HlQ2ZZJ65REaHOELkOd
         bbJHPh/ager50OlEtMsQsURuyJAP3lDYx+xm2TsSKu2pAUt9DkAnZGyd+mK8WN6ZbrYg
         jElXUooMNf6QNZrj+ryN/+xyYNOfB7KKVigs97Lo8zqygUBTAHW/4acixFmpIMjqw7yS
         BLke1ojWecBUl+S3l2WGLjCew78AEPvnWvo3sK2DHcuijirvyPKncVJ0bdCOOeXi2WhN
         LnaY58RwbKUiImMixKaDg9TRjnXXC7U/2+VeaOMWmbxYCC02pibH2M51odYNI1RcO04F
         8Thw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lOUMoQBJlC2PCMiLNu33SBSE7t64eq8DXrVqVBCho9I=;
        b=qurElNexnZOHMZ9Ngz3ocJj4ofXcdsvTYFJAgeHyFdisZDHSThHjcyHPsj+lyb48Eq
         HdyLN/jmm5yj6XdP5FC9ciJP7j1z7R+kq5/ofoJkAbe3PSfXJd5dS45iQAIWdgNh7e9x
         XcPa/OJktMpYMebFUI+3+jShH5BSMKpYB9q9X608n7rXibuwPuJjZqF/3MVEgHBFaCxj
         lp89qVw0I5UvsI2XaLLu8pjl8Om87JBGf9L+LqbzgMh53QhdMtNTqifWvUfQMRXsDvgO
         nYfi/zaE7rVGewnefzjyTaukHbOA7LSb4H7xs4dVEcIyVriJB8zAjyqKP80sX2zjlcyM
         E7OA==
X-Gm-Message-State: AOAM532yFBL8qTbbz+qhoP/4xe4YIrXIERhMcxhxdUnhvGStgGsCl2Aq
        qx0hWo/jMUF6CExDpFizd6KKRQ==
X-Google-Smtp-Source: ABdhPJzr4wyg3lVwhRp3W9uiKOux75ThMsTmAlKO7r+UdBmSq/+uOIAtNb1TQGW7HN0k8iJ2aqVZpA==
X-Received: by 2002:a05:620a:139c:: with SMTP id k28mr4542836qki.292.1627557200642;
        Thu, 29 Jul 2021 04:13:20 -0700 (PDT)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id d4sm1096881qty.15.2021.07.29.04.13.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jul 2021 04:13:20 -0700 (PDT)
Subject: Re: [Patch v4 3/6] cpufreq: qcom-cpufreq-hw: Add dcvs interrupt
 support
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, rjw@rjwysocki.net, robh+dt@kernel.org,
        steev@kali.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20210727152512.1098329-1-thara.gopinath@linaro.org>
 <20210727152512.1098329-4-thara.gopinath@linaro.org>
 <20210728035014.25mgvrpnraxfslq7@vireshk-i7>
 <9a257605-d282-cd06-cc44-5ad5a5f8484d@linaro.org>
 <20210729061713.kzhka7nymo53zw2o@vireshk-i7>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <4d80594c-9088-5d36-44cd-19a98145095c@linaro.org>
Date:   Thu, 29 Jul 2021 07:13:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729061713.kzhka7nymo53zw2o@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/29/21 2:17 AM, Viresh Kumar wrote:
> On 28-07-21, 18:19, Thara Gopinath wrote:
>> Ha! I was too lazy to write this down! So how about I make this a mutex and
> 
> mutex may not work as you come here from irq.

Hi!

So the interrupt handler is a threaded handler. I moved it in v4 since 
one of the "_opp" api has an underlying mutex and was causing issues. So 
using a mutex should be pretty safe in this case.

> 
>> put mod_delayed_work() inside the lock. So it will be something like below
>>
>> qcom_lmh_dcvs_notify()			qcom_cpufreq_hw_lmh_exit()
>>
>> mutex_lock()				mutex_lock()
>>    if (data->cancel_throttle) {		cancel_throttle = true
>> 	mutex_unlock()			mutex_unlock()
>> 	return				cancel_delayed_work_sync()
>>    }					free_irq()
>>    enable_irq() / mod_delayed_work()
>> mutex_unlock()
>>
>> I will let you break it!
> 
> I can't any further :)
> 
> Consider merging below to this patch, it fixes sever other minor
> issues I see in the code.

IIUC, the main change you are suggesting below is to include 
enable_irq() / mod_delayed_work() under the spin_lock as well. Is that 
right ? In which case isn't a mutex better than spinlock?

> 

-- 
Warm Regards
Thara (She/Her/Hers)
