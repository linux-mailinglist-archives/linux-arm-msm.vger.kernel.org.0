Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F344A568E28
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 17:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234318AbiGFPtk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 11:49:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234389AbiGFPtL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 11:49:11 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B5532A72C
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 08:43:43 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id u12so27774778eja.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 08:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CLyp9dgcj9TjrbTGfy1uRAiX4gDvkkEXBDjNRWPJTz0=;
        b=RDnXIHfM/t/Mw/Hc0FT2P+etq6Mm191X17WntZOlzpOAYA4NgEYocNTHri3XunKTPU
         9nRxrvsqZjc354aZ8qBwWaf4hW+0REiTGrKzBJ8u3yScjSVSKsBIrwlIRE9XGBT46lJP
         IwUNtca3VwggiGTUwGPjBwOZsLKPCsKqPvOQie3B4pCpvwph304lyMKbkm4pwO6zgfuA
         tcS5ZET2626qKj2zckBrmMeLlEjdFuf2HGgPd1zpDsslzhyHx87kSguMAkUT6NCHQ2oC
         gzMOF3NmbliXy6rZ5sTQXuOr7sC9mCPCiHSu2ADVjvj3v3ORYDBs8BbfE9PdbqI+XiTS
         Wvhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CLyp9dgcj9TjrbTGfy1uRAiX4gDvkkEXBDjNRWPJTz0=;
        b=dPJXFZUNR3VmdwFB5qzutfzZc0aemVRWkPLcYAZMI0KVr6HBO6DECOg3qq+2b7RKR5
         qhGE9TsHOjhXOg0qWZFkyIasRAyRUufudRBfBLo02svogWxbnw1DisYglszBIBaxm1Y1
         RwMQbxV3mXSzwpUM4X8i3VNABxfrSrlwBGTqUQGKL9Q+3WpsGdyHBxebN84sulzAS/ZF
         EhZ59pV4zrhX0h/dXJxmRfzYfF/thFiSz4sNK++i0yCeV8UM06MPKbMU13jp3A5EuPXo
         S5q0My3erUQgEf2O6jNIAa8p++SPOMOX3xk4i69M34obr5Ywp4m3Kg/KzeFihJI3qn5o
         gdlQ==
X-Gm-Message-State: AJIora9eywFNQAPKvQ5PHgCLLiVTmkyYqS9Op5A6GTeIzLdGKrDTxXjG
        ZrcaKfWnUpjk88aWhcUqrQ2hNQ==
X-Google-Smtp-Source: AGRyM1vshDdtWpI77FwW6NTJLihOzK5IYjEF0p0tbIeldanQk73Qgtjy3bVRNLO8/1TTAcQ32+yVDw==
X-Received: by 2002:a17:907:6d86:b0:726:99d7:20e4 with SMTP id sb6-20020a1709076d8600b0072699d720e4mr40054273ejc.342.1657122221465;
        Wed, 06 Jul 2022 08:43:41 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id fi18-20020a056402551200b0043a43fcde13sm7711033edb.13.2022.07.06.08.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 08:43:40 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jonathan@marek.ca,
        robert.foss@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v8 0/5] SM8350 Display/GPU clock enablement
Date:   Wed,  6 Jul 2022 17:43:32 +0200
Message-Id: <20220706154337.2026269-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v2
 - Dropped "clk: Introduce CLK_ASSUME_ENABLED_WHEN_UNUSED"
 - Dropped "clk: qcom: sm8250-dispcc: Flag shared RCGs as assumed enable"
 - Dropped "clk: qcom: rcg2: Cache rate changes for parked RCGs"

Changes since v3:
 - Dropped RBs & SoBs for bigger changes
 - Changed author to me for patches with big changes

Changes since v5:
 - Reverted dispcc-sm8350 split from dispcc-sm8250
   and related .index changes - Bjorn
 - Re-added Tags that were thrown out due to the 
   above revert

Changes since v7
 - Added Vinods RBs
 - Re-ordered patches to make bindings come before 
 - Removed rpmdpd patch from series



Jonathan Marek (2):
  dt-bindings: clock: Add Qcom SM8350 DISPCC bindings
  clk: qcom: add support for SM8350 DISPCC

Robert Foss (3):
  dt-bindings: clock: Add Qcom SM8350 GPUCC bindings
  clk: qcom: add support for SM8350 GPUCC
  arm64: dts: qcom: sm8350: Add DISPCC node

 .../bindings/clock/qcom,dispcc-sm8x50.yaml    |   6 +-
 .../bindings/clock/qcom,gpucc-sm8350.yaml     |  72 ++
 arch/arm64/boot/dts/qcom/sm8350.dtsi          |  26 +
 drivers/clk/qcom/Kconfig                      |  14 +-
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/dispcc-sm8250.c              |  63 +-
 drivers/clk/qcom/gpucc-sm8350.c               | 637 ++++++++++++++++++
 .../dt-bindings/clock/qcom,dispcc-sm8350.h    |   1 +
 include/dt-bindings/clock/qcom,gpucc-sm8350.h |  52 ++
 9 files changed, 866 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml
 create mode 100644 drivers/clk/qcom/gpucc-sm8350.c
 create mode 120000 include/dt-bindings/clock/qcom,dispcc-sm8350.h
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sm8350.h

-- 
2.34.1

