Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27A794EFAC5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Apr 2022 22:11:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351700AbiDAUMh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Apr 2022 16:12:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351695AbiDAUMg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Apr 2022 16:12:36 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA1B5215478
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Apr 2022 13:10:45 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id w25so4206134edi.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Apr 2022 13:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vZSpTcuUm8K1XcOnNjGfRvdX99iMAx27okwDjYgvL64=;
        b=s514l3cehwTECRMHAc4oVh8Lhac5rDM7VsZkihN1to6DI5SOrc/DmRwA66MZNpOGeN
         z1KAOi70gQsdnwn1BEUXtd9eMOSfcgdFjNyWXQtXFuyGKJVi/EsXwNDusRU2WBZe7+5g
         BA2+5Zcbv+WHmg0p4cGHgSSpNcsXZKxlRVnBCrVfRNwLvwbva71VHr7yFlMEDcVb++c2
         3B0VR371koPWu9tIs2/3ZTl73e5UoamFfqj79J2QMgmNtJENQWj/wYjczFyKAkRQ0sfG
         uSIkn0cy5+Ty7wxteoxqdbE3chIr0GYBJK7unkvRWSRhjN5Kxm8xBJOBuEOrhLyDPBVL
         fURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vZSpTcuUm8K1XcOnNjGfRvdX99iMAx27okwDjYgvL64=;
        b=pd/Wh97X1nEmItnCVGGdI/DMT+N1TIQEiC8wfvg0jVAI7OZbXojvJZTI6cqGhg3FBA
         8yox8duiMPQ4A78+22YEOL3er/w15sbStFbOVdrmi2H7KV8jiIt/pRfRO1i72PEK66ey
         tzlfHYZwAHDp3CJ2VtfQ7ckQ0XMBQi+DTBLDMleseEROz9mpLupGDRBzg9cIEc5/kVvJ
         ml12gaeJ9kBoSLKB4GUPJaXiu0UN3GE5J7+bJp7GRzG2ZlRmO8OEOU+cp7XzpBGt38Iq
         noHRq1PZbNSPZ8WqHjYk8qxnhJcMUtM4n5x9wvQzCT8szFhyCt+A/vMvXyPgObQvvD7G
         PieQ==
X-Gm-Message-State: AOAM532iEpUfhN4Ewo0zaXP5kB7yCfg+uIyweNViJ/0WxfQzpD40YJww
        y4SeFsqY+hi1VYA9J5OfPTw0Xw==
X-Google-Smtp-Source: ABdhPJyu5vqa1NpW1FvnOrBS6maT+upb58FT6mJWm3l3rhXpz0gVmoF9622SkOdt3PUlF4HSdh1GuA==
X-Received: by 2002:aa7:da81:0:b0:419:11e8:1039 with SMTP id q1-20020aa7da81000000b0041911e81039mr22622742eds.285.1648843844267;
        Fri, 01 Apr 2022 13:10:44 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id bx5-20020a0564020b4500b00418fca53406sm1509041edb.27.2022.04.01.13.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 13:10:42 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 02/10] arm64: dts: qcom: msm8994: remove SMD qcom,local-pid property
Date:   Fri,  1 Apr 2022 22:10:27 +0200
Message-Id: <20220401201035.189106-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220401201035.189106-1-krzysztof.kozlowski@linaro.org>
References: <20220401201035.189106-1-krzysztof.kozlowski@linaro.org>
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

The Qualcomm SMD does not use qcom,local-pid property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 8c1dc5155b71..1ff7e2c03ce3 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -233,7 +233,6 @@ rpm {
 			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
 			qcom,ipc = <&apcs 8 0>;
 			qcom,smd-edge = <15>;
-			qcom,local-pid = <0>;
 			qcom,remote-pid = <6>;
 
 			rpm_requests: rpm-requests {
-- 
2.32.0

