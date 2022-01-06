Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B6F6486E22
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 00:53:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343583AbiAFXxs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 18:53:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343598AbiAFXxl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 18:53:41 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61F73C0611FD
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 15:53:40 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id d187-20020a1c1dc4000000b003474b4b7ebcso1372220wmd.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 15:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f0/jP+wtHGnEZCaZ9/FXXw65LhXfTFFCKBh0r3UhICg=;
        b=Dv/yut/JRt/ZVOjBgbZq7X4t3JU2hRhepXqMSK2lfvZyKE7pYV3PumP/JwIpJ4s4h7
         a47lxKxlab97q0smmBcqmni1J00ZO9ibnRe4OuAi8dRI36MJmNeRUimQDRIG/x8vA/tr
         NuksPEMIR01ZKSV+i/t8wn5oQCGLtUUPFnHWZ/xgC03Bk7Ro9wH0bYVguDagtuz9mYBa
         hVuNpWL+SdrCi6wTxj1mjcgRUbAnnvmmZ9mkaosCsYen20yXbsWClJRNZGAOO8OzAeX1
         UQ2HjN4FlUF1cTZk8lbjtGwtDYK4joFAgM+FNmYiPdS3PN69IUSjuNOKECg1/6Y+36pi
         5fsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f0/jP+wtHGnEZCaZ9/FXXw65LhXfTFFCKBh0r3UhICg=;
        b=TyhcPDNoNCR4nCByoaTAekzl7l78qB2eR7Fa30oN+dHqTF0YwmvAIgxKWhzWmtRl4M
         0zx5G7heHTOe03d5nkRInMtMOchs++3w08s+PnTROepzLceBnopgPEgtqqnyAbgmJE1i
         x1Ne4fm6ayBSQnmGMSWI16N+5AheXR3fMHAC8q2NrVL6T6BvrrvQvoteyTSIDU7K4epS
         CUAU84GsLZUlrd7szJBW6s0a0cCWK50vsu/7YZNq3BtMegpugEaEx2Yp4DmdwIQZkqO6
         wyrhK354F2I8jICQ3Mmqh4YJEswMFLm46uI17LnOBt39uMqGoPy949LToDFcE76Ni6YS
         PGYA==
X-Gm-Message-State: AOAM532S0ouFKMAwVQrnTsr0kyyKezPmJaF1kb+iXd+fYorgKRQZe+50
        XkEERDV9DX9YeqI5S+BcgZu7o9PH6CfwVg==
X-Google-Smtp-Source: ABdhPJxcFcMQuIk/0p73clG3HeTa7gIkYGcpdF+XxUcS0M11AJAff5lVTE72GMYHcCbKOlc2a6jhIQ==
X-Received: by 2002:a05:600c:643:: with SMTP id p3mr8771786wmm.130.1641513218743;
        Thu, 06 Jan 2022 15:53:38 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id a71sm335893wme.39.2022.01.06.15.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 15:53:38 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH 6/7] media: camss: Point sdm845 at the correct vdda regulators
Date:   Thu,  6 Jan 2022 23:55:39 +0000
Message-Id: <20220106235540.1567839-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220106235540.1567839-1-bryan.odonoghue@linaro.org>
References: <20220106235540.1567839-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reviewing the RB3 schematic its clear that we have missed out on defining
one of the power-rails associated with the CSI PHY.

Other PHYs such as the UFS, PCIe and USB connect to these rails and define
each regulator individually.

This means if we were to switch off the other various PHYs which enable
these rails, the CAMSS would not appropriately power-on the CSI PHY.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 419c48c4f1d52..6de257502e88b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -543,7 +543,7 @@ static const struct resources csiphy_res_845[] = {
 static const struct resources csid_res_845[] = {
 	/* CSID0 */
 	{
-		.regulators = { NULL },
+		.regulators = { "vdda-phy", "vdda-pll" },
 		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
 				"soc_ahb", "vfe0", "vfe0_src",
 				"vfe0_cphy_rx", "csi0",
@@ -563,7 +563,7 @@ static const struct resources csid_res_845[] = {
 
 	/* CSID1 */
 	{
-		.regulators = { NULL },
+		.regulators = { "vdda-phy", "vdda-pll" },
 		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
 				"soc_ahb", "vfe1", "vfe1_src",
 				"vfe1_cphy_rx", "csi1",
@@ -583,7 +583,7 @@ static const struct resources csid_res_845[] = {
 
 	/* CSID2 */
 	{
-		.regulators = { NULL },
+		.regulators = { "vdda-phy", "vdda-pll" },
 		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
 				"soc_ahb", "vfe_lite", "vfe_lite_src",
 				"vfe_lite_cphy_rx", "csi2",
-- 
2.33.0

