Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1447D418908
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Sep 2021 15:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231739AbhIZNaf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Sep 2021 09:30:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231723AbhIZNae (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Sep 2021 09:30:34 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80B89C061570
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Sep 2021 06:28:58 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id me5-20020a17090b17c500b0019af76b7bb4so13263517pjb.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Sep 2021 06:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=z9/1wK6T5hSYHV4oe0mU1zWxSLO4EJ8oEtbjEP+5Etc=;
        b=W70FOxgpOJre0UyVWRK1qwgm0IQWSLrBfs8Yoa3JP/xxyVNYlHHV4khv6kpwEHv1Gw
         /aDIE3iQcyCSlhwrb0fdWt7zjetOtkR8mYabB4MGm363RzpYeyoVEkFa9WjLujdJWpzX
         dHpfCLVmojlB5eYTqq+nlynUddGXupge9T2daZhKb2uANKL557631HhjgY7D8xR8J+wG
         A/HicpOlVt6GHgfaBk2BRXbGbhCK3K974v3nRU+M3qLvXqPFTvhn9/ViNMjVOszPtPx8
         JY9bNZbc03G9qStvC4UqLcoMMqSnyjsM9QkuWuMGZqBe7Cu5a0jNaGBFcZxgAJdgIOPm
         TkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=z9/1wK6T5hSYHV4oe0mU1zWxSLO4EJ8oEtbjEP+5Etc=;
        b=WJMKgUVLk3UbLhRnHx1cbp3FNbNPBbHfPchmtgIhCNp740lqYUz2/RUj+oz8XRQLQI
         VLi7JTgYUqwvDmUaEsuSkLlyWjyaxb9ZzEq5m0lv7uvYahylQNoSgPLoObfXZbtvbooj
         Gb/n3SMUF/+YV/bzpUj0cwRD5u5tfQ66xVagqPzUxuDqjKzZy/V8aiDsQQE6tIA/bxYz
         A2oIg71J4hA2eccCJRoCmllJSRlwCsr6KI50lfLqDNipJ90TLx47Qhk5CXbE08jGDnDu
         JjecbJxrQVGnxuHyarSNw472UiHIOeRuXP+9r+wK94VC08h4oInSYI+3o1fOy7U7MNRE
         q1UA==
X-Gm-Message-State: AOAM5333gdafQ2Wc4SdaU60DOrlNkJ6jRAyRRb+8ACrAiSC9pB13hLbi
        6uJ55moPYl3VdmhLXYJXVyaHkg==
X-Google-Smtp-Source: ABdhPJxhAxdvzAcUCWPvE6l1HaDariM038A5K0Y11lPkAqjyOfTFWBoMjjZVh/KkaTj/+s6Zgc/1MA==
X-Received: by 2002:a17:90b:3b41:: with SMTP id ot1mr13790719pjb.186.1632662937858;
        Sun, 26 Sep 2021 06:28:57 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id z24sm16135528pgu.54.2021.09.26.06.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 06:28:57 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Adrian Hunter <adrian.hunter@intel.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [RFC PATCH] mmc: sdhci: Map more voltage level to SDHCI_POWER_330
Date:   Sun, 26 Sep 2021 21:28:47 +0800
Message-Id: <20210926132847.22268-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thundercomm TurboX CM2290, the eMMC OCR reports vdd = 23 (3.5 ~ 3.6 V),
which is being treated as an invalid value by sdhci_set_power_noreg().
And thus eMMC is totally broken on the platform.

[    1.436599] ------------[ cut here ]------------
[    1.436606] mmc0: Invalid vdd 0x17
[    1.436640] WARNING: CPU: 2 PID: 69 at drivers/mmc/host/sdhci.c:2048 sdhci_set_power_noreg+0x168/0x2b4
[    1.436655] Modules linked in:
[    1.436662] CPU: 2 PID: 69 Comm: kworker/u8:1 Tainted: G        W         5.15.0-rc1+ #137
[    1.436669] Hardware name: Thundercomm TurboX CM2290 (DT)
[    1.436674] Workqueue: events_unbound async_run_entry_fn
[    1.436685] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    1.436692] pc : sdhci_set_power_noreg+0x168/0x2b4
[    1.436698] lr : sdhci_set_power_noreg+0x168/0x2b4
[    1.436703] sp : ffff800010803a60
[    1.436705] x29: ffff800010803a60 x28: ffff6a9102465f00 x27: ffff6a9101720a70
[    1.436715] x26: ffff6a91014de1c0 x25: ffff6a91014de010 x24: ffff6a91016af280
[    1.436724] x23: ffffaf7b1b276640 x22: 0000000000000000 x21: ffff6a9101720000
[    1.436733] x20: ffff6a9101720370 x19: ffff6a9101720580 x18: 0000000000000020
[    1.436743] x17: 0000000000000000 x16: 0000000000000004 x15: ffffffffffffffff
[    1.436751] x14: 0000000000000000 x13: 00000000fffffffd x12: ffffaf7b1b84b0bc
[    1.436760] x11: ffffaf7b1b720d10 x10: 000000000000000a x9 : ffff800010803a60
[    1.436769] x8 : 000000000000000a x7 : 000000000000000f x6 : 00000000fffff159
[    1.436778] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 00000000ffffffff
[    1.436787] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff6a9101718d80
[    1.436797] Call trace:
[    1.436800]  sdhci_set_power_noreg+0x168/0x2b4
[    1.436805]  sdhci_set_ios+0xa0/0x7fc
[    1.436811]  mmc_power_up.part.0+0xc4/0x164
[    1.436818]  mmc_start_host+0xa0/0xb0
[    1.436824]  mmc_add_host+0x60/0x90
[    1.436830]  __sdhci_add_host+0x174/0x330
[    1.436836]  sdhci_msm_probe+0x7c0/0x920
[    1.436842]  platform_probe+0x68/0xe0
[    1.436850]  really_probe.part.0+0x9c/0x31c
[    1.436857]  __driver_probe_device+0x98/0x144
[    1.436863]  driver_probe_device+0xc8/0x15c
[    1.436869]  __device_attach_driver+0xb4/0x120
[    1.436875]  bus_for_each_drv+0x78/0xd0
[    1.436881]  __device_attach_async_helper+0xac/0xd0
[    1.436888]  async_run_entry_fn+0x34/0x110
[    1.436895]  process_one_work+0x1d0/0x354
[    1.436903]  worker_thread+0x13c/0x470
[    1.436910]  kthread+0x150/0x160
[    1.436915]  ret_from_fork+0x10/0x20
[    1.436923] ---[ end trace fcfac44cb045c3a8 ]---

Fix the issue by mapping MMC_VDD_35_36 (and MMC_VDD_34_35) to
SDHCI_POWER_330 as well.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
I'm not sure if this is the right solution, as I do not have SDHCI
specification.  Hence it's a RFC.

 drivers/mmc/host/sdhci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index 8eefa7d5fe85..2427481535a3 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -2042,6 +2042,8 @@ void sdhci_set_power_noreg(struct sdhci_host *host, unsigned char mode,
 			break;
 		case MMC_VDD_32_33:
 		case MMC_VDD_33_34:
+		case MMC_VDD_34_35:
+		case MMC_VDD_35_36:
 			pwr = SDHCI_POWER_330;
 			break;
 		default:
-- 
2.17.1

