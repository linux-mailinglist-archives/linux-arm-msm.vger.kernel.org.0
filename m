Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F67264D01A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Dec 2022 20:32:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238944AbiLNTb7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Dec 2022 14:31:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238502AbiLNTbt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Dec 2022 14:31:49 -0500
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60CF9186CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 11:31:48 -0800 (PST)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl [94.209.172.39])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 80F2B1F541;
        Wed, 14 Dec 2022 20:31:45 +0100 (CET)
Date:   Wed, 14 Dec 2022 20:31:44 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jani Nikula <jani.nikula@intel.com>,
        sunliming <sunliming@kylinos.cn>,
        Sam Ravnborg <sam@ravnborg.org>,
        Haowen Bai <baihaowen@meizu.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 6/6] drm/msm/dpu: Disallow unallocated (DSC)
 resources to be returned
Message-ID: <20221214193144.to6yk5tr46akfy5m@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jani Nikula <jani.nikula@intel.com>,
        sunliming <sunliming@kylinos.cn>, Sam Ravnborg <sam@ravnborg.org>,
        Haowen Bai <baihaowen@meizu.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221213232207.113607-1-marijn.suijten@somainline.org>
 <20221213232207.113607-7-marijn.suijten@somainline.org>
 <4b7b4fb0-b99b-1022-b0f6-e91a84e8d082@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b7b4fb0-b99b-1022-b0f6-e91a84e8d082@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-12-14 20:56:30, Dmitry Baryshkov wrote:
> On 14/12/2022 01:22, Marijn Suijten wrote:
> > In the event that the topology requests resources that have not been
> > created by the system (because they are typically not represented in
> > dpu_mdss_cfg ^1), the resource(s) in global_state (in this case DSC
> > blocks) remain NULL but will still be returned out of
> > dpu_rm_get_assigned_resources, where the caller expects to get an array
> > containing num_blks valid pointers (but instead gets these NULLs).
> > 
> > To prevent this from happening, where null-pointer dereferences
> > typically result in a hard-to-debug platform lockup, num_blks shouldn't
> > increase past NULL blocks and will print an error and break instead.
> > After all, max_blks represents the static size of the maximum number of
> > blocks whereas the actual amount varies per platform.
> > 
> > In the specific case of DSC initial resource allocation should behave
> > more like LMs and CTLs where NULL resources are skipped.  The current
> > hardcoded mapping of DSC blocks should be loosened separately as DPU
> > 5.0.0 introduced a crossbar where DSC blocks can be "somewhat" freely
> > bound to any PP and CTL, but that hardcoding currently means that we
> > will return an error when the topology reserves a DSC that isn't
> > available, instead of looking for the next free one.
> > 
> > ^1: which can happen after a git rebase ended up moving additions to
> > _dpu_cfg to a different struct which has the same patch context.
> > 
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > index 73b3442e7467..dcbf03d2940a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > @@ -496,6 +496,11 @@ static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> >   
> >   	/* check if DSC required are allocated or not */
> >   	for (i = 0; i < num_dsc; i++) {
> > +		if (!rm->dsc_blks[i]) {
> > +			DPU_ERROR("DSC %d does not exist\n", i);
> > +			return -EIO;
> > +		}
> > +
> >   		if (global_state->dsc_to_enc_id[i]) {
> >   			DPU_ERROR("DSC %d is already allocated\n", i);
> >   			return -EIO;
> > @@ -660,6 +665,11 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
> >   				  blks_size, enc_id);
> >   			break;
> >   		}
> > +		if (!hw_blks[i]) {
> > +			DPU_ERROR("No more resource %d available to assign to enc %d\n",
> > +				  type, enc_id);
> > +			break;
> > +		}
> >   		blks[num_blks++] = hw_blks[i];
> >   	}
> >  
> 
> These two chunks should come as two separate patches, each having it's 
> own Fixes tag.

Ack.  They are indeed addressing different issues (with the same
outcome) with differing "backportability".  Will address in v2, thanks
for pointing it out (and missing a Fixes: in the first place, of which
we already have so many...).

- Marijn
