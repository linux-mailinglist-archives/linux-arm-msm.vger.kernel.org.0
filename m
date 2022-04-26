Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C501B50FA05
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 12:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245283AbiDZKSr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 06:18:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348467AbiDZKSC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 06:18:02 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47C9DD1CC1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 02:41:48 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id m23so8439043ljb.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 02:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E33tHlRMyT/tQ3OBJ+K+rhgYkqV/EjV+D77gWmceEHU=;
        b=DsnrfIwmgTW8zfFWlRe9NdvqoP0cBHwxnnpLmJkvhXHenP8plVKz7JB8AEvuxFO99e
         98rH+WgE61hOh78cPtsUeJj6fSc/NuXTrbAPFdZ6JZeNl1eWghKpCHhF57glaj9kGE3n
         dbrWnlepSnABrgq2N2U9FTZjmtwauObRONtnvbLZJrfUM+VUtBFYJeg3jiC3ab+Pfqqe
         RVYEbgWjblMHU66+zspPHrqi+RwUBMhcRq20amk9UjbOVFAOsn1jU3Qw+CwMhPsVfXSu
         h62RP+e8TyWtKRdcB8gJMnahb1XU23c4BlxlZa713sWp+ph4+mMefRgznthmBiz1iqIb
         Ustw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E33tHlRMyT/tQ3OBJ+K+rhgYkqV/EjV+D77gWmceEHU=;
        b=S5j2IkP9lRO0Ug6xCmNT2sa1TF7Xih+NOsZ3jhke/TqmRsrkZ9H6be43YA6jhrBkRT
         ReLS1HQ7FozsxfUU7ge9OFavvZMn7j/AwjnDZdoehCT3vSZrN6mkhwmOvubgX5HGxEhF
         oUdfP13mjx27QFbefsI7gA74WpcrIJQvJuAuir8/aai9ku5GA6mNUqOrxDIjLmQ6e5Bc
         0WNvyFhtvi6c0cGqqxpdUQd2/C+H8JrKo4c7+rg3L6Kwn3ZPGXfNwOk/sHld3qmT6l1n
         ExXeNbsoWGzdcpi/v+31kiXkQFOp4QkjueGK7AvFF1rzmO1k+7tIX3m1QVe9F1/xZcXp
         LW6w==
X-Gm-Message-State: AOAM531mvnhTsM9pmaXIdSySGboTn3XhlFR2lodWPcNnNaznbBMNPule
        /qtxX8RBXdQzznzfz80WFf6Zqw==
X-Google-Smtp-Source: ABdhPJxmYjd+mtxXuvzQgQT+f0ern72OnmODDZCzbYt48kEcU4DHv7JGCyNCCVypOhmaRJ2qS/W8JA==
X-Received: by 2002:a2e:9e03:0:b0:24f:153c:c479 with SMTP id e3-20020a2e9e03000000b0024f153cc479mr4022106ljk.13.1650966106612;
        Tue, 26 Apr 2022 02:41:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([188.162.64.30])
        by smtp.gmail.com with ESMTPSA id y28-20020a19641c000000b00471f6806403sm1330117lfb.16.2022.04.26.02.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 02:41:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        quic_tdas@quicinc.com
Subject: [PATCH v4 0/3] arm: qcom: qcom-apq8064: add separate device node for tsens
Date:   Tue, 26 Apr 2022 12:41:41 +0300
Message-Id: <20220426094144.2958416-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Currently gcc-msm8960 driver manually creates tsens device. Instantiate
the device using DT node instead. This makes the APQ8064 follow the
IPQ8064 device tree schema (which is also closer to the way tsens
devices are described on newer Qualcomm platforms).

Compatibility with the previous devices trees is kept intact.

Changes since v3:
- Fix a typo qcom,gcc-msm8060 -> qcom,gcc-msm8960 (noted by Krzyshtof)
- Fixed indentation in the example (also noted by Krzyshtof)

Changes since v2:
- Remove patches merged by Daniel
- Rephrase commit messages to emphasize that these changes make apq8064
  follow ipq8064

Changes since v1:
- populate child devices in gcc-msm8960
- add syscon to the gcc device tree node

Dmitry Baryshkov (3):
  clk: qcom: gcc-msm8960: create tsens device if there are no child
    nodes
  arm: dts: qcom-apq8064: create tsens device node
  dt-bindings: clock: qcom,gcc-apq8064: split tsens to the child node

Dmitry Baryshkov (3):
  clk: qcom: gcc-msm8960: create tsens device if there are no child
    nodes
  arm: dts: qcom-apq8064: create tsens device node
  dt-bindings: clock: qcom,gcc-apq8064: split tsens to the child node

 .../bindings/clock/qcom,gcc-apq8064.yaml      | 45 +++++++------------
 arch/arm/boot/dts/qcom-apq8064.dtsi           | 25 +++++++----
 drivers/clk/qcom/gcc-msm8960.c                |  6 ++-
 3 files changed, 39 insertions(+), 37 deletions(-)


base-commit: 3123109284176b1532874591f7c81f3837bbdc17
prerequisite-patch-id: b5aad2b1e0db4e6d77d6a2faa2fe95acf274b3c8
prerequisite-patch-id: a0c7dcfc85a1eac4969530b73230f226006d6e1a
prerequisite-patch-id: 775709cdc871c90669902f9b431ac7b4f51408b5
-- 
2.35.1

