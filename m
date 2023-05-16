Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D6FC705AC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 May 2023 00:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbjEPWtd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 18:49:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjEPWtc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 18:49:32 -0400
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BE90EE
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 15:49:31 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id DFB30202F5;
        Wed, 17 May 2023 00:49:28 +0200 (CEST)
Date:   Wed, 17 May 2023 00:49:27 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v10 4/8] drm/msm: Add MSM-specific DSC helper methods
Message-ID: <v4qix3bdxj3ykmjsokzrtubozdqh2fnh4mevpiz6v2y63csjb7@hddxgbi4yjgn>
References: <20230329-rfc-msm-dsc-helper-v10-0-4cb21168c227@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v10-4-4cb21168c227@quicinc.com>
 <kx3be4c2okye2ts4rzy4j4ltnveixf7v4rxp5v4tl2irvevg6t@c5tuelunmn4c>
 <0e8a8af5-5ab8-c1b9-e08d-909072cc9b76@quicinc.com>
 <4cbqbu47vcshskl4npyzos5r7gxipjbbzyfvdfx7fenfh4mzmx@jj6lrysp35du>
 <a5a56711-3607-407c-aa8f-aed39a41fb73@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5a56711-3607-407c-aa8f-aed39a41fb73@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-16 01:07:05, Dmitry Baryshkov wrote:
> 
> On 16/05/2023 01:01, Marijn Suijten wrote:
> > On 2023-05-15 13:29:21, Jessica Zhang wrote:
> > <snip>
> >>> Const, as requested elsewhere.  But this function is not used anywhere
> >>> in any of the series (because we replaced the usages with more sensible
> >>> member accesses like slice_chunk_size).
> >>
> >> Acked.
> >>
> >> I would prefer to keep this helper so that we have a way to easily get
> >> BPP information from the DRM DSC config in the future, but if you'd
> >> prefer we add this helper then, I'm also ok with that.
> > 
> > The inverse helper is available ad DSC_BPP in drm_dsc_helper.c.  Perhaps
> > we can move the two variants to the header and define them uniformly?
> > This isn't MSM-specific it seems (i.e. the format supports fractional
> > bpp but no RC parameters appear to be defined for such a format yet).
> 
> I think DSC_BPP was removed (around v2 or v3 if I read changelog correctly).

Seems like it was removed at some point indeed, and now the helper file
picked up an identically named DSC_BPP macro but with the inverse
implementation :) - at least it's a *.c file.

Perhaps we can make it more consistent by defining both ways with
concise macros in a header.

> As for the fraction-point BPP, I think AMD supports .5 bpp granularity, 
> see drivers/gpu/drm/amd/display/dc/dml/dsc/qp_tables.h

That won't use the helper then.

> With best wishes
> Dmitry

- Marijn
