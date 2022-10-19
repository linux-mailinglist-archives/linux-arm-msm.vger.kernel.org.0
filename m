Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3C5060442E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Oct 2022 13:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232261AbiJSL7u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Oct 2022 07:59:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232587AbiJSL7M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Oct 2022 07:59:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDDBFD01B5;
        Wed, 19 Oct 2022 04:37:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A663D60A75;
        Wed, 19 Oct 2022 11:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02470C433D7;
        Wed, 19 Oct 2022 11:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666179379;
        bh=ZDAOuS5C83+/fdYkNIXCq0jaPLmGbIho2viLplRjK9k=;
        h=From:To:Cc:Subject:Date:From;
        b=flZ91CiFKOgKglnEEhgvI/txXQb40ugXF5bzIK6bynUXQf1fSQwoa0o01sfG5Ohnr
         6eIfHfT9uxrZ+Ih9a8z3R233u8omPklWoEMl0PSBL9sABbOV8ayE4PG7EsNWtOFdxD
         poMyPGgZd99+dHy8rLlLe0nhj3Rs2svSjwfmH2zY9TedX+GOiD82JFsrpMDi9XE+h/
         PTLGfZiK1YFVUGJsGHNG6XeeQB5S1hdDRn+oJ1sso5m0cmuNs1YSV8dRt5ggcigPFw
         12jRi0u4oZAVb53vK0/t8/K+BhA0HayRcogHQbiD/Qm8qA9yW6zoJH41hWX792LyGd
         JCI90Ul041TAw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan+linaro@kernel.org>)
        id 1ol7Ml-0005pE-60; Wed, 19 Oct 2022 13:36:07 +0200
From:   Johan Hovold <johan+linaro@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 00/15] phy: qcom-qmp-pcie: add support for sc8280xp
Date:   Wed, 19 Oct 2022 13:35:37 +0200
Message-Id: <20221019113552.22353-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds support for the PCIe PHYs on SC8280XP including its
four-lane PHYs.

The first half of the series clean up the driver in preparation for
supporting SC8280XP and its new devicetree bindings that drops the
legacy child node and the (incomplete) description of register
subregions.

The other QMP bindings suffer from similar problems and follow-on series
will do corresponding changes to the UFS, USB and combo QMP bindings and
drivers.

Note that these patches depend on the linux-phy next branch of today and
the following two series:

 1. [PATCH v2 00/14] phy: qcom-qmp: further prep cleanups

    https://lore.kernel.org/lkml/20221012081241.18273-1-johan+linaro@kernel.org

 2. [PATCH 00/20] phy: qcom-qmp: further prep fixes and cleanups (set 3)

    https://lore.kernel.org/lkml/20221012084846.24003-1-johan+linaro@kernel.org

Johan


Changes in v2
 - rename current DT schema after first SoC added to the original
   bindings (IPQ8074) and add a reference to the new SC8280XP bindings
   instead of marking the current bindings as "legacy" (Krzysztof)

 - add "sc8280xp" infix to the new DT schema filename (Krzysztof)

 - tighten description of the 'qcom,4ln-config-sel' phandle array
   (Krzysztof)


Johan Hovold (15):
  phy: qcom-qmp-pcie: sort device-id table
  phy: qcom-qmp-pcie: move device-id table
  phy: qcom-qmp-pcie: merge driver data
  phy: qcom-qmp-pcie: clean up device-tree parsing
  phy: qcom-qmp-pcie: clean up probe initialisation
  phy: qcom-qmp-pcie: rename PHY ops structure
  phy: qcom-qmp-pcie: clean up PHY lane init
  phy: qcom-qmp-pcie: add register init helper
  dt-bindings: phy: qcom,qmp-pcie: rename current bindings
  dt-bindings: phy: qcom,qmp-pcie: add sc8280xp bindings
  phy: qcom-qmp-pcie: restructure PHY creation
  phy: qcom-qmp-pcie: fix initialisation reset
  phy: qcom-qmp-pcie: add support for pipediv2 clock
  phy: qcom-qmp-pcie: add support for sc8280xp
  phy: qcom-qmp-pcie: add support for sc8280xp 4-lane PHYs

 ...hy.yaml => qcom,ipq8074-qmp-pcie-phy.yaml} |   7 +-
 .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       | 165 ++++
 drivers/phy/qualcomm/Kconfig                  |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 853 ++++++++++++------
 .../phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5.h   |   2 +
 5 files changed, 774 insertions(+), 254 deletions(-)
 rename Documentation/devicetree/bindings/phy/{qcom,qmp-pcie-phy.yaml => qcom,ipq8074-qmp-pcie-phy.yaml} (96%)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml

-- 
2.37.3

