Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE9A6C6F00
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 18:32:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232468AbjCWRcE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 13:32:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232216AbjCWRbl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 13:31:41 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9357D32CDB
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 10:31:30 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id bc12so22381056plb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 10:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679592690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzgVWFKkQG0YRgZ5w6TjXBTOfYthe0uzWRC1HMbAqOY=;
        b=X2o9knEsTKQQzx8gUX7pGP/FjrsVMIhOGp2uKJa+AGe9PxrgzMZdCJqPp5cq0yvbBt
         l4lRBlXZT14PG0qFzIEQO5xtDafKJHZhf9fTZfMAWHVFQJ932srFyL1blt+2uieb9QTl
         Nlq1T0lil2SQWsSAEJmaFlXjwl/k55JK9MK38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679592690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzgVWFKkQG0YRgZ5w6TjXBTOfYthe0uzWRC1HMbAqOY=;
        b=Z9ZDxF4TsGl8/leklpd1T/JjEE8Er8t7KZQQxtaVgdDJ+L7auIbVhpIf17wYiaQ6Pf
         SQNpl0lEmjQIzB5LrVq6xLN3XIY/kAODpS9niOZqPGlEHjRmFetK82Sm4pfmONhZLecX
         bBSNKvCo4wX1nm3nr9H+q9ipY1ai3HFINWCv/CbPBaWL9XwO10bv/v1xXmjE6vU/UGyd
         AvnAqT0+xBCNTcZW0etAQIVKLVlVlj9/zT/8JE2m/syTjP/V0ZcK92X4owhaeYqnN0LJ
         Ac7JMS8zOOvo8PgX5MTquYJkj/Fy1on38cYhxg8QXMiYYcL+HzYV9OODYmc6kTW2tH45
         qVzQ==
X-Gm-Message-State: AO0yUKVhZL4YCNvZzVx4/T82VraWnf0aYctrJB6/3D3cGMGxqlXyBhW1
        Vt8z6kgja0j18Ja8J6KAIG4ctA==
X-Google-Smtp-Source: AK7set9Kd6/5HOTo2T6ATRK/d1+qZFgR+pYMVOMlgSvhzz9Dwm5JQDFYMgGojvaIfO5hah7gVDlN9A==
X-Received: by 2002:a05:6a20:2d99:b0:d5:b3d1:bff9 with SMTP id bf25-20020a056a202d9900b000d5b3d1bff9mr250734pzb.52.1679592689791;
        Thu, 23 Mar 2023 10:31:29 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:16d3:ef20:206a:6521])
        by smtp.gmail.com with ESMTPSA id x13-20020a62fb0d000000b0061a6f4c1b2bsm12613546pfm.171.2023.03.23.10.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 10:31:29 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-gpio@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 09/14] arm64: dts: qcom: sc7180: Remove superfluous "input-enable"s from trogdor
Date:   Thu, 23 Mar 2023 10:30:13 -0700
Message-Id: <20230323102605.9.I94dbc53176e8adb0d7673b7feb2368e85418f938@changeid>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230323173019.3706069-1-dianders@chromium.org>
References: <20230323173019.3706069-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As talked about in the patch ("dt-bindings: pinctrl: qcom: tlmm should
use output-disable, not input-enable"), using "input-enable" in
pinctrl states for Qualcomm TLMM pinctrl devices was either
superfluous or there to disable a pin's output.

Looking at trogdor:
* ap_ec_int_l, fp_to_ap_irq_l, h1_ap_int_odl, p_sensor_int_l:
  Superfluous. The pins will be configured as inputs automatically by
  the Linux GPIO subsystem (presumably the reference for other OSes
  using these device trees).
* bios_flash_wp_l: Superfluous. This pin is exposed to userspace
  through the kernel's GPIO API and will be configured automatically.

That means that in none of the cases for trogdor did we need to change
"input-enable" to "output-disable" and we can just remove these
superfluous properties.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 1f2e1f701761..39100b0c1140 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -1206,7 +1206,6 @@ amp_en: amp-en-state {
 	ap_ec_int_l: ap-ec-int-l-state {
 		pins = "gpio94";
 		function = "gpio";
-		input-enable;
 		bias-pull-up;
 	};
 
@@ -1229,7 +1228,6 @@ ap_suspend_l_neuter: ap-suspend-l-neuter-state {
 	bios_flash_wp_l: bios-flash-wp-l-state {
 		pins = "gpio66";
 		function = "gpio";
-		input-enable;
 		bias-disable;
 	};
 
@@ -1271,7 +1269,6 @@ fp_rst_l: fp-rst-l-state {
 	fp_to_ap_irq_l: fp-to-ap-irq-l-state {
 		pins = "gpio4";
 		function = "gpio";
-		input-enable;
 
 		/* Has external pullup */
 		bias-disable;
@@ -1286,7 +1283,6 @@ fpmcu_boot0: fpmcu-boot0-state {
 	h1_ap_int_odl: h1-ap-int-odl-state {
 		pins = "gpio42";
 		function = "gpio";
-		input-enable;
 		bias-pull-up;
 	};
 
@@ -1335,7 +1331,6 @@ pen_rst_odl: pen-rst-odl-state {
 	p_sensor_int_l: p-sensor-int-l-state {
 		pins = "gpio24";
 		function = "gpio";
-		input-enable;
 
 		/* Has external pullup */
 		bias-disable;
-- 
2.40.0.348.gf938b09366-goog

