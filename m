Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 697D7611B63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Oct 2022 22:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbiJ1UJW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Oct 2022 16:09:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbiJ1UJV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Oct 2022 16:09:21 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E30141CC75C;
        Fri, 28 Oct 2022 13:09:18 -0700 (PDT)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl [94.209.172.39])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 804013F1D8;
        Fri, 28 Oct 2022 22:09:16 +0200 (CEST)
Date:   Fri, 28 Oct 2022 22:09:15 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Douglas Anderson <dianders@chromium.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/10] drm/msm: Fix math issues in MSM DSC
 implementation
Message-ID: <20221028200823.s5ygokpfy5jz25ge@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Douglas Anderson <dianders@chromium.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221026182824.876933-1-marijn.suijten@somainline.org>
 <99744fda-a3b8-f97a-294c-78e512d865bc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99744fda-a3b8-f97a-294c-78e512d865bc@quicinc.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Abhinav,

On 2022-10-28 11:33:21, Abhinav Kumar wrote:
> Hi Marijn
> 
> On 10/26/2022 11:28 AM, Marijn Suijten wrote:
> > Various removals of complex yet unnecessary math, fixing all uses of
> > drm_dsc_config::bits_per_pixel to deal with the fact that this field
> > includes four fractional bits, and finally making sure that
> > range_bpg_offset contains values 6-bits wide to prevent overflows in
> > drm_dsc_pps_payload_pack().
> > 
> > Altogether this series is responsible for solving _all_ Display Stream
> > Compression issues and artifacts on the Sony Tama (sdm845) Akatsuki
> > smartphone (2880x1440p).
> > 
> > Changes since v3:
> > - Swap patch 7 and 8 to make sure msm_host is available inside
> >    dsi_populate_dsc_params();
> > - Reword patch 6 (Migrate to drm_dsc_compute_rc_parameters()) to more
> >    clearly explain why the FIXME wasn't solved initially, but why it can
> >    (and should!) be resolved now.
> > 
> > v3: https://lore.kernel.org/linux-arm-msm/20221009184824.457416-1-marijn.suijten@somainline.org/T/#u
> > 
> > Changes since v2:
> > - Generalize mux_word_size setting depending on bits_per_component;
> > - Migrate DSI's DSC calculations to drm_dsc_compute_rc_parameters(),
> >    implicitly addressing existing math issues;
> > - Disallow any bits_per_component other than 8, until hardcoded values
> >    are updated and tested to support such cases.
> > 
> > v2: https://lore.kernel.org/linux-arm-msm/20221005181657.784375-1-marijn.suijten@somainline.org/T/#u
> > 
> > Changes since v1:
> > 
> > - Propagate r-b's, except (obviously) in patches that were (heavily)
> >    modified;
> > - Remove accidental debug code in dsi_cmd_dma_add;
> > - Move Range BPG Offset masking out of DCS PPS packing, back into the
> >    DSI driver when it is assigned to drm_dsc_config (this series is now
> >    strictly focusing on drm/msm again);
> > - Replace modulo-check resulting in conditional increment with
> >    DIV_ROUND_UP;
> > - Remove repeated calculation of slice_chunk_size;
> > - Use u16 instead of int when handling bits_per_pixel;
> > - Use DRM_DEV_ERROR instead of pr_err in DSI code;
> > - Also remove redundant target_bpp_x16 variable.
> > 
> > v1: https://lore.kernel.org/linux-arm-msm/20221001190807.358691-1-marijn.suijten@somainline.org/T/#u
> > 
> > Marijn Suijten (10):
> >    drm/msm/dsi: Remove useless math in DSC calculations
> >    drm/msm/dsi: Remove repeated calculation of slice_per_intf
> >    drm/msm/dsi: Use DIV_ROUND_UP instead of conditional increment on
> >      modulo
> >    drm/msm/dsi: Reuse earlier computed dsc->slice_chunk_size
> >    drm/msm/dsi: Appropriately set dsc->mux_word_size based on bpc
> >    drm/msm/dsi: Migrate to drm_dsc_compute_rc_parameters()
> >    drm/msm/dsi: Account for DSC's bits_per_pixel having 4 fractional bits
> >    drm/msm/dsi: Disallow 8 BPC DSC configuration for alternative BPC
> >      values
> >    drm/msm/dpu1: Account for DSC's bits_per_pixel having 4 fractional
> >      bits
> >    drm/msm/dsi: Prevent signed BPG offsets from bleeding into adjacent
> >      bits
> > 
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c |  11 +-
> >   drivers/gpu/drm/msm/dsi/dsi_host.c         | 121 ++++++---------------
> >   2 files changed, 37 insertions(+), 95 deletions(-)
> > 
> > --
> > 2.38.1
> > 
> 
> To keep the -fixes cycle to have only critical fixes (others are 
> important too but are cleanups), I was thinking of absorbing patches 
> 7,8,9 and 10 alone in the -fixes cycle and for patches 1-6, will go 
> through the 6.2 push.
> 
> Let me know if there are any concerns if we just take patches 7,8,9 and 
> 10 separately.

Unfortunately that isn't going to cut it.  For starters patch 8 is only
introducing additional validation but as long as no panel drivers set
bpc != 8, this doesn't change anything: it is not a critical fix.

Then, more importantly, as discussed in v2 reviews it was preferred to
_not_ fix the broken code in dsi_populate_dsc_params() but migrate to
drm_dsc_compute_rc_parameters() directly [1].  As such patch 6 (which
performs the migration) is definitely a requirement for the fixes to be
complete.  Then again this patch looks weird when 5 is not applied,
since both refactor how dsc->mux_word_size is assigned.  At the same
time it cannot be cleanly applied without patch 1 (Remove useless math
in DSC calculations) nor patch 3 (Use DIV_ROUND_UP instead of
conditional increment on modulo), but I just realized that patch 3 is
now also useless as the code is being removed altogether while migrating
to drm_dsc_compute_rc_parameters().

Same for patch 4 (Reuse earlier computed dsc->slice_chunk_size): while
it may not seem obvious at first, the original code uses bits_per_pixel
without considering the fractional bits, again resulting invalid values.
Perhaps this should have been mentioned in the patch description, but I
did not want to create an even larger chain of references pointing back
and forth to future patches fixing the exact same bug.  Unfortunately
this patch doesn't apply cleanly without patch 2 (Remove repeated
calculation of slice_per_intf) either.

All in all, applying this series piecemeal requires careful
consideration which of the patches are actually fixing issues, and is
terribly tricky considering code cleanups touching the same code and
sitting right before the fixes (done intentionally to not distract diffs
in bugfixes being surrounded by odd looking code).

[1]: https://lore.kernel.org/linux-arm-msm/CAA8EJpr=0w0KReqNW2jP8DzvXLgo_o6bKmwMOed2sXb6d8HKhg@mail.gmail.com/

- Marijn
