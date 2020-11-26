Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C82DF2C5133
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 10:30:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389470AbgKZJ13 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 04:27:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:39540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389459AbgKZJ12 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 04:27:28 -0500
Received: from localhost.localdomain (unknown [122.179.79.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B76772173E;
        Thu, 26 Nov 2020 09:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606382848;
        bh=RajVEh5J5qxj0jZTbfaf46Ko5y2rkQS1hhq+QHTc5Iw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BgrLqCemoqYOV/X1bZmqg7Zl+IZDoMoWbUepOZAWS5B8nLinbNHrtCXIhF92lwdjn
         v6vOsTGhbj19mbQPBX1piv9xvRlYFSYIotRJB5ckHqN0ZbH8cliXmBy9twAxNPHFyF
         A7ZuSnqsInT23IMQC89nLiPH2s8gJWD8H4UlNAkQ=
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] soc: qcom: rpmhpd: Add SDX55 power domains
Date:   Thu, 26 Nov 2020 14:57:11 +0530
Message-Id: <20201126092711.1084518-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201126092711.1084518-1-vkoul@kernel.org>
References: <20201126092711.1084518-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds the power domains found in SDX55 SoC. Downstream code tells me
that we have 3 power domains so add them

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soc/qcom/rpmhpd.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index e72426221a69..4cb5d4ab82e2 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -132,6 +132,18 @@ static const struct rpmhpd_desc sdm845_desc = {
 	.num_pds = ARRAY_SIZE(sdm845_rpmhpds),
 };
 
+/* SDX55 RPMH powerdomains */
+static struct rpmhpd *sdx55_rpmhpds[] = {
+	[SDX55_MSS] = &sdm845_mss,
+	[SDX55_MX] = &sdm845_mx,
+	[SDX55_CX] = &sdm845_cx,
+};
+
+static const struct rpmhpd_desc sdx55_desc = {
+	.rpmhpds = sdx55_rpmhpds,
+	.num_pds = ARRAY_SIZE(sdx55_rpmhpds),
+};
+
 /* SM8150 RPMH powerdomains */
 
 static struct rpmhpd sm8150_mmcx_ao;
@@ -205,6 +217,7 @@ static const struct rpmhpd_desc sc7180_desc = {
 static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,sc7180-rpmhpd", .data = &sc7180_desc },
 	{ .compatible = "qcom,sdm845-rpmhpd", .data = &sdm845_desc },
+	{ .compatible = "qcom,sdx55-rpmhpd", .data = &sdx55_desc},
 	{ .compatible = "qcom,sm8150-rpmhpd", .data = &sm8150_desc },
 	{ .compatible = "qcom,sm8250-rpmhpd", .data = &sm8250_desc },
 	{ }
-- 
2.26.2

