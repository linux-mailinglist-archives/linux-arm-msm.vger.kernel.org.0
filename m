Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF8461FE6B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 20:15:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232051AbiKGTPn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 14:15:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232328AbiKGTPl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 14:15:41 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 797EB27931
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 11:15:40 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id o13so1989642pgu.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 11:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Et5rcDaKTeSODyH0ma6yTSI3d3kE/5OPATF9JyW6zgI=;
        b=HCojWqdbpZ0XdltA7pCayQz4VWGZ0DOeCtn7O5AQ0AQk45wxFNUvbpn1hSIXT2u2kg
         bjE9wyYHwl2TUWdx85D99f0I+NpFteFqIFsrXqLJ8lGrD4bbNlEDJBMyXTIJkVv+ecJG
         D6zU/DDwQjCFIMEUDtSL8PJMewHbpqlh61JDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Et5rcDaKTeSODyH0ma6yTSI3d3kE/5OPATF9JyW6zgI=;
        b=0Nxm4US7moRltWbCuyIRzV7Lb7Y8PrcgsLXjyNUzZDd104QXt0DmFivZxXwYVWGrs2
         UolRi3s9RrGR8mVHBFzKJ9TDBHKDweJ5QKpLVRr++1FHoLTFRXKy/5fx13/PHqep7DM8
         LQP8VBWwtV+kflKlHEFqkpGz9T4FlF3zF51i4fvetrEEIXpnSPXUSFhWklYgGNPIlnB3
         q11RtWwAFJP7U0p+viRHEutOheXftxfFF6YxVNBBVlO+r7HiJWDyBAcuYltrDaHtFtsc
         tXQ/Lpq+20D1a5ckI7a63L2SmINamvL3D1Olf0ai6X1hAzZUnLTa9AmUQz5ahrC8DhMg
         VCGA==
X-Gm-Message-State: ACrzQf3fTSHXAVlu4ZGOQQ3rfO4cF5vYGd/D0NCuAgKj4I4U1fYzR6zU
        4rPoPjfz72UFmx71S4e+tPqf1Q==
X-Google-Smtp-Source: AMsMyM4L7+dkQnukIPAZh2+7nIU9HyGulwudMVcJ3m+1z8C7HKjcfsj8uXP8uUPhYfLMilrCeJMiVw==
X-Received: by 2002:a63:b59:0:b0:434:2374:6d12 with SMTP id a25-20020a630b59000000b0043423746d12mr44379966pgl.311.1667848539848;
        Mon, 07 Nov 2022 11:15:39 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:11a:201:4652:3752:b9b7:29f9])
        by smtp.gmail.com with ESMTPSA id r11-20020a170902c60b00b001830ed575c3sm5306627plr.117.2022.11.07.11.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 11:15:39 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>
Subject: [PATCH v2 1/2] arm64: dts: qcom: Fully describe fingerprint node on Herobrine
Date:   Mon,  7 Nov 2022 11:15:34 -0800
Message-Id: <20221107191535.624371-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
In-Reply-To: <20221107191535.624371-1-swboyd@chromium.org>
References: <20221107191535.624371-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update the fingerprint node on Herobrine to match the fingerprint DT
binding. This will allow us to drive the reset and boot gpios from the
driver when it is re-attached after flashing. We'll also be able to boot
the fingerprint processor if the BIOS isn't doing it for us.

Cc: Douglas Anderson <dianders@chromium.org>
Cc: Matthias Kaehlcke <mka@chromium.org>
Cc: Alexandru M Stan <amstan@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index ca02ef26f161..448da9794722 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -503,13 +503,16 @@ ap_spi_fp: &spi9 {
 	cs-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
 
 	cros_ec_fp: ec@0 {
-		compatible = "google,cros-ec-spi";
+		compatible = "google,cros-ec-fp", "google,cros-ec-spi";
 		reg = <0>;
 		interrupt-parent = <&tlmm>;
 		interrupts = <61 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&fp_to_ap_irq_l>, <&fp_rst_l>, <&fpmcu_boot0>;
+		boot0-gpios = <&tlmm 68 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
 		spi-max-frequency = <3000000>;
+		vdd-supply = <&pp3300_fp_mcu>;
 	};
 };
 
-- 
https://chromeos.dev

