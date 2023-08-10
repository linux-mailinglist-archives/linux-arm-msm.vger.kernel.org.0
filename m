Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7A8D777231
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Aug 2023 10:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233948AbjHJIJZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Aug 2023 04:09:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233428AbjHJIJS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Aug 2023 04:09:18 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36E9C1703
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Aug 2023 01:09:18 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fe12820bffso5053185e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Aug 2023 01:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691654957; x=1692259757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7i/SrZF+jY6u1jae550/qtxZRbJK0LYhJpc6f9zoYy0=;
        b=TSkZ/z19Ewdl3ii6ZrEpjy0SNsDYae+B7yxQS8iwRCi1WEu2S+GgYSD4gR0F7PXXyS
         JPZ+CZ58O4/ChchZJF6+bT7dYKRFqgJWnxq1w18KrL6Cd1ypmiU06phL3s+ye7RWoNIP
         iy8lqyG/45vIMyiZwX4JBx6/XUSY255F6HIldfVQC/o5uZHIUVKdXuTXR3peA984D8SC
         THWVHrngTGtBG9wISwBKfWv59BFyZtf/CBPCTUIoBAepxec30C1feXqhyl9yKZIebBmY
         UNvtdgdYEe4JgwO2qZp5Wc0qjxUByJDLSsF/LnFtMxenYNP6QuCmOCtt8L1GtqsizFPS
         /+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691654957; x=1692259757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7i/SrZF+jY6u1jae550/qtxZRbJK0LYhJpc6f9zoYy0=;
        b=dc98hZVaDxBTlGKUeHaM9uf3dZ79CTHRza/7bWMvGJ0bBympEzEZPeBpNKdoAlMEbW
         9V5NXxMGYjssUgg8pOUqp40GrRp2Rm8+duJ+XZYAdbCsXIBoN1UUNJvrTpGVXo7Iidan
         Qms2Y6wpLDt9tm2CR1A6WPljoboiX4hUcQjz7tJdH/JlK1ooD10+5nRMEkYstJFqDi76
         zWw2kRI49Ujgs+ekROBzivsWGb9HopYvxIqWGkcUsL/N2GtAFvGbewZbrrDNaQfmQ5ZS
         +e4B16QnH7R53iW5pajv1qt7jvBdsoO5x5msm9jkQ/KrJfCRmEpmX1wFkUXeuvNC/VvJ
         nwBg==
X-Gm-Message-State: AOJu0YwBmnpQeIdsozsugQN9mckGKUwL1euT7NjWt/dAc5D8lNzhwJIL
        1ieCjBT899wr1tHHEWRinbZVFg==
X-Google-Smtp-Source: AGHT+IFXte2Z3OPC0mOtun/00VY/jOftBufylvOjCscAxfiFS59vQyoj6n4WvAWwPTvqANfIkD47LA==
X-Received: by 2002:a7b:ce0b:0:b0:3fe:3004:1ffd with SMTP id m11-20020a7bce0b000000b003fe30041ffdmr1291842wmc.4.1691654956853;
        Thu, 10 Aug 2023 01:09:16 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:74d3:226a:31b3:454c])
        by smtp.gmail.com with ESMTPSA id y10-20020a1c4b0a000000b003fe2f3a89d4sm1321790wma.7.2023.08.10.01.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 01:09:16 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Andrew Halaney <ahalaney@redhat.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 3/9] arm64: dts: qcom: sa8775p-ride: enable the second SerDes PHY
Date:   Thu, 10 Aug 2023 10:09:03 +0200
Message-Id: <20230810080909.6259-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230810080909.6259-1-brgl@bgdev.pl>
References: <20230810080909.6259-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Enable the second SerDes PHY on sa8775p-ride development board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index ed76680410b4..09ae6e153282 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -448,6 +448,11 @@ &serdes0 {
 	status = "okay";
 };
 
+&serdes1 {
+	phy-supply = <&vreg_l5a>;
+	status = "okay";
+};
+
 &sleep_clk {
 	clock-frequency = <32764>;
 };
-- 
2.39.2

