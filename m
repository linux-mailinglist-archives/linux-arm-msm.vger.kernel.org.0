Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE20F24150D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 04:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgHKCut (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Aug 2020 22:50:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726831AbgHKCus (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Aug 2020 22:50:48 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F5E1C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2020 19:50:48 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id c6so1112910pje.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2020 19:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=KVlt6KV9H0iPcN45PNaGR/Bhb6+rc7oK3VoVzry5jSQ=;
        b=Cowl6hL2OrBvzyF50us265NuyXL9Dhg58JH+EhDji5WF+WvsTA9Za7Wz49GMUPw3T7
         x8niprKhc8T/Gb9a8lNzRx3hJkBA+qQ9Sc5eqXjpzVkdElM+hfDwxU1MO8i9CkBRHWIS
         PWL5RjfEIlgJjNB9+H8JnOaal1w4ap9LStii6NjWib/7r16IOgKhQaQRLLe/ixYACV4V
         gNsd+WSh+/MB/YrCqH6c+ZHgRnY/dKxRRtlfZYIPeOzv0iBHaH5j4EHs8fuFFIXaRLoc
         9gQKIU+e1nA2Xlf5O0msCHRLxTilc/gNuaxfJl1eydiv/ARHlwq/vsIJk7kJO1uEvh/Q
         kmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KVlt6KV9H0iPcN45PNaGR/Bhb6+rc7oK3VoVzry5jSQ=;
        b=qh4SsB7ByosJVNFHvwmSkHSk5eTI/W61Fx4RPabRf4neTYGRg9miABHAJd0xf3cp31
         IGnReb97VI9H8XzZhN+6YaOw91EgUb+Jx3zaRRWn3pV8FQfuDIRSOFy5/3t+p4V2afzx
         KrUfjH0TWHByRO4R3L7lvQ8Pjm82jWalCVA3AKME67UGzg6DnxOL+qrfEZL36S+0spAe
         gmdakQfTQADFAFi5QNyxjEDmDe7PWJaj/bFiEFNJZ/3zKkFDmgyzfKx1PoBzyYrHuQAk
         MWGiCDRhzASo9AtpPqPRRtOb8FPevFHSFCfP4yFyEVUYWY4g16+Gh6fUz61ui1Omf4JH
         VFHQ==
X-Gm-Message-State: AOAM53339bUSYNCjars9zjYmTJpDVbfmvzCH/iIshlLLFokRGJo/bH2E
        0ojgU6P5cX+9CrNI1jjWyBvbEA==
X-Google-Smtp-Source: ABdhPJzw9l0zmh9YYKufq6N1PiRLaPX7C2bOWYLQhjUtc76q++QdeCVxcewuBwJnYccQQ02ct2W8Ag==
X-Received: by 2002:a17:902:b486:: with SMTP id y6mr6019242plr.100.1597114247418;
        Mon, 10 Aug 2020 19:50:47 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id 8sm868673pjx.14.2020.08.10.19.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2020 19:50:46 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org
Subject: [RFC][PATCH] tty: serial: qcom_geni_serial: Drop __init from qcom_geni_console_setup
Date:   Tue, 11 Aug 2020 02:50:44 +0000
Message-Id: <20200811025044.70626-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>
Cc: Todd Kjos <tkjos@google.com>
Cc: Amit Pundir <amit.pundir@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-serial@vger.kernel.org
Suggested-by: Saravana Kannan <saravanak@google.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 3aa29d201f54..f7c6c7466520 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1098,7 +1098,7 @@ static unsigned int qcom_geni_serial_tx_empty(struct uart_port *uport)
 }
 
 #ifdef CONFIG_SERIAL_QCOM_GENI_CONSOLE
-static int __init qcom_geni_console_setup(struct console *co, char *options)
+static int qcom_geni_console_setup(struct console *co, char *options)
 {
 	struct uart_port *uport;
 	struct qcom_geni_serial_port *port;
-- 
2.17.1

