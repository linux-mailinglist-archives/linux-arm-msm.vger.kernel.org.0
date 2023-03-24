Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 037D16C87CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 22:55:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232069AbjCXVz5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 17:55:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232259AbjCXVz4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 17:55:56 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B0661E5F8
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 14:55:55 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id q16so3936523lfe.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 14:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679694954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FARMu4hTbAZ9FVWyt2VvGjg3+YTS6nEVdT70kTxCBBY=;
        b=j1rCB7sd9xlrWyGKJ5yBj5WzHjKCMGNR03LwVKaDXlmSnOFgj0K1VqrsLL3uleMoQT
         jVguSfepplxrsFZl84t7cgdAvHahlNuljAghy/SXCukOZs8Dfi3EUUlDyqAmBikeuGN1
         50tZjv2k9lFY2pQ+nI3Ua6bEnXkRWCrx+BACB4dvZexx16M7yEqzE5JzBSMKigAXyN09
         uFImt7DuvN4DU4KIAlHmAkSqG0WOcRfE0X4eWnqj4GmTx3Tt7dweTJEFBZemZnY0rxLp
         joZbFTto+T5QdYTEZAgdteVOYYLpEhVN2vGxRh2pI1Gq4P02QWypXwe3U4uxxDhczEAO
         yCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679694954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FARMu4hTbAZ9FVWyt2VvGjg3+YTS6nEVdT70kTxCBBY=;
        b=Bxw4Ln5xPgV/e2yvtyp0ENDlbmaLhgAwvDmwt++Z1Vz3/u20L8j5V4mdX35Xg8ZlWY
         BZYaQo9l8fQCLaRVCHYnF2T1BzBez6WISSUS648exTaUskxMphBPIhANmdJ21kSAvrCc
         NHaoFSJwewRzQDIWptgGKnMeqbfs2588VbAECIaRG5J8inWggts236w8vpNLPiM+soYs
         cgUL7tFczx0EvQs2ME7zHwA8YTT0cH1/xAekvAxzUgbVEnoAxCDiVo/JRvQs0Oaj60hB
         uhdo4eQaBNftjO7IcjiawuPlSo28x6eLkbxc5mv0qTUjjOhN1PzmqKOlFbk+Rrncl5cO
         B2yg==
X-Gm-Message-State: AAQBX9cEwQ1VjzPyW2cPwHuVV5Nus0hJwYaEuwtnfcidpSqo1PAW8813
        lzyjUoYWyXvgvZGIFNEcEPtCjA==
X-Google-Smtp-Source: AKy350YT1TNh3gPW5jYoT+pPUTwmaF6XH+l2//gXleKa3GSaUrV3EGTtXA8hJAUIhX4iTFi1F8c2rw==
X-Received: by 2002:a19:750a:0:b0:4b4:e4a1:2fc6 with SMTP id y10-20020a19750a000000b004b4e4a12fc6mr1325104lfe.68.1679694953835;
        Fri, 24 Mar 2023 14:55:53 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y1-20020a197501000000b004dcf20843efsm3488285lfe.239.2023.03.24.14.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 14:55:53 -0700 (PDT)
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
Subject: [PATCH 2/5] phy: qcom-qmp-combo: add support for the USB+DP PHY on SM8150 platform
Date:   Sat, 25 Mar 2023 00:55:47 +0300
Message-Id: <20230324215550.1966809-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230324215550.1966809-1-dmitry.baryshkov@linaro.org>
References: <20230324215550.1966809-1-dmitry.baryshkov@linaro.org>
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

SM8150 and SC8180X are close relatives. Reuse sc8180x data to support
USB+DP combo PHY on SM8150 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 6850e04c329b..58e1f50c0660 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -3460,6 +3460,10 @@ static const struct of_device_id qmp_combo_of_match_table[] = {
 		.compatible = "qcom,sm6350-qmp-usb3-dp-phy",
 		.data = &sm6350_usb3dpphy_cfg,
 	},
+	{
+		.compatible = "qcom,sm8150-qmp-usb3-dp-phy",
+		.data = &sc8180x_usb3dpphy_cfg,
+	},
 	{
 		.compatible = "qcom,sm8250-qmp-usb3-dp-phy",
 		.data = &sm8250_usb3dpphy_cfg,
-- 
2.30.2

