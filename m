Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53B2B2A3138
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Nov 2020 18:18:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbgKBRRA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 12:17:00 -0500
Received: from z5.mailgun.us ([104.130.96.5]:42837 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727798AbgKBRQ7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 12:16:59 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604337419; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: To: From: Date: Sender;
 bh=vj+zpfmdt/UrOyrf9DlMG0DgkyLSy+JL1jA0FBPdMew=; b=KDHjhlar1rr29LNOLB9sPuprmCV8tdJUtRWV8Z69HVPi3RkEvlz2gTXQX3xSXczRSIdf9/OW
 SmfO18W9mc330GHQ2I5m2ZqCWVfLBDarxoKWPDuqk8C5kN5QxPr4T7ehNrgOKCyZtXrneJKI
 bQegUyUuln/8/mENqACH3wD1FHg=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5fa03ef19f889442bba5d1a0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 02 Nov 2020 17:16:33
 GMT
Sender: jcrouse=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7F6D8C433AF; Mon,  2 Nov 2020 17:16:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C958BC433FE;
        Mon,  2 Nov 2020 17:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C958BC433FE
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 2 Nov 2020 10:16:26 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 0/4] iommu/arm-smmu: Add adreno-smmu implementation
 and bindings
Message-ID: <20201102171626.GA5338@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Will Deacon <will@kernel.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joerg Roedel <joro@8bytes.org>, Krishna Reddy <vdumpa@nvidia.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20201027223408.469893-1-jcrouse@codeaurora.org>
 <20201029172607.GA30745@willie-the-truck>
 <20201102170823.GA1032@jcrouse1-lnx.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201102170823.GA1032@jcrouse1-lnx.qualcomm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 02, 2020 at 10:08:23AM -0700, Jordan Crouse wrote:
> On Thu, Oct 29, 2020 at 05:26:08PM +0000, Will Deacon wrote:
> > On Tue, Oct 27, 2020 at 04:34:04PM -0600, Jordan Crouse wrote:
> > > This short series adds support for the adreno-smmu implementation of the
> > > arm-smmu driver and the device-tree bindings to turn on the implementation
> > > for the sm845 and sc7180 GPUs. These changes are the last ones needed to enable
> > > per-instance pagetables in the drm/msm driver.
> > > 
> > > No deltas in this patchset since the last go-around for 5.10 [1].
> > > 
> > > [1] https://patchwork.freedesktop.org/series/81393/
> > > 
> > > Jordan Crouse (3):
> > >   iommu/arm-smmu-qcom: Add implementation for the adreno GPU SMMU
> > >   dt-bindings: arm-smmu: Add compatible string for Adreno GPU SMMU
> > >   arm: dts: qcom: sm845: Set the compatible string for the GPU SMMU
> > > 
> > > Rob Clark (1):
> > >   iommu/arm-smmu: Add a way for implementations to influence SCTLR
> > 
> > FYI: this patch (patch 4/4) doesn't seem to have made it anywhere (I don't
> > have it, and neither does the archive).
> > 
> > Will
> 
> Patch 4/4 was the bindings for sdm845 and I didn't explicitly add IOMMU to the
> CC list and so patman did what patman does.
> 
> I'll resend.

Stack re-sent with you and Robin and the list on the CC for the bindings. I
expect that Bjorn can pick up the bindings patches once the adreno-smmu patch is
accepted but it is good for everybody to get the full picture.

Jordan

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
