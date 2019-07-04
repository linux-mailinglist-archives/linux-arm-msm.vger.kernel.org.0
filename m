Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92D575F2FF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2019 08:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727231AbfGDGnt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jul 2019 02:43:49 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:46584 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727225AbfGDGns (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jul 2019 02:43:48 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6F59E60746; Thu,  4 Jul 2019 06:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562222627;
        bh=1X/a5esYpZeGW1CmQBkAPcwko0xcLOWRgFpb3G9ejjY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=TDFiiZlHMxnN57/LFYoPv6c+Gkc63IWQfUlT6IhwzsASpgTfmtLCao62YhK6daOLU
         Cmmrwb7tfyu6OIPj8RHTGHlVqyATWtcbQr3kXjQHpE/UKVzp26tYJTP0zC5po6UKxi
         RPfK7QlzC7zUxLBtt8hfuxZiRa+rIQ7oHo3HbR/g=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.79.136.27] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 212DE60746;
        Thu,  4 Jul 2019 06:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562222625;
        bh=1X/a5esYpZeGW1CmQBkAPcwko0xcLOWRgFpb3G9ejjY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=KRGgTCsifDpZLY9tI3ska6jievMGw/EIJcJ3lv8kwsvKdb8mNaCfow6cAz8g0jBQk
         Q1OkSLf/uqSZF9CB0U48cddTgbY27CgikhpDPRFvQ5e17G0fFEUzOf1TmSrNI/D/IZ
         RzcPCf65cH7d8K0vBQKF1EcOko4byceHgddG2LPo=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 212DE60746
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCHv5 1/2] dt-bindings: coresight: Change CPU phandle to
 required property
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Leo Yan <leo.yan@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        David Brown <david.brown@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <cover.1561659046.git.saiprakash.ranjan@codeaurora.org>
 <2afedb941294af7ba0658496b4aca3759a4e43ff.1561659046.git.saiprakash.ranjan@codeaurora.org>
 <CANLsYkxvh+qUDvqG45o7qh61Noq=a=BJ4-p68ipdzxYt6n5bNA@mail.gmail.com>
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Message-ID: <8fb5947e-acf8-faff-5594-2a32151ebee7@codeaurora.org>
Date:   Thu, 4 Jul 2019 12:13:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CANLsYkxvh+qUDvqG45o7qh61Noq=a=BJ4-p68ipdzxYt6n5bNA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/4/2019 1:32 AM, Mathieu Poirier wrote:
> Hi Greg,
> 
> On Thu, 27 Jun 2019 at 12:15, Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>>
>> Do not assume the affinity to CPU0 if cpu phandle is omitted.
>> Update the DT binding rules to reflect the same by changing it
>> to a required property.
>>
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> I'm all good with this patch - can you pick this up for the coming
> merge window?  If not I'll simply keep it in my tree for 5.4.
> 
> Tested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> 

I think you missed adding Greg, adding him now ;)

-Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
