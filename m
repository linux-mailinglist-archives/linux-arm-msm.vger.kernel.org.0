Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1A7C545257
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jun 2022 18:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344838AbiFIQvR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jun 2022 12:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344852AbiFIQvD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jun 2022 12:51:03 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 141542EA3F
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jun 2022 09:50:53 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id b8so15316721edj.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jun 2022 09:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E2+fNvmvqWQKCDAUtcMyd7aXG5n324Z+HdNSzbIXbwY=;
        b=cNg6um7nb4nsy8UZupEsWZNHMESEj7pcV8kfXlsQGluYfUfW6CxrwB0vWECsZVGvDC
         YdqdDxzW4KhSSo0ErUP2b7x7wvuB5yML2DZZ5WGYkbTZS+hMOmzLGMdfYMpoPOiIoj5+
         Nww5cc17i1TZn60VrQC0+FBhYlVvi3+MMiWVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E2+fNvmvqWQKCDAUtcMyd7aXG5n324Z+HdNSzbIXbwY=;
        b=3wrBtkS+UQ3OwDBDOEJMz0/w51KDx3uZMNPR83mmqYdKEy53KmFYGE4ZvxZu54KnPd
         UaspqnSCuc2A/M0nSFBJLmij94Iu1+9K+my/lG0p24kVsinUuSG7MG0FK0pgxdP6dvTF
         CKi7W1PncCiVfn7PXnkwKPpIR+wVLyHufPsbc8rxzOIf5j+DzdfVla6GzQaXsWn4xj6c
         ZtpcsUEIC4o6Bvz/vFQiYBoDt+hxAa27MBAP+8Di5AyR+jS0Yp2Au4+DXYlefzGcJXfN
         lXZ5O1T9mBBlzyJfEdToA/VpP1UTEY4dktWNjxUY7cTD+3fDUyBvOWdc2I6zRwjsuxys
         H8WA==
X-Gm-Message-State: AOAM533gl83guluwetjXqm11pGcKmk2tq6Zz2MW7rqNexJXAOIom9PlU
        vUiGmoghqVKV73cLocBu8/hYHjxgM40ctfgr
X-Google-Smtp-Source: ABdhPJxnzi+84Va1RSr1qr3N4uBnwQ2be45cSjB0J1E2L66BvEhg/fzJvi0I7V/ypB+oXM7yp5Lp8A==
X-Received: by 2002:aa7:d4c6:0:b0:42e:561:8c70 with SMTP id t6-20020aa7d4c6000000b0042e05618c70mr45702220edr.131.1654793452100;
        Thu, 09 Jun 2022 09:50:52 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id y2-20020a170906470200b006feec47dae7sm11190527ejq.149.2022.06.09.09.50.50
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 09:50:50 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id h5so33258499wrb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jun 2022 09:50:50 -0700 (PDT)
X-Received: by 2002:a5d:608d:0:b0:218:3cfa:afe9 with SMTP id
 w13-20020a5d608d000000b002183cfaafe9mr23536562wrt.422.1654793450068; Thu, 09
 Jun 2022 09:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220608161334.2140611-1-robdclark@gmail.com>
In-Reply-To: <20220608161334.2140611-1-robdclark@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 9 Jun 2022 09:50:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WJotkL=BN-qvyEjVpa8Fsbt_15D-8wV3RUe8j5dA41gQ@mail.gmail.com>
Message-ID: <CAD=FV=WJotkL=BN-qvyEjVpa8Fsbt_15D-8wV3RUe8j5dA41gQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: Switch ordering of runpm put vs devfreq_idle
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jun 8, 2022 at 9:13 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> I've seen a few crashes like:
>
>     CPU: 0 PID: 216 Comm: A618-worker Tainted: G        W         5.4.196 #7
>     Hardware name: Google Wormdingler rev1+ INX panel board (DT)
>     pstate: 20c00009 (nzCv daif +PAN +UAO)
>     pc : msm_readl+0x14/0x34
>     lr : a6xx_gpu_busy+0x40/0x80
>     sp : ffffffc011b93ad0
>     x29: ffffffc011b93ad0 x28: ffffffe77cba3000
>     x27: 0000000000000001 x26: ffffffe77bb4c4ac
>     x25: ffffffa2f227dfa0 x24: ffffffa2f22aab28
>     x23: 0000000000000000 x22: ffffffa2f22bf020
>     x21: ffffffa2f22bf000 x20: ffffffc011b93b10
>     x19: ffffffc011bd4110 x18: 000000000000000e
>     x17: 0000000000000004 x16: 000000000000000c
>     x15: 000001be3a969450 x14: 0000000000000400
>     x13: 00000000000101d6 x12: 0000000034155555
>     x11: 0000000000000001 x10: 0000000000000000
>     x9 : 0000000100000000 x8 : ffffffc011bd4000
>     x7 : 0000000000000000 x6 : 0000000000000007
>     x5 : ffffffc01d8b38f0 x4 : 0000000000000000
>     x3 : 00000000ffffffff x2 : 0000000000000002
>     x1 : 0000000000000000 x0 : ffffffc011bd4110
>     Call trace:
>      msm_readl+0x14/0x34
>      a6xx_gpu_busy+0x40/0x80
>      msm_devfreq_get_dev_status+0x70/0x1d0
>      devfreq_simple_ondemand_func+0x34/0x100
>      update_devfreq+0x50/0xe8
>      qos_notifier_call+0x2c/0x64
>      qos_max_notifier_call+0x1c/0x2c
>      notifier_call_chain+0x58/0x98
>      __blocking_notifier_call_chain+0x74/0x84
>      blocking_notifier_call_chain+0x38/0x48
>      pm_qos_update_target+0xf8/0x19c
>      freq_qos_apply+0x54/0x6c
>      apply_constraint+0x60/0x104
>      __dev_pm_qos_update_request+0xb4/0x184
>      dev_pm_qos_update_request+0x38/0x58
>      msm_devfreq_idle_work+0x34/0x40
>      kthread_worker_fn+0x144/0x1c8
>      kthread+0x140/0x284
>      ret_from_fork+0x10/0x18
>     Code: f9000bf3 910003fd aa0003f3 d503201f (b9400260)
>     ---[ end trace f6309767a42d0831 ]---
>
> Which smells a lot like touching hw after power collapse.  This seems
> a bit like a race/timing issue elsewhere, as pm_runtime_get_if_in_use()
> in a6xx_gpu_busy() should have kept us from touching hw if it wasn't
> powered.

I dunno if we want to change the commit message since I think my patch
[1] addresses the above problem?

[1] https://lore.kernel.org/r/20220609094716.v2.1.Ie846c5352bc307ee4248d7cab998ab3016b85d06@changeid


> But, we've seen cases where the idle_work scheduled by
> msm_devfreq_idle() ends up racing with the resume path.  Which, again,
> shouldn't be a problem other than unnecessary freq changes.
>
> v2. Only move the runpm _put_autosuspend, and not the _mark_last_busy()
>
> Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Link: https://lore.kernel.org/r/20210927152928.831245-1-robdclark@gmail.com
> ---
>  drivers/gpu/drm/msm/msm_gpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

In any case, your patch fixes the potential WARN_ON and seems like the
right thing to do, so:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
