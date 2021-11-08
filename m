Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D84AD448076
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 14:45:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240062AbhKHNrt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 08:47:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240082AbhKHNrs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 08:47:48 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D92EC061714
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Nov 2021 05:45:04 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id b13so15864837plg.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Nov 2021 05:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2SsoXlIEyA7M7oMepGUCAXbufcXq3sSqZoUCUyAHvCU=;
        b=Rh/WDrUBEdWGDRXKQdDay5CItIX8kUAL6HHZo+Hww1b90kKjzsmnbBn76HYmrpHWdB
         sTmCcBcsq0tOjjuXma4yCbzBK+JqFFi/kflvJ71ZFEsWf/RRN0WKrsyjzQxPZI2agQ41
         xnt2De17E5PDNaAHT+M+rAeqd1ZQZ/lr0LDB8eLJ39p35sWpDZW2hM5Bfi28vzcesfuL
         J3KKVqkhJd258VIX4cRJQoRDT5c1rN7OSev/PnHfGI/nFhuNeq5j2arRajVOUpj+KNq9
         xwcH2edrXgALRMnjGlTHbqHPz5iKpEd5mCUjLYWMPLqnn7ZJLduC28Ia9R9pKh+EvgQW
         gYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2SsoXlIEyA7M7oMepGUCAXbufcXq3sSqZoUCUyAHvCU=;
        b=O7Fh+C3HMJ+/xIG0CC+orwQ3H61A+UGFqQ+ZGsBpILUN2EkWkDjbywosLD2xT1rAwK
         i6q5eOhHx4ChLS8JkejcPrTdMn1GAngV265vjJ3ySrkCbhWELzm7K9b46l52v5W7/1HZ
         LVC+bbCw++NSPC+chLWkSb7A69KM0GMtSKB4EBIRZU5cFTtgIEknbzKbkdDIW9Yoqs3V
         gQ/qymiVduL2YkMPo34jrUHaG6jnu9zWnulooRolB87+vJ298R3GfYkaV0TxgnkY+23V
         TV3mkSamnpfqRnyklSUewtpyxFUxIBy689ghTz2lYVKa/mpmsJA/pcFtkmW+Y4akep9+
         Epxg==
X-Gm-Message-State: AOAM531rOlUauGWfNGhB+k+2K3r2IdzquMp+DR5KaKL7SKIEYr5gbIOI
        a4NH19pD0941xfqFM5D624DCxw==
X-Google-Smtp-Source: ABdhPJzJ13KWDy70wNVqIrlae8ZGm1C9RGa6I9/T0uTLRxiD6Fvr7g3RJZ2By3Zvj3XwBsK3VgvibQ==
X-Received: by 2002:a17:90a:db89:: with SMTP id h9mr51675447pjv.71.1636379103605;
        Mon, 08 Nov 2021 05:45:03 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id m184sm3693974pga.61.2021.11.08.05.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 05:45:03 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 3/3] soc: qcom: rpmpd: Add QCM2290 support
Date:   Mon,  8 Nov 2021 21:44:42 +0800
Message-Id: <20211108134442.30051-4-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211108134442.30051-1-shawn.guo@linaro.org>
References: <20211108134442.30051-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QCM2290 has the same RPM power domains as SM6115.  Add QCM2290
support by reusing SM6115 power domains.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/soc/qcom/rpmpd.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index 3e7905854eb9..36b2381039e6 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -395,6 +395,23 @@ static const struct rpmpd_desc sm6115_desc = {
 	.max_state = RPM_SMD_LEVEL_TURBO_NO_CPR,
 };
 
+static struct rpmpd *qcm2290_rpmpds[] = {
+	[QCM2290_VDDCX] = &sm6115_vddcx,
+	[QCM2290_VDDCX_AO] = &sm6115_vddcx_ao,
+	[QCM2290_VDDCX_VFL] = &sm6115_vddcx_vfl,
+	[QCM2290_VDDMX] = &sm6115_vddmx,
+	[QCM2290_VDDMX_AO] = &sm6115_vddmx_ao,
+	[QCM2290_VDDMX_VFL] = &sm6115_vddmx_vfl,
+	[QCM2290_VDD_LPI_CX] = &sm6115_vdd_lpi_cx,
+	[QCM2290_VDD_LPI_MX] = &sm6115_vdd_lpi_mx,
+};
+
+static const struct rpmpd_desc qcm2290_desc = {
+	.rpmpds = qcm2290_rpmpds,
+	.num_pds = ARRAY_SIZE(qcm2290_rpmpds),
+	.max_state = RPM_SMD_LEVEL_TURBO_NO_CPR,
+};
+
 static const struct of_device_id rpmpd_match_table[] = {
 	{ .compatible = "qcom,mdm9607-rpmpd", .data = &mdm9607_desc },
 	{ .compatible = "qcom,msm8916-rpmpd", .data = &msm8916_desc },
@@ -404,6 +421,7 @@ static const struct of_device_id rpmpd_match_table[] = {
 	{ .compatible = "qcom,msm8994-rpmpd", .data = &msm8994_desc },
 	{ .compatible = "qcom,msm8996-rpmpd", .data = &msm8996_desc },
 	{ .compatible = "qcom,msm8998-rpmpd", .data = &msm8998_desc },
+	{ .compatible = "qcom,qcm2290-rpmpd", .data = &qcm2290_desc },
 	{ .compatible = "qcom,qcs404-rpmpd", .data = &qcs404_desc },
 	{ .compatible = "qcom,sdm660-rpmpd", .data = &sdm660_desc },
 	{ .compatible = "qcom,sm6115-rpmpd", .data = &sm6115_desc },
-- 
2.17.1

