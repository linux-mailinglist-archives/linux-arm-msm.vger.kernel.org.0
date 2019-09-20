Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BAF1B9380
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2019 16:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389499AbfITOzu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Sep 2019 10:55:50 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:46219 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389185AbfITOzu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Sep 2019 10:55:50 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MLhsE-1iSrAm1iyG-00Hihn; Fri, 20 Sep 2019 16:55:44 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Andy Gross <agross@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mbox: qcom: avoid unused-variable warning
Date:   Fri, 20 Sep 2019 16:55:29 +0200
Message-Id: <20190920145543.1732316-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Vyj8IgoELBNWAqG5shQMbymVlAFKmfgJTRKXyjfK2wns8erKnyT
 EQNR+NWuon0/SrwcQFXP/Q+5UyeoVJRZcWX1KcNGlOGYEZaFOQ0042uCtn/lfMXjkDcR39H
 Ijabv+hd/DqHd/D5+JgLGmbDmP0jvMZ4DuboWdurVRNStwlZd5Ni6k7zy8U/PRk27arqy0Z
 ap/PBMmshw7j2WNVCkg4A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9vhf4jNp1uA=:+keTyOqPFu2N7vGM0j1fp1
 BCH44pMIIX8ww/IE9WqPXs2NnSFVjfb9Z3ogktOmXOwbUa/xiPIACCfR/zNC6IbWFY+r3JVDK
 hvVRpQqG7yPZ7z3xSYa0x4R5yOs4BkzVkz3JXJG8ZmkOmhMc+s7T+pbTifuTUaTUbf+Qt9bb0
 xUW9tXqR6mATVEv/Z5jwtT5+U3o5Fde4Z+k1G+z+uwmmMwdtJ3DkFVZ1p2+BQppC57NYo2GUa
 y9rfYG+Ec1GswGaaDLJpiPe6ij0J8z9wLKRSJtsEjk1YU+hpKbbE6OoybtRde0z5XbYbKIR5R
 mzxUX9qZC3ST0XiY4S4XRirF2s5WDrvyrdBs66MU70D5tFK2Ds1tVE+SbzsQNG3zxIPezRO0G
 5HE6Xm5HIOPy5lZRHFiDCHGsISFaYzYH5WLx3Uhp1Q92eCpfdJZI7qwgpR76jYUC+BJAiEczT
 mgWoas4/EtD5zGWcYGdxpox+vwwK9I4uaxsNU266RoJGhilOzQOVBrFZjprhdaPiy8HmtKByC
 VZh9byJVC7e3KJtHA9lZA073OwaLt9Ny1dV8WHE8jaLE6Ig/yJVEqCETgr+0QKxWTpBGbxTjY
 TZecPEUcb0egdDeheelJ2awweCfL7SLqczeKFaE8mxaFxRlkttxkRgwSHecnxYW+kIIRsTSDP
 qWpd2BRqrSgdEB1/yaNf1N9/YQJ8QdWixVMjipOGSyzdTfZOBQcyIfeJMfQHBlrMhmm6mkCH2
 9VxIGKBs5/c8NLGgPeEKQpwR7VV48Ml2JiZjYxG5gtvVlD+1rHgdPZDwzA0qepo5EvbuA0NZT
 WNqCaf2EN/UaENvOH5uO98BzU2Aivi1ODWWMjq2ZsQyyJKgOYpUt+ZWFoo5SbtrFR24mFbZ3Y
 MB/Jp2IaW9CmGbKJp3FA==
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Without CONFIG_OF, there is no reference to the apcs_clk_match_table[]
array, causing a harmless warning:

drivers/mailbox/qcom-apcs-ipc-mailbox.c:57:28: error: unused variable 'apcs_clk_match_table' [-Werror,-Wunused-variable]
        const struct of_device_id apcs_clk_match_table[] = {

Move the variable out of the variable scope and mark it 'static'
to avoid the warning (static const variables get silently dropped
by the compiler), and avoid the on-stack copy at the same time.

Fixes: 78c86458a440 ("mbox: qcom: add APCS child device for QCS404")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index eeebafd546e5..10557a950c2d 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -45,6 +45,12 @@ static const struct mbox_chan_ops qcom_apcs_ipc_ops = {
 	.send_data = qcom_apcs_ipc_send_data,
 };
 
+static const struct of_device_id apcs_clk_match_table[] = {
+	{ .compatible = "qcom,msm8916-apcs-kpss-global", },
+	{ .compatible = "qcom,qcs404-apcs-apps-global", },
+	{}
+};
+
 static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 {
 	struct qcom_apcs_ipc *apcs;
@@ -54,11 +60,6 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 	void __iomem *base;
 	unsigned long i;
 	int ret;
-	const struct of_device_id apcs_clk_match_table[] = {
-		{ .compatible = "qcom,msm8916-apcs-kpss-global", },
-		{ .compatible = "qcom,qcs404-apcs-apps-global", },
-		{}
-	};
 
 	apcs = devm_kzalloc(&pdev->dev, sizeof(*apcs), GFP_KERNEL);
 	if (!apcs)
-- 
2.20.0

