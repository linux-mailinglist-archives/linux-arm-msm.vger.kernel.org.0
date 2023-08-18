Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AEDE780F08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Aug 2023 17:24:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378123AbjHRPX5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Aug 2023 11:23:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377962AbjHRPXv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Aug 2023 11:23:51 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA8233C1F
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Aug 2023 08:23:49 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b9a2033978so15939711fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Aug 2023 08:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692372228; x=1692977028;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dIIcxuAFlx9aKs7Cl7Yl1eDvCrH/6fa/raCeERHWYVE=;
        b=CAUxaecAh7++RhSd0uSyMCt9cmkLu6U1lusWQ45opS3vkU6mp1In+zYTdEjApMTNMl
         1tQ7trWYDNqj3fKPxGTC0VPbpV+D1CxE7p9j0wPnr48kxA3S2FCRxtG1loy0tBxUnljG
         Jvxp3HajD5Z4enZEproAurNlCbIiYA1rhb2jWzzsViWs4dpt0cs0o1JZdMZHE9nbX3ZB
         JdkcBq8AMx2tExbz3l6zF+cWtTPhG6oPCZosttxMdsYSb/EnY/XpRYgTYrueDttGWwrO
         QOMHB7Jq2PLOHN7V6buhsoqG8xtPMPeN4sanx8stUOB2GBwBJ0t7LXBuO+uyq0F7YITM
         RRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692372228; x=1692977028;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dIIcxuAFlx9aKs7Cl7Yl1eDvCrH/6fa/raCeERHWYVE=;
        b=Ax2YPqlXDaGwRJq0D//xbBsbrCirOE47lQtKZe+ECxcGrpkKgm+SX/vSp13QOKPjx6
         gTEleSWOWmuPwf69RYaiuQhQbQ9FPOubbn0obgjnTHSeSCFcp9Ro8NPO5JOCbqnKL47a
         X2ubMrQKK6EJg6EMDM3GzthdJKs9s3BEDRP3Ijr6u3JBUdAzEeiffvxFo7DFUV9ScuCq
         mlOOujDOTtzgMTAR0uZMcoEiGQODmplNaamJQti58ckocdU5u8zHflB/2jzYMobcZcfM
         AH9bix+wf7Wcj928X0P64ami4u50n/5W4+tY/bNCoAH8wIgVy3zgdItl3hkUpYxMDSaf
         zW3A==
X-Gm-Message-State: AOJu0Yw3qJG1LRPkDro/Nn/VTRYS3W6ANJLws7AyApleQuhjULfSM2Lx
        4rJeuj5Yh9ZcREDvA05aGQvATw==
X-Google-Smtp-Source: AGHT+IHcOAgqi0DbvVWG2679OAf/dVwZshTIEbHUxcjcL9zp0fNGpOjrzec/v1MxyQdD1Tj8m2SpRg==
X-Received: by 2002:a05:6512:2243:b0:4ff:8f45:677a with SMTP id i3-20020a056512224300b004ff8f45677amr2635386lfu.51.1692372227774;
        Fri, 18 Aug 2023 08:23:47 -0700 (PDT)
Received: from [192.168.1.101] (abxh52.neoplus.adsl.tpnet.pl. [83.9.1.52])
        by smtp.gmail.com with ESMTPSA id y2-20020ac24202000000b004fe4d122a66sm383715lfh.187.2023.08.18.08.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 08:23:47 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/5] Xperia 10 V support
Date:   Fri, 18 Aug 2023 17:23:23 +0200
Message-Id: <20230818-topic-10v-v1-0-dbb6464223c6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOuM32QC/x2NSwqAMAwFryJZG2jrB/Eq4qLGqAGp0qoI4t0NL
 ucxj3kgcRRO0GYPRL4kyRYUbJ4BLT7MjDIqgzOuMI1t8Nh2IbTmQkNU1Tx5HksH6g8+MQ7RB1r
 0Ec511XGPPMn9B7r+fT9WeKGCcAAAAA==
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-hardening@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692372226; l=1108;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=h39Fv6t1ifFMpAjhSmArTsFTxZXueMRnwkKIjDcqYDs=;
 b=/mFQLKpXRMGPCWUbSTyxCkB0b6DtLWHPg6Jhycfq6B1w/zr4Su9S8oz6JZsjnm126selNuCkP
 FiFkBgahbCFBgf53h3Wx24uennBg3FKnfOCHpyUmTK6CYBXvw7BWs2U
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series brings support for the new Sony Xperia 10 V and with it a
couple of improvements to sm6375.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (5):
      dt-bindings: qcom: Add Sony Xperia 10 V
      arm64: dts: qcom: sm6375: Fix I2C10 GPIO function
      arm64: dts: qcom: sm6375: Hook up I2C7 GPIOs
      arm64: dts: qcom: sm6375-murray: Separate out common parts
      arm64: dts: qcom: Add Sony Xperia 10 V (PDX235) support

 Documentation/devicetree/bindings/arm/qcom.yaml    |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../dts/qcom/sm6375-sony-xperia-murray-pdx225.dts  | 421 +-------------------
 .../dts/qcom/sm6375-sony-xperia-murray-pdx235.dts  |  54 +++
 .../boot/dts/qcom/sm6375-sony-xperia-murray.dtsi   | 427 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm6375.dtsi               |  11 +-
 6 files changed, 495 insertions(+), 421 deletions(-)
---
base-commit: 7271b2a530428b879443b274c191b34536a4ea11
change-id: 20230818-topic-10v-0cc56efaed42

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

