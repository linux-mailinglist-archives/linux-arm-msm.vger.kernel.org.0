Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A34A6FBFAA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 May 2023 08:55:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234843AbjEIGyj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 May 2023 02:54:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235072AbjEIGyJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 May 2023 02:54:09 -0400
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC6AF4C31
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 23:53:58 -0700 (PDT)
Received: from SoMainline.org (unknown [89.205.226.248])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id DB6541F997;
        Tue,  9 May 2023 08:53:55 +0200 (CEST)
Date:   Tue, 9 May 2023 08:53:53 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v6 6/7] drm/msm/dsi: update hdisplay calculation for
 dsi_timing_setup
Message-ID: <wsfxewph3gknzqwxulx54cfwwtnzhrksqgyuqxdwmdsotfvgxp@rktwntpgotwd>
References: <20230329-rfc-msm-dsc-helper-v6-0-cb7f59f0f7fb@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v6-6-cb7f59f0f7fb@quicinc.com>
 <ynr6n5p2envixdn6pycjo4fat6n64xe4pkplhq5c2ukhi2q2tf@hqlsuusl66cl>
 <7ef70055-610c-8ab6-9e3b-515cf3fa542f@quicinc.com>
 <2r5rgl2rxrdognhlisruwgw74stefxmsmmqutz7wd3r4oxy52o@kd4ne4y2dc3u>
 <zuviqzvqnw5cgn3mg7ha55kqggmlxageijryoyv7q4eh3d2h6t@lhegcj7ixd4z>
 <c969a71a-e922-80f3-fce1-a6b469c75ebe@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c969a71a-e922-80f3-fce1-a6b469c75ebe@quicinc.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-08 17:51:08, Jessica Zhang wrote:
> 
> 
> On 5/7/2023 11:34 AM, Marijn Suijten wrote:
> > On 2023-05-07 17:27:33, Marijn Suijten wrote:
> >> On 2023-05-04 15:05:15, Abhinav Kumar wrote:
> >>>
> >>>
> >>> On 5/4/2023 2:56 PM, Marijn Suijten wrote:
> >>>> On 2023-04-12 16:25:20, Jessica Zhang wrote:
> >>>>> hdisplay for compressed images should be calculated as bytes_per_slice *
> >>>>> slice_count. Thus, use MSM DSC helper to calculate hdisplay for
> >>>>> dsi_timing_setup instead of directly using mode->hdisplay.
> >>>>>
> >>>>> Changes in v3:
> >>>>> - Split from previous patch
> >>>>> - Initialized hdisplay as uncompressed pclk per line at the beginning of
> >>>>>     dsi_timing_setup as to not break dual DSI calculations
> >>>>>
> >>>>> Changes in v4:
> >>>>> - Moved pclk_per_intf calculations to DSC hdisplay adjustments
> >>>>>
> >>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>> ---
> >>>>>    drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
> >>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >>>>> index 508577c596ff..ae966d4e349d 100644
> >>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> >>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >>>>> @@ -952,7 +952,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> >>>>>    		 * pulse width same
> >>>>>    		 */
> >>>>>    		h_total -= hdisplay;
> >>>>> -		hdisplay /= 3;
> >>>>> +		hdisplay = msm_dsc_get_pclk_per_intf(msm_host->dsc) / 3;
> >>>>
> >>>> This patch is unfortunately regressing the Sony Xperia XZ3 (sdm845,
> >>>> single DSI), which will only show garbage when it is applied.
> >>>>
> >>>> Are you sure this is correct, and the helper is returning the right
> >>>> values?  I'll see if I can help review and validate those later, and
> >>>> debug if necessary.
> >>>>
> >>>> - Marijn
> >>>
> >>> To help us debug these kind of issues, can you pls point us to your
> >>> panel driver?
> >>
> >> https://github.com/SoMainline/linux/commit/b154ea72e6c2ca0d4a33a28cc24e3a762dba4948
> > 
> > I found the fix myself after piecing together the hints provided across
> > the many different patch series.  This panel driver assigns
> > slice_count=1 based on downstream's qcom,mdss-dsc-slice-per-pkt = <1>,
> > but as per the many slice_count-related fixes the latter DT parameter is
> > a QCOM-specific hardware feature, whereas slice_count is simply the
> > number of slices per line.
> > 
> > Since a line is a scanline, and that panel has a width of hdisplay=1440
> > and a slice_width of 720, the number of slices spanning a line is simply
> > slice_count=hdisplay/slice_width=2.  This makes the panel work again
> > atop the four-or-so-series without a revert of this patch.
> > 
> > Is it a big ask to request a single, coherent series fixing all uses of
> > slice_count - and implementing support for slice-per-pkt - instead of
> > having the patches spread across multiple series?  That makes it much
> > easier to cover ground here and review this series, as slice_count seems
> > to be used everywhere where downstream used slice_per_pkt - even I
> > mistakenly used it after assuming it was the same based on the original
> > patches.
> 
> Hi Marijn,
> 
> Just want to document the changes we agreed on regarding the slice_count 
> fixes:
> 
> I will move "drm/msm/dsi: Fix calculation for pkt_per_line" to the "Add 
> DSC v1.2 Support for DSI" series so that all the 
> slice_count/slice_per_pkt fixes are consolidated.
> 
> In addition I will also add a patch in "Add DSC v1.2 Support for DSI" to 
> remove the incorrect `dsc->slice_count = 1` line in dsi_update_dsc_timing().

That sounds good, but be sure to check two things:

- Can we squash some of the patches?
- Can we make the wording and title consistent?

That goes a long way in understanding that the patches in question are
addressing the same "wrong use of dsc->slice_count because it was
thought to be equal to slice_per_pkt" issue.

- Marijn
