Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05177710289
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 May 2023 03:48:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbjEYBsN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 May 2023 21:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbjEYBsM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 May 2023 21:48:12 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88DEB132
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 18:48:10 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-565014fc2faso345947b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 18:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684979289; x=1687571289;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jlwu/WPJmxOj9L+yA1aXSfrQUf7SXlXj3SObiQNErpo=;
        b=lHgGeXeVBjoCyf8DKMtxcH8WgNUtTA9OrJws/uhQSZQluYcb1RK1Gh2YfD19nqsr5u
         OvM7aht2ZaPJPPNrvlBEQBKM5u/LSbHtUfBZglKUWft9o3YM8TGEm/dTuYKoHFXiPKM8
         +Lgclvo+c5GgsVzfhIsJjno1HpaaMCDsepz/NJ8kH80gsvi/mMDAVMliV8yN0UFP5fPp
         mRvMa/VdDTffQJXCrMoFrPWddp2gv7aU1l2LsyezQwHaVgEtSrYDD1d1liJ1Bd5+JkBM
         DrJf6WFO/1mwxCI1/DW2XjUFl7ngGkkXTd1XMbAMv6NW7IckWxVVgDBXcz6bzbEH1aoX
         im5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684979289; x=1687571289;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jlwu/WPJmxOj9L+yA1aXSfrQUf7SXlXj3SObiQNErpo=;
        b=l8cRdLaHVrPeQdfhcX+OZqwdVMISwBWSWCSjq6RMSFcqfioPgPgtCWB8pm1egDRKoo
         duMprhysW2VJz12IYh2HI0Mw8uZv02vnpIdnu7aBD9ZutsohBNgESbxeljoRBzV1OSXf
         HkaYtT/nug8s6oLkXiKW4N36MBOwc89wPw6U/RMZTnS+80st97yPu7+i2elrIcqh3qNI
         bwdxVl0V1ZhPM+f+O11sRAQNnGcclfjfXAeZ1j12Ik9S6IeZyz3AsjfYqDXzxjyWy6St
         FbL2cW0NIShUVIoZQUz0OPRaNJV+nv8+zpH9yZyT52ZnpWyHELQ/hBUcaHzwqQsd3ms6
         gUEw==
X-Gm-Message-State: AC+VfDxSc/kB6/JfE2FPy+bjfxdd3hOTGtUDZnPlcM5f/hf27q4ALs4R
        VGlHaK6fH0knnFglkwgFMDZSKMZs4UJ9/kitUZzLyKIS4cFuhoMX
X-Google-Smtp-Source: ACHHUZ5ILwtqfpuUpq8JmFBXm7eQb9r53tgdt9k8Ljb4MZxKaEHsNYvUpCyd2eKrpkOpxFZZDLmGWx0MF7BrMF2mo2k=
X-Received: by 2002:a81:e949:0:b0:561:206a:ee52 with SMTP id
 e9-20020a81e949000000b00561206aee52mr23588113ywm.24.1684979289768; Wed, 24
 May 2023 18:48:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-12-dmitry.baryshkov@linaro.org> <9142b3b4-9f19-d187-ac06-4db9780ba194@quicinc.com>
In-Reply-To: <9142b3b4-9f19-d187-ac06-4db9780ba194@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 25 May 2023 04:47:58 +0300
Message-ID: <CAA8EJpr_v0xAhZWRaW4EsOZ1WRRoMu6aBBQ5izFohR7OFHfcow@mail.gmail.com>
Subject: Re: [RFC PATCH v2 11/13] drm/msm/dpu: add a field describing inline
 rotation to dpu_caps
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 25 May 2023 at 02:20, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
> > We need to know if the platform supports inline rotation on any of the
> > SSPP blocks or not. Add this information to struct dpu_caps in a form of
> > the boolean field has_inline_rot.
> >
>
> So even for this one, will a helper to detect it from the list of sspps
> be better?
>
> We are now duplicating information from sspp to dpu caps for convenience
> and nothing wrong with it if the helper will get called like every
> atomic check .
>
> But looking at the next patch, it seems we use this information only
> once during dpu_plane_init(), so why not add a helper to find this out?

Sure, why not.

>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
> >   2 files changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > index 2d6944a9679a..33527ec7c938 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > @@ -489,6 +489,7 @@ static const struct dpu_caps sc7280_dpu_caps = {
> >       .ubwc_version = DPU_HW_UBWC_VER_30,
> >       .has_dim_layer = true,
> >       .has_idle_pc = true,
> > +     .has_inline_rot = true,
> >       .max_linewidth = 2400,
> >       .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> >       .format_list = plane_formats_yuv,
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > index 4847aae78db2..cc64fb2e815f 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > @@ -400,6 +400,7 @@ struct dpu_rotation_cfg {
> >    * @has_dim_layer      dim layer feature status
> >    * @has_idle_pc        indicate if idle power collapse feature is supported
> >    * @has_3d_merge       indicate if 3D merge is supported
> > + * @has_inline_rot     indicate if inline rotation is supported
> >    * @max_linewidth      max linewidth for sspp
> >    * @pixel_ram_size     size of latency hiding and de-tiling buffer in bytes
> >    * @max_hdeci_exp      max horizontal decimation supported (max is 2^value)
> > @@ -416,6 +417,7 @@ struct dpu_caps {
> >       bool has_dim_layer;
> >       bool has_idle_pc;
> >       bool has_3d_merge;
> > +     bool has_inline_rot;
> >       /* SSPP limits */
> >       u32 max_linewidth;
> >       u32 pixel_ram_size;



-- 
With best wishes
Dmitry
