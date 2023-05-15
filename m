Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CBAC7040B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 00:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245711AbjEOWEa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 18:04:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245708AbjEOWEA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 18:04:00 -0400
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06931D2F7
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 15:02:12 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B52B63F6F0;
        Tue, 16 May 2023 00:01:41 +0200 (CEST)
Date:   Tue, 16 May 2023 00:01:40 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v10 4/8] drm/msm: Add MSM-specific DSC helper methods
Message-ID: <4cbqbu47vcshskl4npyzos5r7gxipjbbzyfvdfx7fenfh4mzmx@jj6lrysp35du>
References: <20230329-rfc-msm-dsc-helper-v10-0-4cb21168c227@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v10-4-4cb21168c227@quicinc.com>
 <kx3be4c2okye2ts4rzy4j4ltnveixf7v4rxp5v4tl2irvevg6t@c5tuelunmn4c>
 <0e8a8af5-5ab8-c1b9-e08d-909072cc9b76@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e8a8af5-5ab8-c1b9-e08d-909072cc9b76@quicinc.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-15 13:29:21, Jessica Zhang wrote:
<snip>
> > Const, as requested elsewhere.  But this function is not used anywhere
> > in any of the series (because we replaced the usages with more sensible
> > member accesses like slice_chunk_size).
> 
> Acked.
> 
> I would prefer to keep this helper so that we have a way to easily get 
> BPP information from the DRM DSC config in the future, but if you'd 
> prefer we add this helper then, I'm also ok with that.

The inverse helper is available ad DSC_BPP in drm_dsc_helper.c.  Perhaps
we can move the two variants to the header and define them uniformly?
This isn't MSM-specific it seems (i.e. the format supports fractional
bpp but no RC parameters appear to be defined for such a format yet).

<snip>
> >> + * @dsc: Pointer to drm dsc config struct
> >> + * Returns: Integer value representing pclk per interface
> >> + *
> >> + * Note: This value will then be passed along to DSI and DP for some more
> >> + * calculations. This is because DSI and DP divide the pclk_per_intf value
> >> + * by different values depending on if widebus is enabled.
> > 
> > Can you elaborate what this "note" is trying to tell users of this
> > function?  That they should not use bytes_per_line raw?  That it doesn't
> > actually represent bytes_per_line if the extra calculations mentioned
> > here are not applied?
> 
> The latter -- this method is used for calculating the pclk for DSI and 
> DP. While it does get the raw bytes_per_line, there are some extra 
> calculations needed before it can be set as the pclk_rate. These "extra 
> calculations" are different between DP and DSI.
> 
> For more context, please refer to the earlier revisions of this patch 
> and the usage of the helper in dsi_host.c

Note that I'm not just asking to explain it to me, but to explain it in
the documentation.  The function is named bytes_per_line() but then
Returns: says it returns the pclk per interface, then the note says that
it actually doesn't unless extra calculations are applied.

We can explain the same much more concisely by rewriting Returns and
dropping Note:

    Returns: Integer value representing bytes per line.  DSI and DP need
    to perform further processing/calculations to turn this into
    pclk_per_intf, such as dividing by different values depending on
    if widebus is enabled.

And so we have written the same, just more concisely.  Feel free to
reword it slightly, such as dropping the word "processing".

<snip>
> > Not sure that this helper is useful though: it is
> > only used where msm_dsc_get_slice_per_intf() was already called, so it
> > makes more sense to the reader to just multiply slice_per_intf by
> > slice_chunk_size than to defer to an opaque helper.
> 
> I would prefer to keep this as a helper as this math is common between 
> DP and DSI, and I believe the name of the helper accurately reflects 
> what is being calculated.
> 
> If there's any confusion with the name of the method, I am open to 
> suggestions.

The name is good, I'm just not too keen on it hiding the multiplication
with msm_dsc_get_slice_per_intf() which is already also computed and
available in DSI, and I assume DP too?

- Marijn
