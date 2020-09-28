Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6411627ADC1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 14:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbgI1M26 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 08:28:58 -0400
Received: from z5.mailgun.us ([104.130.96.5]:10212 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726328AbgI1M25 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 08:28:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601296137; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=xdne3b42R19CBmmD1o/ATM9Y99s0hNLFfkiTn9N47ps=;
 b=e9imC3OXTI0vMl2fIhYoSQeyObi4faFdHzqtaNoia3/HZYJ+wdEymuse3LXtRGgnw6hrIai+
 R3b0tnCH0ewIe6vqRo6vx8cul1bgGRKbAjaqJB8KU/fQFMn4DwiiOK9sjH5xRkUjdMyA5uef
 BRhIAw27K5ECiznOJMgK+nXBf6Q=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f71d70883f5ac99dbfb17c7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Sep 2020 12:28:56
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B2021C43387; Mon, 28 Sep 2020 12:28:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C9D21C433C8;
        Mon, 28 Sep 2020 12:28:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 28 Sep 2020 17:58:55 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        freedreno@lists.freedesktop.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCHv5 5/6] iommu: arm-smmu-impl: Use table to list QCOM
 implementations
In-Reply-To: <d9b46e48-afa5-ceff-aee8-a75a95a3e459@arm.com>
References: <cover.1600754909.git.saiprakash.ranjan@codeaurora.org>
 <f2d079d46cee22f09f6eb7e6f874a9eaa786ec2a.1600754909.git.saiprakash.ranjan@codeaurora.org>
 <d9b46e48-afa5-ceff-aee8-a75a95a3e459@arm.com>
Message-ID: <ca9d546d27b358a03a8108c98a37e17b@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-23 20:54, Robin Murphy wrote:
> On 2020-09-22 07:18, Sai Prakash Ranjan wrote:
>> Use table and of_match_node() to match qcom implementation
>> instead of multiple of_device_compatible() calls for each
>> QCOM SMMU implementation.
>> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>   drivers/iommu/arm/arm-smmu/arm-smmu-impl.c | 12 ++++++++----
>>   1 file changed, 8 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c 
>> b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
>> index d199b4bff15d..ce78295cfa78 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
>> @@ -9,6 +9,13 @@
>>     #include "arm-smmu.h"
>>   +static const struct of_device_id __maybe_unused 
>> qcom_smmu_impl_of_match[] = {
>> +	{ .compatible = "qcom,sc7180-smmu-500" },
>> +	{ .compatible = "qcom,sdm845-smmu-500" },
>> +	{ .compatible = "qcom,sm8150-smmu-500" },
>> +	{ .compatible = "qcom,sm8250-smmu-500" },
>> +	{ }
>> +};
> 
> Can you push the table itself into arm-smmu-qcom? That way you'll be
> free to add new SoCs willy-nilly without any possibility of
> conflicting with anything else.
> 
> Bonus points if you can fold in the Adreno variant and keep everything
> together ;)
> 

Sure I can get bonus points :)

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
