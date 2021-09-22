Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72B4641533B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 00:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232918AbhIVWR5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 18:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232149AbhIVWR5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 18:17:57 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85652C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Sep 2021 15:16:25 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id z24so18464362lfu.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Sep 2021 15:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iJyIIM2QFhs+G5EZ1WU7oBTvtat5Hn20U14nwrelU7s=;
        b=HuEgirt2muwN+0XlXBdcb6b2Otnh/emh7JWoI7WblW6h6LmNMrkYZpKTT8xygsJ9is
         DLE0aEnyE/rMxqn42/b0S2wlRJif/C4vJDgRjS8Z3xoVjs0qi6hdfHi5kuzKG6+gXHNl
         fFmpRMUdMZgwbpLJNeqLfi86yycrLi2MFx8wbYH1YpIpBgpGkVJ4fwzyiG0HgL+FMs10
         ELXAg5vk6w2jOA91gIkYKoou/222VaQtGUHcnGhyfVUmap+oWlBbKaiGucClwjG0Uvn/
         ObbbhQ8ZNonbVWsQj/abn+CN1lKvkNWRcWsq99j8Tk28hv7ethbdAVH30y7O5EODWDnz
         7/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iJyIIM2QFhs+G5EZ1WU7oBTvtat5Hn20U14nwrelU7s=;
        b=0Z8pYkKJV08w6y34VRODrrjAfjoVlCJS0BqZlKU8orfx7o/RkBaA/xTuF32xFvK9go
         A+QSjZh1MuSFbj8y3L2FtjasGuuHejRfoKLGZGTxs+p/nvHADeECmArAA7fakPOfitsY
         WJzUUB6EDtZq+e8UcnvAq91o+tVNoB7CvKAgWVsYGsRX5D7tu27n+X1VGT7i2sGbyB1R
         VViHNvSJ1tqbrMI1iTh/0Sqfmx96jeSn2c0KWUmiGP2o7MAOTzjiwwwbPnXvr0w7ZEog
         TQ64IgqrrpSb8UwIyIU32Ykzoghy3bXZheBDznxZMf55STsORtDSo/+AFbrNsXycv9xd
         8+aw==
X-Gm-Message-State: AOAM532ko7dN11Bek5kSpYBa2On3QXuhRVsOqlnE20JVyrgmez0Oha6H
        vXZeTAlis9Ejhe8bJvILPJ8jhw==
X-Google-Smtp-Source: ABdhPJz1Vsssxxw6D2HRoNWz+ON9jnTJVcB0f7IgKXZgr9ecJz1mhJ6urjy9Z2S9K3rTXpq+AmovdA==
X-Received: by 2002:ac2:5609:: with SMTP id v9mr1162154lfd.415.1632348983612;
        Wed, 22 Sep 2021 15:16:23 -0700 (PDT)
Received: from localhost.localdomain (88-112-130-172.elisa-laajakaista.fi. [88.112.130.172])
        by smtp.gmail.com with ESMTPSA id br40sm275811lfb.64.2021.09.22.15.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 15:16:23 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH] phy: qcom-qusb2: Fix a memory leak on probe
Date:   Thu, 23 Sep 2021 01:16:13 +0300
Message-Id: <20210922221613.2115038-1-vladimir.zapolskiy@linaro.org>
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

Fixes: 0b56e9a7e835 ("phy: Group vendor specific phy drivers")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 3c1d3b71c825..061665ba8ef7 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -589,6 +589,8 @@ static void qusb2_phy_set_tune2_param(struct qusb2_phy *qphy)
 		qusb2_write_mask(qphy->base, cfg->regs[QUSB2PHY_PORT_TUNE2],
 				 val[0] << HSTX_TRIM_SHIFT,
 				 HSTX_TRIM_MASK);
+
+	kfree(val);
 }
 
 static int qusb2_phy_set_mode(struct phy *phy,
-- 
2.33.0

