Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 007A76C8671
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 20:57:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232019AbjCXT5C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 15:57:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231709AbjCXT4q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 15:56:46 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CFB81F93D
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 12:56:29 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5419d4c340aso52123397b3.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 12:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679687789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RhYYIOBYcZyuSgRg3T8Pd2sS16OkXMZ4m3rP2gSu380=;
        b=Ag1iuj+S6Z4Y1lJXAJrY3Mn8rfl+2AN6RUbB8FF2Efu80+W0eu2S4qc4iffzQK5imi
         KtGvwVv+Y81ZAhJfdbRo4IJWyWDQAbD3q1mJB1aw+lbPCOObJxjMBH+DQV0k89wiZOCa
         HPsFgWcc5IvMIKhtXVJ5xFdQR04JSYSXzZuAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679687789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RhYYIOBYcZyuSgRg3T8Pd2sS16OkXMZ4m3rP2gSu380=;
        b=bjhBPAIfek/ZxjQJMfUQwn1etGjJy2Hx0ypcAkz54sPA39TV07Ka20YEDPu0ZLBgEv
         l3Nw2R7ukkCd8lsB3W3P2YXC3N5/yE1Hi9X035N3EHMYdfIxe9ziz3rBoHQOa0zQJxvD
         5CSKgg/s0w33TJDWOAVr6KraUkhchjI/dXdQJ4lKSrARv+34ZodOn9NwLW7GxnweyQZY
         jVVmLNZwvIA2PF/DNput6GGpLdn/Ti0C7oXajeJJqKhOcDwj1Mg6w9zaO16IYy2a8/dF
         58bIyib5iWUxdCIHRtwVjsegPRru/o42UFDQb+cSDo6H8f92ad80yg488Ha7sdY8S7cp
         BDYQ==
X-Gm-Message-State: AAQBX9d/2LEcfzEXBMId5XJ7jldC+c3YTAuZp4n39V/XgTNzgaWNHeMk
        w3845FS5+iGQfXLdNX0p+TMKbQ==
X-Google-Smtp-Source: AKy350b0eLq7t4fJJ/Zw35tvDmcmY1talDrP39suxk4lgr7xXjMPvQemHVU5OnqjI17ffqbpaaE2mw==
X-Received: by 2002:a0d:e808:0:b0:543:53c:e3c with SMTP id r8-20020a0de808000000b00543053c0e3cmr4002039ywe.2.1679687789154;
        Fri, 24 Mar 2023 12:56:29 -0700 (PDT)
Received: from localhost ([2620:0:1035:15:5509:ec45:2b32:b39f])
        by smtp.gmail.com with UTF8SMTPSA id 204-20020a8112d5000000b00545a0818495sm594780yws.37.2023.03.24.12.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 12:56:28 -0700 (PDT)
From:   Mark Yacoub <markyacoub@chromium.org>
X-Google-Original-From: Mark Yacoub <markyacoub@google.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     seanpaul@chromium.org, suraj.kandpal@intel.com,
        dianders@chromium.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        Mark Yacoub <markyacoub@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 09/10] arm64: dts: qcom: sc7180: Add support for HDCP in dp-controller
Date:   Fri, 24 Mar 2023 15:55:53 -0400
Message-Id: <20230324195555.3921170-10-markyacoub@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230324195555.3921170-1-markyacoub@google.com>
References: <20230324195555.3921170-1-markyacoub@google.com>
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

From: Sean Paul <seanpaul@chromium.org>

Add the register ranges required for HDCP key injection and
HDCP TrustZone interaction as described in the dt-bindings for the
sc7180 dp controller.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Mark Yacoub <markyacoub@chromium.org>

---
Changes in v3:
-Split off into a new patch containing just the dts change (Stephen)
-Add hdcp compatible string (Stephen)
Changes in v4:
-Rebase on Bjorn's multi-dp patchset
Changes in v5:
-Put the tz register offsets in trogdor dtsi (Rob C)
Changes in v6:
-Rebased: Removed modifications in sc7180.dtsi as it's already upstream
Changes in v7:
-Change registers offset

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 47f39c547c41a..63183ac9c3c48 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -816,6 +816,14 @@ &mdss_dp {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&dp_hot_plug_det>;
+
+	reg = <0 0x0ae90000 0 0x200>,
+	      <0 0x0ae90200 0 0x200>,
+	      <0 0x0ae90400 0 0xc00>,
+	      <0 0x0ae91000 0 0x400>,
+	      <0 0x0ae91400 0 0x400>,
+	      <0 0x0aed1000 0 0x174>,
+	      <0 0x0aee1000 0 0x2c>;
 };
 
 &mdss_dp_out {
-- 
2.40.0.348.gf938b09366-goog

