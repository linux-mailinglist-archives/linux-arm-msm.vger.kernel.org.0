Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A05D1FEA5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 06:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgFREr0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 00:47:26 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:44736 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725912AbgFREr0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 00:47:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592455644; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=EwcjcUA+ggEJzAp3ik6omINnV0u7GeQRPXUpLXx3O/8=; b=iMYwwKsOOjs97DRsiYqegW2rBjtEuEtAoB2vXIV7fza3FM6A8woibjP5G0Ej2pCqSvXg4QYn
 l7Vwsngy+H14cQmwd5/JfyEIgr92S91ou/9n67yGYJyxa3CYntwYtjRbDkRWR9CjbLT4z3E5
 JLSJnFyGzKK1Rii4klfdrtbz4CM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-west-2.postgun.com with SMTP id
 5eeaf1db117610c7ff4c6613 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Jun 2020 04:47:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6412BC43387; Thu, 18 Jun 2020 04:47:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.101] (unknown [106.51.31.240])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 26F8FC433C8;
        Thu, 18 Jun 2020 04:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 26F8FC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v6 0/6] DVFS for IO devices on sdm845 and sc7180
To:     Matthias Kaehlcke <mka@chromium.org>,
        Mark Brown <broonie@kernel.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, robdclark@gmail.com,
        robdclark@chromium.org, stanimir.varbanov@linaro.org,
        viresh.kumar@linaro.org, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1592222564-13556-1-git-send-email-rnayak@codeaurora.org>
 <20200617221546.GC4525@google.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <4f3d4c91-2a01-8ef5-1ad0-73ed354f930a@codeaurora.org>
Date:   Thu, 18 Jun 2020 10:17:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200617221546.GC4525@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Matthias, thanks for summarizing this.

On 6/18/2020 3:45 AM, Matthias Kaehlcke wrote:
> What is the plan for landing these, it seems not all must/should
> go through the QCOM tree.
> 
> My guesses:
> 
> tty: serial: qcom_geni_serial: Use OPP API to set clk/perf state
> spi: spi-geni-qcom: Use OPP API to set clk/perf state
>    QCOM tree due to shared dependency on change in include/linux/qcom-geni-se.h

That's correct, Bjorn/Andy, can these be pulled in now for 5.9?
They have acks from Greg for serial and Mark for the spi patch.
  
> drm/msm/dpu: Use OPP API to set clk/perf state
> drm/msm: dsi: Use OPP API to set clk/perf state
>    drm/msm tree

Correct, the dsi patch is still not reviewed by Rob, so once that's done,
I am guessing Rob would pull both of these.

> 
> media: venus: core: Add support for opp tables/perf voting
>    venus tree

correct, this is pending review/ack from Stan.

> 
> spi: spi-qcom-qspi: Use OPP API to set clk/perf state
>    SPI tree

Right, Mark has this acked, I am guessing he will pull this in at
some point.

thanks,
Rajendra

> 
> 
> Does this make sense or are there any dependencies I'm missing?
> 
> Thanks
> 
> Matthias
> 
> On Mon, Jun 15, 2020 at 05:32:38PM +0530, Rajendra Nayak wrote:
>> Changes in v6:
>> 1. rebased on 5.8-rc1, no functional change.
>>
>> Changes in v5:
>> 1. Opp cleanup path fixed up across drivers
>>
>> Changes in v4:
>> 1. Fixed all review feedback on v3
>> 2. Dropped the dts patches, will post as a seperate series once
>> driver changes are reviewed and merged.
>> The driver changes without DT updates to include OPP tables will
>> have zero functional change.
>> 3. Dropped the mmc/sdhc patch, which is a standalone patch. will
>> repost if needed seperately.
>>
>> Changes in v3:
>> 1. Added better error handling for dev_pm_opp_of_add_table()
>> 2. Some minor changes and fixes in 'PATCH 12/17' as compared to v2
>> 3. Dropped the mmc patch picked up by Ulf [2]
>>
>> Changes in v2:
>> 1. Added error handling for dev_pm_opp_set_clkname()
>> and dev_pm_opp_of_add_table()
>> 2. Used dev_pm_opp_put_clkname() in the cleanup path
>> 3. Dropped the OPP patch pulled in by Viresh [1]
>> 4. Dropped the UFS patches since they had some major rework
>> needed because of changes that were merged in the merge window
>> and I don't have a UFS device currently to validate the changes.
>>
>> We have had support added in the OPP core for a while now to support
>> DVFS for IO devices, and this series uses that infrastructure to
>> add DVFS support for various IO devices in sdm845 and sc7180 SoCs.
>>
>> [1] https://lkml.org/lkml/2020/4/14/98
>> [2] https://lore.kernel.org/patchwork/patch/1226381/
>>
>> Rajendra Nayak (6):
>>    tty: serial: qcom_geni_serial: Use OPP API to set clk/perf state
>>    spi: spi-geni-qcom: Use OPP API to set clk/perf state
>>    drm/msm/dpu: Use OPP API to set clk/perf state
>>    drm/msm: dsi: Use OPP API to set clk/perf state
>>    media: venus: core: Add support for opp tables/perf voting
>>    spi: spi-qcom-qspi: Use OPP API to set clk/perf state
>>
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c  |  3 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        | 26 +++++++++++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h        |  4 ++
>>   drivers/gpu/drm/msm/dsi/dsi.h                  |  2 +
>>   drivers/gpu/drm/msm/dsi/dsi_cfg.c              |  4 +-
>>   drivers/gpu/drm/msm/dsi/dsi_host.c             | 58 ++++++++++++++++++++++++++
>>   drivers/media/platform/qcom/venus/core.c       | 43 ++++++++++++++++---
>>   drivers/media/platform/qcom/venus/core.h       |  5 +++
>>   drivers/media/platform/qcom/venus/pm_helpers.c | 54 ++++++++++++++++++++++--
>>   drivers/spi/spi-geni-qcom.c                    | 26 ++++++++++--
>>   drivers/spi/spi-qcom-qspi.c                    | 28 ++++++++++++-
>>   drivers/tty/serial/qcom_geni_serial.c          | 34 ++++++++++++---
>>   include/linux/qcom-geni-se.h                   |  4 ++
>>   13 files changed, 268 insertions(+), 23 deletions(-)
>>
>> -- 
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation
>>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
