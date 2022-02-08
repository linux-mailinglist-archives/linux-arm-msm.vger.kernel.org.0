Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ECA54AE35E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Feb 2022 23:23:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386965AbiBHWWC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Feb 2022 17:22:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386924AbiBHVV7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Feb 2022 16:21:59 -0500
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 941CEC0612BA
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Feb 2022 13:21:58 -0800 (PST)
Received: by mail-oo1-xc36.google.com with SMTP id p190-20020a4a2fc7000000b0031820de484aso159290oop.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Feb 2022 13:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=G+16pFLyoDjUk+Y4RyeEFgCd+ZLbIuV/huyW3D4ToLM=;
        b=pqHdCkcx0F7v7R1xaCV98jjODFOBkFoEnhEWcvskdzHws4NXwd3J0gxbK+C/RFybcw
         b9efcOJ0wQm/skfsuWvaBXxlDmyc6Xj9z9re0sE/X/nxs7Th/io7WM5pCnjIQzgPdAEd
         4gU0LvZZ9yusrgKQul4g85O8DmZCsszKhNE+cjAFrDfAV8D+E2a7cMQ6JeeQ48Y3RWVf
         mYZitpw7ejIuuATswWfsFC+mg5FHwB902JS+HKX6HuC1mWs+vsOTeHkNK/nGpw0YmwdN
         aOVMXaunHl8585yj99v5cZdaZInOKczzgPiv3VMi+xm3Q5kvryp1egmpmQsOVlADhWQE
         91KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=G+16pFLyoDjUk+Y4RyeEFgCd+ZLbIuV/huyW3D4ToLM=;
        b=q5MWIeK/ghZv+LHRlt8nhn8zx9+pLkkmkhvscZ1/kX5uqN9QCRD7gu2kL0t92oyDWg
         s8YoZg7mD/BY7z3qUvCaFXBvuyBAc/NS4034P9PwFT+/4BNsZpvniCIfRj/0OULHvKWU
         gZ8GhiDTqDaoUT8C4a0UWdkZd/gM/Jbal2ClE3WP2duNN5rKzZuA3aU+M8CcBv44SNdC
         eQS1W2VtpS7JwZJxQQYTI6xBlWbCkZwjWlXOQSU2L/W2RwlsWXSFx8XanxAIw+4qDJzl
         1v9yPqHWkfWpz4fiIjC4U/KnjojyZFMqVcgTQHnoIyORnKSizh7ieqWKh/epIK0L1Gxv
         Yv5w==
X-Gm-Message-State: AOAM533FW3H9TMEvVAXg8d4Zkkv2IJOgeLI152vN4T0H4Xu7fDWYPqAR
        mc5tonloms75lVQgfle0U3nzu9V2vic4Xg==
X-Google-Smtp-Source: ABdhPJwiQWSyP6fnaWDrhUVfiCiTGOPN0N5YxVLMDgEZSyjmDyKQCDgO4ODxz4etyu3+zg0YFk8UHA==
X-Received: by 2002:a05:6870:118c:: with SMTP id 12mr1002048oau.93.1644355317946;
        Tue, 08 Feb 2022 13:21:57 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id l22sm5823162otj.44.2022.02.08.13.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 13:21:57 -0800 (PST)
Date:   Tue, 8 Feb 2022 13:24:15 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: Add DisplayPort controller for SM8350
Message-ID: <YgLff2ZFjEN3I3M2@ripper>
References: <20211228045934.1524865-1-bjorn.andersson@linaro.org>
 <176fb0bc-2f09-df3b-86be-ef69b8e6cea8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176fb0bc-2f09-df3b-86be-ef69b8e6cea8@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 19 Jan 15:14 PST 2022, Dmitry Baryshkov wrote:

> On 28/12/2021 07:59, Bjorn Andersson wrote:
> > The Qualcomm SM8350 platform comes with a single DisplayPort controller,
> > add support for this in the DisplayPort driver.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

I don't see this in linux-next, would it be possible to pick it up now
that we're past the merge window etc?

Regards,
Bjorn

> > ---
> >   .../devicetree/bindings/display/msm/dp-controller.yaml    | 1 +
> >   drivers/gpu/drm/msm/dp/dp_display.c                       | 8 ++++++++
> >   2 files changed, 9 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > index 5457612ab136..cd05cfd76536 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > @@ -21,6 +21,7 @@ properties:
> >         - qcom,sc7280-edp
> >         - qcom,sc8180x-dp
> >         - qcom,sc8180x-edp
> > +      - qcom,sm8350-dp
> >     reg:
> >       items:
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index 8d9c19dbf33e..fd0fd03f8fed 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -143,10 +143,18 @@ static const struct msm_dp_config sc7280_dp_cfg = {
> >   	.num_descs = 2,
> >   };
> > +static const struct msm_dp_config sm8350_dp_cfg = {
> > +	.descs = (const struct msm_dp_desc[]) {
> > +		[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> > +	},
> > +	.num_descs = 1,
> > +};
> > +
> >   static const struct of_device_id dp_dt_match[] = {
> >   	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
> >   	{ .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_cfg },
> >   	{ .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_cfg },
> > +	{ .compatible = "qcom,sm8350-dp", .data = &sm8350_dp_cfg },
> >   	{}
> >   };
> 
> 
> -- 
> With best wishes
> Dmitry
