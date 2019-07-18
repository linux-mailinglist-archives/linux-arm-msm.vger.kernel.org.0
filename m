Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 369556CBFF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2019 11:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389453AbfGRJhX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jul 2019 05:37:23 -0400
Received: from foss.arm.com ([217.140.110.172]:56222 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726665AbfGRJhX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jul 2019 05:37:23 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A992D28;
        Thu, 18 Jul 2019 02:37:22 -0700 (PDT)
Received: from dawn-kernel.cambridge.arm.com (unknown [10.1.197.116])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89B973F71A;
        Thu, 18 Jul 2019 02:37:20 -0700 (PDT)
Subject: Re: [PATCHv8 2/5] arm64: dts: qcom: msm8998: Add Coresight support
To:     saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mathieu.poirier@linaro.org, leo.yan@linaro.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        robh+dt@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, david.brown@linaro.org,
        mark.rutland@arm.com
Cc:     rnayak@codeaurora.org, vivek.gautam@codeaurora.org,
        sibis@codeaurora.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        marc.w.gonzalez@free.fr
References: <cover.1562940244.git.saiprakash.ranjan@codeaurora.org>
 <e510df23f741205fac9030f2c95d06d607549caa.1562940244.git.saiprakash.ranjan@codeaurora.org>
 <3b192063-f31f-b861-d913-61d737cecc57@arm.com>
 <4854b0f7-6a81-bc87-3e63-d2b7c68a44f6@codeaurora.org>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <281e3548-af53-f9a7-b9e4-813b448ab078@arm.com>
Date:   Thu, 18 Jul 2019 10:37:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <4854b0f7-6a81-bc87-3e63-d2b7c68a44f6@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 18/07/2019 10:14, Sai Prakash Ranjan wrote:
> Hi Suzuki,
> 
> On 7/18/2019 1:58 PM, Suzuki K Poulose wrote:
>> Hi Sai,
>>
>>
>>           etr@6048000 {
>>> +            compatible = "arm,coresight-tmc", "arm,primecell";
>>> +            reg = <0x06048000 0x1000>;
>>> +
>>> +            clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc
>>> RPM_SMD_QDSS_A_CLK>;
>>> +            clock-names = "apb_pclk", "atclk";
>>> +            arm,scatter-gather;
>>
>> Please could you confirm that you have tested the scatter-gather mode
>> with ETR ? Either via perf/sysfs. Please could you share your results ?
>> Unless verified
>> this is going to be fatal for the system.
>>
>> Similarly for other platforms.
>>
> 
> Yes I have tested with scatter-gather mode with ETR on all platforms
> which I have posted via sysfs(not perf) before on previous versions of
> this patch series and no issues were found. And I suppose this was
> discussed in v2 of this patch series [1].

Using the sysfs doesn't guarantee that the ETR actually uses SG mode, unless
the buffer size selected is > 1M, which is why I am more interested in the
perf usage. Alternatively you may configure a larger buffer size (say, 8MB) via:

echo 0x800000 > /sys/bus/coresight/.../tmc_etr0/buffer_size


> 
> As said in one of the series initially [1], QCOM msm downstream kernels
> have been using scatter gather mode and we haven't seen any fatal issues.
> 
> [1] https://patchwork.kernel.org/patch/10769535/

I haven't seen any test results there either.

Cheers
Suzuki
