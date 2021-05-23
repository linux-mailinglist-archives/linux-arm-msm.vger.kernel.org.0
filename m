Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D932838DCFA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 May 2021 22:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232003AbhEWUsi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 May 2021 16:48:38 -0400
Received: from relay01.th.seeweb.it ([5.144.164.162]:52273 "EHLO
        relay01.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231969AbhEWUsh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 May 2021 16:48:37 -0400
Received: from TimeMachine.localdomain (bband-dyn255.178-41-232.t-com.sk [178.41.232.255])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 7581420129;
        Sun, 23 May 2021 22:47:09 +0200 (CEST)
From:   Martin Botka <martin.botka@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Martin Botka <martin.botka@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] socinfo: Add missing SoC ID for SM6125
Date:   Sun, 23 May 2021 22:46:59 +0200
Message-Id: <20210523204659.705713-2-martin.botka@somainline.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210523204659.705713-1-martin.botka@somainline.org>
References: <20210523204659.705713-1-martin.botka@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Martin Botka <martin.botka@somainline.org>
---
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

