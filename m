Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60B4D198D00
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2020 09:36:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbgCaHg2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Mar 2020 03:36:28 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:24263 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726174AbgCaHg0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Mar 2020 03:36:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585640185; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=gb7Dm9+ZO/tL/05FL1gIARuoKSdDON1AWF1u2v9LPbA=;
 b=uBqe5QH3QWNWN0uq0LoCs7Pb422EWwLPMt2D6ESm0UWAObhqtvWlaUpObMdkHqro6TmYNdxN
 INNP2gPkEKFxEVlzIqLM0Pyww+q+dzedGD0Z98pCTtRnRypUegQz7ZAxSMn2PxeTtbFvUED9
 i6iR6bRUclC64iu6XNHwF9rvVug=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e82f2ec.7f3b307aa340-smtp-out-n03;
 Tue, 31 Mar 2020 07:36:12 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ACC4BC44788; Tue, 31 Mar 2020 07:36:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0830EC433F2;
        Tue, 31 Mar 2020 07:36:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 31 Mar 2020 13:06:11 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        "list@263.net:IOMMU DRIVERS , Joerg Roedel <joro@8bytes.org>," 
        <iommu@lists.linux-foundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] iommu/arm-smmu: Demote error messages to debug in
 shutdown callback
In-Reply-To: <CAD=FV=WXTN6xxqtL6d6MHxG8Epuo6FSQERRPfnoSCskhjh1KeQ@mail.gmail.com>
References: <20200327132852.10352-1-saiprakash.ranjan@codeaurora.org>
 <0023bc68-45fb-4e80-00c8-01fd0369243f@arm.com>
 <37db9a4d524aa4d7529ae47a8065c9e0@codeaurora.org>
 <5858bdac-b7f9-ac26-0c0d-c9653cef841d@arm.com>
 <d60196b548e1241b8334fadd0e8c2fb5@codeaurora.org>
 <CAD=FV=WXTN6xxqtL6d6MHxG8Epuo6FSQERRPfnoSCskhjh1KeQ@mail.gmail.com>
Message-ID: <890456524e2df548ba5d44752513a62c@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 2020-03-30 23:54, Doug Anderson wrote:
> Hi,
> 
> On Sat, Mar 28, 2020 at 12:35 AM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> > Of course the fact that in practice we'll *always* see the warning
>> > because there's no way to tear down the default DMA domains, and even
>> > if all devices *have* been nicely quiesced there's no way to tell, is
>> > certainly less than ideal. Like I say, it's not entirely clear-cut
>> > either way...
>> >
>> 
>> Thanks for these examples, good to know these scenarios in case we 
>> come
>> across these.
>> However, if we see these error/warning messages appear everytime then
>> what will be
>> the credibility of these messages? We will just ignore these messages
>> when
>> these issues you mention actually appears because we see them 
>> everytime
>> on
>> reboot or shutdown.
> 
> I would agree that if these messages are expected to be seen every
> time, there's no way to fix them, and they're not indicative of any
> problem then something should be done.  Seeing something printed at
> "dev_error" level with an exclamation point (!) at the end makes me
> feel like this is something that needs immediate action on my part.
> 
> If we really can't do better but feel that the messages need to be
> there, at least make them dev_info and less scary like:
> 
>   arm-smmu 15000000.iommu: turning off; DMA should be quiesced before 
> now
> 
> ...that would still give you a hint in the logs that if you saw a DMA
> transaction after the message that it was a bug but also wouldn't
> sound scary to someone who wasn't seeing any other problems.
> 

We can do this if Robin is OK?

-Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
