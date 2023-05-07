Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 746276F995C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 May 2023 17:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231290AbjEGPa5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 May 2023 11:30:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjEGPa4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 May 2023 11:30:56 -0400
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FD7E40E1
        for <linux-arm-msm@vger.kernel.org>; Sun,  7 May 2023 08:30:54 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 8CBE51F62C;
        Sun,  7 May 2023 17:30:51 +0200 (CEST)
Date:   Sun, 7 May 2023 17:30:50 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v6 6/7] drm/msm/dsi: update hdisplay calculation for
 dsi_timing_setup
Message-ID: <fyituy2kti2p3npmik54p5hiznhniqjqcpyzq3nusjwjtla62d@khg2p7c3zgit>
References: <20230329-rfc-msm-dsc-helper-v6-0-cb7f59f0f7fb@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v6-6-cb7f59f0f7fb@quicinc.com>
 <ynr6n5p2envixdn6pycjo4fat6n64xe4pkplhq5c2ukhi2q2tf@hqlsuusl66cl>
 <4e7f88f9-037b-b5d4-3079-81f394da657f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e7f88f9-037b-b5d4-3079-81f394da657f@quicinc.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
        WEIRD_QUOTING autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-04 15:34:08, Jessica Zhang wrote:
> 
> 
> On 5/4/2023 2:56 PM, Marijn Suijten wrote:
> > On 2023-04-12 16:25:20, Jessica Zhang wrote:
> >> hdisplay for compressed images should be calculated as bytes_per_slice *
> >> slice_count. Thus, use MSM DSC helper to calculate hdisplay for
> >> dsi_timing_setup instead of directly using mode->hdisplay.
> >>
> >> Changes in v3:
> >> - Split from previous patch
> >> - Initialized hdisplay as uncompressed pclk per line at the beginning of
> >>    dsi_timing_setup as to not break dual DSI calculations
> >>
> >> Changes in v4:
> >> - Moved pclk_per_intf calculations to DSC hdisplay adjustments
> >>
> >> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> ---
> >>   drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> index 508577c596ff..ae966d4e349d 100644
> >> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> @@ -952,7 +952,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> >>   		 * pulse width same
> >>   		 */
> >>   		h_total -= hdisplay;
> >> -		hdisplay /= 3;
> >> +		hdisplay = msm_dsc_get_pclk_per_intf(msm_host->dsc) / 3;
> > 
> > This patch is unfortunately regressing the Sony Xperia XZ3 (sdm845,
> > single DSI), which will only show garbage when it is applied.
> > 
> > Are you sure this is correct, and the helper is returning the right
> > values?  I'll see if I can help review and validate those later, and
> > debug if necessary.
> 
> Hi Marijn,
> 
> Just checking, are you testing this with the DSI for DSC v1.2 changes? 

Yes, all the series, including those that are implicitly/indirectly
required.  This specific patch is pointed out by git bisect.

> That series includes a fix to the word count calculation [1] needed to 
> get DSC working.

No, we cannot have this series introduce a bug and depend on *a future*
series to fix that, if that's what you're saying.

> Thanks,
> 
> Jessica Zhang
> 
> [1] https://patchwork.freedesktop.org/patch/535115/?series=117219&rev=1

That ""fix"" won't have any effect since slice_count is 1 for this
specific panel/device:

https://github.com/SoMainline/linux/commit/b154ea72e6c2ca0d4a33a28cc24e3a762dba4948

- Marijn

> 
> > 
> > - Marijn
> > 
> >>   		h_total += hdisplay;
> >>   		ha_end = ha_start + hdisplay;
> >>   	}
> >>
> >> -- 
> >> 2.40.0
> >>
