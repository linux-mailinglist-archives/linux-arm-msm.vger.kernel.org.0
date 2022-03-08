Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 042694D1E32
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Mar 2022 18:09:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348656AbiCHRKv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Mar 2022 12:10:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348623AbiCHRKp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Mar 2022 12:10:45 -0500
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBAA749268
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Mar 2022 09:09:48 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id kl20so5480052qvb.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Mar 2022 09:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UQsloRHTSaGiGetdbDWoxqQEJYsHpKTImpl+EXTJaU0=;
        b=H2042iFn8zbvVMiOulmTBRC55hfhpLFhLPRiEwvUGuLHJeAjSulrbb/dnZ+gGOGpdx
         z+nEoUPsD5v9kA7aLyUd3mh/+c+OPht0WtwZz7SUgG5EpIxXKtD33/rrpjJgBRLOZ+Wc
         +w4Ng70uS1XwbnLD2GxLQoEqEPlzd/G0Nj4DbBPsF4RU+8mYeOajlGGlmH85BpFpMHq4
         V9pj+HOsO1K0j7YJzSI1eVB8yORUl7FQ0K4fuwqcZEq2hj4nu6kvqSciK8Z1UvqSgnGX
         2Gg1wU8u+siIqzrk0fumIX8gcdhjob0cCaqDCKEe8NWqBvwoktmRCHASmW+vII/XTqBi
         SkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UQsloRHTSaGiGetdbDWoxqQEJYsHpKTImpl+EXTJaU0=;
        b=kECUfSOiLGKDBBHaL5GrUPB+EI1S/84gsZ3KUhsMrB30/gBfqEHSGLOQd3h7CSIzpB
         Jh2LSppJ3g+yUHTVEB4louJNPqhUbcATZ86AlzsWcsAA8Aj+sVJIZ0fXaqBT1Txy4moK
         UKpKVp5rykPNIxcSs5n4M2Rz/ovFqz4CsPFd/41zfr+fDsRCFiQ1LiOX8Skjkstuy4wH
         Gr2cbRVFLe5TJQ2kp35w0rX4TLjBj3QNs4vP35L8BCC/H8GeBjA4TE8KLn/eqiGlJNOi
         Vr4iTDiTi0ghJ34tJtdtSMOxQZPZ2ZeJhastnt3B14dskj7EtSK44iG9odLgRXn0Vaa/
         b57A==
X-Gm-Message-State: AOAM5332g3REMHplnNiysi3Jw40UJqeqULsCTPzmKlu/74BUpu9TQrTy
        hICAUGDMKi2exglxSfumTLqNC6nogSN6xC+PO1yr1g==
X-Google-Smtp-Source: ABdhPJziwHM3mwjCjwO4Ib9qlCcqXaMHab7YQ1KRTIBpOJvcb8c3ZW4vgDTtKRTvbt8UU9j7WWhqwP7KKAN7SmM4acc=
X-Received: by 2002:a05:6214:1bcf:b0:435:4c86:607a with SMTP id
 m15-20020a0562141bcf00b004354c86607amr12909937qvc.122.1646759386744; Tue, 08
 Mar 2022 09:09:46 -0800 (PST)
MIME-Version: 1.0
References: <1646758500-3776-1-git-send-email-quic_vpolimer@quicinc.com> <1646758500-3776-6-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1646758500-3776-6-git-send-email-quic_vpolimer@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 8 Mar 2022 20:09:35 +0300
Message-ID: <CAA8EJprgJvOGCU_PvAHCNoMvSam8QV4x9N2ZEm+oer5d7B-cPA@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] drm/msm/disp/dpu1: set mdp clk to the maximum
 frequency in opp table during probe
To:     Vinod Polimera <quic_vpolimer@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, swboyd@chromium.org,
        quic_kalyant@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 8 Mar 2022 at 19:55, Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
>
> use max clock during probe/bind sequence from the opp table.
> The clock will be scaled down when framework sends an update.
>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index d550f90..d9922b9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1221,6 +1221,7 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
>         struct dpu_kms *dpu_kms;
>         struct dss_module_power *mp;
>         int ret = 0;
> +       unsigned long max_freq = ULONG_MAX;
>
>         dpu_kms = devm_kzalloc(&pdev->dev, sizeof(*dpu_kms), GFP_KERNEL);
>         if (!dpu_kms)
> @@ -1243,6 +1244,8 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
>                 return ret;
>         }
>
> +       dev_pm_opp_find_freq_floor(dev, &max_freq);

You leak a reference to the opp here. The function returns a value,
which should be dev_pm_opp_put().
Moreover judging from the dev_pm_opp_set_rate() code I think you don't
have to find an exact frequency, as it will call
clk_round_rate()/_find_freq_ceil() anyway.
Could you please check that it works?

> +       dev_pm_opp_set_rate(dev, max_freq);
>         platform_set_drvdata(pdev, dpu_kms);
>
>         ret = msm_kms_init(&dpu_kms->base, &kms_funcs);
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
