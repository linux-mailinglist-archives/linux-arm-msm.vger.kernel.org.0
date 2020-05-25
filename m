Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 259011E0C48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2020 12:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389948AbgEYKzD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 06:55:03 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:55696 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389970AbgEYKzC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 06:55:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590404101; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=URAxEGJXgPJ5x2QnGveL6/kEbz97aXCsDNyyWBJbK4E=;
 b=iG4RXWromCP4aAG7OeNJYgxBn6sdxJoNzueK/+FY9JADiaXzCGrbKlAITHV7tuPhuGBlXEo0
 TS/6ay0ouhBfMRjRWe7UapvxTmP6QCHCS0rh51chpra+U5Sv/AWXFfQN8k1p6EOgx4t4cpwX
 fgrd3cbuj+wWo5usCGHIH/K510M=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5ecba3ff4c3faf51e2e18f7d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 25 May 2020 10:54:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 06EB3C43387; Mon, 25 May 2020 10:54:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED autolearn=ham
        autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A53CEC433C6;
        Mon, 25 May 2020 10:54:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 25 May 2020 16:24:54 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sm8250: add apps_smmu node
In-Reply-To: <0f58e2fd-ef55-cf38-d403-4782662aa89e@marek.ca>
References: <20200524023815.21789-1-jonathan@marek.ca>
 <20200524023815.21789-3-jonathan@marek.ca>
 <42f39eeb2af9c82a551a417c62ea21d7@codeaurora.org>
 <0f58e2fd-ef55-cf38-d403-4782662aa89e@marek.ca>
Message-ID: <2a35f3b85d8311fb4298aaea82236967@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-05-25 15:39, Jonathan Marek wrote:
> Hi,
> 
> On 5/25/20 5:42 AM, Sai Prakash Ranjan wrote:
>> Hi Jonathan,
>> 
>> On 2020-05-24 08:08, Jonathan Marek wrote:
>>> Add the apps_smmu node for sm8250. Note that adding the iommus field 
>>> for
>>> UFS is required because initializing the iommu removes the bypass 
>>> mapping
>>> that created by the bootloader.
>>> 
>> 
>> This statement doesn't seem right, you can just say since the bypass 
>> is disabled
>> by default now, we need to add this property to enable translation and 
>> avoid global faults.
>> 
> 
> If I use this patch [1] then the UFS iommu property isn't needed. In
> downstream, the identity (bypass?) stream mapping is inherited from
> the bootloader, and UFS is used without any iommu property. Setting
> ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=n doesn't make it work on its own
> (without the UFS iommu property), so there's more to it than just
> "bypass is disabled by default now".
> 
> https://patchwork.kernel.org/patch/11310757/
> 

"iommus" property is not about inheriting stream mapping from 
bootloader,
it is used to enable SMMU address translation for the corresponding
master when specified. So when you have disabled bypass, i.e.,
ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=y or via cmdline 
"arm-smmu.disable_bypass=1"
and iommus property with SID and mask is not specified, then it will 
result
in SMMU global faults.

Downstream has bypass enabled(ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=n),so 
you
won't see any global faults if you do not have iommus property.

Patch in your link is for display because of the usecase for splash 
screen
on android and some other devices where the bootloader will configure 
SMMU,
it has not yet merged and not likely to get merged in the current state.

So yes "there is *not* much more to it than bypass is disabled by 
default now"
and you have to specify "iommus" for the master devices or you should 
enable bypass,
i.e., ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=n or arm-smmu.disable_bypass=n

Try without the patch in the link and without iommus for UFS and
ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=y and you will see.

-Sai
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
