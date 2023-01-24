Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A915679749
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jan 2023 13:06:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbjAXMG6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Jan 2023 07:06:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233346AbjAXMG5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Jan 2023 07:06:57 -0500
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A121B42DE5
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 04:06:55 -0800 (PST)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id AB46D41B01;
        Tue, 24 Jan 2023 13:06:53 +0100 (CET)
Date:   Tue, 24 Jan 2023 13:06:52 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        freedreno@lists.freedesktop.org,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        David Airlie <airlied@gmail.com>
Subject: Re: [1/2] drm/msm/dpu: fix clocks settings for msm8998 SSPP blocks
Message-ID: <20230124120652.rqmaj2j4jytmvzbl@SoMainline.org>
References: <20230115124143.464809-1-dmitry.baryshkov@linaro.org>
 <20230124095944.4zez2jmidjuh3nvf@SoMainline.org>
 <9f182939-0e32-c0a9-ee09-9e97a48bb7ac@linaro.org>
 <20230124111250.b2r2co4jjxofjchp@SoMainline.org>
 <CAA8EJprPxm6PObLapAXr_D5d85oT8y2GhoCzABLq_u2xFDhkvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJprPxm6PObLapAXr_D5d85oT8y2GhoCzABLq_u2xFDhkvQ@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-01-24 13:20:57, Dmitry Baryshkov wrote:
> On Tue, 24 Jan 2023 at 13:12, Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
> >
> > On 2023-01-24 12:19:27, Dmitry Baryshkov wrote:
> > > On 24/01/2023 11:59, Marijn Suijten wrote:
> > > > On 2023-01-15 14:41:42, Dmitry Baryshkov wrote:
> > > >> DMA2 and DMA3 planes on msm8998 should use corresponding DMA2 and DMA3
> > > >> clocks rather than CURSOR0/1 clocks (which are used for the CURSOR
> > > >> planes). Correct corresponding SSPP declarations.
> > > >>
> > > >> Fixes: 94391a14fc27 ("drm/msm/dpu1: Add MSM8998 to hw catalog")
> > > >> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> > > >> Cc: Jami Kettunen <jami.kettunen@somainline.org>
> > > >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > >> ---
> > > >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
> > > >>   1 file changed, 2 insertions(+), 2 deletions(-)
> > > >>
> > > >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > > >> index 0f3da480b066..ad0c55464154 100644
> > > >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > > >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > > >> @@ -1180,9 +1180,9 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
> > > >>    SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_MSM8998_MASK,
> > > >>            sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> > > >>    SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_MSM8998_MASK,
> > > >
> > > > Drop the _CURSOR mask here?  And the double space....
> > >
> > > Ack for the doublespace. By removing _CURSOR we would disallow using
> > > these planes as hw cursor planes. This would switch all compositors into
> > > sw cursor mode, thus damaging the performance.
> >
> > Doesn't that require special hardware support, or can any DMA pipe
> > support "hw cursor mode/planes", whatever that means?  Sorry for not
> > being well versed in this area, I'd expect DMA pipes and CURSOR pipes to
> > have a different set of features / capabilities.
> 
> Yes, they have different capabilities. but DMA_CURSOR_MSM8998_MASK =
> DMA_MSM8998_MASK | BIT(DPU_SSPP_CURSOR). And the DPU_SSPP_CURSOR is
> used internally to tell the DRM core that the corresponding plane is
> going to be used as a "userspace cursor" plane.

Different capabilities for userspace, but not in terms hardware (/driver
support, yet)?  If so, then:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> > Commit 07ca1fc0f8a0 ("drm/msm/dpu: enable cursor plane on dpu") leads me
> > to believe that it's mostly to let userspace use these DMA pipes for
> > cursors (having cursor planes available in uapi) rather than requiring
> > any special hardware support (though semantics do seem to change in a
> > nontrivial way).
> 
> Correct.
> DRM/userspace cursor planes = planes which userspace can use to draw
> mouse cursor. Legacy compositors and legacy cursor IOCTLs stick to
> using them
> DPU/MDP5 CURSOR plane (sspp_12/13) = lightweight limited plane without

But these DMA pipes are _not_ lightweight/limited?

> additional features, targeting HW cursor only, not present since
> sdm845
> DPU_SSPP_CURSOR = bit which tells DPU core to mark a plane as
> 'DRM/userspace cursor plane'.

Ack, so it's not toggling anything hardware specific /yet/.  However,
does this prevent userspace from using these pipes/planes for other DMA
purposes as they're marked as a different _type_ of plane?  And will
that change when we do end up "implementing more rigorous/strict
hardware support"?  For the other SoCs, are their DMA pipes also
featureful and would the presence of DPU_SSPP_CURSOR severely limit its
functionality?  And is this thing that "virtual planes" would be going
to "solve"?

<snip>

> > As we've seen in [1] (specifically [2]) there are a few more driver/hw
> > changes required to properly implement/support DPU_SSPP_CURSOR?
> >
> > [1]: https://github.com/rawoul/linux/commits/next_20220624-msm8998-hdmi
> > [2]; https://github.com/rawoul/linux/commit/7d8d739cfbfa551120868986d5824f7b2b116ac1

Referring to changes like these ^.

- Marijn
