Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E5401CB918
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2020 22:42:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727082AbgEHUmj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 16:42:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726904AbgEHUmi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 16:42:38 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE879C061A0C
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2020 13:42:38 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id n11so1378220pgl.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2020 13:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IBjZaeV/yVk7fuwGQGUHTk1sOmmkUmvCZN2IjQ15Yy4=;
        b=PsFyNRZMuKZdfpfsrd0aae4b6JbHEwSmclMr3HcLeNlhOtWQbRlb6IiJp/k2lFA+UR
         X4XMUnzptg8P5o5vgMebZ3+Nlpn1dKNHezr2ZHi9AcDe8QGes9d0yOkec/PHIeSDyNSR
         0ybB+26ijXpU45trQLQUdK5MLoS1/53E7dpawNdk8cepX/vKfrD6KdWLzmEiuWjUnTO/
         QkPngZnESCHPqKy/QLkcvNSMCKWmHpRtrOw2Vzw25KKr4da8gF+48LVvqB+ARkgVJb4R
         H5e/wXuUQhSHxqtbqIB0ZVE28bVBaeI6CBdMPKs2iD0w0NMta4k+tz+Ly3U/zkNDCQ4d
         bgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IBjZaeV/yVk7fuwGQGUHTk1sOmmkUmvCZN2IjQ15Yy4=;
        b=GXL+5mM17m6j3tzXnkr/8cqnFK17Ee9JArh+CrvGQUKEoDsnRG0JrPQ4OeNJDnuW8E
         Xv0K1QBwfdO98EyTk8HB9vApIgz08jaYkI2gDF1Xy6e9qTNjK4M67JsxX5GmD1HfY5nx
         gCrTIItEJcTVrMX/rNS4skqmlL+hVTk4f0xYvHBOktHuOA0uEF0vgFB9rdp0HnNexpBf
         VSU2VXylhPjswhxlqPOEO8gf3KEZ2RqrflR20KdUGLGt7Vw3D7oY3Tq5T2QDfgUO7P2m
         D2gv0J/LNCNENnPMsKSG48FO4i3Xt48IOyD9mJrgk/TcDWn2IsFaLq+EQdT5uFrRb3Kp
         WA2A==
X-Gm-Message-State: AGi0PuaGJW8JKCDccT+E+oWcf/7lfPGFbfyoWFXnY/nbOdGY5KjnNkG4
        BDLjDczsPCeqIrD/z13EacH5SQ==
X-Google-Smtp-Source: APiQypKvfsoPkqUFTHLiIaxJOs+z8dFE5Fs3OqOcqMbFROZ9Urm0vgvAP2XbKX/7Bkz5oyGlbvhDmA==
X-Received: by 2002:a63:7801:: with SMTP id t1mr3415934pgc.192.1588970557422;
        Fri, 08 May 2020 13:42:37 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
        by smtp.gmail.com with ESMTPSA id h191sm2670720pfe.44.2020.05.08.13.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 13:42:36 -0700 (PDT)
From:   Sumit Semwal <sumit.semwal@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org
Cc:     nishakumari@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org, rnayak@codeaurora.org,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [v2 0/4] Qualcomm labibb regulator driver 
Date:   Sat,  9 May 2020 02:11:56 +0530
Message-Id: <20200508204200.13481-1-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds a driver for LAB/IBB regulators found on some Qualcomm SoCs.
These regulators provide positive and/or negative boost power supplies
for LCD/LED display panels connected to the SoC.

This series adds the support for pmi8998 PMIC found in SDM845 family of SoCs.

Changes from v1:
- Incorporated review comments from v1
- Changed from virtual-regulator based handling to individual regulator based
  handling.
- Reworked the core to merge most of enable/disable functions, combine the
  regulator_ops into one and allow for future variations.
- is_enabled() is now _really_ is_enabled()
- Simplified the SC interrupt handling - use regmap_read_poll_timeout,
  REGULATOR_EVENT_OVER_CURRENT handling and notification to clients.

Nisha Kumari (4):
  dt-bindings: regulator: Add labibb regulator
  arm64: dts: qcom: pmi8998: Add nodes for LAB and IBB regulators
  regulator: qcom: Add labibb driver
  regulator: qcom: labibb: Add SC interrupt handling

 .../regulator/qcom-labibb-regulator.txt       |  47 +++
 arch/arm64/boot/dts/qcom/pmi8998.dtsi         |  16 +
 drivers/regulator/Kconfig                     |  10 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/qcom-labibb-regulator.c     | 385 ++++++++++++++++++
 5 files changed, 459 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.txt
 create mode 100644 drivers/regulator/qcom-labibb-regulator.c

-- 
2.26.2

