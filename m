Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD6D3B3841
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 23:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232163AbhFXVDK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 17:03:10 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:26499 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230116AbhFXVDK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 17:03:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624568450; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=VMDA1hdRC/vxz4nifn3ni0YEzSVND3IOiIt1Qw7Iopc=;
 b=aoJTDx/4dWQpWCJ6wNLamNq7pH6zRI1Wdlq/XUBVDT6e79NmK2XD+h5lyn2uz/a63BLBADUA
 fWJ+G9tnYr4Sd9Vf/ivzSC2qZdqrEz4+CPi5s93cAsRFyPUWJKYu02lKDkMtlFm2UOOArm34
 b+rPSeDaBQA95JEzxNi2XcDCKhM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60d4f2700090905e1640c786 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 24 Jun 2021 21:00:32
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B530DC43460; Thu, 24 Jun 2021 21:00:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E17BDC433D3;
        Thu, 24 Jun 2021 21:00:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 24 Jun 2021 14:00:30 -0700
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        clew@codeaurora.org
Subject: Re: [PATCH v3] bus: mhi: Add inbound buffers allocation flag
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <CAMZdPi_wKHQszTaJH8neHHGWJzRO9P7Zr3XTq0nSRku4EKnhuQ@mail.gmail.com>
References: <1624566520-20406-1-git-send-email-loic.poulain@linaro.org>
 <YNTrePQQ3scDzAhe@builder.lan>
 <CAMZdPi_wKHQszTaJH8neHHGWJzRO9P7Zr3XTq0nSRku4EKnhuQ@mail.gmail.com>
Message-ID: <7c9cd043ed4a5e0bd0d82d8c6ca1b212@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-24 03:45 PM, Loic Poulain wrote:
> Hi Bjorn,
> 
> On Thu, 24 Jun 2021 at 22:30, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
>> 
>> On Thu 24 Jun 15:28 CDT 2021, Loic Poulain wrote:
>> 
>> > Currently, the MHI controller driver defines which channels should
>> > have their inbound buffers allocated and queued. But ideally, this is
>> > something that should be decided by the MHI device driver instead,
>> > which actually deals with that buffers.
>> >
>> > Add a flag parameter to mhi_prepare_for_transfer allowing to specify
>> > if buffers have to be allocated and queued by the MHI stack.
>> >
>> > Keep auto_queue flag for now, but should be removed at some point.
>> >
>> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
>> > Tested-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> > Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> > Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
>> > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> > Acked-by: Jakub Kicinski <kuba@kernel.org>
>> > Link: https://lore.kernel.org/r/1621603519-16773-1-git-send-email-loic.poulain@linaro.org
>> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> 
>> What's the intention with this patch? Why is Mani the last S-o-b when
>> you're the one sending it and why is it sent only to linux-arm-msm@?
> 
> Actually the previous version of that patch has already been applied
> to mhi-next, but has been nacked as part of Mani's PR, so it's a quick
> follow-up fix to address the issue.
> 
>> And completely separate of the practical matters, is it true that qrtr
>> is the only client that use this pre-allocation feature?
> 
> yes.
> 
>> Would it be a net gain to simplify the core and add buffer allocation 
>> to qrtr instead?
> 
> Yes, I 100% agree, but I however would prefer to keep that for a
> follow-up series since this patch fixes a real issue for MHI/PCI
> modems (no inbound QRTR buffers allocated).
> 
> Regards,
> Loic
I had discussed this with Chris Lew a while ago and he also agreed qrtr 
can
queue inbound buffers.

This patch is good and we can continue to have flexibility for clients 
since
this allows MHI controller to not have to bother about some of the 
unnecessary
plugins/booleans we maintain on behalf of clients.

They can have more control this way and less headache for us.

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
