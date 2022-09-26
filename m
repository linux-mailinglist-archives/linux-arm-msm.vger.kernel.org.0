Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29E9D5EB0B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 21:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231249AbiIZTCP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 15:02:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbiIZTCI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 15:02:08 -0400
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B9FD86FE6
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 12:02:06 -0700 (PDT)
Received: from localhost.localdomain (94-209-172-39.cable.dynamic.v4.ziggo.nl [94.209.172.39])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 3B9EA3F434;
        Mon, 26 Sep 2022 21:02:00 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] Add Qcom PM6125 PMIC and use in Sony Xperia Seine PDX201
Date:   Mon, 26 Sep 2022 21:01:43 +0200
Message-Id: <20220926190148.283805-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds initial support for the PM6125 PMIC, and its power key
handling and thermal monitoring capabilities are configured for Sony's
PDX201 (Xperia 10II).

One patch for pm660 is included to fix a node address mismatch with its
reg field.

Changes since v3:
- Rebased on next-20220923 to fix (diff-context) conflicts with:
  - https://lore.kernel.org/all/20220902111055.106814-1-luca.weiss@fairphone.com/
  - https://lore.kernel.org/all/20220912061746.6311-35-krzysztof.kozlowski@linaro.org/

v3: https://lore.kernel.org/linux-arm-msm/20220919204826.215845-1-marijn.suijten@somainline.org/T/#t

Changes since v2:
- Rebased on v6.0-rc6 to drop dependent DT patches;
- Dropped iio patch which has already been picked into Jonathan's tree;
- Added qcom,pm6125 compatible in new yaml-ified SPMI-PMIC dt-bindings.

v2: https://lore.kernel.org/linux-arm-msm/20220805135729.1037079-1-marijn.suijten@somainline.org/T/#u

Changes since v1:
- Dropped both pinctrl patches that have already been applied;
- Add -us suffix to qcom,hw-settle-time properties on ADC TM5 nodes
  (this suffix is not present on regular ADC5/VADC nodes);
- Add -state suffix to pm6125_gpio pinctrl nodes;
- Use PMIC_GPIO_FUNC_NORMAL instead of the string-literal "normal";
- Removed #address-cells and #size-cells from empty pmic@1 node;
- Removed ADC5_AMUX_THM3 / ADC5_GPIO2_100K_PU channels from the ADC5
  patch, these are unused on my board and hence untested.

v1: https://lore.kernel.org/phone-devel/20220511220613.1015472-1-marijn.suijten@somainline.org/T/#u

Marijn Suijten (5):
  dt-bindings: mfd: qcom-spmi-pmic: Add pm6125 compatible
  arm64: dts: qcom: pm660: Use unique ADC5_VCOIN address in node name
  arm64: dts: qcom: Add PM6125 PMIC
  arm64: dts: qcom: sm6125-seine: Include PM6125 and configure PON
  arm64: dts: qcom: sm6125-seine: Configure additional trinket
    thermistors

 .../bindings/mfd/qcom,spmi-pmic.yaml          |   1 +
 arch/arm64/boot/dts/qcom/pm6125.dtsi          | 154 +++++++++++++++++
 arch/arm64/boot/dts/qcom/pm660.dtsi           |   2 +-
 .../qcom/sm6125-sony-xperia-seine-pdx201.dts  | 162 +++++++++++++++++-
 4 files changed, 317 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/pm6125.dtsi

--
2.37.3

