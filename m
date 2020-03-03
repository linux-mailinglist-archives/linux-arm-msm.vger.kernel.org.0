Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE214176FBB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2020 08:08:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbgCCHIr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Mar 2020 02:08:47 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:24434 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725440AbgCCHIr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Mar 2020 02:08:47 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583219326; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=JQgDVzvKpA6KDke26m4pq5Tx8FwlU3RlXuRZ0AGWW+I=; b=Z5dd94nRMst5+lnPd0NQiQbOpxi94CmNyiYQOFbHJzWGKOGQokemqw9PzzGKlely5CXoVGAO
 d4rncDuUvS5m8ixfCmdWmOP38T/BX3J9YNy87qSVT2rWoSIlvfKp151PbOKbum4ckOhukGCs
 He+xTZ1XOThdgrXuDxrKaPp2vPM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5e027d.7fb47f39d8f0-smtp-out-n03;
 Tue, 03 Mar 2020 07:08:45 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8CE4AC433A2; Tue,  3 Mar 2020 07:08:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.13.37] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BE80CC43383;
        Tue,  3 Mar 2020 07:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BE80CC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v2 4/4] arm64: defconfig: Enable SoC sleep stats driver
 for Qualcomm
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org
References: <1582274986-17490-1-git-send-email-mkshah@codeaurora.org>
 <1582274986-17490-5-git-send-email-mkshah@codeaurora.org>
 <20200228063718.GB857139@builder>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <7f788abe-0ea9-bf7a-63f8-b83e9cf2f58d@codeaurora.org>
Date:   Tue, 3 Mar 2020 12:38:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200228063718.GB857139@builder>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2/28/2020 12:07 PM, Bjorn Andersson wrote:
> On Fri 21 Feb 00:49 PST 2020, Maulik Shah wrote:
>
>> Enable SoC sleep stats driver. The driver gives statistics for
>> various SoC level low power modes.
>>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> ---
>>   arch/arm64/configs/defconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index 0f21288..c63399d 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -767,6 +767,7 @@ CONFIG_QCOM_SMD_RPM=y
>>   CONFIG_QCOM_SMP2P=y
>>   CONFIG_QCOM_SMSM=y
>>   CONFIG_QCOM_SOCINFO=m
>> +CONFIG_QCOM_SOC_SLEEP_STATS=y
> Afaict the driver is not crucial to boot the system or to collect the
> statics, so you should be able to make this =m.
>
> Regards,
> Bjorn
Done. Will update in next revision.

Thanks,
Maulik
>>   CONFIG_ARCH_R8A774A1=y
>>   CONFIG_ARCH_R8A774B1=y
>>   CONFIG_ARCH_R8A774C0=y
>> -- 
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
