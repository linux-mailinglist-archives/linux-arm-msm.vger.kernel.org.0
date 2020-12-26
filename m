Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6442E2E5B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Dec 2020 15:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbgLZOLy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Dec 2020 09:11:54 -0500
Received: from relay05.th.seeweb.it ([5.144.164.166]:33277 "EHLO
        relay05.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726199AbgLZOLy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Dec 2020 09:11:54 -0500
Received: from localhost.localdomain (abac131.neoplus.adsl.tpnet.pl [83.6.166.131])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 2F0A83F1D1;
        Sat, 26 Dec 2020 15:11:11 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH RFC] remoteproc: qcom: wcnss: Adjust voltage requirements for Pronto v2
Date:   Sat, 26 Dec 2020 15:11:00 +0100
Message-Id: <20201226141100.90147-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is required for MSM8974 devices that cannot afford to push
the regulators further.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/remoteproc/qcom_wcnss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index e2573f79a137..71480be545e4 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -124,7 +124,7 @@ static const struct wcnss_data pronto_v2_data = {
 	.spare_offset = 0x1088,
 
 	.vregs = (struct wcnss_vreg_info[]) {
-		{ "vddmx", 1287500, 1287500, 0 },
+		{ "vddmx", 950000, 1150000, 0 },
 		{ "vddcx", .super_turbo = true },
 		{ "vddpx", 1800000, 1800000, 0 },
 	},
-- 
2.29.2

