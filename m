Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5713939F6CE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 14:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232769AbhFHMfL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 08:35:11 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:13475 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232681AbhFHMfK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 08:35:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623155597; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=rqM3fUXUMOHAbavoHfTY6h2xEOV5jKG4BPoa4nABeLE=;
 b=fkcEFQ7sN5zFtfn4jGWJUEjOkmCYpTli34rO0+hMn+1HpVzlb1XmiAT5RaDoKSzRtfBsc4rL
 76uIgXsFqbL9btWycVdGzIAOhzDI7PbSEb10yuhlf1Oxj2UYvv4fb8yRpv6StV0Yvmh36qXP
 lQlrkSSgV3YFKxe7rJTmHJSgr+s=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60bf6377e27c0cc77fa97ada (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 08 Jun 2021 12:32:55
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C886FC43460; Tue,  8 Jun 2021 12:32:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 37632C433F1;
        Tue,  8 Jun 2021 12:32:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 08 Jun 2021 18:02:54 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Rob Clark <robdclark@gmail.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCHv3 0/2] iommu/arm-smmu-qcom: Add SC7280 support
In-Reply-To: <20210608120115.GA10174@willie-the-truck>
References: <cover.1618898456.git.saiprakash.ranjan@codeaurora.org>
 <20210608120115.GA10174@willie-the-truck>
Message-ID: <24b5ab1c287e86f195a34e6a780d5505@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-08 17:31, Will Deacon wrote:
> On Tue, Apr 20, 2021 at 11:34:55AM +0530, Sai Prakash Ranjan wrote:
>> Patch 1 adds the sc7280 smmu compatible.
>> Patch 2 moves the adreno smmu check before apss smmu to enable
>> adreno smmu specific implementation.
>> 
>> Note that dt-binding for sc7280 is already merged.
> 
> This conflicts with what I've already got queued at [1]. Please can you
> send an updated version, as I wasn't sure about the initialisation 
> order
> you need here wrt to the ACPI parts.
> 
> Thanks,
> 
> Will
> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=for-joerg/arm-smmu/updates

Sure, have rebased and sent the updated patch [1] after testing for the 
order.

Thanks,
Sai

[1] 
https://lore.kernel.org/lkml/cover.1623155117.git.saiprakash.ranjan@codeaurora.org/

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
