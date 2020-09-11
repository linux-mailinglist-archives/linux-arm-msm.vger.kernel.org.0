Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57348265B52
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 10:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725550AbgIKISp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 04:18:45 -0400
Received: from a27-11.smtp-out.us-west-2.amazonses.com ([54.240.27.11]:45320
        "EHLO a27-11.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725535AbgIKISo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 04:18:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599812324;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=HSaJciWnCPvyHhxhEaupZz5L45ElMcl2+afaqaEiPDE=;
        b=V12WTd61C9BFiCr8/p+ES1RhxqcIg7nulH0mkjctl0BvmPZ8ES/NutydhLYNhaSG
        julgD3PmmhbZCZLvqunutN2Ij+49iDC55PixHz8qdCceqyzGWH3Inc+Jb8hXNcyx/oB
        B36M7CjrVqiAMh3c+qeeQyCHm5/QryY7Bam2rYQY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599812324;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=HSaJciWnCPvyHhxhEaupZz5L45ElMcl2+afaqaEiPDE=;
        b=bg/3ekZ0cOgrp65Agx4nHaEwe7axK5rUK3z1xgCJRRwHNAIzGReqL0rlj+X0JIRQ
        jIiVsilArCMqpuhhOxILOHMEykeEdQXqr2msfMWQlRqbn8f1mF1DdnoBo2WOdtliue2
        MK8wiR9UAzuPSqllVmWI2p8RQlUfjqe3MrHSaYpQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 11 Sep 2020 08:18:44 +0000
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/8] iommu/arm-smmu: Refactor context bank allocation
In-Reply-To: <20200904155513.282067-2-bjorn.andersson@linaro.org>
References: <20200904155513.282067-1-bjorn.andersson@linaro.org>
 <20200904155513.282067-2-bjorn.andersson@linaro.org>
Message-ID: <010101747c3eca88-35878e4c-07b1-4fee-94fc-77af55456507-000000@us-west-2.amazonses.com>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.11-54.240.27.11
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-04 21:25, Bjorn Andersson wrote:
> Extract the conditional invocation of the platform defined
> alloc_context_bank() to a separate function to keep
> arm_smmu_init_domain_context() cleaner.
> 
> Instead pass a reference to the arm_smmu_device as parameter to the
> call. Also remove the count parameter, as this can be read from the
> newly passed object.
> 
> This allows us to not assign smmu_domain->smmu before attempting to
> allocate the context bank and as such we don't need to roll back this
> assignment on failure.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
