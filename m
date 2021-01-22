Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB62B3001A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jan 2021 12:34:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbhAVLdh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Jan 2021 06:33:37 -0500
Received: from a1.mail.mailgun.net ([198.61.254.60]:55009 "EHLO
        a1.mail.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727664AbhAVL1l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Jan 2021 06:27:41 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611314838; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=EcxNP+TLzuN0BO2fcJ/dlWRSp4kMBjsiagD6HdDAIt4=; b=GE0atcx/7Dpm+qFPXC4QdmchqqyG/01jWB8JqfyaoWC1yZY1mJdaFJK+itJ/DBYG2oEvq1Ga
 RmZ/sCZ76OVjbRLrV4wRWBNcy9ml1AYJ/bGOU7verANqoRHhgQyy3ITR3evkrQORvym1WzUB
 s9kEGDdu5q0Gz9RNnK1cBKYIDsQ=
X-Mailgun-Sending-Ip: 198.61.254.60
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 600ab665fb02735e8cd34948 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 22 Jan 2021 11:26:29
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B64F7C43466; Fri, 22 Jan 2021 11:26:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.29.24] (unknown [49.37.157.212])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 835D6C433C6;
        Fri, 22 Jan 2021 11:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 835D6C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH] ASoC: qcom: Fix number of HDMI RDMA channels on sc7180
To:     Mark Brown <broonie@kernel.org>, Stephen Boyd <swboyd@chromium.org>
Cc:     alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        linux-kernel@vger.kernel.org,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Patrick Lai <plai@codeaurora.org>
References: <20210115203329.846824-1-swboyd@chromium.org>
 <161125795422.35635.5979635189908672108.b4-ty@kernel.org>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <89cc3dfb-35da-3498-b126-b440c91f9a45@codeaurora.org>
Date:   Fri, 22 Jan 2021 16:56:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <161125795422.35635.5979635189908672108.b4-ty@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mark and Boyd,

Thanks for your time on this issue.

In my opinion, It 's better not to apply this patch.

I will post patch with changing size in sc7180.dtsi file.


On 1/22/2021 1:09 AM, Mark Brown wrote:
> On Fri, 15 Jan 2021 12:33:29 -0800, Stephen Boyd wrote:
>> Suspending/resuming with an HDMI dongle attached leads to crashes from
>> an audio regmap.
>>
>>   Unable to handle kernel paging request at virtual address ffffffc018068000
>>   Mem abort info:
>>     ESR = 0x96000047
>>     EC = 0x25: DABT (current EL), IL = 32 bits
>>     SET = 0, FnV = 0
>>     EA = 0, S1PTW = 0
>>   Data abort info:
>>     ISV = 0, ISS = 0x00000047
>>     CM = 0, WnR = 1
>>   swapper pgtable: 4k pages, 39-bit VAs, pgdp=0000000081b12000
>>   [ffffffc018068000] pgd=0000000275d14003, pud=0000000275d14003, pmd=000000026365d003, pte=0000000000000000
>>   Internal error: Oops: 96000047 [#1] PREEMPT SMP
>>   Call trace:
>>    regmap_mmio_write32le+0x2c/0x40
>>    regmap_mmio_write+0x48/0x6c
>>    _regmap_bus_reg_write+0x34/0x44
>>    _regmap_write+0x100/0x150
>>    regcache_default_sync+0xc0/0x138
>>    regcache_sync+0x188/0x26c
>>    lpass_platform_pcmops_resume+0x48/0x54 [snd_soc_lpass_platform]
>>    snd_soc_component_resume+0x28/0x40
>>    soc_resume_deferred+0x6c/0x178
>>    process_one_work+0x208/0x3c8
>>    worker_thread+0x23c/0x3e8
>>    kthread+0x144/0x178
>>    ret_from_fork+0x10/0x18
>>   Code: d503201f d50332bf f94002a8 8b344108 (b9000113)
>>
>> [...]
> Applied to
>
>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
>
> Thanks!
>
> [1/1] ASoC: qcom: Fix number of HDMI RDMA channels on sc7180
>        commit: 7dfe20ee92f681ab1342015254ddb77a18f40cdb
>
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
>
> Thanks,
> Mark

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

