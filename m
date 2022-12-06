Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C38B644F23
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 00:01:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbiLFXBK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 18:01:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiLFXBJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 18:01:09 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11EB33E09D
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 15:01:07 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id n20so10085749ejh.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 15:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qft8//kMGABEzNvs12O7aVK/fzWZWN06hWawnhLE2Vg=;
        b=hRXHOlB/k0yfSyudbGNjHch+CQ0rwx5Qn2TWZ9gQ1ePaedMrhU7wUtUt+OzqcmWQJN
         WWtiGF0GguBELGwfLdF0R9ZpmwKtsem0erUu5QaxUgPIrteo7rHdvvEoeHOenfms3MSY
         mWPUXhZp1dcAvm5cnklPGkqkAMi8X4eGenq5DZPqrxKseFFkbAXkVQFPgmm8XGsPjksG
         brZCILux8jVO2oQC1mkA8jXYBWNUC9LGynU7O61mIpgVF6FzVi8srwabNl48No2rnhh1
         CHmen1mxuijFO14kqpywKa38/ohlUimsWRqXcTA5R2I9iubwUTXf1c4sWJj58BJIOqyG
         /3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qft8//kMGABEzNvs12O7aVK/fzWZWN06hWawnhLE2Vg=;
        b=DvxXZu4rcCogDipy86iukdVnacoKbSBQXowyXltxxoWjktagu8RiKHjdKqgKNrO8yL
         3qLNMz/bcJnd4UCQ+QbqQLDzzCp/Iu7YuX5Ft+LXiicc5ou/Cwu1+kTQ+54zOHMV6yG0
         j8jtEmiIpB9c9C6ZSKADtJarcJSEbutH0umV1XJXBk71+DnidXKLznTZzoAEMmloMlLi
         U56gQV06oz2sw5G/Ey6I3Cd6YYNBy5Lknl6yc6ni20Dj1scbiPH0SfqUi1EO96Uq6L7k
         5HZAPEGNXsG1+oliO7DnlbjgIahxBv1Z/Af+0lFQZOkniZ2bzU6umh0zEK5AqXrNRX1w
         xGwg==
X-Gm-Message-State: ANoB5pmrg58V9dB43itHs2svQ5+S6q2zWy/aVyy68kM/b0OXtfxKXlpN
        z/bApNPMu/gz7p86NV7rANUGJg==
X-Google-Smtp-Source: AA0mqf6fIn84ZYEXogY7xOf/YyPGqF9x+lw7U7dAX9fwWj2TBxDAwJTHCKjeXaV9pO98Sqk6m2QPhg==
X-Received: by 2002:a17:906:70c2:b0:7ae:d58e:3a4a with SMTP id g2-20020a17090670c200b007aed58e3a4amr59367857ejk.332.1670367665577;
        Tue, 06 Dec 2022 15:01:05 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id p10-20020a170906838a00b007c0dacbe00bsm4239320ejx.115.2022.12.06.15.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 15:01:05 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v7 00/10] arm64: dts: Add base device tree files for SM8550
Date:   Wed,  7 Dec 2022 01:00:52 +0200
Message-Id: <20221206230102.1521053-1-abel.vesa@linaro.org>
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

This series adds the base device tree files and MTP board support
for the Qualcomm SM8550 SoC, including the clock, pinctrl, smmu,
regulators, interconnect, cpufreq, and qup nodes.

The SM8550 is the latest Qualcomm Mobile Platform.
See more at:
https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/documents/Snapdragon-8-Gen-2-Product-Brief.pdf

The v6 of this patchset is here:
https://lore.kernel.org/all/20221206131252.977369-1-abel.vesa@linaro.org/

Here is a branch where the entire support has been merged:
https://git.codelinaro.org/linaro/qcomlt/linux/-/commits/topic/sm8550/next

Abel Vesa (3):
  dt-bindings: arm: qcom: Document SM8550 SoC and boards
  arm64: dts: qcom: Add base SM8550 dtsi
  arm64: dts: qcom: Add base SM8550 MTP dts

Neil Armstrong (7):
  arm64: dts: qcom: Add pm8010 pmic dtsi
  arm64: dts: qcom: Add PM8550 pmic dtsi
  arm64: dts: qcom: Add PM8550b pmic dtsi
  arm64: dts: qcom: Add PM8550ve pmic dtsi
  arm64: dts: qcom: Add PM8550vs pmic dtsi
  arm64: dts: qcom: Add PMK8550 pmic dtsi
  arm64: dts: qcom: Add PMR735d pmic dtsi

 .../devicetree/bindings/arm/qcom.yaml         |    6 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 arch/arm64/boot/dts/qcom/pm8010.dtsi          |   84 +
 arch/arm64/boot/dts/qcom/pm8550.dtsi          |   59 +
 arch/arm64/boot/dts/qcom/pm8550b.dtsi         |   59 +
 arch/arm64/boot/dts/qcom/pm8550ve.dtsi        |   59 +
 arch/arm64/boot/dts/qcom/pm8550vs.dtsi        |  194 +
 arch/arm64/boot/dts/qcom/pmk8550.dtsi         |   55 +
 arch/arm64/boot/dts/qcom/pmr735d.dtsi         |  104 +
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts       |  404 ++
 arch/arm64/boot/dts/qcom/sm8550.dtsi          | 3534 +++++++++++++++++
 11 files changed, 4559 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm8010.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8550.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8550b.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8550ve.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8550vs.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmk8550.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmr735d.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8550-mtp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8550.dtsi

-- 
2.34.1

