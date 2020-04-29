Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 755B01BD7BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 10:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbgD2I6C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 04:58:02 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:39015 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726456AbgD2I6B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 04:58:01 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MiaHf-1j0SBx0QsR-00feuR; Wed, 29 Apr 2020 10:57:54 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Elliot Berman <eberman@codeaurora.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Rob Clark <robdclark@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: qcom: avoid struct initialization warning on gcc-4.8
Date:   Wed, 29 Apr 2020 10:57:33 +0200
Message-Id: <20200429085753.3277336-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:7KaUn3buwEkNDHPN8X6Z266ISA0Wrs/iXj3zHng2xrxqK76pNcB
 oEzcgAJc2fjFO/HseLdfFpWpwj4K0d3jxgMOzu9yaJ8QgB7visdfB1c68kc4ngwTg0GKFi6
 cb+S5UhmOVicrFymvvLq6q864bdrUDIeDDo1Ij8mdpt9LkElYYh2me1H30cUcz7EdWcbg01
 Qg82NUOXOI4UUvmygxaaQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ishH48B3DYY=:kehiV9oZ6JNSoXRx/i89+q
 kIAQ/gyXGN7b8ZhY5/kudZWZEYitQBXqNapQ2e2KZX1xXKMEoVr4L4LBzXwnpkVZdopPft9jr
 mhM+dpHhy0rjpTOyiG0X170s6/uXoKs7HZaV29A17+ZPe2yLuAcNrz0BxzADI4L3LMsanmNeT
 LiXiQtIos0IVQ+YbRDy/PKiY42r0Srk3WFv3tM3YcDAWm1JMWBEqbPU6LzOT9zVuvV9RF3chi
 XoQIeDqq2tK5uEECSbGDLh1vE9473QQSJO9/r+GhPS+g1VBB/oMtMWN42uE74bcg8MB40QgrL
 ohNruHsI7EetCvNbMDt3O9d/TJ3j48GSpS9lhZoZpCwUeLF1gdcMBj6fjU+d/MY3sLZp6OXhF
 HuzY/8LI1Fkydm3Q1u3m802V3wYOEsId2eEbGScGsIsxRkCoIfPNVc9on/fl2pEA/QTlJy1V/
 YUaOMSXMONV54ZR9fU/dm26KxY1QiQMp/k6olqk4OwKiDD5LtF5N2nh2WBhclJBct5VVuxtKL
 Hj272jnwmzSKhVd1MnuYuIRJ8//jKhAVg3piqWoJ4N/YkJ2umaj2wUaLVSZ3oYbdJBJyv0WPF
 4SjssakNmPAxMptGGgvL27jYhd5MuGx/fjjKLnQufOaLBa/5iI0MW7iASCBOIEghhhRtFmPh7
 Wx0RuMfL1X5QnNaKxilxB/O5S8oGvgJ4SXROLvvNjr9RU8u4lKcWV+z1DXFiqObTRempvWYV+
 gVxrB1pubHv2Hh8D0qcmQO/ZTcvdXtOvOluJOfBI1bLQ91vibp9K1cvOO4C1NS88U+Gh5jBcj
 A39HVtW+aMXuXmq2R5oMYpi2eIvVKT7tn1P4yc4571urbQtGio=
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When building with old compilers like gcc-4.8, a struct initializer
can warn about invalid syntax:

drivers/firmware/qcom_scm-smc.c: In function 'scm_smc_call':
drivers/firmware/qcom_scm-smc.c:94:9: error: missing braces around initializer [-Werror=missing-braces]
  struct arm_smccc_args smc = {0};
         ^
drivers/firmware/qcom_scm-smc.c:94:9: error: (near initialization for 'smc.args') [-Werror=missing-braces]
cc1: some warnings being treated as errors
drivers/firmware/qcom_scm-legacy.c: In function 'scm_legacy_call':
drivers/firmware/qcom_scm-legacy.c:139:9: error: missing braces around initializer [-Werror=missing-braces]
  struct arm_smccc_args smc = {0};
         ^
drivers/firmware/qcom_scm-legacy.c:139:9: error: (near initialization for 'smc.args') [-Werror=missing-braces]

Change this to use the empty initializer extension that
works with all compilers.

Fixes: 590e92809a58 ("firmware: qcom_scm-32: Move SMCCC register filling to qcom_scm_call")
Fixes: 3f951ea627da ("firmware: qcom_scm-64: Move SMC register filling to qcom_scm_call_smccc")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/firmware/qcom_scm-legacy.c | 2 +-
 drivers/firmware/qcom_scm-smc.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/qcom_scm-legacy.c b/drivers/firmware/qcom_scm-legacy.c
index eba6b60bfb61..5aa15fcf01d9 100644
--- a/drivers/firmware/qcom_scm-legacy.c
+++ b/drivers/firmware/qcom_scm-legacy.c
@@ -136,7 +136,7 @@ int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
 	unsigned int i;
 	struct scm_legacy_command *cmd;
 	struct scm_legacy_response *rsp;
-	struct arm_smccc_args smc = {0};
+	struct arm_smccc_args smc = { };
 	struct arm_smccc_res smc_res;
 	const size_t cmd_len = arglen * sizeof(__le32);
 	const size_t resp_len = MAX_QCOM_SCM_RETS * sizeof(__le32);
diff --git a/drivers/firmware/qcom_scm-smc.c b/drivers/firmware/qcom_scm-smc.c
index 497c13ba98d6..81818ea74824 100644
--- a/drivers/firmware/qcom_scm-smc.c
+++ b/drivers/firmware/qcom_scm-smc.c
@@ -91,7 +91,7 @@ int scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
 			(qcom_scm_convention == SMC_CONVENTION_ARM_32) ?
 			ARM_SMCCC_SMC_32 : ARM_SMCCC_SMC_64;
 	struct arm_smccc_res smc_res;
-	struct arm_smccc_args smc = {0};
+	struct arm_smccc_args smc = { };
 
 	smc.args[0] = ARM_SMCCC_CALL_VAL(
 		smccc_call_type,
-- 
2.26.0

