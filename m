Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 674216C8E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2019 07:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbfGRFrR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jul 2019 01:47:17 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55976 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726423AbfGRFrR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jul 2019 01:47:17 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 52310606DC; Thu, 18 Jul 2019 05:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563428836;
        bh=/ujdpFaJYkatN6CUI58Cr1STMKLWs0kR78sFppIFlsU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=fvlwjest/4muTYx6f1AXoXmLjgK+YHkSGOdYwd6DYEv4sMD9+74KJjniWuJeqfyOc
         CV0RwzgYpKrlDxgc6W+rtc+SO0LUETB8LYjzZIpW9THlw5kkmv//3AKxy5h55QOaI+
         b2e7xOu//CwM4kPMVdNmXdtrm7zabTTwtsrvgrWg=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 42CAB606DC;
        Thu, 18 Jul 2019 05:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563428834;
        bh=/ujdpFaJYkatN6CUI58Cr1STMKLWs0kR78sFppIFlsU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=CHTV/o0iOuqtVwPxDqUslnjX+79s2m9N0cdasfNgCanHZ1SChWfzPHLowNJhzuuTq
         0THxH+2jf4p8R1FGFPEe/3QclzXY32+2lVyfi98EVwHlLN4tghGDFjg7Qf+FdnChFU
         CgTxtNKxFf0rXDy9Ye0zwyGwyzAL/TbLEpIw3I5Y=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 42CAB606DC
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCHv8 3/5] arm64: dts: qcom: msm8996: Add Coresight support
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Leo Yan <leo.yan@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Mike Leach <mike.leach@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, David Brown <david.brown@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Marc Gonzalez <marc.w.gonzalez@free.fr>
References: <cover.1562940244.git.saiprakash.ranjan@codeaurora.org>
 <2fa725fbc09306f1a95befc62715a708b4c0fad0.1562940244.git.saiprakash.ranjan@codeaurora.org>
 <20190717170050.GB4271@xps15>
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Message-ID: <f28d9c8f-017c-c990-2f00-0ef5a62f3b40@codeaurora.org>
Date:   Thu, 18 Jul 2019 11:17:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190717170050.GB4271@xps15>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mathieu,

On 7/17/2019 10:30 PM, Mathieu Poirier wrote:
> On Fri, Jul 12, 2019 at 07:46:25PM +0530, Sai Prakash Ranjan wrote:
>> From: Vivek Gautam <vivek.gautam@codeaurora.org>
>>
>> Enable coresight support by adding device nodes for the
>> available source, sinks and channel blocks on msm8996.
>>
>> This also adds coresight cpu debug nodes.
>>
>> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> Acked-By: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/msm8996.dtsi | 434 ++++++++++++++++++++++++++
>>   1 file changed, 434 insertions(+)
>>
> 
> We've gone trhough 8 iteration of this set and I'm still finding checkpatch
> problems, and I'm not referring to lines over 80 characters.
> 

I only get below 2 checkpatch warnings:

If you are talking about the below one, then it was not added manually.
It was taken automatically when I pulled in the v7. Should I be
resending this patch for this?

$ ./scripts/checkpatch.pl -g 2fa725fbc09306f1a95befc62715a708b4c0fad0
WARNING: 'Acked-by:' is the preferred signature form
#14:
Acked-By: Suzuki K Poulose <suzuki.poulose@arm.com>

WARNING: line over 80 characters
#154: FILE: arch/arm64/boot/dts/qcom/msm8996.dtsi:763:
+                       compatible = "arm,coresight-dynamic-replicator", 
"arm,primecell";

total: 0 errors, 2 warnings, 440 lines checked


-Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
