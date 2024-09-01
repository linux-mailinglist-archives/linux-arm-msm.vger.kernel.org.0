Return-Path: <linux-arm-msm+bounces-30353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D50D9675C5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Sep 2024 11:31:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB74A1F21A5D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Sep 2024 09:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B17A714B949;
	Sun,  1 Sep 2024 09:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KR0SeRW8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B8B14B084;
	Sun,  1 Sep 2024 09:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725183105; cv=none; b=KJgRfQdA21UWIGtDo5HNYLfUpyyFPTPz4c9QtuV4uoDJVFnssB7BrsRKT4GgNEdSByjEwiOqafL3LnucMHdUs8juemCDs41jg8vH0I6NJefU9j5uv7vTl0+aTjsY8RSvUyl13xo4HuRrxaLG2MSSjt1YUBNU3buva72fcQTnQn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725183105; c=relaxed/simple;
	bh=HX95G8WQPXXEMqFVk5uQHFdvVxTtf9VYKA/2Fnc+KSE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UrflH7bca6RzKW2SRi923K5R3OOTOelfViULhIjTcsqIAxN2RcZx0wTldoQSnweZ4qYXckNMSNBVmBw+3EYi33tbXNZg98p8Zjyip921lOfMVJrDPbUxaukxSm7iszJK6pbS3o31rYI9x0Wzm15pwO3yBbFbIm0TQXAplcFsRSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KR0SeRW8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FCC0C4CEC3;
	Sun,  1 Sep 2024 09:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725183105;
	bh=HX95G8WQPXXEMqFVk5uQHFdvVxTtf9VYKA/2Fnc+KSE=;
	h=From:To:Cc:Subject:Date:From;
	b=KR0SeRW8or71KiZ6k9UJFjLDabYzHz+CVE9dzMZoLZYTRNxsCE+Ji5GgWdKkqQbZR
	 vLDUWynoyYjq/G6HU/88H/jS8VKHXAINtCN6qAcL04Hq/9pqMqu8+sG72krkbvKCdf
	 sseII++7Nu8/W6nxgy2KBzWGaVrwoP+KDGL5ssvIR7R8d80Xk1Eaf14lsDBvJLbW2T
	 yft1b5Nq1nSr+9nObRTCVvu3wyj8TXyT/sp5gDQaklwbCAFvtuMcVOix01YHXN8kTU
	 mzNmvuzo8leHiqT+e1vvBeYSjzixm92IfV3dhnIBmYmh9QC/I/KBkhT8xQGXz6dG5l
	 utkz8aFiU5oLA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1skgwB-000000004vA-3jIB;
	Sun, 01 Sep 2024 11:31:59 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH] clk: qcom: videocc-sm8350: use HW_CTRL_TRIGGER for vcodec GDSCs
Date: Sun,  1 Sep 2024 11:30:24 +0200
Message-ID: <20240901093024.18841-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent change in the venus driver results in a stuck clock on the
Lenovo ThinkPad X13s, for example, when streaming video in firefox:

	video_cc_mvs0_clk status stuck at 'off'
	WARNING: CPU: 6 PID: 2885 at drivers/clk/qcom/clk-branch.c:87 clk_branch_wait+0x144/0x15c
	...
	Call trace:
	 clk_branch_wait+0x144/0x15c
	 clk_branch2_enable+0x30/0x40
	 clk_core_enable+0xd8/0x29c
	 clk_enable+0x2c/0x4c
	 vcodec_clks_enable.isra.0+0x94/0xd8 [venus_core]
	 coreid_power_v4+0x464/0x628 [venus_core]
	 vdec_start_streaming+0xc4/0x510 [venus_dec]
	 vb2_start_streaming+0x6c/0x180 [videobuf2_common]
	 vb2_core_streamon+0x120/0x1dc [videobuf2_common]
	 vb2_streamon+0x1c/0x6c [videobuf2_v4l2]
	 v4l2_m2m_ioctl_streamon+0x30/0x80 [v4l2_mem2mem]
	 v4l_streamon+0x24/0x30 [videodev]

using the out-of-tree sm8350/sc8280xp venus support. [1]

Update also the sm8350/sc8280xp GDSC definitions so that the hw control
mode can be changed at runtime as the venus driver now requires.

Fixes: ec9a652e5149 ("venus: pm_helpers: Use dev_pm_genpd_set_hwmode to switch GDSC mode on V6")
Link: https://lore.kernel.org/lkml/20230731-topic-8280_venus-v1-0-8c8bbe1983a5@linaro.org/ # [1]
Cc: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Taniya Das <quic_tdas@quicinc.com>
Cc: Abel Vesa <abel.vesa@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/clk/qcom/videocc-sm8350.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8350.c b/drivers/clk/qcom/videocc-sm8350.c
index 5bd6fe3e1298..874d4da95ff8 100644
--- a/drivers/clk/qcom/videocc-sm8350.c
+++ b/drivers/clk/qcom/videocc-sm8350.c
@@ -452,7 +452,7 @@ static struct gdsc mvs0_gdsc = {
 	.pd = {
 		.name = "mvs0_gdsc",
 	},
-	.flags = HW_CTRL | RETAIN_FF_ENABLE,
+	.flags = HW_CTRL_TRIGGER | RETAIN_FF_ENABLE,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -461,7 +461,7 @@ static struct gdsc mvs1_gdsc = {
 	.pd = {
 		.name = "mvs1_gdsc",
 	},
-	.flags = HW_CTRL | RETAIN_FF_ENABLE,
+	.flags = HW_CTRL_TRIGGER | RETAIN_FF_ENABLE,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
-- 
2.44.2


