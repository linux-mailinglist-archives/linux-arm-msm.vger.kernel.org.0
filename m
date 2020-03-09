Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D48A117DAD4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 09:28:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbgCII2H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 04:28:07 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:61291 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725796AbgCII2G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 04:28:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583742485; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=58JtApA+lyK7XUPWALxooOmt+v/+AZS/J6UTqVCMFcI=; b=SOLvdpL9Y07HPnHs9xB5YvtCzI2zmNHzxW5yE6hVIQY6IAtNxI+oEHL9D+j7Ybem15vLxHYH
 FFVxW3SS7nsWc8mM1WWNSd3Aph3o1EnmTztqrb+yfGBmeUbA4FQk2FvETy1mhHv4D67iwtZx
 ZFmzwaIXckBc9TiMtDJWZ/gMlWg=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e65fe0f.7f59f1c80998-smtp-out-n02;
 Mon, 09 Mar 2020 08:27:59 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A0CA3C433BA; Mon,  9 Mar 2020 08:27:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.13.37] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 48966C433D2;
        Mon,  9 Mar 2020 08:27:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 48966C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v12 0/4] Invoke rpmh_flush for non OSI targets
To:     Doug Anderson <dianders@chromium.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
References: <1583428023-19559-1-git-send-email-mkshah@codeaurora.org>
 <CAD=FV=XwGR+3n__q=ojz7fV3EOSzLYCUdvcsCDY=uLo+eRvUMw@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <8ddfd8a9-7bb3-6107-c7d4-4a552272acfa@codeaurora.org>
Date:   Mon, 9 Mar 2020 13:57:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=XwGR+3n__q=ojz7fV3EOSzLYCUdvcsCDY=uLo+eRvUMw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 3/6/2020 3:52 AM, Doug Anderson wrote:
> Hi,
>
> On Thu, Mar 5, 2020 at 9:07 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>> Changes in v12:
>> - Kconfig change to remove COMPILE_TEST was dropped in v11, reinclude it.
>>
>> Changes in v11:
>> - Address Doug's comments on change 2 and 3
>> - Include change to invalidate TCSes before flush from [4]
>>
>> Changes in v10:
>> - Address Evan's comments to update commit message on change 2
>> - Add Evan's Reviewed by on change 2
>> - Remove comment from rpmh_flush() related to last CPU invoking it
>> - Rebase all changes on top of next-20200302
>>
>> Changes in v9:
>> - Keep rpmh_flush() to invoke from within cache_lock
>> - Remove comments related to only last cpu invoking rpmh_flush()
>>
>> Changes in v8:
>> - Address Stephen's comments on changes 2 and 3
>> - Add Reviewed by from Stephen on change 1
>>
>> Changes in v7:
>> - Address Srinivas's comments to update commit text
>> - Add Reviewed by from Srinivas
>>
>> Changes in v6:
>> - Drop 1 & 2 changes from v5 as they already landed in maintainer tree
>> - Drop 3 & 4 changes from v5 as no user at present for power domain in rsc
>> - Rename subject to appropriate since power domain changes are dropped
>> - Rebase other changes on top of next-20200221
>>
>> Changes in v5:
>> - Add Rob's Acked by on dt-bindings change
>> - Drop firmware psci change
>> - Update cpuidle stats in dtsi to follow PC mode
>> - Include change to update dirty flag when data is updated from [4]
>> - Add change to invoke rpmh_flush when caches are dirty
>>
>> Changes in v4:
>> - Add change to allow hierarchical topology in PC mode
>> - Drop hierarchical domain idle states converter from v3
>> - Address Merge sc7180 dtsi change to add low power modes
>>
>> Changes in v3:
>> - Address Rob's comment on dt property value
>> - Address Stephen's comments on rpmh-rsc driver change
>> - Include sc7180 cpuidle low power mode changes from [1]
>> - Include hierarchical domain idle states converter change from [2]
>>
>> Changes in v2:
>> - Add Stephen's Reviewed-By to the first three patches
>> - Addressed Stephen's comments on fourth patch
>> - Include changes to connect rpmh domain to cpuidle and genpds
>>
>> Resource State Coordinator (RSC) is responsible for powering off/lowering
>> the requirements from CPU subsystem for the associated hardware like buses,
>> clocks, and regulators when all CPUs and cluster is powered down.
>>
>> RSC power domain uses last-man activities provided by genpd framework based
>> on Ulf Hansoon's patch series[3], when the cluster of CPUs enter deepest
>> idle states. As a part of domain poweroff, RSC can lower resource state
>> requirements by flushing the cached sleep and wake state votes for various
>> resources.
>>
>> [1] https://patchwork.kernel.org/patch/11218965
>> [2] https://patchwork.kernel.org/patch/10941671
>> [3] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=222355
>> [4] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=236503
>>
>> Maulik Shah (3):
>>   arm64: dts: qcom: sc7180: Add cpuidle low power states
>>   soc: qcom: rpmh: Update dirty flag only when data changes
>>   soc: qcom: rpmh: Invoke rpmh_flush for dirty caches
>>
>>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 78 ++++++++++++++++++++++++++++++++++++
>>  drivers/soc/qcom/rpmh.c              | 27 ++++++++++---
>>  2 files changed, 100 insertions(+), 5 deletions(-)
> One overall optimization idea?
>
> Should we add two API calls:
>
> rpmh_start_operations()
> rpmh_end_operations()
>
> These optional API calls would be an optimization a client could use.
> When rpmh_start_operations() is called then RPMH code will inhibit
> flushing (but will still update the "dirty" flag).  When
> rpmh_end_operations() is called then the RPMH will flush if the dirty
> flag is set.
>
> This is a pretty simple concept but should have a huge impact in the
> number of times we program hardware in non-OSI mode.  Specifically, if
> we don't do that and we look at what happens in the interconnect code:
>
> 1. We "invalidate" the batch.  We have to flush the non-batch commands
> back into the hardware.
>
> 2. We program the "wake only" commands.  We have to flush the batch
> wake-only commands and also the non-batch commands back into the
> hardware.
>
> 3. We program the "sleep only" commands.  We have to flush yet again
> with everything.
>
>
>
> -Doug

Implemented in v13.

Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
