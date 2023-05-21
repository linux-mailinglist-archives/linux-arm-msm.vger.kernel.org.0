Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61FA170B00C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 21:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbjEUTyg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 15:54:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbjEUTye (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 15:54:34 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5481CEA
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 12:54:25 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-96fe88cd2fcso28188866b.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 12:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684698864; x=1687290864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aL6CSlS9Q6UUnnjwqpxYTCJ6oS+R2HPG/MBYegldI0Q=;
        b=PYVQayaMrknSNy1L3z+ByIwbFLBz1hd1cH/4nXupZnE42OgwNifA03+xAc9ArHYN01
         CHfQOVwPIAXcEiXby7Mqi9Oiw7OZoOhy5NU6r62nty3hdlvogbniEznhe05qG8zUvTmS
         lM/5lzwQ7eLJL8T7kLLOo1/HMu3Bomfv6seFzG7ybgKBQw0n+/iemSiUi5oydr2jbH8u
         +pcvgtYWH/+ICaVQPO9XHghbdRm4UNOCAqwcaaBEQTqt+tb/lipfZbgUYt0nEyg72NKW
         uz8dQcC//KgDQfvaoh5aqxeohaIWZQveTyp5Wh8hmkHelEdRWOaBVtvHGhgt5Pk1BShI
         G5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684698864; x=1687290864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aL6CSlS9Q6UUnnjwqpxYTCJ6oS+R2HPG/MBYegldI0Q=;
        b=L2by+M3MknePhPernjNi4eOXb7GEYwaExZWbb0wpEti5ktFBjds2tmR/wlqFZ2NON4
         w4nCvc4UZX+QeXMkuHgYlKyScObyF3ajyNi80uxUFwo5GNHpb3dg9WymNRbtSowiRiG9
         I4ijJ5zzERHPPEi5XluVl9BolICPyCUkgEAyomLBCubwsnJlYDWogsfAPA8UGopqvsci
         xYWAdMQeDbvRq3qKKzjIWdDzxZt3dVth29lwHB8yrm4pvAEDdAPrPyOMFlZmAfdTASVp
         YMniUEBMYY298vKHk9iS3d06Icd8KGtCBnlVVMJtGanq20eDuqDbP3N58bt/E4VHdh9D
         4b8Q==
X-Gm-Message-State: AC+VfDybbfnt9utsGu0Ej4r2Hizz1gH5jYGvs9oa8OKSTCU3zvrixf7g
        D8+Umc5QFaHqGU6uGSzveOwLng==
X-Google-Smtp-Source: ACHHUZ5EGU3eZWmNTs+xQoFdCS04NQ0rd1X9vfnxlGYEs7u+t0FhoTcvnUIEtFsMw/nxh3dvSpe3bA==
X-Received: by 2002:a17:906:ef0d:b0:966:6035:c81e with SMTP id f13-20020a170906ef0d00b009666035c81emr7634824ejs.52.1684698863818;
        Sun, 21 May 2023 12:54:23 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 16-20020a170906101000b00965ffb8407asm2187107ejm.87.2023.05.21.12.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 12:54:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: [RESEND PATCH v2 2/5] phy: qcom-qmp-combo: add support for the USB+DP PHY on SM8150 platform
Date:   Sun, 21 May 2023 22:54:17 +0300
Message-Id: <20230521195420.12454-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230521195420.12454-1-dmitry.baryshkov@linaro.org>
References: <20230521195420.12454-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
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

