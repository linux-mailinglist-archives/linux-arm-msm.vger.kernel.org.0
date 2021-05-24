Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A644638DF5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 May 2021 04:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232218AbhEXCpN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 May 2021 22:45:13 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:32885 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232200AbhEXCpM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 May 2021 22:45:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621824225; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=3HgzMQsvg1nEqkCRO70Zl63RQaxdpKr9j62Ak5Bqp0Y=;
 b=ur0PzqGH6WYpbQXm6Qddnzb1zsuC2+9RidkbNukchkvlWQueam1VQLowYjDeDHfYW9Mof2rl
 DUrsiOOgIpt9n1c/Wl5ci6HVPkULPbdnGdzLr8i8vuzptk/LaM94mtyg4mAxSKW4uTe/ruMR
 EUy5LnRAGMsMhL1v/zHSM0bRR1U=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60ab12d2c229adfeffbc7071 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 24 May 2021 02:43:30
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 36CB9C43143; Mon, 24 May 2021 02:43:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 70F1DC433F1;
        Mon, 24 May 2021 02:43:29 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 24 May 2021 08:13:29 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Rob Clark <robdclark@gmail.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        saiprakash.ranjan=codeaurora.org@codeaurora.org
Subject: Re: [PATCHv3 0/2] iommu/arm-smmu-qcom: Add SC7280 support
In-Reply-To: <cover.1618898456.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1618898456.git.saiprakash.ranjan@codeaurora.org>
Message-ID: <664abf04654d78b08b118d11c7c03d99@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Will,

On 2021-04-20 11:34, Sai Prakash Ranjan wrote:
> Patch 1 adds the sc7280 smmu compatible.
> Patch 2 moves the adreno smmu check before apss smmu to enable
> adreno smmu specific implementation.
> 
> Note that dt-binding for sc7280 is already merged.
> 
> Changes in v3:
>  * Collect acks and reviews
>  * Rebase on top of for-joerg/arm-smmu/updates
> 
> Changes in v2:
>  * Add a comment to make sure this order is not changed in future 
> (Jordan)
> 
> Sai Prakash Ranjan (2):
>   iommu/arm-smmu-qcom: Add SC7280 SMMU compatible
>   iommu/arm-smmu-qcom: Move the adreno smmu specific impl earlier
> 
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)

Gentle Ping!

Thanks,
Sai
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
