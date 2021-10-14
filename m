Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71C7542D0E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 05:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbhJNDXK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 23:23:10 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:62230 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbhJNDXG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 23:23:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1634181662; x=1665717662;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=e4FZcjE4Yy/CYv+QIs78RcM3+6mae1SVFCBpkrsfzQA=;
  b=xm1UtwXXYfwJavgrTlN984rAdpuNx0e/VgGWLm87gTgIN+HjFRB1Xiaq
   Fj8+Fhp434ti5OaVTa0/KuY2gnsIDFMHQcBp3zu0NAj7XA/jgjlcfIpPB
   fDXg5mAOTNxWj7B+J/2dNXqUzvZrudf7p9lKd3KFb0Ndw37IME+MFeBsf
   c=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 13 Oct 2021 20:21:02 -0700
X-QCInternal: smtphost
Received: from nalasex01c.na.qualcomm.com ([10.47.97.35])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2021 20:21:01 -0700
Received: from [10.231.205.174] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Wed, 13 Oct 2021
 20:20:59 -0700
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
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
Message-ID: <23918853-ed37-f11f-9e1e-5f302910e320@quicinc.com>
Date:   Thu, 14 Oct 2021 11:20:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <163415390922.936959.12352892206436080955@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/14/2021 3:38 AM, Stephen Boyd wrote:
> Quoting Fenglin Wu (2021-10-13 01:36:54)
>> On 10/13/2021 1:41 AM, Stephen Boyd wrote:
>>> Quoting Fenglin Wu (2021-09-16 23:33:03)
>>>> From: David Collins <collinsd@codeaurora.org>
>>>>
>>>> Make the support of PMIC peripheral interrupts optional for
>>>> spmi-pmic-arb devices.  This is useful in situations where
>>>> SPMI address mapping is required without the need for IRQ
>>>> support.
>>>>
>>>> Signed-off-by: David Collins <collinsd@codeaurora.org>
>>>> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
>>>> ---
>>>>    drivers/spmi/spmi-pmic-arb.c | 45 +++++++++++++++++++++++++++-----------------
>>> Is there a binding update? Can the binding be converted to YAML as well?
>> This change doesn't add/update any dtsi properties but just checking if an
>> existing property is present to decide if IRQ support is required, so no
>> binding change is needed.
> The property is now optional in the binding. Please update the binding.
Right, thanks for pointing it out. I forgot that part.
I will update the binding. How about only update the interrupt properties as
optional in this series then I can come up with following patch to convert
the binding to YAML format?
>
>>>>    1 file changed, 28 insertions(+), 17 deletions(-)
>>>>
>>>> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
>>>> index 988204c..55fa981 100644
>>>> --- a/drivers/spmi/spmi-pmic-arb.c
>>>> +++ b/drivers/spmi/spmi-pmic-arb.c
>>>> @@ -1280,10 +1280,12 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
>>>>                   goto err_put_ctrl;
>>>>           }
>>>>    
>>>> -       pmic_arb->irq = platform_get_irq_byname(pdev, "periph_irq");
>>>> -       if (pmic_arb->irq < 0) {
>>>> -               err = pmic_arb->irq;
>>>> -               goto err_put_ctrl;
>>>> +       if (of_find_property(pdev->dev.of_node, "interrupt-names", NULL)) {
>>> I don't think we should be keying off of interrupt-names. Instead we
>>> should be checking for something else. Maybe interrupt-controller
>>> property?
>> Sure, I can update it to check the presence of "interrupt-controller"
>> property.
> Ok.
