Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9DA3D735B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 12:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236341AbhG0Kfk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 06:35:40 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:59388 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236188AbhG0Kfk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 06:35:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627382140; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=jcDIGTlNdb13VAIbuMs/ke9zWyHAfziW4NuYUouZlG8=;
 b=ErDisCzF92DoTZUOiP2cLU+ry77wJmjovEKIrx+OqcJcnYp0q6vcsrsj4eEEcy0xPiNFRRUF
 VXyWIS0LWo6r3+jATIsaMqSu/a9rhnU8Mgonh5Z3uENEPc1iB8b02welNrVo2Q91TLudl1+1
 SppgqdNIAFqcRB5qL+gx3sXAB6g=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60ffe162290ea35ee6f2a43f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Jul 2021 10:35:14
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6E84AC4323A; Tue, 27 Jul 2021 10:35:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A5083C433D3;
        Tue, 27 Jul 2021 10:35:12 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 27 Jul 2021 16:05:12 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        srimuc <srimuc@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] iommu/arm-smmu: Add clk_bulk_{prepare/unprepare} to
 system pm callbacks
In-Reply-To: <c23a16d8-e39c-253f-5631-cffa94a1d532@arm.com>
References: <20210727093322.13202-1-saiprakash.ranjan@codeaurora.org>
 <955a3034-f7e7-f8f9-4abd-b65efbfbb404@arm.com>
 <c23a16d8-e39c-253f-5631-cffa94a1d532@arm.com>
Message-ID: <ee409973019e7412d221001955045cea@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Robin,

On 2021-07-27 16:03, Robin Murphy wrote:
> On 2021-07-27 11:25, Robin Murphy wrote:
>> On 2021-07-27 10:33, Sai Prakash Ranjan wrote:
>>> Some clocks for SMMU can have parent as XO such as 
>>> gpu_cc_hub_cx_int_clk
>>> of GPU SMMU in QTI SC7280 SoC and in order to enter deep sleep states 
>>> in
>>> such cases, we would need to drop the XO clock vote in unprepare call 
>>> and
>>> this unprepare callback for XO is in RPMh (Resource Power 
>>> Manager-Hardened)
>>> clock driver which controls RPMh managed clock resources for new QTI 
>>> SoCs
>>> and is a blocking call.
>>> 
>>> Given we cannot have a sleeping calls such as clk_bulk_prepare() and
>>> clk_bulk_unprepare() in arm-smmu runtime pm callbacks since the iommu
>>> operations like map and unmap can be in atomic context and are in 
>>> fast
>>> path, add this prepare and unprepare call to drop the XO vote only 
>>> for
>>> system pm callbacks since it is not a fast path and we expect the 
>>> system
>>> to enter deep sleep states with system pm as opposed to runtime pm.
>>> 
>>> This is a similar sequence of clock requests (prepare,enable and
>>> disable,unprepare) in arm-smmu probe and remove.
>> 
>> Nope. We call arm_smmu_rpm_get(), which may resume the device, from 
>> atomic contexts. clk_prepare() may sleep. This doesn't work.
> 
> Urgh, or maybe I skimmed the commit message too lightly *and* managed
> to totally misread the patch, sorry :(
> 
> I'll wake up some more and try again later...
> 

No worries, we took our time looking through that many times before 
posting this :)

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
