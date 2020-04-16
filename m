Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ABE31ACEFB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 19:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388426AbgDPRoE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 13:44:04 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:63723 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2391025AbgDPRoC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 13:44:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587059041; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=JC4ZwghNo+JEiak2hmqi7d8kddFUllqOr9vrtZr5HYE=;
 b=H5jxEXFlqxPvUrEIyhaO+/yTpgOTtcxdzXaiJg8qb1fmCKmBL7KR1ObOBtmfWxDYSWJ1vuq2
 /KTPsevHr39OqGveMe8RAPfpOvJR6ZttUtmfbV2y3/N9QzUFInb1haWspbtR0MXLZeAHCunt
 cisxlfiQ28EEL3T++f3tOw6zV3g=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e989958.7f80986531b8-smtp-out-n03;
 Thu, 16 Apr 2020 17:43:52 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 65AEEC44795; Thu, 16 Apr 2020 17:43:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7D284C4478C;
        Thu, 16 Apr 2020 17:43:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Thu, 16 Apr 2020 23:13:50 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        iommu@lists.linux-foundation.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] iommu/arm-smmu: Allow client devices to select direct
 mapping
In-Reply-To: <fdc265e4-5a96-2def-df13-376249e16b49@arm.com>
References: <cover.1579692800.git.saiprakash.ranjan@codeaurora.org>
 <813cc5b2da10c27db982254b274bf26008a9e6da.1579692800.git.saiprakash.ranjan@codeaurora.org>
 <3f12cefb-3887-859c-ddf5-c7a0fc755152@arm.com>
 <540fc55811d0a60a929ff1f694d6d271@codeaurora.org>
 <fdc265e4-5a96-2def-df13-376249e16b49@arm.com>
Message-ID: <c84cf5debc171c0744e32049c70197e7@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Robin,

On 2020-04-16 22:47, Robin Murphy wrote:
> On 2020-04-16 5:23 pm, Sai Prakash Ranjan wrote:
>> Hi Robin,
>> 
>> On 2020-04-16 19:28, Robin Murphy wrote:
>>> On 2020-01-22 11:48 am, Sai Prakash Ranjan wrote:
>>>> From: Jordan Crouse <jcrouse@codeaurora.org>
>>>> 
>>>> Some client devices want to directly map the IOMMU themselves 
>>>> instead
>>>> of using the DMA domain. Allow those devices to opt in to direct
>>>> mapping by way of a list of compatible strings.
>>>> 
>>>> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
>>>> Co-developed-by: Sai Prakash Ranjan 
>>>> <saiprakash.ranjan@codeaurora.org>
>>>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>>>> ---
>>>>   drivers/iommu/arm-smmu-qcom.c | 39 
>>>> +++++++++++++++++++++++++++++++++++
>>>>   drivers/iommu/arm-smmu.c      |  3 +++
>>>>   drivers/iommu/arm-smmu.h      |  5 +++++
>>>>   3 files changed, 47 insertions(+)
>>>> 
>>>> diff --git a/drivers/iommu/arm-smmu-qcom.c 
>>>> b/drivers/iommu/arm-smmu-qcom.c
>>>> index 64a4ab270ab7..ff746acd1c81 100644
>>>> --- a/drivers/iommu/arm-smmu-qcom.c
>>>> +++ b/drivers/iommu/arm-smmu-qcom.c
>>>> @@ -3,6 +3,7 @@
>>>>    * Copyright (c) 2019, The Linux Foundation. All rights reserved.
>>>>    */
>>>>   +#include <linux/of_device.h>
>>>>   #include <linux/qcom_scm.h>
>>>>     #include "arm-smmu.h"
>>>> @@ -11,6 +12,43 @@ struct qcom_smmu {
>>>>       struct arm_smmu_device smmu;
>>>>   };
>>>>   +static const struct arm_smmu_client_match_data qcom_adreno = {
>>>> +    .direct_mapping = true,
>>>> +};
>>>> +
>>>> +static const struct arm_smmu_client_match_data qcom_mdss = {
>>>> +    .direct_mapping = true,
>>>> +};
>>> 
>>> Might it make sense to group these by the desired SMMU behaviour
>>> rather than (apparently) what kind of device the client happens to 
>>> be,
>>> which seems like a completely arbitrary distinction from the SMMU
>>> driver's PoV?
>>> 
>> 
>> Sorry, I did not get the "grouping by the desired SMMU behaviour" 
>> thing.
>> Could you please give some more details?
> 
> I mean this pattern:
> 
> device_a_data {
> 	.thing = this;
> }
> 
> device_b_data {
> 	.thing = this;
> }
> 
> device_c_data {
> 	.thing = that;
> }
> 
> match[] = {
> 	{ .compatible = "A", .data = &device_a_data },
> 	{ .compatible = "B", .data = &device_b_data },
> 	{ .compatible = "C", .data = &device_c_data },
> };
> 
> ...vs. this pattern:
> 
> do_this {
> 	.thing = this;
> }
> 
> do_that {
> 	.thing = that;
> }
> 
> match[] = {
> 	{ .compatible = "A", .data = &do_this },
> 	{ .compatible = "B", .data = &do_this },
> 	{ .compatible = "C", .data = &do_that },
> };
> 
> From the perspective of the thing doing the thing, grouping the data
> by device is meaningless if all that matters is whether to do this or
> that. The second pattern expresses that more naturally.
> 
> Of course if every device turns out to need a unique combination of
> several behaviours, then there ends up being no practical difference
> except that it's probably easier to come up with nice names under the
> first pattern. I guess it's up to how you see this developing in
> future; whether you're likely to need fine-grained per-device control,
> or don't expect it to go much beyond domain type.
> 

Thanks for explaining *this thing* :)
I will update the patch to follow the 2nd pattern as it makes more sense
to do_this or do_that directly. I'm not expecting anything other than
domain type atleast for now but hey we can always add the functionality
if the need arises.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
