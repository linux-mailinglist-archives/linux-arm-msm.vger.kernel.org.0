Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E081705ABE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 May 2023 00:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbjEPWqH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 18:46:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbjEPWqH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 18:46:07 -0400
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04F5DC5
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 15:46:04 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id DA7BB202E3;
        Wed, 17 May 2023 00:46:01 +0200 (CEST)
Date:   Wed, 17 May 2023 00:45:59 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH v10 8/8] drm/msm/dsi: update hdisplay
 calculation for dsi_timing_setup
Message-ID: <45htnhfupwmiiuxy53osahrd6lpaz4my2apbqhxw6uuwlq5vxl@qhvf6guwk3np>
References: <20230329-rfc-msm-dsc-helper-v10-0-4cb21168c227@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v10-8-4cb21168c227@quicinc.com>
 <5jqvxyy7ixfpwzepgseqwwz5elyn2qhxa4qdwhxcw7xbkvle4l@rijv4uq5wsb7>
 <43a07bc1-d758-242a-7017-f566daadc35c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43a07bc1-d758-242a-7017-f566daadc35c@quicinc.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-16 11:18:17, Jessica Zhang wrote:
> On 5/14/2023 2:29 PM, Marijn Suijten wrote:
> > On 2023-05-12 14:32:18, Jessica Zhang wrote:
> >>
> >> hdisplay for compressed images should be calculated as bytes_per_slice *
> >> slice_count. Thus, use MSM DSC helper to calculate hdisplay for
> >> dsi_timing_setup instead of directly using mode->hdisplay.
> > 
> > As mentioned in review on an earlier revision, is there any sort of
> > clarification you can provide here to explain the cases where
> > hdisplay!=bytes_per_line?  That goes a long way towards justifying this
> > change.  Thanks!
> 
> Hi Marijn,
> 
> Sorry for not responding to this in the earlier revision, I think I 
> missed the original comment.
> 
> Please correct me if I'm wrong, but I'm guessing the question here is 
> why we can't keep the hdisplay adjustment as `hdisplay /= 3` and have to 
> go out of our way to recalculate hdisplay before doing the `/ 3`.
> 
> This is because the original adjustment only works for BPP = 8. By using 
> the msm_dsc_get_bytes_per_line() here, we can generalize this adjustment 
> to work for cases where BPP != 8.

I am fully aware that the original computation only works for BPP=8 and
even mentioned so in v7 review [1].  The question / request is instead
to include such context in your commit message, rather than the
nondescriptive "should be calculated as" -> who says that and why?
Stating that the current approach was only working for BPP=8 (hence why
currently tested panels are working fine) but that this isn't a
long-term solution if we starts upporting other BPP is a proper
justification to make this change.

[1]: https://lore.kernel.org/linux-arm-msm/ju7647tlogo25fnhswgp7zn67syvsjy2ldjugvygh3z4rxtdrx@kb76evjvulgw/

> Thanks,

Thanks for looking into improving this!

- Marijn
