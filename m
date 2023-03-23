Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD9496C6B71
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 15:47:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbjCWOrb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 10:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbjCWOrb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 10:47:31 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E16A726590
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 07:47:29 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id y20so28104015lfj.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 07:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679582848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7FnaHvkF/EeUZFXtYAGWVdOTWkg/zMiRbhBKZ4hSqrA=;
        b=K8hQz8uz6sDTC4RwHRVPoE7V1oYrLzk/9kyOh2PrHn0B50om43st3+8UiBs4scpFze
         7SMi1tW/2k70JsGXVnW5JjaoUCdTxNtIKvK1XBtLI5139dIvqXgXsGR7PqTBU4g/QPqY
         U16nBl+GxTIRAvmbNeFQN/fH/m2kN+yyio79+rveLgOZkehlgzMynOZhpLAQUb2hsSOp
         66bpDv71DR8u2RhgDd4ykLpDuLoUrLqboulR7cTrVV3jvB2lMBsLQrnkYfHufV4CaIzA
         KAwGTQYWGNbYoAtH9914HV/AxRdy7vPcVO9LYHCYCD/r/drKZD+/19xWbcPiI9kxjNiV
         8eSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679582848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7FnaHvkF/EeUZFXtYAGWVdOTWkg/zMiRbhBKZ4hSqrA=;
        b=lkyvgPZ2dRF2lpZ8Dck9ONkJUlC929UV1YKKSrNh69u2EJg9Z5PD80xJ476pAN6IsF
         WRY1enWRlN0USJrH5h1Hs+b6OkrVr1ea5T0hcRtnTqHnq5Ozz9zJzYhO4pAL54cbJ8cR
         Si8hy24hD3KErSU34vOZDzRHdk0ZCBgM7vc5jVj60Ke6V9zelYakcIVdnm8cWSXuYMBs
         i3CuY5u8kOnXUc8mYcstiI2pWfjpqoTsDLeto+k++oRi8XWLgdhzbLWPHaZzkM4U85zs
         NOpas11kckUPGrXNbc1tLeOryayEu4H2yc4bn+3fHkaLIgjpe2jlShQQrAOVABNe2uso
         U3LA==
X-Gm-Message-State: AO0yUKUrRdCUTf0eB7jHRvt3iSwHq3ZNfYn1EMie6l1FkjjR7jBxgLsC
        lLiJfX2PmQ3CWxjtJ4F2ApgijA==
X-Google-Smtp-Source: AK7set8g5D2AaDWEp61cURfkGfT32ewkiNOn9Lfx/3jzOjCBt4S0jUTaGPcOfbyKpiBkVYvluUxLnQ==
X-Received: by 2002:a05:6512:15b:b0:4b5:8507:9ae6 with SMTP id m27-20020a056512015b00b004b585079ae6mr3297539lfo.2.1679582848198;
        Thu, 23 Mar 2023 07:47:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z15-20020ac24f8f000000b004e83fc5f627sm2922033lfs.188.2023.03.23.07.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 07:47:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH 2/2] phy: qcom-qmp-combo: use qmp_combo_offsets_v3 instead of _v6
Date:   Thu, 23 Mar 2023 17:47:26 +0300
Message-Id: <20230323144726.1614344-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230323144726.1614344-1-dmitry.baryshkov@linaro.org>
References: <20230323144726.1614344-1-dmitry.baryshkov@linaro.org>
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

The qmp_combo_offsets_v3 table is already used for v3 and v4 PHYs. Reuse
it for v6 too, dropping the separate qmp_combo_offsets_v6.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 3b488d12c933..6850e04c329b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1417,22 +1417,6 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v5 = {
 	.dp_dp_phy	= 0x2200,
 };
 
-static const struct qmp_combo_offsets qmp_combo_offsets_v6 = {
-	.com		= 0x0000,
-	.txa		= 0x1200,
-	.rxa		= 0x1400,
-	.txb		= 0x1600,
-	.rxb		= 0x1800,
-	.usb3_serdes	= 0x1000,
-	.usb3_pcs_misc	= 0x1a00,
-	.usb3_pcs	= 0x1c00,
-	.usb3_pcs_usb	= 0x1f00,
-	.dp_serdes	= 0x2000,
-	.dp_txa		= 0x2200,
-	.dp_txb		= 0x2600,
-	.dp_dp_phy	= 0x2a00,
-};
-
 static const struct qmp_phy_cfg sc7180_usb3dpphy_cfg = {
 	.serdes_tbl		= qmp_v3_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_serdes_tbl),
@@ -1759,7 +1743,7 @@ static const struct qmp_phy_cfg sm8350_usb3dpphy_cfg = {
 };
 
 static const struct qmp_phy_cfg sm8550_usb3dpphy_cfg = {
-	.offsets		= &qmp_combo_offsets_v6,
+	.offsets		= &qmp_combo_offsets_v3,
 
 	.serdes_tbl		= sm8550_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(sm8550_usb3_serdes_tbl),
-- 
2.30.2

