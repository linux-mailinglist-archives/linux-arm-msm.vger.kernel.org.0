Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AB51265B9C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 10:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725766AbgIKI31 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 04:29:27 -0400
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55]:59372
        "EHLO a27-55.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725613AbgIKI30 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 04:29:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599812966;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=wF0V9zhnfPcH616CwCLeByLepfZtHk7S+uGcjuckYGg=;
        b=oJf2MOtCCiIg9cdorU/sxdZpy0r+4s9L45rMpgIk726JZ3VQQaz6SSvFqm7E6p8V
        WoLEhAbmBCLsDQUIhQzZP5BApaTCAimxty/wSXTyYfyEhrOOPiisoQ/qx8xP5oNbU0M
        rQzszcz8PzauLodB1fW+1fjrsxyhjq6Y2CLqNoiQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599812966;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=wF0V9zhnfPcH616CwCLeByLepfZtHk7S+uGcjuckYGg=;
        b=MmcWNAdbl+Db5VvtmwK7wMVuFGhyru7twZG9AHqfFMmg1+3NVXQaKk37SDUxO8It
        LBi1mzi8BxDfcXSWGWQb8G7KMaebwxaAQI66g+O2K2Jkj5zgDoOXj1/ZwkQA7f8gjZa
        IAvqHKRGsRrXFp6kWMFNIW0PALeO7zyFoYK/P0pk=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 11 Sep 2020 08:29:25 +0000
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
Subject: Re: [PATCH v3 8/8] iommu/arm-smmu-qcom: Setup identity domain for
 boot mappings
In-Reply-To: <20200904155513.282067-9-bjorn.andersson@linaro.org>
References: <20200904155513.282067-1-bjorn.andersson@linaro.org>
 <20200904155513.282067-9-bjorn.andersson@linaro.org>
Message-ID: <010101747c489611-70607803-81f3-423c-a85a-c4e31c00971a-000000@us-west-2.amazonses.com>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.11-54.240.27.55
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-04 21:25, Bjorn Andersson wrote:
> With many Qualcomm platforms not having functional S2CR BYPASS a
> temporary IOMMU domain, without translation, needs to be allocated in
> order to allow these memory transactions.
> 
> Unfortunately the boot loader uses the first few context banks, so
> rather than overwriting a active bank the last context bank is used and
> streams are diverted here during initialization.
> 
> This also performs the readback of SMR registers for the Qualcomm
> platform, to trigger the mechanism.
> 
> This is based on prior work by Thierry Reding and Laurentiu Tudor.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 

Reviewed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
