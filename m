Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78B0D1A6A20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 18:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731715AbgDMQpC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 12:45:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731652AbgDMQpA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 12:45:00 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5942CC0A3BDC;
        Mon, 13 Apr 2020 09:45:00 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id l14so2405912ljj.5;
        Mon, 13 Apr 2020 09:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zfG62zcpiV13tvGYAxxYuWs3RV9RU5HlKcZKPVR46ns=;
        b=qf9+EI92bcA5XY1SuzrhlGerPxNkVxijynrkyzDdM7NcY+GL/k7rCbDPeqEjMMwi4a
         nNkeaGj4//z1ZcrxTizExz26chnhy/ILnNYVy9ev782Hm89xggwuZH4M+OSN8JGJOetq
         cCqBIwYSuS9lMQxo/EkCnO/LDss1lfsxOhAgzZERDD6+3ZIa102umGMyMuzLGFtSCTBP
         JBD+gMHmyvfZu+9R6wvoxDfqntq+60D+CxUvNJ+GtVuTb8zhiqIgbZjOnniQvQnHlK3P
         YZVcpGsBG1FW7bmg07ANIB7FuPpicq+SO8qK342WAL2VDHNQztxW8+O9SExABPxiSONL
         kT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zfG62zcpiV13tvGYAxxYuWs3RV9RU5HlKcZKPVR46ns=;
        b=aZ4bhmwcEyQkYO6N87DGTxyh6UEPowXA3OgURGO5f/0r5WAcR5qFmj3mKGkefpn9Va
         P/dA9AlNYqPGeZ8Os3l1vNFBCiRgwu9u0O6vk3zlkq+4uP5BV5+xYH4xJMm/Fidq5u7Q
         hcVPfqfHKeH4gxQH75RbgNbCQt+gjmbzYafl1JJHKM5GgDLf2Oxh43mg4eO92vFznTSK
         BE/jn1CVfMzfav5U3IZgwxKoWur2T6EmTLvbhkrCYH7U7OPF8oAZL3fZ6Gfs0nETkiGv
         4vp40Jww/k88S7QN5DCtpVnSuT8IG1oTiO8lO4PBe3tIBaJtEM0pevoPhdeWVBIeotOY
         dY7g==
X-Gm-Message-State: AGi0PuZqKtxqw3+T8eNvtkpNi1Va0rNYo374c3Tq5W4Q3ZjSaY8YIQSD
        0Dd+TYak3FiMGQemBHD8PeRrWu33SAAGBw==
X-Google-Smtp-Source: APiQypL5thoDq6pWgnkhIVne/nBCh0GH00l1i75sFnWHdvhBcjXz57fRoqqJYnxbr3mZ6avk/7aTug==
X-Received: by 2002:a2e:8793:: with SMTP id n19mr3807878lji.46.1586796298473;
        Mon, 13 Apr 2020 09:44:58 -0700 (PDT)
Received: from localhost ([213.191.183.145])
        by smtp.gmail.com with ESMTPSA id l18sm1170388lje.19.2020.04.13.09.44.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2020 09:44:57 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH 0/3] regulator: max77826: Add MAX77826 support
Date:   Mon, 13 Apr 2020 19:44:37 +0300
Message-Id: <20200413164440.1138178-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MAX77826 is a PMIC found on the Samsung Galaxy S5 (klte) and possibly other
devices. It is produced by Maxim Integrated and contains 15 LDOs a buck and
a buck boost regulator.

Iskren Chernev (3):
  regulator: max77826: Add max77826 regulator driver
  dt-bindings: regulator: Add document bindings for max77826
  ARM: dts: qcom: msm8974-klte: Add max77826 pmic node

 .../bindings/regulator/maxim,max77826.yaml    |  70 ++++
 .../boot/dts/qcom-msm8974-samsung-klte.dts    | 110 +++++++
 arch/arm/boot/dts/qcom-msm8974.dtsi           |  11 +
 drivers/regulator/Kconfig                     |  10 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/max77826-regulator.c        | 301 ++++++++++++++++++
 6 files changed, 503 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max77826.yaml
 create mode 100644 drivers/regulator/max77826-regulator.c


base-commit: 3b2804993d1e9f2b01f4264993009d3e48722e0d
--
2.26.0

