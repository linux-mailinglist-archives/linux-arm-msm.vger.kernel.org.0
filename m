Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 800B575250C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 16:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231596AbjGMOTw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jul 2023 10:19:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231845AbjGMOTj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jul 2023 10:19:39 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 70FD230FE
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 07:18:58 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8ABA1576
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 07:19:40 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 050923F73F
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 07:18:57 -0700 (PDT)
Date:   Thu, 13 Jul 2023 15:18:37 +0100
From:   Liviu Dudau <liviu.dudau@arm.com>
To:     cuigaosheng <cuigaosheng1@huawei.com>
Cc:     airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
        sean@poorly.run, marijn.suijten@somainline.org,
        neil.armstrong@linaro.org, sam@ravnborg.org,
        quic_eberman@quicinc.com, a39.skl@gmail.com,
        quic_gurus@quicinc.com, angelogioacchino.delregno@somainline.org,
        james.qian.wang@arm.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 3/3] drm/komeda: Fix IS_ERR() vs NULL check in
 komeda_component_get_avail_scaler()
Message-ID: <ZLAHvSw31SdR_WjC@e110455-lin.cambridge.arm.com>
References: <20230713020556.1956639-1-cuigaosheng1@huawei.com>
 <20230713020556.1956639-4-cuigaosheng1@huawei.com>
 <ZK-72h3fVj6PlGB0@e110455-lin.cambridge.arm.com>
 <c37832f4-9957-1d7e-01f9-ee7fbdf569a1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c37832f4-9957-1d7e-01f9-ee7fbdf569a1@huawei.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 13, 2023 at 05:51:34PM +0800, cuigaosheng wrote:
> Thanks for taking time to review this patch.
> 
> Maybe we can submit another separate patch to fix ERR_CAST(st), because I'm not
> sure which commit should be used as a fixes-tag.
> 
> Also, Maybe we should fix ERR_CAST(st) in komeda_pipeline_get_state_and_set_crtc()
> and komeda_component_get_state_and_set_user(), please make another separate patch.

Yeah, you're right, there are other places where this needs to be fixed.

I will add this to my list of ToDos.

Best regards,
Liviu

> 
> Let me know if there's anything I can do, thanks for your work again!
> 
> Gaosheng,
> 
> On 2023/7/13 16:54, Liviu Dudau wrote:
> > Hello,
> > 
> > On Thu, Jul 13, 2023 at 10:05:56AM +0800, Gaosheng Cui wrote:
> > > The komeda_pipeline_get_state() returns an ERR_PTR() on failure, we should
> > > use IS_ERR() to check the return value.
> > While reviewing the change I've realised that komeda_pipeline_get_state_and_set_crtc()
> > is also mishandling the return value from komeda_pipeline_get_state(). If IS_ERR(st) is
> > true it should use return ERR_CAST(st), following the same pattern as komeda_pipeline_get_state().
> > 
> > If you don't want to update this patch I can send a separate patch. Otherwise,
> > the change looks good to me.
> > 
> > Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> > 
> > Best regards,
> > Liviu
> > 
> > 
> > > Fixes: 502932a03fce ("drm/komeda: Add the initial scaler support for CORE")
> > > Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> > > ---
> > >   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
> > > index 3276a3e82c62..e9c92439398d 100644
> > > --- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
> > > +++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
> > > @@ -259,7 +259,7 @@ komeda_component_get_avail_scaler(struct komeda_component *c,
> > >   	u32 avail_scalers;
> > >   	pipe_st = komeda_pipeline_get_state(c->pipeline, state);
> > > -	if (!pipe_st)
> > > +	if (IS_ERR(pipe_st))
> > >   		return NULL;
> > >   	avail_scalers = (pipe_st->active_comps & KOMEDA_PIPELINE_SCALERS) ^
> > > -- 
> > > 2.25.1
> > > 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
