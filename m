Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B10063A957C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 11:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232115AbhFPJFk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Jun 2021 05:05:40 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:23563 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232099AbhFPJFi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Jun 2021 05:05:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623834213; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=c2aSlY4HPu8TSLQRTzyE/vkYcQNY7NBautVdzmXyeM4=;
 b=XAqNLKRkW19wPfIrDX3kHT3+cf1r07Kq+1IBFzL+qVxs9ak5hbAwztSyY0LZVDa/BVetwoFN
 GRH/G10njehxDt30ZXe6f1XoE/N1HGP8g52+Rf7DJOSTnLk5pB7v4+UNkYAI6Aeh4A4SzFyJ
 l25Lu4SayC0ET8C7BD9jN6nzSBM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60c9be4a8491191eb3565e7e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 16 Jun 2021 09:03:06
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BB9BCC43460; Wed, 16 Jun 2021 09:03:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 03DB5C433F1;
        Wed, 16 Jun 2021 09:03:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 16 Jun 2021 14:33:04 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Krishna Reddy <vdumpa@nvidia.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Optimize partial walk flush for
 large scatter-gather list
In-Reply-To: <8535b6c757a5584b495f135f4377053c@codeaurora.org>
References: <20210609145315.25750-1-saiprakash.ranjan@codeaurora.org>
 <dbcd394a-4d85-316c-5dd0-033546a66132@arm.com>
 <c600e9b2534d54082a5272b508a7985f@codeaurora.org>
 <35bfd245-45e2-8083-b620-330d6dbd7bd7@arm.com>
 <12067ffb8243b220cf03e83aaac3e823@codeaurora.org>
 <266f190e-99ae-9175-cf13-7a77730af389@arm.com>
 <dfdabcdec99a4c6e3bf2b3c5eebe067f@codeaurora.org>
 <61c69d23-324a-85d7-2458-dfff8df9280b@arm.com>
 <BY5PR12MB37646698F37C00381EFF7C77B3349@BY5PR12MB3764.namprd12.prod.outlook.com>
 <07001b4ed6c0a491eacce6e4dc13ab5e@codeaurora.org>
 <BY5PR12MB376480219C42E5FCE0FE0FFBB3349@BY5PR12MB3764.namprd12.prod.outlook.com>
 <f749ba0957b516ab5f0ea57033d308c7@codeaurora.org>
 <BY5PR12MB376433B3FD0A59EF57C4522DB3319@BY5PR12MB3764.namprd12.prod.outlook.com>
 <5eb5146ab51a8fe0b558680d479a26cd@codeaurora.org>
 <da62ff1c-9b49-34d3-69a1-1a674e4a30f7@arm.com>
 <8535b6c757a5584b495f135f4377053c@codeaurora.org>
Message-ID: <d9226f4349c445c6ca63dc632b29e3e0@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-16 12:28, Sai Prakash Ranjan wrote:
> Hi Robin,
> 
> On 2021-06-15 19:23, Robin Murphy wrote:
>> On 2021-06-15 12:51, Sai Prakash Ranjan wrote:
> 
> <snip>...
> 
>>> Hi @Robin, from these discussions it seems they are not ok with the 
>>> change
>>> for all SoC vendor implementations and do not have any data on such 
>>> impact.
>>> As I mentioned above, on QCOM platforms we do have several 
>>> optimizations in HW
>>> for TLBIs and would like to make use of it and reduce the unmap 
>>> latency.
>>> What do you think, should this be made implementation specific?
>> 
>> Yes, it sounds like there's enough uncertainty for now that this needs
>> to be an opt-in feature. However, I still think that non-strict mode
>> could use it generically, since that's all about over-invalidating to
>> save time on individual unmaps - and relatively non-deterministic -
>> already.
>> 
>> So maybe we have a second set of iommu_flush_ops, or just a flag
>> somewhere to control the tlb_flush_walk functions internally, and the
>> choice can be made in the iommu_get_dma_strict() test, but also forced
>> on all the time by your init_context hook. What do you reckon?
>> 
> 
> Sounds good to me. Since you mentioned non-strict mode using it 
> generically,
> can't we just set tlb_flush_all() in io_pgtable_tlb_flush_walk() like 
> below
> based on quirk so that we don't need to add any check in 
> iommu_get_dma_strict()
> and just force the new flush_ops in init_context hook?
> 
> if (iop->cfg.quirks & IO_PGTABLE_QUIRK_NON_STRICT) {
>         iop->cfg.tlb->tlb_flush_all(iop->cookie);
>         return;
> }
> 

Instead of flush_ops in init_context hook, perhaps a io_pgtable quirk 
since this
is related to tlb, probably a bad name but IO_PGTABLE_QUIRK_TLB_INV 
which will be
set in init_context impl hook and the prev condition in 
io_pgtable_tlb_flush_walk()
becomes something like below. Seems very minimal and neat instead of 
poking into
tlb_flush_walk functions or touching dma strict with some flag?

if (iop->cfg.quirks & IO_PGTABLE_QUIRK_NON_STRICT ||
     iop->cfg.quirks & IO_PGTABLE_QUIRK_TLB_INV) {
         iop->cfg.tlb->tlb_flush_all(iop->cookie);
         return;
}

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
