Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01E103AC0F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 04:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230377AbhFRCt6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 22:49:58 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:62759 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbhFRCt6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 22:49:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623984469; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=YkbRytX69iUvG0ZM+UxVcMo8JSuDp5vDTNk35atHQbA=;
 b=YEG2WvOd5Utvhw+l2DK2W56QJNCkunjnviwWv2EJuER5TRHk2EqdhgXjQ1OwOdTxiHooiO3W
 1q3x5RSjRXJspEAYmDbuGNVSuCR95Id/RoKMyMFEpn3ZF0KACSN/Eh1kBsTs3aCZBnXkHdhO
 gzVo5cOVcWXq3zzt1LGF6GmmkYw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60cc0949ed59bf69ccb06a7b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Jun 2021 02:47:37
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E3618C4323A; Fri, 18 Jun 2021 02:47:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4B35DC433F1;
        Fri, 18 Jun 2021 02:47:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 18 Jun 2021 08:17:36 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Krishna Reddy <vdumpa@nvidia.com>
Cc:     Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Optimize partial walk flush for
 large scatter-gather list
In-Reply-To: <BY5PR12MB37641A153EAAC556C85A411FB30E9@BY5PR12MB3764.namprd12.prod.outlook.com>
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
 <d9226f4349c445c6ca63dc632b29e3e0@codeaurora.org>
 <BY5PR12MB37641A153EAAC556C85A411FB30E9@BY5PR12MB3764.namprd12.prod.outlook.com>
Message-ID: <32cb0645ce80db062291734464c7ef07@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Krishna,

On 2021-06-18 02:48, Krishna Reddy wrote:
>> Instead of flush_ops in init_context hook, perhaps a io_pgtable quirk 
>> since this is
>> related to tlb, probably a bad name but IO_PGTABLE_QUIRK_TLB_INV which 
>> will
>> be set in init_context impl hook and the prev condition in
>> io_pgtable_tlb_flush_walk()
>> becomes something like below. Seems very minimal and neat instead of 
>> poking
>> into tlb_flush_walk functions or touching dma strict with some flag?
>> 
>> if (iop->cfg.quirks & IO_PGTABLE_QUIRK_NON_STRICT ||
>>      iop->cfg.quirks & IO_PGTABLE_QUIRK_TLB_INV) {
>>          iop->cfg.tlb->tlb_flush_all(iop->cookie);
>>          return;
>> }
> 
> Can you name it as IO_PGTABLE_QUIRK_TLB_INV_ASID or
> IO_PGTABLE_QUIRK_TLB_INV_ALL_ASID?
> 

tlb_flush_all() callback implementations can use TLBIALL or TLBIASID. so
having ASID in the quirk name doesn't sound right given this quirk 
should
be generic enough to be usable on other implementations as well.
Instead I will go with IO_PGTABLE_QUIRK_TLB_INV_ALL and will be happy to
change if others have some other preference.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
