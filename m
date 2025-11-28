Return-Path: <linux-arm-msm+bounces-83742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64304C91BF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 12:03:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0716D3A9761
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 11:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB5230BBB8;
	Fri, 28 Nov 2025 11:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9FuW13s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BF13054FE;
	Fri, 28 Nov 2025 11:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764327806; cv=none; b=Ivoym7htcUT4PDnFSnjtWUwcXFL25Kd5Aez6TUn/n7PbroOOdBBo0o8s74pxHjnUy2R9jhV0iErXoUz+49oXh6SU6VQeMxhwxb5xJmpyiZvpeDsiOkiCOpOV4pvcuEG0PU5Zqo+G8TcH+jiaqZCqYudGs4hW+5n6MCTlaGsRO98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764327806; c=relaxed/simple;
	bh=1yXBcqx9Lmrd3a+4fRpNAJknhRJd1smTDHo5aN1hppk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=THbso6mTyghjbHYPraVoG3uM6aBptG83Aax1yOUeUa63AYLy3LTu0kt3AIs9C08FFBZUkrar5XDUuh2EB+Of4Fq4X0Po9qr9IJKeneUenZ/cU0LSNuhUhQ3y+H6sfAmB0oI1tioFy4h2nP5rkTEz+gS7YdDIPc6fvEEVuvng56U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9FuW13s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5ED33C113D0;
	Fri, 28 Nov 2025 11:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764327805;
	bh=1yXBcqx9Lmrd3a+4fRpNAJknhRJd1smTDHo5aN1hppk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=M9FuW13sCdJF45+YQ97+/07ZYsSXBRAdwU/Jakg7X/Byu4nLjcB2/H9LiCQg0TDcA
	 DE6O7aP0xH3k1p3gCHOO2hW2BL7Lewxz/vFig3+4FIZDCGLYZKjW+2GO5oOhrzeDFP
	 WEqjvD4WZiDE7kDoIRLC2xGweI4nw3B0m+bp91UfWDo1UOKVv4qEG8UJyB+WTgaHew
	 mKeYW1JVJkhVZ04yIt0nwMBqok3QuL3CByn8AHtH/TxXbCsnquESkGS9C5xLwwG77/
	 F8XuOPlIVYXP6dNwjCrMn6/enS5VbltEanmJbXE6KkJ1cFdmfZLzbG0/eKlKrygxJE
	 IUHaSKnzrhjSg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52987D116F3;
	Fri, 28 Nov 2025 11:03:25 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Fri, 28 Nov 2025 15:03:19 +0400
Subject: [PATCH] clk: qcom: gcc-ipq5018: flag sleep clock as critical
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-ipq5018-sleep-clk-fix-v1-1-6f4b75ec336c@outlook.com>
X-B4-Tracking: v=1; b=H4sIAHeBKWkC/x2MQQqAMAzAviI9W7ADx/Qr4kFmq0XRuYEIw787P
 CaQZEgclRP0VYbItyY9jwJUV+DX6VgYdS4MpjEtkXGo4Wobcph25oB+31D0QRKx1FkrXhyUNkQ
 u+v8O4/t+TIoPmWcAAAA=
X-Change-ID: 20251128-ipq5018-sleep-clk-fix-1ff61966fcf8
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764327803; l=4144;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=rihKcx0crrGSSBw/1HQR+1rGHpJBaHYrt+nnV2LIefY=;
 b=lhJCzqThR0Wpy1Au53cCfOwogN11F5IxWAUIByU9bWOnwhGrOldy02CKE9RRKbyWyjhJ5ZIc3
 VpuAy54F5luDqSG2lYRZ0l36KmYw5pxgArt8SOM+wurLkm+qTmjE6us
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

The sleep clock never be disabled. To avoid the kernel trying to disable
it and keep it always on, flag it as critical.

Fixes: e3fdbef1bab8 ("clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018")
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
additional context:

This issue occurs on any device referencing the GCC_SLEEP_CLK_SRC clock,
as required by drivers to bring up the Q6 processor and WCSS, and making
a call to devm_clk_get_enabled (or similar) implicitly registers a call
to clk_disable_unprepare which causes below kernel error. This clock
should never be disabled as also evidenced in the downstream driver:
https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/blob/NHSS.QSDK.12.5/drivers/clk/qcom/gcc-ipq5018.c?ref_type=heads#L1424

[    3.012124] ------------[ cut here ]------------
[    3.012976] gcc_sleep_clk_src status stuck at 'on'
[    3.013022] WARNING: CPU: 0 PID: 1 at drivers/clk/qcom/clk-branch.c:87 clk_branch_toggle+0x168/0x180
[    3.022181] Modules linked in:
[    3.031465] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.12.59 #0
[    3.034328] Hardware name: Linksys MR5500 (DT)
[    3.040837] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    3.045354] pc : clk_branch_toggle+0x168/0x180
[    3.052208] lr : clk_branch_toggle+0x168/0x180
[    3.056722] sp : ffffffc082393ac0
[    3.061147] x29: ffffffc082393ac0 x28: 0000000000000000 x27: 0000000000000000
[    3.064539] x26: 0000000000000000 x25: 0000000000000000 x24: ffffffc080aac890
[    3.071655] x23: 0000000000000000 x22: 0000000000000000 x21: ffffffc08047c2a8
[    3.078773] x20: ffffffc0822d62c8 x19: 0000000000000000 x18: ffffffc08224b878
[    3.085892] x17: ffffffbf9dd04000 x16: ffffffc082378000 x15: 00000000000000b7
[    3.093010] x14: 00000000000000b7 x13: 00000000ffffffea x12: ffffffc0822a3820
[    3.100128] x11: ffffffc08224b878 x10: ffffffc0822a3878 x9 : 0000000000000001
[    3.107247] x8 : 0000000000000001 x7 : 0000000000017fe8 x6 : c0000000ffffefff
[    3.114364] x5 : 0000000000057fa8 x4 : 0000000000000000 x3 : ffffffc0823938a0
[    3.121482] x2 : ffffffc08224b7a0 x1 : ffffffc08224b7a0 x0 : 0000000000000026
[    3.128603] Call trace:
[    3.135713]  clk_branch_toggle+0x168/0x180
[    3.137973]  clk_branch2_disable+0x1c/0x30
[    3.142137]  clk_core_disable+0x60/0xac
[    3.146218]  clk_disable+0x30/0x4c
[    3.149950]  clk_disable_unprepare+0x18/0x30
[    3.153423]  devm_clk_release+0x24/0x40
[    3.157850]  devres_release_all+0xb0/0x120
[    3.161409]  device_unbind_cleanup+0x18/0x60
[    3.165577]  really_probe+0x210/0x2bc
[    3.170003]  __driver_probe_device+0x78/0x118
[    3.173562]  driver_probe_device+0x40/0xf0
[    3.177902]  __driver_attach+0x90/0x160
[    3.181895]  bus_for_each_dev+0x64/0xb8
[    3.185627]  driver_attach+0x24/0x3c
[    3.189447]  bus_add_driver+0xe4/0x208
[    3.193267]  driver_register+0x68/0x124
[    3.196825]  __platform_driver_register+0x24/0x30
[    3.200559]  wcss_sec_driver_init+0x1c/0x28
[    3.205419]  do_one_initcall+0x50/0x210
[    3.209413]  kernel_init_freeable+0x23c/0x298
[    3.213232]  kernel_init+0x20/0x120
[    3.217746]  ret_from_fork+0x10/0x20
[    3.221046] ---[ end trace 0000000000000000 ]---
[    3.225373] remoteproc remoteproc0: releasing q6wcss
---
 drivers/clk/qcom/gcc-ipq5018.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
index dcda2be8c1a51950248050882620d63d75eb1ca5..64792cda06202157441222a0bdbf6dc883343054 100644
--- a/drivers/clk/qcom/gcc-ipq5018.c
+++ b/drivers/clk/qcom/gcc-ipq5018.c
@@ -1340,6 +1340,7 @@ static struct clk_branch gcc_sleep_clk_src = {
 			.name = "gcc_sleep_clk_src",
 			.parent_data = gcc_sleep_clk_data,
 			.num_parents = ARRAY_SIZE(gcc_sleep_clk_data),
+			.flags = CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
 		},
 	},

---
base-commit: 7d31f578f3230f3b7b33b0930b08f9afd8429817
change-id: 20251128-ipq5018-sleep-clk-fix-1ff61966fcf8

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>



