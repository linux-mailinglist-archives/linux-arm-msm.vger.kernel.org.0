Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F42470AFF7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 21:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjEUTgm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 15:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229837AbjEUTgl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 15:36:41 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE21BDE
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 12:36:39 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2af28a07be9so26542231fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 12:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684697798; x=1687289798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aL6CSlS9Q6UUnnjwqpxYTCJ6oS+R2HPG/MBYegldI0Q=;
        b=ffHrUF0VH9PjnZcExL8ZbjwGU/g+KQn+qyEPoa9b2tlcvyd/MQ/oWloxfdYFsW9HuR
         OueIVqVqz3h+SvtOiIEV7XD6+d057E6BTMXubKYtYx0A5Kukjc8Emgn3ffW+EBkEv3eZ
         sNngKxYsSVcVs2fjXqayKc59d3oC6wnuyVIQ5kPCWcPaF2ywppq0ktWBAE3/7R30ozrL
         jAfDzoIXg5Hoec4Kkh8F89xSXbPMleQ2DhAEoiM0jO7S0F58ZB+bWnfiB7M5JAD3t6h6
         6TMKhWx1HCZoVJpv1Ob21znJrEGaH2J6IiYBpSNWJ0rcuJFownk0ByKv2o+FkL/mZFI7
         /+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684697798; x=1687289798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aL6CSlS9Q6UUnnjwqpxYTCJ6oS+R2HPG/MBYegldI0Q=;
        b=jnDVSwXe7Dtuw4tZgzTReZrpYpYYHTo8px5pqW2heMcFVw5qbpXBJ/1XSGi3dpc6qW
         ss/J7c0NhQvQKvl7wVr3Qee/n//yB0JkLjMw2H1Ffwh6/sfG79I+haFo8t5h19ylgKX8
         wqo1yQ16Awu5aCTWPPjBwu3SUaewhLb8aN2oIjDNAhllLhUMPnI1P2d0twF588kkqSvd
         cj6OI22UuCizFuQE4mlrcNCO1aJyXfrNnyPLkTFPc0NOyQEVDReZWDl2oufimUNkpyDv
         fQ6LVP82h/9ADIBkqUbmFLMgnTzj8CVOKo2uh96cp+p3a0PfLgOEDpg+27KxLfNpPk4w
         YSlQ==
X-Gm-Message-State: AC+VfDwqQZKEvnki6HFJmsBElGFlAswZItlwNyt1vbER6TDXUq7BEUmc
        EEccnaShtcR7wD5CtHpr1L6o6SsUUV5r+RhrIKg=
X-Google-Smtp-Source: ACHHUZ7JxTvU8M3gsOqPEEgoaPNf6pHr2X27wo7/lE9AHNeaf6Y1L5gWqqCuI/sICTKd876sFdPZgw==
X-Received: by 2002:a2e:8e89:0:b0:2b0:259d:f670 with SMTP id z9-20020a2e8e89000000b002b0259df670mr54308ljk.4.1684697798297;
        Sun, 21 May 2023 12:36:38 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id q4-20020a2e8744000000b002adb98fdf81sm830009ljj.7.2023.05.21.12.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 12:36:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v2 2/5] phy: qcom-qmp-combo: add support for the USB+DP PHY on SM8150 platform
Date:   Sun, 21 May 2023 22:36:32 +0300
Message-Id: <20230521193635.3078983-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230521193635.3078983-1-dmitry.baryshkov@linaro.org>
References: <20230521193635.3078983-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
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

