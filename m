Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B47C2DFD16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2019 07:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729146AbfJVFZ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Oct 2019 01:25:58 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55166 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727978AbfJVFZ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Oct 2019 01:25:58 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 23ECE6079D; Tue, 22 Oct 2019 05:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571721957;
        bh=YqOfsriP3Msi6tE3Vlaaza/R8BFMWE1uiHYJGZo9I7Y=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=H8BCHoyXcEerYpnS1kns/QKFgQat3ZYvNBBPHLqJ7Jfhdhcg9PRgN3qaOLnKTpEoe
         KIJtggA9oMH6zQ95sCCDlcZBJDSjmbhfqkr7sFn+Qp3g62wiyrNQrrjDIGM3VJOO7j
         Z309/Rph2+Qs4KYCodxPea/bp7/AV5SD0HVm5Ufg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.206.13.37] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C3E95606CF;
        Tue, 22 Oct 2019 05:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571721956;
        bh=YqOfsriP3Msi6tE3Vlaaza/R8BFMWE1uiHYJGZo9I7Y=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=nBTBfy3nzdYfzal02sLLopmjDoNEvl+ZlkB2YNaCK+3JEujstFXybb6+zmQlAYaqi
         Ad6VAVcoYsXcyPcCSA48VBjAwwMiOWYFGqbMMVl5qd4S/qYuG2QsjW953xXJpEktBi
         dOfF+FWMGwH4LoeKc8rWJ5CH4rlR8Na3BSotEyKI=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C3E95606CF
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v2 11/13] drivers: irqchip: qcom-pdc: Add irqchip for
 sc7180
To:     Marc Zyngier <maz@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>
References: <20191021065522.24511-1-rnayak@codeaurora.org>
 <20191021065522.24511-12-rnayak@codeaurora.org>
 <18195431666bd42aa31cf4ec1eed2881@www.loen.fr>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <ecca1dde-6729-2ad0-4a30-b5a6de335198@codeaurora.org>
Date:   Tue, 22 Oct 2019 10:55:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <18195431666bd42aa31cf4ec1eed2881@www.loen.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/21/2019 1:40 PM, Marc Zyngier wrote:
> On 2019-10-21 07:55, Rajendra Nayak wrote:
>> From: Maulik Shah <mkshah@codeaurora.org>
>>
>> Add sc7180 pdc irqchip
>>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> Cc: Lina Iyer <ilina@codeaurora.org>
>> Cc: Marc Zyngier <maz@kernel.org>
>> ---
>> v2: No change
>>
>>  drivers/irqchip/qcom-pdc.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
>> index faa7d61b9d6c..954fb599fa9c 100644
>> --- a/drivers/irqchip/qcom-pdc.c
>> +++ b/drivers/irqchip/qcom-pdc.c
>> @@ -310,3 +310,4 @@ static int qcom_pdc_init(struct device_node
>> *node, struct device_node *parent)
>>  }
>>
>>  IRQCHIP_DECLARE(pdc_sdm845, "qcom,sdm845-pdc", qcom_pdc_init);
>> +IRQCHIP_DECLARE(pdc_sc7180, "qcom,sc7180-pdc", qcom_pdc_init);
>
> What I gather from these 3 irq-related patches is that as far as
> the PDC is concerned, SDM845/850 and SC7180 are strictly identical.
>
> Why the churn?
>
>         M.

Hi Marc,

Different compatible were used to distinguish since interrupt mapping 
(PDC to GIC) was earlier kept in driver.

Now since mapping is kept in DTSI, we can continue to use 
qcom,sdm845-pdc for sc7180.

i will submit another patch to make it more generic for all SoCs like 
"qcom,pdc".

Thanks,

Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

