Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27C0C733138
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 14:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345303AbjFPM2g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jun 2023 08:28:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344994AbjFPM2c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jun 2023 08:28:32 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0A7330E8
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 05:28:30 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 116EA40AF2;
        Fri, 16 Jun 2023 14:28:29 +0200 (CEST)
Date:   Fri, 16 Jun 2023 14:28:27 +0200
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
Subject: Re: [PATCH v2 03/22] drm/msm/dpu: remove unused INTF_NONE interfaces
Message-ID: <dcu6pyaw3cnjfup7iy3su2td6kywauvn2wlu2tw4evz6psvc6t@irbbsfcpctzb>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
 <20230613001004.3426676-4-dmitry.baryshkov@linaro.org>
 <6akejrsahbmrueanyhx5hdt5kipkm2fb4dylh4jzprfgzdbczk@x75wfsoza5ah>
 <f954a89f-a0f9-c30d-385d-6149dc360c1f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f954a89f-a0f9-c30d-385d-6149dc360c1f@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-16 12:49:29, Dmitry Baryshkov wrote:
> On 16/06/2023 01:26, Marijn Suijten wrote:
> > On 2023-06-13 03:09:42, Dmitry Baryshkov wrote:
> >> sm6115 and qcm2290 do not have INTF_0. Drop corresponding interface
> >> definitions.
> > 
> > As Abhinav said, add sm6375.
> > 
> > If it wasn't for sc8280xp using INTF_NONE for fake MST, we could have
> > dropped INTF_NONE and the special-cases in dpu_hw_interrupts.c and
> > dpu_hw_intf.c entirely!  Is that your plan?
> 
> I have not thought about it yet. Generally I think INTF_NONE might still 
> be useful to document interfaces that we do not want to support for some 
> reason (e.g. MST or 8974/8084 eDP interfaces).

Sounds good, then we only use it for existing but specialcase interfaces
rather than for bogus/empty entries in the catalog!

- Marijn

> > 
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > 
> 
> -- 
> With best wishes
> Dmitry
> 
