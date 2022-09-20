Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7D765BE995
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 17:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231707AbiITPEo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 11:04:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231715AbiITPE2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 11:04:28 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1840E36DF1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 08:04:19 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id f14so4288086lfg.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 08:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=gQdRSNQxwQzNf3DXyF1P2dnlVIY78xWSpuJkc3W0g64=;
        b=ITmMcv4NQn7Vu0SNjzGpddalVY6rFgAD1xpCdNYIkeh3UNNOECcf2MFInm5CNyD9v/
         UC7abh9xm2IC8zmNN/qO16aDmyaUdtOG7kjKATUiW/bDy2O/jfbhBxRSfzh1b9oNKbfy
         GrvITZaPnA5kXktQXPaiikhwe31n2Em1xhIrbrDxPnQwCoHn0w9goasHhhxLqz4LEc8B
         HMi8sikHH74JeJ/HC/JMGacWyurhaGDnCVXbhZUoKvFrCowJ+edADYuNidKuGdNOVgNq
         zbqURYGi5s/tPfjcL2O7KTh/2xkKvNYwr/wdaoCoVZh29vS4mzeXLRPeY0VLgqgjMJM9
         yuQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=gQdRSNQxwQzNf3DXyF1P2dnlVIY78xWSpuJkc3W0g64=;
        b=n/EAxRJSwHmYfrXwugyiUXk/Ji45m3jtW79m8ZG658pitzceJ5MlvnBO7mNHjmXeOk
         FOWgIKxY/zILujpZMdE/ksTvcbtHoAweD3KMVt0PQrixwvQ5Cd/dGsVLTzJLKihCtywl
         fKgbiHzDVOnnGHVLdrkNHuS81bEWOa+/S+7iwF9zkx2ZRaEUcfjKOp8SRrwEOZqZSBdJ
         YGshT+1LRRjaCAh1eCykGZGP/7pVKW6J0MUj7PaFPcgb7z7vvDZ5041H+i/LpliLXOeH
         bmkkMd7stp2G8MfN+2IgCbOgy82xjDGzmZWyFqUDP/G8fYyEx0kLfrOS3ChMmeYpiL1j
         kPgw==
X-Gm-Message-State: ACrzQf0FptFRMxWcwCtS94+mMg/NzEPoucJ72tyCxvNXUUXg6bMHF1oC
        e9oxwisQ03mRjG5MYGvgHqONBw==
X-Google-Smtp-Source: AMsMyM4+inLy8p+HJihp/Z4fwninRn5qLr4cFVk6PAP/loU5b4N5BhmIKHZXNVWihGnCLjL14CVhVQ==
X-Received: by 2002:a05:6512:3f14:b0:47d:e011:f19b with SMTP id y20-20020a0565123f1400b0047de011f19bmr8015508lfa.427.1663686257685;
        Tue, 20 Sep 2022 08:04:17 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p10-20020ac246ca000000b0049f54a976e3sm8294lfo.58.2022.09.20.08.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 08:04:17 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 0/3] ARM/hwlock: qcom: switch TCSR mutex to MMIO (msm8974)
Date:   Tue, 20 Sep 2022 17:04:11 +0200
Message-Id: <20220920150414.637634-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Remaining patches from v3:
https://lore.kernel.org/all/20220909092035.223915-1-krzysztof.kozlowski@linaro.org/

Not tested on hardware. Please kindly provide tests.

Changes since v3
================
1. Drop applied patches - remaining is only msm8974.
2. Add syscon to TCSR mutex regs, after talk with Bjorn.
3. New patch: bindings.

Changes since v2
================
1. Rebase on current MFD changes.
2. Add Rb tag.
3. Split MFD patch to separate patchset:
https://lore.kernel.org/linux-devicetree/20220909091056.128949-1-krzysztof.kozlowski@linaro.org/T/#u

Changes since v1
================
1. Use existing qcom,tcsr-msm8974 compatible.
2. Fix few other TCSR syscon compatibles (new patches: ipq6018, msm8953,
   qcs404, msm8996).
3. New patch: dt-bindings: mfd: qcom,tcsr: drop simple-mfd from IPQ6018
4. New patch: dt-bindings: mfd: qcom,tcsr: add QCS404

Dependencies
============
1. DT bindings and driver patches can go via hwlock. DTS via Bjorn/Qualcomm.

2. The last five DTS commits (ARM and arm64) named "switch TCSR mutex to MMIO"
   depend on driver support. The changes are not bisectable, just like
   previously such changes were not bisectable:
   https://lore.kernel.org/all/20200622075956.171058-5-bjorn.andersson@linaro.org/
   Therefore these changes could wait for next release.

Best regards,
Krzysztof

Krzysztof Kozlowski (3):
  dt-bindings: hwlock: qcom-hwspinlock: add syscon to MSM8974
  ARM: dts: qcom: msm8974: add missing TCSR syscon compatible
  ARM: dts: qcom: msm8974: switch TCSR mutex to MMIO

 .../bindings/hwlock/qcom-hwspinlock.yaml         |  6 +++++-
 arch/arm/boot/dts/qcom-msm8974.dtsi              | 16 +++++-----------
 2 files changed, 10 insertions(+), 12 deletions(-)

-- 
2.34.1

