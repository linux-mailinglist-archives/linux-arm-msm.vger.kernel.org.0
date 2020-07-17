Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9C4223E24
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jul 2020 16:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbgGQOhB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jul 2020 10:37:01 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:22000 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726205AbgGQOhB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jul 2020 10:37:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594996620; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=NnSb7TJWGqQpSkl7k2UjULzlt0I9AkBaZ3dCnmY8dCM=; b=gp9F7c4VTWpUaf1g1jmGtx0IqWKN2ePUvozbTYljunhg8sQhEekpnwszqO8ogTkJhECvWDe6
 McDptHfhgJWtd/bYqU1S/oWNi753eVkGmRMROosFOJgp1vHlD4vDbr7K7hE/DP9n9lHTiNqA
 l0apPDyVPWA47xrLTb54yrvHtg0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f11b76bc9bd2efa2e1a5983 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 17 Jul 2020 14:36:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A6EC1C433CA; Fri, 17 Jul 2020 14:36:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.9] (unknown [59.99.219.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DD85EC433C6;
        Fri, 17 Jul 2020 14:36:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DD85EC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [PATCH] drm: msm: a6xx: fix gpu failure after system resume
To:     Rob Clark <robdclark@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Jonathan <jonathan@marek.ca>,
        Rajendra Nayak <rnayak@codeaurora.org>
References: <1594733130-398-1-git-send-email-akhilpo@codeaurora.org>
 <20200714171036.GS3191083@google.com>
 <CAF6AEGsvbnWiFXQUFR+k-CLJ2CsCEoiVVE8pGVq0X0=VHE3hHA@mail.gmail.com>
From:   Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <a466103a-7f70-468c-c8d3-16b59ae8b3d5@codeaurora.org>
Date:   Fri, 17 Jul 2020 20:06:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGsvbnWiFXQUFR+k-CLJ2CsCEoiVVE8pGVq0X0=VHE3hHA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/15/2020 12:12 AM, Rob Clark wrote:
> On Tue, Jul 14, 2020 at 10:10 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>>
>> On Tue, Jul 14, 2020 at 06:55:30PM +0530, Akhil P Oommen wrote:
>>> On targets where GMU is available, GMU takes over the ownership of GX GDSC
>>> during its initialization. So, take a refcount on the GX PD on behalf of
>>> GMU before we initialize it. This makes sure that nobody can collapse the
>>> GX GDSC once GMU owns the GX GDSC. This patch fixes some weird failures
>>> during GPU wake up during system resume.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
>>
>> I went through a few dozen suspend/resume cycles on SC7180 and didn't run
>> into the kernel panic that typically occurs after a few iterations without
>> this patch.
>>
>> Reported-by: Matthias Kaehlcke <mka@chromium.org>
>> Tested-by: Matthias Kaehlcke <mka@chromium.org>
>>
>> On which tree is this patch based on? I had to apply it manually because
>> 'git am' is unhappy when I try to apply it:
>>
>>    error: sha1 information is lacking or useless (drivers/gpu/drm/msm/adreno/a6xx_gmu.c).
>>    error: could not build fake ancestor
>>
>> Both upstream and drm-msm are in my remotes and synced, so I suspect it's
>> some private tree. Please make sure to base patches on the corresponding
>> maintainer tree or upstream, whichs makes life easier for maintainers,
>> testers and reviewers.
> 
> I've run into the same issue frequently :-(
> 
> BR,
> -R
> 
Sorry, I was using msm-next brand as the base, but had the opp-next 
branch merged too inadvertently.

-Akhil
