Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB28334BBB6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Mar 2021 10:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbhC1Iog (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Mar 2021 04:44:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230517AbhC1IoT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Mar 2021 04:44:19 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FFDCC061762
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Mar 2021 01:44:19 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id o2so2957240plg.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Mar 2021 01:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=k7DNSySKD5MKuy3jeurqGQcSktq1fou282VSwzZ8yXY=;
        b=F9Fe+2sbDcz+y67SRvhYF8tAfkw8a4tPP/BbTmR2Er/yods7GIBLL5dev9nqJAKNS4
         SzAyCQGGP1cYjFnN3z8xbEd03N4ekxEePFrqYVmZJAahxA0Tkt8il+4Ba5gHWu1FMdLJ
         hBEP49TLND8E3j6/GnKsUFmu6utq0O8U1ADCqUY75rYBjxDtAxrtsaL9bljIeFfVrHZP
         hcJpbp5bdAf7Ck1diUNjb+waaWhajrVt6vWl0zWZpUNsMrzT8PP/GoG1lOus3oiN4QVD
         Z3DOsTTxVAS2K/RCgY1qEoHrUt8vA0Q1CRvj3OR6kJ1ZpCVcZuaJ7a3DfN/H3POOiitJ
         YxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=k7DNSySKD5MKuy3jeurqGQcSktq1fou282VSwzZ8yXY=;
        b=b9Sl/84yVaMV+TUlJzbHBirhEaZL+fXioONDix5Vm9rF1txwb4TftrgibNEzhdbR8m
         vVStdB3txsXOqLSRGF+XEvwth/w5HY9lOzMONY/S6RPKDT3rmlbS6ZnVXGYfAonVIk0K
         2j4rIV9JfamY5k8jsJq5BiS3ryu3dZKhAGQAekqLFlqkMjWXOhRjvW4zPxVgnHh9NrK7
         9PztOMW5jeSqzammErI3bf0lWz3otrfi1zac2a8CjJMzpkgDllXcCt7NEVgRQlyBTZoj
         6//6PgbjRytkEX8qQCn4peD38uI9TJfsk/V6XKyj4rMP8EGwSkvpsQvzuv9PZHCMaRaj
         gSvw==
X-Gm-Message-State: AOAM533fxBzq7+CoH6OT/ZJsZfldOd1NY/eArmGXEyR2oEt/AbAQXgv6
        JECwkobYGl1JljXLvBstATBihw==
X-Google-Smtp-Source: ABdhPJzwa0oOhI412a1utddSj0DLOdkQyPGRS6iRZS3TRG5DNG8kyW3RqCdnd1ZNFtpkpAClx6woeg==
X-Received: by 2002:a17:902:9a45:b029:e6:1444:5287 with SMTP id x5-20020a1709029a45b02900e614445287mr23440562plv.54.1616921059143;
        Sun, 28 Mar 2021 01:44:19 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id v19sm14700193pfc.183.2021.03.28.01.44.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Mar 2021 01:44:18 -0700 (PDT)
Date:   Sun, 28 Mar 2021 16:44:12 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Will Deacon <will@kernel.org>, lorenzo.pieralisi@arm.com,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: create qcom_smmu_impl for ACPI boot
Message-ID: <20210328084411.GB24152@dragon>
References: <20210301074021.20059-1-shawn.guo@linaro.org>
 <20210325145914.GC15172@willie-the-truck>
 <20210325170256.GA904837@yoga>
 <e7385b23-a91b-dd8d-5e9a-3505a18a2249@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7385b23-a91b-dd8d-5e9a-3505a18a2249@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 25, 2021 at 05:07:52PM +0000, Robin Murphy wrote:
> On 2021-03-25 17:02, Bjorn Andersson wrote:
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
> > > >   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 33 ++++++++++++++++++++++
> > > >   1 file changed, 33 insertions(+)
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
> 
> To do something broadly similar to identify HiSilicon's SMMU PMCG
> implementation, we use acpi_match_platform_list() - could we do the same for
> this?

Thanks for the suggestion, Robin!  Yes, acpi_platform_list is useful
for our problem as well.  But we will need multiple entries even for
a single Snapdragon SoC.  For example, both Lenovo Flex 5G and Microsoft
Surface Pro X are powered by Snapdragon SC8180X, but their IORT tables
have different fields that acpi_match_platform_list() is looking at.
If this is not a problem, yeah, acpi_platform_list is a better way out,
and I will start updating the patch.

Shawn


* Lenovo Flex 5G
[000h 0000   4]                    Signature : "IORT"    [IO Remapping Table]
[004h 0004   4]                 Table Length : 00001943
[008h 0008   1]                     Revision : 00
[009h 0009   1]                     Checksum : DA
[00Ah 0010   6]                       Oem ID : "LENOVO"
[010h 0016   8]                 Oem Table ID : "CB-01   "
[018h 0024   4]                 Oem Revision : 00008180
[01Ch 0028   4]              Asl Compiler ID : "QCOM"
[020h 0032   4]        Asl Compiler Revision : 00000001

* Microsoft Surface Pro X
[000h 0000   4]                    Signature : "IORT"    [IO Remapping Table]
[004h 0004   4]                 Table Length : 0000169C
[008h 0008   1]                     Revision : 00
[009h 0009   1]                     Checksum : 3A
[00Ah 0010   6]                       Oem ID : "QCOM  "
[010h 0016   8]                 Oem Table ID : "QCOMEDK2"
[018h 0024   4]                 Oem Revision : 00008180
[01Ch 0028   4]              Asl Compiler ID : "QCOM"
[020h 0032   4]        Asl Compiler Revision : 00000001
