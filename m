Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25EA04204FD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 04:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232323AbhJDCvf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Oct 2021 22:51:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbhJDCvf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Oct 2021 22:51:35 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55D91C0613EC
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Oct 2021 19:49:47 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id h1so2536881pfv.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Oct 2021 19:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=P/1wdUXtOqQb/RBUTunThSF1lQ6Nd/+UPyKVIm0tJ0Q=;
        b=RoFGXzzpj5io1Sg2jTBAUO817buJds29Z7uDkZxQP3z45r4XaW3Nva5dQb9Z5+XQrf
         DW0R9XooX9ajk/8fg5KEztAuFsB5QFbt7aEOK6Nd5l9BWtHV1Dyu4EwXbewMA5/xalFP
         SZVvpkFG2x8pCIu5vYKCvgSc5gag0+UgtdaBVcoeSI/NmEnduGeJY8M8TrgPzx5hCMut
         //FKh8bJpmqAaRyr4AQ4qO57ts5Yz4ivtaMtecIpXnRhnGGSpjEgmM53uAJQI3fVD+1R
         5s+PQb4pN7GQYacefDwh+vtycUrevKnhetAsa/Qpk982d7zMMl3cXlzVLGQWQGtTfP82
         veBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=P/1wdUXtOqQb/RBUTunThSF1lQ6Nd/+UPyKVIm0tJ0Q=;
        b=7n1hb75io623Ays9Dx1iqgwYHaBe2nCm4+SJHZmI3PVKW7FjolnVbs5ietVwBy8DcH
         /6h+r/HWX/+aR+6ZujodNX34OKAl9hr8IaVndMXzQXjCSEqXfk1F90AVl62+ytHfbcAB
         ip0Ie2XFdoo8bzwGeSFwQ2p8Bl4dbfZ21C+jJBZt41JWyz5YnH5++rYe6o5BtbAewDK3
         nLVn6r/PU5JcCf0SehDzZf77HfGMBvqtQ3TA2w7KqlC6cFsd2p6yrymJGrCSvD9+jYZ9
         um0zY2oh2Qva3CwyxkAGH8gVjfPxSsu0EKVolnyfa0uaTrUySQ4NubxX5MJ/OxSUkcG4
         wPpQ==
X-Gm-Message-State: AOAM531/U8VRCAiDLOpik9L0NJ2J7qCnIc5uCPxVmNmn/sS++z9vRtD9
        b1kDbKwdFclSsWVGj+9OaLsyJA==
X-Google-Smtp-Source: ABdhPJxp0znVmeUGkDzW4wY+JyeuqfhWRVvrCtU8ymgecM04YO2Zn2/FuciNQ3WXpOkJ24/6vWg4GA==
X-Received: by 2002:a63:4f:: with SMTP id 76mr8716253pga.457.1633315786793;
        Sun, 03 Oct 2021 19:49:46 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id e1sm12707130pgi.43.2021.10.03.19.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 19:49:46 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Adrian Hunter <adrian.hunter@intel.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] mmc: sdhci: Map more voltage level to SDHCI_POWER_330
Date:   Mon,  4 Oct 2021 10:49:35 +0800
Message-Id: <20211004024935.15326-1-shawn.guo@linaro.org>
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
Changes since RFC:
- Add a comment for 3.4 ~ 3.6V voltage range.

 drivers/mmc/host/sdhci.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index 8eefa7d5fe85..2d80a04e11d8 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -2042,6 +2042,12 @@ void sdhci_set_power_noreg(struct sdhci_host *host, unsigned char mode,
 			break;
 		case MMC_VDD_32_33:
 		case MMC_VDD_33_34:
+		/*
+		 * 3.4 ~ 3.6V are valid only for those platforms where it's
+		 * known that the voltage range is supported by hardware.
+		 */
+		case MMC_VDD_34_35:
+		case MMC_VDD_35_36:
 			pwr = SDHCI_POWER_330;
 			break;
 		default:
-- 
2.17.1

