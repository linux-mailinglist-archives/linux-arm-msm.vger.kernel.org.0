Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 858301DD4BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 19:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728885AbgEURrc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 13:47:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:54356 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727966AbgEURrb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 13:47:31 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 77212207F7;
        Thu, 21 May 2020 17:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590083250;
        bh=gjOFDQGCVbKuhm8jhPpiRW9Wyk9jKG5kSGeV52TDf6g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=njcyq1HmKA1I0mjxEii+de1ZOsOH/zUwzOlJFe3Bw1j64/DG0+ouCdPRr1i96R3Eg
         AfkJIeTsVvQ3zL9RHwQDZyxn0fY8cfUUAPdFN5hud8Dkx9MBwT28kABc1OUyE2cB2K
         5B+S74zVYHuTR5Sh+5h63bFEb+f76IdI0yaPZZWU=
Date:   Thu, 21 May 2020 18:47:25 +0100
From:   Will Deacon <will@kernel.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Sharat Masetty <smasetty@codeaurora.org>,
        Robin Murphy <robin.murphy@arm.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH 2/2] dt-bindings: arm-smmu: Add sc7180 compatible string
Message-ID: <20200521174724.GA9223@willie-the-truck>
References: <1588329036-18732-1-git-send-email-smasetty@codeaurora.org>
 <1588329036-18732-2-git-send-email-smasetty@codeaurora.org>
 <CAD=FV=WXv9DYf7LWoFBvro=7Bzeb1_0bXAvRH-suzxnrCu+V2A@mail.gmail.com>
 <20200518143920.GJ32394@willie-the-truck>
 <CAD=FV=We2+5QHimzr+ukit9qkDKQaaTHYEZGkVbOwsNuy11k9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=We2+5QHimzr+ukit9qkDKQaaTHYEZGkVbOwsNuy11k9A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 18, 2020 at 01:59:49PM -0700, Doug Anderson wrote:
> On Mon, May 18, 2020 at 7:39 AM Will Deacon <will@kernel.org> wrote:
> > On Fri, May 15, 2020 at 12:05:39PM -0700, Doug Anderson wrote:
> > > On Fri, May 1, 2020 at 3:30 AM Sharat Masetty <smasetty@codeaurora.org> wrote:
> > > >
> > > > This patch simply adds a new compatible string for SC7180 platform.
> > > >
> > > > Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> > > > ---
> > > >  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > > index 6515dbe..986098b 100644
> > > > --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > > +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > > @@ -28,6 +28,7 @@ properties:
> > > >            - enum:
> > > >                - qcom,msm8996-smmu-v2
> > > >                - qcom,msm8998-smmu-v2
> > > > +              - qcom,sc7180-smmu-v2
> > > >                - qcom,sdm845-smmu-v2
> > > >            - const: qcom,smmu-v2
> > >
> > > Is anything blocking this patch from landing now?
> >
> > I thought updates to the bindings usually went via Rob and the device-tree
> > tree, but neither of those are on cc.
> >
> > Perhaps resend with that fixed?
> 
> Ah, I guess I wasn't familiar with how things worked for this file, or
> maybe things have changed recently?  I'm used to most bindings going
> through the same tree as the drivers that use them.  Usually if things
> are at all complicated maintainers wait for an Ack from Rob (so he
> should have been CCed for sure) and then land.

Just to clear this up: I'm happy to take DT stuff like this, but preferably
with Rob's ack so that I know that (a) it's not a load of rubbish and (b) it
probably won't conflict with his tree. So having the DT folks omitted from
the CC list just rings alarm bells for me.

> In this case it actually looks like Bjorn landed it in the Qualcomm
> and I just didn't realize it.  That seems like it should be fine since
> it's in the middle of a clause that's all Qualcomm and the change
> shouldn't be controversial in any way.  :-)

Ok!

Will
