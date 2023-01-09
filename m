Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42577662C61
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 18:13:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237026AbjAIRMe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 12:12:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237123AbjAIRMH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 12:12:07 -0500
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A76D2DF83
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 09:11:00 -0800 (PST)
Received: from SoMainline.org (unknown [89.205.226.190])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B36893EF10;
        Mon,  9 Jan 2023 18:10:56 +0100 (CET)
Date:   Mon, 9 Jan 2023 18:10:52 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dpu: sort entries in the HW catalog
Message-ID: <20230109171052.wa43fccjh3f6wype@SoMainline.org>
References: <20230108211113.200846-1-dmitry.baryshkov@linaro.org>
 <20230109083417.5drdfllpm4ythy42@SoMainline.org>
 <CAA8EJpoVC2OW4iKcq=C-D3hejVPZ1Bd+6Nb9vPk6DVVWP2_4rQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpoVC2OW4iKcq=C-D3hejVPZ1Bd+6Nb9vPk6DVVWP2_4rQ@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-01-09 11:22:42, Dmitry Baryshkov wrote:
> On Mon, 9 Jan 2023 at 10:34, Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
> >
> > On 2023-01-08 23:11:13, Dmitry Baryshkov wrote:
> > > Different entries into the catalog were added quite randomly. Enforce
> > > the sorting order of some kind. It is not alphabetic to prevent the
> > > patch from growing uncontrollably.
> >
> > Why not sort these chronologically based on DPU hardware revision in the
> > match table at the end of this file?
> 
> If we keep the SoC name as part of the symbolic name, we will end up
> in another semi-random order that is a pain to verify. Would you
> remember that sm6350 comes between sm6115 and qcm2290? I would not :-(
> And changing all names to dpu_6_5_0_lms would make it easy to add but
> nearly impossible to follow.

Agreed, though I think having the version in there would make things
easier to follow.  Then everything uses the "lowest" version it is
compatible with, and we duplicate the structs when adding a feature that
is only available on newer (or older) revisions.

> > Regardless, this patch is going to
> > make it hard to properly rebase DPU additions; see for example patch 4/8
> > and 5/8 in my second round of DSC fixes.
> 
> Yes, quite unfortunate. As I wrote, it's already late to apply this patch :-(

At least we're working towards making things better, or at the very
least discussing the right way forward.

> > At the same time we should find a solution to the wishy-washy reuse of
> > structs and defines, which may appear the same initially but become
> > mismatched as more features are added (see how I had to split out
> > multiple of these in the INTF TE enablement series).
> 
> It's a slightly different problem, but yes, I share the pain.

It is quite relevant though, as sorting is very closely tied to what
structs we reuse where, considering what SoC name is used.  It is
typically "what was already there" but a "least common denominator"
would be more descriptive (e.g. based on hardware version).

> > > Thus SDM comes before SC and SM
> > > platforms and QCM is kept as the last one. There are no functional
> > > changes in this patch.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >
> > > Yes, I hate such mass-moves too. However the entries in this file are
> > > slowly becoming uncontrollable. Let's enforce some order now (while it's
> > > late already, but not _that_ late).
> >
> > I agree that something should happen, contributing to this file is
> > unnecessarily tough.
> 
> In the IRC conversation Rob suggested playing with includes, but I
> don't see a good way to implement that.

That would be nice; especially if we accept struct duplication (instead
of recursively including "earlier" versions where needed, as mentioned
in IRC that'll spiral out of control).  With that one can easily diff
two include files and understand the differences between SoCs and/or DPU
hardware revisions (or notice whether a certain configuration might be
missing/extraneous).

- Marijn
