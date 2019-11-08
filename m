Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DAF7F4403
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 10:56:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731528AbfKHJ4E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 04:56:04 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:57896 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730614AbfKHJ4D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 04:56:03 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 7535A60F7B; Fri,  8 Nov 2019 09:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573206962;
        bh=KZHhAbqqnCFOXd1KYKDbtHlHAd4pu1onyFvWSBH3ORM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=liHquoS7xtOm/fl7KoVLf9VV7bMqlTI8IalksNTsYSnPO2DfHtwS4V30OyT7t+4Nj
         jO88R/+okMGfiODDAL/a4LQiChuwbeT+nacoXSB7uXxoHB+Qm51HBX9gw9yd8K3BIT
         7wDs9VGXkwFz/l9J4bGcyh4cHfNJ9PaTUuPbJMY8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.79.136.17] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3288760E07;
        Fri,  8 Nov 2019 09:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573206958;
        bh=KZHhAbqqnCFOXd1KYKDbtHlHAd4pu1onyFvWSBH3ORM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=D8bh11abOlA+Wu0HKyZREiom/ce1OLMNblAtx6ZYLVVlKpqYTLJHTtbxL0FEhUL+5
         Av5l+W8tcoQUZ0kaB1CVvb2YhOr33Csb+k7MwmlY3YCOyvkvQoxoev3uydiTKwNDAO
         Lanv16E29589exp5qgjwbgEUppEs2Q8MGIZ5YgEI=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3288760E07
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v5 06/13] drivers: irqchip: qcom-pdc: Move to an SoC
 independent compatible
To:     Marc Zyngier <maz@kernel.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        swboyd@chromium.org, Lina Iyer <ilina@codeaurora.org>
References: <20191108092824.9773-1-rnayak@codeaurora.org>
 <20191108092824.9773-7-rnayak@codeaurora.org>
 <0d5090fc9def3b9fa03a733d4adc2ae0@www.loen.fr>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <9c2b33f2-02bb-e516-4cb5-b466757cd67a@codeaurora.org>
Date:   Fri, 8 Nov 2019 15:25:34 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0d5090fc9def3b9fa03a733d4adc2ae0@www.loen.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/8/2019 3:10 PM, Marc Zyngier wrote:
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
>>  drivers/irqchip/qcom-pdc.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
>> index faa7d61b9d6c..c175333bb646 100644
>> --- a/drivers/irqchip/qcom-pdc.c
>> +++ b/drivers/irqchip/qcom-pdc.c
>> @@ -309,4 +309,4 @@ static int qcom_pdc_init(struct device_node
>> *node, struct device_node *parent)
>>      return ret;
>>  }
>>
>> -IRQCHIP_DECLARE(pdc_sdm845, "qcom,sdm845-pdc", qcom_pdc_init);
>> +IRQCHIP_DECLARE(qcom_pdc, "qcom,pdc", qcom_pdc_init);
> 
> Acked-by: Marc Zyngier <marc.zyngier@arm.com>
> 
> How do you want me get this (and the DT change) merged? I can either take
> these two patches in the irqchip tree, or you arrange them to be taken
> by the platform maintainers. Your call.

I think it makes sense for you to take these two via your tree (The driver
and binding doc updates) and the DT node addition for pdc to go via Andy/Bjorn.
Andy/Bjorn, does that sound fine?

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
