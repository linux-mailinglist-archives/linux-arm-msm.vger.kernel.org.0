Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94AAA257D49
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Aug 2020 17:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728746AbgHaPay (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Aug 2020 11:30:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:40788 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728688AbgHaPau (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Aug 2020 11:30:50 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 842E221548;
        Mon, 31 Aug 2020 15:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598887849;
        bh=7kggAtYaeM4k5CsWqpNQSPTgP1ACBAj2QxNoizFutYg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TmyKNEdT74oBM4bnTy7DeYA6EVFn+quwt7Alhve7wwSvqKEIvSAK3Uu7aeJbRXUiW
         6cvWovftHzx897qDJTbBPGsv51/p9k7TB2bWyk6uEje9dwlAyeD5ddmqevfQVr7erD
         KHeJIjx3k30nHGUdLulx6xKXfVpHiZxjCQlWxJGI=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     John Stultz <john.stultz@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.4 05/23] tty: serial: qcom_geni_serial: Drop __init from qcom_geni_console_setup
Date:   Mon, 31 Aug 2020 11:30:21 -0400
Message-Id: <20200831153039.1024302-5-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200831153039.1024302-1-sashal@kernel.org>
References: <20200831153039.1024302-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: John Stultz <john.stultz@linaro.org>

[ Upstream commit 975efc66d4e654207c17f939eb737ac591ac38fe ]

When booting with heavily modularized config, the serial console
may not be able to load until after init when modules that
satisfy needed dependencies have time to load.

Unfortunately, as qcom_geni_console_setup is marked as __init,
the function may have been freed before we get to run it,
causing boot time crashes such as:

[    6.469057] Unable to handle kernel paging request at virtual address ffffffe645d4e6cc
[    6.481623] Mem abort info:
[    6.484466]   ESR = 0x86000007
[    6.487557]   EC = 0x21: IABT (current EL), IL = 32 bits
[    6.492929]   SET = 0, FnV = 0g
[    6.496016]   EA = 0, S1PTW = 0
[    6.499202] swapper pgtable: 4k pages, 39-bit VAs, pgdp=000000008151e000
[    6.501286] ufshcd-qcom 1d84000.ufshc: ufshcd_print_pwr_info:[RX, TX]: gear=[3, 3], lane[2, 2], pwr[FAST MODE, FAST MODE], rate = 2
[    6.505977] [ffffffe645d4e6cc] pgd=000000017df9f003, p4d=000000017df9f003, pud=000000017df9f003, pmd=000000017df9c003, pte=0000000000000000
[    6.505990] Internal error: Oops: 86000007 [#1] PREEMPT SMP
[    6.505995] Modules linked in: zl10353 zl10039 zl10036 zd1301_demod xc5000 xc4000 ves1x93 ves1820 tuner_xc2028 tuner_simple tuner_types tua9001 tua6100 1
[    6.506152]  isl6405
[    6.518104] ufshcd-qcom 1d84000.ufshc: ufshcd_find_max_sup_active_icc_level: Regulator capability was not set, actvIccLevel=0
[    6.530549]  horus3a helene fc2580 fc0013 fc0012 fc0011 ec100 e4000 dvb_pll ds3000 drxk drxd drx39xyj dib9000 dib8000 dib7000p dib7000m dib3000mc dibx003
[    6.624271] CPU: 7 PID: 148 Comm: kworker/7:2 Tainted: G        W       5.8.0-mainline-12021-g6defd37ba1cd #3455
[    6.624273] Hardware name: Thundercomm Dragonboard 845c (DT)
[    6.624290] Workqueue: events deferred_probe_work_func
[    6.624296] pstate: 40c00005 (nZcv daif +PAN +UAO BTYPE=--)
[    6.624307] pc : qcom_geni_console_setup+0x0/0x110
[    6.624316] lr : try_enable_new_console+0xa0/0x140
[    6.624318] sp : ffffffc010843a30
[    6.624320] x29: ffffffc010843a30 x28: ffffffe645c3e7d0
[    6.624325] x27: ffffff80f8022180 x26: ffffffc010843b28
[    6.637937] x25: 0000000000000000 x24: ffffffe6462a2000
[    6.637941] x23: ffffffe646398000 x22: 0000000000000000
[    6.637945] x21: 0000000000000000 x20: ffffffe6462a5ce8
[    6.637952] x19: ffffffe646398e38 x18: ffffffffffffffff
[    6.680296] x17: 0000000000000000 x16: ffffffe64492b900
[    6.680300] x15: ffffffe6461e9d08 x14: 69202930203d2064
[    6.680305] x13: 7561625f65736162 x12: 202c363331203d20
[    6.696434] x11: 0000000000000030 x10: 0101010101010101
[    6.696438] x9 : 4d4d20746120304d x8 : 7f7f7f7f7f7f7f7f
[    6.707249] x7 : feff4c524c787373 x6 : 0000000000008080
[    6.707253] x5 : 0000000000000000 x4 : 8080000000000000
[    6.707257] x3 : 0000000000000000 x2 : ffffffe645d4e6cc
[    6.744223] qcom_geni_serial 898000.serial: dev_pm_opp_set_rate: failed to find OPP for freq 102400000 (-34)
[    6.744966] x1 : fffffffefe74e174 x0 : ffffffe6462a5ce8
[    6.753580] qcom_geni_serial 898000.serial: dev_pm_opp_set_rate: failed to find OPP for freq 102400000 (-34)
[    6.761634] Call trace:
[    6.761639]  qcom_geni_console_setup+0x0/0x110
[    6.761645]  register_console+0x29c/0x2f8
[    6.767981] Bluetooth: hci0: Frame reassembly failed (-84)
[    6.775252]  uart_add_one_port+0x438/0x500
[    6.775258]  qcom_geni_serial_probe+0x2c4/0x4a8
[    6.775266]  platform_drv_probe+0x58/0xa8
[    6.855359]  really_probe+0xec/0x398
[    6.855362]  driver_probe_device+0x5c/0xb8
[    6.855367]  __device_attach_driver+0x98/0xb8
[    7.184945]  bus_for_each_drv+0x74/0xd8
[    7.188825]  __device_attach+0xec/0x148
[    7.192705]  device_initial_probe+0x24/0x30
[    7.196937]  bus_probe_device+0x9c/0xa8
[    7.200816]  deferred_probe_work_func+0x7c/0xb8
[    7.205398]  process_one_work+0x20c/0x4b0
[    7.209456]  worker_thread+0x48/0x460
[    7.213157]  kthread+0x14c/0x158
[    7.216432]  ret_from_fork+0x10/0x18
[    7.220049] Code: bad PC value
[    7.223139] ---[ end trace 73f3b21e251d5a70 ]---

Thus this patch removes the __init avoiding crash in such
configs.

Cc: Andy Gross <agross@kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>
Cc: Todd Kjos <tkjos@google.com>
Cc: Amit Pundir <amit.pundir@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-serial@vger.kernel.org
Suggested-by: Saravana Kannan <saravanak@google.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Link: https://lore.kernel.org/r/20200811025044.70626-1-john.stultz@linaro.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index f98a79172ad23..0b184256034fb 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1063,7 +1063,7 @@ static unsigned int qcom_geni_serial_tx_empty(struct uart_port *uport)
 }
 
 #ifdef CONFIG_SERIAL_QCOM_GENI_CONSOLE
-static int __init qcom_geni_console_setup(struct console *co, char *options)
+static int qcom_geni_console_setup(struct console *co, char *options)
 {
 	struct uart_port *uport;
 	struct qcom_geni_serial_port *port;
-- 
2.25.1

