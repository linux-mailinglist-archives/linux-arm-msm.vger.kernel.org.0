Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC62B2F01AE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jan 2021 17:33:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbhAIQcc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Jan 2021 11:32:32 -0500
Received: from relay01.th.seeweb.it ([5.144.164.162]:58567 "EHLO
        relay01.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbhAIQcc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Jan 2021 11:32:32 -0500
Received: from localhost.localdomain (abaf53.neoplus.adsl.tpnet.pl [83.6.169.53])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 325AE1F4C0;
        Sat,  9 Jan 2021 17:31:34 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konradybcio@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] soc: qcom: socinfo: Add SoC IDs for 630 family
Date:   Sat,  9 Jan 2021 17:31:22 +0100
Message-Id: <20210109163123.147185-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Konrad Dybcio <konradybcio@gmail.com>

Add missing SoC IDs for Snapdragon 630-family platforms.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/soc/qcom/socinfo.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index d21530d24253..0a77318b9ce6 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -224,10 +224,17 @@ static const struct soc_id soc_id[] = {
 	{ 310, "MSM8996AU" },
 	{ 311, "APQ8096AU" },
 	{ 312, "APQ8096SG" },
+	{ 317, "SDM660" },
 	{ 318, "SDM630" },
 	{ 321, "SDM845" },
+	{ 324, "SDA660" },
+	{ 325, "SDM658" },
+	{ 326, "SDA658" },
+	{ 327, "SDA630" },
 	{ 338, "SDM450" },
 	{ 341, "SDA845" },
+	{ 345, "SDM636" },
+	{ 346, "SDA636" },
 	{ 349, "SDM632" },
 	{ 350, "SDA632" },
 	{ 351, "SDA450" },
-- 
2.29.2

