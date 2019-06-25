Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8ED95508F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2019 15:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729096AbfFYNjb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 09:39:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:46940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727406AbfFYNjb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 09:39:31 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B8A042133F;
        Tue, 25 Jun 2019 13:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561469970;
        bh=3muJjXWRycZv3Y/JtYQgT9Oc/WMSWIxkkMKqCMNX5RI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hiUdQSgP3fzkh9uQINSrEWWxdCpnUcZOSUINFQIWpnmazGlfb+eIkvMic2wa1obwq
         MOYLBIk3dgpziyQsVjbfSEPXsH6+/BUjsU3tczSc0CNj21IRV5UqpLgjpqguUV3p1v
         BvJY98/KPveTSOl42McksrdQHTu0QRNQQWXrFSnU=
Date:   Tue, 25 Jun 2019 14:39:25 +0100
From:   Will Deacon <will@kernel.org>
To:     Vivek Gautam <vivek.gautam@codeaurora.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Will Deacon <will.deacon@arm.com>,
        open list <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Brown <david.brown@linaro.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        robh+dt <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v3 3/4] iommu/arm-smmu: Add support to handle Qcom's
 wait-for-safe logic
Message-ID: <20190625133924.fqq3y7p3i3fqem5p@willie-the-truck>
References: <20190612071554.13573-1-vivek.gautam@codeaurora.org>
 <20190612071554.13573-4-vivek.gautam@codeaurora.org>
 <20190614040520.GK22737@tuxbook-pro>
 <3e1f5e03-6448-8730-056d-fc47bdd71b3f@codeaurora.org>
 <20190618175218.GH4270@fuggles.cambridge.arm.com>
 <CAFp+6iEynLa=Jt_-oAwt4zmzxzhEXtWNCmghz6rFzcpQVGwrMg@mail.gmail.com>
 <20190624170348.7dncuc5qezqeyvq2@willie-the-truck>
 <CAFp+6iF0TQtAy2JFXk6zjX5GpjeLFesqPZV6ezbDXmc85yvMEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFp+6iF0TQtAy2JFXk6zjX5GpjeLFesqPZV6ezbDXmc85yvMEA@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 25, 2019 at 12:34:56PM +0530, Vivek Gautam wrote:
> On Mon, Jun 24, 2019 at 10:33 PM Will Deacon <will@kernel.org> wrote:
> > Instead, I think this needs to be part of a separate file that is maintained
> > by you, which follows on from the work that Krishna is doing for nvidia
> > built on top of Robin's prototype patches:
> >
> > http://linux-arm.org/git?p=linux-rm.git;a=shortlog;h=refs/heads/iommu/smmu-impl
> 
> Looking at this branch quickly, it seem there can be separate implementation
> level configuration file that can be added.
> But will this also handle separate page table ops when required in future.

Nothing's set in stone, but having the implementation-specific code
constrain the page-table format (especially wrt quirks) sounds reasonable to
me. I'm currently waiting for Krishna to respin the nvidia changes [1] on
top of this so that we can see how well the abstractions are holding up.

I certainly won't merge the stuff until we have a user.

Will

[1] https://lkml.kernel.org/r/1543887414-18209-1-git-send-email-vdumpa@nvidia.com
