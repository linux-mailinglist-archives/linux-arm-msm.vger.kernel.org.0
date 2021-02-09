Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 665E131589D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 22:32:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233832AbhBIV0B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 16:26:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233797AbhBIUj1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 15:39:27 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63FC1C0698CE
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 12:28:56 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id r65so6897359lff.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 12:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y2sXgyRUSbWucarQO/W38pyeQQd5t/8A+supGCZdM8k=;
        b=f96sipJQRhkoaHX/CPqnD8Polag/JQWJjejnqt8CsvR4b6qtrgtXXJ0br9EM46tHPI
         9RsuUbTvxXmNaOsAelVp6FJ0GY25ZwChVY98FYT1ZXLg0QKkaLG72BNIAIHtm6m4plUx
         QFQn441kaXwC3guJ1h+C6vGWV7bGpnzn0fHhOonHd6F7whCUGYRpLT+MEZsn3bROp083
         7Cih6m0iJf4I24tpVQs1x71/ARaKbsePlSFBafwg1Fi1nNsIdYkuaUSjs3Tuyd7PtKKk
         qD2LzY+BVCwIAXikAotpoIlJK+lhjTeb22yX6RfNGYn3Y1AxKQXj4iUOrDaFXYYRD3ck
         KuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y2sXgyRUSbWucarQO/W38pyeQQd5t/8A+supGCZdM8k=;
        b=UJMDTGo0N4Mn25OHnn4GtJRSmTnE8mQxeHv+pCEqTLfvvJp7fvJ6GBTINmJuJlIjvo
         2HtgNsqzGj6IJxyAJm8gLkmL5wu+zaUmlm1WM/KhSkyKttT4Er/dC0ZrUNQkEencPHx2
         jvqq0OmUEMQebpnlF50G1hfzuwPw6/ZqCNOvYpYNd8Eav3kmGe9vJvXLbHNgnDWMGhD+
         nggv6qxgcLL4p7nglNllVIAW/fAVv2kwss6z0r4y9hPbZvzd73zvGAl5OkbOLbiFI803
         OMLNSk2xFbswOErPighpE8BkrJmqvGWzg2dytHZcPR9y+VLMd4fryJH0HYbaKiJezDv0
         FnCA==
X-Gm-Message-State: AOAM532EKbzz1+SjtiECbUmVESfgboKR6NWZFYZ3zxq/YxW0Q/2Z7Iua
        TgA6jz5OpthUXHsVi6xqQkEcqA==
X-Google-Smtp-Source: ABdhPJzJU/Tex5gP031hCxZRat1ecwHp9gVHptv/ubJtSegFVU7NE2Gvb3GVAe9xAEZsVkHKiW252Q==
X-Received: by 2002:a19:3817:: with SMTP id f23mr2969318lfa.591.1612902534780;
        Tue, 09 Feb 2021 12:28:54 -0800 (PST)
Received: from eriador.lan ([94.25.229.138])
        by smtp.gmail.com with ESMTPSA id o19sm2680449lfu.182.2021.02.09.12.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 12:28:54 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 0/4] arm64: dts: qcom: qrb5165-rb5: use GPIO as SPI0 CS
Date:   Tue,  9 Feb 2021 23:28:45 +0300
Message-Id: <20210209202849.1148569-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

GENI SPI controller shows several issues if it manages the CS on its own
(see 37dd4b777942 ("arm64: dts: qcom: sc7180: Provide pinconf for SPI to
use GPIO for CS") for the details). Configure SPI0 CS pin as a GPIO.

Changes since v2:
 - Move pinctrl-names to the board file.
 - Reorder CS/CS-gpio/data-clk nodes to follow alphabetical sort.

Changes since v1:
 - Split sm8250's spi pin config into mux/config parts, split away CS
   handling from main SPI pinctrl nodes.

----------------------------------------------------------------
Dmitry Baryshkov (4):
      arm64: dts: qcom: sm8250: split spi pinctrl config
      arm64: dts: qcom: sm8250: further split of spi pinctrl config
      arm64: dts: qcom: sm8250: add pinctrl for SPI using GPIO as a CS
      arm64: dts: qcom: qrb5165-rb5: switch into using GPIO for SPI0 CS

 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts |  13 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi     | 521 +++++++++++++++----------------
 2 files changed, 273 insertions(+), 261 deletions(-)


