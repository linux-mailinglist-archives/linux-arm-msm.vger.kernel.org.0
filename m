Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 729BA252E91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Aug 2020 14:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729784AbgHZMRw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Aug 2020 08:17:52 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:19781 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729686AbgHZMRv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Aug 2020 08:17:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598444270; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=r/4qUAmqAI0V7gRbqKrmT3zgfbrjj739xnjXpNtJKmA=;
 b=X1LqkOUxOaO+4QMIHxkn5RhqoR/oVlLFABOnjgiZwmenkRNZ8YpXNLaTbuEjFKkywo6E8QF8
 Fxjw/UNJd246B2MYftVETymossrBlEyMfYgmz5zqzqTkXEdMLaO/E0WiWMf9Xg7/JMxvYoaD
 1GMZV9kKaqMDNR2EkZubgXzptF4=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f4652dcf4c0f8ce20da78b2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 26 Aug 2020 12:17:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3762FC433A1; Wed, 26 Aug 2020 12:17:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5D919C433CA;
        Wed, 26 Aug 2020 12:17:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 26 Aug 2020 17:47:30 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>,
        Douglas Anderson <dianders@chromium.org>
Cc:     Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] iommu: Add support to filter non-strict/lazy mode based
 on device names
In-Reply-To: <e3e4da33-a44f-0a07-9e2e-0f806875ab0b@arm.com>
References: <20200825154249.20011-1-saiprakash.ranjan@codeaurora.org>
 <e3e4da33-a44f-0a07-9e2e-0f806875ab0b@arm.com>
Message-ID: <d9b1f1b614057d87279c26e13cbbb1f5@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-26 17:07, Robin Murphy wrote:
> On 2020-08-25 16:42, Sai Prakash Ranjan wrote:
>> Currently the non-strict or lazy mode of TLB invalidation can only be 
>> set
>> for all or no domains. This works well for development platforms where
>> setting to non-strict/lazy mode is fine for performance reasons but on
>> production devices, we need a more fine grained control to allow only
>> certain peripherals to support this mode where we can be sure that it 
>> is
>> safe. So add support to filter non-strict/lazy mode based on the 
>> device
>> names that are passed via cmdline parameter "iommu.nonstrict_device".
> 
> There seems to be considerable overlap here with both the existing
> patches for per-device default domain control [1], and the broader
> ongoing development on how to define, evaluate and handle "trusted"
> vs. "untrusted" devices (e.g. [2],[3]). I'd rather see work done to
> make sure those integrate properly together and work well for
> everyone's purposes, than add more disjoint mechanisms that only
> address small pieces of the overall issue.
> 
> Robin.
> 
> [1]
> https://lore.kernel.org/linux-iommu/20200824051726.7xaJRTTszJuzdFWGJ8YNsshCtfNR0BNeMrlILAyqt_0@z/
> [2]
> https://lore.kernel.org/linux-iommu/20200630044943.3425049-1-rajatja@google.com/
> [3]
> https://lore.kernel.org/linux-iommu/20200626002710.110200-2-rajatja@google.com/
> 

Thanks for the links, [1] definitely sounds interesting, I was under the 
impression
that changing such via sysfs is late, but seems like other Sai has got 
it working
for the default domain type. So we can extend that and add a strict 
attribute as well,
we should be definitely OK with system booting with default strict mode 
for all
peripherals as long as we have an option to change that later, Doug?

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
