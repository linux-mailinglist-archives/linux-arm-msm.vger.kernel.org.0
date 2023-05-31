Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBF237173C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 04:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233821AbjEaCeX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 22:34:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234017AbjEaCeV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 22:34:21 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DABC113
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 19:34:20 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f50470d77cso3204842e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 19:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685500458; x=1688092458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aL6CSlS9Q6UUnnjwqpxYTCJ6oS+R2HPG/MBYegldI0Q=;
        b=lbxf+T2rufTGaQVU/uQVQvl2gauIenxWC3PbfLdpuhdVOpx6HYJrwivp1DEas1CCXM
         LpIHFCYylWc8aRMaee3aF9k8yiirUPbymTyTQzcMAlXAqsDnL5Zyw4MGlTlgiCAV21z3
         h/c5OHSH2SyZt665P9abttYvXMp2Bhay/auVlu5BI53Nq4lX2hHXIq2Bi7Ypt5ptf1SB
         ABvHlfxAg0rJjsWcKFMQfiiyzfGczvgCYMrwlv6myWSKN298yBuHIHZazGUbnpgItq6I
         iAOX+bFA9kA/fZ1RldR30pc3EOR/L6VWa2JKK6TxcX7AnMnZx1Td6kPiLiLUinzmYpDy
         dJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685500458; x=1688092458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aL6CSlS9Q6UUnnjwqpxYTCJ6oS+R2HPG/MBYegldI0Q=;
        b=dEtcLHJzvDntGq+dIAgdNHZ8jUj/rom2XSkvPTCA/K/4jP3mdFfk+O6vsT4i0/2Lh6
         DGaBcL5h0TTo1l6b3yYzLgLKFUKC/zbwFqyX7n3v2h024xcddimmZBiXfwMA7sU32JFV
         nsTIO86llLpUX3jYIppXORGGGBtTQItMOUO1BVQ5PV2qY57UmN9v1/WLF6hL0UdPn61i
         oI31sn94+8AJEN0PbWGWFsKVNgq+RTnSZSdvezYv5mByojXxw9nKdvzzGgcW2i6ICji9
         g2kRTTVtDNkM1TU9i7C5/n8IN1qtwXouxQ5bqxo93tK9bgHueVT+ENKdQAnJoxpVG4BM
         db2g==
X-Gm-Message-State: AC+VfDznpJtfGljBu7m7mKTJimyy4Toulh9OU5L5hxD0Nb1N4+lwvKvT
        ZOh4Ejo8m5+66RKPQWwEPhjWCA==
X-Google-Smtp-Source: ACHHUZ5xi+pqHPsc3FrmYQFS72O+CEsnrHZmPZlu0z0/I1avdVZA35aVxYFJWQPQA95KU/Je8VBSyg==
X-Received: by 2002:ac2:4919:0:b0:4f1:430d:ca5c with SMTP id n25-20020ac24919000000b004f1430dca5cmr1750561lfi.56.1685500458686;
        Tue, 30 May 2023 19:34:18 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v24-20020ac25618000000b004f3787d8006sm524096lfd.128.2023.05.30.19.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 19:34:18 -0700 (PDT)
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
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 2/5] phy: qcom-qmp-combo: add support for the USB+DP PHY on SM8150 platform
Date:   Wed, 31 May 2023 05:34:12 +0300
Message-Id: <20230531023415.1209301-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531023415.1209301-1-dmitry.baryshkov@linaro.org>
References: <20230531023415.1209301-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
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
index 33cc99d9c77d..2bff1bbb8610 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -3614,6 +3614,10 @@ static const struct of_device_id qmp_combo_of_match_table[] = {
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
2.39.2

