Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96808305B87
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 13:37:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343529AbhA0Me4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 07:34:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:48416 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237981AbhA0McB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 07:32:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F99C20791;
        Wed, 27 Jan 2021 12:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611750669;
        bh=PqbYn0GtD1KaVpQdsdfrygpTzurN/PmEZawMHpFS8eo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=il2Ll2444IAyVD3TkSPbooaNpHXqb8S+fz+e5FZDZ3MlZ8pdurqHqnrpfu7Omo6KV
         GPhs7BscWie2DT6qAO+xUmSzqN1H7kJYg+A0fuEw6NrDUmY/87UGlF4SD2mxodcwqw
         fWRgAkyoC63jxtqlk9gVSLFBG9OyabsdvazkO5NYmm+IShtLCUJTLcTvpMpNAzuLvl
         +ZbMs0/PhvENBcRXcEGoLBbGFrjVa779+sgPFB85SYob5clkqGpxbZ9DAopmzcXtvJ
         4p3rTLcYElGKunsrKt5iai6pwzuJdY/tyIbB4bqJEYYfCCwUygPpfsMkGaEQsEcCCm
         49DvONwcKJ4jw==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/6] soc: qcom: aoss: Add SM8350 compatible
Date:   Wed, 27 Jan 2021 18:00:50 +0530
Message-Id: <20210127123054.263231-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210127123054.263231-1-vkoul@kernel.org>
References: <20210127123054.263231-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add SM8350 compatible to the qcom_aoss binding and driver.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt | 1 +
 drivers/soc/qcom/qcom_aoss.c                                 | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
index 953add19e937..19c059e44681 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
@@ -20,6 +20,7 @@ power-domains.
 		    "qcom,sdm845-aoss-qmp"
 		    "qcom,sm8150-aoss-qmp"
 		    "qcom,sm8250-aoss-qmp"
+		    "qcom,sm8350-aoss-qmp"
 
 - reg:
 	Usage: required
diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index b5840d624bc6..53acb9423bd6 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -600,6 +600,7 @@ static const struct of_device_id qmp_dt_match[] = {
 	{ .compatible = "qcom,sdm845-aoss-qmp", },
 	{ .compatible = "qcom,sm8150-aoss-qmp", },
 	{ .compatible = "qcom,sm8250-aoss-qmp", },
+	{ .compatible = "qcom,sm8350-aoss-qmp", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qmp_dt_match);
-- 
2.26.2

