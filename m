Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEC5D74EDA9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 14:09:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbjGKMJq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 08:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231364AbjGKMJh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 08:09:37 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 320BE1724
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 05:09:21 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fb77f21c63so8920290e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 05:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689077359; x=1691669359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sf+BXVXIsB1Vw9FbZaHYZjp79cgXPbbNpseEKS6anQM=;
        b=c/tblfOzWs/7ou60TgTLAD52NX+fgg2GxdcoOR6P5CPPefVoyqUUL6aK2P5yiW+HKN
         7Ouc1JMXcexdBVcuYnIK3Ai7lZ15DkHK3QSye8th25nPrMABE0xmLS0uWo2t0m7Q5j6l
         jxPWggsIHMEOizMtLBwRqfFBCYmLKlFaixVG5iSIyKaNkuCx2BPSn6CsHLcVxEBXbvP8
         SKpttjc4CKfiC9gplAqjh0EjoZUV+pLbJ0v9EDFD5bbX9XNimxJjfRdeOmSxjYw8DYvn
         tOtDERIJECopHAm7pLJWGR0FifX1fpIMd+aPVxyrLXrkQpJy6KNG1Xg55K20+kcrFrvn
         saJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689077359; x=1691669359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sf+BXVXIsB1Vw9FbZaHYZjp79cgXPbbNpseEKS6anQM=;
        b=iG9DaIf+bBGzjkcn+Wx0J2C8lRjxTn3fjtzqh79SgM29+0K05H3nWkJevsHDurb/a1
         n8mbPfVuKtSUwIBFwyBNSMpxA7puz+bHXv0XTAVUhsqEKdEvVx/flY3MeV6wSvJ57mOZ
         24QiQBdLoFldXJ4KAnnU01ZyjTZkUEzjZiZBw2phldnRccOs4/AYelo6EquSZaoUiglZ
         BIcdqcWn3SHtOfRGM/GRmfpNlNZTA9m9Y/9NwtSBDpEjHA9aUx8taqQIajriShY1PO7S
         m28sf0iWkQULSffA8ipD28VWy8H4yHYE4pjqeHI/mC0I6NSYZAWqGkgOW+NDTQu4fq0m
         D+vg==
X-Gm-Message-State: ABy/qLYxqhr8iKoC+0g/ykAt/uGZSb0KvjNuLGR5A0soWSYgjdsUxj9z
        kNJQvsqUKihJdwV30l6PfNKToQ==
X-Google-Smtp-Source: APBJJlH9JLWb2xYJD1ZDTW5+JgYW3aKZfNoFM3mxt5M8A3aNFF3fGuTKgCDF3fUOnYR/Jq83EvR4Og==
X-Received: by 2002:a05:6512:694:b0:4f8:68a3:38e2 with SMTP id t20-20020a056512069400b004f868a338e2mr13998017lfe.0.1689077359384;
        Tue, 11 Jul 2023 05:09:19 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h22-20020ac25976000000b004fbbd818568sm291447lfp.137.2023.07.11.05.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 05:09:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 03/10] phy: qcom-qmp-combo: populate offsets for all combo PHYs
Date:   Tue, 11 Jul 2023 15:09:09 +0300
Message-Id: <20230711120916.4165894-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230711120916.4165894-1-dmitry.baryshkov@linaro.org>
References: <20230711120916.4165894-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In order to support newer style bindings for combo PHYs, populate
offsets for all Combo QMP PHY configurations.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 3a98234eb16a..7558a8407b9d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1505,6 +1505,8 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v5 = {
 };
 
 static const struct qmp_phy_cfg sc7180_usb3dpphy_cfg = {
+	.offsets		= &qmp_combo_offsets_v3,
+
 	.serdes_tbl		= qmp_v3_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_serdes_tbl),
 	.tx_tbl			= qmp_v3_usb3_tx_tbl,
@@ -1548,6 +1550,8 @@ static const struct qmp_phy_cfg sc7180_usb3dpphy_cfg = {
 };
 
 static const struct qmp_phy_cfg sdm845_usb3dpphy_cfg = {
+	.offsets		= &qmp_combo_offsets_v3,
+
 	.serdes_tbl		= qmp_v3_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_serdes_tbl),
 	.tx_tbl			= qmp_v3_usb3_tx_tbl,
@@ -1591,6 +1595,8 @@ static const struct qmp_phy_cfg sdm845_usb3dpphy_cfg = {
 };
 
 static const struct qmp_phy_cfg sc8180x_usb3dpphy_cfg = {
+	.offsets		= &qmp_combo_offsets_v3,
+
 	.serdes_tbl		= sm8150_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_serdes_tbl),
 	.tx_tbl			= sm8150_usb3_tx_tbl,
@@ -1723,6 +1729,8 @@ static const struct qmp_phy_cfg sm6350_usb3dpphy_cfg = {
 };
 
 static const struct qmp_phy_cfg sm8250_usb3dpphy_cfg = {
+	.offsets		= &qmp_combo_offsets_v3,
+
 	.serdes_tbl		= sm8150_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_serdes_tbl),
 	.tx_tbl			= sm8250_usb3_tx_tbl,
-- 
2.39.2

