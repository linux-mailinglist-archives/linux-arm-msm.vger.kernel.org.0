Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14F5E42D05B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 04:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbhJNC3G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 22:29:06 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:38807 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbhJNC3F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 22:29:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1634178422; x=1665714422;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=uCL83pOineMIRtmcmPQ39e3/hdQ8pQvZIO4w7eV9FCk=;
  b=iZdviWo6XoV76f/BfHI+VExGoMnoZYrmZlmbO++G3DJupJN3FWBMMKBD
   Ud715Oz9BrBNagAw2n20yJfK3EvEtJ08aZo70hGzHjd0m1nmJSn/cJuYy
   SasiRJGsAjkBKhqVQJ3XC0853Hp89oEqpMyshv1D96apHJ0bvKvB9fnLM
   I=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 13 Oct 2021 19:27:01 -0700
X-QCInternal: smtphost
Received: from nalasex01c.na.qualcomm.com ([10.47.97.35])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2021 19:27:01 -0700
Received: from [10.231.205.174] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Wed, 13 Oct 2021
 19:26:58 -0700
Subject: Re: [RESEND PATCH v1 1/9] spmi: pmic-arb: add a print in cleanup_irq
To:     Stephen Boyd <sboyd@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        Abhijeet Dharmapurikar <adharmap@codeaurora.org>
References: <1631860384-26608-1-git-send-email-quic_fenglinw@quicinc.com>
 <1631860384-26608-2-git-send-email-quic_fenglinw@quicinc.com>
 <163406078422.936959.12726677103787301939@swboyd.mtv.corp.google.com>
 <6c91a6ad-0ff2-a431-138a-2ec83f2bfa74@quicinc.com>
 <163415372158.936959.16897606198271075227@swboyd.mtv.corp.google.com>
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
Message-ID: <e94d4b54-316e-220e-aaec-f60311c37745@quicinc.com>
Date:   Thu, 14 Oct 2021 10:26:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <163415372158.936959.16897606198271075227@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/14/2021 3:35 AM, Stephen Boyd wrote:
> Quoting Fenglin Wu (2021-10-12 21:15:42)
>> On 10/13/2021 1:46 AM, Stephen Boyd wrote:
>>> Quoting Fenglin Wu (2021-09-16 23:32:56)
>>>> From: Abhijeet Dharmapurikar <adharmap@codeaurora.org>
>>>>
>>>> The cleanup_irq() was meant to clear and mask interrupts that were
>>>> left enabled in the hardware but there was no interrupt handler
>>>> registered for it. Add an error print when it gets invoked.
>>> Why? Don't we get the genirq spurious irq message in this scenario?
>> Thanks for reviewing the change.
>>
>> No, there is no existing message printed out in this special case ( IRQ
>> fired for not registered interrupt).
> Ah I see so the irq doesn't have a flow handler? Shouldn't you call
> handle_bad_irq() in this case so we get a irq descriptor print?
In such case, the irq number is not valid and there won't be a valid
irq_desc, hence it's not possible to call handle_bad_irq() here.
