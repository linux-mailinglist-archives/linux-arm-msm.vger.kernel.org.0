Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72B8C6607E2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 21:12:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236386AbjAFULz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 15:11:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236459AbjAFULP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 15:11:15 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A62C1BEBA
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 12:10:55 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id fm16-20020a05600c0c1000b003d96fb976efso4342378wmb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jan 2023 12:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yiVhtB0OTKWh9gbXepF+cHkHM03BbNb43+gboMMXNaM=;
        b=BOyaCoBTlvBNxAqlb0k3Gy1sb3QaXESrs8kuOZ1qR+JGmVktldQQLC4loAm0NFLAsc
         38vcJGqqTJ5pJDZYlSCu6D6R3+JIL6zkzEqFzFKxYTnZJ4b+LuiUs4YHpQiuIxl8ZfCA
         JWt56VvbQz9UFRjNLiJuuAQ2JWDjuRVKRPoqdnJZixRZ+hGtN27Y7S5YBPiRXIjMOlz9
         RNTiQVW6v31Ly5o4eydTpoF6Ctw4XUVKxjsSBWEIqPNaNRnl8U9mNaIvAD4y/KD3bb/e
         CjrYgMhdxPDvE7zN7c8ePiJw69NP1jyg9fiC/OtUBa6YtkITPNOUPYLc1dFgcD5kNQvO
         sniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yiVhtB0OTKWh9gbXepF+cHkHM03BbNb43+gboMMXNaM=;
        b=0/YzzgNt8yUsK192L+jb3Ed5k7XqfbQe15dyWZB52usxwNBxFRymiYONPXdj2VeoCN
         9GM8HXiLR+KM3LrwYC5WBF68YHxG4+XzzDoNUc8hwZuBLGrNpBkefkx00XFgIZAFjgUJ
         bmloDXglSr5tfj9ffD9Xp+JmAUcEXim3c+3lhHUSxq0dATbfoa4kGiMjFp9gPBLSPyxD
         tc+QzPhUeYL75Eo7odj3oOrPbBBLJQAho9Mgwyll6MdD1AztvvW1kRTcGRgsvOpGmTSl
         1zre6UZgy/83OKYoy+ExTCYDhBbk5vgU9TImpu0FtpVIqXLq8p1ucNEBLkqfKo+kWCWX
         Td8g==
X-Gm-Message-State: AFqh2krjXvtQxUTYT7ftfYgT+yJ3fHote/cJo4shlZ3JZBxpCEqKR6Qg
        QicBBJurbfT0ZYDuMVmuCsD65ajtk9qJpDBh
X-Google-Smtp-Source: AMrXdXtL1PvxsaTLoLWxB7/da4XKzFIdt2PINFF5b4lcNK8bavlVRhRtm741j6xd4aXPF9ehvL+Oew==
X-Received: by 2002:a05:600c:1d28:b0:3d2:1d51:246e with SMTP id l40-20020a05600c1d2800b003d21d51246emr43710295wms.9.1673035854031;
        Fri, 06 Jan 2023 12:10:54 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id z14-20020a05600c220e00b003d99fad7511sm2665240wml.22.2023.01.06.12.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 12:10:53 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v9 00/10] arm64: dts: Add base device tree files for SM8550
Date:   Fri,  6 Jan 2023 22:10:37 +0200
Message-Id: <20230106201047.337409-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
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

This series adds the base device tree files and MTP board support
for the Qualcomm SM8550 SoC, including the clock, pinctrl, smmu,
regulators, interconnect, cpufreq, and qup nodes.

The SM8550 is the latest Qualcomm Mobile Platform.
See more at:
https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/documents/Snapdragon-8-Gen-2-Product-Brief.pdf

The v8 of this patchset is here:
https://lore.kernel.org/all/20221230202230.2493494-1-abel.vesa@linaro.org/

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
 arch/arm64/boot/dts/qcom/sm8550.dtsi          | 3549 +++++++++++++++++
 11 files changed, 4574 insertions(+)
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

