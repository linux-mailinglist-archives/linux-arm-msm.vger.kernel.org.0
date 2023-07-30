Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40E34768763
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 21:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbjG3T0W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Jul 2023 15:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjG3T0V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Jul 2023 15:26:21 -0400
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEF47BF
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Jul 2023 12:26:18 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 7B46E1F995;
        Sun, 30 Jul 2023 21:26:14 +0200 (CEST)
Date:   Sun, 30 Jul 2023 21:26:12 +0200
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
Subject: Re: [PATCH 1/7] drm/msm/dpu: enable PINGPONG TE operations only when
 supported by HW
Message-ID: <qn67eiyw7egfgmfqd6uahyyniyptrutf6r37arsfryqiaxj3tl@4wszcae3egsi>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
 <20230727162104.1497483-2-dmitry.baryshkov@linaro.org>
 <byxscievxgqwcdu56mebkoy4jpgogzy3euddz73u2qryh3itwb@to3pyltcqqxg>
 <c9d7994d-5781-41b0-6af0-cc45d4ebf6fb@linaro.org>
 <sul276fwfmniat5dlkdj4rlw3dxjmqrg254iteblwbdlhwfxmg@4orla7ystkp4>
 <bd59cd28-b3ba-1805-da2c-8ec6b0b2f1b0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd59cd28-b3ba-1805-da2c-8ec6b0b2f1b0@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-07-30 02:18:10, Dmitry Baryshkov wrote:
> On 29/07/2023 21:31, Marijn Suijten wrote:
> > On 2023-07-29 02:59:32, Dmitry Baryshkov wrote:
> >> On 27/07/2023 23:03, Marijn Suijten wrote:
> >>> On 2023-07-27 19:20:58, Dmitry Baryshkov wrote:
> >>>> The DPU_PINGPONG_TE bit is set for all PINGPONG blocks on DPU < 5.0.
> >>>> Rather than checking for the flag, check for the presense of the
> >>>> corresponding interrupt line.
> >>>>
> >>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>
> >>> That's a smart use of the interrupt field.  I both like it, and I do
> >>> not.  While we didn't do any validation for consistency previously, this
> >>> means we now have multiple ways of controlling available "features":
> >>>
> >>> - Feature flags on hardware blocks;
> >>> - Presence of certain IRQs;
> >>> - DPU core revision.
> >>
> >> I hesitated here too. For INTF it is clear that there is no other good
> >> way to check for the TE feature. For PP we can just check for the DPU
> >> revision.
> > 
> > For both we could additionally check the DPU revision, and for INTF we
> > could check for TYPE_DSI.  Both would aid in extra validation, if we
> > require the IRQ to be present or absent under these conditions.
> 
> Yep, maybe that's better.
> 
> > 
> > It might also help to document this, either here and on the respective
> > struct fields so that catalog implementers know when they should supply
> > or leave out an IRQ?
> 
> Probably a WARN_ON would be enough.

SGTM, it is after all only for bring-up as after that (additions have
been validated, reviewed and merged) we "trust the kernel" including our
catalog, so errors like this should pretty much be unreachable.

- Marijn
