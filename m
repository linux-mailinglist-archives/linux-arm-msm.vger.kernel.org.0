Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 744CC6DA128
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Apr 2023 21:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbjDFT2Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Apr 2023 15:28:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjDFT2X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Apr 2023 15:28:23 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7137C3
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Apr 2023 12:28:21 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id h17so40557571wrt.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Apr 2023 12:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1680809300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hpBPje+E9IHKDOf6McIJVFqUlSNm+Dji5ABUuGNbQm8=;
        b=1dP+fXcLTJtFMNU4hcK5CosFll30DXs3LLqUQIfQNcS3ViTrdC9Z764eN2iGXGIpYd
         s0TPB0rCHcDigWHyRKzxg6gdEM0zQeG52hx86WgLE/SFmBv/R14oKr32HHYZrOiXw5aV
         8utbG48IzeWlWJWm1WOVVy3v/+7o9+ZqlguAyZ06/WkU5xsP3+/b/jp5Y97AOXVR23XJ
         MGvj5jNKM/XGnTj3mKyzV0rg8sTN8SthwBs9IKUDLn1Gb52qGEQJhLXOms4QW+a+/U94
         wzkPc9kYfzKom9STA6NcYHNXJ18kmKihmCdriQVvbjH2mXdJUgpYBaWgawPM+oPtV9ew
         hPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680809300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hpBPje+E9IHKDOf6McIJVFqUlSNm+Dji5ABUuGNbQm8=;
        b=q0e0L+/dXGZAQj8OV3egFZNGpMNlgjaGsSa2NokkVI9PWOQlNAipmo1nVM8CXjKAfq
         6p5TBrlYIun6qFA40OIOgKz6Ip9JzNrFldVbg7aBha26Pvu7BJOgOiH1PI804ytrtjWP
         hRX9T8Av4AzKQS7c/XZfCr7ZafeBcQzNzcF24uPX/7xUMZMZh3ORMbMfULsHor82c7Wu
         hmP6hpV2e0aVHtaaVkzZQtYmU6jCzInxruTFhakIVxjxryzcKHyA280JiBhg54TquOmd
         crFnE8SY+hyc6+Rfd+g5ZuIlJO+8A0wcD6z5h3BcRzmJKiYk8x6YmADUi2RwQdbhuyfj
         jKCg==
X-Gm-Message-State: AAQBX9fItE7zdQk/cPhRNDwn47YHTCmxW2sPsWr313KKJPz1w5AIl0f9
        Q8pZAmWVMrv9HTRDRv8N2u+TVw==
X-Google-Smtp-Source: AKy350Z8k7YKBSY9G4TVblTTGXSKyJ6Chr47NOE4k1PvRNox0TtyffoasuVO3CpoN0a6VUMw30VJ5Q==
X-Received: by 2002:adf:ebca:0:b0:2de:bb7c:ea16 with SMTP id v10-20020adfebca000000b002debb7cea16mr6833992wrn.37.1680809300142;
        Thu, 06 Apr 2023 12:28:20 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4793:cb9a:340b:2f72])
        by smtp.gmail.com with ESMTPSA id c11-20020adfe74b000000b002d89e113691sm2489321wrn.52.2023.04.06.12.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 12:28:19 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 0/3] arm64: qcom: add PMIC regulators for sa8775p
Date:   Thu,  6 Apr 2023 21:28:08 +0200
Message-Id: <20230406192811.460888-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Here are the remaining patches from the big PMIC series that add the DT
bindings for RPMH regulators for SA8775P platforms, implement relevant
support in the driver and add the regulator nodes to the sa8775p-ride
board .dts.

Since the first submission:
- the DT bindings now contain the missing supply properties
- the ldo8 min voltage has been increased

Bartosz Golaszewski (3):
  dt-bindings: regulator: qcom,rpmh: add compatible for pmm8654au RPMH
  regulator: qcom-rpmh: add support for pmm8654au regulators
  arm64: dts: qcom: sa8775p-ride: add PMIC regulators

 .../regulator/qcom,rpmh-regulator.yaml        |  17 ++
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts     | 233 ++++++++++++++++++
 drivers/regulator/qcom-rpmh-regulator.c       |  55 +++++
 3 files changed, 305 insertions(+)

-- 
2.37.2

