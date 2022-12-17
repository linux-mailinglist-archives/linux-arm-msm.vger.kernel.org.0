Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66FCB64F652
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 01:33:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbiLQAdy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Dec 2022 19:33:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbiLQAdx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Dec 2022 19:33:53 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1796C1C12F
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 16:33:52 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id bp15so5882375lfb.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 16:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jd/22C8WrHITw/9AXcZ7CiGGJpVrrQpDruTK7nco5dk=;
        b=J1b6WFR9JUq9MfAxVx2dbG9u6JM5ISZlH6iYlRWhEeQWkmj5X45FAubQjebFEhXMIv
         iBqgUd5bfx/xUnQwxLGDYH9mvMkZLh2L0aPGsWJrvpxO71mbWFPEsJJxJte7mT6xlE7F
         BYhhL9H4vyv9GpggqJn7Zf893uMSXxZGWLUQKNs4++uExW8YnPYtmp79xP7BBlUk0qf7
         M5+tIABJXbrzUMofEA9FBc7mRfEoyvaoTi26QAObrehThiaasIv3SJrCnNpEzr59h4a+
         sKV9OpTiKWn9bOsQniZ6CapYiVDVyQPuAT0hn2lrDCzCUoVWzZqd/g+w0DgXE5rHjQJ4
         XQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jd/22C8WrHITw/9AXcZ7CiGGJpVrrQpDruTK7nco5dk=;
        b=7yk6kmPlzn1jYH+1dMz7ZEp/Gs+dv7n5JG0f9exCA/lgp5eMM1jY33ErouH/gIjnDG
         nIsLteNfWvrifQ5f2d6AD7Qt8N8wensJiiLrQmgAoqcx4vtqX9cGTVawmyIlkhlKZdK2
         dzH7NwaRhIub5Zlvzjv97bMJ6+lYRmdna25mP8/91iL4FiAREQM37yuttP4cwO+QoV0t
         vnpI/NgZ6cGM0w2sVvugjJG1xgNxiDpxoB9y4cCG0kzcjO2CIaIJZpHFgtCzmKXJu0h8
         KCRUCCeMGHRgRgZZWJ4xmwuUYA6BAyfzUcXp3izene1JWz/CmtnhmkZIAwHSqniuk4Nk
         /XTA==
X-Gm-Message-State: ANoB5pmw02CkX9IFY+svs5yA8EH2ASH4y41xzvQcr+OIuFAiupPr709y
        LHNKZ89s9W+shlPzmy7QxnYPDA==
X-Google-Smtp-Source: AA0mqf49Fhbql0gCtnQkGmb/D6Lp3R1PhotfKhQfcicdlSCFa4KQYG8vauaV0nL5I5nl6Sh0CpJ5Gw==
X-Received: by 2002:a05:6512:169b:b0:4b4:9124:8aa6 with SMTP id bu27-20020a056512169b00b004b491248aa6mr13155615lfb.27.1671237230474;
        Fri, 16 Dec 2022 16:33:50 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id u12-20020ac258cc000000b00497b198987bsm351458lfo.26.2022.12.16.16.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 16:33:49 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/5] arm64: dts: qcom: sm8450-{hdk,qrd}: add PMICs support
Date:   Sat, 17 Dec 2022 02:33:44 +0200
Message-Id: <20221217003349.546852-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Now as the SPMI ARB v7 support is going to be merged for 6.2, it's time
to merge support for PMICs on SM8450-HDK and QRD boards.

Dependencies:
- https://lore.kernel.org/linux-arm-msm/20221213191036.611241-1-konrad.dybcio@linaro.org/

Dmitry Baryshkov (3):
  dt-bindings: mfd: qcom-spmi-pmic: add pm8450 entry
  arm64: dts: qcom: sm8450-qrd: add missing PMIC includes
  arm64: dts: qcom: sm8450-hdk: add missing PMIC includes

Vinod Koul (2):
  arm64: dts: qcom: sm8450-qrd: add pmic files
  arm64: dts: qcom: sm8450-hdk: add pmic files

 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts                   | 7 +++++++
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts                   | 7 +++++++
 3 files changed, 15 insertions(+)

-- 
2.35.1

