Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC5B96DC0FD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Apr 2023 20:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjDISVu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 9 Apr 2023 14:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbjDISVt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 9 Apr 2023 14:21:49 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 654362D75
        for <linux-arm-msm@vger.kernel.org>; Sun,  9 Apr 2023 11:21:48 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id a44so29291333ljr.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Apr 2023 11:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681064506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HGf2TObw1109OPvfJLr+dURMsGATmHG/HizFozIIbfw=;
        b=xv+OHCghpdUt5+xBHjEWXpr7+okZ7hnfdCYoNMPU3+sfr22gWqC4QNGKowWVoxckVS
         fhP0QVceNq5yxtYa+jFYQQmh0MeErZ8REdcvho6UhNCjqUkVUCIW3bMgiwXvi6yqg7Ix
         8A1PaPi3RW4bQZjByKY5FXxMFqHBjM/6kQ5ETv6EzTTGf9ZQDemRQMEdEZEvG3wiOMEH
         3NHjpU3BC1hcdZ8WRKlJcX0VQ7Yi9+bIOxGE+o8iuj1vpTbFjUjMAD1GujziKBpJ1E3T
         ej7gyH3n0VZ4aIjESU3eV/P/9I9lel/9wAGj2hT09DSpY9T0aJ+fwRXCHyR6bnHiD20C
         olRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681064506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGf2TObw1109OPvfJLr+dURMsGATmHG/HizFozIIbfw=;
        b=BHYl+o3YNwnQd8UQNYZZQq9/jFw8W4lcI8dJpqvmcKB/HbdEIeZGR+P1EdEtL/sSju
         MteH2xxMU4lwyYvthm+h00cMs4OpDqjwbrb6hkJZ7yDR4Qtzf+HhbQJMaxZpvUpVheFz
         hpv90GFn4plwKitlsnQZ1uguy6NCbMgiho+64jsj6hgq+CSaTGRziNsdMGFg4aWKC7U4
         NeU/qgBlBk3NHKiGjxgkW/0ZxlB8Oh51MwIMYwz/0tHbiv84bgTUwOkvaCyX23xTgBry
         fo6GkkkeJMjonGX0OlagVXNciEJBYEZu6ejPDn+3PCwl7ZRZinyfdN8A5n2Ub+3mCD31
         1pHg==
X-Gm-Message-State: AAQBX9eWyY747tRLxPL0AEgVJ0E6/YWWD+tnSX8UfU4Bjzgmmm55tsBH
        FVmpD0QELBCIe2imhYnb8N6fmA==
X-Google-Smtp-Source: AKy350a+mB2dKB5w4gf9zIRMk1NZetv1PbXxuGbrQOhmAzB1IkQI4lhkcr6Hb5IsdN3XDi/VGqYpdg==
X-Received: by 2002:a05:651c:8a:b0:2a7:6ed7:473f with SMTP id 10-20020a05651c008a00b002a76ed7473fmr1105651ljq.51.1681064506550;
        Sun, 09 Apr 2023 11:21:46 -0700 (PDT)
Received: from lothlorien.lan (dzccz6yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::ab2])
        by smtp.gmail.com with ESMTPSA id y10-20020ac2446a000000b004b4b600c093sm1705695lfl.92.2023.04.09.11.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Apr 2023 11:21:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: pm8998: don't use GIC_SPI for SPMI interrupts
Date:   Sun,  9 Apr 2023 21:21:45 +0300
Message-Id: <20230409182145.122895-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Unlike typical GIC interrupts, first cell for SPMI interrupts is the
USID rather than GIC_SPI/GIC_PPI/GIC_LPI qualifier. Fix the resin
interrupt to use USID value 0x0 rather than GIC_SPI define.

Fixes: f86ae6f23a9e ("arm64: dts: qcom: sagit: add initial device tree for sagit")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8998.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8998.dtsi b/arch/arm64/boot/dts/qcom/pm8998.dtsi
index adbba9f4089a..13925ac44669 100644
--- a/arch/arm64/boot/dts/qcom/pm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8998.dtsi
@@ -55,7 +55,7 @@ pm8998_pwrkey: pwrkey {
 
 			pm8998_resin: resin {
 				compatible = "qcom,pm8941-resin";
-				interrupts = <GIC_SPI 0x8 1 IRQ_TYPE_EDGE_BOTH>;
+				interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
 				debounce = <15625>;
 				bias-pull-up;
 				status = "disabled";
-- 
2.39.2

