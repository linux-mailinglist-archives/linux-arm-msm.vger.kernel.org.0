Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B28272AA7F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jun 2023 11:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231221AbjFJJNF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Jun 2023 05:13:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230167AbjFJJNF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Jun 2023 05:13:05 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A7293AA6
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jun 2023 02:13:03 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9768fd99c0cso772415566b.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jun 2023 02:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686388382; x=1688980382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=el5t90CX0KZg71r46Aq58k54+iI17+shn/UMUNopsqg=;
        b=vyZHYGkzfoQFiksS2nO9MCLsI4oWI8oIDoMCiYbDQBfFmuFFn4A6OtLOy+DaTw8W6K
         /jQURkeJNjvHhzUzaF+4Mntf/OsbwSdLEqt6U5alv05OJxgvqZRQbMliqb2NUF2/nRpo
         qq36oSJhzCuqd2byp4w4TEFqx/5nsR+fQVsmMYPo2MijngwnxtwCdoCYSFIrCpMXhwe4
         nStfU0z/j4rcTy/J61LeJxtBgoHFUR2TWIaAQkLxMevFdBgDj7bKv9DA7MLmxwyfr2UQ
         TpC97pYtzE39afHUviXBsKzPB9vg+w88NrX7ecG1RCs9j4o9uE+S/DA9yP17ADNcwj32
         7pGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686388382; x=1688980382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=el5t90CX0KZg71r46Aq58k54+iI17+shn/UMUNopsqg=;
        b=HSMTnO3k/vngfpLtYrrY5qii3b8zc9gPoxCa8xT3LS4iaB9d7otcY9WSbXzNrgjlzt
         IV35smUDHevEpFqlv0JtjqpCXzL34iNGrcCSryE0wHo66DfLWw56TCMC5v4mqHsqLzZC
         mcbecM0aA+D/N5by2DaymskpG5eJEZtDdIYgrFu5hIcbhcR2wlGiYYAVhyZJBvFTgRe2
         aGcCMWWX4AEcDmN8SpaNQHMS0uPdSFNZdXmCjoioxsNyf5SrHFDEiBvi3cKq1RtF3Wn8
         ncjFacnon0rSw8pCZ4dOteX+ng81n3Dp9j3msdLL+IHBfl9elPkPXL3+XJcrUT52OZl7
         lozg==
X-Gm-Message-State: AC+VfDxR3PcGCJwx0tXP0+2sMDmJsYnS/MZLzDmTURNyjyfyJKRN+XXJ
        EcgTR+DRCsY+JgD2oz8hO2GKQw==
X-Google-Smtp-Source: ACHHUZ4Dv2xzIY5s4ZpE8GvaEA/T+zxaJeqRlsL+nIBhW18zrjRMuyKw4lwlg0Drr7r2jioTo7bLpg==
X-Received: by 2002:a17:907:7202:b0:970:28c:f960 with SMTP id dr2-20020a170907720200b00970028cf960mr4219760ejc.17.1686388381629;
        Sat, 10 Jun 2023 02:13:01 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id b7-20020a170906038700b009787b18c253sm2347012eja.181.2023.06.10.02.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 02:13:01 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] pinctrl: dt-bindings: qcom: for v6.5
Date:   Sat, 10 Jun 2023 11:12:58 +0200
Message-Id: <20230610091258.4903-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/qcom-pinctrl-6.5

for you to fetch changes up to 647c16ac7b15fc8fe6ab679690ac2ffe7c53abd3:

  dt-bindings: pinctrl: qcom,sm7150-tlmm: simplify with unevaluatedProperties (2023-05-12 18:23:51 +0200)

----------------------------------------------------------------
Qualcomm pinctrl Devicetree bindings changes for v6.5

Simplify remaining bindings with usage of unevaluatedProperties.  This
will have the same functional effect with less code.

----------------------------------------------------------------
Krzysztof Kozlowski (4):
      dt-bindings: pinctrl: qcom,ipq9574-tlmm: simplify with unevaluatedProperties
      dt-bindings: pinctrl: qcom,sc8280xp-tlmm: simplify with unevaluatedProperties
      dt-bindings: pinctrl: qcom,qcm2290-tlmm: simplify with unevaluatedProperties
      dt-bindings: pinctrl: qcom,sm7150-tlmm: simplify with unevaluatedProperties

 .../devicetree/bindings/pinctrl/qcom,ipq9574-tlmm.yaml       | 11 +----------
 .../devicetree/bindings/pinctrl/qcom,qcm2290-tlmm.yaml       | 11 +----------
 .../devicetree/bindings/pinctrl/qcom,sc8280xp-tlmm.yaml      | 12 +-----------
 .../devicetree/bindings/pinctrl/qcom,sm7150-tlmm.yaml        | 11 +----------
 4 files changed, 4 insertions(+), 41 deletions(-)
