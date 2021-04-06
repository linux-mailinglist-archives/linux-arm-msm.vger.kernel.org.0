Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E54E8355917
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 18:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346249AbhDFQXV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 12:23:21 -0400
Received: from foss.arm.com ([217.140.110.172]:45526 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346212AbhDFQXU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 12:23:20 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CCE01063;
        Tue,  6 Apr 2021 09:23:12 -0700 (PDT)
Received: from lpieralisi (e121166-lin.cambridge.arm.com [10.1.196.255])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2813C3F792;
        Tue,  6 Apr 2021 09:23:11 -0700 (PDT)
Date:   Tue, 6 Apr 2021 17:23:05 +0100
From:   Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Will Deacon <will@kernel.org>, Shawn Guo <shawn.guo@linaro.org>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: create qcom_smmu_impl for ACPI boot
Message-ID: <20210406162305.GA28529@lpieralisi>
References: <20210301074021.20059-1-shawn.guo@linaro.org>
 <20210325145914.GC15172@willie-the-truck>
 <20210325170256.GA904837@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210325170256.GA904837@yoga>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 25, 2021 at 12:02:56PM -0500, Bjorn Andersson wrote:
> On Thu 25 Mar 09:59 CDT 2021, Will Deacon wrote:
> 
> > [+ Lorenzo]
> > 
> > On Mon, Mar 01, 2021 at 03:40:21PM +0800, Shawn Guo wrote:
> > > Though qcom_adreno_smmu_impl is not used by ACPI boot right now,
> > > qcom_smmu_impl is already required at least to boot up Lenovo Flex 5G
> > > laptop.  Let's check asl_compiler_id in IORT header to ensure we are
> > > running a QCOM SMMU and create qcom_smmu_impl for it.
> > > 
> > > !np is used to check ACPI boot, because fwnode of SMMU device is
> > > a static allocation and thus has_acpi_companion() doesn't work here.
> > > 
> > > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > > ---
> > >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 33 ++++++++++++++++++++++
> > >  1 file changed, 33 insertions(+)
> > 
> > I don't know what a "asl_compiler_id" is, but it doesn't sound like it
> > has an awful lot to do with the SMMU.
> > 
> 
> I would prefer that we somehow relate this to the particular board,
> rather than all Qualcomm-related ACPI tables. E.g. by relying on the
> SMMU devices having a _HID of QCOM0409.
> 
> Shawn, any reason for this wouldn't be possible?
> 
> > Lorenzo -- any idea what we should be doing here instead? Probably not
> > using ACPI?
> > 
> 
> The 8cx (aka sc8180x) platform comes with Qualcomm's usual SMMU
> stream-mapping quirks and this is one of the patches needed to bring
> enough ACPI support to run the Debian installer that Shawn has been
> working on. After the installer we currently only boot this using DT -
> which already enables the quirk.

I am not sure I follow - can you explain please why this patch (and so
the QCOM SMMU) is actually needed ? I don't get why getting the SMMU
up and running with ACPI is mandatory to complete the process you describe
above (but I am not sure I understood it entirely either - apologies).

Thanks,
Lorenzo
