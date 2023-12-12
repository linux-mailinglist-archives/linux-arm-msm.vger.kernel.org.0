Return-Path: <linux-arm-msm+bounces-4416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8733780EEA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 15:25:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42719281ABE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 14:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF54473177;
	Tue, 12 Dec 2023 14:25:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35F3A8F;
	Tue, 12 Dec 2023 06:25:32 -0800 (PST)
Received: from amadeus-Vostro-3710.lan (unknown [113.118.189.146])
	by mail-m121145.qiye.163.com (Hmail) with ESMTPA id 0AA0C800015;
	Tue, 12 Dec 2023 22:25:13 +0800 (CST)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Ohad Ben-Cohen <ohad@wizery.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 1/1] hwspinlock: qcom: fix tcsr data for ipq6018
Date: Tue, 12 Dec 2023 22:25:09 +0800
Message-Id: <20231212142509.655094-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSEtNVkwdSh8ZTEoZQxhNGFUTARMWGhIXJBQOD1
	lXWRgSC1lBWUpKSFVKSkNVSkNCVUpPTVlXWRYaDxIVHRRZQVlPS0hVSkpLSEpDVUpLS1VLWQY+
X-HM-Tid: 0a8c5e6ae656b03akuuu0aa0c800015
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PiI6Agw5Cjw6Pz9PUR9JKRdK
	CS8aCR5VSlVKTEtJSEJKSkpIQ0tJVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	SFVKSkNVSkNCVUpPTVlXWQgBWUFJQ0xINwY+

The tcsr_mutex hwlock register of the ipq6018 SoC is 0x20000[1], which
should not use the max_register configuration of older SoCs. This will
cause smem to be unable to probe, further causing devices that use
smem-part to parse partitions to fail to boot.

[    2.118227] qcom-smem: probe of 4aa00000.memory failed with error -110
[   22.273120] platform 79b0000.nand-controller: deferred probe pending

Remove 'qcom,ipq6018-tcsr-mutex' setting from of_match to fix this.

[1] commit 72fc3d58b87b ("arm64: dts: qcom: ipq6018: Fix tcsr_mutex register size")
Fixes: 5d4753f741d8 ("hwspinlock: qcom: add support for MMIO on older SoCs")
Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 drivers/hwspinlock/qcom_hwspinlock.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index a0fd67fd2934..814dfe8697bf 100644
--- a/drivers/hwspinlock/qcom_hwspinlock.c
+++ b/drivers/hwspinlock/qcom_hwspinlock.c
@@ -115,7 +115,6 @@ static const struct of_device_id qcom_hwspinlock_of_match[] = {
 	{ .compatible = "qcom,sfpb-mutex", .data = &of_sfpb_mutex },
 	{ .compatible = "qcom,tcsr-mutex", .data = &of_tcsr_mutex },
 	{ .compatible = "qcom,apq8084-tcsr-mutex", .data = &of_msm8226_tcsr_mutex },
-	{ .compatible = "qcom,ipq6018-tcsr-mutex", .data = &of_msm8226_tcsr_mutex },
 	{ .compatible = "qcom,msm8226-tcsr-mutex", .data = &of_msm8226_tcsr_mutex },
 	{ .compatible = "qcom,msm8974-tcsr-mutex", .data = &of_msm8226_tcsr_mutex },
 	{ .compatible = "qcom,msm8994-tcsr-mutex", .data = &of_msm8226_tcsr_mutex },
-- 
2.25.1


