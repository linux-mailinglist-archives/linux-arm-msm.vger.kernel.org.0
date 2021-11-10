Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D09844C5AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 18:03:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232475AbhKJRGk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 12:06:40 -0500
Received: from linux.microsoft.com ([13.77.154.182]:43418 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232499AbhKJRGi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 12:06:38 -0500
Received: from thelio.attlocal.net (107-203-255-60.lightspeed.sntcca.sbcglobal.net [107.203.255.60])
        by linux.microsoft.com (Postfix) with ESMTPSA id E564E20ABAF3;
        Wed, 10 Nov 2021 09:03:50 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E564E20ABAF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1636563831;
        bh=danwvFIhHXOB5xYfFeriGn3Oz9LTqo/fv3l06x5g7ws=;
        h=From:To:Cc:Subject:Date:From;
        b=jYFwIwRK+BCCWkVO48T1/ipQIbmtq/OL4Gq2I2mrUkaWyw4uVS/1qA7Y5NuJg2yUg
         H4bV/YgQVEDDrv+9lBGg7bHKULcpvjQW57ZYpP+tobGAFZlD5SZMQqkpPGmwIW0/4L
         l8JlzDCN6X8wogydoeJzFuCCIw3GDK0EKTSlYla0=
From:   Katherine Perez <kaperez@linux.microsoft.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH 0/4] arm64: dts: sm8150: display support for Microsoft Surface Duo
Date:   Wed, 10 Nov 2021 09:03:26 -0800
Message-Id: <20211110170330.1789509-1-kaperez@linux.microsoft.com>
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

[    2.478418] platform ae94000.dsi: Fixing up cyclic dependency with
ae00000.mdss:mdp@ae010000
[    2.478832] platform ae94400.dsi-phy: Fixing up cyclic dependency
with af00000.clock-controller
[    2.479134] msm_dsi_phy ae94400.dsi-phy: [drm:dsi_phy_driver_probe
[msm]] *ERROR* dsi_phy_driver_probe: Unable to get ahb clk
[    2.480919] disp_cc-sm8250 af00000.clock-controller: supply mmcx not
found, using dummy regulator
[    2.487023] ath10k_snoc 18800000.wifi: supply vdd-3.3-ch1 not found,
using dummy regulator
[    2.498954] platform ae96000.dsi: Fixing up cyclic dependency with
ae00000.mdss:mdp@ae010000
[    2.513953] ------------[ cut here ]------------
[    2.536309] disp_cc_mdss_ahb_clk status stuck at 'off'
[    2.536320] WARNING: CPU: 6 PID: 76 at drivers/clk/qcom/clk-branch.c:91 clk_branch_wait+0x14c/0x164
[    2.536329] Modules linked in: ath10k_snoc msm(+) ath10k_core gpu_sched crct10dif_ce ath drm_kms_helper qcom_spmi_adc5 qcom_vadc_common mac80211 syscopyarea qrtr libarc4 sysfillrect qcom_pon sysimgblt rtc_pm8xxx qcom_spmi_temp_alarm fb_sys_fops i2c_qcom_geni(+) drm cfg80211 rfkill phy_qcom_qmp ufs_qcom icc_osm_l3 qcom_q6v5_pas qcom_pil_info qcom_wdt qcom_q6v5 qcom_sysmon qcom_common qcom_glink_smem qmi_helpers
[    2.549572]  mdt_loader qnoc_sm8150 socinfo rmtfs_mem
[    2.549577] CPU: 6 PID: 76 Comm: kworker/u16:2 Not tainted 5.15.0 #17
[    3.095528] Hardware name: Microsoft Surface Duo (DT)
[    3.100721] Workqueue: events_unbound deferred_probe_work_func
[    3.106713] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    3.113857] pc : clk_branch_wait+0x14c/0x164
[    3.118238] lr : clk_branch_wait+0x14c/0x164
[    3.122620] sp : ffff80001078ba40
[    3.126030] x29: ffff80001078ba40 x28: 0000000000000000 x27: ffff65e6008e2100
[    3.133348] x26: ffffb8630ec8e278 x25: ffff65e60005e005 x24: ffffb8630ebc0f98
[    3.140665] x23: ffffb8630e234dd8 x22: 0000000000000001 x21: ffffb8630d5b8b60
[    3.147983] x20: 0000000000000000 x19: ffffb8630eb5e7b8 x18: 0000000000000030
[    3.155301] x17: 2e726f74616c7567 x16: ffffb8630d5a3800 x15: ffffffffffffffff
[    3.162619] x14: 0000000000000000 x13: 6f27207461206b63 x12: 7574732073757461
[    3.169937] x11: 77705f313439386d x10: 0000000000000027 x9 : ffffb8630cf974bc
[    3.177256] x8 : 0000000000000027 x7 : 0000000000000002 x6 : 0000000000000027
[    3.184573] x5 : ffff65e6f93cc9a8 x4 : ffff80001078b890 x3 : 0000000000000001
[    3.191891] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff65e600851d80
[    3.199209] Call trace:
[    3.201722]  clk_branch_wait+0x14c/0x164
[    3.205748]  clk_branch2_enable+0x3c/0x60
[    3.209869]  clk_core_enable+0x78/0x220
[    3.213809]  clk_enable+0x38/0x60
[    3.217219]  dsi_phy_enable_resource+0x98/0xac [msm]
[    3.222387]  dsi_phy_driver_probe+0x29c/0x4f8 [msm]
[    3.227453]  platform_probe+0x74/0xe4
[    3.231218]  really_probe.part.0+0xa4/0x328
[    3.235512]  __driver_probe_device+0xa0/0x150
[    3.239990]  driver_probe_device+0x4c/0x164
[    3.244285]  __device_attach_driver+0xc0/0x128
[    3.248850]  bus_for_each_drv+0x84/0xe0
[    3.252788]  __device_attach+0xe0/0x188
[    3.256727]  device_initial_probe+0x20/0x2c
[    3.261020]  bus_probe_device+0xa8/0xbc
[    3.264958]  deferred_probe_work_func+0x90/0xc8
[    3.269609]  process_one_work+0x1f4/0x43c
[    3.273734]  worker_thread+0x78/0x4f0
[    3.277500]  kthread+0x154/0x160
[    3.280813]  ret_from_fork+0x10/0x20
[    3.284482] ---[ end trace 734ed75908fc6b0e ]---

Best,
Katherine

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

