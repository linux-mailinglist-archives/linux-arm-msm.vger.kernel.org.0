Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C056B349789
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 18:04:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbhCYRDc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 13:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbhCYRDA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 13:03:00 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E6E3C06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 10:03:00 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id x207so2846288oif.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 10:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wWPXhqdD+6tI05MivtckeKrepPnDQMjU+zHRBIZrqSA=;
        b=oJrDWezcCTqUggAw7El3CjJwi79kw9zFvmH8x2oL31DoKNlHN0pF283NKszWNG0L76
         WdyS3hYlPlmatNw4fhFPVPbpXh3EtPdKPnvTh+giO/vsUJILOQKQOhR+crlh8qhQlSum
         ElIAzvaGKr6uhaVRMkVDzpsFKez6LfbAvqhA5A3hC4uyD+qUTYaFSbbpLbfrp41FFGKd
         d9BkngB4hhqh+KGE9DqmssDd7YDudsb7skxDLemFctvlEVRPDwxrKnUJGD1WLsdqSOZQ
         UCi5cQ3iNxzrryljH19rn6AgYPg+1pWfuBr7NOyAoOpnyTjOQsCftogJ9lDZr6z/ClNQ
         xIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wWPXhqdD+6tI05MivtckeKrepPnDQMjU+zHRBIZrqSA=;
        b=NIRtSlb4A8aQu8bBlPGmrgLIawm4Hacxpm5CI311QiWV74EpIE956B7OxHEcqFTRvy
         CxMklHnMMeyakE/OTlUgJmuTrqLbp/9LTRyBbfHDhNqDXWcjyHU+b3mkm3SGujkAY7so
         jNxicrLwuq2qFI/eryUtzjnoJ8rg7GH59dutkxVYIwHNmeDKddVCNYaoPyPMoTo8z9bZ
         4TQsdJ203y6Uq3YwZv/+n/9lwlo0i3QYSWM1GRDRM9Ji+V5Bx4h+bki4Y+n2eSrqqsaW
         zLAJgGplwTdFEBKx2RVt2/uEa0knsL0ZfZlhaTjamjyaAqCajQCjVn8WnjY2gPKQVuNE
         sHnA==
X-Gm-Message-State: AOAM533E/ojnhw5Ioo4QY6pVSYetOvfGIiDYKbutOZdWuwEKO4U1m5mx
        HEpxPOlN3yDNHTWqqGHlpznnow==
X-Google-Smtp-Source: ABdhPJwWxU1ru7SaSik7Cy8ypCPiAxwuwNtXQ1sFRK+6ioXk6PX6XiolViLhiYWs6vXC7RNk5StewA==
X-Received: by 2002:a54:4494:: with SMTP id v20mr6853153oiv.147.1616691779417;
        Thu, 25 Mar 2021 10:02:59 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id d26sm1340852oos.32.2021.03.25.10.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 10:02:59 -0700 (PDT)
Date:   Thu, 25 Mar 2021 12:02:56 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Will Deacon <will@kernel.org>
Cc:     Shawn Guo <shawn.guo@linaro.org>, lorenzo.pieralisi@arm.com,
        Robin Murphy <robin.murphy@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: create qcom_smmu_impl for ACPI boot
Message-ID: <20210325170256.GA904837@yoga>
References: <20210301074021.20059-1-shawn.guo@linaro.org>
 <20210325145914.GC15172@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210325145914.GC15172@willie-the-truck>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 25 Mar 09:59 CDT 2021, Will Deacon wrote:

> [+ Lorenzo]
> 
> On Mon, Mar 01, 2021 at 03:40:21PM +0800, Shawn Guo wrote:
> > Though qcom_adreno_smmu_impl is not used by ACPI boot right now,
> > qcom_smmu_impl is already required at least to boot up Lenovo Flex 5G
> > laptop.  Let's check asl_compiler_id in IORT header to ensure we are
> > running a QCOM SMMU and create qcom_smmu_impl for it.
> > 
> > !np is used to check ACPI boot, because fwnode of SMMU device is
> > a static allocation and thus has_acpi_companion() doesn't work here.
> > 
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > ---
> >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 33 ++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> 
> I don't know what a "asl_compiler_id" is, but it doesn't sound like it
> has an awful lot to do with the SMMU.
> 

I would prefer that we somehow relate this to the particular board,
rather than all Qualcomm-related ACPI tables. E.g. by relying on the
SMMU devices having a _HID of QCOM0409.

Shawn, any reason for this wouldn't be possible?

> Lorenzo -- any idea what we should be doing here instead? Probably not
> using ACPI?
> 

The 8cx (aka sc8180x) platform comes with Qualcomm's usual SMMU
stream-mapping quirks and this is one of the patches needed to bring
enough ACPI support to run the Debian installer that Shawn has been
working on. After the installer we currently only boot this using DT -
which already enables the quirk.

Regards,
Bjorn
