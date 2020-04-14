Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C2871A7737
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 11:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437561AbgDNJUW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 05:20:22 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:60583 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2437569AbgDNJUT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 05:20:19 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586856018; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=+XRnNV94uKt5nAFMee794EpLZKQMMlWET+oJDf9hq18=; b=A1/V73Z0//cvlP4im2fM+r8o+gCpxswZPaK+rbtupDoi9v+3wFCFoBtpSFmUOyRLqnOLy4ML
 NwJI5G0AzlLjauOoSS2dW8HvCWeMQa6/kFS9mIVdLH5pmTtyYy/TbFdZgbTDIbhd+wSjMaQv
 xxqJMZ1dzmvrKuth3U0EiaNfSWg=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e958045.7fd359261b58-smtp-out-n02;
 Tue, 14 Apr 2020 09:20:05 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0BC71C432C2; Tue, 14 Apr 2020 09:20:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.129] (unknown [106.222.14.155])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 02DDCC433CB;
        Tue, 14 Apr 2020 09:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 02DDCC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v17 0/6] Invoke rpmh_flush for non OSI targets
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     swboyd@chromium.org, evgreen@chromium.org, dianders@chromium.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, mka@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org
References: <1586703004-13674-1-git-send-email-mkshah@codeaurora.org>
 <20200414053412.GJ20625@builder.lan>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <b4d25241-00e2-d730-31f1-3a32418a017e@codeaurora.org>
Date:   Tue, 14 Apr 2020 14:49:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200414053412.GJ20625@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Bjorn.

Thanks,
Maulik

On 4/14/2020 11:04 AM, Bjorn Andersson wrote:
> On Sun 12 Apr 07:49 PDT 2020, Maulik Shah wrote:
>
> I sorted them includes and applied the series.
>
> Thanks,
> Bjorn
>
>> Changes in v17:
>> - Address Stephen's comments on change 3 and change 4.
>> - Add Stephen's Reviewed-by on change 5.
>>
>> Changes in v16:
>> - Use base address in probe only, drop change to save it in drv->base
>> - Address Doug's comments on change 5,6 and 7.
>> - Add Doug's Reviewed-by.
>>
>> Changes in v15:
>> - Address Doug's comments on change 3 of v14 and add Reviewed-by
>> - Split change 4 of v14 to save drv->base in a new change
>> - Address Doug's comments on change 4, 5, 6 of v14
>> - Add missing NOTIFY_OK for rpmh_flush() success case
>> - First 5 changes in this series can be merged without change 6 and 7
>>
>> Changes in v14:
>> - Address Doug's comments on change 3 from v13
>> - Drop new APIs for start and end transaction from change 4 in v13
>> - Update change 4 to use cpu pm notifications instead
>> - Add [5] as change 5 to enable use of WAKE TCS when ACTIVE TCS count is 0
>> - Add change 6 to Allow multiple WAKE TCS to be used as ACTIVE TCSes
>> - First 4 changes can be merged even without change 5 and 6.
>>
>> Changes in v13:
>> - Address Stephen's comment to maintain COMPILE_TEST
>> - Address Doug's comments and add new APIs for start and end transaction
>>
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
>> [5] https://patchwork.kernel.org/patch/10818129
>>
>> Maulik Shah (5):
>>    arm64: dts: qcom: sc7180: Add cpuidle low power states
>>    soc: qcom: rpmh: Update dirty flag only when data changes
>>    soc: qcom: rpmh: Invalidate SLEEP and WAKE TCSes before flushing new
>>      data
>>    soc: qcom: rpmh: Invoke rpmh_flush() for dirty caches
>>    soc: qcom: rpmh-rsc: Allow using free WAKE TCS for active request
>>
>> Raju P.L.S.S.S.N (1):
>>    soc: qcom: rpmh-rsc: Clear active mode configuration for wake TCS
>>
>>   arch/arm64/boot/dts/qcom/sc7180.dtsi |  78 +++++++++++++
>>   drivers/soc/qcom/rpmh-internal.h     |  25 ++--
>>   drivers/soc/qcom/rpmh-rsc.c          | 220 +++++++++++++++++++++++++++--------
>>   drivers/soc/qcom/rpmh.c              |  79 ++++++-------
>>   4 files changed, 305 insertions(+), 97 deletions(-)
>>
>> -- 
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
