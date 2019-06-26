Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAA0D57136
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2019 21:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbfFZTC1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jun 2019 15:02:27 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:34276 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbfFZTC1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jun 2019 15:02:27 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 04EE2611D1; Wed, 26 Jun 2019 19:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561575746;
        bh=ssCLH2DoKTlXWGV9yiNUwpiNQxntMU7hy1HNqKFxCCg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=IcVVxpUgpLgqP/+0mEHeUqYXovFSKQStMg2jAbz0yVjJOFb3AbG9rVchvEvQ3Pn5M
         2nETwgXMFXuDOnCgrecuHG4VYGd0jyvRELr7sjEpTA9y7nOETgHRd5QXDd8zqOwB1p
         M00B3YidJkFCFlWnAwnMWG1SdAyNpejpk4YS0BFI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.100] (unknown [157.45.87.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 02D37611C3;
        Wed, 26 Jun 2019 19:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561575743;
        bh=ssCLH2DoKTlXWGV9yiNUwpiNQxntMU7hy1HNqKFxCCg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=oQTNqSlBgSWSEUG6XfeB1st98U6hzR/AGOTiQ15o5PkdK1RlhOT1Dp8Ogl/L8ITFh
         5oOTx3dBfanB5UeBvQMs40Wb4khZ/Qc7d0xpXDHFT35O+l6/V6qT7S+TfGXhgGrVtc
         tv7kxa597Do8x+Un4bBvHmHuyhhwxCD/RZSqFlt8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 02D37611C3
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCHv3 1/1] coresight: Do not default to CPU0 for missing CPU
 phandle
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Leo Yan <leo.yan@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <cover.1561346998.git.saiprakash.ranjan@codeaurora.org>
 <635466ab6a27781966bb083e93d2ca2729473ced.1561346998.git.saiprakash.ranjan@codeaurora.org>
 <CANLsYky6D5EsCL2vOa4hHaqTQRXbN+TT0pSzFrykDL_fHEkiBQ@mail.gmail.com>
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Message-ID: <68fea180-c3a4-b7d9-09b6-1d3ddbc89f9d@codeaurora.org>
Date:   Thu, 27 Jun 2019 00:32:14 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CANLsYky6D5EsCL2vOa4hHaqTQRXbN+TT0pSzFrykDL_fHEkiBQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mathieu,

On 6/26/2019 11:11 PM, Mathieu Poirier wrote:
> Hi Sai,
> 
> On Sun, 23 Jun 2019 at 21:36, Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
>> index 3c5ceda8db24..4990da2c13e9 100644
>> --- a/drivers/hwtracing/coresight/coresight-platform.c
>> +++ b/drivers/hwtracing/coresight/coresight-platform.c
>> @@ -159,16 +159,16 @@ static int of_coresight_get_cpu(struct device *dev)
>>          struct device_node *dn;
>>
>>          if (!dev->of_node)
>> -               return 0;
>> +               return -ENODEV;
>> +
>>          dn = of_parse_phandle(dev->of_node, "cpu", 0);
>> -       /* Affinity defaults to CPU0 */
>>          if (!dn)
>> -               return 0;
>> +               return -ENODEV;
>> +
>>          cpu = of_cpu_node_to_id(dn);
>>          of_node_put(dn);
>>
>> -       /* Affinity to CPU0 if no cpu nodes are found */
>> -       return (cpu < 0) ? 0 : cpu;
>> +       return cpu;
>>   }
> 
> Function of_coresight_get_cpu() needs to return -ENODEV rather than 0
> when !CONFIG_OF
> 
>>
>>   /*
>> @@ -734,14 +734,14 @@ static int acpi_coresight_get_cpu(struct device *dev)
>>          struct acpi_device *adev = ACPI_COMPANION(dev);
>>
>>          if (!adev)
>> -               return 0;
>> +               return -ENODEV;
>>          status = acpi_get_parent(adev->handle, &cpu_handle);
>>          if (ACPI_FAILURE(status))
>> -               return 0;
>> +               return -ENODEV;
>>
>>          cpu = acpi_handle_to_logical_cpuid(cpu_handle);
>>          if (cpu >= nr_cpu_ids)
>> -               return 0;
>> +               return -ENODEV;
>>          return cpu;
>>   }
>>
> 
> Same as above, but for !CONFIG_ACPI
> 

Have fixed and resent, thanks Mathieu.

-Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
