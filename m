Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98B0E430D0A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 02:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344847AbhJRATH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Oct 2021 20:19:07 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:63651 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344846AbhJRATH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Oct 2021 20:19:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1634516217; x=1666052217;
  h=subject:from:to:cc:references:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=+DqZghC6e7EKUymLWMHM4xicG8Jx1RULn6GiJV197L8=;
  b=BvTemcqyXMWDxn/ueVvV2wbLB3rCKRc97SuhpBS0C2IGzvhl8wWk4mZH
   2s7dt0Dw0UK6rXHx6lJN9Awz2ecuwnI5H6yt5qGY9gk0nfheP//3QgmeF
   DZRWlY7BeBqcival50w8LTZu/WnV+OpIxT6A3rGCIPQOLo3q6fPcq5uKr
   w=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 17 Oct 2021 17:16:56 -0700
X-QCInternal: smtphost
Received: from nalasex01c.na.qualcomm.com ([10.47.97.35])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2021 17:16:56 -0700
Received: from [10.231.205.174] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Sun, 17 Oct 2021
 17:16:54 -0700
Subject: Re: [RESEND PATCH v1 1/9] spmi: pmic-arb: add a print in cleanup_irq
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     Stephen Boyd <sboyd@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        Abhijeet Dharmapurikar <adharmap@codeaurora.org>
References: <1631860384-26608-1-git-send-email-quic_fenglinw@quicinc.com>
 <1631860384-26608-2-git-send-email-quic_fenglinw@quicinc.com>
 <163406078422.936959.12726677103787301939@swboyd.mtv.corp.google.com>
 <6c91a6ad-0ff2-a431-138a-2ec83f2bfa74@quicinc.com>
 <163415372158.936959.16897606198271075227@swboyd.mtv.corp.google.com>
 <e94d4b54-316e-220e-aaec-f60311c37745@quicinc.com>
 <163426014715.936959.6136985763712059359@swboyd.mtv.corp.google.com>
 <83fa65c8-3442-ee26-22ed-e26b013cca14@quicinc.com>
Message-ID: <456da380-e613-14dc-6e42-5d6350dc2389@quicinc.com>
Date:   Mon, 18 Oct 2021 08:16:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <83fa65c8-3442-ee26-22ed-e26b013cca14@quicinc.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/15/2021 9:27 AM, Fenglin Wu wrote:
>
> On 10/15/2021 9:09 AM, Stephen Boyd wrote:
>> Quoting Fenglin Wu (2021-10-13 19:26:55)
>>> On 10/14/2021 3:35 AM, Stephen Boyd wrote:
>>>> Quoting Fenglin Wu (2021-10-12 21:15:42)
>>>>> On 10/13/2021 1:46 AM, Stephen Boyd wrote:
>>>>>> Quoting Fenglin Wu (2021-09-16 23:32:56)
>>>>>>> From: Abhijeet Dharmapurikar <adharmap@codeaurora.org>
>>>>>>>
>>>>>>> The cleanup_irq() was meant to clear and mask interrupts that were
>>>>>>> left enabled in the hardware but there was no interrupt handler
>>>>>>> registered for it. Add an error print when it gets invoked.
>>>>>> Why? Don't we get the genirq spurious irq message in this scenario?
>>>>> Thanks for reviewing the change.
>>>>>
>>>>> No, there is no existing message printed out in this special case 
>>>>> ( IRQ
>>>>> fired for not registered interrupt).
>>>> Ah I see so the irq doesn't have a flow handler? Shouldn't you call
>>>> handle_bad_irq() in this case so we get a irq descriptor print?
>>> In such case, the irq number is not valid and there won't be a valid
>>> irq_desc, hence it's not possible to call handle_bad_irq() here.
>> I mean handle_bad_irq() on the irqdesc for the spmi pmic arb chained
>> irq. Because things are not good with the chained irq.
> Okay, how about this, Update periph_interrupt() function with a return
> value, and return -EINVAL once an invalid IRQ is detected. In
> pmic_arb_chained_irq(), call handle_bad_irq() if periph_interrupt()
> returned -EINVAL.
Combined with your comments in "[PATCH v1 3/9] spmi: pmic-arb:check apid
againstlimits before calling irq handler",it seemslike that it can be
a independentpatch for handling spuriousinterrupt, something like this
in my mind:

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 295e19f..bd01ad4 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -504,10 +504,10 @@ static void cleanup_irq(struct spmi_pmic_arb 
*pmic_arb, u16 apid, int id)
                                 irq_mask, ppid);
  }

-static void periph_interrupt(struct spmi_pmic_arb *pmic_arb, u16 apid)
+static int periph_interrupt(struct spmi_pmic_arb *pmic_arb, u16 apid)
  {
         unsigned int irq;
-       u32 status, id;
+       u32 status, id, handled = 0;
         u8 sid = (pmic_arb->apid_data[apid].ppid >> 8) & 0xF;
         u8 per = pmic_arb->apid_data[apid].ppid & 0xFF;

@@ -522,7 +522,10 @@ static void periph_interrupt(struct spmi_pmic_arb 
*pmic_arb, u16 apid)
                         continue;
                 }
                 generic_handle_irq(irq);
+               handled++;
         }
+
+       return (handled == 0) ? -EINVAL : 0;
  }

  static void pmic_arb_chained_irq(struct irq_desc *desc)
@@ -533,7 +536,7 @@ static void pmic_arb_chained_irq(struct irq_desc *desc)
         int first = pmic_arb->min_apid >> 5;
         int last = pmic_arb->max_apid >> 5;
         u8 ee = pmic_arb->ee;
-       u32 status, enable;
+       u32 status, enable, handled = 0;
         int i, id, apid;

         chained_irq_enter(chip, desc);
@@ -548,10 +551,14 @@ static void pmic_arb_chained_irq(struct irq_desc 
*desc)
                         enable = readl_relaxed(
ver_ops->acc_enable(pmic_arb, apid));
                         if (enable & SPMI_PIC_ACC_ENABLE_BIT)
- periph_interrupt(pmic_arb, apid);
+                               if (periph_interrupt(pmic_arb, apid) == 0)
+ handled++;
                 }
         }

+       if (handled == 0)
+               handle_bad_irq(desc);
+
         chained_irq_exit(chip, desc);
  }

Is this what you expected? The original patch is only for printing a 
debug message when any
sub-irq is detected as enabled but not registered, some other sub-IRQ 
maybe still valid and
be handled after that, which means the chained-irq may still be a good 
one.Should I keep
the original patch unchanged and submit a separate one to handle the 
spuriousinterrupt?


