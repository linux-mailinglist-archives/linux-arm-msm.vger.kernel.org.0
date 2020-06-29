Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7CF920D73E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2020 22:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732422AbgF2T2N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 15:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732760AbgF2T1t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 15:27:49 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0146C02A56B
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 06:32:12 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id d10so7105757pls.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 06:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=HqXhLuy88NtKOzrDrj0vDMcb25e0Lq0Z8qhm2NKO7dM=;
        b=QEZSLI6FeFANZnHl2ip6lsMzKhaOK0+gcrQ/tV4BaHZLvbwtoBd4obzCEbcp0Xbs5/
         MR9QEYwMy6E0Brb/RMDOipO50Z/NDcmw8mtMAHUY2HUGE+tmpBI37l3MBq1AFkS7Fk0L
         xO7rSIHylU1VjgDkYfp5rlArysKSl/07NJZuKfCZwiA7wQRI7joGQ3L+B7+Wmoqw/B1G
         0hA5/BxVExfzWzibljgF41wf++t5eIdZVo1o+OBnN5AWOXBVBqG0xGQdoIsvAyU3yDFo
         O2fByXl/z9mK8W0y53/P3Kk8CwwzSWzF3U+C5rLZSarxWarJNMEJz6AspV/5AkymH4+h
         X5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HqXhLuy88NtKOzrDrj0vDMcb25e0Lq0Z8qhm2NKO7dM=;
        b=HnWeRU+cxwdpscUftZ2WeR+2Iejx43VddVdHKD2nT2Gm11kIn00YiBc67Et9lXlfSE
         zn0bXCMxqWAou9THKvepuIFgtTFhKMZd+nvtBtoqlnfxjex0CtIIYdMyeoK1qlgoKwnx
         HuYxwyjJu16K/n8bR0n392B0AK/AVsoA+birs8Ngzk5Uf0Fk7WflEc1Yh253tuCmdafe
         lpqwt+hkG69ZGn8hGKUWYX7jz/p7el4lL9Hapm6hW17+KWYlFKDBv04Gt4BYR7bzDODD
         X7s8x+P/vAm3NuCYBalIa8B8vfqTtXxVbBjDIyaj+y2NpqZZUDNlOnV+ka0I31OZYPnx
         Zekw==
X-Gm-Message-State: AOAM533vo3hY7yNlIALKg93y6NUS2PEUmnICEXaqzhI+qVw4hc3UoZ+g
        vA8C49A6pmjv2AaeMJRLvq7yrR6XZ0g=
X-Google-Smtp-Source: ABdhPJwYHGL4gRcUpPxNtuW1UYGi/KcsuwKIYIK5SfGAfJOaAsFdd+LWWANBKK1oFZH3FgvUt4J8ZQ==
X-Received: by 2002:a17:902:fe11:: with SMTP id g17mr13104492plj.145.1593437531996;
        Mon, 29 Jun 2020 06:32:11 -0700 (PDT)
Received: from localhost.localdomain ([80.251.214.228])
        by smtp.gmail.com with ESMTPSA id n188sm49050pfn.104.2020.06.29.06.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 06:32:11 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] nvmem: qfprom: increase id to support multiple devices
Date:   Mon, 29 Jun 2020 21:32:04 +0800
Message-Id: <20200629133204.23279-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There could be multiple qfprom devices on some SoCs.  For example, on
MSM8939, qfprom@58000 holds efuse bits for Core Power Reduction (CPR),
and qfprom@5c000 holds bits for TSENS.  Registering multiple nvmem
devices with the same id results in the following failure on the second
device.

[    1.682731] sysfs: cannot create duplicate filename '/bus/nvmem/devices/qfprom0'
[    1.685889] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.19.107-00567-g11c887ce2838-dirty #334
[    1.693191] Hardware name: Square, Inc. T2 Devkit (DT)
[    1.701610] Call trace:
[    1.706673]  dump_backtrace+0x0/0x158
[    1.708987]  show_stack+0x14/0x20
[    1.712810]  dump_stack+0x98/0xbc
[    1.716114]  sysfs_warn_dup+0x60/0x78
[    1.719401]  sysfs_do_create_link_sd.isra.0+0xdc/0xe8
[    1.723047]  sysfs_create_link+0x20/0x40
[    1.728088]  bus_add_device+0x68/0x130
[    1.732083]  device_add+0x3f8/0x628
[    1.735639]  nvmem_register.part.4+0x150/0x348
[    1.739018]  devm_nvmem_register+0x4c/0xa8
[    1.743532]  qfprom_probe+0x94/0xb8
[    1.747615]  platform_drv_probe+0x50/0xa0
[    1.750998]  really_probe+0x1b8/0x298
[    1.755164]  driver_probe_device+0x58/0x100
[    1.758810]  __driver_attach+0xe0/0xe8
[    1.762802]  bus_for_each_dev+0x74/0xc8
[    1.766622]  driver_attach+0x20/0x28
[    1.770354]  bus_add_driver+0x1ac/0x218
[    1.774175]  driver_register+0x60/0x110
[    1.777734]  __platform_driver_register+0x40/0x48
[    1.781570]  qfprom_driver_init+0x18/0x20
[    1.786416]  do_one_initcall+0x5c/0x178
[    1.790418]  kernel_init_freeable+0x198/0x244
[    1.794062]  kernel_init+0x10/0x108
[    1.798567]  ret_from_fork+0x10/0x18
[    1.802084] qcom,qfprom: probe of 5c000.qfprom failed with error -17

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/nvmem/qfprom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
index 8a91717600be..ceb837e861d8 100644
--- a/drivers/nvmem/qfprom.c
+++ b/drivers/nvmem/qfprom.c
@@ -40,6 +40,7 @@ static int qfprom_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct nvmem_device *nvmem;
 	struct qfprom_priv *priv;
+	static int id;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -52,6 +53,7 @@ static int qfprom_probe(struct platform_device *pdev)
 
 	econfig.size = resource_size(res);
 	econfig.dev = dev;
+	econfig.id = id++;
 	econfig.priv = priv;
 
 	nvmem = devm_nvmem_register(dev, &econfig);
-- 
2.17.1

