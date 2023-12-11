Return-Path: <linux-arm-msm+bounces-4277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB85680DD68
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 22:43:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A64CF2813DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 21:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3466351010;
	Mon, 11 Dec 2023 21:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XZDK8IbF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50D89D0
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 13:42:53 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5e176babd4eso7611697b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 13:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702330972; x=1702935772; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DLp53bQ81f9gTNP0ce9syP67cX2Q/gFvgHzh0s16PlE=;
        b=XZDK8IbFtkO4COAD/6F7jLEvKG7N6/uDqVAOFsfLNn386FCfzrmxtLz4nVsFI+FUlv
         Kc0BlhUNYXJFdm3Tn9SFejCg8TA2zAkuEtLKduVF55X9odRMHjesPEO6bP1zCXztSiHR
         k9D7tkraO+aqzmRwRXP42Ff0qKoteKiakChM0O53fyKnF7YyI+1N0a0g2a7WVoPVstHd
         eesFKhPgCYckaQ4/ygJ2O0aHLRJvp6a5TG3KZkpWP4KufW83KO+vUtlXmxFkhZYrPhy+
         IKxnnS1dfBucxLqmSzZqchRpyyWIrs+y6Fr4da4XlOwskyWf1pHcFhJZKT/MAK89D9+B
         kayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702330972; x=1702935772;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DLp53bQ81f9gTNP0ce9syP67cX2Q/gFvgHzh0s16PlE=;
        b=VWxOg7AoKNMkYfbv0D4WG3CQmXVauHR6Nh0tsiCcmBa3bGmXY2s+uKtw1IH5HrsnzA
         VzrmhqS476wQxbM+3Y4RYng5DN6NqG3oImMb8pdmfhgXxwlbIj1DmURwP+Rk+5s3F6UA
         Px2sO2EpKhECXHOkxFAWRYicGxPUu0782liMRg4C+eEJNA9R+bCDzXcgj0E81tmRht+4
         +TSjOon4pU95XKDvj7Q11BYPifsDFZ9NoSAzKbt2gdp8/lf9+lh43+QjwNWApmjyBIPE
         fiQfQrWC6k+7FMXCwSHmFUvkyStBSeUFrsU4wf3GahAe6vYHmYlFsq1qU53DYjO1w3qx
         KGAw==
X-Gm-Message-State: AOJu0Yy0Za5wu+2hP3e4AwF+wIDkHf5/uFaZUk7cnSlYJnALDqTR794K
	LVqSj2lvLSS0vLsSUgQNm99vdrV0Epi37vvWoMPWuA==
X-Google-Smtp-Source: AGHT+IHHQ40+f6LzN6SmeJ75xENMSk7aPxDwwYgY2NFMeU22ys073FfQT4ocApqCXGb2i7ujsukxT5ICJRsRiSBRfhA=
X-Received: by 2002:a81:7b05:0:b0:5d7:1940:53cd with SMTP id
 w5-20020a817b05000000b005d7194053cdmr4072587ywc.69.1702330972489; Mon, 11 Dec
 2023 13:42:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
 <20231208050641.32582-6-quic_abhinavk@quicinc.com> <CAA8EJprR92=TRvYNu1dSTUcphUu3v-cD326AK2+80Ex8ppYBBw@mail.gmail.com>
 <4966bfa0-ef50-a02d-a917-86d82429e45e@quicinc.com> <CAA8EJpqu42b0AP8Ar2LoFcrS51iKTUM1Qr++j7MYjv4WCx=tCg@mail.gmail.com>
 <e9634306-dbc4-fe5d-3227-321a492c73cb@quicinc.com>
In-Reply-To: <e9634306-dbc4-fe5d-3227-321a492c73cb@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Dec 2023 23:42:41 +0200
Message-ID: <CAA8EJpq9RPi0q8LBytW=E+H2WWX2T9ShQe6zzzCSCwn1t12FGA@mail.gmail.com>
Subject: Re: [PATCH v2 05/16] drm/msm/dpu: add cdm blocks to sc7280 dpu_hw_catalog
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Rob Clark <robdclark@gmail.com>, quic_parellan@quicinc.com, 
	Daniel Vetter <daniel@ffwll.ch>, quic_jesszhan@quicinc.com, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Dec 2023 at 23:32, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/11/2023 1:31 PM, Dmitry Baryshkov wrote:
> > On Mon, 11 Dec 2023 at 23:16, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 12/8/2023 3:19 AM, Dmitry Baryshkov wrote:
> >>> On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>>>
> >>>> Add CDM blocks to the sc7280 dpu_hw_catalog to support
> >>>> YUV format output from writeback block.
> >>>>
> >>>> changes in v2:
> >>>>           - remove explicit zero assignment for features
> >>>>           - move sc7280_cdm to dpu_hw_catalog from the sc7280
> >>>>             catalog file as its definition can be re-used
> >>>>
> >>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>>> ---
> >>>>    .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h  |  1 +
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c      | 10 ++++++++++
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h      | 13 +++++++++++++
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h         |  5 +++++
> >>>>    4 files changed, 29 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> >>>> index 209675de6742..19c2b7454796 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> >>>> @@ -248,6 +248,7 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg = {
> >>>>           .mdss_ver = &sc7280_mdss_ver,
> >>>>           .caps = &sc7280_dpu_caps,
> >>>>           .mdp = &sc7280_mdp,
> >>>> +       .cdm = &sc7280_cdm,
> >>>>           .ctl_count = ARRAY_SIZE(sc7280_ctl),
> >>>>           .ctl = sc7280_ctl,
> >>>>           .sspp_count = ARRAY_SIZE(sc7280_sspp),
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>> index d52aae54bbd5..1be3156cde05 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>> @@ -426,6 +426,16 @@ static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
> >>>>           .ctl = {.name = "ctl", .base = 0xF80, .len = 0x10},
> >>>>    };
> >>>>
> >>>> +/*************************************************************
> >>>> + * CDM sub block config
> >>>
> >>> Nit: it is not a subblock config.
> >>>
> >>
> >> Ack.
> >>
> >>>> + *************************************************************/
> >>>> +static const struct dpu_cdm_cfg sc7280_cdm = {
> >>>
> >>> I know that I have r-b'ed this patch. But then one thing occurred to
> >>> me. If this definition is common to all (or almost all) platforms, can
> >>> we just call it dpu_cdm or dpu_common_cdm?
> >>>
> >>>> +       .name = "cdm_0",
> >>>> +       .id = CDM_0,
> >>>> +       .len = 0x228,
> >>>> +       .base = 0x79200,
> >>>> +};
> >>
> >> hmmm .... almost common but not entirely ... msm8998's CDM has a shorter
> >> len of 0x224 :(
> >
> > Then sdm845_cdm?
> >
>
> That also has a shorter cdm length.

Could you please clarify. According to the downstream DT files all CDM
blocks up to (but not including) sm8550 had length 0x224. SM8550 and
SM8650 got qcom,sde-cdm-size = <0x220>.  But I don't see any registers
after 0x204.
>
> BTW, sdm845 is not in this series. It will be part of RFT as we discussed.
>
> >>
> >>>> +
> >>>>    /*************************************************************
> >>>>     * VBIF sub blocks config
> >>>>     *************************************************************/
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>>> index e3c0d007481b..ba82ef4560a6 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>>> @@ -682,6 +682,17 @@ struct dpu_vbif_cfg {
> >>>>           u32 memtype[MAX_XIN_COUNT];
> >>>>    };
> >>>>
> >>>> +/**
> >>>> + * struct dpu_cdm_cfg - information of chroma down blocks
> >>>> + * @name               string name for debug purposes
> >>>> + * @id                 enum identifying this block
> >>>> + * @base               register offset of this block
> >>>> + * @features           bit mask identifying sub-blocks/features
> >>>> + */
> >>>> +struct dpu_cdm_cfg {
> >>>> +       DPU_HW_BLK_INFO;
> >>>> +};
> >>>> +
> >>>>    /**
> >>>>     * Define CDP use cases
> >>>>     * @DPU_PERF_CDP_UDAGE_RT: real-time use cases
> >>>> @@ -805,6 +816,8 @@ struct dpu_mdss_cfg {
> >>>>           u32 wb_count;
> >>>>           const struct dpu_wb_cfg *wb;
> >>>>
> >>>> +       const struct dpu_cdm_cfg *cdm;
> >>>> +
> >>>>           u32 ad_count;
> >>>>
> >>>>           u32 dspp_count;
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >>>> index a6702b2bfc68..f319c8232ea5 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >>>> @@ -185,6 +185,11 @@ enum dpu_dsc {
> >>>>           DSC_MAX
> >>>>    };
> >>>>
> >>>> +enum dpu_cdm {
> >>>> +       CDM_0 = 1,
> >>>> +       CDM_MAX
> >>>> +};
> >>>> +
> >>>>    enum dpu_pingpong {
> >>>>           PINGPONG_NONE,
> >>>>           PINGPONG_0,
> >>>> --
> >>>> 2.40.1
> >>>>
> >>>
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry

