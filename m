Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0A315B46AF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Sep 2022 16:32:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbiIJOcQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Sep 2022 10:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbiIJOcP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Sep 2022 10:32:15 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7BCF3BC72;
        Sat, 10 Sep 2022 07:32:13 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id i203-20020a1c3bd4000000b003b3df9a5ecbso2344640wma.1;
        Sat, 10 Sep 2022 07:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=QDNuJYzL/VhMdJ5vK4I9kC932Hs8rjQfwYKlPo/J23I=;
        b=DLRDfD6DMxEq6IhkKp/cXYLikMX+Crv9liN035gNEl1vfwqqjI5XpTsNvklQOnLVII
         B5ORs78iiQa36BE1Jv/oZ56qFK1KOCa6wybCpcwdD4CILuIl8bsY/ZsUL45vlTYp0H+g
         k5DPPrLeoKl/cOXRrNA4aCuWbUwNhzBvhOd/WacvZx0Z4Rz4KVSN6xGL/07UDf915r4q
         53h0CauAyfNc7aoZ8nh8Ld3p+W5+mYN9E6vrXK8iX7rTpkP3/c2Gng/ZfF2p1bnY2l5E
         BtZJdHGt/zb1wJIfCnEaz1RmFyD6h7rlVCSGDXzYHSVbwk6zxZP7Xz8vqcQMZBWM8usQ
         EwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=QDNuJYzL/VhMdJ5vK4I9kC932Hs8rjQfwYKlPo/J23I=;
        b=Pvp6BgQ+Dgl9vbNfJzfOuX18RfmRaZv3ls1+wiOg7twqVtnzLBnsxmnPlEpITckiL8
         fH9LUj/Qjnp6J50oRWxHT+qwRoA7WIpi00r2HBiYNgHYRZrHBRIQ7jZfY7TxRVBAWFwv
         z7pmAd17MBKeDpOJYe2FlsZSOZYyMGimLWGcAQEXNSTO6Rf/X6rncgyXkK9mKY2QJrSl
         tTs6ZniQCZ2qxO0uAri3GuvoNuPtmnJw+XiU4lFbHNncHL8DlxMbLx7CeoOzyWABPAxR
         eQtOGpONuNKru8JO1o0Uud0ZtBp3/g8NXUY3ELpQ7WPwwJdh5i960I5+DmhTJ8vw+XCa
         vM/w==
X-Gm-Message-State: ACgBeo06KV1okUR1yZHQqg43QXJbTeCg8Dz+lFU6CpbOS86mOCvtTXTf
        hlwz8MXOT0Lv0/AV4APgdUo=
X-Google-Smtp-Source: AA6agR5hcmS10jAeK44BMM8W3qdeX0C4lAGHuYzM+mgI+s7DsqVOUd8oczlkiO9NvpI6THNVYf47Hg==
X-Received: by 2002:a05:600c:1d9a:b0:3a6:248:1440 with SMTP id p26-20020a05600c1d9a00b003a602481440mr8935687wms.196.1662820332154;
        Sat, 10 Sep 2022 07:32:12 -0700 (PDT)
Received: from localhost ([77.78.20.135])
        by smtp.gmail.com with ESMTPSA id e19-20020a05600c4e5300b003a62bc1735asm4052743wmq.9.2022.09.10.07.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Sep 2022 07:32:11 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v3 0/9] Add support for sm6115,4250 and OnePlus Nord N100
Date:   Sat, 10 Sep 2022 17:32:04 +0300
Message-Id: <20220910143213.477261-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes from v2
---------------
v2: https://lore.kernel.org/all/20220903174150.3566935-1-iskren.chernev@gmail.com/
- fix ufs bindings to follow sdm845
- drop nvmem, firmware, reserved-range patches (merged)
- add patch that fixes sm6115-dwc3 bindings (4/9)
- add patch that fixes qcom,sm6115-sdhci bindings (5/9)
- add patch that fixes qcom,sm6115-qmp-ufs-phy bindings (6/9)
- drop dynamic reserved memory regions
- drop clock-output-names
- drop frequency for timer
- fix mmc pinctrl regression in v2
- move board clock freqs in relative scope
- fix indentation to please Konrad
- reorder some DT props (reg, status, compatible)

Changes from v1
---------------
v1: https://lore.kernel.org/all/20220901072414.1923075-1-iskren.chernev@gmail.com/
- merge dtsi patches in one
- fix ufs binding (allow ice register)
- fix dt schema issues (to the best of my ability)
- add a few necessary bindings (compats)
- some comments on remaining schema issues after commit msg (patch 7 and 9)

This series adds support for sm6115 (clocks, pinctrl, usb, ufs, sdhc),
sm4250 (mostly empty shell on top of sm6115) and finally basic OnePlus Nord
N100 (codename billie2), including the above mentiond items plus simple
framebuffer.

Please note that this series depends on [1] (driver compat and bindings).

[1] https://lore.kernel.org/linux-devicetree/20220815100952.23795-1-a39.skl@gmail.com/

Iskren Chernev (9):
  dt-bindings: ufs: qcom: Add sm6115 binding
  dt-bindings: arm: cpus: Add kryo240 compatible
  dt-bindings: arm: qcom: Add compatible for oneplus,billie2 phone
  dt-bindings: usb: qcom,dwc3: Fix SM6115 clocks, irqs
  dt-bindings: mmc: sdhci-msm: Add pinctrl-1 property
  dt-bindings: phy: qcom,qmp-ufs: Fix SM6115 clocks, regs
  arm64: dts: qcom: sm6115: Add basic soc dtsi
  arm64: dts: qcom: sm4250: Add soc dtsi
  arm64: dts: qcom: sm4250: Add support for oneplus-billie2

 .../devicetree/bindings/arm/cpus.yaml         |   1 +
 .../devicetree/bindings/arm/qcom.yaml         |   7 +
 .../devicetree/bindings/mmc/sdhci-msm.yaml    |   4 +
 .../bindings/phy/qcom,qmp-ufs-phy.yaml        |   3 +-
 .../devicetree/bindings/ufs/qcom,ufs.yaml     |  26 +
 .../devicetree/bindings/usb/qcom,dwc3.yaml    |   3 +-
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm4250-oneplus-billie2.dts  | 241 +++++
 arch/arm64/boot/dts/qcom/sm4250.dtsi          |  38 +
 arch/arm64/boot/dts/qcom/sm6115.dtsi          | 857 ++++++++++++++++++
 10 files changed, 1179 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm4250.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115.dtsi

-- 
2.37.2

