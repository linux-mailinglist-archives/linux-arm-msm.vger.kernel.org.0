Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1B665A9013
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Sep 2022 09:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233884AbiIAHZp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Sep 2022 03:25:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233912AbiIAHZW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Sep 2022 03:25:22 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 462B87B2A0;
        Thu,  1 Sep 2022 00:24:21 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id n17so21097591wrm.4;
        Thu, 01 Sep 2022 00:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=FfDq+PL0HtRMJmQ7okExKVvxgDYmDgwtpUcBQc3oIdc=;
        b=bXlqRLe1E2Ri+ZgnM7Xyu+Hy5OJgCUvv+Uo+hUtAcJcFSsFedxcuMYuRsN4DMm8lcZ
         yevxLBeAh9DU3xxOnJkQS3mqZI0qtynVV2//T7b5y0Ud6lznMb3cE1ZDZwBy9GWmb0sc
         m9dOUyQiYNsbX2HZR23M06EhsRI6/FKY2HQMjakjYKmiZ3Po6w3Ep6KIaCfdWyM7YOOQ
         0x4eXvXbUXCDEPHcGKcZWBdzf0eYd2DZ5HjQMA48of1psvUeRgsd+0l7fbGF/wHg1w7k
         T3aHAAw9lEe/Ck5ElgXFg+UZmSegplsR7zSehPG1QyHR91P6y5Uf+oQrjzfcNu5OvTyi
         04Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=FfDq+PL0HtRMJmQ7okExKVvxgDYmDgwtpUcBQc3oIdc=;
        b=ezETe31KrHg8CQRtD8rB61Zt7MZfrDx4wNnIvtTzwW4k1WiJK1J7ID0sxzOHOPCB/J
         tOjpqlNjePO4yGuuJPIvqBZvs3y+7vStfS2LgjBbUpa1MMNCL+5W0nuukM5YGpGu8krJ
         ObryU7l1AEPYqmSRKdM7xhz2XFtPvoFW/iMx2yd7XV9dgenjsaUTjQ9zckc102yniFe3
         Amc//dReJhoeuuQ1pB/SEvLYumcqw9djGF+PqdJDHO1ZY+GJNnt8IEXnTxqXW0I5Z118
         MmTKSyPeCeBwkkF/dl+YK1HLxdvY57eOCxbD0xnjf7+ZEcYEoAIA+dY9dyfgnZIN0jaB
         bdXA==
X-Gm-Message-State: ACgBeo1v3ZJqPTeeU7w/BEgMS9mqyMcAmnFWpEmU6XG8sqvE4qzTFbfi
        WvKs7ZC7e758VOkbdRur0Bs=
X-Google-Smtp-Source: AA6agR7WfQv3I+P4MP70H/mo05rtkX2lnDyDz5fH0loGvP9O/eRysAGJ13X+SDiEm+TfmAs097o3rg==
X-Received: by 2002:a5d:6d0e:0:b0:21e:fc95:3dfc with SMTP id e14-20020a5d6d0e000000b0021efc953dfcmr13966439wrq.112.1662017059763;
        Thu, 01 Sep 2022 00:24:19 -0700 (PDT)
Received: from localhost (87-126-55-15.ip.btc-net.bg. [87.126.55.15])
        by smtp.gmail.com with ESMTPSA id l14-20020adfe58e000000b0022377df817fsm13709308wrm.58.2022.09.01.00.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 00:24:18 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH 00/14] Add support for sm6115,4250 and OnePlus Nord N100
Date:   Thu,  1 Sep 2022 10:23:59 +0300
Message-Id: <20220901072414.1923075-1-iskren.chernev@gmail.com>
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

This series adds support for sm6115 (clocks, pinctrl, usb, ufs, sdhc),
sm4250 (mostly empty shell on top of sm6115) and finally basic OnePlus Nord
N100 (codename billie2), including the above mentiond items plus simple
framebuffer.

Please note that this series depends on [1] (driver compat and bindings).

[1] https://lore.kernel.org/linux-devicetree/20220815100952.23795-1-a39.skl@gmail.com/

Iskren Chernev (14):
  arm64: dts: qcom: sm6115: Add basic soc dtsi
  arm64: dts: qcom: sm6115: Add rpmcc and rpmpd nodes
  arm64: dts: qcom: sm6115: Add GCC node
  arm64: dts: qcom: sm6115: Add pinctrl node
  arm64: dts: qcom: sm6115: Add apps smmu node
  arm64: dts: qcom: sm6115: Add usb and related phy nodes
  arm64: dts: qcom: sm6115: Add sdhci nodes and related pinctrl
  dt-bindings: ufs: qcom: Add sm6115 binding
  arm64: dts: qcom: sm6115: Add UFS nodes
  arm64: dts: qcom: sm6115: Add SPMI bus node
  dt-bindings: arm: cpus: Add kryo240 compatible
  arm64: dts: qcom: sm4250: Add soc dtsi
  dt-bindings: arm: qcom: Add compatible for oneplus,billie2 phone
  arm64: dts: qcom: sm4250: Add support for oneplus-billie2

 .../devicetree/bindings/arm/cpus.yaml         |   1 +
 .../devicetree/bindings/arm/qcom.yaml         |   7 +
 .../devicetree/bindings/ufs/qcom,ufs.yaml     |  26 +
 .../boot/dts/qcom/sm4250-oneplus-billie2.dts  | 240 +++++
 arch/arm64/boot/dts/qcom/sm4250.dtsi          |  38 +
 arch/arm64/boot/dts/qcom/sm6115.dtsi          | 919 ++++++++++++++++++
 6 files changed, 1231 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm4250.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115.dtsi

--
2.37.2

