Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DFD92F01AB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jan 2021 17:33:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726013AbhAIQcT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Jan 2021 11:32:19 -0500
Received: from m-r1.th.seeweb.it ([5.144.164.170]:55043 "EHLO
        m-r1.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726011AbhAIQcT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Jan 2021 11:32:19 -0500
Received: from localhost.localdomain (abaf53.neoplus.adsl.tpnet.pl [83.6.169.53])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 04A7D1F522;
        Sat,  9 Jan 2021 17:31:35 +0100 (CET)
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
Subject: [PATCH 2/2] soc: qcom: socinfo: Add SoC IDs for APQ/MSM8998
Date:   Sat,  9 Jan 2021 17:31:23 +0100
Message-Id: <20210109163123.147185-2-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109163123.147185-1-konrad.dybcio@somainline.org>
References: <20210109163123.147185-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add missing SoC IDs for Snapdragon 835-family platforms.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/soc/qcom/socinfo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 0a77318b9ce6..2e63cb92120c 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -218,6 +218,7 @@ static const struct soc_id soc_id[] = {
 	{ 251, "MSM8992" },
 	{ 253, "APQ8094" },
 	{ 291, "APQ8096" },
+	{ 292, "MSM8998" },
 	{ 293, "MSM8953" },
 	{ 304, "APQ8053" },
 	{ 305, "MSM8996SG" },
@@ -226,6 +227,7 @@ static const struct soc_id soc_id[] = {
 	{ 312, "APQ8096SG" },
 	{ 317, "SDM660" },
 	{ 318, "SDM630" },
+	{ 319, "APQ8098" },
 	{ 321, "SDM845" },
 	{ 324, "SDA660" },
 	{ 325, "SDM658" },
-- 
2.29.2

