Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D46A6736A41
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 13:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232509AbjFTLFp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 07:05:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232500AbjFTLFl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 07:05:41 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E61B100
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 04:05:38 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f86fbe5e4fso2861238e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 04:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687259136; x=1689851136;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b75FYxuvT/RTDVWXxiUHRtH4AAZYp/PYI//JWD1JyWw=;
        b=aA6exhIWmV7/kc6Hwh27TYTXRhzQdf40adxxigDp9ACtjMuW7pdFdPgN7FD9XFckBZ
         QODrAYAbh4BmFuqxL/BSvjIPOtoTJlC8HoTsnC662Tt83Ue5aOJ49FrVYW2o6c2CngqK
         vQ+YiL59kkzh3qNssrPa6NN8+7sQUFeU2dytuGLFJV2DjRC9oyVSIlHkS41CC3CqFVr5
         idfPe7RyEMwS6unfSp9aE/MH24Eujyt9txbNuoReGWA0/5BlOEGeSdz4xJ4gMqOXhNDD
         K5B6+gSptWz71R9iQaCSCSrvAbbzUA+eSD1sApJ/t7pmBK1PzzS2mFIoF2ru+aDOVXKG
         wE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687259136; x=1689851136;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b75FYxuvT/RTDVWXxiUHRtH4AAZYp/PYI//JWD1JyWw=;
        b=BuSv9rLT+2OMfzC/bMkza0oKruFl5sc94QHjbFHu3j5RzzmiIxWmqZxsXPSnVoo6uq
         0x7MuaFrJslQNIMe9fdWBIGUSfdouB8JRtdWzUgBB/6iDwqqqgrhlrl1v6gyecg8fJPC
         1Q0wVFxBByR96RDMq2ytwepWlYRFqA934ZnFdc0pKcfN5c1XzXcWcONcNIR1wBAb1p/O
         O0AD321uDTxajlf/sGVcwSG2bQEAA37+sJ+7G4ZbUB6lSnuEskqgk1xDLz3gNYlkRzEP
         9FUwAkEqZJUPkvOPAGHaYkZGEs98WFEeH6IfuDDgVRXSC9mX9ZhURStUJbNIpbXR0hFd
         16Mg==
X-Gm-Message-State: AC+VfDzRi6mEPdwP+CrgFSQTyOXPKOzu+tk6AnNzylEVcetjs7y7+huI
        jbU8mRWN3OKtO2qr1ioxYOUM5A==
X-Google-Smtp-Source: ACHHUZ7tWYoedG8hXxOX/lkMppk7hoaSV8JNZTqDLhxtxfFIuWplsbQoA45PSqsHLLPETYoP7tYnlA==
X-Received: by 2002:a2e:3513:0:b0:2b4:83c3:d285 with SMTP id z19-20020a2e3513000000b002b483c3d285mr2188693ljz.38.1687259135655;
        Tue, 20 Jun 2023 04:05:35 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c008b00b002ac7b0fc473sm369047ljq.38.2023.06.20.04.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 04:05:35 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/4] SM8250 Edo pins, keys & pmic
Date:   Tue, 20 Jun 2023 13:05:33 +0200
Message-Id: <20230614-topic-edo_pinsgpiopmic-v2-0-6f90bba54c53@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP2HkWQC/4WNWwrCMBAAryL5NpJECcUv7yFF8ti0CzUbNrUop
 Xc39gJ+zsAwq6jACFVcD6tgWLAi5QbmeBBhdHkAibGxMMqcldUXOVPBICHSo2CuQ0EqzyZi6ny
 0SXsbvWixdxWkZ5fD2PL8mqYmC0PC9367941HrDPxZ58v+mf/fhYtlQyp65zyLhgbbhNmx3QiH
 kS/bdsXF7rITtIAAAA=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687259134; l=1097;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=lsxCpXK9lusbdQ0WpahHP1F9ZITtSHhAZWslr5vKO6U=;
 b=Lb+0br68Z6t46QCzFZr2gzNbxiUzsY5K/+HvKJs12oRpZzO46OnLShnLJuKcHfVACiJyonfkf
 A9CvlbEUVzdD8lV5zibHD0EZ2T3oqWrjUuynCI/wAZs56Q/QBIcGb9Y
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series brings fixes to the GPIO buttons, adds gpio-line-names and
introduces the SLG51000 camera on Xperia Edo devices.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- Fix the Fixes tag in patch 4
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20230614-topic-edo_pinsgpiopmic-v1-0-cf88a0bac26c@linaro.org

---
Konrad Dybcio (4):
      arm64: dts: qcom: sm8250-edo: Add gpio line names for TLMM
      arm64: dts: qcom: sm8250-edo: Add GPIO line names for PMIC GPIOs
      arm64: dts: qcom: sm8250-pdx203: Configure SLG51000 PMIC
      arm64: dts: qcom: sm8250-edo: Rectify gpio-keys

 .../dts/qcom/sm8250-sony-xperia-edo-pdx203.dts     | 364 +++++++++++++++++++++
 .../dts/qcom/sm8250-sony-xperia-edo-pdx206.dts     | 243 ++++++++++++++
 .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi      |  61 +++-
 3 files changed, 655 insertions(+), 13 deletions(-)
---
base-commit: 9dbf40840551df336c95ce2a3adbdd25ed53c0ef
change-id: 20230614-topic-edo_pinsgpiopmic-df8bd6f1b6db

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

