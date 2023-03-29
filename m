Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9D466CF654
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 00:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbjC2WZF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Mar 2023 18:25:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjC2WZE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Mar 2023 18:25:04 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1D871FFB
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 15:25:02 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id g19so9027282lfr.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 15:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680128701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4fgpkMD2Gq5iFjiTIumx1E6jcgmr9OxUxOWCHdMjMSU=;
        b=b5esxN6e06GrQ3rnJbWJLsB5M3JAFzduhDYpKhwfIZxE4x74fh//WUEiRH9W++ERVg
         vA6EIKjMqyBrtOVORVBuWFKTe3bmmMNLGMNBc33kN0XZWbUsLFCtwheqbuacrbPyKm/i
         4ilex/roaA1YzIPmEffk+rfQP7PRm5nPYS9n+3IGPNxV/doOSkIFr4lgiT1s8X77D7UP
         3srofdvWlMAtl6nijUHAYgs1EHfgTvkDdh9YKL3YoubcrnUvT8emEeCb8ovvlOq1gPdT
         r1CcX3O30vkEXR7NNAxacYvZONTQlp/KxrEVGhO9uWrqZglg3B2JTwMQVOSKoVp00zZ6
         EGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680128701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4fgpkMD2Gq5iFjiTIumx1E6jcgmr9OxUxOWCHdMjMSU=;
        b=4zO2jiTbf/wjyC8DOMJVR3JU5InwSECaAsRk4lmhG6zDJ/fqgYFUwr+4BykGZoXrvq
         MAPEwPPVSJg3Bdc++D5ESoQ6cq9JrOshLLVFrGiOAkHC41uhYH6Qi8eMcpdrOftjoFXb
         co/2ZOSutv+DUAL6XtsQ0OMB2BPetPBeQbQOq8QgEuHVs8y4WCFu7SSkL+OaJ8uRp1Sv
         uiriZInaPOWF7/OJlg9L35Wx38YEmh2wuGxAMhQTG0mHxPczc0xnH/34q4P4ibi0KNsG
         ltIXKOpldR8HChW5ENgOHb0UcEdInSF89bIL64Imxqxke4kr514DZ/Z9BsixKdUZ1NRV
         IhGQ==
X-Gm-Message-State: AAQBX9eeCdR4IwjtcasQfBuf4MNqKqOO0jtJSyYQNKjDZgBEmrmCzsK8
        DjHH5fQUndQlpxwCywa30IRxEg==
X-Google-Smtp-Source: AKy350a7ceYDqZxhdv7287ctkhCU81DymAWjmdaYiSFT1Mz5IWzkTlhlx+5+kxqKB64DelkgwiZ1zA==
X-Received: by 2002:ac2:5dcd:0:b0:4db:3e2d:3efc with SMTP id x13-20020ac25dcd000000b004db3e2d3efcmr6469196lfq.10.1680128701059;
        Wed, 29 Mar 2023 15:25:01 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y26-20020ac255ba000000b004e9b307d2c8sm4724226lfg.238.2023.03.29.15.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 15:25:00 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH 0/3] drm/msm/a5xx: scale MX following the frequency changes
Date:   Thu, 30 Mar 2023 01:24:57 +0300
Message-Id: <20230329222500.1131836-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Konrad brought up the topic of scaling the MX domain according to the
OPP changes. Here is my RFC for this functionality. I post it as an RFC
for two reasons:

1) I'm not sure that we should scale MX if we are not scaling main
voltage following the CPR3

2) With this patchset I'm getting the following huuuge backtrace from
lockdep, which I was not able to solve and which, I believe, is a false
positive. An independent opinion is appreciated.

======================================================
WARNING: possible circular locking dependency detected
6.3.0-rc2-00329-g761f7b50599b #348 Not tainted
------------------------------------------------------
ring2/111 is trying to acquire lock:
ffff00008ca79078 (&devfreq->lock){+.+.}-{3:3}, at: qos_min_notifier_call+0x28/0x88

but task is already holding lock:
ffff00008b7d64e8 (&(c->notifiers)->rwsem){++++}-{3:3}, at: blocking_notifier_call_chain+0x34/0xa0

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #4 (&(c->notifiers)->rwsem){++++}-{3:3}:
       lock_acquire+0x68/0x84
       down_write+0x40/0xe4
       blocking_notifier_chain_register+0x30/0x8c
       freq_qos_add_notifier+0x68/0x7c
       dev_pm_qos_add_notifier+0xa0/0xf8
       devfreq_add_device.part.0+0x360/0x5c8
       devm_devfreq_add_device+0x74/0xe0
       msm_devfreq_init+0xa0/0x16c
       msm_gpu_init+0x2fc/0x588
       adreno_gpu_init+0x180/0x2c8
       a5xx_gpu_init+0x128/0x378
       adreno_bind+0x180/0x290
       component_bind_all+0x118/0x24c
       msm_drm_bind+0x1ac/0x66c
       try_to_bring_up_aggregate_device+0x168/0x1d4
       __component_add+0xa8/0x170
       component_add+0x14/0x20
       msm_hdmi_dev_probe+0x474/0x5bc
       platform_probe+0x68/0xd8
       really_probe+0x148/0x2b4
       __driver_probe_device+0x78/0xe0
       driver_probe_device+0xd8/0x160
       __device_attach_driver+0xb8/0x138
       bus_for_each_drv+0x84/0xe0
       __device_attach+0xa8/0x1b0
       device_initial_probe+0x14/0x20
       bus_probe_device+0xb0/0xb4
       deferred_probe_work_func+0x8c/0xc8
       process_one_work+0x288/0x6b0
       worker_thread+0x23c/0x440
       kthread+0x10c/0x110
       ret_from_fork+0x10/0x20

-> #3 (dev_pm_qos_mtx){+.+.}-{3:3}:
       lock_acquire+0x68/0x84
       __mutex_lock+0x84/0x400
       mutex_lock_nested+0x2c/0x38
       dev_pm_qos_add_notifier+0x38/0xf8
       genpd_add_device+0x150/0x340
       __genpd_dev_pm_attach+0xa4/0x264
       genpd_dev_pm_attach+0x60/0x70
       dev_pm_domain_attach+0x20/0x34
       platform_probe+0x50/0xd8
       really_probe+0x148/0x2b4
       __driver_probe_device+0x78/0xe0
       driver_probe_device+0xd8/0x160
       __device_attach_driver+0xb8/0x138
       bus_for_each_drv+0x84/0xe0
       __device_attach+0xa8/0x1b0
       device_initial_probe+0x14/0x20
       bus_probe_device+0xb0/0xb4
       deferred_probe_work_func+0x8c/0xc8
       process_one_work+0x288/0x6b0
       worker_thread+0x23c/0x440
       kthread+0x10c/0x110
       ret_from_fork+0x10/0x20

-> #2 (gpd_list_lock){+.+.}-{3:3}:
       lock_acquire+0x68/0x84
       __mutex_lock+0x84/0x400
       mutex_lock_nested+0x2c/0x38
       __genpd_dev_pm_attach+0x78/0x264
       genpd_dev_pm_attach_by_id.part.0+0xa4/0x158
       genpd_dev_pm_attach_by_name+0x64/0x8c
       dev_pm_domain_attach_by_name+0x20/0x2c
       dev_pm_opp_set_config+0x3e4/0x688
       devm_pm_opp_set_config+0x18/0x70
       a5xx_gpu_init+0x1d8/0x378
       adreno_bind+0x180/0x290
       component_bind_all+0x118/0x24c
       msm_drm_bind+0x1ac/0x66c
       try_to_bring_up_aggregate_device+0x168/0x1d4
       __component_add+0xa8/0x170
       component_add+0x14/0x20
       msm_hdmi_dev_probe+0x474/0x5bc
       platform_probe+0x68/0xd8
       really_probe+0x148/0x2b4
       __driver_probe_device+0x78/0xe0
       driver_probe_device+0xd8/0x160
       __device_attach_driver+0xb8/0x138
       bus_for_each_drv+0x84/0xe0
       __device_attach+0xa8/0x1b0
       device_initial_probe+0x14/0x20
       bus_probe_device+0xb0/0xb4
       deferred_probe_work_func+0x8c/0xc8
       process_one_work+0x288/0x6b0
       worker_thread+0x23c/0x440
       kthread+0x10c/0x110
       ret_from_fork+0x10/0x20

-> #1 (&opp_table->genpd_virt_dev_lock){+.+.}-{3:3}:
       lock_acquire+0x68/0x84
       __mutex_lock+0x84/0x400
       mutex_lock_nested+0x2c/0x38
       _set_required_opps+0x64/0x180
       _set_opp+0x190/0x438
       dev_pm_opp_set_rate+0x18c/0x274
       msm_devfreq_target+0x19c/0x224
       devfreq_set_target+0x84/0x2f8
       devfreq_update_target+0xc4/0xec
       devfreq_monitor+0x38/0x1f0
       process_one_work+0x288/0x6b0
       worker_thread+0x74/0x440
       kthread+0x10c/0x110
       ret_from_fork+0x10/0x20

-> #0 (&devfreq->lock){+.+.}-{3:3}:
       __lock_acquire+0x138c/0x2218
       lock_acquire.part.0+0xc4/0x1fc
       lock_acquire+0x68/0x84
       __mutex_lock+0x84/0x400
       mutex_lock_nested+0x2c/0x38
       qos_min_notifier_call+0x28/0x88
       blocking_notifier_call_chain+0x6c/0xa0
       pm_qos_update_target+0xdc/0x24c
       freq_qos_apply+0x68/0x74
       apply_constraint+0x100/0x148
       __dev_pm_qos_update_request+0xb8/0x280
       dev_pm_qos_update_request+0x3c/0x64
       msm_devfreq_active+0xf8/0x194
       msm_gpu_submit+0x18c/0x1a8
       msm_job_run+0xbc/0x140
       drm_sched_main+0x190/0x510
       kthread+0x10c/0x110
       ret_from_fork+0x10/0x20

other info that might help us debug this:

Chain exists of:
  &devfreq->lock --> dev_pm_qos_mtx --> &(c->notifiers)->rwsem

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&(c->notifiers)->rwsem);
                               lock(dev_pm_qos_mtx);
                               lock(&(c->notifiers)->rwsem);
  lock(&devfreq->lock);

 *** DEADLOCK ***

4 locks held by ring2/111:
 #0: ffff000087064170 (&gpu->lock){+.+.}-{3:3}, at: msm_job_run+0xb0/0x140
 #1: ffff000087064208 (&gpu->active_lock){+.+.}-{3:3}, at: msm_gpu_submit+0xdc/0x1a8
 #2: ffff80000a344bf8 (dev_pm_qos_mtx){+.+.}-{3:3}, at: dev_pm_qos_update_request+0x30/0x64
 #3: ffff00008b7d64e8 (&(c->notifiers)->rwsem){++++}-{3:3}, at: blocking_notifier_call_chain+0x34/0xa0

stack backtrace:
CPU: 0 PID: 111 Comm: ring2 Not tainted 6.3.0-rc2-00329-g761f7b50599b #348
Hardware name: Qualcomm Technologies, Inc. DB820c (DT)
Call trace:
 dump_backtrace+0xa0/0xfc
 show_stack+0x18/0x24
 dump_stack_lvl+0x60/0xac
 dump_stack+0x18/0x24
 print_circular_bug+0x24c/0x2f8
 check_noncircular+0x134/0x148
 __lock_acquire+0x138c/0x2218
 lock_acquire.part.0+0xc4/0x1fc
 lock_acquire+0x68/0x84
 __mutex_lock+0x84/0x400
 mutex_lock_nested+0x2c/0x38
 qos_min_notifier_call+0x28/0x88
 blocking_notifier_call_chain+0x6c/0xa0
 pm_qos_update_target+0xdc/0x24c
 freq_qos_apply+0x68/0x74
 apply_constraint+0x100/0x148
 __dev_pm_qos_update_request+0xb8/0x280
 dev_pm_qos_update_request+0x3c/0x64
 msm_devfreq_active+0xf8/0x194
 msm_gpu_submit+0x18c/0x1a8
 msm_job_run+0xbc/0x140
 drm_sched_main+0x190/0x510
 kthread+0x10c/0x110
 ret_from_fork+0x10/0x20
Rendered 979 frames in 2.001978 sec (489.016434 fps)

Dmitry Baryshkov (3):
  dt-bindings: display/msm/gpu: allow specifying MX domain A5xx
  drm/msm/a5xx: scale MX domain following the frequncy changes
  arm64: dts: qcom: specify power domains for the GPU

 .../devicetree/bindings/display/msm/gpu.yaml  |  9 +++-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         | 14 ++++-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         | 52 +++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h         |  3 ++
 4 files changed, 76 insertions(+), 2 deletions(-)

-- 
2.39.2

