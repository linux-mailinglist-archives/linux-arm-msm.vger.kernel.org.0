Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F54319643A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2020 08:35:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725810AbgC1HfV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Mar 2020 03:35:21 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:19296 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725865AbgC1HfU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Mar 2020 03:35:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585380919; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=dK8y/HKe+m96WTHnDDWEvdDioyHshCf4t/zZiVGk6X0=;
 b=dKEbUYRSs1WIo07yQBj7+0XcjYoCRggrIRfFaEWzUK/cBznaw8QqNS1y2vX//gYrTDN7Hh6A
 V/EPcSvUwa49Hvf3/Pa6kPIhQk1wQMWSs7LQubAcnvYtGHgE52XesTkBxHWpvawdoglPMjYk
 ZfalMpxVDKjfn0VHez1Nxiwmg7A=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7efe36.7fa943f90458-smtp-out-n02;
 Sat, 28 Mar 2020 07:35:18 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AF738C43636; Sat, 28 Mar 2020 07:35:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E5E48C433D2;
        Sat, 28 Mar 2020 07:35:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sat, 28 Mar 2020 13:05:17 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu: Demote error messages to debug in
 shutdown callback
In-Reply-To: <5858bdac-b7f9-ac26-0c0d-c9653cef841d@arm.com>
References: <20200327132852.10352-1-saiprakash.ranjan@codeaurora.org>
 <0023bc68-45fb-4e80-00c8-01fd0369243f@arm.com>
 <37db9a4d524aa4d7529ae47a8065c9e0@codeaurora.org>
 <5858bdac-b7f9-ac26-0c0d-c9653cef841d@arm.com>
Message-ID: <d60196b548e1241b8334fadd0e8c2fb5@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Robin,

On 2020-03-28 00:32, Robin Murphy wrote:
> On 2020-03-27 3:09 pm, Sai Prakash Ranjan wrote:
> 
> Imagine your network driver doesn't implement a .shutdown method (so
> the hardware is still active regardless of device links), happens to
> have an Rx buffer or descriptor ring DMA-mapped at an IOVA that looks
> like the physical address of the memory containing some part of the
> kernel text lower down that call stack, and the MAC receives a
> broadcast IP packet at about the point arm_smmu_device_shutdown() is
> returning. Enjoy debugging that ;)
> 
> And if coincidental memory corruption seems too far-fetched for your
> liking, other fun alternatives might include "display tries to scan
> out from powered-off device, deadlocks interconnect and prevents
> anything else making progress", or "access to TZC-protected physical
> address triggers interrupt and over-eager Secure firmware resets
> system before orderly poweroff has a chance to finish".
> 
> Of course the fact that in practice we'll *always* see the warning
> because there's no way to tear down the default DMA domains, and even
> if all devices *have* been nicely quiesced there's no way to tell, is
> certainly less than ideal. Like I say, it's not entirely clear-cut
> either way...
> 

Thanks for these examples, good to know these scenarios in case we come 
across these.
However, if we see these error/warning messages appear everytime then 
what will be
the credibility of these messages? We will just ignore these messages 
when
these issues you mention actually appears because we see them everytime 
on
reboot or shutdown. So doesn't it make sense to enable these only when
we are debugging? We could argue that how will we know the issue could 
be related
to SMMU, but that's the case even now.

The reason why this came up was that, we had a NOC(interconnect) error 
which does
have a logging atleast in QCOM platforms from the secure side(it prints 
these on the console)
after the SMMU err messages and there was a confusion if it was related 
to these messages.
However, NOC error messages did identify the issue with the USB and it 
was solved later.
So these SMMU err/warning messages could be misleading like the above 
case almost everytime.

The probability of the issues you mentioned occuring is very less than 
the actual reboot,
shutdown scenarios, for ex: we run reboot stress test for thousands of 
times and these messages
don't add anything special in those cases when any issue occurs because 
they are seen
everytime.

Thanks,
Sai
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
