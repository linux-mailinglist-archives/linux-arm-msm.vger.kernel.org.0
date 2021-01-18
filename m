Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 081742FAAAB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 20:54:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437677AbhARTx6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 14:53:58 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:40772 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390375AbhARLhe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 06:37:34 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1l1Sq4-0003gr-4a; Mon, 18 Jan 2021 11:36:52 +0000
From:   Colin King <colin.king@canonical.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom: socinfo: Fix off-by-one array index bounds check
Date:   Mon, 18 Jan 2021 11:36:51 +0000
Message-Id: <20210118113651.71955-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is an off-by-one array index bounds check on array
pmic_models. Fix this by checking using < rather than <= on
the array size.

Addresses-Coverity: ("Out-of-bounds read")
Fixes: 734c78e7febf ("soc: qcom: socinfo: add info from PMIC models array")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/soc/qcom/socinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index a985ed064669..f449df560d93 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -332,7 +332,7 @@ static int qcom_show_pmic_model_array(struct seq_file *seq, void *p)
 		unsigned int model = SOCINFO_MINOR(get_unaligned_le32(ptr + 2 * i * sizeof(u32)));
 		unsigned int die_rev = get_unaligned_le32(ptr + (2 * i + 1) * sizeof(u32));
 
-		if (model <= ARRAY_SIZE(pmic_models) && pmic_models[model])
+		if (model < ARRAY_SIZE(pmic_models) && pmic_models[model])
 			seq_printf(seq, "%s %u.%u\n", pmic_models[model],
 				   SOCINFO_MAJOR(le32_to_cpu(die_rev)),
 				   SOCINFO_MINOR(le32_to_cpu(die_rev)));
-- 
2.29.2

