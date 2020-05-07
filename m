Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 043F91C8799
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 13:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725848AbgEGLIS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 07:08:18 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:62534 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726891AbgEGLIR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 07:08:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588849697; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=gMmW7XurMTP82sFXTk8ae/eelAs13yx3uauX9ImYmK0=;
 b=InrC29/JK0KURCw7CTclTfPuuooZ2aw+6PSq4e/9zoo5JKqJAZ6pJtQyvkishmBVKEHl3cYh
 vHZ7gnOEuj2LTsvOddVrhPBjAwqvVHyfHKeyxCMgbdwdrt4NgWG3GMRjpq8cDzR35hznvS75
 Pn+BlryRMXAoeHhlhsX3WzwjIm4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb3ec13.7f8a4b1820a0-smtp-out-n04;
 Thu, 07 May 2020 11:08:03 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C4BECC44793; Thu,  7 May 2020 11:08:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BAB7DC433F2;
        Thu,  7 May 2020 11:08:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 07 May 2020 16:38:00 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, jroedel@suse.de,
        Stephen Boyd <swboyd@chromium.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCHv4 0/6] iommu/arm-smmu: Allow client devices to select
 identity mapping
In-Reply-To: <20200507103129.GA29541@willie-the-truck>
References: <cover.1587407458.git.saiprakash.ranjan@codeaurora.org>
 <aa54fd00a6d353c72664e41b7a4a4e3d@codeaurora.org>
 <20200507103129.GA29541@willie-the-truck>
Message-ID: <84efe9b60e1d7d440e0b5c1777d4eec6@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Will,

On 2020-05-07 16:01, Will Deacon wrote:
> On Thu, May 07, 2020 at 03:58:06PM +0530, Sai Prakash Ranjan wrote:
>> Hi Will, Joerg
>> 
>> On 2020-04-21 00:03, Sai Prakash Ranjan wrote:
>> > This series allows DRM, Modem devices to set a default
>> > identity mapping in qcom smmu implementation.
>> >
>> > Patch 1 is cleanup to support other SoCs to call into
>> > QCOM specific  implementation.
>> > Patch 2 sets the default identity domain for DRM devices.
>> > Patch 3 implements def_domain_type callback for arm-smmu.
>> > Patch 4 sets the default identity domain for modem device.
>> > Patch 5-6 adds the iommus property for mss pil.
>> >
>> > This is based on Joerg's tree:
>> >  -
>> > https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git/log/?h=iommu-probe-device-v2
>> >
>> > v4:
>> >  * Updated commit msg for mss pil requesting direct mapping
>> >
>> > v3:
>> >  * Use arm_smmu_master_cfg to get impl instead of long way as per Robin.
>> >  * Use def_domain_type name for the callback in arm_smmu_imp as per
>> > Robin
>> >
>> > Jordan Crouse (1):
>> >   iommu/arm-smmu: Allow client devices to select direct mapping
>> >
>> > Sai Prakash Ranjan (2):
>> >   iommu: arm-smmu-impl: Convert to a generic reset implementation
>> >   iommu/arm-smmu: Implement iommu_ops->def_domain_type call-back
>> >
>> > Sibi Sankar (3):
>> >   iommu/arm-smmu-qcom: Request direct mapping for modem device
>> >   dt-bindings: remoteproc: qcom: Add iommus property
>> >   arm64: dts: qcom: sdm845-cheza: Add iommus property
>> >
>> >  .../bindings/remoteproc/qcom,q6v5.txt         |  3 ++
>> >  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi    |  5 +++
>> >  drivers/iommu/arm-smmu-impl.c                 |  8 ++--
>> >  drivers/iommu/arm-smmu-qcom.c                 | 37 +++++++++++++++++--
>> >  drivers/iommu/arm-smmu.c                      | 12 ++++++
>> >  drivers/iommu/arm-smmu.h                      |  1 +
>> >  6 files changed, 60 insertions(+), 6 deletions(-)
>> 
>> This series is reviewed by Robin.
>> Any chance this series can make it to 5.8?
> 
> I'm planning to queue smmu stuff next week, been busy with arm64 stuff
> so far, sorry.
> 

No problem at all, thought of reminding once just in case.

Thanks
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
