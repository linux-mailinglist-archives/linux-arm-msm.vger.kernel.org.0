Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0776772B43D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jun 2023 23:59:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbjFKV7U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Jun 2023 17:59:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjFKV7T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Jun 2023 17:59:19 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D8D5E48;
        Sun, 11 Jun 2023 14:59:18 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 08BCE1F5D4;
        Sun, 11 Jun 2023 23:59:16 +0200 (CEST)
Date:   Sun, 11 Jun 2023 23:59:14 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        David Airlie <airlied@gmail.com>
Subject: Re: [Freedreno] [PATCH v5 2/5] drm/msm/dsi: Adjust pclk rate for
 compression
Message-ID: <kog3nvgfcjsm2blpcjmxq7gyt2qhcka4d74jcklry75iegcvyu@n22kznezfehq>
References: <20230405-add-dsc-support-v5-0-028c10850491@quicinc.com>
 <20230405-add-dsc-support-v5-2-028c10850491@quicinc.com>
 <js3mcglahq53mcyxa6deltjlu4xpc2pnafwz2rbk3dl4ovws2o@5xw2wzvfaj2v>
 <f63435ca-933a-52be-d879-1d9cc9441107@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f63435ca-933a-52be-d879-1d9cc9441107@quicinc.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-08 17:56:47, Jessica Zhang wrote:
<snip>
> > As discussed before we realized that this change is more-or-less a hack,
> > since downstream calculates pclk quite differently - at least for
> > command-mode panels.  Do you still intend to land this patch this way,
> > or go the proper route by introducing the right math from the get-go?
> > Or is the math at least correct for video-mode panels?
> 
> Sorry but can you please clarify what exactly is incorrect or different 
> about this math when compared to downstream? And, if you think that this 
> math is incorrect, what exactly has to be changed to make it the "right 
> math"?
> 
> We've already shown step-by-step [1] not only how the resulting pclk 
> from the downstream code matches out upstream calculations, but also how 
> the inclusion of porches in the upstream math would make up for the fact 
> that upstream has no concept of transfer time [2].

But it doesn't match, unless one hardcodes the desired clock (and/or
tranfer_time calculations) in a panel driver and uses that to come up
with artificial porches in the DRM mode.

> If the lack of transfer time in the upstream math is the issue, I 
> believe that that's not within the scope of this series, as transfer 
> time is not something specific to DSC.

Yes, that is the issue, and there is zero documentation in this patch
describing that it is currently a workaround to rescale the hdisplay
portion.

After all, when there are no porches pretending to make up for the lack
of transfer time, this code will be obsolete.

> Moreover, as stated in an earlier revision [3], there is no way to 
> validate DSC over DSI for video mode. As far as I know, we do not have a 
> way to validate video mode datapath for DSI in general.

It was just a question wheter a calculation of this form is correct for
video mode, where porches are used and not - afaik - tranfer time?

> [1] https://gitlab.freedesktop.org/drm/msm/-/issues/24#note_1936144
> [2] https://gitlab.freedesktop.org/drm/msm/-/issues/24#note_1945792
> [3] 
> https://patchwork.freedesktop.org/patch/535117/?series=117219&rev=1#comment_970492
> 
> > 
> > This function requires a documentation comment to explain that all.
> > 
> >> +		const struct drm_dsc_config *dsc)
> >> +{
> >> +	int new_hdisplay = DIV_ROUND_UP(mode->hdisplay * drm_dsc_get_bpp_int(dsc),
> > 
> > This sounds like a prime candidate for msm_dsc_get_bytes_per_line(), if
> > bits_per_component==8 is assumed.  In fact, it then becomes identical
> > to the following line in dsi_host.c which you added previously:
> > 
> > 	hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
> > 
> > If not, what is the difference between these two calculations?  Maybe
> > they both need to be in a properly-named helper.
> 
> While the math technically matches up (assuming, also, that 
> mode->hdisplay == slice_width * slice_count for all cases), there are 
> conceptual differences between the pclk and hdisplay calculations.
> 
> Just to reiterate what was already said on IRC:
> 
> In the pclk calculation, we're multiplying pclk by the compression ratio 
> (which would be target_bpp / src_bpp) -- please note that here, we 
> calculate src_bpp by doing bpc * 3.
> 
> In the hdisplay calculation, we calculate the bytes per line and divide 
> by 3 (bytes) to account for the fact that we can only process 3 bytes 
> per pclk cycle.

Your comment in v6 explains that hdisplay is divided by 3 because "DPU
sends 3 bytes per pclk cycle to DSI".  That inherently describes **a
relation between hdisplay and pclk** so why is the math then different?
After all, pclk is calculated based on the number of bytes (after DSC
compression) that need to be sent from DPU to DSI... and that has
nothing to do with the number of source bytes.

Note that the original hdisplay neither has any notion of bytes: it is
the _number of horizontal pixels_.

> So while I understand why you would want to put this behind a shared 
> helper, I think abstracting the pclk and hdisplay math away would 
> obfuscate the conceptual difference between the 2 calculations.

That difference is still unclear, FWIW.

> >> +			dsc->bits_per_component * 3);

And bits_per_component hasn't been used before yet... It is the number
of bits in the original image, so this could just be dsi_get_bpp() as
used elsewhere?

> > 
> > As we established in the drm/msm issue [2] there is currently a
> > confusion whether this /3 (and the /3 in dsi_timing_setup) come from the
> > ratio between dsi_get_bpp() and dsc->bpp or something else.  Can you
> > clarify that with constants and comments?
> 
> Sure, we are planning to add a patch to the end of this series 
> documenting the math.

Why can't you - at least for the new math introduced right here -
document it right from the get-go?  Having a separate patch to add it
seems extraneous; though extra documentation for existing code is always
welcome.

- Marijn

<snip>
