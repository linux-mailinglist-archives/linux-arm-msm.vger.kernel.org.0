Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8DC5213FAE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2020 20:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbgGCSxo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jul 2020 14:53:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbgGCSxo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jul 2020 14:53:44 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55D95C08C5DD
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2020 11:53:44 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id 207so14108948pfu.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2020 11:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eWJU0FWdTff+uL3kEpD2oqqgtPNKxa9+VLRU7B17FDA=;
        b=YJbmAjGaE5bR6H2KyJDYOzUTqDr92z7lklxVkbgr9r+PiQ/QOqfAoDLQlPIwUCCOxC
         r/g5S7wYKDe7092l1uDIhNGTLJ/PYsmZbTEMAdQxQUZpFHZsGIYrGnih7kzbPoWWLQTL
         VZwTCp5fGSJ7ehB6yWcDMhR2HRt9bApz7e6RKrAuwZyb4oE3o10+9+lQu9o03dKSUx+b
         8GAzg7SydHbzqhVkZq2ONAEftka+6B36D1uwxQywN9B4vPBoaAp+IE8K2ybMa1rjWAHv
         AEqrSdxpVO60NhE/W/jkRRD249JooqdUV49W4QVGawj/Z69xTKF1FVwmHTB7dVQt2ZyB
         mOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eWJU0FWdTff+uL3kEpD2oqqgtPNKxa9+VLRU7B17FDA=;
        b=j+hC2UsRujL7xeb4h3tv+tvpyDSdQkdP7TauB38Jm3AuZLgBBZS68cnPBXlH4L8iRs
         /58DSCAuYueOopLhlQwTaqy/VaZ+oaIQgIkXb6IZvxBtIAv95TvVS1lskFalnTxxECUF
         1p6lvu0NttGvYhJsrZ5eoxzbHCxdoud5XuTd9rN1hbSDv/1ysIMJMKc7T6P2Yr/Hd3s0
         m/6ZfAYs2OXAyXAYKo0mtDfNvLdEfz5XLtw+T2CtO9s1V15E72J6vjI4p42wxgMtNtcp
         placQXXL1g8p5yKEvjAvC8itsSdUFIuKHaxo9NL/9oBJrPhslcqB4r83kt9I7BULWdZZ
         /vcA==
X-Gm-Message-State: AOAM533bplwUsKtuKkgS0wzJCywooUmiBX35f9hLq1DtOJDTVlub6ctI
        DxEkmsD1Y+74QIwq5f/fodNg5Q==
X-Google-Smtp-Source: ABdhPJw+BSrPKtvkkkrRdaleQ9tyYprdic3o8VZZKjlUZnxXo1whRA6EaefvUsAIwuHWqtOnnDIMjQ==
X-Received: by 2002:a63:3508:: with SMTP id c8mr31142500pga.9.1593802423724;
        Fri, 03 Jul 2020 11:53:43 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a11sm6346638pjw.35.2020.07.03.11.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 11:53:43 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Olof Johansson <olof@lixom.net>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: defcondfig: Enable USB ACM and FTDI drivers
Date:   Fri,  3 Jul 2020 11:53:54 -0700
Message-Id: <20200703185354.1814337-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable USB serial drivers to provide UART access to various development
boards from an ARM64 host.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 883e8bace3ed..103ddad961cd 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -687,6 +687,7 @@ CONFIG_USB_OHCI_EXYNOS=y
 CONFIG_USB_OHCI_HCD_PLATFORM=y
 CONFIG_USB_RENESAS_USBHS_HCD=m
 CONFIG_USB_RENESAS_USBHS=m
+CONFIG_USB_ACM=m
 CONFIG_USB_STORAGE=y
 CONFIG_USB_MUSB_HDRC=y
 CONFIG_USB_MUSB_SUNXI=y
@@ -696,6 +697,8 @@ CONFIG_USB_CHIPIDEA=y
 CONFIG_USB_CHIPIDEA_UDC=y
 CONFIG_USB_CHIPIDEA_HOST=y
 CONFIG_USB_ISP1760=y
+CONFIG_USB_SERIAL=m
+CONFIG_USB_SERIAL_FTDI_SIO=m
 CONFIG_USB_HSIC_USB3503=y
 CONFIG_NOP_USB_XCEIV=y
 CONFIG_USB_GADGET=y
-- 
2.26.2

