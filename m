Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF50E1A688D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 17:13:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730939AbgDMPNA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 11:13:00 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:32745 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729713AbgDMPM7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 11:12:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586790778; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=LU4lIIs6P7WbetJLktGFAgPFpHgnYydgpo5RLRCAr2Q=; b=g3Uyue8Lov9HQ9/4kGBiuon77t60p0UJ63lcgdJPxuc23IzoUzCdxAy1exRXVtQ7lXqwZhiX
 IXNbNHcKI/gtvCuIkks6fXjhpXUtj3xn3Ic/5v4scat4mMdXCpMwg6YUTWROSYK2TTvbZoe6
 Msd3UWvIhdOPM+K31EOkUwREURw=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e94816e.7f147a93c810-smtp-out-n04;
 Mon, 13 Apr 2020 15:12:46 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 00BC2C43637; Mon, 13 Apr 2020 15:12:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0E460C433F2;
        Mon, 13 Apr 2020 15:12:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0E460C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 13 Apr 2020 09:12:42 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robdclark@gmail.com>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH 0/2] iommu/arm-smmu: Allow client devices to select
 direct mapping
Message-ID: <20200413151241.GB20818@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Matthias Kaehlcke <mka@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Clark <robdclark@gmail.com>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Tomasz Figa <tfiga@chromium.org>
References: <cover.1579692800.git.saiprakash.ranjan@codeaurora.org>
 <7761534cdb4f1891d993e73931894a63@codeaurora.org>
 <20200409233124.GW199755@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409233124.GW199755@google.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 09, 2020 at 04:31:24PM -0700, Matthias Kaehlcke wrote:
> On Tue, Feb 04, 2020 at 11:12:17PM +0530, Sai Prakash Ranjan wrote:
> > Hello Robin, Will
> > 
> > On 2020-01-22 17:18, Sai Prakash Ranjan wrote:
> > > This series allows drm devices to set a default identity
> > > mapping using iommu_request_dm_for_dev(). First patch is
> > > a cleanup to support other SoCs to call into QCOM specific
> > > implementation and preparation for second patch.
> > > Second patch sets the default identity domain for drm devices.
> > > 
> > > Jordan Crouse (1):
> > >   iommu/arm-smmu: Allow client devices to select direct mapping
> > > 
> > > Sai Prakash Ranjan (1):
> > >   iommu: arm-smmu-impl: Convert to a generic reset implementation
> > > 
> > >  drivers/iommu/arm-smmu-impl.c |  8 +++--
> > >  drivers/iommu/arm-smmu-qcom.c | 55 +++++++++++++++++++++++++++++++++--
> > >  drivers/iommu/arm-smmu.c      |  3 ++
> > >  drivers/iommu/arm-smmu.h      |  5 ++++
> > >  4 files changed, 65 insertions(+), 6 deletions(-)
> > 
> > Any review comments?
> 
> Ping
> 
> What is the status of this series, is it ready to land or are any changes
> needed?
> 
> Thanks
> 
> Matthias

I think this is up in the air following the changes that Joerg suggested:
https://lists.linuxfoundation.org/pipermail/iommu/2020-April/043017.html

Jordan
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
