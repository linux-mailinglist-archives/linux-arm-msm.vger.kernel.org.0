Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 673855BD45C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Sep 2022 20:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbiISSGZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Sep 2022 14:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbiISSGY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Sep 2022 14:06:24 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A79ED15A23;
        Mon, 19 Sep 2022 11:06:23 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id y5so405713wrh.3;
        Mon, 19 Sep 2022 11:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=7jihIiaBT+4eVAtt7lUA3yaTnP2sDVJK222LxN7wuzE=;
        b=FNM0Ro84Qj42lPr5dut4lchqVhmXH4Nemvag6gE1NIcE2rPnyXLq/PzyoYfqwgyxLD
         e/mtbaOe8tPXdNYSGvZR0AhMMrFbBVISVFqPtopTG/P0LXfbWDakLb1pMDm99G5a8fqJ
         yg5e+QDSQ64XJcjF3WJajs9fwgRxYrySQX2iZj1wAKsvhgQdCOVs6aYH3IoeaoqJD973
         WHIsi7DvTPFzuWxLsfoYiU2tilzeUx9cienPGrR9+yyjpmpkx283zAv1iqLT1LyiqUKi
         5bghA2tgrm2FtM9m1LEwvomWRruO/a8LiwCk/XPx6xp33MINOaTTqjIQFG310MysAg5l
         yAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=7jihIiaBT+4eVAtt7lUA3yaTnP2sDVJK222LxN7wuzE=;
        b=OhJUUo+5I1cg8EBtN//bQwQ+3C4GUF26Io9eF4FV+zf2Q8fz7KbU8BveTIDlD+2uJF
         k2DNfhH5TAcsErzM7y0g1vSTQb3uzQ7zexIegmOxmaG2JgYMZkYkTQsn5H1q9KQAnayH
         ZUVswUhT1TMDS+REuX9BFkiohzqXRVCwQsNDdqanMjlscExKiYOo1ElFBTfK0dx/WQYZ
         tZYVCWS86M0tY8w/kpxX5KxXFoHDqpiSXZI12L1cdoZbwv2SxkAtuynGllVjLILpZB9h
         xyZK4CDLS3Yx22hUdSwvSYLIp+JdZ9fOeAWb/avpK+1qQ5Ds3FQ0M0hKKjhvj9baDN0h
         4L2w==
X-Gm-Message-State: ACrzQf2uJr9+yO2Osk584D8F6/X4lN108u6hZseztFtCZ5+3O8bH84lE
        bwx2ngWolVmLgsfS5qmD2Xw=
X-Google-Smtp-Source: AMsMyM6bjc4436Z4BcJXnYoMvkId8rriOucNeSAUg7WnbLrgZYR6XivIAom/YIbaYFvmkQUSG0BBxA==
X-Received: by 2002:adf:fb88:0:b0:22a:f742:af59 with SMTP id a8-20020adffb88000000b0022af742af59mr5738678wrr.230.1663610782102;
        Mon, 19 Sep 2022 11:06:22 -0700 (PDT)
Received: from localhost ([77.78.20.135])
        by smtp.gmail.com with ESMTPSA id x12-20020a05600c2d0c00b003b47575d304sm17697566wmf.32.2022.09.19.11.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 11:06:21 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v4 0/8] Add support for sm6115,4250 and OnePlus Nord N100
Date:   Mon, 19 Sep 2022 21:06:10 +0300
Message-Id: <20220919180618.1840194-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes from v3
---------------
v3: https://lore.kernel.org/linux-arm-msm/20220910143213.477261-1-iskren.chernev@gmail.com/
- move qcom,smem to reserved-memory region
- change soc to soc@0
- pad reg addresses to 8 digits
- align pinctrl with latest linux-next
- rename usb labels to align with existing socs
- use named masks for armv8-timer
- order billie2 overrides by label name
- dual license dts(i) files
- dropped merged patches

NOTE: Not done as suggested:
- armv8-timer: I used GIC_CPU_MASK_SIMPLE(4) instead of GIC_CPU_MASK_SIMPLE(8),
  which would have changed the hardcoded mask
- I haven't changed the default state of regulators - there seems to be no
  clear way to do that across the board

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

Iskren Chernev (8):
  dt-bindings: ufs: qcom: Add sm6115 binding
  dt-bindings: arm: cpus: Add kryo240 compatible
  dt-bindings: arm: qcom: Add compatible for oneplus,billie2 phone
  dt-bindings: usb: qcom,dwc3: Fix SM6115 clocks, irqs
  dt-bindings: phy: qcom,qmp-ufs: Fix SM6115 clocks, regs
  arm64: dts: qcom: sm6115: Add basic soc dtsi
  arm64: dts: qcom: sm4250: Add soc dtsi
  arm64: dts: qcom: sm4250: Add support for oneplus-billie2

 .../devicetree/bindings/arm/cpus.yaml         |   1 +
 .../devicetree/bindings/arm/qcom.yaml         |   7 +
 .../bindings/phy/qcom,qmp-ufs-phy.yaml        |   3 +-
 .../devicetree/bindings/ufs/qcom,ufs.yaml     |  26 +
 .../devicetree/bindings/usb/qcom,dwc3.yaml    |   3 +-
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm4250-oneplus-billie2.dts  | 241 +++++
 arch/arm64/boot/dts/qcom/sm4250.dtsi          |  38 +
 arch/arm64/boot/dts/qcom/sm6115.dtsi          | 854 ++++++++++++++++++
 9 files changed, 1172 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm4250.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115.dtsi

-- 
2.37.3

