Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F025507BFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 23:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234878AbiDSVjy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 17:39:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357589AbiDSVjx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 17:39:53 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE333818A
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 14:37:09 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id o2so31626544lfu.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 14:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vO7sxoh3xNVwzp4Nmvr3X+VNbWkw4rmZVMWj6q1136M=;
        b=ptULj5IZH8a5aEDtOVZ9QJT0JAK5dMbwARxcPHpMlWRkzacMEV/WOKKE4K1HHLHQzk
         xPELyKIG4wbDYsUFMIsccz1/lfyE2bTMlfOFAeU/0gjQgcGZWVMuHTuo8wHwGJXpZfhr
         K4S00tKjxJm1vG76wfPcLR6LbP47wc2yZpbDY1PEQANFVCRHn0wKqBX84pUCSIlklGs8
         YdnQiismqDIjo3hNDXtp0lesHQaJzqBA5q0hIL6Cjab3VgtkCl5Qzv0YcPVoEjbcHh0R
         evrDHympE7xEAqdyo85FH+mw8lS+dfriv+S1VtoJVEKG4v8pCeKVP4MqJYsVo9dfyLOY
         +gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vO7sxoh3xNVwzp4Nmvr3X+VNbWkw4rmZVMWj6q1136M=;
        b=fBeA+OIl9a/QuLLX1DM4JeDlsmZcYSri6tRvN9vJ/qK1JtR5PR3bgvG99d59Bthw0s
         niLlqfI8xK0mY7v7W0peUGjguMjdqwSWhcFE98pzgVQ4+fl9N2H4sygCliuH1l9+jK8y
         InJ8b8AmlrAePW6fDYbNSF+BIZ25nxV4zgLE7Ts4DLOyec4rzU74rkWvystkqRKezZWI
         eoOmQMwpqOt0ji+acRxexeZe5Cx0CF+uC2gkkOqQbQgTugqYaEgLPXrLNNLK2Hb1F6Hp
         XX/FJA7q6Amxzj+NfJNkXE6WilEPRamwtvNOjfkzn4f3QiY+JggpQFAxeN2xlK1HQmL0
         09uw==
X-Gm-Message-State: AOAM5301T9pc3+vKFK/QOrZeULhsvpOSYjGEjQkyQZvoKvnBirmOHojE
        mEYLHEjDMFJ1QiatozvNIJU0ww==
X-Google-Smtp-Source: ABdhPJy/p7N8Wio5+ClXmHTwXGRnvkS/UWsiVgr1uTgSZUs3lfhbaIJ94Abc1EqM0M18UcQN+pjUxw==
X-Received: by 2002:ac2:5598:0:b0:46d:45d:2ce6 with SMTP id v24-20020ac25598000000b0046d045d2ce6mr12354006lfg.66.1650404227585;
        Tue, 19 Apr 2022 14:37:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l21-20020a2e99d5000000b0024dd8fdc9d4sm3618ljj.96.2022.04.19.14.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 14:37:07 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH] drm/msm/dsi: fixup DSC support for the cases when there is no pannel attached
Date:   Wed, 20 Apr 2022 00:37:06 +0300
Message-Id: <20220419213706.1452361-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Unable to handle kernel paging request at virtual address fffffffffffffe2b
Mem abort info:
  ESR = 0x96000004
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x04: level 0 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000004
  CM = 0, WnR = 0
swapper pgtable: 4k pages, 48-bit VAs, pgdp=00000000a1a39000
[fffffffffffffe2b] pgd=0000000000000000, p4d=0000000000000000
Internal error: Oops: 96000004 [#1] SMP
Modules linked in:
CPU: 7 PID: 8 Comm: kworker/u16:0 Not tainted 5.18.0-rc3-00055-g3120774492e8 #672
Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
Workqueue: events_unbound deferred_probe_work_func
pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : msm_dsi_host_modeset_init+0x30/0xcc
lr : msm_dsi_host_modeset_init+0x28/0xcc
sp : ffff800008093640
x29: ffff800008093640 x28: ffff0757131ef080 x27: 0000000000000000
x26: ffffa1d966bca440 x25: 0000000000000000 x24: 0000000000000001
x23: ffff0757131e6880 x22: ffff075700dc9c00 x21: ffffa1d965d40f60
x20: fffffffffffffdfb x19: ffff0757131ea480 x18: ffffffffffffffff
x17: ffffa1d966c51b10 x16: 00000000000003e8 x15: ffff075713989287
x14: ffffffffffffffff x13: ffff075713989284 x12: ffff07587effaf90
x11: ffff07587effaf70 x10: 00000000000b4220 x9 : 0000000000000003
x8 : 0101010101010101 x7 : 0000000000000003 x6 : 1d150c11f5f38080
x5 : 0000000000000000 x4 : ffff0757001f63c0 x3 : ffffa1d966bc02b8
x2 : 0000000000000000 x1 : ffff0757001f63c0 x0 : fffffffffffffdfb
Call trace:
 msm_dsi_host_modeset_init+0x30/0xcc
 msm_dsi_modeset_init+0x40/0x1e4
 _dpu_kms_drm_obj_init.isra.0+0xdc/0x5c0
 dpu_kms_hw_init+0x338/0x590
 msm_drm_bind+0x1d8/0x5f0
 try_to_bring_up_aggregate_device+0x164/0x1d0
 __component_add+0xa4/0x170
 component_add+0x14/0x20
 dsi_dev_attach+0x20/0x30
 dsi_host_attach+0x94/0x150
 devm_mipi_dsi_attach+0x34/0xb0
 lt9611uxc_attach_dsi.isra.0+0x84/0x100
 lt9611uxc_probe+0x538/0x5e0
 i2c_device_probe+0x2ac/0x2f0
 really_probe.part.0+0x9c/0x28c
 __driver_probe_device+0x98/0x144
 driver_probe_device+0x40/0x140
 __device_attach_driver+0xb4/0x120
 bus_for_each_drv+0x78/0xd0
 __device_attach+0xdc/0x184
 device_initial_probe+0x14/0x20
 bus_probe_device+0x9c/0xa4
 deferred_probe_work_func+0x88/0xc0
 process_one_work+0x1ec/0x444
 worker_thread+0x294/0x4dc
 kthread+0xfc/0x100
 ret_from_fork+0x10/0x20
Code: f940e675 97fdc7ba b40000c0 aa0003f4 (f9401800)

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Note: I'm going to squash this fix into the respective patch from the
DSC series

---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 03921649bd28..c983698d1384 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -2167,7 +2167,7 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
 	msm_host->dev = dev;
 	panel = msm_dsi_host_get_panel(&msm_host->base);
 
-	if (panel && panel->dsc) {
+	if (!IS_ERR(panel) && panel->dsc) {
 		struct msm_display_dsc_config *dsc = msm_host->dsc;
 
 		if (!dsc) {
-- 
2.35.1

