Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9629842D0D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 05:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbhJNDNu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 23:13:50 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:26992 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbhJNDNt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 23:13:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1634181106; x=1665717106;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=fdrOr8AdXQ2FQF3KucGTojgEFemLI+WoAds9RTqofTw=;
  b=aw0YfIVFk4eEByIK7KJLKc9eqhoa9l+V3xGMd5zg3w2LskDrq74jflHF
   E2KdXoTcjqRB861M9vjccOracgWalAMJk0pOO9uECESC8+3Y5gcYR/b94
   XD6Nw/VtBj8tymYhpsQIgk4MlJba/DR+kkLoQP3nGw11+qHB3eVT7HCiG
   k=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 13 Oct 2021 20:11:46 -0700
X-QCInternal: smtphost
Received: from nalasex01c.na.qualcomm.com ([10.47.97.35])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2021 20:11:45 -0700
Received: from [10.231.205.174] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Wed, 13 Oct 2021
 20:11:43 -0700
Subject: Re: [RESEND PATCH v1 3/9] spmi: pmic-arb: check apid against limits
 before calling irq handler
To:     Stephen Boyd <sboyd@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        <tglx@linutronix.de>, <maz@kernel.org>
References: <1631860384-26608-1-git-send-email-quic_fenglinw@quicinc.com>
 <1631860384-26608-4-git-send-email-quic_fenglinw@quicinc.com>
 <163406173869.936959.6395787327312518099@swboyd.mtv.corp.google.com>
 <7efffba4-5e8b-1b71-8bee-3dffe65cfdf5@quicinc.com>
 <163415312707.936959.13741150880359468709@swboyd.mtv.corp.google.com>
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
Message-ID: <6ca3f254-90ad-e0e5-ced9-0f12deb408c6@quicinc.com>
Date:   Thu, 14 Oct 2021 11:11:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <163415312707.936959.13741150880359468709@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/14/2021 3:25 AM, Stephen Boyd wrote:
> Quoting Fenglin Wu (2021-10-12 22:31:22)
>> On 10/13/2021 2:02 AM, Stephen Boyd wrote:
>>> Quoting Fenglin Wu (2021-09-16 23:32:58)
>>>> From: David Collins <collinsd@codeaurora.org>
>>>>
>>>> Check that the apid for an SPMI interrupt falls between the
>>>> min_apid and max_apid that can be handled by the APPS processor
>>>> before invoking the per-apid interrupt handler:
>>>> periph_interrupt().
>>>>
>>>> This avoids an access violation in rare cases where the status
>>>> bit is set for an interrupt that is not owned by the APPS
>>>> processor.
>>>>
>>>> Signed-off-by: David Collins <collinsd@codeaurora.org>
>>>> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
>>>> ---
>>> Fixes? BTW, a lot of these patches are irqchip specific. It would be
>>> good to get review from irqchip maintainers. Maybe we should split the
>>> irqchip driver off via the auxiliary bus so that irqchip maintainers can
>>> review. Please Cc them on irqchip related patches.
>>>
>>> IRQCHIP DRIVERS
>>> M:      Thomas Gleixner <tglx@linutronix.de>
>>> M:      Marc Zyngier <maz@kernel.org>
>> Sure, copied Thomas and Marc for code review.
>> This is a fix to avoid the register access violation in a case that an
>> interrupt is fired in a PMIC module which is not owned by APPS
>> processor.
> Got it.
>
>>>>    drivers/spmi/spmi-pmic-arb.c | 6 ++++++
>>>>    1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
>>>> index 4d7ad004..c4adc06 100644
>>>> --- a/drivers/spmi/spmi-pmic-arb.c
>>>> +++ b/drivers/spmi/spmi-pmic-arb.c
>>>> @@ -535,6 +535,12 @@ static void pmic_arb_chained_irq(struct irq_desc *desc)
>>>>                           id = ffs(status) - 1;
>>>>                           status &= ~BIT(id);
>>>>                           apid = id + i * 32;
>>>> +                       if (apid < pmic_arb->min_apid
>>>> +                           || apid > pmic_arb->max_apid) {
>>> The || goes on the line above. What about making a local variable for
>>> first and last and then shifting by 5 in the loop?
>>>
>>> int first = pmic_arb->min_apid;
>>> int last = pmic_arb->max_apid;
>>>
>>> for (i = first >> 5; i <= last >> 5; i++)
>>>
>>>        if (apid < first || apid > last)
>> ACK, will update it following this.
>>>> +                               WARN_ONCE(true, "spurious spmi irq received for apid=%d\n",
>>>> +                                       apid);
>>> Is there any way to recover from this? Or once the mapping is wrong
>>> we're going to get interrupts that we don't know what to do with
>>> forever?
>> This is a rare case that the unexpected interrupt is fired in a module
>> not owned by APPS process, so the interrupt itself is not expected hence
>> no need to recover from this but just bail out to avoid following register
>> access violation.
> And then the irq stops coming? It feels like a misconfiguration in the
> firmware that we're trying to hide, hence the WARN_ONCE(). Can we
> somehow silence irqs that aren't owned by the APPS when this driver
> probes so that they can't even happen after probe?
Actually this is a rarely happened case that couldn't be reproduced easily
and consistently for further debug. I agreed this should be caused by HW
misconfiguration or even some unknown HW bug that it would send out SPMI
interrupt messages with incorrect APID, but we have never had any chance
to find out the root cause. The patch here simply checked the APID and
bail out if it's not in the valid range, it won't cause anything bad but
improves the SW robustness. After that, the IRQ won't be triggered again
because the latched status in PMIC is not cleared. Also, because of the
access restriction to the registers corresponding to this APID, there is
nothing we can do from APPS processor side to keep it silent.
