Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F4B32E6BB2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 00:14:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730625AbgL1Wzv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Dec 2020 17:55:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729517AbgL1Vcz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Dec 2020 16:32:55 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E08F3C0613D6;
        Mon, 28 Dec 2020 13:32:14 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id c7so10939282edv.6;
        Mon, 28 Dec 2020 13:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uElko8H1IEIjIJWyRSXhBqJLcGQEtf8eK+EqM9U481M=;
        b=IbbTT7ALMMqqUaF4QZrwr6tlTaNCEIbaUlJxEmJMM8uGOgHY9f0q8erCX/u8BNs/6Q
         8b9BvBv3pXOBXQ8FSJ2+I1Uepfifbt+kd2mTXt8cOZxZY/Ib0s1cwb3XQH5F1zRCXF82
         xoHZ3ZS/1sO+YlZcnRkKMXfaEIJoPS+r0F3S0PLUOEhzOZXsyqRLNEPghGsncCsdr85J
         CyJzIBEaNxvqCvgMA0P2GoPY77NirsU42mUa+3H8xrPVABV1qkH5hhuk2RtqvIISv6wL
         i+OoNWKvZ7oU3HD2XkKURdVV/IfSszFAdMMbjAKX7E5PMbbSkjg0iibAUdZFDSHR96SP
         Pv/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uElko8H1IEIjIJWyRSXhBqJLcGQEtf8eK+EqM9U481M=;
        b=sNNKZao0iHyySFQIE+EZq9hNO2mxZEXK7oncV4Exb7GsJZcfPZB3mAEEylZzrSlZF1
         RpiWOSRhebLJNCfZcJ2RbUaNd97VvGMWAJ7YZEQB6mRZ3uTZREU7hPBKFLCNTKQB9+HH
         rSygxujGykfrcgOq7hiLKeSD1EhTKTpFohz7By43hxtZ6jwM+O32JUAeZHj8Y1sAoUIS
         S6TI5R1iH5gXW6ALKMao7FBNWxi4ta305jQtns8HR5nnbe8a6f0rw/TMM+AXDX+5Buao
         d4EDlJGH3FMxUTQ/eHSzjoiMKfJ/GaCK3vok66D7WaJALfks1eAb8zBrLHpiZiArhvgz
         85xw==
X-Gm-Message-State: AOAM533kht8EQgup/l/96XnQuGIimriLaalUukDsgdmQxInLhxU8HANq
        dRczGx96JdTamdYOk9KdyvEhGfsQxB9AlrKv
X-Google-Smtp-Source: ABdhPJw0FdwRw6JLk9hdMPSzqQWYb9J7SqdecK06ic0J77rx6ODCqNWV1rAkOnQJ/MIMoYy5eIKZIQ==
X-Received: by 2002:aa7:ce94:: with SMTP id y20mr43187542edv.361.1609191133408;
        Mon, 28 Dec 2020 13:32:13 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id op5sm17474286ejb.43.2020.12.28.13.32.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Dec 2020 13:32:12 -0800 (PST)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH 1/2] drm/msm: Fix null dereference in _msm_gem_new
Date:   Mon, 28 Dec 2020 23:31:30 +0200
Message-Id: <20201228213131.2316293-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The crash was caused by locking an uninitialized lock during init of
drm_gem_object. The lock changed in the breaking commit, but the init
was not moved accordingly.

 8<--- cut here ---
 Unable to handle kernel NULL pointer dereference at virtual address 00000000
 pgd = (ptrval)
 [00000000] *pgd=00000000
 Internal error: Oops: 5 [#1] PREEMPT SMP ARM
 Modules linked in: msm(+) qcom_spmi_vadc qcom_vadc_common dm_mod usb_f_rndis rmi_i2c rmi_core qnoc_msm8974 icc_smd_rpm pm8941_pwrkey
 CPU: 2 PID: 1020 Comm: udevd Not tainted 5.10.0-postmarketos-qcom-msm8974 #8
 Hardware name: Generic DT based system
 PC is at ww_mutex_lock+0x20/0xb0
 LR is at _msm_gem_new+0x13c/0x298 [msm]
 pc : [<c0be31e8>]    lr : [<bf0b3404>]    psr: 20000013
 sp : c36e7ad0  ip : c3b3d800  fp : 00000000
 r10: 00000001  r9 : c3b22800  r8 : 00000000
 r7 : c3b23000  r6 : c3b3d600  r5 : c3b3d600  r4 : 00000000
 r3 : c34b4780  r2 : c3b3d6f4  r1 : 00000000  r0 : 00000000
 Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
 Control: 10c5787d  Table: 03ae406a  DAC: 00000051
 Process udevd (pid: 1020, stack limit = 0x(ptrval))
 Stack: (0xc36e7ad0 to 0xc36e8000)
 [...]
 [<c0be31e8>] (ww_mutex_lock) from [<bf0b3404>] (_msm_gem_new+0x13c/0x298 [msm])
 [<bf0b3404>] (_msm_gem_new [msm]) from [<bf0b3aa8>] (_msm_gem_kernel_new+0x20/0x190 [msm])
 [<bf0b3aa8>] (_msm_gem_kernel_new [msm]) from [<bf0b4a30>] (msm_gem_kernel_new+0x24/0x2c [msm])
 [<bf0b4a30>] (msm_gem_kernel_new [msm]) from [<bf0b8e2c>] (msm_gpu_init+0x308/0x548 [msm])
 [<bf0b8e2c>] (msm_gpu_init [msm]) from [<bf060a90>] (adreno_gpu_init+0x13c/0x240 [msm])
 [<bf060a90>] (adreno_gpu_init [msm]) from [<bf062b1c>] (a3xx_gpu_init+0x78/0x1dc [msm])
 [<bf062b1c>] (a3xx_gpu_init [msm]) from [<bf05f394>] (adreno_bind+0x1cc/0x274 [msm])
 [<bf05f394>] (adreno_bind [msm]) from [<c087a254>] (component_bind_all+0x11c/0x278)
 [<c087a254>] (component_bind_all) from [<bf0b11d4>] (msm_drm_bind+0x18c/0x5b4 [msm])
 [<bf0b11d4>] (msm_drm_bind [msm]) from [<c0879ea0>] (try_to_bring_up_master+0x200/0x2c8)
 [<c0879ea0>] (try_to_bring_up_master) from [<c087a648>] (component_master_add_with_match+0xc8/0xfc)
 [<c087a648>] (component_master_add_with_match) from [<bf0b0c3c>] (msm_pdev_probe+0x288/0x2c4 [msm])
 [<bf0b0c3c>] (msm_pdev_probe [msm]) from [<c08844cc>] (platform_drv_probe+0x48/0x98)
 [<c08844cc>] (platform_drv_probe) from [<c0881cc4>] (really_probe+0x108/0x528)
 [<c0881cc4>] (really_probe) from [<c0882480>] (driver_probe_device+0x78/0x1d4)
 [<c0882480>] (driver_probe_device) from [<c08828dc>] (device_driver_attach+0xa8/0xb0)
 [<c08828dc>] (device_driver_attach) from [<c0882998>] (__driver_attach+0xb4/0x154)
 [<c0882998>] (__driver_attach) from [<c087fa1c>] (bus_for_each_dev+0x78/0xb8)
 [<c087fa1c>] (bus_for_each_dev) from [<c0880e98>] (bus_add_driver+0x10c/0x208)
 [<c0880e98>] (bus_add_driver) from [<c0883504>] (driver_register+0x88/0x118)
 [<c0883504>] (driver_register) from [<c0302098>] (do_one_initcall+0x50/0x2b0)
 [<c0302098>] (do_one_initcall) from [<c03bace4>] (do_init_module+0x60/0x288)
 [<c03bace4>] (do_init_module) from [<c03bdf1c>] (sys_finit_module+0xd4/0x120)
 [<c03bdf1c>] (sys_finit_module) from [<c0300060>] (ret_fast_syscall+0x0/0x54)
 Exception stack(0xc36e7fa8 to 0xc36e7ff0)
 7fa0:                   00020000 00000000 00000007 b6edd5b0 00000000 b6f2ff20
 7fc0: 00020000 00000000 0000017b 0000017b b6eef980 bedc3a54 00473c99 00000000
 7fe0: b6edd5b0 bedc3918 b6ed8a5f b6f6a8b0
 Code: e3c3303f e593300c e1a04000 f590f000 (e1940f9f)
 ---[ end trace 277e2a3da40bbb76 ]---

Fixes: 6c0e3ea250476 ("drm/msm/gem: Switch over to obj->resv for locking")
Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 32d5c514e28ad..c658deb31eb5d 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1116,6 +1116,8 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
 		struct msm_gem_vma *vma;
 		struct page **pages;
 
+		drm_gem_private_object_init(dev, obj, size);
+
 		msm_gem_lock(obj);
 
 		vma = add_vma(obj, NULL);
@@ -1127,7 +1129,6 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
 
 		to_msm_bo(obj)->vram_node = &vma->node;
 
-		drm_gem_private_object_init(dev, obj, size);
 
 		pages = get_pages(obj);
 		if (IS_ERR(pages)) {

base-commit: d7a03a44a5e93f39ece70ec75d25c6088caa0fdb
-- 
2.29.2

