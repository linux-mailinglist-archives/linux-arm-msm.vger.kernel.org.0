Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37CA742B599
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 07:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbhJMFjv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 01:39:51 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:41661 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbhJMFjv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 01:39:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1634103468; x=1665639468;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=9fhbkTDJxMCsx3vMwgVwFc3cEfidix11BjFd5kmmHMw=;
  b=nTVwUbg4cO4stmFmE0DlKbpGWG7NKr2Nz2vb26HB5CQfVAIjF4HYidBD
   HboO4/uBKbk4pmNlAtQHZJcssmbuA+s4H7WxA0qHk2iEtP+5n8GH7l6Cx
   kzXQKfiJGYGnWQ4N1DYGS/nTPFGc9h39NM5A23zt0HZ7KsTANQGia6+Wu
   s=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 12 Oct 2021 22:37:48 -0700
X-QCInternal: smtphost
Received: from nalasex01c.na.qualcomm.com ([10.47.97.35])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2021 22:37:48 -0700
Received: from [10.231.205.174] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Tue, 12 Oct 2021
 22:37:46 -0700
Subject: Re: [RESEND PATCH v1 5/9] spmi: pmic-arb: correct duplicate APID to
 PPID mapping logic
To:     Stephen Boyd <sboyd@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>
References: <1631860384-26608-1-git-send-email-quic_fenglinw@quicinc.com>
 <1631860384-26608-6-git-send-email-quic_fenglinw@quicinc.com>
 <163406067294.936959.15501496135258886323@swboyd.mtv.corp.google.com>
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
Message-ID: <a81b19e2-c2f9-42a5-b976-85e064781287@quicinc.com>
Date:   Wed, 13 Oct 2021 13:37:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <163406067294.936959.15501496135258886323@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/13/2021 1:44 AM, Stephen Boyd wrote:
> Quoting Fenglin Wu (2021-09-16 23:33:00)
>> From: David Collins <collinsd@codeaurora.org>
>>
>> Correct the way that duplicate PPID mappings are handled for PMIC
>> arbiter v5.  The final APID mapped to a given PPID should be the
>> one which has write owner = APPS EE, if it exists, or if not
>> that, then the first APID mapped to the PPID, if it exists.
>>
>> Signed-off-by: David Collins <collinsd@codeaurora.org>
>> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
>> ---
> Does this need a Fixes tag?
ACK, will add a Fixes tag
>
>>   drivers/spmi/spmi-pmic-arb.c | 13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
>> index 59c445b..f1b72d8 100644
>> --- a/drivers/spmi/spmi-pmic-arb.c
>> +++ b/drivers/spmi/spmi-pmic-arb.c
>> @@ -918,7 +918,8 @@ static int pmic_arb_read_apid_map_v5(struct spmi_pmic_arb *pmic_arb)
>>           * version 5, there is more than one APID mapped to each PPID.
>>           * The owner field for each of these mappings specifies the EE which is
>>           * allowed to write to the APID.  The owner of the last (highest) APID
>> -        * for a given PPID will receive interrupts from the PPID.
>> +        * which has the IRQ owner bit set for a given PPID will receive
>> +        * interrupts from the PPID.
>>           */
>>          for (i = 0; ; i++, apidd++) {
>>                  offset = pmic_arb->ver_ops->apid_map_offset(i);
>> @@ -941,16 +942,16 @@ static int pmic_arb_read_apid_map_v5(struct spmi_pmic_arb *pmic_arb)
>>                  apid = pmic_arb->ppid_to_apid[ppid] & ~PMIC_ARB_APID_VALID;
>>                  prev_apidd = &pmic_arb->apid_data[apid];
>>   
>> -               if (valid && is_irq_ee &&
>> -                               prev_apidd->write_ee == pmic_arb->ee) {
>> +               if (!valid || apidd->write_ee == pmic_arb->ee) {
>> +                       /* First PPID mapping or one for this EE */
>> +                       pmic_arb->ppid_to_apid[ppid] = i | PMIC_ARB_APID_VALID;
>> +               } else if (valid && is_irq_ee &&
>> +                          prev_apidd->write_ee == pmic_arb->ee) {
> This can be one line please.
ACK.
>>                          /*
>>                           * Duplicate PPID mapping after the one for this EE;
>>                           * override the irq owner
>>                           */
>>                          prev_apidd->irq_ee = apidd->irq_ee;
>> -               } else if (!valid || is_irq_ee) {
>> -                       /* First PPID mapping or duplicate for another EE */
>> -                       pmic_arb->ppid_to_apid[ppid] = i | PMIC_ARB_APID_VALID;
>>                  }
>>   
>>                  apidd->ppid = ppid;
>> -- 
>> 2.7.4
>>
