Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F90E2F027A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jan 2021 19:05:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbhAISEw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Jan 2021 13:04:52 -0500
Received: from relay03.th.seeweb.it ([5.144.164.164]:34513 "EHLO
        relay03.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbhAISEv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Jan 2021 13:04:51 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 01FFB1F5D4;
        Sat,  9 Jan 2021 19:04:08 +0100 (CET)
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
Subject: [PATCH v2 05/15] cpufreq: blacklist MSM8998 in cpufreq-dt-platdev
Date:   Sat,  9 Jan 2021 19:03:49 +0100
Message-Id: <20210109180359.236098-6-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109180359.236098-1-angelogioacchino.delregno@somainline.org>
References: <20210109180359.236098-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the MSM8998 to the blacklist since the CPU scaling is handled
out of this.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index d8935e525807..bc1ac5971dbe 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -131,6 +131,7 @@ static const struct of_device_id blacklist[] __initconst = {
 
 	{ .compatible = "qcom,apq8096", },
 	{ .compatible = "qcom,msm8996", },
+	{ .compatible = "qcom,msm8998", },
 	{ .compatible = "qcom,qcs404", },
 	{ .compatible = "qcom,sc7180", },
 	{ .compatible = "qcom,sdm630", },
-- 
2.29.2

