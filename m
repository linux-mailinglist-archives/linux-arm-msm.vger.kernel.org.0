Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEA1E7B4FE8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Oct 2023 12:10:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236258AbjJBKKm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Oct 2023 06:10:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231153AbjJBKKl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Oct 2023 06:10:41 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 193FBB0
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Oct 2023 03:10:39 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70F3DC433C7;
        Mon,  2 Oct 2023 10:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696241438;
        bh=VuU6DqtVO4nBU2yJ2rp1XU31YLvfaorg9TJX6ZIVBbc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CgEIElYPdQaQZwrle5dYtgDrMvD3XH/9IKv7n+6YVqMdQaTYBthOHHSt5PmsLvnGj
         2lOcXFLRnKAgahZXCiV7fUhLibj6m4SeKUMzl256EQB/RJT4dw/ao5Dcxo4i0ScdrC
         QuIJ3XPJbT7sgEnIyyEsEiyXXp2yu1viwypwdrlOhF9MoLWHK9/o3DeF2wE3gAzNIi
         HPz4f0zqF3v7pPR4zEUnvxhDISy0mxaQpISh8WMGFZQ92D8hQRnwfqjq96zvMOGvi0
         urds0zWAohSLITJMokdZ1ZLItjYnX19kaES9J3YdGZxAym777tCvnI8lXD0CLxATAO
         mP9VKHrODW8uw==
Date:   Mon, 2 Oct 2023 11:10:32 +0100
From:   Will Deacon <will@kernel.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH] drm/msm/a6xx: don't set IO_PGTABLE_QUIRK_ARM_OUTER_WBWA
 with coherent SMMU
Message-ID: <20231002101032.GA1079@willie-the-truck>
References: <20230410185226.3240336-1-dmitry.baryshkov@linaro.org>
 <b1434fe7-3128-f390-7b13-3d460378e231@arm.com>
 <20230929154507.GA30764@willie-the-truck>
 <70d975d0-8ee7-9f08-7fae-4652a18df598@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70d975d0-8ee7-9f08-7fae-4652a18df598@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 29, 2023 at 06:25:21PM +0100, Robin Murphy wrote:
> On 29/09/2023 4:45 pm, Will Deacon wrote:
> > On Mon, Sep 25, 2023 at 06:54:42PM +0100, Robin Murphy wrote:
> > > On 2023-04-10 19:52, Dmitry Baryshkov wrote:
> > > > If the Adreno SMMU is dma-coherent, allocation will fail unless we
> > > > disable IO_PGTABLE_QUIRK_ARM_OUTER_WBWA. Skip setting this quirk for the
> > > > coherent SMMUs (like we have on sm8350 platform).
> > > 
> > > Hmm, but is it right that it should fail in the first place? The fact is
> > > that if the SMMU is coherent then walks *will* be outer-WBWA, so I honestly
> > > can't see why the io-pgtable code is going out of its way to explicitly
> > > reject a request to give them the same attribute it's already giving then
> > > anyway :/
> > > 
> > > Even if the original intent was for the quirk to have an over-specific
> > > implication of representing inner-NC as well, that hardly seems useful if
> > > what we've ended up with in practice is a nonsensical-looking check in one
> > > place and then a weird hacky bodge in another purely to work around it.
> > > 
> > > Does anyone know a good reason why this is the way it is?
> > 
> > I think it was mainly because the quick doesn't make sense for a coherent
> > page-table walker and we could in theory use that bit for something else
> > in that case.
> 
> Yuck, even if we did want some horrible notion of quirks being conditional
> on parts of the config rather than just the format, then the users would
> need to be testing for the same condition as the pagetable code itself (i.e.
> cfg->coherent_walk), rather than hoping some other property of something
> else indirectly reflects the right information - e.g. there'd be no hope of
> backporting this particular bodge before 5.19 where the old
> iommu_capable(IOMMU_CAP_CACHE_COHERENCY) always returned true, and in future
> we could conceivably support coherent SMMUs being configured for
> non-coherent walks on a per-domain basis.

That doesn't sound like an insurmountable problem to me. Either a bunch of
other stuff has to be backported as well, or the msm_iommu driver can fish
the pgtable configuration out of the SMMU, like it already does elsewhere.

> Furthermore, if we did overload a flag to have multiple meanings, then we'd
> have no way of knowing which one the caller was actually expecting, thus the
> illusion of being able to validate calls in the meantime isn't necessarily
> as helpful as it seems, particularly in a case where the "wrong"
> interpretation would be to have no effect anyway. Mostly though I'd hope
> that if we ever got anywhere near the point of running out of quirk bits
> we'd have already realised that it's time for a better interface :(

Although I agree that practically I can't see us reusing quirk bits, I do
much prefer that we reject quirks that don't make sense. Yes, in this case
it happens that the quirk is expressing something which is already true
for the coherent walker, but that feels like a special case to me rather
than something which is likely to be true in general, for example, the
system cache quirk proposed by Qualcomm to expose the unused
inner-NC-outer-WBWRA MAIR configuration.

Implicitly accepting quirks also makes it more difficult if we wanted to
change the default configuration in future; for example if we wanted to
adjust the default allocation hints.

So I'd prefer to leave the page-table code as-is.

Will
