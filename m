Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F53C44F0CD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Nov 2021 03:40:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235475AbhKMCnG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Nov 2021 21:43:06 -0500
Received: from linux.microsoft.com ([13.77.154.182]:54520 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233303AbhKMCnF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Nov 2021 21:43:05 -0500
Received: from thelio.attlocal.net (107-203-255-60.lightspeed.sntcca.sbcglobal.net [107.203.255.60])
        by linux.microsoft.com (Postfix) with ESMTPSA id F3F6A20C3619;
        Fri, 12 Nov 2021 18:40:13 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com F3F6A20C3619
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1636771214;
        bh=WUd5PwiMkcnWkeIXQp9yo8ikbNySEIy+IekhJmWKMoU=;
        h=From:To:Cc:Subject:Date:From;
        b=Ll5aFnQTWcjUT/MnbxzdbDpGAflrbfwji5SgGYaziQju2h8E6nCj7DxUvew14eKKE
         W0ZEFPBdSw3oHaAp/C5z4GYxS4Sz1ylSaL4X/b8OJMR8muY0wJ+ln10uqpY1kVGkh5
         qJ2guwPFey+aXZjwtQntrv6GsLrn8DEBgoMrJOa4=
From:   Katherine Perez <kaperez@linux.microsoft.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 0/4] arm64: dts: qcom: sm8150: display support for Microsoft Surface Duo
Date:   Fri, 12 Nov 2021 18:39:51 -0800
Message-Id: <20211113023955.105989-1-kaperez@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn and Vinod,

I'm trying to enable the display subsystem on SM8150 but am having
trouble enabling the DISP_CC_MDSS_AHB_CLK. Trace shows "disp_cc_mdss_ahb_clk
status stuck at off". Do you have any pointers on enabling this clock?

msm_dsi_phy ae94400.dsi-phy: [drm:dsi_phy_driver_probe [msm]] *ERROR* dsi_phy_driver_probe: Unable to get ahb clk
disp_cc-sm8250 af00000.clock-controller: supply mmcx not found, using dummy regulator
platform ae96000.dsi: Fixing up cyclic dependency with ae00000.mdss:mdp@ae010000
------------[ cut here ]------------
disp_cc_mdss_ahb_clk status stuck at 'off'
WARNING: CPU: 6 PID: 76 at drivers/clk/qcom/clk-branch.c:91 clk_branch_wait+0x14c/0x164
CPU: 6 PID: 76 Comm: kworker/u16:2 Not tainted 5.15.0 #17
Hardware name: Microsoft Surface Duo (DT)
Workqueue: events_unbound deferred_probe_work_func
pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : clk_branch_wait+0x14c/0x164
lr : clk_branch_wait+0x14c/0x164
sp : ffff80001078ba40
x29: ffff80001078ba40 x28: 0000000000000000 x27: ffff65e6008e2100
x26: ffffb8630ec8e278 x25: ffff65e60005e005 x24: ffffb8630ebc0f98
x23: ffffb8630e234dd8 x22: 0000000000000001 x21: ffffb8630d5b8b60
x20: 0000000000000000 x19: ffffb8630eb5e7b8 x18: 0000000000000030
x17: 2e726f74616c7567 x16: ffffb8630d5a3800 x15: ffffffffffffffff
x14: 0000000000000000 x13: 6f27207461206b63 x12: 7574732073757461
x11: 77705f313439386d x10: 0000000000000027 x9 : ffffb8630cf974bc
x8 : 0000000000000027 x7 : 0000000000000002 x6 : 0000000000000027
x5 : ffff65e6f93cc9a8 x4 : ffff80001078b890 x3 : 0000000000000001
x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff65e600851d80
Call trace:
 clk_branch_wait+0x14c/0x164
 clk_branch2_enable+0x3c/0x60
 clk_core_enable+0x78/0x220
 clk_enable+0x38/0x60
 dsi_phy_enable_resource+0x98/0xac [msm]
 dsi_phy_driver_probe+0x29c/0x4f8 [msm]
 platform_probe+0x74/0xe4
 really_probe.part.0+0xa4/0x328
 __driver_probe_device+0xa0/0x150
 driver_probe_device+0x4c/0x164
 __device_attach_driver+0xc0/0x128
 bus_for_each_drv+0x84/0xe0
 __device_attach+0xe0/0x188
 device_initial_probe+0x20/0x2c
 bus_probe_device+0xa8/0xbc
 deferred_probe_work_func+0x90/0xc8
 process_one_work+0x1f4/0x43c
 worker_thread+0x78/0x4f0
 kthread+0x154/0x160
 ret_from_fork+0x10/0x20
---[ end trace 734ed75908fc6b0e ]---

Katherine Perez (4):
  arm64: dts: qcom: sm8150: add dispcc node
  arm64: dts: qcom: sm8150: add display nodes
  arm64: dts: qcom: sm8150: add DSI display nodes
  arm64: dts: qcom: sm8150: display support for Microsoft Surface Duo

 .../dts/qcom/sm8150-microsoft-surface-duo.dts |  26 ++
 arch/arm64/boot/dts/qcom/sm8150.dtsi          | 292 ++++++++++++++++++
 2 files changed, 318 insertions(+)

--
2.31.1

