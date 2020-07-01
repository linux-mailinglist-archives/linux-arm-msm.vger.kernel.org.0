Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65F53210A48
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2020 13:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730240AbgGAL21 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jul 2020 07:28:27 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:48003 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730238AbgGAL20 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jul 2020 07:28:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593602905; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ELbkVNkvv2QKPq9yfmUAk6/gAsnRwgGG4Ne3CuTu8y4=; b=UfOtJ+xSTEc5rjxZD6eKZyKQhO27bLM9HLyFmWh74POcXwiLcFCoVx5YlaHAnN2sQja51YLs
 X7ljbHpL7hdeT0zscrnf2cEuCrLeE+p/eL1RRdECFKBa3FROx2/a1OeO8uxTspdLDIejumox
 FuKT5+Xvytqck1awHsokWOJcuoM=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-east-1.postgun.com with SMTP id
 5efc73560206ad41d14c5668 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 01 Jul 2020 11:28:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 10C4CC433CB; Wed,  1 Jul 2020 11:28:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.50.36.152] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6E245C433C6;
        Wed,  1 Jul 2020 11:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6E245C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v6 0/6] DVFS for IO devices on sdm845 and sc7180
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mark Brown <broonie@kernel.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, robdclark@gmail.com,
        robdclark@chromium.org, viresh.kumar@linaro.org, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1592222564-13556-1-git-send-email-rnayak@codeaurora.org>
 <20200617221546.GC4525@google.com>
 <4f3d4c91-2a01-8ef5-1ad0-73ed354f930a@codeaurora.org>
 <9bb7fbb6-6309-3f30-dd4f-2ee3d187c074@linaro.org>
 <3ec9bc56-3e31-64fe-320a-2dc153a81f98@codeaurora.org>
 <d715708b-db7a-efb7-5861-aa5bb8dfcd86@linaro.org>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <9bcf3419-d394-268e-c2af-c7b71574ab8e@codeaurora.org>
Date:   Wed, 1 Jul 2020 16:58:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <d715708b-db7a-efb7-5861-aa5bb8dfcd86@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Stan,

>>
>> Hey Stan,
>>   
>>> On 6/18/20 7:47 AM, Rajendra Nayak wrote:
>>>> Hey Matthias, thanks for summarizing this.
>>>>
>>>> On 6/18/2020 3:45 AM, Matthias Kaehlcke wrote:
>>>>> What is the plan for landing these, it seems not all must/should
>>>>> go through the QCOM tree.
>>>>>
>>>>> My guesses:
>>>>>
>>>>> tty: serial: qcom_geni_serial: Use OPP API to set clk/perf state
>>>>> spi: spi-geni-qcom: Use OPP API to set clk/perf state
>>>>>      QCOM tree due to shared dependency on change in
>>>>> include/linux/qcom-geni-se.h
>>>>
>>>> That's correct, Bjorn/Andy, can these be pulled in now for 5.9?
>>>> They have acks from Greg for serial and Mark for the spi patch.
>>>>   
>>>>> drm/msm/dpu: Use OPP API to set clk/perf state
>>>>> drm/msm: dsi: Use OPP API to set clk/perf state
>>>>>      drm/msm tree
>>>>
>>>> Correct, the dsi patch is still not reviewed by Rob, so once that's
>>>> done,
>>>> I am guessing Rob would pull both of these.
>>>>
>>>>>
>>>>> media: venus: core: Add support for opp tables/perf voting
>>>>>      venus tree
>>>>
>>>> correct, this is pending review/ack from Stan.
>>>
>>> I tested the changes in the driver, and they looks fine. But when
>>> applied the corresponding change in the DT node I see this message when
>>> the streaming is stopping:
>>>
>>> qcom_rpmh TCS Busy, retrying RPMH message send: addr=0x30000
>>>
>>> I tested on v5.7 (linaro-integration). Should I be worried ?

I had a look at this message and also spoke to Maulik, and it seems
like its fairly harmless. It just suggests we had to wait a while to
get a TCS, and then retry, So nothing to worry about.

thanks,
Rajendra

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
