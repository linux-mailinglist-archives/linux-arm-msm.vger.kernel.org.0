Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 808BA4153F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 01:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238455AbhIVXhY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 19:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231259AbhIVXhY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 19:37:24 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D201C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Sep 2021 16:35:53 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id m3so18900288lfu.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Sep 2021 16:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JvK7nAAVSpgD5oIumQfPNaMMDtIPTVj4JW6h6SRFBiI=;
        b=m7Ws3JYfXgj+8PH6Cag5WpV2j8JcFJnqRzZ68LxwCGf2HaDFfNhmeZ7GD5HhEVEmHr
         2wdPhokOrDyfZ4kfdurEt1drytZc88nqomP8V70TiyK3ukpJ4njjqOllO3cpzVFcjcx8
         SvvhudRrNmGLbqmBJvGThmenRpFYW8lOhCeWyTze63VvwstcABuKR2/XjU0wehMkiOIv
         M2FdSAOIn+cy5ypv4P5Y094wPzuXhmG4/KmvJ1Uw1i/OtBvwmSHemheKyd3qZcbqJbbz
         4pfU3ojQzxnsjNguwUj6yIrP+RcaZ4PMLyoz1XpRnd4RMVrjvh2ekbdqQh+UXDGEjyTV
         WIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JvK7nAAVSpgD5oIumQfPNaMMDtIPTVj4JW6h6SRFBiI=;
        b=orRBaI7X8FJmjl3dlD+IDAxC9vc+yyI3feux2wwi+Okm98h8JBlU8+ey47E+NQsvib
         AhvvUIwUfN6CefBQbxEhQjDSH9lf+5eO3/IGPvJyLfuVoYx/xTmpozGzY4bYH57A8qFO
         GxnjiD4UJnYlKeBGqJSXMh2KLp6AsSbBtLZftEwF1zj/BlPTziPj8oBbsneGnWHkftzX
         CEouhrTcIzZrUzBoUeDbiGB5JLdpt4/vI0FPmDDsMZlY0Vzf/0q5qarj2DGKeQxS0ewb
         tMAbAytnFfjRvtjp8Ub4BeJv8LrrqHc1IxvNCstEf+5JC0ryWXT41hjvz+hHbGJAzA+y
         GbKQ==
X-Gm-Message-State: AOAM530298hsCfEYocaPGMJWj+6lsQpYK/yqJaufdZs4brWiP/I/Xbn6
        YwS8q8m7Qy5H25juhtf3m0dzvQ==
X-Google-Smtp-Source: ABdhPJw6/BC44TsHxbq6eRNn+XpjMPDGV7n+oj8ucJc6YzVyg5rvHLlqT4IM85ADObmwy3AF+rI4vA==
X-Received: by 2002:a2e:9707:: with SMTP id r7mr1272013lji.121.1632353751921;
        Wed, 22 Sep 2021 16:35:51 -0700 (PDT)
Received: from localhost.localdomain (88-112-130-172.elisa-laajakaista.fi. [88.112.130.172])
        by smtp.gmail.com with ESMTPSA id x204sm287460lff.301.2021.09.22.16.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 16:35:51 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v2] phy: qcom-qusb2: Fix a memory leak on probe
Date:   Thu, 23 Sep 2021 02:35:48 +0300
Message-Id: <20210922233548.2150244-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On success nvmem_cell_read() returns a pointer to a dynamically allocated
buffer, and therefore it shall be freed after usage.

The issue is reported by kmemleak:

  # cat /sys/kernel/debug/kmemleak
  unreferenced object 0xffff3b3803e4b280 (size 128):
    comm "kworker/u16:1", pid 107, jiffies 4294892861 (age 94.120s)
    hex dump (first 32 bytes):
      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    backtrace:
      [<000000007739afdc>] __kmalloc+0x27c/0x41c
      [<0000000071c0fbf8>] nvmem_cell_read+0x40/0xe0
      [<00000000e803ef1f>] qusb2_phy_init+0x258/0x5bc
      [<00000000fc81fcfa>] phy_init+0x70/0x110
      [<00000000e3d48a57>] dwc3_core_soft_reset+0x4c/0x234
      [<0000000027d1dbd4>] dwc3_core_init+0x68/0x990
      [<000000001965faf9>] dwc3_probe+0x4f4/0x730
      [<000000002f7617ca>] platform_probe+0x74/0xf0
      [<00000000a2576cac>] really_probe+0xc4/0x470
      [<00000000bc77f2c5>] __driver_probe_device+0x11c/0x190
      [<00000000130db71f>] driver_probe_device+0x48/0x110
      [<0000000019f36c2b>] __device_attach_driver+0xa4/0x140
      [<00000000e5812ff7>]  bus_for_each_drv+0x84/0xe0
      [<00000000f4bac574>] __device_attach+0xe4/0x1c0
      [<00000000d3beb631>] device_initial_probe+0x20/0x30
      [<000000008019b9db>] bus_probe_device+0xa4/0xb0

Fixes: ca04d9d3e1b1 ("phy: qcom-qusb2: New driver for QUSB2 PHY on Qcom chips")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes from v1 to v2:
* fixed a memory leak in case of reading a zero value and return,
* corrected the fixed commit, the memory leak is present before a rename.

 drivers/phy/qualcomm/phy-qcom-qusb2.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 3c1d3b71c825..f1d97fbd1331 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -561,7 +561,7 @@ static void qusb2_phy_set_tune2_param(struct qusb2_phy *qphy)
 {
 	struct device *dev = &qphy->phy->dev;
 	const struct qusb2_phy_cfg *cfg = qphy->cfg;
-	u8 *val;
+	u8 *val, hstx_trim;
 
 	/* efuse register is optional */
 	if (!qphy->cell)
@@ -575,7 +575,13 @@ static void qusb2_phy_set_tune2_param(struct qusb2_phy *qphy)
 	 * set while configuring the phy.
 	 */
 	val = nvmem_cell_read(qphy->cell, NULL);
-	if (IS_ERR(val) || !val[0]) {
+	if (IS_ERR(val)) {
+		dev_dbg(dev, "failed to read a valid hs-tx trim value\n");
+		return;
+	}
+	hstx_trim = val[0];
+	kfree(val);
+	if (!hstx_trim) {
 		dev_dbg(dev, "failed to read a valid hs-tx trim value\n");
 		return;
 	}
@@ -583,12 +589,10 @@ static void qusb2_phy_set_tune2_param(struct qusb2_phy *qphy)
 	/* Fused TUNE1/2 value is the higher nibble only */
 	if (cfg->update_tune1_with_efuse)
 		qusb2_write_mask(qphy->base, cfg->regs[QUSB2PHY_PORT_TUNE1],
-				 val[0] << HSTX_TRIM_SHIFT,
-				 HSTX_TRIM_MASK);
+				 hstx_trim << HSTX_TRIM_SHIFT, HSTX_TRIM_MASK);
 	else
 		qusb2_write_mask(qphy->base, cfg->regs[QUSB2PHY_PORT_TUNE2],
-				 val[0] << HSTX_TRIM_SHIFT,
-				 HSTX_TRIM_MASK);
+				 hstx_trim << HSTX_TRIM_SHIFT, HSTX_TRIM_MASK);
 }
 
 static int qusb2_phy_set_mode(struct phy *phy,
-- 
2.33.0

