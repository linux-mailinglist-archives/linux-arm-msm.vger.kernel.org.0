Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D557728085
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jun 2023 14:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236569AbjFHMx3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jun 2023 08:53:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236534AbjFHMx1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jun 2023 08:53:27 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4FFD2D76
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jun 2023 05:53:20 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f732d37d7bso3680335e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jun 2023 05:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686228799; x=1688820799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QQqUodnKFRw5PuAn21ea5xgnb65xZ+y7rpLRNAHSBq0=;
        b=QARtFkl3BE7pv0WEI9bFBrivf3G3ykvKP6HcVtAaKp7FW1zn+ez91HsWbb4gcuR5Ky
         RfFFdspFIb+3wCKDqFS64Hc+PvfsN3mM3Jr1S72xl97mQA6j/X2/tX+Gqombh8PmSKLh
         3RH+enwKKNPsKb0N48d5ULAyacpWwDviKbopWQ4iNsLvrIStbOdTsh46TMZMVu0r6xvq
         CUAONNr824F+e5kIObinwqNt/VuKzRvpY/sjdWzNKi/52FQfRBfkz/uRxLUrPyJIQJCe
         W872jVlnM+QkP/tSxOGAboG9PwkG3E5IPuq0yEn50zJgjL2oujbA/TJGZ66G2GCGhumC
         PdfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686228799; x=1688820799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QQqUodnKFRw5PuAn21ea5xgnb65xZ+y7rpLRNAHSBq0=;
        b=jXvw6PB6wVleqIk5C4/2VlBRmHVwI48YlxIAN9oNyrgqHGtMm9lZj49VqETpAr343j
         uYW4yVf6ZBzxyWOiNNGl+i84bk867o3RBj86pREQEPR0mXuOZWOsdep5AJxg4DcGAxSq
         iC63UxdiTNElKXSGa79oo2wrZrD3VaKfaRYzgPORZVbAl4GX/38hsKdWMl6Mi+d/nbEK
         UjAG5rIvf56vujOyRHkxHMT6j8Adc6AgkNSKvHKdLUYdIQ2gdl0+ef7XbBsqRUwv4or1
         zzS40FrZNeVU7Pmvf3gZrum6i7i4dWukvp6UBBiuliB92jmIg4JL/GW3jjmy75hB3Uxe
         nQ9w==
X-Gm-Message-State: AC+VfDxRox8E+ByT5ItYGRd3bcvP2JuXa3CGPVtKyH9l+7xyAetye7IU
        T3tv/3PerjbIa+P/ec0OWo5t9w==
X-Google-Smtp-Source: ACHHUZ4ru1zt3M7bVlzAGdqtRefGHALasJmz6KndsByVBcsJZDFjMn5AzZvwh1kkEygV4dHKKqhlMw==
X-Received: by 2002:a7b:cbc6:0:b0:3f6:2ee:6993 with SMTP id n6-20020a7bcbc6000000b003f602ee6993mr1538418wmi.4.1686228799390;
        Thu, 08 Jun 2023 05:53:19 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id m22-20020a7bce16000000b003f7e4d143cfsm1894032wmc.15.2023.06.08.05.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 05:53:18 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     johan+linaro@kernel.org, agross@kernel.org,
        konrad.dybcio@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 0/6] clk: qcom: sc8280xp: add lpasscc reset control
Date:   Thu,  8 Jun 2023 13:53:09 +0100
Message-Id: <20230608125315.11454-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
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

On SC8280XP, LPASS IP is controlled by q6dsp, however the reset lines
required by some of the IPs like Soundwire still need to be programmed from
Apps processor. This patchset adds support to reset controller on LPASS
CC and LPASS AudioCC.

Tested on X13s.

Thanks,
Srini

Changes since v2:
	- removed qcom,adsp-pil-mode bindings, can be added when
	 we have a variant of this SoC without dsp control
	- added compile check in Kconfig
	- fix variable naming to reflect correct cc.
	- few minor style related changes

Srinivas Kandagatla (6):
  dt-bindings: clock: Add LPASSCC and reset controller for SC8280XP
  dt-bindings: clock: Add LPASS AUDIOCC and reset controller for
    SC8280XP
  clk: qcom: Add lpass clock controller driver for SC8280XP
  clk: qcom: Add lpass audio clock controller driver for SC8280XP
  arm64: dts: qcom: sc8280xp: add resets for soundwire controllers
  arm64: defconfig: Enable sc828x0xp lpasscc clock controller

 .../bindings/clock/qcom,sc8280xp-lpasscc.yaml | 60 +++++++++++++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 21 +++++
 arch/arm64/configs/defconfig                  |  1 +
 drivers/clk/qcom/Kconfig                      |  9 ++
 drivers/clk/qcom/Makefile                     |  1 +
 drivers/clk/qcom/lpasscc-sc8280xp.c           | 87 +++++++++++++++++++
 .../dt-bindings/clock/qcom,sc8280xp-lpasscc.h | 17 ++++
 7 files changed, 196 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
 create mode 100644 drivers/clk/qcom/lpasscc-sc8280xp.c
 create mode 100644 include/dt-bindings/clock/qcom,sc8280xp-lpasscc.h

-- 
2.25.1

