Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47B136CC5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2019 11:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733131AbfGRJyD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jul 2019 05:54:03 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:48738 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727603AbfGRJyD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jul 2019 05:54:03 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id C8B53616B8; Thu, 18 Jul 2019 09:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563443641;
        bh=OQ/MD3YIdSMBrwnP8BDEG6Jw1d6HD1QPQooLjyZnEQ8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=lO4z8bR5105oNnaJ6YcqkK653dcUmfzedbtUJtwc/RenDwLMrPdK0Otz+EyOT4ryt
         nZCkTvARyn1XEnkCwYX08TiZacBZKelA9JKbzEbnpHgB3aRgrgar4kUkVeG/vEMlJl
         LrjhdYQxpNXuBkvhTFn/VVRzByuMyOuDKu92zHx8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.43.47] (unknown [157.49.202.231])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B33D560E40;
        Thu, 18 Jul 2019 09:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563443640;
        bh=OQ/MD3YIdSMBrwnP8BDEG6Jw1d6HD1QPQooLjyZnEQ8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=BNXObLhCuY1vX0ITvrPpNRCgTCe6f5MCZ4kxgDcu/KqePp1F9+dxW/G2tf/Way3I4
         T3lXQ1F3tNbVeM1x13k3SeiQx+CHSwmidV42bBWJDBoSsWcPyv/jNo9FpzsCLhDbLS
         PJ4RioLwbkRJDqaweKZ+gxgB/GOXPbm228lDX9X8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B33D560E40
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCHv8 2/5] arm64: dts: qcom: msm8998: Add Coresight support
To:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        gregkh@linuxfoundation.org, mathieu.poirier@linaro.org,
        leo.yan@linaro.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, robh+dt@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        david.brown@linaro.org, mark.rutland@arm.com
Cc:     rnayak@codeaurora.org, vivek.gautam@codeaurora.org,
        sibis@codeaurora.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        marc.w.gonzalez@free.fr
References: <cover.1562940244.git.saiprakash.ranjan@codeaurora.org>
 <e510df23f741205fac9030f2c95d06d607549caa.1562940244.git.saiprakash.ranjan@codeaurora.org>
 <3b192063-f31f-b861-d913-61d737cecc57@arm.com>
 <4854b0f7-6a81-bc87-3e63-d2b7c68a44f6@codeaurora.org>
 <281e3548-af53-f9a7-b9e4-813b448ab078@arm.com>
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Message-ID: <2b08943b-3900-ceb5-15ac-28ef2bbad03e@codeaurora.org>
Date:   Thu, 18 Jul 2019 15:23:49 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <281e3548-af53-f9a7-b9e4-813b448ab078@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 7/18/2019 3:07 PM, Suzuki K Poulose wrote:
> 
> 
> Using the sysfs doesn't guarantee that the ETR actually uses SG mode, 
> unless
> the buffer size selected is > 1M, which is why I am more interested in the
> perf usage. Alternatively you may configure a larger buffer size (say, 
> 8MB) via:
> 
> echo 0x800000 > /sys/bus/coresight/.../tmc_etr0/buffer_size
> 

Yes, you had mentioned about setting buffer size > 1M in the same 
thread[1] and I had followed the same.

[1] https://lkml.org/lkml/2019/1/18/311

> 
>>
>> As said in one of the series initially [1], QCOM msm downstream kernels
>> have been using scatter gather mode and we haven't seen any fatal issues.
>>
>> [1] https://patchwork.kernel.org/patch/10769535/
> 
> I haven't seen any test results there either.
> 

You did not ask for it there ;)

I do not have the test results handy now and those platforms.
I will arrange for them and post some test results.

Just to confirm, do you need some traces or just the buffer size
and sink set?

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
