Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DCAA42E629
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 03:30:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232443AbhJOBck (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 21:32:40 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:52280 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232412AbhJOBck (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 21:32:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1634261435; x=1665797435;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=3RB4x/Hcpo1xEsEDOIOtbyRQNwDAYquXesLgKuTnCHA=;
  b=W244kfxyfbTxqyyV8lXQmYWfk5MRhSX6ILxH6HFIyE29gUHNhXhgKyYi
   75xenustQ526yS9Za/+PC3W12hiZ+Ji0TrbSZ3iNFeLuO4r/ycgifpvvZ
   Jks87mn1ZvxEFTXQM9zqsWyWgPb3UlQEebnXN5P8RKrFHjlJCd8svGJ02
   k=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 14 Oct 2021 18:30:35 -0700
X-QCInternal: smtphost
Received: from nalasex01c.na.qualcomm.com ([10.47.97.35])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2021 18:30:34 -0700
Received: from [10.231.205.174] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Thu, 14 Oct 2021
 18:30:33 -0700
Subject: Re: [RESEND PATCH v1 8/9] spmi: pmic-arb: make interrupt support
 optional
To:     Stephen Boyd <sboyd@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>
References: <1631860384-26608-1-git-send-email-quic_fenglinw@quicinc.com>
 <1631860384-26608-9-git-send-email-quic_fenglinw@quicinc.com>
 <163406051353.936959.12718174954614897750@swboyd.mtv.corp.google.com>
 <3bf1fbf3-e741-ef08-a4e4-b348b877d02a@quicinc.com>
 <163415390922.936959.12352892206436080955@swboyd.mtv.corp.google.com>
 <23918853-ed37-f11f-9e1e-5f302910e320@quicinc.com>
 <163426062521.936959.3490351816619205076@swboyd.mtv.corp.google.com>
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
Message-ID: <0e7b222f-2802-a286-3408-5a7dd942a132@quicinc.com>
Date:   Fri, 15 Oct 2021 09:30:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <163426062521.936959.3490351816619205076@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/15/2021 9:17 AM, Stephen Boyd wrote:
> Quoting Fenglin Wu (2021-10-13 20:20:57)
>> On 10/14/2021 3:38 AM, Stephen Boyd wrote:
>>> Quoting Fenglin Wu (2021-10-13 01:36:54)
>>>> On 10/13/2021 1:41 AM, Stephen Boyd wrote:
>>>>> Quoting Fenglin Wu (2021-09-16 23:33:03)
>>>>>> From: David Collins <collinsd@codeaurora.org>
>>>>>>
>>>>>> Make the support of PMIC peripheral interrupts optional for
>>>>>> spmi-pmic-arb devices.  This is useful in situations where
>>>>>> SPMI address mapping is required without the need for IRQ
>>>>>> support.
>>>>>>
>>>>>> Signed-off-by: David Collins <collinsd@codeaurora.org>
>>>>>> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
>>>>>> ---
>>>>>>     drivers/spmi/spmi-pmic-arb.c | 45 +++++++++++++++++++++++++++-----------------
>>>>> Is there a binding update? Can the binding be converted to YAML as well?
>>>> This change doesn't add/update any dtsi properties but just checking if an
>>>> existing property is present to decide if IRQ support is required, so no
>>>> binding change is needed.
>>> The property is now optional in the binding. Please update the binding.
>> Right, thanks for pointing it out. I forgot that part.
>> I will update the binding. How about only update the interrupt properties as
>> optional in this series then I can come up with following patch to convert
>> the binding to YAML format?
> Sure. The benefit of converting it to YAML is that we can use the
> checker to quickly validate the binding vs. having to read the whole
> thing to understand that it's correct. Converting an existing binding to
> YAML shouldn't be that hard.
Thanks, will do that for sure after this series of the changes.
