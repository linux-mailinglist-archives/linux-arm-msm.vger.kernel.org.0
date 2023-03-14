Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 726C26B9E81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 19:31:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbjCNSbd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 14:31:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230427AbjCNSbP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 14:31:15 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2F4074DCD
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 11:31:03 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id c8-20020a05600c0ac800b003ed2f97a63eso948994wmr.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 11:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678818662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMD7g0tqdTqLSKJxM1RNFkLXFG0K4z+6AGBUUNB3lBU=;
        b=xQmuBuyu/gvlXmwKEoi2t74oInXch4nq4aRaoUskRrHESvcXD4xxkn35CG2y+muY7U
         4KszZCMlQwq7Jvy3ArYQ312lmviIG33u9Rswi1G6cLmJogJHdm/cH2uFW/iRb6cMOVV4
         8tNcSdbkIlabelZ0XRGsqLwseHmzRrackXXVgate5ZBgqGRZD+kaoTAzu73GzFsFLC7+
         ubvkbdzMPYp1ogN4EaPZi8WUbvN4j81yOFJ+aPMNx8Art1IHeBmiBNGULrCGp/Thlt0G
         8DKZx18IMCq/GJqEmWCPSQ1/LhzXweq/zzHosNHMe5rXanSHmTDjT9nZQ9OauodaIPYx
         foDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678818662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nMD7g0tqdTqLSKJxM1RNFkLXFG0K4z+6AGBUUNB3lBU=;
        b=QFUZgaxTRtzulvgGKlPVGBdNFbbjviWYsJ67YpoGMsed3Pn6Ud2KZhrCRNr+TtiV7N
         Fh8qjX6kHJMWkIyn81da3eK0uCricbK+pB2wCsOIw+hF+2a4hujdCTWknFNdi9Itsoji
         Llj7bF+1e9T/6pU91yj0phwf+KGEtLQy4iKalgpQVrfzmQSHczxeevoHeBZbWo1Tmyrc
         mBxQgaDJpf7Rzzt11QkksGW9MzbqKOYmGCMlOV0Z5ax/1Fa2454iCy/oDoPB2vD0mHjI
         bhITbv4k3y5a+752Lqt4eMbLRvSaKfmIkmOTQjA9dy4BIDspJaSeYnZ1NC8G0mD4HK9j
         J1QA==
X-Gm-Message-State: AO0yUKXLtpyZ++c6vA0mbUN4kyaT1EmUoAEQjIl5QCxwFrbfJU177wet
        VknhZwRSQgbd3mbpgy/+Y3BFBg==
X-Google-Smtp-Source: AK7set+Y/pYfQIIDKxh9MA8fezE6xjjv+evPe8b7JZ23SqRDScrl7r4KThckS4XzZ0tgGvr5rdr5Kw==
X-Received: by 2002:a05:600c:1c27:b0:3ed:2619:6485 with SMTP id j39-20020a05600c1c2700b003ed26196485mr6476108wms.3.1678818662245;
        Tue, 14 Mar 2023 11:31:02 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fd14:bd52:b53b:d94c])
        by smtp.gmail.com with ESMTPSA id k28-20020a05600c1c9c00b003e209b45f6bsm4083938wms.29.2023.03.14.11.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 11:31:01 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 09/14] arm64: dts: qcom: sa8775p-ride: enable the power key
Date:   Tue, 14 Mar 2023 19:30:38 +0100
Message-Id: <20230314183043.619997-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230314183043.619997-1-brgl@bgdev.pl>
References: <20230314183043.619997-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Enable the power key for sa8775p-ride.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index b7ee4cc676b5..396a2543c78a 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -40,6 +40,10 @@ &qupv3_id_2 {
 	status = "okay";
 };
 
+&pmk8775_0_pon_pwrkey {
+	status = "okay";
+};
+
 &sleep_clk {
 	clock-frequency = <32764>;
 };
-- 
2.37.2

