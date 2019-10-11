Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51F2BD4B32
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2019 01:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbfJKXuj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Oct 2019 19:50:39 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35115 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbfJKXuj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Oct 2019 19:50:39 -0400
Received: by mail-pg1-f196.google.com with SMTP id p30so6659811pgl.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2019 16:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EgtZMQuv8rVlaVgRlgv5EqHSKVxfWJrgFI1xeOtDznY=;
        b=Q+ZBRH4JMLVEz3cKNEBDilBpczI3cAfNTxVUQ0GmOaaYQMrnhMpBpG/oMkEbPv6Odf
         8GGYfPNZshLNysepMYmTkT+3aNAgXugsY1CpHbIdxbtdrQQ60VUYCVdhNKtGJPZ9XNmZ
         yeC9ihKcyyHJaIzy1EL8IqBelW7q7XUwmg/Hj26mRmV0FwdkKluXBx8bn/qC4si8Txjq
         BJcMrTQsWH7JShE3N5uQdrbWPaMlnQ7E4TerYqhVVbjckQYF1dRgiIH2UwHVA4jeybRa
         ct5jnHOzbs9B/OYFzSNZbT3pquua3lDioCSE2rTR4TEhQ2ocWM1R5k2um3dsc3fczhsT
         9efQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EgtZMQuv8rVlaVgRlgv5EqHSKVxfWJrgFI1xeOtDznY=;
        b=TMmym+OVyFJMZKKdJteiDf0b8TOSYL3o23FMYGqjoNWwEqylvNbRStTqtyeTDQfMxC
         R2bwNELEf3eBUN03tlxJOdp8bwLTSWTvE6Oddf2YZAzLgQe/4bmHAYu6KHvpokib0C5Y
         2BIV9wUX7RrLoR7A625+qHAx7ZLMm5icOVpqBG7gyBl0kT5xMF86bQhEs3LHN/rdjZmu
         +DQBn4zTkbeVUEPuT0uC/g+P4fXgnUsei6S09dBN6WGxtUASCmi25FWH/o1VQ+8LX7+b
         ObJ2eQPzIYv4+Ra+1VM+oSQTegzH9nNfPxJh+lTL41MAJytPrXdLOdlGaYL9UgOkjnvk
         Pshg==
X-Gm-Message-State: APjAAAVmPIY/zZlUPsUUaZNRUytLmAMRV3DYuuJerRiACy/KT3fmczGi
        5XoWG4S/disNSJJ6u2US2LU6CQ==
X-Google-Smtp-Source: APXvYqxyTECy/5ImThDv0fD4LqF+cLTW2tgyxri1a1OulnP2BTV3jWbPhAnqE9psBlNscebeW3EiBg==
X-Received: by 2002:a63:a357:: with SMTP id v23mr19518356pgn.383.1570837838628;
        Fri, 11 Oct 2019 16:50:38 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id ce16sm8784551pjb.29.2019.10.11.16.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 16:50:38 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        Maxime Ripard <mripard@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Anson Huang <Anson.Huang@nxp.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: defconfig: Enable Qualcomm pseudo rng
Date:   Fri, 11 Oct 2019 16:50:35 -0700
Message-Id: <20191011235035.374569-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Most Qualcomm platforms contain a pseudo random number generator
hardware block. Enable the driver for this block.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a5953b0b382d..688c8f200034 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -855,6 +855,7 @@ CONFIG_NLS_ISO8859_1=y
 CONFIG_SECURITY=y
 CONFIG_CRYPTO_ECHAINIV=y
 CONFIG_CRYPTO_ANSI_CPRNG=y
+CONFIG_CRYPTO_DEV_QCOM_RNG=m
 CONFIG_DMA_CMA=y
 CONFIG_CMA_SIZE_MBYTES=32
 CONFIG_PRINTK_TIME=y
-- 
2.23.0

