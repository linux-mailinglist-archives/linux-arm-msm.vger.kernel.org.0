Return-Path: <linux-arm-msm+bounces-5083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82082815BBF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Dec 2023 21:46:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 393C4284A5E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Dec 2023 20:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 421811DFDA;
	Sat, 16 Dec 2023 20:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M63y+nqf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5351171F
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Dec 2023 20:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6d9e993d94dso1477849a34.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Dec 2023 12:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702759579; x=1703364379; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n9GkBJ1VV03XlaGkUS0RDZJ+XNHbVvs8o895NNxcixI=;
        b=M63y+nqfuyTGQXZ85+BS1MLsugwC0B2NwFjCa8oHRwShC8bYznFIJl8Dyjs0wiIgi9
         rUdriWUo5gRPa8DJ1BUF3CJbNgR43g0CUmcbMhAt/PcK0f6/shxrXZZ/ybIE89sp2ZGe
         OKu4cWqxeK0+xYpwEPvLpU6d50Kapnzjo0zoRLildYFAxdI0cZK/okzuNu2z8nKO/bX1
         1VaHE7Dz01vAK4Lw/OIetYiIKQJpyuykoburmu2vbkT7tA16FXoQ5bfbN+syJvUlS/tB
         2O9GMm+O29iHbH5diKOwRG1wCu5KyaRVDyFez98eSRD/W5DPwTtd4xqi+wFBhb5cnPW3
         ko8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702759579; x=1703364379;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n9GkBJ1VV03XlaGkUS0RDZJ+XNHbVvs8o895NNxcixI=;
        b=XQk2bKuD9/NOmSJUNT266+YSm/lvZ4MOCnRWbB4l8SS8gC1erabAHOzMubQFE6dxib
         ZEvK3vj5Vdxc7gWM0Oun8aClkR4L+dZ7n4drFaKTcj2xcFEgSCqh4u3NPGIg1ND8adtL
         Ku+G1fcnctfSsxl5nPue0PiLsXIT3Pde9vIPOmpqIFG94zwLdlEQk7qY7m06Og7HobH3
         dDnkda8W4LpPJTc/x8YESkIvhF319kz8m1KBZdlf/TNWdlGKcGbrMiO1hYy/eQdOawz7
         znnDL0YaWmN+wtDtYa+y3d0SrzV79D1n8/1f3Z++78kQLwCL2FanE5yKL9rxaxDdUgSv
         tULw==
X-Gm-Message-State: AOJu0YwA4bYvZDqaGLqHFHtUILniPOpTc6Ptp9WUpRmDgjXWkc4GO988
	WSH0p7Cm14MLKxDivz9b00AlISxO3fwI7Eq+4a7TrFmDVM5xtZBvvnM=
X-Google-Smtp-Source: AGHT+IFAMahZs15ODyUaBARhKOt7W65Qa+q9VajWW68UUmWl77hlRI7vRcPFruqJRqo3SW8FzMfSqA8KbOkORZoo85U=
X-Received: by 2002:a05:6830:20b:b0:6da:1a47:136c with SMTP id
 em11-20020a056830020b00b006da1a47136cmr9448495otb.72.1702759579493; Sat, 16
 Dec 2023 12:46:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 16 Dec 2023 22:46:08 +0200
Message-ID: <CAA8EJpouGKzc5ed_8Sex82oqx-0ch8FAuouyF6xd3O9DmLkTJQ@mail.gmail.com>
Subject: sm8250: lpass_gfm lockdep trace
To: Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	"open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello,

Running linux-next on RB5 with lockdep enabled results in the
following backtrace:

[   37.461373] ======================================================
[   37.461376] WARNING: possible circular locking dependency detected
[   37.461379] 6.7.0-rc5-next-20231215-gdaf36fffbb8a-dirty #1313
Tainted: G     U
[   37.482615] ------------------------------------------------------
[   37.482617] kworker/3:0/31 is trying to acquire lock:
[   37.482621] ffffcaf2f5d71d68 (prepare_lock){+.+.}-{3:3}, at:
clk_prepare_lock+0x4c/0xa8
[   37.494216]
[   37.494216] but task is already holding lock:
[   37.494219] ffff579f5b149db0 (&psd->clock_mutex){+.+.}-{3:3}, at:
pm_clk_op_lock+0x70/0xd4
[   37.494236]
[   37.494236] which lock already depends on the new lock.
[   37.494236]
[   37.494239]
[   37.494239] the existing dependency chain (in reverse order) is:
[   37.494241]
[   37.494241] -> #1 (&psd->clock_mutex){+.+.}-{3:3}:
[   37.494251]        __mutex_lock+0xa0/0x77c
[   37.494261]        mutex_lock_nested+0x24/0x30
[   37.494269]        pm_clk_op_lock+0x70/0xd4
[   37.494275]        pm_clk_resume+0x50/0x17c
[   37.494281]        pm_generic_runtime_resume+0x2c/0x44
[   37.494288]        __rpm_callback+0x48/0x1ec
[   37.494294]        rpm_callback+0x6c/0x78
[   37.494300]        rpm_resume+0x4f0/0x754
[   37.494306]        __pm_runtime_resume+0x58/0xb8
[   37.494313]        clk_pm_runtime_get.part.0.isra.0+0x1c/0x88
[   37.494322]        __clk_register+0x4e8/0x8b4
[   37.494328]        devm_clk_hw_register+0x5c/0xd8
[   37.494334]        lpass_gfm_clk_driver_probe+0xf8/0x154
[   37.494343]        platform_probe+0x68/0xc0
[   37.494352]        really_probe+0x148/0x2ac
[   37.494360]        __driver_probe_device+0x78/0x12c
[   37.494366]        driver_probe_device+0x3c/0x160
[   37.494372]        __device_attach_driver+0xb8/0x138
[   37.494379]        bus_for_each_drv+0x80/0xdc
[   37.494386]        __device_attach+0x9c/0x188
[   37.494393]        device_initial_probe+0x14/0x20
[   37.494400]        bus_probe_device+0xac/0xb0
[   37.494407]        deferred_probe_work_func+0x8c/0xc8
[   37.494413]        process_one_work+0x1ec/0x51c
[   37.494422]        worker_thread+0x1ec/0x3e4
[   37.494429]        kthread+0x120/0x124
[   37.494436]        ret_from_fork+0x10/0x20
[   37.494443]
[   37.494443] -> #0 (prepare_lock){+.+.}-{3:3}:
[   37.494453]        __lock_acquire+0x12c4/0x1ebc
[   37.494461]        lock_acquire+0x1ec/0x314
[   37.679841]        __mutex_lock+0xa0/0x77c
[   37.684081]        mutex_lock_nested+0x24/0x30
[   37.684089]        clk_prepare_lock+0x4c/0xa8
[   37.684095]        clk_unprepare+0x24/0x44
[   37.684100]        pm_clk_suspend+0xa0/0x140
[   37.684106]        pm_generic_runtime_suspend+0x2c/0x44
[   37.684112]        __rpm_callback+0x48/0x1ec
[   37.684117]        rpm_callback+0x6c/0x78
[   37.684123]        rpm_suspend+0x138/0x638
[   37.684129]        pm_runtime_work+0xc4/0xc8
[   37.684134]        process_one_work+0x1ec/0x51c
[   37.684141]        worker_thread+0x1ec/0x3e4
[   37.684148]        kthread+0x120/0x124
[   37.684154]        ret_from_fork+0x10/0x20
[   37.684159]
[   37.684159] other info that might help us debug this:
[   37.684159]
[   37.684163]  Possible unsafe locking scenario:
[   37.684163]
[   37.684165]        CPU0                    CPU1
[   37.684168]        ----                    ----
[   37.684170]   lock(&psd->clock_mutex);
[   37.684176]                                lock(prepare_lock);
[   37.684181]                                lock(&psd->clock_mutex);
[   37.684187]   lock(prepare_lock);
[   37.684192]
[   37.684192]  *** DEADLOCK ***
[   37.684192]
[   37.684194] 3 locks held by kworker/3:0/31:
[   37.684198]  #0: ffff579f40d98338 ((wq_completion)pm){+.+.}-{0:0},
at: process_one_work+0x14c/0x51c
[   37.684217]  #1: ffff800080293de0
((work_completion)(&dev->power.work)){+.+.}-{0:0}, at:
process_one_work+0x14c/0x51c
[   37.684235]  #2: ffff579f5b149db0 (&psd->clock_mutex){+.+.}-{3:3},
at: pm_clk_op_lock+0x70/0xd4
[   37.684252]
[   37.684252] stack backtrace:
[   37.684255] CPU: 3 PID: 31 Comm: kworker/3:0 Tainted: G     U
      6.7.0-rc5-next-20231215-gdaf36fffbb8a-dirty #1313
[   37.684262] Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
[   37.684268] Workqueue: pm pm_runtime_work
[   37.684277] Call trace:
[   37.684279]  dump_backtrace+0x98/0xf0
[   37.684285]  show_stack+0x18/0x24
[   37.684290]  dump_stack_lvl+0x60/0xac
[   37.684299]  dump_stack+0x18/0x24
[   37.684305]  print_circular_bug+0x288/0x368
[   37.684311]  check_noncircular+0x158/0x16c
[   37.684316]  __lock_acquire+0x12c4/0x1ebc
[   37.684322]  lock_acquire+0x1ec/0x314
[   37.684327]  __mutex_lock+0xa0/0x77c
[   37.684334]  mutex_lock_nested+0x24/0x30
[   37.684340]  clk_prepare_lock+0x4c/0xa8
[   37.684346]  clk_unprepare+0x24/0x44
[   37.684351]  pm_clk_suspend+0xa0/0x140
[   37.684357]  pm_generic_runtime_suspend+0x2c/0x44
[   37.909043]  __rpm_callback+0x48/0x1ec
[   37.912918]  rpm_callback+0x6c/0x78
[   37.912925]  rpm_suspend+0x138/0x638
[   37.912931]  pm_runtime_work+0xc4/0xc8
[   37.912937]  process_one_work+0x1ec/0x51c
[   37.912944]  worker_thread+0x1ec/0x3e4
[   37.912950]  kthread+0x120/0x124
[   37.912956]  ret_from_fork+0x10/0x20
[   37.933142] wsa881x-codec sdw:1:0:0217:2110:00:4: nonexclusive
access to GPIO for powerdown
[   37.951383] qcom-soundwire 3250000.soundwire: Qualcomm Soundwire
controller v1.5.1 Registered
[   37.978677] input: Qualcomm-RB5-WSA8815-Speakers-D Headset Jack as
/devices/platform/sound/sound/card0/input2


-- 
With best wishes
Dmitry

