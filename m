Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F5C757CB4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2019 09:05:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbfF0HFS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jun 2019 03:05:18 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:38128 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbfF0HFS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jun 2019 03:05:18 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6253460DAD; Thu, 27 Jun 2019 07:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561619117;
        bh=4sMYL/vEnFR3JJT1yrTXKeeZBriSZ99gcmBVQPeanvA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ou36ma9pIfK8dHNclgs1noT/MtX+sA0jszvw2qqktBI0k/jiXntFE9wnYEXwFXhCz
         eV/0NdpCw1OP/InYN6MODkWArQCj05X6ScVlHBn1eTpLiS3WIrm/cjYJjoR5neJevQ
         wLMRqjxMU7DZOsP7gPkKNAuzGhZjgi3cRU+llTmI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 660F160A97;
        Thu, 27 Jun 2019 07:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561619116;
        bh=4sMYL/vEnFR3JJT1yrTXKeeZBriSZ99gcmBVQPeanvA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=T5JUl9dOKs584jzJCP5evvyeb+cbHKsbUC9uA/y/6lVmoqUfm2nICNb2OL0x5Hv5D
         LDrkfdjzofe4VU1Rd71dSZtTXQ+tmoP+ylLpOelUKnfBOWhHQL4sAcnh7qRFrAYseH
         GHui+PNF0pjVTEJqsQ5j/lR/pRM8NPkFEznQcV3M=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 660F160A97
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
Received: by mail-ed1-f47.google.com with SMTP id k21so6016284edq.3;
        Thu, 27 Jun 2019 00:05:16 -0700 (PDT)
X-Gm-Message-State: APjAAAVT4wSofyO8o16Bfw+zTCFnyv9jjpksaMsDXAMUW8U8aZGdR2sb
        Os6h9VOL/faa2T9Mc73J6piqq6PDcA5LgFb35Ok=
X-Google-Smtp-Source: APXvYqy6/T0+BAERf4oMw5abJsW76giuCjeiXeBDMRRBEFACHq6VcztnGhX1IL9uJkMy8ums6cUkmiXVqPScbQRjh1Y=
X-Received: by 2002:a17:906:3c1:: with SMTP id c1mr1624686eja.221.1561619115146;
 Thu, 27 Jun 2019 00:05:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190612071554.13573-1-vivek.gautam@codeaurora.org>
 <20190612071554.13573-4-vivek.gautam@codeaurora.org> <20190614040520.GK22737@tuxbook-pro>
 <3e1f5e03-6448-8730-056d-fc47bdd71b3f@codeaurora.org> <20190618175218.GH4270@fuggles.cambridge.arm.com>
 <CAFp+6iEynLa=Jt_-oAwt4zmzxzhEXtWNCmghz6rFzcpQVGwrMg@mail.gmail.com>
 <20190624170348.7dncuc5qezqeyvq2@willie-the-truck> <CAFp+6iF0TQtAy2JFXk6zjX5GpjeLFesqPZV6ezbDXmc85yvMEA@mail.gmail.com>
 <20190625133924.fqq3y7p3i3fqem5p@willie-the-truck> <CAFp+6iH-KzX7x1j8AAuKJcOP6v=fyP-yLvaeeE_Ly3oueu_ngg@mail.gmail.com>
 <20190626144844.key3n6ueb6skgkp4@willie-the-truck>
In-Reply-To: <20190626144844.key3n6ueb6skgkp4@willie-the-truck>
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
Date:   Thu, 27 Jun 2019 12:35:02 +0530
X-Gmail-Original-Message-ID: <CAFp+6iGvUd6QhmEO0rSSXAZnYt3x_5G0HuGUJYZ203W1_ER+=w@mail.gmail.com>
Message-ID: <CAFp+6iGvUd6QhmEO0rSSXAZnYt3x_5G0HuGUJYZ203W1_ER+=w@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] iommu/arm-smmu: Add support to handle Qcom's
 wait-for-safe logic
To:     Will Deacon <will@kernel.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Will Deacon <will.deacon@arm.com>,
        open list <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Brown <david.brown@linaro.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        "robh+dt" <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 26, 2019 at 8:18 PM Will Deacon <will@kernel.org> wrote:
>
> On Wed, Jun 26, 2019 at 12:03:02PM +0530, Vivek Gautam wrote:
> > On Tue, Jun 25, 2019 at 7:09 PM Will Deacon <will@kernel.org> wrote:
> > >
> > > On Tue, Jun 25, 2019 at 12:34:56PM +0530, Vivek Gautam wrote:
> > > > On Mon, Jun 24, 2019 at 10:33 PM Will Deacon <will@kernel.org> wrote:
> > > > > Instead, I think this needs to be part of a separate file that is maintained
> > > > > by you, which follows on from the work that Krishna is doing for nvidia
> > > > > built on top of Robin's prototype patches:
> > > > >
> > > > > http://linux-arm.org/git?p=linux-rm.git;a=shortlog;h=refs/heads/iommu/smmu-impl
> > > >
> > > > Looking at this branch quickly, it seem there can be separate implementation
> > > > level configuration file that can be added.
> > > > But will this also handle separate page table ops when required in future.
> > >
> > > Nothing's set in stone, but having the implementation-specific code
> > > constrain the page-table format (especially wrt quirks) sounds reasonable to
> > > me. I'm currently waiting for Krishna to respin the nvidia changes [1] on
> > > top of this so that we can see how well the abstractions are holding up.
> >
> > Sure. Would you want me to try Robin's branch and take out the qualcomm
> > related stuff to its own implementation? Or, would you like me to respin this
> > series so that you can take it in to enable SDM845 boards such as, MTP
> > and dragonboard to have a sane build - debian, etc. so people benefit
> > out of it.
>
> I can't take this series without Acks on the firmware calling changes, and I
> plan to send my 5.3 patches to Joerg at the end of the week so they get some
> time in -next. In which case, I think it may be worth you having a play with
> the branch above so we can get a better idea of any additional smmu_impl hooks
> you may need.

Cool. I will play around with it and get something tangible and meaningful.

>
> > Qualcomm stuff is lying in qcom-smmu and arm-smmu and may take some
> > time to stub out the implementation related details.
>
> Not sure I follow you here. Are you talking about qcom_iommu.c?

That's right. The qcom_iommu.c solved a different issue of secure context bank
allocations, when Rob forked out this driver and reused some of the
arm-smmu.c stuff.

We will take a look at that once we start adding the qcom implementation.

Thanks
Vivek

>
> Will
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu



-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
