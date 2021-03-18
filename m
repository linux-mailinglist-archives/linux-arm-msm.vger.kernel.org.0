Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FE61340ED1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Mar 2021 21:06:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230220AbhCRUFs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Mar 2021 16:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232955AbhCRUFn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Mar 2021 16:05:43 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 662ECC06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Mar 2021 13:05:42 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id s17so9093589ljc.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Mar 2021 13:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qTXdrqQiFvhXV8lyxgPO5t48QTulHRLpGAEUMWT2zU4=;
        b=K35e8Og+puj32ZpEi5HsRYTFOKd3y2Wi5zpPxY3FAv8wKAuE/GbEbI7GlrqS5GKWsl
         J2i7Y02t8S0vsIDfYmT/jdSDkbWAolnnr9zTq6YtXLDsn6neSf3KVss3nZekJmFIhhfl
         r8OMUY54NfJo32/2sMLxrYSLKwYtHuHNF+nk9PcuqHo21ToLyKF+OXJLk/twD2bNk/HD
         soDmiwPH2NeHHCQ3vdqv/Y1i4byN/LBS9PyS2+SWahcRjVwUVWNYQ65O88GsqjFvoh94
         kpoEzJwy5EBCLrvbFcZwsmvWS99kMBfO/ketmQ69gEd/WuTIT8sb7XCS0M7+UuLpuyXu
         K51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qTXdrqQiFvhXV8lyxgPO5t48QTulHRLpGAEUMWT2zU4=;
        b=g20J2lRUNRAET7k3l5HY8TG3wwNOpD/r9WstsA4+2VOOGaa7Im9tYHpebvbKfICcNn
         aX8Dh4HuJnpxQGZ6pYHQ/nm6r5r86sTICE88UvKyDDM6dkSnk8xW9tvAA3QfbAWiqziK
         ooHhT+O5T95C5GK4iuqFScgl0cZjSeoGYcWNaSOujC2HOJ2Ral2KAHf752uwTGlNKlbZ
         tMNQSknv5ERZUC0HHr5ekimO7ed1ZuDtERMVbm+XcuUa6aBUCyZiLxiZM6SFDm3m3UvJ
         lnhE+mdk9ENl0Gw9Vwq0HFkgSz3QLx7IkI6kQWMOxBTyReimak4I7zkscWUx9fhTZv6i
         otIA==
X-Gm-Message-State: AOAM530X3HpvYzfQa4aMqspaVP8vzrzwOPYbplYbX1hfujldbotChKR6
        leaj+LNvIEeqgJCmT9w/CaCnhw==
X-Google-Smtp-Source: ABdhPJzlDzlGzdc/pko2iXEN451KHvTJHzvzpyM4dRKRSpnfaBMp191k/w2b1RD5WMNweq49rejWEQ==
X-Received: by 2002:a2e:6c06:: with SMTP id h6mr6558660ljc.154.1616097940933;
        Thu, 18 Mar 2021 13:05:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m16sm352223lfu.220.2021.03.18.13.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 13:05:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH] gpu/drm/msm: fix shutdown hook in case GPU components failed to bind
Date:   Thu, 18 Mar 2021 23:05:39 +0300
Message-Id: <20210318200539.2243945-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

if GPU components have failed to bind, shutdown callback would fail with
the following backtrace. Add safeguard check to stop that oops from
happening and allow the board to reboot.

[   66.617046] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[   66.626066] Mem abort info:
[   66.628939]   ESR = 0x96000006
[   66.632088]   EC = 0x25: DABT (current EL), IL = 32 bits
[   66.637542]   SET = 0, FnV = 0
[   66.640688]   EA = 0, S1PTW = 0
[   66.643924] Data abort info:
[   66.646889]   ISV = 0, ISS = 0x00000006
[   66.650832]   CM = 0, WnR = 0
[   66.653890] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000107f81000
[   66.660505] [0000000000000000] pgd=0000000100bb2003, p4d=0000000100bb2003, pud=0000000100897003, pmd=0000000000000000
[   66.671398] Internal error: Oops: 96000006 [#1] PREEMPT SMP
[   66.677115] Modules linked in:
[   66.680261] CPU: 6 PID: 352 Comm: reboot Not tainted 5.11.0-rc2-00309-g79e3faa756b2 #38
[   66.688473] Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
[   66.695347] pstate: 60400005 (nZCv daif +PAN -UAO -TCO BTYPE=--)
[   66.701507] pc : msm_atomic_commit_tail+0x78/0x4e0
[   66.706437] lr : commit_tail+0xa4/0x184
[   66.710381] sp : ffff8000108f3af0
[   66.713791] x29: ffff8000108f3af0 x28: ffff418c44337000
[   66.719242] x27: 0000000000000000 x26: ffff418c40a24490
[   66.724693] x25: ffffd3a842a4f1a0 x24: 0000000000000008
[   66.730146] x23: ffffd3a84313f030 x22: ffff418c444ce000
[   66.735598] x21: ffff418c408a4980 x20: 0000000000000000
[   66.741049] x19: 0000000000000000 x18: ffff800010710fbc
[   66.746500] x17: 000000000000000c x16: 0000000000000001
[   66.751954] x15: 0000000000010008 x14: 0000000000000068
[   66.757405] x13: 0000000000000001 x12: 0000000000000000
[   66.762855] x11: 0000000000000001 x10: 00000000000009b0
[   66.768306] x9 : ffffd3a843192000 x8 : ffff418c44337000
[   66.773757] x7 : 0000000000000000 x6 : 00000000a401b34e
[   66.779210] x5 : 00ffffffffffffff x4 : 0000000000000000
[   66.784660] x3 : 0000000000000000 x2 : ffff418c444ce000
[   66.790111] x1 : ffffd3a841dce530 x0 : ffff418c444cf000
[   66.795563] Call trace:
[   66.798075]  msm_atomic_commit_tail+0x78/0x4e0
[   66.802633]  commit_tail+0xa4/0x184
[   66.806217]  drm_atomic_helper_commit+0x160/0x390
[   66.811051]  drm_atomic_commit+0x4c/0x60
[   66.815082]  drm_atomic_helper_disable_all+0x1f4/0x210
[   66.820355]  drm_atomic_helper_shutdown+0x80/0x130
[   66.825276]  msm_pdev_shutdown+0x14/0x20
[   66.829303]  platform_shutdown+0x28/0x40
[   66.833330]  device_shutdown+0x158/0x330
[   66.837357]  kernel_restart+0x40/0xa0
[   66.841122]  __do_sys_reboot+0x228/0x250
[   66.845148]  __arm64_sys_reboot+0x28/0x34
[   66.849264]  el0_svc_common.constprop.0+0x74/0x190
[   66.854187]  do_el0_svc+0x24/0x90
[   66.857595]  el0_svc+0x14/0x20
[   66.860739]  el0_sync_handler+0x1a4/0x1b0
[   66.864858]  el0_sync+0x174/0x180
[   66.868269] Code: 1ac020a0 2a000273 eb02007f 54ffff01 (f9400285)
[   66.874525] ---[ end trace 20dedb2a3229fec8 ]---

Fixes: 9d5cbf5fe46e ("drm/msm: add shutdown support for display platform_driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 94525ac76d4e..fd2ac54caf9f 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1311,6 +1311,10 @@ static int msm_pdev_remove(struct platform_device *pdev)
 static void msm_pdev_shutdown(struct platform_device *pdev)
 {
 	struct drm_device *drm = platform_get_drvdata(pdev);
+	struct msm_drm_private *priv = drm ? drm->dev_private : NULL;
+
+	if (!priv || !priv->kms)
+		return;
 
 	drm_atomic_helper_shutdown(drm);
 }
-- 
2.30.2

