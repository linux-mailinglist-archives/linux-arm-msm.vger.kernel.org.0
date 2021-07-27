Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 007ED3D79CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 17:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237198AbhG0P3m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 11:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237000AbhG0P3i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 11:29:38 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F03ADC0617A2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jul 2021 08:29:17 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id t4so7081722qvj.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jul 2021 08:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GT96W2ZOEoojDz5M8pDOb9+CTD0yhAQtMG6GVe4JdkQ=;
        b=eDL7hgQBA0PqGEhVymQR4EUNmyBuVlMS+hOW9vVkHPrNMZ5p9Y5HgqRd0MEoYfHM6I
         kR+qSGcRQoIdlaeN58IDQE1rvuLJ1KowYhEm5TKPiQlxaAGBL/VVBSn1YJjOgaqVTrBe
         RcwfGdbqn7k2nm5QZGte++YY5cyVnn45Wdk/mw9yJndD4M5aFx0q3z8awE/IfnyEEIMw
         7q/+jEwlrjEKFeLipGYCNB33JZ1siGwdust1Z/kbqqSnKNiVsAyYPyQvI43+VjeSA4Fe
         V6k+U333Drl+tea60+2SZUcnhbxUsyCAAxdh5qHeJYV2IXuQ3EJ1MCdLte+w+mYiFUDA
         ue6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GT96W2ZOEoojDz5M8pDOb9+CTD0yhAQtMG6GVe4JdkQ=;
        b=QwMmAumG9OhpIQz6R8EZIuZb3wXtmAsU1Z3+mNY8EMFWpKGtDPxEU4ap+tSS4ZcH9o
         Nfm4ah6CtQ3GdIJinYTXU5fqSYmwF2Pask+35J+8CrYcrPrk22q5NnWCtTv71TiyXEzh
         6TTkhMIQHoPTtVFLxBMp68Z/wNKK9H/VLpSRMRE3JBMYGmnURSsF7f5VrqDgpeHefhmr
         GSOo+F+1NXRjDKtPx20VGpi/dDFLk/VMcogYm/kchUqFQN1Yorow6rKberjkH2YzfTVG
         vtGW5eh8MOiole7BlVdohyB6aiVzlsCM1RgtvzoApe82NiOGKI2u8gfF4iy5fhp9lz4k
         h6DA==
X-Gm-Message-State: AOAM531FZ+Rr7R2jxsxvtqGcyBjGc3jDCpPHwNd6l3jAZrNkfQj7DAFm
        Mck/ZnwzriLpCLgF/jZ6JHTm4g==
X-Google-Smtp-Source: ABdhPJx8HEHjy8IKGExVBE9Pkl3K44AHEqTcbvipdABfAtpKbdA/9Rk+s125Vm+MLt+AcnuaaDjJzg==
X-Received: by 2002:ad4:5c4a:: with SMTP id a10mr10256122qva.59.1627399757087;
        Tue, 27 Jul 2021 08:29:17 -0700 (PDT)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id n13sm1415537qtx.92.2021.07.27.08.29.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jul 2021 08:29:16 -0700 (PDT)
Subject: Re: [Patch v3 0/6] Introduce LMh driver for Qualcomm SoCs
To:     Steev Klimaszewski <steev@kali.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, viresh.kumar@linaro.org,
        rjw@rjwysocki.net, robh+dt@kernel.org
Cc:     tdas@codeaurora.org, mka@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20210708120656.663851-1-thara.gopinath@linaro.org>
 <c630a7a0-d1d0-d04c-8abf-2490c0932661@kali.org>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <adfe4d6d-7433-23f2-bc57-d6fba2d8725b@linaro.org>
Date:   Tue, 27 Jul 2021 11:29:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c630a7a0-d1d0-d04c-8abf-2490c0932661@kali.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/21/21 11:14 PM, Steev Klimaszewski wrote:
> Hi Thara!
> 
> On 7/8/21 7:06 AM, Thara Gopinath wrote:
>> Limits Management Hardware(LMh) is a hardware infrastructure on some
>> Qualcomm SoCs that can enforce temperature and current limits as programmed
>> by software for certain IPs like CPU. On many newer SoCs LMh is configured
>> by firmware/TZ and no programming is needed from the kernel side. But on
>> certain SoCs like sdm845 the firmware does not do a complete programming of
>> the h/w block. On such SoCs kernel software has to explicitly set up the
>> temperature limits and turn on various monitoring and enforcing algorithms
>> on the hardware.
>>
>> Introduce support for enabling and programming various limit settings and
>> monitoring capabilities of Limits Management Hardware(LMh) associated with
>> cpu clusters. Also introduce support in cpufreq hardware driver to monitor
>> the interrupt associated with cpu frequency throttling so that this
>> information can be conveyed to the schdeuler via thermal pressure
>> interface.
>>
>> With this patch series following cpu performance improvement(30-70%) is
>> observed on sdm845. The reasoning here is that without LMh being programmed
>> properly from the kernel, the default settings were enabling thermal
>> mitigation for CPUs at too low a temperature (around 70-75 degree C).  This
>> in turn meant that many a time CPUs were never actually allowed to hit the
>> maximum possible/required frequencies.
>>
>> UnixBench whets and dhry (./Run whets dhry)
>> System Benchmarks Index Score
>>
>>                  Without LMh Support             With LMh Support
>> 1 copy test     1353.7                          1773.2
>>
>> 8 copy tests    4473.6                          7402.3
>>
>> Sysbench cpu
>> sysbench cpu --threads=8 --time=60 --cpu-max-prime=100000 run
>>
>>                  Without LMh Support             With LMh Support
>> Events per
>> second                  355                             614
>>
>> Avg Latency(ms)         21.84                           13.02
>>
>> v2->v3:
>> 	- Included patch adding dt binding documentation for LMh nodes.
>> 	- Rebased to v5.13
>>
>> Thara Gopinath (6):
>>    firmware: qcom_scm: Introduce SCM calls to access LMh
>>    thermal: qcom: Add support for LMh driver
>>    cpufreq: qcom-cpufreq-hw: Add dcvs interrupt support
>>    arm64: boot: dts: qcom: sdm45: Add support for LMh node
>>    arm64: boot: dts: qcom: sdm845: Remove cpufreq cooling devices for CPU
>>      thermal zones
>>    dt-bindings: thermal: Add dt binding for QCOM LMh
>>
>>   .../devicetree/bindings/thermal/qcom-lmh.yaml | 100 ++++++++
>>   arch/arm64/boot/dts/qcom/sdm845.dtsi          | 162 ++----------
>>   drivers/cpufreq/qcom-cpufreq-hw.c             | 118 +++++++++
>>   drivers/firmware/qcom_scm.c                   |  58 +++++
>>   drivers/firmware/qcom_scm.h                   |   4 +
>>   drivers/thermal/qcom/Kconfig                  |  10 +
>>   drivers/thermal/qcom/Makefile                 |   1 +
>>   drivers/thermal/qcom/lmh.c                    | 239 ++++++++++++++++++
>>   include/linux/qcom_scm.h                      |  14 +
>>   9 files changed, 570 insertions(+), 136 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
>>   create mode 100644 drivers/thermal/qcom/lmh.c
>>
> I've been using these patches on a 5.13 kernel
> (https://github.com/steev/linux/tree/linux-5.13.y - while trying to
> track down a different issue, while playing a video on youtube, as well
> as compressing a 9.2GB file with xz, I got the following

Hi Steev,

Thanks for testing this. I was unable to reproduce this. I have posted 
v4 moving the interrupt handling in qcom-cpufreq-hw to threaded 
interrupt handler and hopefully this should fix the issue. It will be 
great if you can test and let me know.

-- 
Warm Regards
Thara (She/Her/Hers)




