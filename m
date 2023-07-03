Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C279F7465B3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 00:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230367AbjGCWVE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 18:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbjGCWVD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 18:21:03 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07827BC
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 15:21:03 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-c4dfe2a95fbso2641297276.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 15:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688422862; x=1691014862;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kkgySe8Uqu5pVP0Ai+kPcBOTT58PWVlKqx0ZlEZE5+Y=;
        b=BPRSlmcMoK+hP9dytWzXsFTROhVHtygckwckFTx5JDbd4dDnpO/W44ZMXBffRbCuY6
         8DMSHkog3+LE7MD1yOcv4PfvYTZxxIS5cj7dOmc6aWYPwtXSAUq35UROsj/1eCpvtrkW
         AADJxZCy1YRtQ/eJzz6L9bFGKSeHVhUQBTgsXjNGbo314YY7FiAykr9DNWBSBGHHvw6T
         dlExZua5Wbw0UGkNxLEhjKtoxXTnIy6g3vtIP+NdTrpNG8I8DSr+ff4OvYSMFCGegPtm
         hSQy7YokRsQd0AsTSmgGOQQ9f0Wp7xMjmuNYIw7SNeBneCiclrVc2W6Ud2Y21qO5TXM5
         kaeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688422862; x=1691014862;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kkgySe8Uqu5pVP0Ai+kPcBOTT58PWVlKqx0ZlEZE5+Y=;
        b=PuM6wdWczaAO9R05mM/sk7ACPHAXlvZA8jjmPYChe0HMZMbIYpUr6xftBf+QEQ8fC+
         7n907cAc0pf+2KgmYglnJAQLsRO6td2NUZlwxw3LgsKeEFVEdzprKP8BFMBo4mmsbbUf
         8IBD01KJEnxaNQWD87PKFnojhPah7C4e1UM4OEN1BQIfy6wyyld4yrFx20VDc3wYx9td
         YPitRZK+cB4IR6T8k+81pIt3qYzayEF0PRItPOaa6dz/UvIo+edHftHX8UPBUp6oeEp4
         6l0LPVY1qaYfRUmjDpHbH5GO0Zi+jbz5jDbt2YRbYu8UTbMgRhnXBAgP7MyFLiS/tGI3
         rxfQ==
X-Gm-Message-State: ABy/qLZDZntGYUIp09Tv0iZXtpy7wyQqGFJU0DwcUo3bQUBpKrx6wj3L
        eLvPPd3MKptux9sjrZvop1r4JUfNfUBlHDMwvCfIXg==
X-Google-Smtp-Source: APBJJlEEtP62ZoidZ+jhf7XKYlGwyD2YE8XVNqNhvj3CYYjtKsBwT2TqI1Thuy5BNmgT+8qlkuu3JRNyzYYxtBcdvb8=
X-Received: by 2002:a5b:442:0:b0:bca:d619:8ccf with SMTP id
 s2-20020a5b0442000000b00bcad6198ccfmr9825896ybp.55.1688422862240; Mon, 03 Jul
 2023 15:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
 <20230620000846.946925-3-dmitry.baryshkov@linaro.org> <c278bf93-124c-5512-51af-042a0dcbd67b@quicinc.com>
In-Reply-To: <c278bf93-124c-5512-51af-042a0dcbd67b@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 4 Jul 2023 01:20:51 +0300
Message-ID: <CAA8EJpo86WaDBPGMJiytqyuNYqUTqBfEmeKSLFYUvK6r82FKqA@mail.gmail.com>
Subject: Re: [PATCH 2/8] drm/msm/dpu: drop performance tuning modes
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 4 Jul 2023 at 00:40, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/19/2023 5:08 PM, Dmitry Baryshkov wrote:
> > DPU performance module contains code to change performance state
> > calculations. In addition to normal (sum plane and CRTC requirements),
> > it can work in 'minimal' or 'fixed' modes. Both modes are impractical,
> > since they can easily end up with the display underruns. Userspace also
> > should not depend on these modes availability, since they are tuned
> > through debugfs, which might not be available.
> >
> > Drop relevant code to simplify performance state calculations.
> >
> > Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> Sorry but NAK on this change for two reasons:
>
> This mode is not for usermode to depend on but for debugging. I have
> personally used both the perf max and perf min modes for debug.
>
> 1) The purpose is that, if you do see an underrun, you can force the
> perf mode as it will select max clk and bw rate
>
> So something like below:
>
> localhost /sys/kernel/debug/dri/1/debug/core_perf # echo 2 > perf_mode
> localhost /sys/kernel/debug/dri/1/debug/core_perf # echo 300000000 >
> fix_core_clk_rate
>
> This will allow us to force the clk to a particular value to see at what
> point it starts underruning
>
> Also you can even do
>
> localhost /sys/kernel/debug/dri/1/debug/core_perf # echo 1 > perf_mode
>
> This will automatically max out the clk and BW
>
> With this, you can figure out if underrun is a performance related
> underrun or a misconfiguration. We used it even recently to debug the
> performance issue with pclk reduction

Hmm, 1 is minimum, not maxumum.

>
> 2) Sometimes, you even want to force an underrun to debug devcoredump OR
> the recovery code. Forcing the min clk mode by doing
>
> localhost /sys/kernel/debug/dri/1/debug/core_perf # echo 19200000 >
> fix_core_clk_rate
> localhost /sys/kernel/debug/dri/1/debug/core_perf # echo 2 > perf_mode
>
> Is the easiest way to trigger the recovery handler.
>
> Hence I am not at all convinced of dropping this.

I see, thanks for sharing the usecases. However I still think that it
is overcomplicated for the debugging feature. What about dropping all
perf modes and providing just 'override_core_clk_rate' and
'override_avg_bw', 'override_peak_bw'?

-- 
With best wishes
Dmitry
