Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2427434C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 08:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232113AbjF3GNY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 02:13:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232159AbjF3GNW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 02:13:22 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F049B268F
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 23:13:20 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b6a1245542so24008531fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 23:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688105599; x=1690697599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=to6KZ4R4fBoTHdJdtVbxCQRUtjuR5HoBa1YSLAKM0fg=;
        b=jy/VYhqnzJ7RuYITQHN4r4qF4bf9+b+WU5lYPYBVgmQR2U3jJSpWk5GKEh+OWJ4teS
         lDPH0nSDF3S2HDUkMJ3EJRG5HOOJ7rx3rhLZFuhzgcClmz32YwMozEYpa/2hbELPHW10
         bey71A29uL/o0TKikGPrb8pSafTcOSYUD77TcXrrn2cTQIEnkQ7JUcdghIQ9HuWmjshZ
         Sy45K0msiWPcPfqIJsnhZJCKpkbd+n9HBiEY3aJ/BgPuhNq3sdJ9miLsph+25HVMEUg2
         +o4WpmoDc4Ls+665ofdVr98TL47DmEQyjbcsV51MGEJX1tPYxbD5S4cEi6pZXJpgZHu9
         +HDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688105599; x=1690697599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=to6KZ4R4fBoTHdJdtVbxCQRUtjuR5HoBa1YSLAKM0fg=;
        b=SCcoOWh05QNibRJFWglIQUN4vLcSYSmk9P1CUXeGdHukDO/ucHRI5a0MvTTi0ZsxJA
         aKd+9pK+9AaOq/GJkjEhFQI6nuDoKL1Z8IVSSS3oG0yfEstModHnJ8YQezV3cz3007yw
         twt6xKps3Rwb/o9TPBx7LtzeKC1fjzkCCeRP7B0R4Ju7jtJsxSdF49t2DAHVpeAmRTYv
         Pg6xAZVueHCswFbc6EnrYUlxJM4aufxC/MA22YpuHWXzQUwGQ74zOefYjyweC/IIv+qa
         mv5MZuMKFkKtIn11yEagVDAgciAte/lMJW5XgiTnjndC2B9BciBuZcL0d8ybtf8wkPim
         gbXw==
X-Gm-Message-State: ABy/qLZiOG/o+xidX9khlcCj45P33eVedcQwh5Khvge/VYqnhAN7vLDx
        i7TSuZtzbZeLQt07bMMjNhTtWA==
X-Google-Smtp-Source: APBJJlEg8/XqW1LcOdNpHUc4A7Nrfk8u2tEzzYo4nKfxHwfjvQPXpmrOgLJKw4MrlAM1w3wV8m00pg==
X-Received: by 2002:a2e:9b88:0:b0:2b4:6456:4553 with SMTP id z8-20020a2e9b88000000b002b464564553mr1260482lji.47.1688105599196;
        Thu, 29 Jun 2023 23:13:19 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g22-20020a2eb0d6000000b002b6caeb4b41sm505582ljl.27.2023.06.29.23.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 23:13:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 3/7] arm64: dts: qcom: pmr735b: fix thermal zone name
Date:   Fri, 30 Jun 2023 09:13:11 +0300
Message-Id: <20230630061315.4027453-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630061315.4027453-1-dmitry.baryshkov@linaro.org>
References: <20230630061315.4027453-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The name of the thermal zone in pmr735b.dtsi (pmr735a-thermal) conflicts
with the thermal zone in pmr735a.dtsi. Rename the thermal zone according
to the chip name.

Fixes: 6f3426b3dea4 ("arm64: dts: qcom: pmr735b: add temp sensor and thermal zone config")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmr735b.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pmr735b.dtsi b/arch/arm64/boot/dts/qcom/pmr735b.dtsi
index ec24c4478005..f7473e247322 100644
--- a/arch/arm64/boot/dts/qcom/pmr735b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmr735b.dtsi
@@ -8,7 +8,7 @@
 
 / {
 	thermal-zones {
-		pmr735a_thermal: pmr735a-thermal {
+		pmr735b_thermal: pmr735b-thermal {
 			polling-delay-passive = <100>;
 			polling-delay = <0>;
 			thermal-sensors = <&pmr735b_temp_alarm>;
-- 
2.39.2

