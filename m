Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73BF72F86C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 21:34:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729914AbhAOUeN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 15:34:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727798AbhAOUeL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 15:34:11 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6EBAC0613D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 12:33:31 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id p18so6726160pgm.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 12:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GqxD38wi1JJRohChaeBwsmR53dcukE+p/w7TwS0FSts=;
        b=CkwT6bjJqkLOsXTdw/T8MBbBtFDvEtMYBtJbQHRCcu1oFaZU20/hQuwPMmUbhXCA5x
         DGqYdBxENIvj2W384heUTqHw2ndr8+jiEVq+nLkFL4G0ylyNuyX83gOvkz36L4brAKyQ
         JL1QCBF5kaKH+KvcnscSbweVk//0796J3XF54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GqxD38wi1JJRohChaeBwsmR53dcukE+p/w7TwS0FSts=;
        b=QNzETEZv4uVPXjAoP44cNzdptJ7xKNDHucuOQZYjMDz6wBlfP8qWoWSxeeoJiQpGXF
         1ITtDU3JL/4D9Lk6yxHa/cAEBBb3DcNwIRWiZKD1fYQoaR3pu8JrLYqcFAZJ3qxo09Bt
         LuOWYVweMB2ya1XyXcVCoHhXdSUpeexkE63M/alCqpy0cdnH/GZEmkagCGwiIN2U/WW5
         HDCDP/GvWsKNJ3PSVlM/A3g/kT5zCQvz5V1yYMHplxPWhPAlibwfjUu7QJCzaKdHcqBK
         3OcH6kdWd+Bse0VaR71JQYrSmRL22txm+vSKqOF4oT+hFE3yDhdn1nVz1W8+l4x3E82h
         5v5g==
X-Gm-Message-State: AOAM530VqpacUzHZUzfRvJKu0CDgroK2dpLib4JWiCg6C1FA7Isq4NlL
        Yjk1YSiHyOo/u3ncralzjeMklQ==
X-Google-Smtp-Source: ABdhPJzcSsMqa5rUofBB9lqWBS521VzYpKtt5TOM4l6thXDZOMMZP6qxBPxeyQUKgFM8w/civbgnjA==
X-Received: by 2002:a63:e14a:: with SMTP id h10mr14560054pgk.297.1610742811065;
        Fri, 15 Jan 2021 12:33:31 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id r14sm9214808pgi.27.2021.01.15.12.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 12:33:30 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
        alsa-devel@alsa-project.org,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        Srinivasa Rao <srivasam@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Cheng-Yi Chiang <cychiang@chromium.org>
Subject: [PATCH] ASoC: qcom: Fix number of HDMI RDMA channels on sc7180
Date:   Fri, 15 Jan 2021 12:33:29 -0800
Message-Id: <20210115203329.846824-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Suspending/resuming with an HDMI dongle attached leads to crashes from
an audio regmap.

 Unable to handle kernel paging request at virtual address ffffffc018068000
 Mem abort info:
   ESR = 0x96000047
   EC = 0x25: DABT (current EL), IL = 32 bits
   SET = 0, FnV = 0
   EA = 0, S1PTW = 0
 Data abort info:
   ISV = 0, ISS = 0x00000047
   CM = 0, WnR = 1
 swapper pgtable: 4k pages, 39-bit VAs, pgdp=0000000081b12000
 [ffffffc018068000] pgd=0000000275d14003, pud=0000000275d14003, pmd=000000026365d003, pte=0000000000000000
 Internal error: Oops: 96000047 [#1] PREEMPT SMP
 Call trace:
  regmap_mmio_write32le+0x2c/0x40
  regmap_mmio_write+0x48/0x6c
  _regmap_bus_reg_write+0x34/0x44
  _regmap_write+0x100/0x150
  regcache_default_sync+0xc0/0x138
  regcache_sync+0x188/0x26c
  lpass_platform_pcmops_resume+0x48/0x54 [snd_soc_lpass_platform]
  snd_soc_component_resume+0x28/0x40
  soc_resume_deferred+0x6c/0x178
  process_one_work+0x208/0x3c8
  worker_thread+0x23c/0x3e8
  kthread+0x144/0x178
  ret_from_fork+0x10/0x18
 Code: d503201f d50332bf f94002a8 8b344108 (b9000113)

I can reliably reproduce this problem by running 'tail' on the registers
file in debugfs for the hdmi regmap.

 # tail /sys/kernel/debug/regmap/62d87000.lpass-lpass_hdmi/registers
 [   84.658733] Unable to handle kernel paging request at virtual address ffffffd0128e800c

This crash happens because we're trying to read registers from the
regmap beyond the length of the mapping created by ioremap().

The number of hdmi_rdma_channels determines the size of the regmap via
this code in sound/soc/qcom/lpass-cpu.c:

  lpass_hdmi_regmap_config.max_register = LPAIF_HDMI_RDMAPER_REG(variant, variant->hdmi_rdma_channels);

According to debugfs the size of the regmap is 0x68010 but according to
the DTS file posted in [1] the size is only 0x68000 (see the first reg
property of the lpass_cpu node). Let's change the number of channels to
be 3 instead of 4 so the math works out to have a max register of
0x67010, nicely fitting inside of the region size of 0x68000.

Note: I tried to bump up the size of the register region to the next
page to include the 0x68010 register but then the tail command caused
SErrors with an async abort, implying that the register region doesn't
exist or it isn't clocked because the bus is telling us that the
register read failed. I reduce the number of channels and played audio
through the HDMI channel and it kept working so I think this is correct.

Fixes: 2ad63dc8df6b ("ASoC: qcom: sc7180: Add support for audio over DP")
Link: https://lore.kernel.org/r/1601448168-18396-2-git-send-email-srivasam@codeaurora.org [1]
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Cc: Srinivasa Rao <srivasam@codeaurora.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Cheng-Yi Chiang <cychiang@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 sound/soc/qcom/lpass-sc7180.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
index 85db650c2169..3127b6022ea3 100644
--- a/sound/soc/qcom/lpass-sc7180.c
+++ b/sound/soc/qcom/lpass-sc7180.c
@@ -174,7 +174,7 @@ static struct lpass_variant sc7180_data = {
 	.rdma_channels		= 5,
 	.hdmi_rdma_reg_base		= 0x64000,
 	.hdmi_rdma_reg_stride	= 0x1000,
-	.hdmi_rdma_channels		= 4,
+	.hdmi_rdma_channels		= 3,
 	.dmactl_audif_start	= 1,
 	.wrdma_reg_base		= 0x18000,
 	.wrdma_reg_stride	= 0x1000,

base-commit: 5c8fe583cce542aa0b84adc939ce85293de36e5e
-- 
https://chromeos.dev

