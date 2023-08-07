Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA3CB772ED1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Aug 2023 21:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbjHGTff (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Aug 2023 15:35:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231287AbjHGTf3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Aug 2023 15:35:29 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6560E1717
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Aug 2023 12:35:27 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fe1a17f983so41422825e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Aug 2023 12:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691436926; x=1692041726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ax25duHjLdzKclyMlTxg4GcFYeJzfTNxi5ZLtlLDbIg=;
        b=ZumY+tdahtr1PmIS0adLU26o1F42reZMLaHKXypPRpabjftIF6s8YQFXfMd13B2Z1j
         V3OQsP/bLTIWpAYrdA0UCdKKgpHSMt4CWlyzyjwqEuP+Nilyl4XRTcBbZvOsOdMCYxAN
         4/TcWJD2MXPPymfXwwzh+tQUDbQuXre1EOL5hpo8K++31MHzgVgMypbZBqwVKSeF1UZP
         +wRZdYAkAoigj9Zbh57rTRJ4HlEFMdRdD5wAKSJEJg2kbBOqHNtGco8tDnlUBBUbK0Xv
         yA6PtKmO7hUSUFxf41C3GL8iHCvo/22g+7A35xDPBiNN9my/7coKsxkSIDl5+BtNxMxE
         t+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691436926; x=1692041726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ax25duHjLdzKclyMlTxg4GcFYeJzfTNxi5ZLtlLDbIg=;
        b=kQ7wKgCDgIjjeUQoCu6/WKpPH4SeHVHYkBny1ejhA5O/6+GxvVq5vuGxR2AvIet2mP
         VAkRwZ2NL3w1PuvIlBoMgBdaULWshRD5CpVcimpSJdtFTajaFkfl5iLWo2FRy1J/b+B6
         rZSiitCIsAQKqF1dJwS5+DkjHoVQYkFltY5IGRF4YgZvbgjLv8lxO4M85/CiFVcrFWMI
         OQXmHcEeWUhabQLzsUojyithlhz5xEtDywWw5gp/j7jqH2X2imCqX0kfeVs2THVn3HKr
         ap3Vv2Naub5Hi7qqBOiostlASEZb/mHLwWXXERWIvoQZjtdK5O5Klib+iyCirjspeL60
         t7eQ==
X-Gm-Message-State: AOJu0YxteHs4iJIPEieaRRGQXitHj4QO4e6swL7ZBTn+hEEPKCk6GYb5
        tPov1oT9Kum5vslkbXGxbAr+1A==
X-Google-Smtp-Source: AGHT+IGdW233kuzoYPUE4fsHAXxQANok0ofamdCFAYQGrIezEoqcBmm1AOt8GZip6akszv2DcxtBlA==
X-Received: by 2002:a7b:cd19:0:b0:3fe:16c8:65fa with SMTP id f25-20020a7bcd19000000b003fe16c865famr6536205wmj.4.1691436925915;
        Mon, 07 Aug 2023 12:35:25 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:b3d6:9e6:79d9:37cd])
        by smtp.gmail.com with ESMTPSA id q9-20020a1ce909000000b003fc04d13242sm16061488wmc.0.2023.08.07.12.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 12:35:25 -0700 (PDT)
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
Subject: [PATCH 7/9] arm64: dts: qcom: sa8775p-ride: add the second SGMII PHY
Date:   Mon,  7 Aug 2023 21:35:05 +0200
Message-Id: <20230807193507.6488-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807193507.6488-1-brgl@bgdev.pl>
References: <20230807193507.6488-1-brgl@bgdev.pl>
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

Add a second SGMII PHY that will be used by EMAC1 on sa8775p-ride.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index 55feaac7fa1b..5b48066f312a 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -286,6 +286,14 @@ sgmii_phy0: phy@8 {
 			reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
 			reset-deassert-us = <70000>;
 		};
+
+		sgmii_phy1: phy@a {
+			compatible = "ethernet-phy-id0141.0dd4";
+			reg = <0xa>;
+			device_type = "ethernet-phy";
+			reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
+			reset-deassert-us = <70000>;
+		};
 	};
 
 	mtl_rx_setup: rx-queues-config {
-- 
2.39.2

