Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00816F43B2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 10:42:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730614AbfKHJmz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 04:42:55 -0500
Received: from inca-roads.misterjones.org ([213.251.177.50]:33239 "EHLO
        inca-roads.misterjones.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731373AbfKHJmz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 04:42:55 -0500
Received: from www-data by cheepnis.misterjones.org with local (Exim 4.80)
        (envelope-from <maz@kernel.org>)
        id 1iT0n5-00043G-RF; Fri, 08 Nov 2019 10:42:51 +0100
To:     Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v5 06/13] drivers: irqchip: qcom-pdc: Move to an SoC  independent compatible
X-PHP-Originating-Script: 0:main.inc
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 08 Nov 2019 10:52:12 +0109
From:   Marc Zyngier <maz@kernel.org>
Cc:     <agross@kernel.org>, <robh+dt@kernel.org>,
        <bjorn.andersson@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mka@chromium.org>, <swboyd@chromium.org>,
        Lina Iyer <ilina@codeaurora.org>
In-Reply-To: <0d5090fc9def3b9fa03a733d4adc2ae0@www.loen.fr>
References: <20191108092824.9773-1-rnayak@codeaurora.org>
 <20191108092824.9773-7-rnayak@codeaurora.org>
 <0d5090fc9def3b9fa03a733d4adc2ae0@www.loen.fr>
Message-ID: <08b53aa7c448aad4fce71709b0385d4c@www.loen.fr>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/0.7.2
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Rcpt-To: rnayak@codeaurora.org, agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mka@chromium.org, swboyd@chromium.org, ilina@codeaurora.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org); SAEximRunCond expanded to false
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-11-08 10:50, Marc Zyngier wrote:
> On 2019-11-08 10:37, Rajendra Nayak wrote:
>> Remove the sdm845 SoC specific compatible to make the driver
>> easily reusable across other SoC's with the same IP block.
>> This will reduce further churn adding any SoC specific
>> compatibles unless really needed.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> Reviewed-by: Lina Iyer <ilina@codeaurora.org>
>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>> Cc: Marc Zyngier <maz@kernel.org>
>> ---
>>  drivers/irqchip/qcom-pdc.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
>> index faa7d61b9d6c..c175333bb646 100644
>> --- a/drivers/irqchip/qcom-pdc.c
>> +++ b/drivers/irqchip/qcom-pdc.c
>> @@ -309,4 +309,4 @@ static int qcom_pdc_init(struct device_node
>> *node, struct device_node *parent)
>>  	return ret;
>>  }
>>
>> -IRQCHIP_DECLARE(pdc_sdm845, "qcom,sdm845-pdc", qcom_pdc_init);
>> +IRQCHIP_DECLARE(qcom_pdc, "qcom,pdc", qcom_pdc_init);
>
> Acked-by: Marc Zyngier <marc.zyngier@arm.com>

I need to have my hands fixed. The real tag is:

Acked-by: Marc Zyngier <maz@kernel.org>

One day, I'll manage that...

         M.
-- 
Jazz is not dead. It just smells funny...
