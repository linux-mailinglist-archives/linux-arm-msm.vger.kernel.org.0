Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8C4B2F3881
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jan 2021 19:22:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406194AbhALSV5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jan 2021 13:21:57 -0500
Received: from relay06.th.seeweb.it ([5.144.164.167]:57783 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406146AbhALSV5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jan 2021 13:21:57 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A17FD3EBE2;
        Tue, 12 Jan 2021 19:20:59 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        rjw@rjwysocki.net, viresh.kumar@linaro.org, nks@flawful.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        daniel.lezcano@linaro.org, manivannan.sadhasivam@linaro.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v3 04/15] cpufreq: blacklist SDM630/636/660 in cpufreq-dt-platdev
Date:   Tue, 12 Jan 2021 19:20:41 +0100
Message-Id: <20210112182052.481888-5-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112182052.481888-1-angelogioacchino.delregno@somainline.org>
References: <20210112182052.481888-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the SDM630, SDM636 and SDM660 to the blacklist since the CPU
scaling is handled out of this.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index bd2db0188cbb..f82f4ec17ff2 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -135,6 +135,9 @@ static const struct of_device_id blacklist[] __initconst = {
 	{ .compatible = "qcom,msm8996", },
 	{ .compatible = "qcom,qcs404", },
 	{ .compatible = "qcom,sc7180", },
+	{ .compatible = "qcom,sdm630", },
+	{ .compatible = "qcom,sdm636", },
+	{ .compatible = "qcom,sdm660", },
 	{ .compatible = "qcom,sdm845", },
 
 	{ .compatible = "st,stih407", },
-- 
2.29.2

