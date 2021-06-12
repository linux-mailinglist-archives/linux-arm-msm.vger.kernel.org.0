Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 798A13A4E00
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jun 2021 11:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231193AbhFLJsh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Jun 2021 05:48:37 -0400
Received: from relay04.th.seeweb.it ([5.144.164.165]:46287 "EHLO
        relay04.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231252AbhFLJsh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Jun 2021 05:48:37 -0400
Received: from localhost.localdomain (bband-dyn73.178-41-129.t-com.sk [178.41.129.73])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 992BA1F977;
        Sat, 12 Jun 2021 11:46:36 +0200 (CEST)
From:   Martin Botka <martin.botka@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Martin Botka <martin.botka@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V3 1/3] socinfo: Add missing SoC ID for SM6125
Date:   Sat, 12 Jun 2021 11:46:28 +0200
Message-Id: <20210612094631.89980-1-martin.botka@somainline.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add SM6125 SoC ID to the soc_id struct

Signed-off-by: Martin Botka <martin.botka@somainline.org>
---
Changes in V2:
Add commit description
Changes in V3:
None
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index f6cfb79338f0..c52145e92f03 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -254,6 +254,7 @@ static const struct soc_id soc_id[] = {
 	{ 350, "SDA632" },
 	{ 351, "SDA450" },
 	{ 356, "SM8250" },
+	{ 394, "SM6125" },
 	{ 402, "IPQ6018" },
 	{ 425, "SC7180" },
 	{ 455, "QRB5165" },
-- 
2.31.1

