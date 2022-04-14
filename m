Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6B13501D79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Apr 2022 23:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346102AbiDNVeS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Apr 2022 17:34:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345625AbiDNVeR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Apr 2022 17:34:17 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 959042E682
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 14:31:51 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id c12so5750112plr.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 14:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tgK86hMG//HjfRr9J5TwzgXURgYX1s8RvV8/jTvjJYw=;
        b=YN3OVTQL8wtJWgsUgLD1/s3/NtlwJPIYw5qezMLHAXOyRjBYCcewUPYCgLhO7alpbP
         AOtcg8+0Pqksl8l8ezIrKM8G6UyaJ/Aogz8EYeSOZbX1sfQIDaCnCPLInwX9+F0OnXS3
         A3Mn7KodlK3jPPdJon2blcRiw7xfl9E86Lczx5dvlod2ueoHLUSi0UzVGLrI/F6KKGBt
         buoC8oui8cD86jyJQJvI1EjnqZPMwxsgNCo88hYFptVqUEZJNozyaMPhfHQCggK4K67g
         lXUit/i3AOyy/UvGb6GWNo/nTqxBahLOPr7bLeT3YbLLiM32D9Q34D1Q7Ax1lFBXGS6v
         F0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tgK86hMG//HjfRr9J5TwzgXURgYX1s8RvV8/jTvjJYw=;
        b=6SHYGNGk2ugGTeXUNpetrnS8mlDcwTAjauorVOyKVyGkRH/fdq7RKceEQgraF1MCZt
         oPhX7WG0GNOqA/YjVnaKvbOmJ5YtYrBxvfpgd0UzMp2P5IUEYo6o4CfN+Q6VSUje9hAr
         wzaW6ooMlX/BmHZwLctAYTq6jZi47dC2Rhsg25Wf4K5uhTqfVbkaR01HEUtiloFlDwjL
         pZ/ZycX8BsxjXsIF1QTN+9CjWF7IhZADVqd+rzIGGb28CsiNrWrgpHJUX4qaJ57L9FUT
         ZuLNwLYo20ue8l2H/Q2Sc7Wnw9CqxaAF1zLnAdzpFG5IN7SEQnnv8FGxOrGBqRZfzkC9
         1hug==
X-Gm-Message-State: AOAM531zxEgf1hIygOVKRVXOuaC8ff8vr4FSsayEeqYyxiZfNJltuT96
        kFG/PRCTgKOVx0JoWOf9whiH0v17jx9v3w==
X-Google-Smtp-Source: ABdhPJxJlElCuqPlYrpiKX7K8Z+B9LpesYf90WrnsrpSabzgcIMmc2ZEW/cyieCHqlD4vlTe0A7+Dw==
X-Received: by 2002:a17:90a:e7cf:b0:1cd:3eb9:ce79 with SMTP id kb15-20020a17090ae7cf00b001cd3eb9ce79mr589946pjb.88.1649971910824;
        Thu, 14 Apr 2022 14:31:50 -0700 (PDT)
Received: from localhost.localdomain ([223.233.64.97])
        by smtp.gmail.com with ESMTPSA id 5-20020a631045000000b0039d942d18f0sm2673706pgq.48.2022.04.14.14.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 14:31:50 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        bjorn.andersson@linaro.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 0/2] arm64: dts/qcom: Enable uSD card support for SA8155p-ADP board
Date:   Fri, 15 Apr 2022 03:01:37 +0530
Message-Id: <20220414213139.476240-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Changes since v1:
-----------------
- v1 can be seen here: https://lore.kernel.org/linux-arm-msm/20220403144151.92572-1-bhupesh.sharma@linaro.org/
- Fixed the IOMMU sid value, to ensure that no ADMA error is observed
  when the microSD card is detected on the board.

This patchset enables the microSD card support for SA8155p-ADP board
via the SDHC2 controller found on the SoC.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh@kernel.org>

Bhupesh Sharma (2):
  arm64: dts: qcom: sm8150: Add support for SDC2
  arm64: dts: qcom: sa8155p-adp: Add support for uSD card

 arch/arm64/boot/dts/qcom/sa8155p-adp.dts | 68 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi     | 45 ++++++++++++++++
 2 files changed, 113 insertions(+)

-- 
2.35.1

