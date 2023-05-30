Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C6CA715A04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 11:26:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbjE3J0B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 05:26:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbjE3JZf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 05:25:35 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5DC4E6D
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 02:24:29 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51456392cbbso8176299a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 02:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685438668; x=1688030668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VUko92SfOCift4O+uXncbqKXfQI4O0oKnV/Zcja6u8g=;
        b=ccJQOpqP3kIc7ZLl4ycvtD1ZyBQ8B0iHVKDV4IenI9EU/kDtfFdg5qWxaYCWA0SGG8
         IWWypnhLlTz2JLedXw+jw0ZC4LOxhlf+VQ/l2XdvuwGGu6rkd6lOFwsdp1bGBXC7eje4
         IcreFOpcFGmIKgqt16oDVQc0olyH2QpVp8rWH/dYYnOKWyA27/OsqpmrnGp23mYRXxeF
         WJhfbptWZG9R5a6S43qFmJlzdvcoPNCABXLI9gw8DKr0T2OTqMibO43Qt8Tt2hDh1cul
         /LO70nl5ho6vtnhjAwGvf22XVwGX8vZF9dXi3dnN4h9zUeqkCJgSsWmh1WTNOSq49RKr
         B+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685438668; x=1688030668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VUko92SfOCift4O+uXncbqKXfQI4O0oKnV/Zcja6u8g=;
        b=UAHuj53mCOEAn87tzFuLsY+oZDxZNwE2dfoXV2NpC/tXkwwAHEKrxTHO/11pkcn/Qo
         BqNdwlu+SrFG3rtw+vK3yjF9HvN1a0AvsJ19x6CN2E/L/KZ2HI2NyWGHs3eVmUFJir/a
         0QC3VhTRhwNi5WbGLI13oGThDOuUFhxEAxHtpuaSr0n+jnH38R2Lt7fakJzPuYTdhpDI
         X+PYjKn94PZ1Z9zLmsT87tD6ZQKSyxU0zj4YVoyLzaC/8kRLHZR9YPRwwbTP8jh1xsLa
         Ja9ddOIKCdILXxDhR6CwEWMVN3SsGWGG9s7MkkbNCPp9iYUPqWWqsUMiE37RU2x5KhOp
         Y6iw==
X-Gm-Message-State: AC+VfDw8dUSfavOHUUnQEF7YKgaQWSqRfx3b4jEU0fSu6acUoT2j/re6
        Hg1E0iN1hwlUkvQZOMxVCcRvrU8CRNgXtg==
X-Google-Smtp-Source: ACHHUZ7zJ34+0T7f0uplmADLE8435Uf3r4Bi9w9dHDncwC/7UT+l2kMaH9bbxGc+V4jyivbCcZXD5w==
X-Received: by 2002:a17:907:e86:b0:96a:2210:7dd8 with SMTP id ho6-20020a1709070e8600b0096a22107dd8mr1690156ejc.38.1685438667640;
        Tue, 30 May 2023 02:24:27 -0700 (PDT)
Received: from ThinkStation-P340.tmt.telital.com ([2a01:7d0:4800:7:da16:70bf:8f7b:efa5])
        by smtp.gmail.com with ESMTPSA id bx16-20020a170906a1d000b0096607baaf19sm7070971ejb.101.2023.05.30.02.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 02:24:27 -0700 (PDT)
From:   Daniele Palmas <dnlplm@gmail.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>,
        Sujeev Dias <sdias@codeaurora.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH 1/1] bus: mhi: host: allow SBL as initial EE
Date:   Tue, 30 May 2023 11:13:40 +0200
Message-Id: <20230530091340.3513141-1-dnlplm@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are situations in which SBL is a legitimate initial execution
environment (e.g. modem stuck in SBL due to a firmware failure...), but
mhi refuses to start:

mhi-pci-generic 0000:01:00.0: MHI PCI device found: foxconn-sdx55
mhi-pci-generic 0000:01:00.0: BAR 0: assigned
mhi-pci-generic 0000:01:00.0: enabling device (0000 -> 0002)
mhi mhi0: Requested to power ON
mhi mhi0: SECONDARY BOOTLOADER is not a valid EE for power on
mhi-pci-generic 0000:01:00.0: failed to power up MHI controller
mhi-pci-generic: probe of 0000:01:00.0 failed with error -5

Fix this by adding SBL as an allowed initial execution environment.

Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM operations")
Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
---
 drivers/bus/mhi/host/internal.h | 2 +-
 drivers/bus/mhi/host/pm.c       | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 2e139e76de4c..3bdcd2321aa5 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -56,7 +56,7 @@ extern const char * const mhi_ee_str[MHI_EE_MAX];
 
 #define MHI_IN_PBL(ee) (ee == MHI_EE_PBL || ee == MHI_EE_PTHRU || \
 			ee == MHI_EE_EDL)
-#define MHI_POWER_UP_CAPABLE(ee) (MHI_IN_PBL(ee) || ee == MHI_EE_AMSS)
+#define MHI_POWER_UP_CAPABLE(ee) (MHI_IN_PBL(ee) || ee == MHI_EE_AMSS || ee == MHI_EE_SBL)
 #define MHI_FW_LOAD_CAPABLE(ee) (ee == MHI_EE_PBL || ee == MHI_EE_EDL)
 #define MHI_IN_MISSION_MODE(ee) (ee == MHI_EE_AMSS || ee == MHI_EE_WFW || \
 				 ee == MHI_EE_FP)
diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
index 083459028a4b..18872c5017be 100644
--- a/drivers/bus/mhi/host/pm.c
+++ b/drivers/bus/mhi/host/pm.c
@@ -1203,10 +1203,11 @@ int mhi_sync_power_up(struct mhi_controller *mhi_cntrl)
 
 	wait_event_timeout(mhi_cntrl->state_event,
 			   MHI_IN_MISSION_MODE(mhi_cntrl->ee) ||
+			   mhi_cntrl->ee == MHI_EE_SBL ||
 			   MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
 			   msecs_to_jiffies(mhi_cntrl->timeout_ms));
 
-	ret = (MHI_IN_MISSION_MODE(mhi_cntrl->ee)) ? 0 : -ETIMEDOUT;
+	ret = (MHI_IN_MISSION_MODE(mhi_cntrl->ee) || mhi_cntrl->ee == MHI_EE_SBL) ? 0 : -ETIMEDOUT;
 	if (ret)
 		mhi_power_down(mhi_cntrl, false);
 
-- 
2.37.1

