Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC48D1B140E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 20:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgDTSLD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 14:11:03 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:52544 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726532AbgDTSLC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 14:11:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587406262; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=wos3Ak73xOXHzWR83+yksTYRpe5mwIS/buxq9eAwCz8=;
 b=mSs/GQYqfZToWyRP3JWD5mtfnYir3UpV0jNX1KGZ3Mx6tKvcIl1W5LoWebKmXY69qC3QFknz
 CP8gSyCQE56e6VGk4gLFdtQiRtlkTulnpIWKFKqfSlFw5wN3oxGm9NKKHdwSc6uLVDHDznnp
 hpTzmmd6lFqK7hMP4TRCswPKCLY=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9de5a5.7f8e56643570-smtp-out-n04;
 Mon, 20 Apr 2020 18:10:45 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DB666C433F2; Mon, 20 Apr 2020 18:10:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5DCECC433D2;
        Mon, 20 Apr 2020 18:10:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 20 Apr 2020 23:40:42 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Evan Green <evgreen@chromium.org>
Subject: Re: [PATCHv3 4/6] iommu/arm-smmu-qcom: Request direct mapping for
 modem device
In-Reply-To: <49c8c377-961b-3f95-a99c-08528def4cb7@arm.com>
References: <cover.1587400573.git.saiprakash.ranjan@codeaurora.org>
 <509d88fbe7592aa15f867933c177b61bc7ba8efa.1587400573.git.saiprakash.ranjan@codeaurora.org>
 <49c8c377-961b-3f95-a99c-08528def4cb7@arm.com>
Message-ID: <98fa2940456ade2bd0998dfaa6386653@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Robin,

On 2020-04-20 22:39, Robin Murphy wrote:
> On 2020-04-20 5:42 pm, Sai Prakash Ranjan wrote:
>> From: Sibi Sankar <sibis@codeaurora.org>
>> 
>> Request direct mapping for modem on platforms which don't have 
>> TrustZone
>> (which programs the modem SIDs) to prevent the following global faults 
>> seen
>> on Cheza/Trogdor:
> 
> Not strictly true - it's patch #6/6 that prevents *those* faults (and
> these days the driver should be reporting unmatched streams a little
> more helpfully). This change would resolve the context faults and/or
> weird memory corruption that might result from applying patch #6 alone
> - this is the crazy thing where transactions sometimes go directly to
> DRAM round the side of the SMMU so we can never safely remap anything,
> right?
> 

True this doesnt prevent global faults, the fault details should go to 
patch6.
I'll update the commit msg something like below:

The Q6 modem sub-system has direct access to DDR through memnoc.
Also SMMU is not expected to provide access control/translation for 
these SIDs
(sandboxing of the modem is achieved through XPUs engaged using SMC 
calls).

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
