Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A61CB204329
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2020 00:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730793AbgFVWAl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 18:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730720AbgFVWAl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 18:00:41 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2A6EC061795
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 15:00:40 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id 64so3591578oti.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 15:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ssWsAVdFC4LIGEQJ/VJ7yId3i3p45oukKnw+xo78VEk=;
        b=IxhcvSlpNYuQCTw0Lrdo+5HWUpG9/oG2cIvSJU0AysEb6Q3+C20QYbWhQXjpDm0NCG
         HeaMsWI9CrY+bNkFIdUMzjpo+EWdLOU+nr8+nbnw+UhwvLwYjBPL5eSHzdKl4u+Bq3Wv
         /G81w2Dj1ahzwZoNeOTnviQP/sjuRpbD1NxhB1VDIfn16Xrj7CGbl/hAj/ef6g9SB9i0
         pRBkBtd9UBh3MPHPS8Y5qHYgmYNiETTTxYWq5lfx3AfLDp9ThVGPBywsw3QFRd7mMDVY
         GqPgQHuyHGcA4wrw/LzCJX5S4Ay0Hmvzbu06ZvUHfOvkZskWpB+6h9oz8gvf8r+zJ82j
         oCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ssWsAVdFC4LIGEQJ/VJ7yId3i3p45oukKnw+xo78VEk=;
        b=H0/h/YXs3Zeov0Puq1BhbvFPmDrM5ZNYp7991kJKoYh0YfAeA5PcJeC3VF+6+7Lwr1
         SEmG847qtGoeoJuGucbeRTO5FRAaG8iDF4no4XP/rAgB/5MVppz8zYy9O9fQmzxZXNzS
         ruzFAxAZADE6qC+cAtmlSH9SUA+IQU5gqtgivO5mXLUtDkzEpSl9xpSv3LSa20w4iHRJ
         7zg1Ovbgk7DZZOFDMwMyby089Nuuz7shJkvKN38UaD1WheWNyoXrw9PzRm4j6FapVFJE
         f5AG/16XpMrpcyv39MJHOs2kKAo2vFbl803uPU/mtmdJFR+hfAjkapDCauECNhYiKf5+
         clww==
X-Gm-Message-State: AOAM533zcqNzjI+BBxQolImHhY+30ZCKzET5zXiFGJg5Mgch4iSsACXK
        TYglY6ubbD/xEStk0TVS8XA2tQ==
X-Google-Smtp-Source: ABdhPJyYxWll1PhMA3qiAlsU+2CmqUgM/1ltQs5y0nw479HtQmeyac4j2CB/TDEIlkRuphVxnksC/Q==
X-Received: by 2002:a4a:e74a:: with SMTP id n10mr15925806oov.71.1592863238529;
        Mon, 22 Jun 2020 15:00:38 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v2sm3594714otb.70.2020.06.22.15.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 15:00:37 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: defconfig: Enable Qualcomm SM8250 pinctrl driver
Date:   Mon, 22 Jun 2020 15:00:48 -0700
Message-Id: <20200622220048.717073-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SM8250 pinctrl driver provides pin configuration, pin muxing and
GPIO pin control for many pins on the SM8250 SoC.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b3d13e1a052a..bbbaaab5a4fa 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -469,6 +469,7 @@ CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
 CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SDM845=y
 CONFIG_PINCTRL_SM8150=y
+CONFIG_PINCTRL_SM8250=y
 CONFIG_GPIO_ALTERA=m
 CONFIG_GPIO_DWAPB=y
 CONFIG_GPIO_MB86S7X=y
-- 
2.26.2

