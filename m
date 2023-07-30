Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC44768773
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 21:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbjG3T3j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Jul 2023 15:29:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjG3T3h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Jul 2023 15:29:37 -0400
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 078B3E5B
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Jul 2023 12:29:36 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id AD5D1202E0;
        Sun, 30 Jul 2023 21:29:34 +0200 (CEST)
Date:   Sun, 30 Jul 2023 21:29:33 +0200
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
Subject: Re: [PATCH 4/7] drm/msm/dpu: enable INTF TE operations only when
 supported by HW
Message-ID: <ritdcd55hcp25pfh3esupm5cf4ucr6kclc7sogpmp4bxkhj36c@udukl2owvvyc>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
 <20230727162104.1497483-5-dmitry.baryshkov@linaro.org>
 <lck7thivac7ztu6e7b4hakjtpoobydcanjdffn6vvppmc4yzcc@46gcp2pwxedq>
 <726501f5-7c69-6321-38eb-1b57676cf389@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <726501f5-7c69-6321-38eb-1b57676cf389@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-07-30 03:22:46, Dmitry Baryshkov wrote:
> On 27/07/2023 23:12, Marijn Suijten wrote:
> > On 2023-07-27 19:21:01, Dmitry Baryshkov wrote:
> >> The DPU_INTF_TE bit is set for all INTF blocks on DPU >= 5.0, however
> >> only INTF_1 and INTF_2 actually support tearing control. Rather than
> >> trying to fix the DPU_INTF_TE, check for the presense of the
> > 
> > I would more exactly expand "fix" to "Rather than specifying that
> > feature bit on DSI INTF_1 and INTF_2 exclusively..."
> > 
> >> corresponding interrupt line.
> > 
> > ... which the catalog will only provide on DPU >= 5.0.
> 
> I'm going to rephrase this in a slightly different way to follow the irq 
> presence -> major & type change.

Sure, looks good, including the validation (that doesn't really need to
be mentioned in the commit message anymore).

- Marijn
