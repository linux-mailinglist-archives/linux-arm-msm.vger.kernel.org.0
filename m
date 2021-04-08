Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AEAF357A09
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 04:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbhDHCFz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 22:05:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbhDHCFy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 22:05:54 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3452C061760
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Apr 2021 19:05:43 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id y19-20020a0568301d93b02901b9f88a238eso770102oti.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Apr 2021 19:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0nTD4LqkJcn0d4EJFpBtXSjxPblz80VG/UhFIyjAOyY=;
        b=cVg4P7rERdtZB5ft2q5xcZRWhUti+GfuOm7c/gtNmQUyGH8FUQLaFulgvrmcuI5qzT
         qT5bOP8k5K9cK97wdN0aMQSBuhun0Mn4Zm4vcpzNNd5xG7YUriGVwxTXOGdL+oek0EHV
         oAYgnXcwXdwJGDot2xN0flXz0xfQdTPPrWgYQVyqLc0CAr5xBTZXSFfCmVpjKvVuRdvv
         c3VBVXNiV3u1y9hvwTHW5NtJMtAYy00JAUvHpXxMHgYFe5ZxFzYHztJrDAvOVtt1cF8z
         RdTY7Bvc9DjXolBPyYVvpxvCu9UTs3is78lfUGCqszRbNm+Q/n5SG78o7G5VF42Xfj05
         ALpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0nTD4LqkJcn0d4EJFpBtXSjxPblz80VG/UhFIyjAOyY=;
        b=dgON/v0Dlyc0aSRdcJLrBRe5SgcghNoqJrm1lisj7dHeMh/0PyL+84p04EYb0vaUh9
         KarSeWeHO875MNjg5OFhXxOweiCjN2lpp/eSEy1h48gaqMGfLj4ZtMKtPYa2nHENmfd0
         p0HZEfiwAkNL1wssURY41PX79PhX4XkjrxZ3XXYUBWtJCawShX9pLvmHeJY30/0wAoQH
         Ch7aUIOEa+iGdYXEqKKGhzs/RvekpxNMLcK6fpU/WLutnb15Ky2foG8Ck/noZSOsRseG
         nCPPNZwnruNV5QMP6mC0jYj6oDK63KmY1iFzQgtU3hzKar6K7M5sY/ybP1RaY96a7LHK
         Pmqg==
X-Gm-Message-State: AOAM5325whWiKZBerXr7r9y/R8l10mkLfPZN2rexvsrMhnDROVlpdYEv
        ygm0K1s8P8Tz0gpo3+Wq+lJ/bq0QpxOC6w==
X-Google-Smtp-Source: ABdhPJxM0KRzgxd+ioXsTwe/TeU2C/1t0iR/R2r/W9oqsy9dAQPBIrbEtI3G6r5KOAamXXXSIXeCPQ==
X-Received: by 2002:a9d:6e8d:: with SMTP id a13mr5327124otr.287.1617847542945;
        Wed, 07 Apr 2021 19:05:42 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p22sm6099769otf.25.2021.04.07.19.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 19:05:42 -0700 (PDT)
Date:   Wed, 7 Apr 2021 21:05:40 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Will Deacon <will@kernel.org>, Shawn Guo <shawn.guo@linaro.org>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: create qcom_smmu_impl for ACPI boot
Message-ID: <20210408020540.GK904837@yoga>
References: <20210301074021.20059-1-shawn.guo@linaro.org>
 <20210325145914.GC15172@willie-the-truck>
 <20210325170256.GA904837@yoga>
 <20210406162305.GA28529@lpieralisi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210406162305.GA28529@lpieralisi>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 06 Apr 11:23 CDT 2021, Lorenzo Pieralisi wrote:

> On Thu, Mar 25, 2021 at 12:02:56PM -0500, Bjorn Andersson wrote:
> > On Thu 25 Mar 09:59 CDT 2021, Will Deacon wrote:
> > 
> > > [+ Lorenzo]
> > > 
> > > On Mon, Mar 01, 2021 at 03:40:21PM +0800, Shawn Guo wrote:
> > > > Though qcom_adreno_smmu_impl is not used by ACPI boot right now,
> > > > qcom_smmu_impl is already required at least to boot up Lenovo Flex 5G
> > > > laptop.  Let's check asl_compiler_id in IORT header to ensure we are
> > > > running a QCOM SMMU and create qcom_smmu_impl for it.
> > > > 
> > > > !np is used to check ACPI boot, because fwnode of SMMU device is
> > > > a static allocation and thus has_acpi_companion() doesn't work here.
> > > > 
> > > > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > > > ---
> > > >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 33 ++++++++++++++++++++++
> > > >  1 file changed, 33 insertions(+)
> > > 
> > > I don't know what a "asl_compiler_id" is, but it doesn't sound like it
> > > has an awful lot to do with the SMMU.
> > > 
> > 
> > I would prefer that we somehow relate this to the particular board,
> > rather than all Qualcomm-related ACPI tables. E.g. by relying on the
> > SMMU devices having a _HID of QCOM0409.
> > 
> > Shawn, any reason for this wouldn't be possible?
> > 
> > > Lorenzo -- any idea what we should be doing here instead? Probably not
> > > using ACPI?
> > > 
> > 
> > The 8cx (aka sc8180x) platform comes with Qualcomm's usual SMMU
> > stream-mapping quirks and this is one of the patches needed to bring
> > enough ACPI support to run the Debian installer that Shawn has been
> > working on. After the installer we currently only boot this using DT -
> > which already enables the quirk.
> 
> I am not sure I follow - can you explain please why this patch (and so
> the QCOM SMMU) is actually needed ? I don't get why getting the SMMU
> up and running with ACPI is mandatory to complete the process you describe
> above (but I am not sure I understood it entirely either - apologies).
> 

The bootloader sets up stream mappings for things such as storage and
display before jumping to Linux and as things are implemented today the
arm-smmu driver is probed.

The problem that arises, which is the reason for this patch, is that
when the arm-smmu driver resets the SMMU it wipes the stream mappings
and the next time the display hardware tries to scan out the EFIFB a
fault is triggered - of the type that happens to trap into one of the
higher security levels - which results in the device rebooting.

The handling of this is implemented by  07a7f2caaa5a
("iommu/arm-smmu-qcom: Read back stream mappings") and f9081b8ff593
("iommu/arm-smmu-qcom: Implement S2CR quirk"), which are activated based
on DT compatibles today.

What Shawn is looking for is a way to enable this quirk for the ACPI
case as well.

Regards,
Bjorn
