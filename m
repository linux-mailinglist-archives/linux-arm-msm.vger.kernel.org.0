Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9C4642D0DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 05:18:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbhJNDUD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 23:20:03 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:40993 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbhJNDUC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 23:20:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1634181479; x=1665717479;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=NYaBFpQrw3CgJfwG708eRSqiXBZnp41nAEU95Kt+jtA=;
  b=S3t2hoIf4JTpM0fdlzGlt6wcpZxxhISLi0phJRuUEdHH2HvGMZLqfZ9v
   89RZ8SFeUnmbwRTqurITF1WtB/hq7ty6YAqH7RFjG1Sf4SZBwYAb58CvY
   mFU+wccOwdq87+nIy6wohiZhuniEg5e447B3VZD2S3XeN8CnXH3q3z+/M
   I=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 13 Oct 2021 20:17:59 -0700
X-QCInternal: smtphost
Received: from nalasex01c.na.qualcomm.com ([10.47.97.35])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2021 20:17:58 -0700
Received: from [10.231.205.174] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Wed, 13 Oct 2021
 20:17:55 -0700
Subject: Re: [RESEND PATCH v1 7/9] spmi: pmic-arb: support updating interrupt
 type flags
To:     Stephen Boyd <sboyd@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        Yimin Peng <yiminp@codeaurora.org>, <tglx@linutronix.de>,
        <maz@kernel.org>
References: <1631860384-26608-1-git-send-email-quic_fenglinw@quicinc.com>
 <1631860384-26608-8-git-send-email-quic_fenglinw@quicinc.com>
 <163406056577.936959.16157334001404276084@swboyd.mtv.corp.google.com>
 <9aa28adc-288c-7be9-c989-ffdc6f859fcb@quicinc.com>
 <163415386095.936959.16722730558107515093@swboyd.mtv.corp.google.com>
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
Message-ID: <33b810b9-0b5a-c284-c571-a30add06267f@quicinc.com>
Date:   Thu, 14 Oct 2021 11:17:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <163415386095.936959.16722730558107515093@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/14/2021 3:37 AM, Stephen Boyd wrote:
> Quoting Fenglin Wu (2021-10-12 23:27:22)
>> copy IRQCHIP driver maintainers as requested in another patch.
>>
>> On 10/13/2021 1:42 AM, Stephen Boyd wrote:
>>> Quoting Fenglin Wu (2021-09-16 23:33:02)
>>>> From: Yimin Peng <yiminp@codeaurora.org>
>>>>
>>>> Have the qpnpint_irq_set_type function clear unwanted high/low
>>>> trigger bits when updating the interrupt flags.
>>> Why?
>> There was a requirement to update the PMIC module interrupt type
>> dynamically
>> (such as from low level trigger to high level trigger), hence it's required
>> to clear the unnecessary trigger type when setting it.
> Can you clearly describe the problem in the commit text? Is this a bug
> fix?
sure, will do.
>>>> Signed-off-by: Yimin Peng <yiminp@codeaurora.org>
>>>> Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
>>>> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
>>>> ---
>>> Does this need a Fixes tag?
>> Maybe no need to a Fixes tag because this is part of the initial code when
>> interrupt handling is added?
> Was it always broken? Or trigger types haven't been changing at runtime
> because most users are requesting irqs and forgetting about it? Are you
> using gpio-keys or something like that now? Adding a Fixes tag doesn't
> hurt.
You are right, it was reported by someone when using a PMIC GPIO and update
the interrupt at runtime, I am not sure if it's gpio-keys but that can be a
realistic case.
I will add a Fixes tag for it.
