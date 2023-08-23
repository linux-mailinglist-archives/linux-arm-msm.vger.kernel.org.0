Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D19F785691
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Aug 2023 13:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233077AbjHWLPl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Aug 2023 07:15:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232113AbjHWLPk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Aug 2023 07:15:40 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 937E1184
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Aug 2023 04:15:34 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2bba6fc4339so84718281fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Aug 2023 04:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692789333; x=1693394133;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIWNuXwrah0vcwp9FxjAO4eUOL/OFiR6pFNP4rHU2KI=;
        b=sleSWxodh86b/ReU6wy0MjmWI9qXzTon3daX+xyZIJmBBgY8BTGdHv2mfJMdSf3fSU
         vPRMJfu/yy1DXmFKm9GTHV8NzsoSqYd+QlS14qd/WiFX3XsHk9Sa+esfU/QwNoEbFEl/
         FQG4+k70aQpGYd2A7DB1mW8C2WG9PhB8jSdkDksn4AKLaVxgLuf+lvwa4UcBAAZYXRE5
         GFacKna8uY/qbmTtGL+djfBPnY1ojcJreXdfyH6lkX5ZsfWEPO+hEftlgjlWuxg5G/TC
         d2zvCUgrl/Yt0s6O5Lt3uCwRXpAdbKr7zF8ZvxdlIYwwNZVEgQznKRqtU7/j0D/jJxSi
         5hqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692789333; x=1693394133;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZIWNuXwrah0vcwp9FxjAO4eUOL/OFiR6pFNP4rHU2KI=;
        b=RPxIwbTrvZFlEwhLuo6exCG65iAPyB1SP44ECWF2yUjRwEBFMEENPFDhtwc/XNABuf
         CmR51CUv353UAu+S4OMAn+bQA5xVFCD3IT/g/f21Dz4SR1N+WhrTx+XVjFhSpVLwAzZN
         MPqgJQ49XXoFbRTbApJPOPNgKNAe4399NBvSctQCclmzk2YPRymZk+wK6AirloxXLdDC
         A8AGjUCNaM/+0H4iKLwIV9NNh3KIZDFZjda/svy9hpAnk3pdAINY9Noz+jYS+ymQfiYh
         ehYlrGmjh3lbNhuA/KRB05Fkw6qGQ3PqlHy9wVsNuqRjH11HJXyjuvKPwyJxWMx/az8R
         UMeQ==
X-Gm-Message-State: AOJu0Yws28gxrkQoziQPL2ylkz5K3lBqPc/ts8ekZF0/9Jz3+xOEmEMY
        Q6x90YADp4oIE7FyrO01EEpsgg==
X-Google-Smtp-Source: AGHT+IFnizC3nIy1Mf55Mys8hZrehr4el9mffeLcVjutikYgFAx2De2coxMSTUFARJWt1szfXJ3tDg==
X-Received: by 2002:a2e:9894:0:b0:2bc:d8cb:5a13 with SMTP id b20-20020a2e9894000000b002bcd8cb5a13mr2188323ljj.42.1692789332818;
        Wed, 23 Aug 2023 04:15:32 -0700 (PDT)
Received: from [192.168.1.101] (abyj76.neoplus.adsl.tpnet.pl. [83.9.29.76])
        by smtp.gmail.com with ESMTPSA id r16-20020a2e80d0000000b002b6ffa50896sm3148981ljg.128.2023.08.23.04.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 04:15:32 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v5 0/2] Resolve MPM register space situation
Date:   Wed, 23 Aug 2023 13:15:30 +0200
Message-Id: <20230328-topic-msgram_mpm-v5-0-6e06278896b5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFLq5WQC/4XNwYrDIBQF0F8prsfBPE21XfU/SilP80yERIO2Y
 YaSf6/tbihMlvfCPffBCuVAhR13D5ZpCSWkWEP7tWNuwNgTD13NDARIIcHwW5qD41PpM07XaZ6
 42xtjSVoHB8XqzGIhbjNGN9RhvI9jLedMPvy8f86XmodQbin/vm+X5tX+87A0XPDGamOw9S1Ke
 RpDxJy+U+7ZS1tgS4AqEChUhlrtRfchyC1BVgGcBg/aKi32H4LaElQVLJI00DnhD/BHWNf1Cey
 qbeOMAQAA
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692789331; l=2434;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=qH9sx+/ai5EovCviiqBDDheKAiLyZYj17Dvw7FbBpGw=;
 b=uesa5yLp23EsX+AUQIrOlqfBij2mc7w67AvZxB4MpvduNYEHoQh3u6xxE6bwRAqkygj5ZMIT5
 Nqv4Ey8unZICA9UVcV3Cd9tNRf1hA1iRwZj2QKxD9KuiQt6/s3mxq8Z
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

v4 -> v5:
- Pick up tags
- Rebase on Rob's of_ header untanglement

Link to v4: https://lore.kernel.org/r/20230328-topic-msgram_mpm-v4-0-bae382dc0f92@linaro.org

v3 -> v4:
- Fix up indentation in the bindings patch
- Add an example glink-edge subnode to remoteproc-rpm (its bindings
  require that..)

Link to v3: https://lore.kernel.org/r/20230328-topic-msgram_mpm-v3-0-2c72f27b4706@linaro.org

v2 -> v3:
- Fix the example
- Pick up tags
- remove the outdated example from the cover letter, check bindings
  should you want to see one

The bindings for the wrapper node used in the yaml example are merged
in qcom/for-next

Link to v2: https://lore.kernel.org/r/20230328-topic-msgram_mpm-v2-0-e24a48e57f0d@linaro.org

v1 -> v2:
- deprecate 'reg', make qcom,rpm-msg-ram required [1/2]
- Use devm_ioremap() [2/2]

Link to v1: https://lore.kernel.org/r/20230328-topic-msgram_mpm-v1-0-1b788a5f5a33@linaro.org

Depends on resolution of https://github.com/devicetree-org/dt-schema/issues/104

The MPM (and some other things, irrelevant to this patchset) resides
(as far as the ARM cores are concerned, anyway) in a MMIO-mapped region
that's a portion of the RPM (low-power management core)'s RAM, known
as the RPM Message RAM. Representing this relation in the Device Tree
creates some challenges, as one would either have to treat a memory
region as a bus, map nodes in a way such that their reg-s would be
overlapping, or supply the nodes with a slice of that region.

This series implements the third option, by adding a qcom,rpm-msg-ram
property, which has been used for some drivers poking into this region
before. Bindings ABI compatibility is preserved through keeping the
"normal" (a.k.a read the reg property and map that region) way of
passing the register space.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      dt-bindings: interrupt-controller: mpm: Pass MSG RAM slice through phandle
      irqchip: irq-qcom-mpm: Support passing a slice of SRAM as reg space

 .../bindings/interrupt-controller/qcom,mpm.yaml    | 52 +++++++++++++++-------
 drivers/irqchip/irq-qcom-mpm.c                     | 21 +++++++--
 2 files changed, 53 insertions(+), 20 deletions(-)
---
base-commit: e3f80d3eae76c3557b3c9b5938ad01c0e6cf25ec
change-id: 20230328-topic-msgram_mpm-c688be3bc294

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

