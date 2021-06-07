Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E33B39D32C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jun 2021 04:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbhFGC5Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 6 Jun 2021 22:57:24 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:11671 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230127AbhFGC5Y (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 6 Jun 2021 22:57:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623034533; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=KJV8f/5MUtIQ+OIjIwk4fwm9EsA/WiuotihBkKF1cpI=;
 b=mpS+eQmlXa7hXFjzcZN5ap90TGN21KbtCwp/HsowdTw9+uCtQnEBukzO/mXVeOMn0urMADxS
 yFX742Ky6snvzTtZTxuFhB78Qnvek/llZmuFUIb/T1UV+MMz5BkVJRbskE3gZd3W2tXPGdaj
 aA1Uh5u5ikwZZjyi0Wfadtyesf0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60bd8aa58491191eb3c3f02d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 07 Jun 2021 02:55:33
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E1EE8C43460; Mon,  7 Jun 2021 02:55:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 19236C433D3;
        Mon,  7 Jun 2021 02:55:31 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 07 Jun 2021 08:25:30 +0530
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
In-Reply-To: <664abf04654d78b08b118d11c7c03d99@codeaurora.org>
References: <cover.1618898456.git.saiprakash.ranjan@codeaurora.org>
 <664abf04654d78b08b118d11c7c03d99@codeaurora.org>
Message-ID: <8eee199f10daa93407914f58bfefd6c1@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Will,

On 2021-05-24 08:13, Sai Prakash Ranjan wrote:
> Hi Will,
> 
> On 2021-04-20 11:34, Sai Prakash Ranjan wrote:
>> Patch 1 adds the sc7280 smmu compatible.
>> Patch 2 moves the adreno smmu check before apss smmu to enable
>> adreno smmu specific implementation.
>> 
>> Note that dt-binding for sc7280 is already merged.
>> 
>> Changes in v3:
>>  * Collect acks and reviews
>>  * Rebase on top of for-joerg/arm-smmu/updates
>> 
>> Changes in v2:
>>  * Add a comment to make sure this order is not changed in future 
>> (Jordan)
>> 
>> Sai Prakash Ranjan (2):
>>   iommu/arm-smmu-qcom: Add SC7280 SMMU compatible
>>   iommu/arm-smmu-qcom: Move the adreno smmu specific impl earlier
>> 
>>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 14 +++++++++++---
>>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> Gentle Ping!
> 

Is this going to be taken for 5.14 or needs one more release cycle?

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
