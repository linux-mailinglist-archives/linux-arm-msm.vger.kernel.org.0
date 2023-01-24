Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9154C67967F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jan 2023 12:21:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233152AbjAXLVL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Jan 2023 06:21:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233144AbjAXLVL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Jan 2023 06:21:11 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 974CA1116C
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 03:21:09 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id p15so14719461ybu.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 03:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IU3DYpPA6oRQuTVTfrhplBDOkHixxEc4pPsrimOogEA=;
        b=yogG81zuajJjr5c1Veuwa+uwtkTY6Fz4jAICh4IgPn0Fa14aG3BVoPfxwgXIXtqL60
         FtdEFCp6IZJNGaf78ihEXyU1yIFD6juqd53HRM62+T6P6PW8sH1HthnSY31FBSmBb/j9
         Xxy6w0W/nqye8LJYN9xX9B/lt+YO1Qhxe+youf9UUbPNfCvTKfGrUhSnx5iLv2zlpKl4
         5Q/84eDqTAtMA7kZY5vptWdsRAto68q4oiMreYwIpEv8IiRLVm16fE67ZwwR1Gjh9DAf
         TgErCAGhck10s5nfwsWsO00DSbyZWcKPfIUqA7K6pCiNoGjIWRG9J2FQet9K8BBKhtUX
         bsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IU3DYpPA6oRQuTVTfrhplBDOkHixxEc4pPsrimOogEA=;
        b=4X1ZvezhEkY1wuYnbluYRRYCBDcSX9SVQGaP33K8fzaLWiAFtlkWj4WBA3lxyLKdck
         oMKvAChoU6Si0wnhfvX7bUcRcThoNQTVC9InsMFSbAAOy/7hL8IcLueATzCXj1WCA+V9
         /rggXuNyGRO3oaHAvwamcBBRDnoS4lcHY8HAaBZoCE94iQnwSKFPaW9smLHRZ842ZJLU
         0xHoudn8mMGFDOmbBFGQ88glrrQeMsWR8s3gHj/E/9m8cEaR1U79hgbp3sYgQ3eacbct
         MqoRqsaoz10XzIPZnGJeTpMoa0RSopRuNn83ZkW7DZSFRYZBvS7pTnnZJ0mlcsCObKZs
         Vocw==
X-Gm-Message-State: AFqh2kqazOxyh9ImWmJ0d3qvAihT+HszsKUB3ekvjuZUS9yIYWH0B5+3
        eQmKFsw/pOjwTj48YzOc/c9iLgz+/2eR6lk+mjDUcg==
X-Google-Smtp-Source: AMrXdXv4pIYhPkn5Ye0Z1R++9bj3ZCizSpJf8kb3rcuxGOTggVe9r28/jxcfp0CyCvAcV4yJwMVsU+2/ABzLBzaVdNU=
X-Received: by 2002:a05:6902:8f:b0:800:748:7d05 with SMTP id
 h15-20020a056902008f00b0080007487d05mr1875802ybs.15.1674559268784; Tue, 24
 Jan 2023 03:21:08 -0800 (PST)
MIME-Version: 1.0
References: <20230115124143.464809-1-dmitry.baryshkov@linaro.org>
 <20230124095944.4zez2jmidjuh3nvf@SoMainline.org> <9f182939-0e32-c0a9-ee09-9e97a48bb7ac@linaro.org>
 <20230124111250.b2r2co4jjxofjchp@SoMainline.org>
In-Reply-To: <20230124111250.b2r2co4jjxofjchp@SoMainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 24 Jan 2023 13:20:57 +0200
Message-ID: <CAA8EJprPxm6PObLapAXr_D5d85oT8y2GhoCzABLq_u2xFDhkvQ@mail.gmail.com>
Subject: Re: [1/2] drm/msm/dpu: fix clocks settings for msm8998 SSPP blocks
To:     Marijn Suijten <marijn.suijten@somainline.org>
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
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 24 Jan 2023 at 13:12, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2023-01-24 12:19:27, Dmitry Baryshkov wrote:
> > On 24/01/2023 11:59, Marijn Suijten wrote:
> > > On 2023-01-15 14:41:42, Dmitry Baryshkov wrote:
> > >> DMA2 and DMA3 planes on msm8998 should use corresponding DMA2 and DMA3
> > >> clocks rather than CURSOR0/1 clocks (which are used for the CURSOR
> > >> planes). Correct corresponding SSPP declarations.
> > >>
> > >> Fixes: 94391a14fc27 ("drm/msm/dpu1: Add MSM8998 to hw catalog")
> > >> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> > >> Cc: Jami Kettunen <jami.kettunen@somainline.org>
> > >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >> ---
> > >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
> > >>   1 file changed, 2 insertions(+), 2 deletions(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > >> index 0f3da480b066..ad0c55464154 100644
> > >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > >> @@ -1180,9 +1180,9 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
> > >>    SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_MSM8998_MASK,
> > >>            sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> > >>    SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_MSM8998_MASK,
> > >
> > > Drop the _CURSOR mask here?  And the double space....
> >
> > Ack for the doublespace. By removing _CURSOR we would disallow using
> > these planes as hw cursor planes. This would switch all compositors into
> > sw cursor mode, thus damaging the performance.
>
> Doesn't that require special hardware support, or can any DMA pipe
> support "hw cursor mode/planes", whatever that means?  Sorry for not
> being well versed in this area, I'd expect DMA pipes and CURSOR pipes to
> have a different set of features / capabilities.

Yes, they have different capabilities. but DMA_CURSOR_MSM8998_MASK =
DMA_MSM8998_MASK | BIT(DPU_SSPP_CURSOR). And the DPU_SSPP_CURSOR is
used internally to tell the DRM core that the corresponding plane is
going to be used as a "userspace cursor" plane.

> Commit 07ca1fc0f8a0 ("drm/msm/dpu: enable cursor plane on dpu") leads me
> to believe that it's mostly to let userspace use these DMA pipes for
> cursors (having cursor planes available in uapi) rather than requiring
> any special hardware support (though semantics do seem to change in a
> nontrivial way).

Correct.
DRM/userspace cursor planes = planes which userspace can use to draw
mouse cursor. Legacy compositors and legacy cursor IOCTLs stick to
using them
DPU/MDP5 CURSOR plane (sspp_12/13) = lightweight limited plane without
additional features, targeting HW cursor only, not present since
sdm845
DPU_SSPP_CURSOR = bit which tells DPU core to mark a plane as
'DRM/userspace cursor plane'.

>
> > >> -          sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> > >> +          sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> > >>    SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_MSM8998_MASK,
> > >> -          sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
> > >> +          sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
> > >
> > > Yes, msm8998_mdp defines both DMA2/3 and CURSOR0/1 clocks.  R-b after
> > > using DMA_MSM8998_MASK without the DPU_SSPP_CURSOR bit.
> > >
> > > However, my downstream sources still define cursor SSPPs that are
> > > missing here (after all, there's clk-ctrl for these already), at xin ID
> > > 2 and 10 with addresses 0x3500 and 0x37000 downstream (-0x1000 here):
> > >
> > >     SSPP_BLK("sspp_?", SSPP_CURSOR0, 0x34000, DMA_CURSOR_SM8998_MASK,
> > >             cursor sblk?, 2, SSPP_TYPE_CURSOR, DPU_CLK_CTRL_CURSOR0),
> > >     SSPP_BLK("sspp_?", SSPP_CURSOR1, 0x36000, DMA_CURSOR_SM8998_MASK,
> >
> > I think this should not be the DMA_CURSOR_MSM8998_MASK, but don't bet on
> > my words, I haven't check actual cursor plane capabilities.
>
> As we've seen in [1] (specifically [2]) there are a few more driver/hw
> changes required to properly implement/support DPU_SSPP_CURSOR?
>
> [1]: https://github.com/rawoul/linux/commits/next_20220624-msm8998-hdmi
> [2]; https://github.com/rawoul/linux/commit/7d8d739cfbfa551120868986d5824f7b2b116ac1
>
> - Marijn
>
> > >             cursor sblk?, 10, SSPP_TYPE_CURSOR, DPU_CLK_CTRL_CURSOR1),
> > >
> > > Or should you/I send that as a separate folloup patch?
> >
> > Ideally one can add these two planes and then switch two mentioned DMA
> > planes to plain DMA_MSM8998_MASK.
> >
> > >
> > > - Marijn
> > >
> > >>   };
> > >>
> > >>   static const struct dpu_sspp_cfg sdm845_sspp[] = {
> >
> > --
> > With best wishes
> > Dmitry
> >



-- 
With best wishes
Dmitry
