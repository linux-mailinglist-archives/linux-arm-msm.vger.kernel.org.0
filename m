Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 444DF6B04B9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 11:40:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbjCHKkU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 05:40:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbjCHKkT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 05:40:19 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72BF99DE15
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 02:40:17 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id l7-20020a05600c1d0700b003eb5e6d906bso831163wms.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 02:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678272016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NuXf3qcdLoRKFYAi7wFYWNuVj8BPbd9z/6kD6caVGIg=;
        b=5C2/LiaFtyBREM0JKDYWoNNVB0qyOVdu3+HWqwuEmRi9luVy+Tb8FlJGMh529yIb6a
         B1u20kfEWf34yjdQu0vAh8P94GiqO7uoClkfIRpGnrrqMhDTMs+1dalCCTWF3/fpiNuq
         OsOCSnPGMTfqSwEJxljS4tNsrKXr7B9sCvKFTF8L4Gv3o03aakCCcCktX59/HzeIIoBv
         sMUjU2POXr4ikDUM+fNl/4IvcrKbQJMy1fadFOU5NbgXJhSy8K7qZeQszP+EiopswKUt
         IUmNtZmxDrHBHkEMxmx5iRiKXMEIzaYwu57EDLYUnxlQ6b502yJ7Rf6xXIL575QpRNXq
         pzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678272016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NuXf3qcdLoRKFYAi7wFYWNuVj8BPbd9z/6kD6caVGIg=;
        b=jAvjXwTGAq4T8g3cyKZPC/Ixgd3YalZKWF9NCxFAW67wqzU6Z4zblF5rb+0945TENk
         q1WEPGSRkTFyNNuOb53sNGX06woQkJTM1EUx0nPMI3qYsSGIa8iW7t094EUzL2mwmT81
         KHMyOwIhtatNXuY6zZgvpf6kaKWRrOnHl6lxO2+RGKUP4NJvazWM+TVvwCAOVGx6+/Vz
         ca3DtYsRDRLGTTF5GVsgG321ep4MkOrml+d3dGmyjn9nsFGht35eXbaTbLPp93CvrJa4
         2aBQKubJqTr7tVGKIXUEaZjAG8A2wWNdj47KGU2FGg93N1kOqz47ZkdKelEPJnj3E2bm
         FwNA==
X-Gm-Message-State: AO0yUKWc9mq48ILGilXVGWN4yyHVhBHqfvpNeMSfcxIYFnI/djwX3Uxt
        PlyEFgqKtf88K1XhJ81UJgAL7Q==
X-Google-Smtp-Source: AK7set88f9VDY6OD221xEGqrJMUuKOEV9ESLdXbIpXkTqVnktny20FFDQ9dOQeDTodNGIYCG6iJazw==
X-Received: by 2002:a05:600c:3512:b0:3ea:e554:7815 with SMTP id h18-20020a05600c351200b003eae5547815mr16735930wmq.9.1678272015962;
        Wed, 08 Mar 2023 02:40:15 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:2326:fd4c:82e3:7e07])
        by smtp.gmail.com with ESMTPSA id v7-20020a05600c444700b003eb0d6f48f3sm20664135wmn.27.2023.03.08.02.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 02:40:15 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v4 2/9] arm64: dts: qcom: sa8775p-ride: enable QUPv3 #2
Date:   Wed,  8 Mar 2023 11:40:02 +0100
Message-Id: <20230308104009.260451-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230308104009.260451-1-brgl@bgdev.pl>
References: <20230308104009.260451-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Enable the second instance of the QUPv3 engine on the sa8775p-ride board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index 3adf7349f4e5..a538bb79c04a 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -24,6 +24,10 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&qupv3_id_2 {
+	status = "okay";
+};
+
 &sleep_clk {
 	clock-frequency = <32764>;
 };
-- 
2.37.2

