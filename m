Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD2E789C51
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 10:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbjH0ItU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Aug 2023 04:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbjH0ItB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Aug 2023 04:49:01 -0400
Received: from smtprelay02.ispgateway.de (smtprelay02.ispgateway.de [80.67.18.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C61BAF;
        Sun, 27 Aug 2023 01:48:54 -0700 (PDT)
Received: from [77.64.243.219] (helo=note-book.lan)
        by smtprelay02.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <git@apitzsch.eu>)
        id 1qaBRz-0000Bt-QE; Sun, 27 Aug 2023 10:48:51 +0200
From:   =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Subject: [PATCH v4 0/2] arm64: dts: qcom: msm8939-longcheer-l9100: Add
 initial dts
Date:   Sun, 27 Aug 2023 10:47:58 +0200
Message-Id: <20230827-bq_m5-v4-0-f8435fb8f955@apitzsch.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAL4N62QC/2XMQQ6CMBCF4auQrq0pU8hQV97DGFPKIF0I2GKjE
 u5uISFBXb7JfP/IPDlLnh2SkTkK1tuujSPbJcw0ur0St1XcDARIgZDx8n655bw0StcksaiLisX
 f3lFtn0vndI67sX7o3GvJhnS+/hZCygVPUYsChUZZ0lH3dnh70+zpweZGgK3LVwfRKURlIFOay
 vTfya3D1cnoqjonADSoKvHtpmn6AAgywUsMAQAA
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.3
X-Df-Sender: YW5kcmVAYXBpdHpzY2guZXU=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,T_SPF_TEMPERROR autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This dts adds support for BQ Aquaris M5 (Longcheer L9100) released in
2015.

Add a device tree with initial support for:

- GPIO keys
- Hall sensor
- SDHCI
- WCNSS (BT/WIFI)
- Accelerometer/Magnetometer
- Vibrator
- Touchscreen
- Front flash

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
Changes in v4:
- replace "interrupt-parent" and "interrupts" by "interrupts-extended"
- add R-b to second patch
- Link to v3: https://lore.kernel.org/r/20230727-bq_m5-v3-0-df5e227c79d0@apitzsch.eu

Changes in v3:
- use "id-gpios" instead of "id-gpio" to avoid conflicts with
  https://lore.kernel.org/linux-arm-msm/20230724103914.1779027-7-alexander.stein@ew.tq-group.com/
  (v2 only contained the changelog entry, but not the actual change) 
- Link to v2: https://lore.kernel.org/r/20230725-bq_m5-v2-0-9779c249aeb1@apitzsch.eu

Changes in v2:
- add R-b to first patch
- sort node extends/overrides by name, but keep &tlmm last, as done in
  msm8939-samsung-a7.dts
- use id-gpios, to avoid conflict with
  https://lore.kernel.org/linux-arm-msm/20230724103914.1779027-7-alexander.stein@ew.tq-group.com/
- don't enable mdss for now; postpone it till display support is added
- Link to v1: https://lore.kernel.org/r/20230724-bq_m5-v1-0-17a0870a73be@apitzsch.eu

---
André Apitzsch (2):
      dt-bindings: arm: qcom: Add BQ Aquaris M5
      arm64: dts: qcom: msm8939-longcheer-l9100: Add initial device tree

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      | 334 +++++++++++++++++++++
 3 files changed, 336 insertions(+)
---
base-commit: 6269320850097903b30be8f07a5c61d9f7592393
change-id: 20230724-bq_m5-bc9afe378f8d

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>

