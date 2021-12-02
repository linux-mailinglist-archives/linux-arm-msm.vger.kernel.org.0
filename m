Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6B034666B3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 16:36:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359069AbhLBPjR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 10:39:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359067AbhLBPjR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 10:39:17 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 872FAC061757
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 07:35:54 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id c4so60467398wrd.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 07:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZPEeFTLtybf1F4P57Z5TStTc5I8rl09YXt8kiq9xgVs=;
        b=tILw4SzhCoeWfqIFOYJP0gF55DMAVZK6d28xfbVp3zsd39PbWIDo83wE6PQDk+s2W9
         /u9hIzZXG/kZg0COze0n/Mf2PK8wX3G0M97CvN7fqwI/uADhCa8LQM2bNbrvPeKEV3SU
         06FusBRob+vt2AYEQreWjz9oZBNEjMw0L+JEkiyGuHntj1d4gqKZnYBBnqNyTJBApNg9
         5uq8oJ77IPej2EwTJiG1oTFKuZuAmR8nVB6i2C3iKmlZfE/Yx3F63U1R19RuflZiIqaw
         bgmUXgc8wn6kl5HDopLdr3m5rKkzzHl7kfyxonkIgX5BFPu3d2EbkjNuWl4AcMLeTCNo
         n1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZPEeFTLtybf1F4P57Z5TStTc5I8rl09YXt8kiq9xgVs=;
        b=Q/PH1+LKNs4xhFVN4dDJVcGfIHJQQjXv9yNvre1yeVuEgtGr+Ws7ZSwrDo6RKl7qp6
         t1PzCvlZBeLOI5GphCePgHN2dKEsc++TlvPw2fA4EJIru0BJc7tZhn7f9lyt8MHV2Ptz
         Dy3MqAeHiy+0mDAM/4l1GKpqOa4oNih4HcgwJ3/kWMgMDT4w4IXpXX6uCp3I1PWD13hQ
         SrN5SnOFrttUid2puVlqQVIwPo6i+L2mIH+aPBC3O1NicOnObkKbvPtqG9ioPGeR3XOi
         2zlmbCshgsIGwkhS+L/bgzz6nnQv+BUEPCk1c6r48xzoe/hRkTQpIVSsXfliAx/JBktw
         AFnA==
X-Gm-Message-State: AOAM5332iVJ30VKnA6CX/Kgdiwkxbw/ZP+mwoHh8nYroArL7IDumng0J
        7GJ/juTrcuSbdILYSRDhfb/lZhWJRB+muTDn
X-Google-Smtp-Source: ABdhPJwnlaylPJ2QBU3f3VV3uM5n8moVCJesrsjLdQGHSabJu6gPj3xaiQm6TQdkIqLWlhvjoOVoIA==
X-Received: by 2002:a5d:588b:: with SMTP id n11mr15056290wrf.344.1638459352853;
        Thu, 02 Dec 2021 07:35:52 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bd18sm3662wmb.43.2021.12.02.07.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 07:35:52 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH v2 11/19] media: camss: remove vdda-csiN from sdm845 resources
Date:   Thu,  2 Dec 2021 15:37:21 +0000
Message-Id: <20211202153729.3362372-12-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
References: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

This isn't used and only works because devm_regulator_get() returns a dummy
regulator.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Julian Grahsl <jgrahsl@snap.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index be091c50a3c0..71c6109b0526 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -542,7 +542,7 @@ static const struct resources csiphy_res_845[] = {
 static const struct resources csid_res_845[] = {
 	/* CSID0 */
 	{
-		.regulator = { "vdda-csi0" },
+		.regulator = { NULL },
 		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
 				"soc_ahb", "vfe0", "vfe0_src",
 				"vfe0_cphy_rx", "csi0",
@@ -562,7 +562,7 @@ static const struct resources csid_res_845[] = {
 
 	/* CSID1 */
 	{
-		.regulator = { "vdda-csi1" },
+		.regulator = { NULL },
 		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
 				"soc_ahb", "vfe1", "vfe1_src",
 				"vfe1_cphy_rx", "csi1",
@@ -582,7 +582,7 @@ static const struct resources csid_res_845[] = {
 
 	/* CSID2 */
 	{
-		.regulator = { "vdda-csi2" },
+		.regulator = { NULL },
 		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
 				"soc_ahb", "vfe_lite", "vfe_lite_src",
 				"vfe_lite_cphy_rx", "csi2",
-- 
2.33.0

