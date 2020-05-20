Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 929ED1DB457
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 14:59:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbgETM7X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 May 2020 08:59:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:48504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726439AbgETM7X (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 May 2020 08:59:23 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 428642070A;
        Wed, 20 May 2020 12:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589979561;
        bh=UY6bhyA1qIT24OzeirfJ2m2V4bIa7vSuhBxipVcxHSg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PQv/vo1vuOh5BN49oSfeBhlvcbtDT/i2W10QY5VDIAdRGhoXfpN3/Z/QUeozn5SD+
         rzEi1mftpME8HSrsWYMdBHtO+ywFV0pA1oQallMrYtkq4UKSLTdC9feue1eJt4ywVs
         qENI/Bjv+xJ6dqkzZxsfk4v9OQqOwLRmWnay1Niw=
Date:   Wed, 20 May 2020 13:59:17 +0100
From:   Will Deacon <will@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        "list@263.net:IOMMU DRIVERS , Joerg Roedel <joro@8bytes.org>," 
        <iommu@lists.linux-foundation.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] iomm/arm-smmu: Add stall implementation hook
Message-ID: <20200520125916.GE25815@willie-the-truck>
References: <b491e02ad790a437115fdeab6b21bc48@codeaurora.org>
 <1ced023b-157c-21a0-ac75-1adef7f029f0@arm.com>
 <20200507125357.GA31783@willie-the-truck>
 <CAF6AEGuLU+_qP8HNO1s9PTPHqJnCMHzehmcT8NiJhiAwrfSH6w@mail.gmail.com>
 <CAF6AEGvuHKObTR97XdSXjmjKB+qjQ8N1_wxM=ZU8bEkF=cXp-A@mail.gmail.com>
 <20200511173008.GA24282@jcrouse1-lnx.qualcomm.com>
 <20200518154522.GN32394@willie-the-truck>
 <5a0ad639e272026c8be57393937cda22@codeaurora.org>
 <CAF6AEGuzBtj+srindmOvhaom5BdS2adLaOF=v_MtguMja14V2w@mail.gmail.com>
 <a801e79a0a75092c28a6646ae7fa5e36@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a801e79a0a75092c28a6646ae7fa5e36@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 20, 2020 at 03:02:45PM +0530, Sai Prakash Ranjan wrote:
> On 2020-05-19 20:41, Rob Clark wrote:
> > On Tue, May 19, 2020 at 2:26 AM Sai Prakash Ranjan
> > <saiprakash.ranjan@codeaurora.org> wrote:
> > > On 2020-05-18 21:15, Will Deacon wrote:
> > > > So this sounds like an erratum to me, and I'm happy to set HUPCF if we
> > > > detect the broken implementation. However, it will need an entry in
> > > > Documentation/arm64/silicon-errata.rst and a decent comment in the
> > > > driver
> > > > to explain what we're doing and why.
> > > >
> > > 
> > > AFAIK there is no erratum documented internally for this behaviour and
> > > this
> > > exists from MSM8996 SoC time and errata usually don't survive this
> > > long
> > > across generation of SoCs and there is no point for us in disguising
> > > it.
> > 
> > possibly longer, qcom_iommu sets CFCFG..
> > 
> 
> Oh right, I was still in college when those SoCs were released ;)
> 
> > > Is it OK if we clearly mention it as the "design limitation" or some
> > > other
> > > term which we can agree upon along with the description which Rob and
> > > Jordan
> > > provided for setting HUPCF in the driver when we add the set_hupcf
> > > callback?
> > 
> > I'm not too picky on what we call it, but afaict it has been this way
> > since the beginning of time, rather than specific to a certain SoC or
> > generation of SoCs.  So it doesn't seem like the hw designers consider
> > it a bug.
> > 
> > (I'm not sure what the expected behavior is.. nor if any other SMMU
> > implementation encounters this sort of situation..)
> 
> Yes, that was my point as well that its probably not counted as a bug
> by the hw designers. So I'm going to post setting HUPCF on QCOM
> implementation with clear comments based on yours and Jordan's description
> of this problem, but I wanted to have a way to set this only for GPU context
> bank and not GMU as Jordan mentioned earlier that GMU doesnt need HUPCF set.
> I was checking as to how do we map cb to device, if it was possible then we
> can have
> a compatibility thing like we did for identity mapping. Any ideas Robin?

Right, see my reply over at:

https://lore.kernel.org/r/20200520125700.GD25815@willie-the-truck

Hopefully something like that can be made to work.

Will
