Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED9821E087
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2020 21:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgGMTNR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 15:13:17 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:44958 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726339AbgGMTNR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 15:13:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594667596; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=8fx4I85o6Wf3cmctscltFFb3YOaN1s6FZjMVuu5Dadc=; b=N42EySIt3fHOt/mbBLGEhUJeNOCDG6nOAnZgiNXV+FUHA2F9gpmKKOz0pu/s1LCoTXcCgvPd
 R+xJa2XwuyVTCS1BC/vpsJ0MdTwGij08AQ11XXjA+rLrKQ8t5DDMxNrGyq8xZbiguE901RW8
 NrqoRRdh5+yYF/bWEcD1pU9kC+s=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f0cb24b75eeb235f6b98609 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 13 Jul 2020 19:13:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 493AEC43391; Mon, 13 Jul 2020 19:13:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C4B6FC433C8;
        Mon, 13 Jul 2020 19:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C4B6FC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 13 Jul 2020 13:13:10 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Will Deacon <will@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        freedreno@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Freedreno] [PATCH] iommu/arm-smmu: Add a init_context_bank
 implementation hook
Message-ID: <20200713191310.GD3815@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Will Deacon <will@kernel.org>,
        linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        freedreno@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20200611223656.4724-1-jcrouse@codeaurora.org>
 <20200713151123.GB3072@willie-the-truck>
 <20200713170032.GH21059@jcrouse1-lnx.qualcomm.com>
 <20200713190331.GA3444@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200713190331.GA3444@willie-the-truck>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 13, 2020 at 08:03:32PM +0100, Will Deacon wrote:
> On Mon, Jul 13, 2020 at 11:00:32AM -0600, Jordan Crouse wrote:
> > On Mon, Jul 13, 2020 at 04:11:23PM +0100, Will Deacon wrote:
> > > On Thu, Jun 11, 2020 at 04:36:56PM -0600, Jordan Crouse wrote:
> > > > Add a new implementation hook to allow the implementation specific code
> > > > to tweek the context bank configuration just before it gets written.
> > > > The first user will be the Adreno GPU implementation to turn on
> > > > SCTLR.HUPCF to ensure that a page fault doesn't terminating pending
> > > > transactions. Doing so could hang the GPU if one of the terminated
> > > > transactions is a CP read.
> > > > 
> > > > This depends on the arm-smmu adreno SMMU implementation [1].
> > > > 
> > > > [1] https://patchwork.kernel.org/patch/11600943/
> > > > 
> > > > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > > > ---
> > > > 
> > > >  drivers/iommu/arm-smmu-qcom.c | 13 +++++++++++++
> > > >  drivers/iommu/arm-smmu.c      | 28 +++++++++++++---------------
> > > >  drivers/iommu/arm-smmu.h      | 11 +++++++++++
> > > >  3 files changed, 37 insertions(+), 15 deletions(-)
> > > 
> > > This looks straightforward enough, but I don't want to merge this without
> > > a user and Sai's series has open questions afaict.
> > 
> > Not sure what you mean by a user in this context?
> > Are you referring to https://patchwork.kernel.org/patch/11628541/?
> 
> Right, this post was just a single patch in isolation, whereas it was
> reposted over at:
> 
> https://lore.kernel.org/r/cdcc6a1c95a84e774790389dc8b3b7feeee490dc.1593344119.git.saiprakash.ranjan@codeaurora.org
> 
> so I'll ignore this one. Sorry, I'm just really struggling to keep track
> of what is targetting 5.9, and I don't have tonnes of time to sift through
> the backlog of duplicate postings :(

Yeah, that is our fault. There are too many cooks in the kitchen.

We need to pick either system cache or split pagetable and serialize
the other on top of it to get the impl code going and then build from there. 
This particular patch can happily hang out in the background until the rest is
resolved.

Jordan

> Will
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
