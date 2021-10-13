Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D708642B54F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 07:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbhJMFdb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 01:33:31 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:20321 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237706AbhJMFda (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 01:33:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1634103087; x=1665639087;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=R5yN/bebUFx9ehiYvk0KzgmQXPxl9EYqebEotv3PG+8=;
  b=giJXUzuy4YoYVrxXfKwRpxBZDrr8Ib01xnfgLkv7Bv7aoettdh8v3lej
   PbJ6etNEkiRMgBV214kys205Bq/8AzdWU4JoWCdXIeyT9RW+10iaMuYem
   mkfAxmLURJH+Ku7dGkgObbBTNNFSz4B4ikY6pa/Dr3OsjILSuCrec10KP
   8=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 12 Oct 2021 22:31:27 -0700
X-QCInternal: smtphost
Received: from nalasex01c.na.qualcomm.com ([10.47.97.35])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2021 22:31:26 -0700
Received: from [10.231.205.174] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Tue, 12 Oct 2021
 22:31:24 -0700
Subject: Re: [RESEND PATCH v1 3/9] spmi: pmic-arb: check apid against limits
 before calling irq handler
To:     Stephen Boyd <sboyd@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        <tglx@linutronix.de>, <maz@kernel.org>
References: <1631860384-26608-1-git-send-email-quic_fenglinw@quicinc.com>
 <1631860384-26608-4-git-send-email-quic_fenglinw@quicinc.com>
 <163406173869.936959.6395787327312518099@swboyd.mtv.corp.google.com>
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
Message-ID: <7efffba4-5e8b-1b71-8bee-3dffe65cfdf5@quicinc.com>
Date:   Wed, 13 Oct 2021 13:31:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <163406173869.936959.6395787327312518099@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/13/2021 2:02 AM, Stephen Boyd wrote:
> Quoting Fenglin Wu (2021-09-16 23:32:58)
>> From: David Collins <collinsd@codeaurora.org>
>>
>> Check that the apid for an SPMI interrupt falls between the
>> min_apid and max_apid that can be handled by the APPS processor
>> before invoking the per-apid interrupt handler:
>> periph_interrupt().
>>
>> This avoids an access violation in rare cases where the status
>> bit is set for an interrupt that is not owned by the APPS
>> processor.
>>
>> Signed-off-by: David Collins <collinsd@codeaurora.org>
>> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
>> ---
> Fixes? BTW, a lot of these patches are irqchip specific. It would be
> good to get review from irqchip maintainers. Maybe we should split the
> irqchip driver off via the auxiliary bus so that irqchip maintainers can
> review. Please Cc them on irqchip related patches.
>
> IRQCHIP DRIVERS
> M:      Thomas Gleixner <tglx@linutronix.de>
> M:      Marc Zyngier <maz@kernel.org>
Sure, copied Thomas and Marc for code review.
This is a fix to avoid the register access violation in a case that an
interrupt is fired in a PMIC module which is not owned by APPS
processor.
>>   drivers/spmi/spmi-pmic-arb.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
>> index 4d7ad004..c4adc06 100644
>> --- a/drivers/spmi/spmi-pmic-arb.c
>> +++ b/drivers/spmi/spmi-pmic-arb.c
>> @@ -535,6 +535,12 @@ static void pmic_arb_chained_irq(struct irq_desc *desc)
>>                          id = ffs(status) - 1;
>>                          status &= ~BIT(id);
>>                          apid = id + i * 32;
>> +                       if (apid < pmic_arb->min_apid
>> +                           || apid > pmic_arb->max_apid) {
> The || goes on the line above. What about making a local variable for
> first and last and then shifting by 5 in the loop?
>
> int first = pmic_arb->min_apid;
> int last = pmic_arb->max_apid;
>
> for (i = first >> 5; i <= last >> 5; i++)
>
> 	if (apid < first || apid > last)
ACK, will update it following this.
>> +                               WARN_ONCE(true, "spurious spmi irq received for apid=%d\n",
>> +                                       apid);
> Is there any way to recover from this? Or once the mapping is wrong
> we're going to get interrupts that we don't know what to do with
> forever?
This is a rare case that the unexpected interrupt is fired in a module
not owned by APPS process, so the interrupt itself is not expected hence
no need to recover from this but just bail out to avoid following register
access violation.
>> +                               continue;
>> +                       }
>>                          enable = readl_relaxed(
>>                                          ver_ops->acc_enable(pmic_arb, apid));
>>                          if (enable & SPMI_PIC_ACC_ENABLE_BIT)
