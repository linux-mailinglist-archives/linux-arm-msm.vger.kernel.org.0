Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49DCA537277
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 May 2022 22:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231710AbiE2U0m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 May 2022 16:26:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231578AbiE2U0k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 May 2022 16:26:40 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0F15626B
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 May 2022 13:26:35 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id e25so1581478wra.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 May 2022 13:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h8ru6+TUygsITuuMy5/fU0s1hgN1EJHJdiikz744dEY=;
        b=BV/wRTutp18iyRwJngQpHf66dQIc4xk8P8lL8rUQE27zJzvXhu5DxBlCtH+I8JyB6G
         xgIyGkBJ7pJc4c97UxXKih8tsrYm+CVt5UyPggSKMHZk1XowuAkwj7elJXS5yndSyTvc
         HIDk/d4i3+ciWZoBPJQwx29ZP9Rma7dGaqVcyFopybanzRRGnJ7Xvi91/wdAOWV8s9+c
         DpLOMNiiRkbLasG6Yp2qjryI8KKD1hgSTi2TLSMJBtGDPZWoK2L/4uTdEUsE97ITcs2K
         DoFaWiV2o0Po7V3RjoO0zGViHlr5FltffPXqZBsW2j1JQmpSjTr4FGjNzucVg+TxLiKt
         JtDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h8ru6+TUygsITuuMy5/fU0s1hgN1EJHJdiikz744dEY=;
        b=zLfSOzXupCmiEIv9OhAEFx05wfAQQOWmkF4vkKC5lO3imnskgYNEfk2/jSDTGvKEft
         H0omAcSB1dWPz9MNvod3wjnHsl9Lr4mqQqfSnkjW7MnQBBGFL9pIo2OPjdlqWkzCs1xk
         HWfnEBw0mbVJvNYGcBzFLpcljUU1Pi2dIZzPnC9A81FTqaYI7CHw1MFIxElJnH6CVaKD
         WHR9jDk84ZV7Dy3o7YDNbpqcI0kr3TioLTPbJE/Htqa4FTYy12cf3y0wTC9s8vO5U0x4
         Zw6T8UJcwI52yONyZXOwxCVRFHH5IX+5TEUhCfiGoNwJuRN2Q8zI9nfPKfN1qYc1776N
         Mi7w==
X-Gm-Message-State: AOAM531JQRc3u3hLlA0WuDmYSZ9qKF7kQnZMTrYXIvDIwzyLINk02GvL
        71oZ8MO/WabOF70OjSYHJ4CDLQ==
X-Google-Smtp-Source: ABdhPJwF3WjG8bKJP/LnrPfGtqIR6zFTacfn+stRp1U8CpS2jgaHGQDcas9p3pJQqDzFs6iTtmQJEw==
X-Received: by 2002:a5d:6b49:0:b0:20d:45a:98bd with SMTP id x9-20020a5d6b49000000b0020d045a98bdmr43230290wrw.446.1653855994099;
        Sun, 29 May 2022 13:26:34 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id y4-20020a5d6144000000b0020c5253d8f7sm7099310wrt.67.2022.05.29.13.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 13:26:33 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/4] dt-bindings: arm: qcom: qcom,board-id and qcom,msm-id
Date:   Sun, 29 May 2022 22:26:25 +0200
Message-Id: <20220529202629.47588-1-krzysztof.kozlowski@linaro.org>
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

Hi,

The discussion [1] brought several arguments for keeping the qcom,board-id and
qcom,msm-id properties.  Keeping means we should document them, so the DT
schema checks pass.

I revived old patch [2] with several changes and improvements.  The commit msg
hopefully collects feedback from the discussion.

Best regards,
Krzysztof

[1] https://lore.kernel.org/r/a3c932d1-a102-ce18-deea-18cbbd05ecab@linaro.org/
[2] https://lore.kernel.org/all/1425503602-24916-1-git-send-email-galak@codeaurora.org/

Krzysztof Kozlowski (4):
  dt-bindings: arm: qcom: document qcom,msm-id and qcom,board-id
  arm64: dts: qcom: msm8992-xiaomi-libra: split qcom,msm-id into tuples
  arm64: dts: qcom: msm8998-oneplus: split qcom,board-id into tuples
  arm64: dts: qcom: sdm845-oneplus: split qcom,board-id into tuples

 .../devicetree/bindings/arm/qcom.yaml         | 58 +++++++++++++++++++
 .../boot/dts/qcom/msm8992-xiaomi-libra.dts    |  2 +-
 .../dts/qcom/msm8998-oneplus-cheeseburger.dts |  2 +-
 .../dts/qcom/msm8998-oneplus-dumpling.dts     |  2 +-
 .../dts/qcom/sdm845-oneplus-enchilada.dts     |  2 +-
 .../boot/dts/qcom/sdm845-oneplus-fajita.dts   |  2 +-
 include/dt-bindings/arm/qcom,ids.h            | 30 ++++++++++
 7 files changed, 93 insertions(+), 5 deletions(-)
 create mode 100644 include/dt-bindings/arm/qcom,ids.h

-- 
2.34.1

