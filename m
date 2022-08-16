Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 380F1595D9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Aug 2022 15:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234766AbiHPNqu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Aug 2022 09:46:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230181AbiHPNqt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Aug 2022 09:46:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 163FD92F69
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Aug 2022 06:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660657603;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=p5OSIpWT90frefg7xGzBYHPg0+V86mBzdAKs9FXoz/g=;
        b=gHqFahmt3mGJPFawNt6cSl1+myUEfZiAqCc2+KKtmKo/pf+H3aQve3bcx0J2o3jlXb6SuF
        j0qKiH7V587ET3uViYG4unXEhpHFiO/cYqiPEYVrwdOjkHvv/T8F6AwshOoo7WvkTSGJa6
        YHU5JQp5OeH4SzNvKrCCXSka04WShv8=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-263-TFGzStQiPVmT-c0di5Yq-w-1; Tue, 16 Aug 2022 09:46:42 -0400
X-MC-Unique: TFGzStQiPVmT-c0di5Yq-w-1
Received: by mail-vk1-f197.google.com with SMTP id n205-20020a1fa4d6000000b0037d1d4d3237so2061035vke.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Aug 2022 06:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=p5OSIpWT90frefg7xGzBYHPg0+V86mBzdAKs9FXoz/g=;
        b=ULTnA4HaDhH70kPMbexQ32AJ3owGyDykPtRlzwm60fMIdbOmtbFQp83lVSrHjRBy5h
         Ch2mzoTICxOJjlBCds/wSFrrp+2B/yeAcY2s487eAuONOsWMpyxr3CrmZTtxSgqHizYR
         rZGgUfIoYXRgBptQQNRCMu3tsqRKXw2g2fNBl1R68v/ckxy1yWAPD/MVkp7r7QrKa6tv
         p36l20Ly5IWgOUPrkY/k67Ia43hj3iSlnOY5v+pwB4FF6pCEZbNa+5BK9PcV2nQ+hqWk
         EsI5vO9NN8zFxTrjU5BzzXTr/4T+6U28Qy5Lf8cjJALWRT+BoTp1cjN1Hx+GHNQUpDbZ
         Vd2A==
X-Gm-Message-State: ACgBeo0i5F6OlyOlgFRknUo5tbBxrVJUHAMHVDQlM47VtQ9KYQduNana
        BAgZYD14YO3wEXTIIcm+qTWC9b4CewiTs/iaQEGqDICfIcVCxAzpxOhaTPwRKSnsMIp+Vry5R4k
        30eOgzO16AK4PiG6oEQaPaoYT4A==
X-Received: by 2002:a05:6102:3d24:b0:388:4323:8e78 with SMTP id i36-20020a0561023d2400b0038843238e78mr8492048vsv.86.1660657601136;
        Tue, 16 Aug 2022 06:46:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7dYbwWeCNwNJfUHQbDiDlC8h6iUJ+La5uDCvvn1TuftLxbb9HVYmT4vCD5UcNhSSTnlyNyGQ==
X-Received: by 2002:a05:6102:3d24:b0:388:4323:8e78 with SMTP id i36-20020a0561023d2400b0038843238e78mr8492037vsv.86.1660657600840;
        Tue, 16 Aug 2022 06:46:40 -0700 (PDT)
Received: from minerva.. ([181.120.137.43])
        by smtp.gmail.com with ESMTPSA id g11-20020ab0130b000000b0038275916987sm7116550uae.14.2022.08.16.06.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 06:46:40 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Javier Martinez Canillas <javierm@redhat.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v4] drm/msm: Make .remove and .shutdown HW shutdown consistent
Date:   Tue, 16 Aug 2022 15:46:12 +0200
Message-Id: <20220816134612.916527-1-javierm@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drivers' .remove and .shutdown callbacks are executed on different code
paths. The former is called when a device is removed from the bus, while
the latter is called at system shutdown time to quiesce the device.

This means that some overlap exists between the two, because both have to
take care of properly shutting down the hardware. But currently the logic
used in these two callbacks isn't consistent in msm drivers, which could
lead to kernel panic.

For example, on .remove the component is deleted and its .unbind callback
leads to the hardware being shutdown but only if the DRM device has been
marked as registered.

That check doesn't exist in the .shutdown logic and this can lead to the
driver calling drm_atomic_helper_shutdown() for a DRM device that hasn't
been properly initialized.

A situation like this can happen if drivers for expected sub-devices fail
to probe, since the .bind callback will never be executed. If that is the
case, drm_atomic_helper_shutdown() will attempt to take mutexes that are
only initialized if drm_mode_config_init() is called during a device bind.

This bug was attempted to be fixed in commit 623f279c7781 ("drm/msm: fix
shutdown hook in case GPU components failed to bind"), but unfortunately
it still happens in some cases as the one mentioned above, i.e:

  systemd-shutdown[1]: Powering off.
  kvm: exiting hardware virtualization
  platform wifi-firmware.0: Removing from iommu group 12
  platform video-firmware.0: Removing from iommu group 10
  ------------[ cut here ]------------
  WARNING: CPU: 6 PID: 1 at drivers/gpu/drm/drm_modeset_lock.c:317 drm_modeset_lock_all_ctx+0x3c4/0x3d0
  ...
  Hardware name: Google CoachZ (rev3+) (DT)
  pstate: a0400009 (NzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  pc : drm_modeset_lock_all_ctx+0x3c4/0x3d0
  lr : drm_modeset_lock_all_ctx+0x48/0x3d0
  sp : ffff80000805bb80
  x29: ffff80000805bb80 x28: ffff327c00128000 x27: 0000000000000000
  x26: 0000000000000000 x25: 0000000000000001 x24: ffffc95d820ec030
  x23: ffff327c00bbd090 x22: ffffc95d8215eca0 x21: ffff327c039c5800
  x20: ffff327c039c5988 x19: ffff80000805bbe8 x18: 0000000000000034
  x17: 000000040044ffff x16: ffffc95d80cac920 x15: 0000000000000000
  x14: 0000000000000315 x13: 0000000000000315 x12: 0000000000000000
  x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
  x8 : ffff80000805bc28 x7 : 0000000000000000 x6 : 0000000000000000
  x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
  x2 : ffff327c00128000 x1 : 0000000000000000 x0 : ffff327c039c59b0
  Call trace:
   drm_modeset_lock_all_ctx+0x3c4/0x3d0
   drm_atomic_helper_shutdown+0x70/0x134
   msm_drv_shutdown+0x30/0x40
   platform_shutdown+0x28/0x40
   device_shutdown+0x148/0x350
   kernel_power_off+0x38/0x80
   __do_sys_reboot+0x288/0x2c0
   __arm64_sys_reboot+0x28/0x34
   invoke_syscall+0x48/0x114
   el0_svc_common.constprop.0+0x44/0xec
   do_el0_svc+0x2c/0xc0
   el0_svc+0x2c/0x84
   el0t_64_sync_handler+0x11c/0x150
   el0t_64_sync+0x18c/0x190
  ---[ end trace 0000000000000000 ]---
  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000018
  Mem abort info:
    ESR = 0x0000000096000004
    EC = 0x25: DABT (current EL), IL = 32 bits
    SET = 0, FnV = 0
    EA = 0, S1PTW = 0
    FSC = 0x04: level 0 translation fault
  Data abort info:
    ISV = 0, ISS = 0x00000004
    CM = 0, WnR = 0
  user pgtable: 4k pages, 48-bit VAs, pgdp=000000010eab1000
  [0000000000000018] pgd=0000000000000000, p4d=0000000000000000
  Internal error: Oops: 96000004 [#1] PREEMPT SMP
  ...
  Hardware name: Google CoachZ (rev3+) (DT)
  pstate: a0400009 (NzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  pc : ww_mutex_lock+0x28/0x32c
  lr : drm_modeset_lock_all_ctx+0x1b0/0x3d0
  sp : ffff80000805bb50
  x29: ffff80000805bb50 x28: ffff327c00128000 x27: 0000000000000000
  x26: 0000000000000000 x25: 0000000000000001 x24: 0000000000000018
  x23: ffff80000805bc10 x22: ffff327c039c5ad8 x21: ffff327c039c5800
  x20: ffff80000805bbe8 x19: 0000000000000018 x18: 0000000000000034
  x17: 000000040044ffff x16: ffffc95d80cac920 x15: 0000000000000000
  x14: 0000000000000315 x13: 0000000000000315 x12: 0000000000000000
  x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
  x8 : ffff80000805bc28 x7 : 0000000000000000 x6 : 0000000000000000
  x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
  x2 : ffff327c00128000 x1 : 0000000000000000 x0 : 0000000000000018
  Call trace:
   ww_mutex_lock+0x28/0x32c
   drm_modeset_lock_all_ctx+0x1b0/0x3d0
   drm_atomic_helper_shutdown+0x70/0x134
   msm_drv_shutdown+0x30/0x40
   platform_shutdown+0x28/0x40
   device_shutdown+0x148/0x350
   kernel_power_off+0x38/0x80
   __do_sys_reboot+0x288/0x2c0
   __arm64_sys_reboot+0x28/0x34
   invoke_syscall+0x48/0x114
   el0_svc_common.constprop.0+0x44/0xec
   do_el0_svc+0x2c/0xc0
   el0_svc+0x2c/0x84
   el0t_64_sync_handler+0x11c/0x150
   el0t_64_sync+0x18c/0x190
  Code: aa0103f4 d503201f d2800001 aa0103e3 (c8e37c02)
  ---[ end trace 0000000000000000 ]---
  Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
  Kernel Offset: 0x495d77c00000 from 0xffff800008000000
  PHYS_OFFSET: 0xffffcd8500000000
  CPU features: 0x800,00c2a015,19801c82
  Memory Limit: none
  ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

Fixes: 9d5cbf5fe46e ("drm/msm: add shutdown support for display platform_driver")
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---

Changes in v4:
- Remove the kernel log timestamps and just keep the stacktrace (Abhinav Kumar).
- Add Abhinav Kumar Reviewed-by tag.

Changes in v3:
- Drop the msm_shutdown_hw() wrapper and just call drm_atomic_helper_shutdown()
  in both callbacks (Dmitry Baryshkov).
- Copy the comment in msm_drm_uninit() to msm_drv_shutdown() (Dmitry Baryshkov).

Changes in v2:
- Take the registered check out of the msm_shutdown_hw() and make callers to check instead.
- Make msm_shutdown_hw() an inline function.
- Add a Fixes: tag.

 drivers/gpu/drm/msm/msm_drv.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 1d0bafedd585..226d8d4629d2 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1242,10 +1242,15 @@ void msm_drv_shutdown(struct platform_device *pdev)
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
 	struct drm_device *drm = priv ? priv->dev : NULL;
 
-	if (!priv || !priv->kms)
-		return;
-
-	drm_atomic_helper_shutdown(drm);
+	/*
+	 * Shutdown the hw if we're far enough along where things might be on.
+	 * If we run this too early, we'll end up panicking in any variety of
+	 * places. Since we don't register the drm device until late in
+	 * msm_drm_init, drm_dev->registered is used as an indicator that the
+	 * shutdown will be successful.
+	 */
+	if (drm && drm->registered)
+		drm_atomic_helper_shutdown(drm);
 }
 
 static struct platform_driver msm_platform_driver = {
-- 
2.37.1

