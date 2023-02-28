Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1887E6A5D71
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Feb 2023 17:48:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbjB1Qsi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Feb 2023 11:48:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbjB1Qsh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Feb 2023 11:48:37 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B18067EFB
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 08:48:07 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id me6-20020a17090b17c600b0023816b0c7ceso6367976pjb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 08:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rDBJw6bc44tz9zlWlX8b73iHqL2XcZ6IL2dsLamRiIA=;
        b=NlTygjpW7T/NVcW/HWCxHB3nGNPh8hKVewtalurqsAbcmJy0O6a7RPnmomsleyfCIE
         TBMMm/F4vAm/swSXg9xB0lWLkS64Rkp9zMx7g/LjMFyEcS1gBcYViIVIFlvhfKF0NPVW
         gbQJa95OUdX7nLieeboAw72A2DsDedB6vWxecT+bqmR4YaFgawkE6trergLj/MtDbdlp
         fpDbrAMz+wPeY//jUKOZ1m061Mv2fXRAGa8kd+RVn5L1ec9zMZacPzrwQaEXOCJ/iumt
         vi6biIEJCDgXN3/MMO52Hxv4xcHXnFw0TXPWpEOoalvWK52q0B5MY0ro+V/5qKTL6Ib2
         Ll/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rDBJw6bc44tz9zlWlX8b73iHqL2XcZ6IL2dsLamRiIA=;
        b=mONTqCgvvSDddURrY3xXSr7GHbu05rfpibAZ+kavpdG3oULIQXZCf9ovinAXbQ0RX6
         6PLRLqFu4KSbYoyxfMaBU7IE29A2XeeV/ZcgkK7p+FA1BF62vjAsw89b4yfOTq00c1v0
         cJla3DAhRW3u9+MeuIsCPw0At9T6C/j7CM2FNQ31crNF/x59fIEt0nyZ6EiyTaw6PG+Q
         JB1pgUzPxrVLp8YZfHKS3fVR8CnyxCoarUTSQkGOFu4/5LagKcTSbaOcQ+8VU7oYVO0M
         gnqzkApVD9JugXxbpC29W+gGfj9LPk9QQZ0Oik1aOiFEh8gMiJ1qBa4Y0+Llvzpmp0wT
         CtFA==
X-Gm-Message-State: AO0yUKXWJv1Ododddh0OWZqYlIa4liaMzM5xxUzvxvPF6Qq+gKsjEotW
        F9UlyfCOZHZEJt17c8unyK+J
X-Google-Smtp-Source: AK7set/YjBon9DDT7UosC23iGePAmGzvY/eoCvBoPeoUabnlagnMLns6JFkxnIoQFJSPnjZ8fuUJ4A==
X-Received: by 2002:a05:6a20:8e02:b0:cc:f597:2289 with SMTP id y2-20020a056a208e0200b000ccf5972289mr5079518pzj.14.1677602887166;
        Tue, 28 Feb 2023 08:48:07 -0800 (PST)
Received: from localhost.localdomain ([103.197.115.185])
        by smtp.gmail.com with ESMTPSA id z11-20020a6552cb000000b00476dc914262sm5908792pgp.1.2023.02.28.08.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 08:48:06 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arnd@arndb.de,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 00/16] Qcom: Fix PCI I/O range defined in devicetree
Date:   Tue, 28 Feb 2023 22:17:36 +0530
Message-Id: <20230228164752.55682-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

This series fixes the issue with PCI I/O ranges defined in devicetree of
Qualcomm SoCs as reported by Arnd [1]. Most of the Qualcomm SoCs define
identical mapping for the PCI I/O range. But the PCI device I/O ports
are usually located between 0x0 to 64KiB/1MiB. So the defined PCI addresses are
mostly bogus. The lack of bug report on this issue indicates that no one really
tested legacy PCI devices with these SoCs.

This series also contains a couple of cleanup patches that aligns the entries of
ranges property.

Thanks,
Mani

[1] https://lore.kernel.org/linux-arm-msm/7c5dfa87-41df-4ba7-b0e4-72c8386402a8@app.fastmail.com/

Manivannan Sadhasivam (16):
  arm64: dts: qcom: sdm845: Fix the PCI I/O port range
  arm64: dts: qcom: msm8998: Fix the PCI I/O port range
  arm64: dts: qcom: sc7280: Fix the PCI I/O port range
  arm64: dts: qcom: sm8550: Fix the PCI I/O port range
  arm64: dts: qcom: ipq8074: Fix the PCI I/O port range
  arm64: dts: qcom: ipq6018: Fix the PCI I/O port range
  arm64: dts: qcom: msm8996: Fix the PCI I/O port range
  arm64: dts: qcom: sm8250: Fix the PCI I/O port range
  arm64: dts: qcom: qcs404: Use 0x prefix for the PCI I/O and MEM ranges
  arm64: dts: qcom: sc8280xp: Fix the PCI I/O port range
  arm64: dts: qcom: sm8150: Fix the PCI I/O port range
  arm64: dts: qcom: sm8450: Fix the PCI I/O port range
  arm64: dts: qcom: sm8350: Fix the PCI I/O port range
  ARM: dts: qcom: apq8064: Use 0x prefix for the PCI I/O and MEM ranges
  ARM: dts: qcom: ipq4019: Fix the PCI I/O port range
  ARM: dts: qcom: ipq8064: Fix the PCI I/O port range

 arch/arm/boot/dts/qcom-apq8064.dtsi    |  4 ++--
 arch/arm/boot/dts/qcom-ipq4019.dtsi    |  4 ++--
 arch/arm/boot/dts/qcom-ipq8064.dtsi    | 12 ++++++------
 arch/arm64/boot/dts/qcom/ipq6018.dtsi  |  4 ++--
 arch/arm64/boot/dts/qcom/ipq8074.dtsi  | 12 ++++--------
 arch/arm64/boot/dts/qcom/msm8996.dtsi  | 12 ++++++------
 arch/arm64/boot/dts/qcom/msm8998.dtsi  |  2 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi   |  4 ++--
 arch/arm64/boot/dts/qcom/sc7280.dtsi   |  2 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 10 +++++-----
 arch/arm64/boot/dts/qcom/sdm845.dtsi   |  6 +++---
 arch/arm64/boot/dts/qcom/sm8150.dtsi   |  6 +++---
 arch/arm64/boot/dts/qcom/sm8250.dtsi   |  8 ++++----
 arch/arm64/boot/dts/qcom/sm8350.dtsi   |  8 ++++----
 arch/arm64/boot/dts/qcom/sm8450.dtsi   |  8 ++++----
 arch/arm64/boot/dts/qcom/sm8550.dtsi   |  8 ++++----
 16 files changed, 53 insertions(+), 57 deletions(-)

-- 
2.25.1

