Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B429F20753B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 16:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404088AbgFXOFU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 10:05:20 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:36851 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403979AbgFXOFT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 10:05:19 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jo61c-0002uM-Mr; Wed, 24 Jun 2020 14:05:16 +0000
From:   Colin King <colin.king@canonical.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] soc: qcom: fix off-by-one array index bounds check
Date:   Wed, 24 Jun 2020 15:05:16 +0100
Message-Id: <20200624140516.5929-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The bounds check on model is off-by-one, leading to an array out
of bounds read when model is 26. Fix this.

Addresses-Coverity: ("Out-of-bounds read")
Fixes: e9247e2ce577 ("soc: qcom: socinfo: fix printing of pmic_model")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/soc/qcom/socinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index e19102f46302..4d29ea244e71 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -275,7 +275,7 @@ static int qcom_show_pmic_model(struct seq_file *seq, void *p)
 	if (model < 0)
 		return -EINVAL;
 
-	if (model <= ARRAY_SIZE(pmic_models) && pmic_models[model])
+	if (model < ARRAY_SIZE(pmic_models) && pmic_models[model])
 		seq_printf(seq, "%s\n", pmic_models[model]);
 	else
 		seq_printf(seq, "unknown (%d)\n", model);
-- 
2.27.0

