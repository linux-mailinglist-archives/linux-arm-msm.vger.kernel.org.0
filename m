Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67104769442
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jul 2023 13:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231504AbjGaLKO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jul 2023 07:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbjGaLKN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jul 2023 07:10:13 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A4DDE46
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 04:10:12 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4fe3b86cec1so673359e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 04:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690801810; x=1691406610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2srAIP/YQi6mvgjbvgjdkh2d4Z5eLGc0irCc+WgA5YY=;
        b=yDWu8VEB6cUW3L1Klq7jM/n+7qBYpIlXO7LmrYN2hsPFPdxBZoNntJkvQyq3UZFUbx
         4VWCJF8H1/nIFwyOXKBa6QLw0TfZGAji6fCBo2t/td3IQqQ8lPFlLc3WLFKXf8NudJ5l
         cAUh5aFM94GzAd9UzERfZRSP6oFvRvZQ/jkpLuP8cp8CGBXBEKZRA+y4yzWdDSW3FR9G
         CnMrQCgXaC3UOzHnujh0NPeTJVEQunzO7Z/qcKlAv6TtHv8xDcVGMtX0ALAklI5du30F
         XShosTrki2F27qw2AVViFAR/9C1Ijgu0HxTj4P2ktl9HSASV477AI6cPs/kqmdAMh2Uk
         pxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690801810; x=1691406610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2srAIP/YQi6mvgjbvgjdkh2d4Z5eLGc0irCc+WgA5YY=;
        b=DGO8hvLCdBP8Z71v6+EpW5JDe/mwvOfBW/9li4HJAjtAriG7DB/SfkbYdxk5iDXWhY
         Crs7BLKgVTzP5zHNf9Qq7sWOaECKzPZzT6UaOLOHEsrFCsMu6pYZa2eAHEwVnvhKd9iW
         DFTIJSaW7NCVaDAgm8gBhhk92GPtSNt5oB14TqJCP05u4PERKc/D07GOu+FYPIavPK0J
         pLlEV/oKkGKBrwS+/wTvLJxr6YXyNU4vUUkj2FxELRLSvOq54pyMgfKydqg1oITNoUAn
         Z9DIYQ0gxPmm1QcHmSYfsgbjjUoDpLhoIKbHqS9MWblDHtmmJxU0ZPSVnYewRXGojyE6
         2ueg==
X-Gm-Message-State: ABy/qLa7vnyhpvJsfXei/kr14ZEu3DXxDl2STBsAqLm6XZ7f+4Ka4sdE
        f1864CIsO5uPDqfocLwU2zAMPw==
X-Google-Smtp-Source: APBJJlFOl0HTzDRqfOVJ+zlH7wjpb8G6BdA74h37Uisqly81lGqAAQtTUHFzcQk33kbeCz5juj7Nhw==
X-Received: by 2002:a19:5f1a:0:b0:4fd:bec3:776a with SMTP id t26-20020a195f1a000000b004fdbec3776amr4683437lfb.61.1690801810386;
        Mon, 31 Jul 2023 04:10:10 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w5-20020a19c505000000b004fe37199b87sm429683lfe.156.2023.07.31.04.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 04:10:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH] phy: qcom: qmp-ufs: add missing offsets to sm8150 configuration
Date:   Mon, 31 Jul 2023 14:10:09 +0300
Message-Id: <20230731111009.3998089-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The conversion commit 7559e7572c03 ("phy: Explicitly include correct DT
includes") misses offsets configuration for sm8150 (most likely it was
developed separately from the series adding HS G4 support and was not
adapted for the sm8150/sm8250 configuration split).

Add missing offsets to sm8150_ufsphy_cfg.

Fixes: 7559e7572c03 ("phy: Explicitly include correct DT includes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 03cd47faf3fd..3927eba8e468 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1009,6 +1009,8 @@ static const struct qmp_phy_cfg sm7150_ufsphy_cfg = {
 static const struct qmp_phy_cfg sm8150_ufsphy_cfg = {
 	.lanes			= 2,
 
+	.offsets		= &qmp_ufs_offsets,
+
 	.tbls = {
 		.serdes		= sm8150_ufsphy_serdes,
 		.serdes_num	= ARRAY_SIZE(sm8150_ufsphy_serdes),
-- 
2.39.2

