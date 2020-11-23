Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1C52C1149
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 18:03:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387746AbgKWRCJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 12:02:09 -0500
Received: from z5.mailgun.us ([104.130.96.5]:52977 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729370AbgKWRCI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 12:02:08 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606150928; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=OMLlds5ZASBxc6VI9c5Wt8OmEB5BECKe6YXf0Nc2/+A=;
 b=dmrmNaX1edMclSQXezDLfNqLnNbD7YC23ZQ0WFnXtZ5WRX6qqz/dwjuBw8DVT6BMfJ+Ir7OQ
 HdqXWrzpCQZETMBUR9upE0Sior+7yTNLzQCwucr/oe3PvzifTFLrKKk39mZlq/jcRd9nazs+
 jqoXWetbkDXJB7kxiY+tj1Kb+uA=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fbbeafea5c560669cd5f5f0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Nov 2020 17:01:50
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D7902C43466; Mon, 23 Nov 2020 17:01:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0A71EC433C6;
        Mon, 23 Nov 2020 17:01:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 23 Nov 2020 22:31:48 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno@lists.freedesktop.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCHv8 0/8] System Cache support for GPU and required SMMU
 support
In-Reply-To: <20201123152146.GE11033@willie-the-truck>
References: <cover.1605621785.git.saiprakash.ranjan@codeaurora.org>
 <20201123152146.GE11033@willie-the-truck>
Message-ID: <50b68f2bdf9413b896fbe816ba4ddbc9@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-23 20:51, Will Deacon wrote:
> On Tue, Nov 17, 2020 at 08:00:39PM +0530, Sai Prakash Ranjan wrote:
>> Some hardware variants contain a system cache or the last level
>> cache(llc). This cache is typically a large block which is shared
>> by multiple clients on the SOC. GPU uses the system cache to cache
>> both the GPU data buffers(like textures) as well the SMMU pagetables.
>> This helps with improved render performance as well as lower power
>> consumption by reducing the bus traffic to the system memory.
>> 
>> The system cache architecture allows the cache to be split into slices
>> which then be used by multiple SOC clients. This patch series is an
>> effort to enable and use two of those slices preallocated for the GPU,
>> one for the GPU data buffers and another for the GPU SMMU hardware
>> pagetables.
>> 
>> Patch 1 - Patch 6 adds system cache support in SMMU and GPU driver.
>> Patch 7 and 8 are minor cleanups for arm-smmu impl.
>> 
>> Changes in v8:
>>  * Introduce a generic domain attribute for pagetable config (Will)
>>  * Rename quirk to more generic IO_PGTABLE_QUIRK_ARM_OUTER_WBWA (Will)
>>  * Move non-strict mode to use new struct domain_attr_io_pgtbl_config 
>> (Will)
> 
> Modulo some minor comments I've made, this looks good to me. What is 
> the
> plan for merging it? I can take the IOMMU parts, but patches 4-6 touch 
> the
> MSM GPU driver and I'd like to avoid conflicts with that.
> 

SMMU bits are pretty much independent and GPU relies on the domain 
attribute
and the quirk exposed, so as long as SMMU changes go in first it should 
be good.
Rob?

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
