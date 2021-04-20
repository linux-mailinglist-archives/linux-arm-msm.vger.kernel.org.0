Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7483B365212
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Apr 2021 08:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbhDTGHH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Apr 2021 02:07:07 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:35548 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229985AbhDTGHH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Apr 2021 02:07:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618898796; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ewTV/EBlFexuHtL71GPSc2inLeA3xomPSaSc6BLPMEo=;
 b=Osju78jmIxiB2sRCoe7tU7R8w4P99PhKZAv7WQSxgMdntIgMfaAm+Dn9I0//fTjpu9FJn/bg
 Ei4/4pYwNfv0XE2R/X/tukAtch7njp2MmXrhCEblBj/UlGckO5HvKhgpFRKORJJ2GahNrzkh
 iYATICYQ+j9g2Z0dyQOC5MYHG/A=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 607e6f6bf34440a9d4353ecf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Apr 2021 06:06:35
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C1B1FC433D3; Tue, 20 Apr 2021 06:06:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5E8B9C433F1;
        Tue, 20 Apr 2021 06:06:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 20 Apr 2021 11:36:35 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCHv2 2/2] iommu/arm-smmu-qcom: Move the adreno smmu specific
 impl earlier
In-Reply-To: <20210419143802.GP1538589@yoga>
References: <cover.1614332994.git.saiprakash.ranjan@codeaurora.org>
 <c607d71eb0fe507c8b83cc0ea9b393777f22149a.1614332994.git.saiprakash.ranjan@codeaurora.org>
 <20210419143802.GP1538589@yoga>
Message-ID: <2b940e7f483b567b8e0b3f0ce657b453@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-04-19 20:08, Bjorn Andersson wrote:
> On Fri 26 Feb 03:55 CST 2021, Sai Prakash Ranjan wrote:
> 
>> Adreno(GPU) SMMU and APSS(Application Processor SubSystem) SMMU
>> both implement "arm,mmu-500" in some QTI SoCs and to run through
>> adreno smmu specific implementation such as enabling split pagetables
>> support, we need to match the "qcom,adreno-smmu" compatible first
>> before apss smmu or else we will be running apps smmu implementation
>> for adreno smmu and the additional features for adreno smmu is never
>> set. For ex: we have "qcom,sc7280-smmu-500" compatible for both apps
>> and adreno smmu implementing "arm,mmu-500", so the adreno smmu
>> implementation is never reached because the current sequence checks
>> for apps smmu compatible(qcom,sc7280-smmu-500) first and runs that
>> specific impl and we never reach adreno smmu specific implementation.
>> 
>> Suggested-by: Akhil P Oommen <akhilpo@codeaurora.org>
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> 
> Sorry for taking my time thinking about this.
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 

No worries, thanks Bjorn.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
