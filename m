Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26F1542BA9C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 10:37:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232692AbhJMIjD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 04:39:03 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:29076 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbhJMIjD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 04:39:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1634114220; x=1665650220;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=1wd9chj+GDl1ze4cZrlHuRft42asnGxq4BfF+IvjuH8=;
  b=HSfQm3gTa+54mqfR7JK9jOCIvA2iX8VYPj3C6VpFuRDdSxZEUoxKHAvC
   dhIy+r0t/YcHzVn03bUfoEuiy5Gdmi6X55Jv6noOG33SfnDTT6iswLVNl
   ZDcLK/Vwqu9XiGYQy31xV7Nl6wgTBxp7fxwB3hAv3q7dXAL18Cg9iBxMC
   I=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 13 Oct 2021 01:37:00 -0700
X-QCInternal: smtphost
Received: from nalasex01c.na.qualcomm.com ([10.47.97.35])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2021 01:37:00 -0700
Received: from [10.233.23.112] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Wed, 13 Oct 2021
 01:36:58 -0700
Subject: Re: [RESEND PATCH v1 8/9] spmi: pmic-arb: make interrupt support
 optional
To:     Stephen Boyd <sboyd@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>
References: <1631860384-26608-1-git-send-email-quic_fenglinw@quicinc.com>
 <1631860384-26608-9-git-send-email-quic_fenglinw@quicinc.com>
 <163406051353.936959.12718174954614897750@swboyd.mtv.corp.google.com>
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
Message-ID: <3bf1fbf3-e741-ef08-a4e4-b348b877d02a@quicinc.com>
Date:   Wed, 13 Oct 2021 16:36:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <163406051353.936959.12718174954614897750@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/13/2021 1:41 AM, Stephen Boyd wrote:
> Quoting Fenglin Wu (2021-09-16 23:33:03)
>> From: David Collins <collinsd@codeaurora.org>
>>
>> Make the support of PMIC peripheral interrupts optional for
>> spmi-pmic-arb devices.  This is useful in situations where
>> SPMI address mapping is required without the need for IRQ
>> support.
>>
>> Signed-off-by: David Collins <collinsd@codeaurora.org>
>> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
>> ---
>>   drivers/spmi/spmi-pmic-arb.c | 45 +++++++++++++++++++++++++++-----------------
> Is there a binding update? Can the binding be converted to YAML as well?
This change doesn't add/update any dtsi properties but just checking if an
existing property is present to decide if IRQ support is required, so no
binding change is needed.
>
>>   1 file changed, 28 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
>> index 988204c..55fa981 100644
>> --- a/drivers/spmi/spmi-pmic-arb.c
>> +++ b/drivers/spmi/spmi-pmic-arb.c
>> @@ -1280,10 +1280,12 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
>>                  goto err_put_ctrl;
>>          }
>>   
>> -       pmic_arb->irq = platform_get_irq_byname(pdev, "periph_irq");
>> -       if (pmic_arb->irq < 0) {
>> -               err = pmic_arb->irq;
>> -               goto err_put_ctrl;
>> +       if (of_find_property(pdev->dev.of_node, "interrupt-names", NULL)) {
> I don't think we should be keying off of interrupt-names. Instead we
> should be checking for something else. Maybe interrupt-controller
> property?
Sure, I can update it to check the presence of "interrupt-controller" 
property.
>> +               pmic_arb->irq = platform_get_irq_byname(pdev, "periph_irq");
>> +               if (pmic_arb->irq < 0) {
>> +                       err = pmic_arb->irq;
>> +                       goto err_put_ctrl;
