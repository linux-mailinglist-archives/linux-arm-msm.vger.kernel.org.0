Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB07480F7C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Dec 2021 05:12:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233830AbhL2EM2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Dec 2021 23:12:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232404AbhL2EM1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Dec 2021 23:12:27 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E55CC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Dec 2021 20:12:27 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id n17-20020a9d64d1000000b00579cf677301so26803670otl.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Dec 2021 20:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v7CDjeE5jW+B6WRS62ZS6O0dpHSvARE91qFSq23R+iE=;
        b=Pf25Toy3VhEVKDPSTCMJoIaMlmz3tplb+C/JM803ZEwbK0XSdyZVaI81VxbOu1oO5z
         KdgIb3E+lKWTqZMq4QtkDgnhwuy+5NJsgL5aftD4+trvketP3SPzyU4vCZxqv2EccNt5
         sApmDwXMjdzfvg4cZ0e7eIkYrLCaFQRTkbhQ4s70Rk3bBs6s50f8QARLaI6WHVKqtH+7
         Ht4Hp0nx7+HXpDXvDf+AuIMxzcV1DUB+3fgXcCIn1s1KHSewi/JOqMQrk5cEq7cBEprs
         l8O4dyhuZSPAS/8OHCpoaAH9HpECc/qBWKLpx7o4KKHKwqyBkyFz73WBzH3qBdbUX34a
         jjcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v7CDjeE5jW+B6WRS62ZS6O0dpHSvARE91qFSq23R+iE=;
        b=iVXwGuSftlNOjz4sJIOmkV6FUmq1s0EakgMh2acNDxv7wPZMaY2aGKiSmxL/qP4aEm
         tllGBIc7QeOqaiNU8y0V/cxy6O8d3TWxUADT+pDl72coLlouu6CI/oLs1q5g2kIWrCn3
         xMBZVlr/YhqvATUARlVN/MupMe8ceICjJmczsNhc/2zLgqE8Y7AbLSw7u+F3nMlPA+n4
         ORfWoqkeB8vp7GYNDGgJN/sZDQL1o0plYMAXGtBZGVA1AScaB9hYRKp05AE9j+n7F9GI
         68x5C70B34kPwiotjgwwG5FXLklOmKz4aZkZd+kXp0GWpNvHoqjIM7vMhtjWQrKWgCHT
         jAQg==
X-Gm-Message-State: AOAM531CilOwtrAwkU5jlgP4Rur4SnUFQCgN9yHe+B7N1NLE6YnMl9Vu
        DN6nXEs7NqXro4Q6Nxs5jNJY5fySGo2OFw==
X-Google-Smtp-Source: ABdhPJyv4OCTP83HxuEyvA+CllD1b+sDZ3yjheAk30RxpzMAoDVZphL4t6bE6SkxiM7ahXfkKv8jug==
X-Received: by 2002:a05:6830:1285:: with SMTP id z5mr18176183otp.180.1640751146731;
        Tue, 28 Dec 2021 20:12:26 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id b24sm3754202oic.16.2021.12.28.20.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Dec 2021 20:12:26 -0800 (PST)
Date:   Tue, 28 Dec 2021 22:12:21 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Kuogee Hsieh <khsieh@codeaurora.org>
Subject: Re: [PATCH v2 2/2] drm/msm/dp: rewrite dss_module_power to use bulk
 clock functions
Message-ID: <YcvgJcxWDfaSMVVg@builder.lan>
References: <20211126023516.1108411-1-dmitry.baryshkov@linaro.org>
 <20211126023516.1108411-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211126023516.1108411-3-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 25 Nov 20:35 CST 2021, Dmitry Baryshkov wrote:

> In order to simplify DP code, drop hand-coded loops over clock arrays,
> replacing them with clk_bulk_* functions.
> 

I've yet to debug this, but applying the two patches and attaching an
HDMI cable to my USB dongle results in the follwing splat on the 8350
HDK.

[   39.658840] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[   39.667883] Mem abort info:
[   39.670774]   ESR = 0x96000006
[   39.673940]   EC = 0x25: DABT (current EL), IL = 32 bits
[   39.679417]   SET = 0, FnV = 0
[   39.682582]   EA = 0, S1PTW = 0
[   39.685825]   FSC = 0x06: level 2 translation fault
[   39.690851] Data abort info:
[   39.693838]   ISV = 0, ISS = 0x00000006
[   39.697797]   CM = 0, WnR = 0
[   39.700864] user pgtable: 4k pages, 48-bit VAs, pgdp=000000010eb8d000
[   39.707501] [0000000000000000] pgd=080000010f097003, p4d=080000010f097003, pud=080000010ba58003, pmd=0000000000000000
[   39.718425] Internal error: Oops: 96000006 [#1] PREEMPT SMP
[   39.724169] Modules linked in: pmic_glink_altmode qcom_pmic_glink_power cfg80211 rfkill 8021q garp mrp stp llc microchip lan78xx snd_soc_hdmi_codec pmic_glink pdr_interface rpmsg_char qrtr_smd qrtr fsa4480 qcom_q6v5_pas qcom_pil_info i2c_qcom_geni qcom_q6v5 msm qcom_sysmon qcom_stats gpu_sched crct10dif_ce drm_kms_helper qcom_common qcom_glink_smem gpucc_sm8350 phy_qcom_qmp mdt_loader typec ufs_qcom qmi_helpers qcom_rng socinfo qnoc_sm8350 rmtfs_mem fuse drm ipv6
[   39.766330] CPU: 0 PID: 85 Comm: kworker/0:3 Not tainted 5.16.0-rc5-next-20211215-00046-g2f90133452d9 #280
[   39.776256] Hardware name: Qualcomm Technologies, Inc. SM8350 HDK (DT)
[   39.782969] Workqueue: events pmic_glink_altmode_worker [pmic_glink_altmode]
[   39.790235] pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   39.797393] pc : __pi_strcmp+0x1c/0xf0
[   39.801271] lr : dp_ctrl_set_clock_rate+0x8c/0xf0 [msm]
[   39.806737] sp : ffff800008adbbc0
[   39.810153] x29: ffff800008adbbc0 x28: 0000000000000000 x27: 0000000000000000
[   39.817501] x26: ffffb60107f74270 x25: ffff297a49b33c80 x24: 00000000202fbf00
[   39.824846] x23: 0000000000000001 x22: ffff297a4b400580 x21: 0000000000000020
[   39.832188] x20: ffffb600e3d78068 x19: 0000000000000000 x18: ffffffffffffffff
[   39.839541] x17: 6b6c63206e6f2030 x16: ffffb601063476c0 x15: 0720072007200720
[   39.846893] x14: 0720072007200720 x13: ffffb60107c622c8 x12: 0000000000000765
[   39.854229] x11: 0000000000000277 x10: 0101010101010101 x9 : ffffb60107c622c8
[   39.861565] x8 : 00000000ffffefff x7 : 0000000000000000 x6 : ffffb60107cba2c8
[   39.868902] x5 : 0000000000000000 x4 : ffff297cbe8619d8 x3 : 0000000000000000
[   39.876240] x2 : 0000000000000000 x1 : ffffb600e3d78068 x0 : 0000000000000000
[   39.883594] Call trace:
[   39.886124]  __pi_strcmp+0x1c/0xf0
[   39.889638]  dp_ctrl_enable_mainlink_clocks+0x98/0x110 [msm]
[   39.895537]  dp_ctrl_on_link+0x98/0x3f0 [msm]
[   39.900096]  dp_display_process_hpd_high+0xa8/0x100 [msm]
[   39.905731]  dp_display_usbpd_attention_cb+0x164/0x1a4 [msm]
[   39.911629]  dp_hpd_oob_event+0x74/0xa4 [msm]
[   39.916195]  dp_display_oob_hotplug_event+0x1c/0x2c [msm]
[   39.921831]  dp_oob_hotplug_event+0x18/0x24 [msm]
[   39.926756]  drm_connector_oob_hotplug_event+0x40/0x60 [drm]
[   39.932686]  pmic_glink_altmode_worker+0x7c/0x194 [pmic_glink_altmode]
[   39.939398]  process_one_work+0x1d0/0x350
[   39.943526]  worker_thread+0x13c/0x460
[   39.947390]  kthread+0x17c/0x190
[   39.950722]  ret_from_fork+0x10/0x20
[   39.954416] Code: f24008ff 540003e1 f2400807 54000241 (f8408402)
[   39.960684] ---[ end trace 0000000000000000 ]---

Regards,
Bjorn
