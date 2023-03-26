Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A4F76C91ED
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Mar 2023 01:57:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230405AbjCZA5m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Mar 2023 20:57:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbjCZA5j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Mar 2023 20:57:39 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03DCEBB96
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Mar 2023 17:57:38 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id s8so6923893lfr.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Mar 2023 17:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679792256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cviUGkrb0ncjbVEvBlggYrFLKN/luXhn7XONBztpvU=;
        b=qvpf6tljN5y0PTflN4ZQCX9S+YOEguJ3rbx3jCIhihHFXbpkHFciUIPisVLcxxsk7n
         Dznc1qvIFeitl5w2DNwMqv49aTyEbXD/9JE3nL5t4SJV52ncktIu5nXlqwpR7ifCW9zV
         BekLgSNAqdYgYkl92VizXcRLBr3XfHjcTkvhaIdfpQ7z8jqxgZlSeNToBnmIpilwniGy
         YqLtcq4qsLiEQCPNlOQ9v1DGcepGk6XbkA1R+zCjUxk5hYXepPepuG0i6Q5PXPklDzlt
         1rbS108BzXr5jxrhDe3IA9s7ovlyQNbA2qPSXaTQulQQiTApAkyoTOd6OTmc2wMHWy1/
         tFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679792256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1cviUGkrb0ncjbVEvBlggYrFLKN/luXhn7XONBztpvU=;
        b=r18l+RiuAYxZaKXoGZQudJ4FQlvG2XbCZdzQO/Z8opXIkF+h2lxmtqtOmuNJxJfWy/
         cW10rTcx+p4cblR91cI/O8mVatkNQnF8yfBqnok1HiQRdK0u/O0kpUJlCVOODBAS2SAV
         o1aElXL10+a7m9+Cij82cfWeJ9v5Ywi3uUxejhYJKZqPHiesuCRyw+2uSK0+1aVhOMKP
         AgtPUgFcFvJoK3ibmFHeQHpKVLfViADYPKtEWSakVfaMxhv6ABAjhJ5IPmK8cDK5HiNH
         3hyj9YtN/canIze+llEAHd/771Ecuwursbycrk6qw/Qc0+xgW/Km9Fev4bZ6gbGGWFjX
         NkjA==
X-Gm-Message-State: AO0yUKUTCW1/vJH/Ha+8Ayjx79DSpF2gfnuYkQg1Y4jRxryYcjwlABxK
        uA3AwENFpXa/TpqLy/NcCX+OBA==
X-Google-Smtp-Source: AK7set94A+4cm1/sHNxs0qdPCnF6youNs1/OhwBvzTBNVM7jWrCMXn7C4XBJtK8M7Ca+34Xkvn05VA==
X-Received: by 2002:a05:6512:33c2:b0:4e8:3d0:84b4 with SMTP id d2-20020a05651233c200b004e803d084b4mr4573092lfg.24.1679792256323;
        Sat, 25 Mar 2023 17:57:36 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n13-20020ac242cd000000b004e7fa99f3f4sm3996858lfl.265.2023.03.25.17.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 17:57:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>,
        devicetree@vger.kernel.org
Subject: [PATCH v2 3/9] phy: qcom-qmp-combo: populate offsets for all combo PHYs
Date:   Sun, 26 Mar 2023 03:57:27 +0300
Message-Id: <20230326005733.2166354-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230326005733.2166354-1-dmitry.baryshkov@linaro.org>
References: <20230326005733.2166354-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In order to support newer style bindings for combo PHYs, populate
offsets for all Combo QMP PHY configurations.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index d35d80f2a4f4..5ce68d211998 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1407,6 +1407,8 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v5 = {
 };
 
 static const struct qmp_phy_cfg sc7180_usb3dpphy_cfg = {
+	.offsets		= &qmp_combo_offsets_v3,
+
 	.serdes_tbl		= qmp_v3_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_serdes_tbl),
 	.tx_tbl			= qmp_v3_usb3_tx_tbl,
@@ -1450,6 +1452,8 @@ static const struct qmp_phy_cfg sc7180_usb3dpphy_cfg = {
 };
 
 static const struct qmp_phy_cfg sdm845_usb3dpphy_cfg = {
+	.offsets		= &qmp_combo_offsets_v3,
+
 	.serdes_tbl		= qmp_v3_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_serdes_tbl),
 	.tx_tbl			= qmp_v3_usb3_tx_tbl,
@@ -1493,6 +1497,8 @@ static const struct qmp_phy_cfg sdm845_usb3dpphy_cfg = {
 };
 
 static const struct qmp_phy_cfg sc8180x_usb3dpphy_cfg = {
+	.offsets		= &qmp_combo_offsets_v3,
+
 	.serdes_tbl		= sm8150_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_serdes_tbl),
 	.tx_tbl			= sm8150_usb3_tx_tbl,
@@ -1625,6 +1631,8 @@ static const struct qmp_phy_cfg sm6350_usb3dpphy_cfg = {
 };
 
 static const struct qmp_phy_cfg sm8250_usb3dpphy_cfg = {
+	.offsets		= &qmp_combo_offsets_v3,
+
 	.serdes_tbl		= sm8150_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_serdes_tbl),
 	.tx_tbl			= sm8250_usb3_tx_tbl,
-- 
2.30.2

