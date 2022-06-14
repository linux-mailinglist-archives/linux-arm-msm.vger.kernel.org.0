Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2733454B3BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jun 2022 16:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237979AbiFNOpc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jun 2022 10:45:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239140AbiFNOpa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jun 2022 10:45:30 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C46125298
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jun 2022 07:45:29 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id h23so17603238ejj.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jun 2022 07:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+D/vqYB8YvehXc7GqzBQjiiL9nC2qcfB3y+YKYyVmYU=;
        b=F0EExpl6jLducS55fUN/79dBHu1WLDM1aOqdFAqCbqoSuqRMOj7nuU0vfmQRDSMYyX
         9weOu3ZY2rwab4lJhNwnDPJDYJCJRHvfIihuAv2icLQ491l3NNIyZKkTa/kgCwjPyT5I
         tn65/DKWaAdrF/isE2+eEXmC4l83RQnX1Xwdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+D/vqYB8YvehXc7GqzBQjiiL9nC2qcfB3y+YKYyVmYU=;
        b=0V/DeJGq9EZY4G0jT335TAEFU1FHzFERLg29QJKqAqV/ZomnP2UwcI6/t1mGwbuzgR
         LWIoT0W51rEUuMdHskOtOgi6L4BBSRAMRQp4r7rc3zDoypXxYaATB4So5JcEYEpqPBo+
         NWGHwqMsM2j/EqT9Ex1ZuJC3sU1JNZv9+wUqpbQTfyNlatp3qGm2OftJNDFMdM0CEopt
         cc+Nbini+q+MuNPhNU3h50DzuCkDE52IwNIlpUQP78a4d8KWsoZdZ7n6UsSNeXInRLe1
         Dv710SpvfV2bbFqkDJvAiVvYc28apPvu2zXzsyu1Wc46bwejtFIAd7Ueww3L2O4RU6dt
         PREA==
X-Gm-Message-State: AJIora9WPFHEPDRy4cdthbaI/1ReScAt4BkFHtQu47WFTeBKpfZCFW5j
        2LgDsUjgtfalx2ci4hc8h2M7WTtHqMCTLlAW
X-Google-Smtp-Source: AGRyM1sA3yD6oqR19OIbaGnSm8UMi+LNHfy6aS9JXUiNtdu7o1M482WYiMzfTWZnjuzftC96by1wXg==
X-Received: by 2002:a17:906:1c56:b0:70e:ad6d:5e87 with SMTP id l22-20020a1709061c5600b0070ead6d5e87mr4734916ejg.491.1655217927215;
        Tue, 14 Jun 2022 07:45:27 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id z22-20020a50e696000000b0042e032164a4sm7290439edm.61.2022.06.14.07.45.25
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 07:45:26 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id n185so4779275wmn.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jun 2022 07:45:25 -0700 (PDT)
X-Received: by 2002:a05:600c:4f13:b0:39d:b6c5:ce4e with SMTP id
 l19-20020a05600c4f1300b0039db6c5ce4emr410318wmq.34.1655217924701; Tue, 14 Jun
 2022 07:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220609170859.v3.1.Ie846c5352bc307ee4248d7cab998ab3016b85d06@changeid>
 <0a4de64d-aed7-f1cf-584a-bd8616a69ca3@quicinc.com>
In-Reply-To: <0a4de64d-aed7-f1cf-584a-bd8616a69ca3@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 14 Jun 2022 07:45:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W3nGQBNJXWw82HFDosAFKRDbt85afUbdEaOjOc3gWA_A@mail.gmail.com>
Message-ID: <CAD=FV=W3nGQBNJXWw82HFDosAFKRDbt85afUbdEaOjOc3gWA_A@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm: Avoid unclocked GMU register access in 6xx gpu_busy
To:     Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Chia-I Wu <olvaffe@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Eric Anholt <eric@anholt.net>,
        Jonathan Marek <jonathan@marek.ca>,
        Sean Paul <sean@poorly.run>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jun 14, 2022 at 7:42 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On 6/10/2022 5:39 AM, Douglas Anderson wrote:
> > >From testing on sc7180-trogdor devices, reading the GMU registers
> > needs the GMU clocks to be enabled. Those clocks get turned on in
> > a6xx_gmu_resume(). Confusingly enough, that function is called as a
> > result of the runtime_pm of the GPU "struct device", not the GMU
> > "struct device". Unfortunately the current a6xx_gpu_busy() grabs a
> > reference to the GMU's "struct device".
> >
> > The fact that we were grabbing the wrong reference was easily seen to
> > cause crashes that happen if we change the GPU's pm_runtime usage to
> > not use autosuspend. It's also believed to cause some long tail GPU
> > crashes even with autosuspend.
> >
> > We could look at changing it so that we do pm_runtime_get_if_in_use()
> > on the GPU's "struct device", but then we run into a different
> > problem. pm_runtime_get_if_in_use() will return 0 for the GPU's
> > "struct device" the whole time when we're in the "autosuspend
> > delay". That is, when we drop the last reference to the GPU but we're
> > waiting a period before actually suspending then we'll think the GPU
> > is off. One reason that's bad is that if the GPU didn't actually turn
> > off then the cycle counter doesn't lose state and that throws off all
> > of our calculations.
> >
> > Let's change the code to keep track of the suspend state of
> > devfreq. msm_devfreq_suspend() is always called before we actually
> > suspend the GPU and msm_devfreq_resume() after we resume it. This
> > means we can use the suspended state to know if we're powered or not.
> >
> > NOTE: one might wonder when exactly our status function is called when
> > devfreq is supposed to be disabled. The stack crawl I captured was:
> >    msm_devfreq_get_dev_status
> >    devfreq_simple_ondemand_func
> >    devfreq_update_target
> >    qos_notifier_call
> >    qos_max_notifier_call
> >    blocking_notifier_call_chain
> >    pm_qos_update_target
> >    freq_qos_apply
> >    apply_constraint
> >    __dev_pm_qos_update_request
> >    dev_pm_qos_update_request
> >    msm_devfreq_idle_work
> >
> > Fixes: eadf79286a4b ("drm/msm: Check for powered down HW in the devfreq callbacks")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v3:
> > - Totally rewrote to not use the pm_runtime functions.
> > - Moved the code to be common for all adreno GPUs.
> >
> > Changes in v2:
> > - Move the set_freq runtime pm grab to the GPU file.
> > - Use <= for the pm_runtime test, not ==.
> >
> >   drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  8 ------
> >   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 13 ++++-----
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 +++------
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  3 ++-
> >   drivers/gpu/drm/msm/msm_gpu.h         |  9 ++++++-
> >   drivers/gpu/drm/msm/msm_gpu_devfreq.c | 39 +++++++++++++++++++++------
> >   6 files changed, 51 insertions(+), 33 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > index c424e9a37669..3dcec7acb384 100644
> > --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > @@ -1666,18 +1666,10 @@ static u64 a5xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
> >   {
> >       u64 busy_cycles;
> >
> > -     /* Only read the gpu busy if the hardware is already active */
> > -     if (pm_runtime_get_if_in_use(&gpu->pdev->dev) == 0) {
> > -             *out_sample_rate = 1;
> > -             return 0;
> > -     }
> > -
> >       busy_cycles = gpu_read64(gpu, REG_A5XX_RBBM_PERFCTR_RBBM_0_LO,
> >                       REG_A5XX_RBBM_PERFCTR_RBBM_0_HI);
> >       *out_sample_rate = clk_get_rate(gpu->core_clk);
> >
> > -     pm_runtime_put(&gpu->pdev->dev);
> > -
> >       return busy_cycles;
> >   }
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > index 9f76f5b15759..dc715d88ff21 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > @@ -102,7 +102,8 @@ bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu)
> >               A6XX_GMU_SPTPRAC_PWR_CLK_STATUS_GX_HM_CLK_OFF));
> >   }
> >
> > -void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
> > +void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
> > +                    bool suspended)
> >   {
> >       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> >       struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> > @@ -127,15 +128,16 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
> >
> >       /*
> >        * This can get called from devfreq while the hardware is idle. Don't
> > -      * bring up the power if it isn't already active
> > +      * bring up the power if it isn't already active. All we're doing here
> > +      * is updating the frequency so that when we come back online we're at
> > +      * the right rate.
> >        */
> > -     if (pm_runtime_get_if_in_use(gmu->dev) == 0)
> > +     if (suspended)
> >               return;
> >
> >       if (!gmu->legacy) {
> >               a6xx_hfi_set_freq(gmu, perf_index);
> >               dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
> > -             pm_runtime_put(gmu->dev);
> >               return;
> >       }
> >
> > @@ -159,7 +161,6 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
> >               dev_err(gmu->dev, "GMU set GPU frequency error: %d\n", ret);
> >
> >       dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
> > -     pm_runtime_put(gmu->dev);
> >   }
> >
> >   unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
> > @@ -895,7 +896,7 @@ static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
> >               return;
> >
> >       gmu->freq = 0; /* so a6xx_gmu_set_freq() doesn't exit early */
> > -     a6xx_gmu_set_freq(gpu, gpu_opp);
> > +     a6xx_gmu_set_freq(gpu, gpu_opp, false);
> >       dev_pm_opp_put(gpu_opp);
> >   }
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > index 42ed9a3c4905..8c02a67f29f2 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -1658,27 +1658,21 @@ static u64 a6xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
> >       /* 19.2MHz */
> >       *out_sample_rate = 19200000;
> >
> > -     /* Only read the gpu busy if the hardware is already active */
> > -     if (pm_runtime_get_if_in_use(a6xx_gpu->gmu.dev) == 0)
> > -             return 0;
> > -
> >       busy_cycles = gmu_read64(&a6xx_gpu->gmu,
> >                       REG_A6XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_0_L,
> >                       REG_A6XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_0_H);
> >
> > -
> > -     pm_runtime_put(a6xx_gpu->gmu.dev);
> > -
> >       return busy_cycles;
> >   }
> >
> > -static void a6xx_gpu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
> > +static void a6xx_gpu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
> > +                           bool suspended)
> >   {
> >       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> >       struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> >
> >       mutex_lock(&a6xx_gpu->gmu.lock);
> > -     a6xx_gmu_set_freq(gpu, opp);
> > +     a6xx_gmu_set_freq(gpu, opp, suspended);
> >       mutex_unlock(&a6xx_gpu->gmu.lock);
> >   }
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > index 86e0a7c3fe6d..ab853f61db63 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > @@ -77,7 +77,8 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
> >   int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
> >   void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);
> >
> > -void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp);
> > +void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
> > +                    bool suspended);
> >   unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu);
> >
> >   void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> > index 6def00883046..7ced1a30d4e8 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.h
> > +++ b/drivers/gpu/drm/msm/msm_gpu.h
> > @@ -68,7 +68,8 @@ struct msm_gpu_funcs {
> >       struct msm_gpu_state *(*gpu_state_get)(struct msm_gpu *gpu);
> >       int (*gpu_state_put)(struct msm_gpu_state *state);
> >       unsigned long (*gpu_get_freq)(struct msm_gpu *gpu);
> > -     void (*gpu_set_freq)(struct msm_gpu *gpu, struct dev_pm_opp *opp);
> > +     void (*gpu_set_freq)(struct msm_gpu *gpu, struct dev_pm_opp *opp,
> > +                          bool suspended);
> >       struct msm_gem_address_space *(*create_address_space)
> >               (struct msm_gpu *gpu, struct platform_device *pdev);
> >       struct msm_gem_address_space *(*create_private_address_space)
> > @@ -92,6 +93,9 @@ struct msm_gpu_devfreq {
> >       /** devfreq: devfreq instance */
> >       struct devfreq *devfreq;
> >
> > +     /** lock: lock for "suspended", "busy_cycles", and "time" */
> > +     struct mutex lock;
> > +
> >       /**
> >        * idle_constraint:
> >        *
> > @@ -135,6 +139,9 @@ struct msm_gpu_devfreq {
> >        * elapsed
> >        */
> >       struct msm_hrtimer_work boost_work;
> > +
> > +     /** suspended: tracks if we're suspended */
> > +     bool suspended;
> >   };
> >
> >   struct msm_gpu {
> > diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> > index d2539ca78c29..ea94bc18e72e 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> > @@ -20,6 +20,7 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
> >               u32 flags)
> >   {
> >       struct msm_gpu *gpu = dev_to_gpu(dev);
> > +     struct msm_gpu_devfreq *df = &gpu->devfreq;
> >       struct dev_pm_opp *opp;
> >
> >       /*
> > @@ -32,10 +33,13 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
> >
> >       trace_msm_gpu_freq_change(dev_pm_opp_get_freq(opp));
> >
> > -     if (gpu->funcs->gpu_set_freq)
> > -             gpu->funcs->gpu_set_freq(gpu, opp);
> > -     else
> > +     if (gpu->funcs->gpu_set_freq) {
> > +             mutex_lock(&df->lock);
> > +             gpu->funcs->gpu_set_freq(gpu, opp, df->suspended);
> > +             mutex_unlock(&df->lock);
> > +     } else {
> >               clk_set_rate(gpu->core_clk, *freq);
> > +     }
> >
> >       dev_pm_opp_put(opp);
> >
> > @@ -58,15 +62,24 @@ static void get_raw_dev_status(struct msm_gpu *gpu,
> >       unsigned long sample_rate;
> >       ktime_t time;
> >
> > +     mutex_lock(&df->lock);
> > +
> >       status->current_frequency = get_freq(gpu);
> > -     busy_cycles = gpu->funcs->gpu_busy(gpu, &sample_rate);
> >       time = ktime_get();
> > -
> > -     busy_time = busy_cycles - df->busy_cycles;
> >       status->total_time = ktime_us_delta(time, df->time);
> > +     df->time = time;
> >
> > +     if (df->suspended) {
> > +             mutex_unlock(&df->lock);
> > +             status->busy_time = 0;
> > +             return;
> > +     }
> > +
> > +     busy_cycles = gpu->funcs->gpu_busy(gpu, &sample_rate);
> > +     busy_time = busy_cycles - df->busy_cycles;
> >       df->busy_cycles = busy_cycles;
> > -     df->time = time;
> > +
> > +     mutex_unlock(&df->lock);
> >
> >       busy_time *= USEC_PER_SEC;
> >       do_div(busy_time, sample_rate);
> > @@ -175,6 +188,8 @@ void msm_devfreq_init(struct msm_gpu *gpu)
> >       if (!gpu->funcs->gpu_busy)
> >               return;
> >
> > +     mutex_init(&df->lock);
> > +
> >       dev_pm_qos_add_request(&gpu->pdev->dev, &df->idle_freq,
> >                              DEV_PM_QOS_MAX_FREQUENCY,
> >                              PM_QOS_MAX_FREQUENCY_DEFAULT_VALUE);
> > @@ -244,12 +259,16 @@ void msm_devfreq_cleanup(struct msm_gpu *gpu)
> >   void msm_devfreq_resume(struct msm_gpu *gpu)
> >   {
> >       struct msm_gpu_devfreq *df = &gpu->devfreq;
> > +     unsigned long sample_rate;
> >
> >       if (!has_devfreq(gpu))
> >               return;
> >
> > -     df->busy_cycles = 0;
> > +     mutex_lock(&df->lock);
> > +     df->busy_cycles = gpu->funcs->gpu_busy(gpu, &sample_rate);
> >       df->time = ktime_get();
> > +     df->suspended = false;
> > +     mutex_unlock(&df->lock);
> >
> >       devfreq_resume_device(df->devfreq);
> >   }
> > @@ -261,6 +280,10 @@ void msm_devfreq_suspend(struct msm_gpu *gpu)
> >       if (!has_devfreq(gpu))
> >               return;
> >
> > +     mutex_lock(&df->lock);
> > +     df->suspended = true;
> > +     mutex_unlock(&df->lock);
> > +
> >       devfreq_suspend_device(df->devfreq);
> >
> >       cancel_idle_work(df);
>
> nit: in the commit subject: 6xx -> a6xx
>
> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

Thanks!

There's actually a v4 of this:

https://lore.kernel.org/r/20220610124639.v4.1.Ie846c5352bc307ee4248d7cab998ab3016b85d06@changeid

I'll send a v5 that adds your Reviewed-by tag and fixes the subject.

-Doug
