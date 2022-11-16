Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA1662B7C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 11:22:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236345AbiKPKWP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 05:22:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236162AbiKPKVw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 05:21:52 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2D0D20BCE
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:21:50 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id l39-20020a05600c1d2700b003cf93c8156dso1107938wms.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=Ch6qlE2H6eWivI1iYixGP1nvnJivcKTHhhIdL803mS4=;
        b=Gegj85974dHQ3ALoNF5h58og/vfKR+g6/c8piu1+PsjfFYhKrNaZHgaS0vgXeYHOah
         KNlliW3WFFMsuP3TApwszDH4uu3opAdPR57FktR9uch5icYp5Y/D4JHoJw8XBQfmzSTq
         tPGB2XDRMJLbX4/pRdsvYZ0QBPsiaKgBg7c39/89cj6eaFhsJM7M2VpdWHU9POoXRgVe
         Mxp83v2fCKfot0kXH9vQLEVTNiLFbWpSkRf8UlZyBK4N9ROlufuVF1KzBQbze/04nDSh
         2tsp54oZrbiL9A4sN7T39C5AxM6WzYIM68IqvmDNXdvsx2vjoEgzn0fMYH3iV5A+vSJ4
         050A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ch6qlE2H6eWivI1iYixGP1nvnJivcKTHhhIdL803mS4=;
        b=VcdEYK3EWt4HeSxuIqJ2b4Hi52U8bKZlQAq9GgcBDq5gRhGunjCy6DynTqy54tHmAx
         b2tHE4Tx9kzLm9ZU/5+JFQcFwbWgKcttXuTYhJihd0sthY3JAN9CYU0r5sGFGUpPxVpj
         Ssh3eWXl9rJ6dPn5/5BOhOefJzR5d2rx9drpLcm92lqSqSgH0fMeCmCD8NUx+4iVUj0/
         HBC2pGL/Zbp57bUesbEuEbmzjZ5xedSLeJv3VrxbBs+peqjFBrBWUdOTVdYafyQfijf1
         j1x+Wv8qRU5KQLj3pIo4l+w3rnAFB/Wpl24TMWmPKbBZbyqJcMOc+dqHHQ+FD8IaQytu
         s2Wg==
X-Gm-Message-State: ANoB5pkVrEhhZIAMrDZWyzh4pB9+CddxTLnLnjpIHrUo3A+QCG3g+NFz
        +be0176j6tmAF8MFRaETEifptw==
X-Google-Smtp-Source: AA0mqf4cINNrB95H2GFdZYu1GsZ6SkAk61zC6JdZ2bBVQkBeeoiArn90jUB7RR1wHvMj19nhZWFhuA==
X-Received: by 2002:a05:600c:2057:b0:3cf:6ab3:49ce with SMTP id p23-20020a05600c205700b003cf6ab349cemr1614164wmg.137.1668594109257;
        Wed, 16 Nov 2022 02:21:49 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id o5-20020a05600c510500b003b4ff30e566sm6133615wms.3.2022.11.16.02.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:21:48 -0800 (PST)
Subject: [PATCH 0/6] soc: qcom: add support for the I2C Master Hub
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIALu5dGMC/w3MwQ6DIAwA0F8xPa+JEIjb/qawTkikLq14Mf77OL7Lu8BYKxu8pwuUz2p1lwH3mC
 AXkpWxfobBz9475wIKabNDd1nR2jPGGftvmKlh9Rkb2cGKpScMgZZvcq+wRIbxJTLGpCS5jFH6tt33 HzZs0xGAAAAA
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 16 Nov 2022 11:21:47 +0100
Message-Id: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-0-64449106a148@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The I2C Master Hub is a stripped down version of the GENI Serial Engine
QUP Wrapper Controller but only supporting I2C serial engines without
DMA support.

The I2C Master Hub only supports a variant of the I2C serial engine with:
- a separate "core" clock
- no DMA support
- non discoverable fixed FIFO size

Since DMA isn't supported, the wrapper doesn't need the Master AHB clock
and the iommus property neither.

This patchset adds the bindings changes to the QUPv3 wrapper and I2C serial
element bindings to reflect the different resources requirements.

In order to reuse the QUPv3 wrapper and I2C serial element driver support,
the I2C Master Hub requirements are expressed in new desc structs passed
as device match data.

To: Andy Gross <agross@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@somainline.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

---
Neil Armstrong (6):
      dt-bindings: qcom: geni-se: document I2C Master Hub wrapper variant
      dt-bindings: i2c: qcom-geni: document I2C Master Hub serial I2C engine
      soc: qcom: geni-se: add desc struct to specify clocks from device match data
      soc: qcom: geni-se: add support for I2C Master Hub wrapper variant
      i2c: qcom-geni: add desc struct to prepare support for I2C Master Hub variant
      i2c: qcom-geni: add support for I2C Master Hub variant

 .../bindings/i2c/qcom,i2c-geni-qcom.yaml           | 61 ++++++++++++++++----
 .../devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 43 +++++++++++---
 drivers/i2c/busses/i2c-qcom-geni.c                 | 58 ++++++++++++++++++-
 drivers/soc/qcom/qcom-geni-se.c                    | 67 +++++++++++++++++-----
 4 files changed, 192 insertions(+), 37 deletions(-)
---
base-commit: 3c1f24109dfc4fb1a3730ed237e50183c6bb26b3
change-id: 20221114-narmstrong-sm8550-upstream-i2c-master-hub-44a7fb19475e

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>
