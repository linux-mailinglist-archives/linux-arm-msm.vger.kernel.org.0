Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40BDF41E9F1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 11:42:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353272AbhJAJoc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 05:44:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:40762 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353100AbhJAJoY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 05:44:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21A20613A0;
        Fri,  1 Oct 2021 09:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633081361;
        bh=qmZUWBXJ3Pz+DbP7B8aR7v3NbieWHDdp7FtHXH30HRM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iVQmOBuHvz5xfZglKcR1Bk2P3sAL79VMM6aEp5dySWoIjmmWZ1SUHpZnNJ3KRo0Gv
         rX2LuV+F9fV4hWobFGYcZKVfAyeoMy6hPCLHRbeh8WqnlWBQMn29j3MBY0pAVXPC5H
         7NI2eNW5Kso/isH2kyHAL/cFwMkLd6cPT8mxrUK4qJHU6sK/rUV/vYwWar4CZ34AfU
         UDzQLpOJ6rRwwLtuMIqRsqMWZnlxl8RmWQzIRUCzYJ7h47YwIYM28UwZ6ssZ/VCBza
         jOSkuMUS7i8KCrqjTJ6gBscLuYrMcnS3/j52XJZrpkokWUxd8VvBHsVWhD/wYPcXWb
         O8Nm/ZuXGEwYw==
Date:   Fri, 1 Oct 2021 15:12:36 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2] phy: qcom-qusb2: Fix a memory leak on probe
Message-ID: <YVbYDIUdyTQD6gXq@matsya>
References: <20210922233548.2150244-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210922233548.2150244-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23-09-21, 02:35, Vladimir Zapolskiy wrote:
> On success nvmem_cell_read() returns a pointer to a dynamically allocated
> buffer, and therefore it shall be freed after usage.
> 
> The issue is reported by kmemleak:
> 
>   # cat /sys/kernel/debug/kmemleak
>   unreferenced object 0xffff3b3803e4b280 (size 128):
>     comm "kworker/u16:1", pid 107, jiffies 4294892861 (age 94.120s)
>     hex dump (first 32 bytes):
>       00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>       00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>     backtrace:
>       [<000000007739afdc>] __kmalloc+0x27c/0x41c
>       [<0000000071c0fbf8>] nvmem_cell_read+0x40/0xe0
>       [<00000000e803ef1f>] qusb2_phy_init+0x258/0x5bc
>       [<00000000fc81fcfa>] phy_init+0x70/0x110
>       [<00000000e3d48a57>] dwc3_core_soft_reset+0x4c/0x234
>       [<0000000027d1dbd4>] dwc3_core_init+0x68/0x990
>       [<000000001965faf9>] dwc3_probe+0x4f4/0x730
>       [<000000002f7617ca>] platform_probe+0x74/0xf0
>       [<00000000a2576cac>] really_probe+0xc4/0x470
>       [<00000000bc77f2c5>] __driver_probe_device+0x11c/0x190
>       [<00000000130db71f>] driver_probe_device+0x48/0x110
>       [<0000000019f36c2b>] __device_attach_driver+0xa4/0x140
>       [<00000000e5812ff7>]  bus_for_each_drv+0x84/0xe0
>       [<00000000f4bac574>] __device_attach+0xe4/0x1c0
>       [<00000000d3beb631>] device_initial_probe+0x20/0x30
>       [<000000008019b9db>] bus_probe_device+0xa4/0xb0
> 
> Fixes: ca04d9d3e1b1 ("phy: qcom-qusb2: New driver for QUSB2 PHY on Qcom chips")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> Changes from v1 to v2:
> * fixed a memory leak in case of reading a zero value and return,
> * corrected the fixed commit, the memory leak is present before a rename.
> 
>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> index 3c1d3b71c825..f1d97fbd1331 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> @@ -561,7 +561,7 @@ static void qusb2_phy_set_tune2_param(struct qusb2_phy *qphy)
>  {
>  	struct device *dev = &qphy->phy->dev;
>  	const struct qusb2_phy_cfg *cfg = qphy->cfg;
> -	u8 *val;
> +	u8 *val, hstx_trim;
>  
>  	/* efuse register is optional */
>  	if (!qphy->cell)
> @@ -575,7 +575,13 @@ static void qusb2_phy_set_tune2_param(struct qusb2_phy *qphy)
>  	 * set while configuring the phy.
>  	 */
>  	val = nvmem_cell_read(qphy->cell, NULL);
> -	if (IS_ERR(val) || !val[0]) {
> +	if (IS_ERR(val)) {
> +		dev_dbg(dev, "failed to read a valid hs-tx trim value\n");

not an error log..?

-- 
~Vinod
