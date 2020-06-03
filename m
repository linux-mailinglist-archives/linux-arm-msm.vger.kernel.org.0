Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54DBE1ECF32
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2020 14:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbgFCMB0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jun 2020 08:01:26 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:39093 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725855AbgFCMBZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jun 2020 08:01:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591185685; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=SeSF64gWAAvQHU3nZPOI+yYNnSV/P3R4z/7sHFFTb98=;
 b=EzPXgEAbFh38tykk1LdvnKmhdjDrM8aOA2OBo1TqMCNnUVnDjiaatGfpPnpF/SI1afS9b3hl
 hnov8cXdsBiyRXpKBbvky4QzUjSyUS0sVz1S9ojOmj637NqFmXql/XWZn+LliNYtgoFR9kZ9
 iWj+rFFdWfpRpWQm2b4ymglzDko=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5ed790f9ea0dfa490e142252 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 03 Jun 2020 12:00:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 46D94C43391; Wed,  3 Jun 2020 12:00:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 94B2FC433CA;
        Wed,  3 Jun 2020 12:00:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 03 Jun 2020 17:30:55 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 2/2] coresight: tmc: Add shutdown callback for TMC ETR/ETF
In-Reply-To: <bf7e8ac2-51b2-d9cb-9c4f-c311297accac@arm.com>
References: <cover.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <28123d1e19f235f97555ee36a5ed8b52d20cbdea.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <20200601212858.GB24287@xps15>
 <bf7e8ac2-51b2-d9cb-9c4f-c311297accac@arm.com>
Message-ID: <1549935cf69ac3a006f32eb278821027@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Robin, Mathieu

On 2020-06-03 17:07, Robin Murphy wrote:
> On 2020-06-01 22:28, Mathieu Poirier wrote:
>> That being said I'm sure that dependencies on an IOMMU isn't a problem 
>> confined
>> to coresight. I am adding Robin Murphy, who added this commit [1], to 
>> the thread
>> in the hope that he can provide guidance on the right way to do this.
> 
> Right, it's not specific to CoreSight, and it's not even specific to
> IOMMUs really. In short, blame kexec ;)
> 

Yes it is not specific to coresight, we are targeting this for all
consumers/clients of SMMU(atleast on SC7180 SoC). We have display 
throwing
NoC/interconnect errors[1] during reboot after SMMU is disabled.
This is also not specific to kexec either as you explained here [2] 
about
a case with display which is exacly what is happening in our system [1].

[1] 
https://lore.kernel.org/lkml/1591009402-681-1-git-send-email-mkrishn@codeaurora.org/
[2] 
https://lore.kernel.org/lkml/5858bdac-b7f9-ac26-0c0d-c9653cef841d@arm.com/

> The fundamental thing is that devices should stop any DMA activity at
> shutdown. For a normal poweroff you can typically get away without
> doing so, but over kexec, ongoing DMA traffic may corrupt memory in
> the new kernel (at worst, I think even DMA reads could potentially
> cause unexpected cache behaviour that might lead to mishaps, given the
> right combination of memory attributes).
> 
> IOMMUs merely help to make the situation more serious. For similar
> kexec reasons, they need to disable any existing translations at
> shutdown (imagine if the second kernel didn't have an IOMMU driver).
> And at that point, even the normal poweroff case becomes problematic,
> because any device DMA that hasn't been shut down beforehand is now
> not necessarily going benignly to memory as it would in the no-IOMMU
> case above, but potentially to random physical addresses, with all the
> hilarity ensuing that you would expect from that.
> 

Thanks,
Sai
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
