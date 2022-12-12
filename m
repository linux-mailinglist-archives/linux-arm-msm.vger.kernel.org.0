Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1C50649D40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 12:16:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232048AbiLLLQo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 06:16:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231742AbiLLLQP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 06:16:15 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD402DDB
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 03:10:46 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id b13so17965203lfo.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 03:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=erkfVo9De5Tzxsulwp0pwt0Zyb1o2nyIpSq2ceHJRrM=;
        b=q6ujZj6YVcQUo0nwt/V+fhx5M8w4G/NrpHonHQ3B0aLFdyURKvRaj1kLcnra7e5o4Q
         xIxkR0sMpEAPhDKYD8LEJfBaQfG6l5GMdbf5JbArUxoqygUKXCc2AJFRemK+CP44yCgk
         cPzEU4nY8Cgx/hqRiqW8Fg4j5J3VCAPIaOHvSLAQ/Kn0bOkTmJFLIq+HzSJxbCf7IbA5
         /p5XCk31cTIYhEIreuI0RqQI6mU2p24n6pWxSIMR105Cr2/U09iKrN5yrvM+7Yuw46m+
         stLdaW/cCu+tgbH0bNDOIlnA++wSTs09B116/Nrz5Ssx1mVlVF1ttOVEW8Od979I9/GQ
         DI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=erkfVo9De5Tzxsulwp0pwt0Zyb1o2nyIpSq2ceHJRrM=;
        b=ePpwwKHCI26gwY/bIkXs5AMhKzgyW7vN0qScbO+PQicojC/S0ZBRNZVrJt42XoS+a3
         w/UH5McTmjeE649tP9+zBA1pjxPoZBvCMLxkasqJk/carwmQHhzkuokOvzl3/pvmp5x3
         6E/rPSYzkTMRAnkoJX+d5DmEBFB6DOnRmlrib+UB2m1a112equH/Js7nheMUtgho1bdI
         pbNl8pECQbTz/G4sSXvOB3Pb3QlKAH6DYFLlXQo3dfk4iTEBp3vw468U2uqn5U/OMP5B
         /8FCd85GVlDnlIZrczzzKc5AvMj/m7sz4fCQTeZrvikPiFetmqVV6FqTqUxKItf30mZJ
         9KoQ==
X-Gm-Message-State: ANoB5pmfDDK/CBc6Jdr83xgN/Xca97KnMN7a2s84kmRDq1RDWsKJL9/d
        BS4CtrMl+j3k62WJem0XR1iCNYFKjBvdNcp5
X-Google-Smtp-Source: AA0mqf5tV8Hcyxf3GyZLEoHhfGVcem7cmR5cBmHGwTOoicfxtOLyX9xxsQTSIWIQYvxfVZV8oFCdhQ==
X-Received: by 2002:a05:6512:746:b0:4a4:68b8:f4d1 with SMTP id c6-20020a056512074600b004a468b8f4d1mr3849495lfs.23.1670843445012;
        Mon, 12 Dec 2022 03:10:45 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id b4-20020a056512060400b004b57a810e09sm1599110lfe.288.2022.12.12.03.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 03:10:44 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/9] Lowercase hexification of arm64/dts/qcom
Date:   Mon, 12 Dec 2022 12:10:28 +0100
Message-Id: <20221212111037.98160-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.38.1
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

Almost all device trees use lowercase hex, fix up the remaining ones to
match the style and prevent introduction of more uppercase hex from
copypasting and referencing.

Konrad Dybcio (9):
  arm64: dts: qcom: ipq6018: Use lowercase hex
  arm64: dts: qcom: msm8996: Use lowercase hex
  arm64: dts: qcom: msm8998: Use lowercase hex
  arm64: dts: qcom: sdm630: Use lowercase hex
  arm64: dts: qcom: sdm660: Use lowercase hex
  arm64: dts: qcom: sdm845: Use lowercase hex
  arm64: dts: qcom: sm8250: Use lowercase hex
  arm64: dts: qcom: sm8150: Use lowercase hex
  arm64: dts: qcom: sdm845: Fix some whitespace/newlines

 arch/arm64/boot/dts/qcom/ipq6018.dtsi         |  8 ++---
 .../boot/dts/qcom/msm8996-xiaomi-gemini.dts   |  4 +--
 arch/arm64/boot/dts/qcom/msm8996.dtsi         | 12 +++----
 arch/arm64/boot/dts/qcom/msm8998.dtsi         | 14 ++++----
 arch/arm64/boot/dts/qcom/sdm630.dtsi          | 16 ++++-----
 arch/arm64/boot/dts/qcom/sdm660.dtsi          | 14 ++++----
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  8 ++---
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 34 +++++++++----------
 9 files changed, 55 insertions(+), 57 deletions(-)

-- 
2.38.1

