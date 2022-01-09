Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D86CF488774
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Jan 2022 03:47:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235123AbiAICrM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 Jan 2022 21:47:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235107AbiAICrK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 Jan 2022 21:47:10 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 856FAC061401
        for <linux-arm-msm@vger.kernel.org>; Sat,  8 Jan 2022 18:47:10 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id l12-20020a7bc34c000000b003467c58cbdfso7214852wmj.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Jan 2022 18:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uHGFo7A4Jb7kn9oKiHksVUVvNjGV4U5pwC2vz2G8Qfc=;
        b=lLSB0pOGYKyVZ25tfis5x9jSTMu8QwqdP0/B+ZvIPnaFH1Y7igMzH0rwePj9006hlV
         3XPmjZf/PAqdd4OVvpZPeOOa5tLGk8/rGiq5SKk7VZnefGJSS2CEMAiQBp1A+KuhJp+O
         2VN/wzVTstHxRvmcRbzs+zOYU3GT1+U8OW9wAwC+7Wd4PLBxRZV8fVuitW1U//aXYc+P
         OrXS6ZIAmqdaPXEjXriSuTMOXYp/ZTaz5b/hmhURTT6ZsUW23jf5TMDUj6QYLbgGAfe3
         ElbXKKuKf5omIG+Cv0n9Q5EzMS4ehVE104JMwNuY1OWh8RMtcCOmgpte07CvlHg6w8fM
         negw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uHGFo7A4Jb7kn9oKiHksVUVvNjGV4U5pwC2vz2G8Qfc=;
        b=XsrJvi+1klVPf5YuZ3J0oABvtNrNIxuCYCoIsH2foPrETMhcJhl/UjMVapiaKRdigp
         ivKUOXzeQ/ETTqoirBxbp0Qv5hoZ8qtn9RABqz9wqAHNJl6sCsDwVDmo7qzPFEq4rbxI
         L+y5+BLJjzRMInEqq3Vzjd5PAImLNlXPJK8UDNIarqlGTsCLa8Edu+p4uB01G0cNSNSF
         vmcmNlFZs/QWpLI+Z1PHOaiQOCvqpkNXal4JncUZSGuLeT+Ub9NahL6X/lrVizxBy+y2
         IL/XCadux2N7wM95lgan2Mtig21aEfyd8qP3W2IP8arcph+Cn0TjCWYuVNLIZbUCUe89
         qSJg==
X-Gm-Message-State: AOAM533eWGm5JXE51p0dF35KKq/O7WgJe6v7ht8OBXctK+3kTxdFEP8M
        eUNs8PAbQEq9sMAp8NWlDy/Ah6QulrQiWw==
X-Google-Smtp-Source: ABdhPJzgueyvnH/YxztRWSDEOZGW6LizDU74zyNCWJDjOiCoEnNSfD5IxhiIJ+uKPUILnSp2s5hQXg==
X-Received: by 2002:a05:600c:1c9f:: with SMTP id k31mr16520568wms.159.1641696428858;
        Sat, 08 Jan 2022 18:47:08 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l13sm3341748wrs.73.2022.01.08.18.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 18:47:08 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v2 7/8] media: camss: Point sdm845 at the correct vdda regulators
Date:   Sun,  9 Jan 2022 02:49:09 +0000
Message-Id: <20220109024910.2041763-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220109024910.2041763-1-bryan.odonoghue@linaro.org>
References: <20220109024910.2041763-1-bryan.odonoghue@linaro.org>
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
index dcb37a739c95b..859b397912cc8 100644
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

