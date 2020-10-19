Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9BF02922F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 09:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727502AbgJSH0e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 03:26:34 -0400
Received: from z5.mailgun.us ([104.130.96.5]:13794 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727487AbgJSH0d (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 03:26:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603092393; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=EF/a3QYfDXcAmInIf76UOd3Ahf7FwPv3ru2l/DaHHm4=; b=eJBuWN8JlCq39W2nR8Ru0PTH7w2lH18o5ztR06pDKNLTGjEsN5VyS9avPE8NmggVg5SJcwP0
 P67TXND7bnmV0MWbFe3QgtP3QKabl4PnbjAY8YkWKPEXBVigjDv/w3R5aA3rjePqjmz/kthp
 bgfmB9RUnruNy0YFsj9kCnMqed8=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f8d3fa8856d9308b55e91c9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 19 Oct 2020 07:26:32
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 876E7C433F1; Mon, 19 Oct 2020 07:26:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.69.157])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 97AE8C433CB;
        Mon, 19 Oct 2020 07:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 97AE8C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [RESEND v2 0/2] Modularize RPMH driver
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ulf.hansson@linaro.org, swboyd@chromium.org, dianders@chromium.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org
References: <1601877596-32676-1-git-send-email-mkshah@codeaurora.org>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <0def494d-a729-0728-c633-4a74fbe95a87@codeaurora.org>
Date:   Mon, 19 Oct 2020 12:56:25 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <1601877596-32676-1-git-send-email-mkshah@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

Can you please pick these changes.

Thanks,
Maulik

On 10/5/2020 11:29 AM, Maulik Shah wrote:
> Resending the patches rebasing on top of latest linux-next (next-20201002)
>
> Changes in v2:
> - Update commit message in patch 1
> - send [4] again instead of revert's revert in patch 2.
>
> This series is to modularize RPMH driver
>
> The tracepoint in RPMH driver was changed to _rcuidle variant based on the
> test results of unmerged series [1] where .power_off callback from genpd
> reported RCU warnings.
>
> The series which finally got merged [2] uses CPU PM notifications
> and genpd .power_off callback is not implemented in RPMH driver to invoke
> rpmh_flush(). The CPU PM notifications are done with RCU non idle in kernel
> (see cpu_pm_notify() uses rcu_irq_enter_irqson() before notifications)
>
> However using _rcuidle variant prevented RPMH driver to compile as module
> since these _rcuidle are not exported symbols for tracepoints.
>
> This seris reverts the change [3] to remove _rcuidle variant for tracepoint
> as its no more valid test case (genpd .power_off is not implemented)
> and bring backs the change [4] that was reverted due to _rcuidle preventing
> to become modular.
>
> [1] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=243931
> [2] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=269733
> [3] https://lore.kernel.org/r/20200115013751.249588-1-swboyd@chromium.org
> [4] https://lore.kernel.org/r/20200326224459.105170-3-john.stultz@linaro.org
>
> John Stultz (1):
>    soc: qcom: rpmh: Allow RPMH driver to be loaded as a module
>
> Maulik Shah (1):
>    Revert "drivers: qcom: rpmh-rsc: Use rcuidle tracepoints for rpmh"
>
>   drivers/soc/qcom/Kconfig    | 2 +-
>   drivers/soc/qcom/rpmh-rsc.c | 7 ++++++-
>   2 files changed, 7 insertions(+), 2 deletions(-)
>
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

