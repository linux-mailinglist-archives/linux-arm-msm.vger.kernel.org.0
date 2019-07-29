Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA01A79157
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2019 18:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727576AbfG2QqW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jul 2019 12:46:22 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:40868 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727488AbfG2QqW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jul 2019 12:46:22 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 0B38560A42; Mon, 29 Jul 2019 16:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564418781;
        bh=oEfTz25DMg3N/lplcYB6CKqNnvmYEuMZiG4+Z5D/Jbg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=JFYCrWKe6VxTbTEq1Ep+CSBeFqYI7brEg08NWsGq1ouacAERDYeXJMGHO1Nh8ll3Y
         LWQhz3hXAknsXmQaGAsiSIYpymUqzES6cbXQu9sneuRWRl6vQy2MAejPlpvqshWVS+
         gxZ071f0xNlAzVD6pr/k+JAhrIbg1lF7Jsw6ifTQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id F386C6037C;
        Mon, 29 Jul 2019 16:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564418777;
        bh=oEfTz25DMg3N/lplcYB6CKqNnvmYEuMZiG4+Z5D/Jbg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=BqLagmE8UVjFVdV8t7Wzzgv1RFDv2uY9OMKSFJIx05Xz7j2sJMUggph4bFA8pBLnm
         sNDHd0RRcu5DIhPz10MAWVUb8HPuW/RpstE74l+zfUn+xp+fyknG8FUxe5Rq813s81
         7QdtCZ4fzY0FiVszPcHOJo+ScpTEbWSDSsmoqEvk=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 29 Jul 2019 22:16:16 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     robh+dt@kernel.org, vkoul@kernel.org, aneela@codeaurora.org,
        mark.rutland@arm.com, agross@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        clew@codeaurora.org
Subject: Re: [PATCH 0/6] Add support for Qualcomm SM8150 and SC7180 SoCs
In-Reply-To: <20190729153826.GT7234@tuxbook-pro>
References: <20190729120633.20451-1-sibis@codeaurora.org>
 <20190729153826.GT7234@tuxbook-pro>
Message-ID: <e7a6a873c47f96a1ca326a50f544d35a@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Bjorn,
Thanks for the review!

On 2019-07-29 21:08, Bjorn Andersson wrote:
> On Mon 29 Jul 05:06 PDT 2019, Sibi Sankar wrote:
> 
>> This patch series adds SCM, APSS shared mailbox and QMP AOSS PD/clock
>> support on SM8150 and SC7180 SoCs.
>> 
> 
> Thanks Sibi, this looks good.
> 
> Could you please update the last 5 patches to ensure/maintain sort 
> order
> of the lists they affect.

yes I'll do that

> 
> Regards,
> Bjorn
> 
>> Sibi Sankar (6):
>>   soc: qcom: smem: Update max processor count
>>   dt-bindings: firmware: scm: Add SM8150 and SC7180 support
>>   dt-bindings: mailbox: Add APSS shared for SM8150 and SC7180 SoCs
>>   mailbox: qcom: Add support for Qualcomm SM8150 and SC7180 SoCs
>>   dt-bindings: soc: qcom: aoss: Add SM8150 and SC7180 support
>>   soc: qcom: aoss: Add AOSS QMP support
>> 
>>  Documentation/devicetree/bindings/firmware/qcom,scm.txt      | 2 ++
>>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt    | 2 ++
>>  Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt | 5 
>> ++++-
>>  drivers/mailbox/qcom-apcs-ipc-mailbox.c                      | 2 ++
>>  drivers/soc/qcom/qcom_aoss.c                                 | 2 ++
>>  drivers/soc/qcom/smem.c                                      | 2 +-
>>  6 files changed, 13 insertions(+), 2 deletions(-)
>> 
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
