Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 681C7265B75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 10:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725767AbgIKIVx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 04:21:53 -0400
Received: from a27-21.smtp-out.us-west-2.amazonses.com ([54.240.27.21]:36166
        "EHLO a27-21.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725562AbgIKIVu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 04:21:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599812509;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=qsGVIC41HDalGoHN3eDwDtBTI6dMXbAdP5OWRu78vaU=;
        b=S4KMg/sBG5+tKtKDwGOxV04UnPiTDJWFq5neNbuXlOoFU34SoOhTNI0b9jbPgszq
        97YF+ZmNvFmCWv2aUWK52cWdsesmwbfnt4DsG24UJGuuJV3dk7nQjhu562WKjomHoEL
        LBdfVjEK6MviULaEKJMIQRarKZN+YoEoj2mauCZc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599812509;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=qsGVIC41HDalGoHN3eDwDtBTI6dMXbAdP5OWRu78vaU=;
        b=g1pbyM2mGPRzFJW/OOR684lg916DMBY/vyZmakaH1JH1kN/XyTfcbxNufx4ukbET
        CqINHvMsMmvhc30vOA2YLBkKv8dGByPN6B4iYqGL9I8SLi5Q4Y119zHX/ZOfLxvwfGQ
        KJ0VN+xU9tvuV/rthW/q1V/uuJ8jSAdVOx/D5vgY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 11 Sep 2020 08:21:49 +0000
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
Subject: Re: [PATCH v3 3/8] iommu/arm-smmu: Consult context bank allocator for
 identify domains
In-Reply-To: <20200904155513.282067-4-bjorn.andersson@linaro.org>
References: <20200904155513.282067-1-bjorn.andersson@linaro.org>
 <20200904155513.282067-4-bjorn.andersson@linaro.org>
Message-ID: <010101747c419fc3-f938605d-df63-4905-b97f-f9077b04ffee-000000@us-west-2.amazonses.com>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.11-54.240.27.21
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-04 21:25, Bjorn Andersson wrote:
> For implementations of the ARM SMMU where stream mappings of bypass 
> type
> are prohibited identity domains can be implemented by using context
> banks with translation disabled.
> 
> Postpone the decision to skip allocating a context bank until the
> implementation specific context bank allocator has been consulted and 
> if
> it decides to use a context bank for the identity map, don't enable
> translation (i.e. omit ARM_SMMU_SCTLR_M).
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 

Minor nit in the subject: identify -> identity

Reviewed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
