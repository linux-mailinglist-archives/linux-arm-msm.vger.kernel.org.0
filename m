Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B69A06A73D1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Mar 2023 19:50:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbjCASup (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Mar 2023 13:50:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbjCASuk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Mar 2023 13:50:40 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 860A54D626
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Mar 2023 10:50:38 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id h11-20020a17090a2ecb00b00237c740335cso211998pjs.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Mar 2023 10:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oo+u555smUgrnpw3BbGVKkqZ1z4GzkQDi9gRGeEZptw=;
        b=YjJf+IkLDnryusztxDnAcBW4jCGZ5L39MSlk+6Sw7IHWbzSdKjKdpfOqPgiZacSHwW
         sN9BAkayq+AWQCfooardP9klE9IfASj41ExRn94wblQ8/qlA0CH42H933cYTpNrKceOG
         U7D1rxCluMCnQ6zPmtDSA++DMcNggCcxHmiyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oo+u555smUgrnpw3BbGVKkqZ1z4GzkQDi9gRGeEZptw=;
        b=B7UzqCPRTGlgPDe4FfwCt7gr+Y/6B+STAkzi6htBkngoZxsdr/Z9iHQiYqEi+GSCaH
         TAG8NMesRItq+4CITUTAEyhuomXWFmoA5okv96F2h9ZQlhmMk/uU0ZUH7/P+G/s+bZtH
         HI36VFzgZ8Fy4gQR0X2wLiZNYGAixt+/qlava4dCHDZn8WK+qJIi2ZVEIXB/9/94r78N
         lrJN39vA9vK00aGS56Knj29Mv9mNB52NK4jkvML4c6qjoCDmLlM7PsKWl0gj3DrTrUfC
         xH69nEEOjoiHENyrIdgIR+VdR3GBu8Ok93hBE+XA/T1cBpzBXHeGWjO7FebPs2ujRHYj
         4J+g==
X-Gm-Message-State: AO0yUKUGXAE60HmLqx5Na/Ct/QVX3REU9pvqiv40so6ZsSytFksBw6NE
        Fwc9YhbSEHO1nUx2B7f9OBtHckhX5mKy1JiZ
X-Google-Smtp-Source: AK7set9znO0CX9IDy+jV7DvwqAIciULM5DhX3bxnObyw141CMn9zHLB8o7qjQ+3qocE5t8HFzNqXaQ==
X-Received: by 2002:a17:903:2301:b0:19a:ae30:3a42 with SMTP id d1-20020a170903230100b0019aae303a42mr7825557plh.21.1677696638057;
        Wed, 01 Mar 2023 10:50:38 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:f4ac:1f4d:6f3b:f98])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902780500b0019a8530c063sm8761982pll.102.2023.03.01.10.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 10:50:37 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     mka@chromium.org, swboyd@chromium.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: qcom: sc7180: Delete lazor-rev0
Date:   Wed,  1 Mar 2023 10:50:05 -0800
Message-Id: <20230301104859.3.I30128a6f4b60b096770186430036afb40ede6f70@changeid>
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
In-Reply-To: <20230301185007.1101006-1-dianders@chromium.org>
References: <20230301185007.1101006-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

lazor-rev0 was a pile of parts. While I kept the pile of parts for
lazor running on my desk for longer than I usually do, those days are
still long past. Let's finally delete support for lazor-rev0.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/Makefile             |  1 -
 .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts | 34 -------------------
 2 files changed, 35 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 3ce51093ed8f..e4190a648335 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -84,7 +84,6 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-homestar-r2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-homestar-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-homestar-r4.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-kingoftown.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r0.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1-kb.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1-lte.dtb
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
deleted file mode 100644
index d49de65aa960..000000000000
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
+++ /dev/null
@@ -1,34 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
-/*
- * Google Lazor board device tree source
- *
- * Copyright 2020 Google LLC.
- */
-
-/dts-v1/;
-
-#include "sc7180-trogdor.dtsi"
-#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
-#include "sc7180-trogdor-lazor.dtsi"
-
-/ {
-	model = "Google Lazor (rev0)";
-	compatible = "google,lazor-rev0", "qcom,sc7180";
-};
-
-&sn65dsi86_out {
-	/*
-	 * Lane 0 was incorrectly mapped on the cable, but we've now decided
-	 * that the cable is canon and in -rev1+ we'll make a board change
-	 * that means we no longer need the swizzle.
-	 */
-	lane-polarities = <1 0>;
-};
-
-&usb_hub_2_x {
-	 vdd-supply = <&pp3300_l7c>;
-};
-
-&usb_hub_3_x {
-	 vdd-supply = <&pp3300_l7c>;
-};
-- 
2.39.2.722.g9855ee24e9-goog

