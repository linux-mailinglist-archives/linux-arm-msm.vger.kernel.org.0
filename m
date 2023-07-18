Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFE81757BA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jul 2023 14:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232214AbjGRMTS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jul 2023 08:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231262AbjGRMTR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jul 2023 08:19:17 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC248E77
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jul 2023 05:19:15 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f954d7309fso7026318e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jul 2023 05:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689682754; x=1692274754;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SMKvclzqPtFr0Mmla15laKRZJald/0M00oaBu1OafME=;
        b=CIAgEYCSS2S2PxuUPg+ple0dKTSBY4XCDDBV9XIK0n87/V53C0443uODBJuR1xSlHT
         d7nuZ7WemeVVPSJ2x2unS2HTdDBnDg4J1r8yFBAs5G8aHp2d+xACOghHU7W65JeyEhC6
         baTxuh7OqvMQpaq++kSv2dTo3Y34q+YDDUyBSM7GcstmzYHFj5TsJ7MxSXPN38pmtdJZ
         eR3W2pOnwEVVYpzXtoMTJVcUYkBbGUVpETgcf5RGokmhItDt2ibHxrGsLBK2Q6f8T0Zl
         TRB+tQDivnVd4sQK/zS65k6ej0UaLImpHWQjPJzQoN2A+K4u8zBcwfvA4qUOjiRmGGy3
         44Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689682754; x=1692274754;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SMKvclzqPtFr0Mmla15laKRZJald/0M00oaBu1OafME=;
        b=aOOE7X03E2SE9eWQqJhH19DvtRHGVQQeenMHO0bCbf02GQtxsdBXFsAF4nTUzXSt4U
         j6N3jxmzptPuqH4N2a993GqqiDuf0b/e7ddT3xu7kNPrXAugCp8uM2N4BzJlzfwDyDUe
         w52VsZAzAF10ZRV6jBBLaOo2tZtfjiqFrtkrUJpnSnrqxRHxlO0cVD9aLx/ZxUE4otrd
         nxx+bl26HTnKvequ6fnlrZ5LYTT9z2GuWfpWpOxQ33DAsbvM1omZzQZgB2ohMDKwjBxl
         3rw2TdKStzA0qwtq3feqZ3rrzIqBUyI1DaKIf7nqW4ZXE7VKu/2GJ4iu7+7iX7HBY/xq
         Db5w==
X-Gm-Message-State: ABy/qLb6S7PbCGYcOJVsbenmFiJ/0g5wekVDMyFbu4gq/8GTXw4AdnVJ
        Yjrk8NIs+O7CahKUybsi/AuuaHHVydZa7dOgCo99nA==
X-Google-Smtp-Source: APBJJlHja+antYqXXnIxfk0bpJXHUqqKcUksmysnbt9z9LTl7VGSQWzznO0yzsm07NJD7xz7FulxYg==
X-Received: by 2002:a05:6512:33c5:b0:4eb:4258:bf62 with SMTP id d5-20020a05651233c500b004eb4258bf62mr4437941lfg.8.1689682753861;
        Tue, 18 Jul 2023 05:19:13 -0700 (PDT)
Received: from [192.168.1.101] (abyj181.neoplus.adsl.tpnet.pl. [83.9.29.181])
        by smtp.gmail.com with ESMTPSA id w5-20020ac25d45000000b004fbc95a4db3sm418257lfd.28.2023.07.18.05.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 05:19:13 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v4 0/2] Resolve MPM register space situation
Date:   Tue, 18 Jul 2023 14:19:09 +0200
Message-Id: <20230328-topic-msgram_mpm-v4-0-bae382dc0f92@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD2DtmQC/4XN0QrCIBgF4FcJrzPcr5vWVe8REWr/NmHToUuK2
 Ltn3UXQLs+B850nSRgdJnLYPEnE7JILvgSx3RDba98hddeSCTDgjIOic5icpWPqoh4v4zRS2yh
 lkBsLe0HKzOiE1ETtbV+G/jYMpZwitu7++TmdS+5dmkN8fG5z9W7/POSKMloZqZSu21pzfhyc1
 zHsQuzIW8uwJkAREIQWCmvZsuuPwNcEXgSwElqQRkjWfAnLsrwATQOJs0oBAAA=
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
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689682752; l=2266;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=o0O+MFJqqAKZOTgUIqI6fOHo1CwkxIoAOWtZDrHXFeo=;
 b=L0oAVFW/hvXrfRDhYHYWhQk207t0SgZFhjxofKNqVOYmcNLCGoQ2RGjGs3wH+bfDSsrSuPjIi
 /3cftLFu+ljBPSplrcJCbnCoTPoIjgdAnf8+PHFM5sW3MyN2bWz1Abs
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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
base-commit: aeba456828b4e47d99ec8ffb01412fbed0f94806
change-id: 20230328-topic-msgram_mpm-c688be3bc294

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

