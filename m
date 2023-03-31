Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1886D2B16
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Apr 2023 00:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233509AbjCaWNG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Mar 2023 18:13:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233487AbjCaWM5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Mar 2023 18:12:57 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F5E622219
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 15:12:37 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-54184571389so440901447b3.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 15:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680300757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuHM3Ml3PogV+x216rKe1L3nHLFo1MwYXwE4UpoFNeE=;
        b=PJ8MIaChYf1hyLs02a/4OwDicqZnjK09rM5XKqAm5kRJiZa5OJwqNVE7oFW2ZdibeK
         DLhFewEDf6gi51fE2aKpYzwFuKnIE7aVvhhw078JOMiJbWaIWwJmypIV5qLpDRY/ZbNb
         ZGa4ZNgtOSJlDdYCu/11y+DUkz9cd1EB5gMpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680300757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SuHM3Ml3PogV+x216rKe1L3nHLFo1MwYXwE4UpoFNeE=;
        b=0/bTo0XXjov9yvI9fDfRiRzcV2j7XG8jLT9UbwWXGWi5ZQzOVmyyCP4ITgHazfoHXB
         I4qkO5uFtMLcBZacnOiH1BMIoX/TE8qV9SIb+XlX+m48P3jvu4q03aULmUil9T7Qk+rV
         vaI2Or/W2r86685XLJCUxVRuqWDe+eohL+aCtsplgEwgy0rMc30gYzId+YCtfo/cSLuc
         aUDJNlsQbCCX7gYtBRjSa3b5vOSPkjfRf3pBcqxIa1AIl/vLdSgDhTetUG03EJTgwg8o
         XxS2B2mRVdx91/f+JjoX7VypAt+jEclY9ug5xm3w/8QjA9fST8+y6yP2+gaHm9btYmYY
         0B1g==
X-Gm-Message-State: AAQBX9e2sKlvUFpRR9D/6c8UgCdqOxvnprn0TXhzUq/a3bsPCFfuk/QY
        sGK+Ea7vb5Xo3noWtibDObY5Nw==
X-Google-Smtp-Source: AKy350ZF5Y47obuwMo5tN+7rE24Wl2VFFeifocBWiFVazpaCUbskHkorQPmYpadclKW6c2w3vyqWDQ==
X-Received: by 2002:a0d:cb15:0:b0:541:8864:c4b5 with SMTP id n21-20020a0dcb15000000b005418864c4b5mr9469428ywd.12.1680300756885;
        Fri, 31 Mar 2023 15:12:36 -0700 (PDT)
Received: from localhost ([2620:0:1035:15:a8f6:869a:3ef5:e1d])
        by smtp.gmail.com with UTF8SMTPSA id 123-20020a810381000000b00545a4ec318dsm796675ywd.13.2023.03.31.15.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 15:12:36 -0700 (PDT)
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
Subject: [PATCH v8 09/10] arm64: dts: qcom: sc7180: Add support for HDCP in dp-controller
Date:   Fri, 31 Mar 2023 18:12:11 -0400
Message-Id: <20230331221213.1691997-10-markyacoub@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230331221213.1691997-1-markyacoub@google.com>
References: <20230331221213.1691997-1-markyacoub@google.com>
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

Reviewed-by: Douglas Anderson <dianders@chromium.org>
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
Changes in v8:
-None

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 423630c4d02c7..89d913fa6e3eb 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -822,6 +822,14 @@ &mdss_dp {
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

