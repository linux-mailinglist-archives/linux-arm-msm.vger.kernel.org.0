Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A9A534BBAE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Mar 2021 10:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbhC1ISh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Mar 2021 04:18:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbhC1ISM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Mar 2021 04:18:12 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E78A1C061762
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Mar 2021 01:18:11 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d8so2943004plh.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Mar 2021 01:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XLqk7J/e/Gq7rEEcPvaBEoFPtT3QJSySBP+HlLjgriQ=;
        b=c8El76MujHNF1Ic3rnwY8U1Jf6mSer+erGRSV9djkARGslPiOM6ESp3kUxK2No3wIx
         Uh5yw0bw1JYjy9BHLjk6fCm4PgehJwr8MVovfE+Oye/AmU6+/7ghaGE6tfzc03CI52jl
         JYpnwst4XXZuHltq+yU+BqMofJei/NrDtfnzzheAe+YocDU8xWAenJO8NEbSzvXf8QBh
         Ih8sZRlfpfwsP5nOBJYACL+CRzYBzMUkyWTv6M9a8ffQl9AHAti0GaFw8R6vL0cBDpku
         NS7X+CQ6CGXhoWD+xO2Kq3tBx7Vte9GPS4HrFkjUkDUbkHkHl6xrBP7ES8On0qNCZFsu
         vKVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XLqk7J/e/Gq7rEEcPvaBEoFPtT3QJSySBP+HlLjgriQ=;
        b=VmwwOdgnDzFfpwcz0VDNecDNJLBFhRmL975yCDVW3ZE4LakCc3Veqteet9HAauApfr
         Zndo9a6ANYYsTmi68BU+k7CtFxTgyEM/7MEMY+Z2hYh7Fv9saiG4i3b1ttKqoO4QKPwQ
         SvzaU4h6Hf6ZVlfbghSccU9XrpXuwG1v5/C8ZubMN7KBApw7nd8QRRiN3sqtBsXBkb2u
         MzHwuPnrRSNG83B5UieVUQavsTYj9h0IbUSvVg6oNnVI1NS/xhXes7qC8JEdIgvjF3oq
         bdscBs2KdvizEMuQkLkNJSTILFkvwGC58SQ2K62nWDkSJdT1b9h7SAhXdea8s0ZjE6L8
         T4wQ==
X-Gm-Message-State: AOAM530VYBJAXnBIRAxkfg/DLgMh5efIKIpcM+yvvYvBECmHfZ9MEbkI
        DXYRQa9ibIKOHk41y5I0JXoxUw==
X-Google-Smtp-Source: ABdhPJyoen3SCXQkQNHxcNqHE0qucHysVcs7+mhAJXv8A4V+fp9Sj6f6uUu8iXvYn2ArfGVwOc7clg==
X-Received: by 2002:a17:902:6903:b029:e5:e0e6:d950 with SMTP id j3-20020a1709026903b02900e5e0e6d950mr23478177plk.21.1616919491357;
        Sun, 28 Mar 2021 01:18:11 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id ge16sm12944587pjb.43.2021.03.28.01.18.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Mar 2021 01:18:10 -0700 (PDT)
Date:   Sun, 28 Mar 2021 16:18:05 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Will Deacon <will@kernel.org>, lorenzo.pieralisi@arm.com,
        Robin Murphy <robin.murphy@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: create qcom_smmu_impl for ACPI boot
Message-ID: <20210328081804.GA24152@dragon>
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

The arm-smmu driver is probing a device created from IORT table rather
DSDT, and there is no info like HID that can be found around the device.

Shawn
