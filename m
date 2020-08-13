Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42B042434FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Aug 2020 09:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbgHMHb3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 03:31:29 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:12012 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726204AbgHMHb2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 03:31:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597303888; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=10zIpoDC5WFOJCsOf60NRljx1E04tbY7lNT51eZXHZw=; b=sQxFu8xmaiL0kTRShtcQGujZ5TDFhoW+isyFHMJL+dZpZf8zjWuCD5yLavJwrgKFbt83TBtr
 dJNzOrerY7aHmV/ub2spRP1JJKHlr2UnhayTwKSIVBMBCbjKhsQTdI6CfmPWsK8e8SXg4hFj
 1XPgftW22RjvOVGIlbRryAQN9S0=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5f34ec30247ccc308ceae74b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 13 Aug 2020 07:30:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DDBD9C433CB; Thu, 13 Aug 2020 07:30:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.77.164])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E430BC433C6;
        Thu, 13 Aug 2020 07:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E430BC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v4 7/7] irqchip: qcom-pdc: Reset all pdc interrupts during
 init
To:     Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, linus.walleij@linaro.org, maz@kernel.org,
        mka@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org
References: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org>
 <1597058460-16211-8-git-send-email-mkshah@codeaurora.org>
 <159718150946.1360974.10983789401181131846@swboyd.mtv.corp.google.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <1272cba3-1a6c-4d2e-0b4b-a19dfb5f3a4d@codeaurora.org>
Date:   Thu, 13 Aug 2020 13:00:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <159718150946.1360974.10983789401181131846@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 8/12/2020 3:01 AM, Stephen Boyd wrote:
> Quoting Maulik Shah (2020-08-10 04:21:00)
>> Clear previous kernel's configuration during init by resetting
>> interrupts in enable bank to zero.
> Can you please add some more information here about why we're not
> clearing all the pdc irqs and only the ones that are listed in DT?
sure.
>   Is
> that because the pdc is shared between exception levels of the CPU and
> so some irqs shouldn't be used? Does the DT binding need to change to
> only list the hwirqs that are usable by the OS instead of the ones that
> are usable for the entire system? The binding doesn't mention this at
> all so I am just guessing here.

The IRQs specified in qcom,pdc-ranges property in DT are the only ones 
that can be used in the current OS for the PDC.

So instead of setting entire register to zero (each reg supports 32 
interrupts enable bit) only clearing the ones that can be used.

Thanks,
Maulik

>
>> Suggested-by: Stephen Boyd <swboyd@chromium.org>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

