Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B605E1E0F23
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2020 15:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403802AbgEYNKt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 09:10:49 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:26090 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388757AbgEYNKp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 09:10:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590412245; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=aF4c3OruqF54AfZxTOJsQX65D8kLmu7DWi/fjq3WVJo=;
 b=xhtNQ1/8h7VopMC81sttxRhOqJfHIiOUq0wiv8/AlSPDR1nfoxSfkS3E68Oa3qBOkvO10cfQ
 ICB0EKM7VbBZBCYDpmrw71O+svqbYT9p0a6l2haqO1Hf7j/YSsjDMUju/JAPiRKLcW3z/x9v
 it8oRf7f1rIEQiItlUBxwNKVamw=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5ecbc3bc9d4cf4d3ef77c127 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 25 May 2020 13:10:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 273B3C433C9; Mon, 25 May 2020 13:10:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7D3D6C433C6;
        Mon, 25 May 2020 13:10:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 25 May 2020 18:40:19 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Joerg Roedel <jroedel@suse.de>
Cc:     Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
        Robin Murphy <robin.murphy@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] iommu: Fix group refcount in iommu_alloc_default_domain()
In-Reply-To: <20200525130253.GH5075@suse.de>
References: <20200522130145.30067-1-saiprakash.ranjan@codeaurora.org>
 <20200525130253.GH5075@suse.de>
Message-ID: <132bf1acfb685d34db9caef6f55265de@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Joerg,

On 2020-05-25 18:32, Joerg Roedel wrote:
> Hi,
> 
> On Fri, May 22, 2020 at 06:31:45PM +0530, Sai Prakash Ranjan wrote:
>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>> index a4c2f122eb8b..05f7b77c432f 100644
>> --- a/drivers/iommu/iommu.c
>> +++ b/drivers/iommu/iommu.c
>> @@ -1491,6 +1491,7 @@ static int iommu_alloc_default_domain(struct 
>> device *dev)
>>  {
>>  	struct iommu_group *group;
>>  	unsigned int type;
>> +	int ret;
>> 
>>  	group = iommu_group_get(dev);
>>  	if (!group)
>> @@ -1501,7 +1502,11 @@ static int iommu_alloc_default_domain(struct 
>> device *dev)
>> 
>>  	type = iommu_get_def_domain_type(dev);
>> 
>> -	return iommu_group_alloc_default_domain(dev->bus, group, type);
>> +	ret = iommu_group_alloc_default_domain(dev->bus, group, type);
>> +
>> +	iommu_group_put(group);
>> +
>> +	return ret;
>>  }
>> 
>>  /**
> 
> Thanks for the report and the fix. I think it is better to fix this by
> not taking a group reference in iommu_alloc_default_domain() at all and
> pass group as a parameter. Please see the patch I just sent out.
> 

Thanks for the patch, it looks like the right thing to do. Testing it
out now.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
