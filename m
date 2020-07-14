Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAE1E21E706
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 06:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725778AbgGNEiK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jul 2020 00:38:10 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:33790 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725890AbgGNEiJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jul 2020 00:38:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594701488; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=l+SKEtwEvXbX8Q/Z4ekeTlZzRX1TnFGS7mEIQl2l3LY=;
 b=JJc4eIz/5DLi/Y6Ic2ziXZAfojIDpH/bDMmgP6ppgd3kuKRdOcZ8QRkERq6Ci1U1VuaRUNrn
 ObXmaT51BTQ4pyLH4GUcD6tQorfaOyvppmv3aP7xG+SyjQ9v5qAKPtaCeq8n81+UiAGyxFeY
 1yEUPYxqX4+QqfzzsyQsLMdbSso=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5f0d36a61012768490091b28 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 14 Jul 2020 04:37:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 838F4C43391; Tue, 14 Jul 2020 04:37:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B5890C433C8;
        Tue, 14 Jul 2020 04:37:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 14 Jul 2020 10:07:56 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        freedreno@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Freedreno] [PATCH] iommu/arm-smmu: Add a init_context_bank
 implementation hook
In-Reply-To: <20200713191310.GD3815@jcrouse1-lnx.qualcomm.com>
References: <20200611223656.4724-1-jcrouse@codeaurora.org>
 <20200713151123.GB3072@willie-the-truck>
 <20200713170032.GH21059@jcrouse1-lnx.qualcomm.com>
 <20200713190331.GA3444@willie-the-truck>
 <20200713191310.GD3815@jcrouse1-lnx.qualcomm.com>
Message-ID: <928c0e7a22e9b193774b1e35fbe98762@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-07-14 00:43, Jordan Crouse wrote:
> On Mon, Jul 13, 2020 at 08:03:32PM +0100, Will Deacon wrote:
>> On Mon, Jul 13, 2020 at 11:00:32AM -0600, Jordan Crouse wrote:
>> > On Mon, Jul 13, 2020 at 04:11:23PM +0100, Will Deacon wrote:
>> > > On Thu, Jun 11, 2020 at 04:36:56PM -0600, Jordan Crouse wrote:
>> > > > Add a new implementation hook to allow the implementation specific code
>> > > > to tweek the context bank configuration just before it gets written.
>> > > > The first user will be the Adreno GPU implementation to turn on
>> > > > SCTLR.HUPCF to ensure that a page fault doesn't terminating pending
>> > > > transactions. Doing so could hang the GPU if one of the terminated
>> > > > transactions is a CP read.
>> > > >
>> > > > This depends on the arm-smmu adreno SMMU implementation [1].
>> > > >
>> > > > [1] https://patchwork.kernel.org/patch/11600943/
>> > > >
>> > > > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
>> > > > ---
>> > > >
>> > > >  drivers/iommu/arm-smmu-qcom.c | 13 +++++++++++++
>> > > >  drivers/iommu/arm-smmu.c      | 28 +++++++++++++---------------
>> > > >  drivers/iommu/arm-smmu.h      | 11 +++++++++++
>> > > >  3 files changed, 37 insertions(+), 15 deletions(-)
>> > >
>> > > This looks straightforward enough, but I don't want to merge this without
>> > > a user and Sai's series has open questions afaict.
>> >
>> > Not sure what you mean by a user in this context?
>> > Are you referring to https://patchwork.kernel.org/patch/11628541/?
>> 
>> Right, this post was just a single patch in isolation, whereas it was
>> reposted over at:
>> 
>> https://lore.kernel.org/r/cdcc6a1c95a84e774790389dc8b3b7feeee490dc.1593344119.git.saiprakash.ranjan@codeaurora.org
>> 
>> so I'll ignore this one. Sorry, I'm just really struggling to keep 
>> track
>> of what is targetting 5.9, and I don't have tonnes of time to sift 
>> through
>> the backlog of duplicate postings :(
> 
> Yeah, that is our fault. There are too many cooks in the kitchen.
> 
> We need to pick either system cache or split pagetable and serialize
> the other on top of it to get the impl code going and then build from 
> there.
> This particular patch can happily hang out in the background until the 
> rest is
> resolved.
> 

My bad, sorry. Let us get split pagetable support reviewed first, then I 
can post
system cache support on top of it. As jordan said, this patch can 
hibernate until
those get resolved.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
