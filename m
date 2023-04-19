Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1F66E7EC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Apr 2023 17:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233539AbjDSPoS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 11:44:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233628AbjDSPoI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 11:44:08 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9541AA5CD
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 08:43:47 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id o11so13054099ybk.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 08:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681919026; x=1684511026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZyYHVq2KKyE4C0IhwyY/WppUE1xI3kMg23q7uSOq+Tg=;
        b=mq/T2vtNxXsqvV9+XBOj8ljMXbwdH35ftq6Edkr4Z9p/Ws48v0F1g562PaWhDZ9lyu
         QNVf17Bl/xg69M/35RaR2nxHDzPBIr4IkalAQOG8aVxJqrKg3mnoQrGEpOFP3ZpL9kmu
         QjBC2RKb2QhkZZ4ofLJdO92XY+NJRCc2G4LAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681919026; x=1684511026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZyYHVq2KKyE4C0IhwyY/WppUE1xI3kMg23q7uSOq+Tg=;
        b=I7ngFjG7FMW9hht+R7XWvrDgvjRTmfReZpD8E5zK2GfdV8X6jtFeAYLVpv/rEadWJY
         Pv2YzBgcJuZ/SYLzNE1VXxUCvcfjcJ1H8kU4OUBuehtQ20W6TLhI90bjvgpJ5Dv9Bldx
         bAkfdH2Ucn5VIFL4tHEcL9yQRajR9mBF4gtnQ0i3pq0r+YLQRltMBJ9kqv6l1JPjeExi
         PAXoZyel7L3cH9jM3bvdlHBxQGCzFN3xdP/2ZLwEF4nw05QrDsL5IAcBBzW3C9LuBHVW
         niujb1hD8dx33OWhejlABxDyy+jc6SiTp2+bTztyx008SY7/1lDZzkkmmNItoJZS+7/G
         aeeA==
X-Gm-Message-State: AAQBX9eSlLy3CW0FigcHWgfSkKZ5qCdIMBXe+ocvsKvN2VmfBepYJVH5
        Yl4MIQ0WYDnhS58JRz/EG9WXaA==
X-Google-Smtp-Source: AKy350bFwaBgNEXJbLUNW+dGLPL2d4Nckb5SJpfQgSSZ1Mhjcg8+CCNw85X/Q6v4u1lw+lQkNl36Rw==
X-Received: by 2002:a25:4d56:0:b0:b25:a1e1:5b65 with SMTP id a83-20020a254d56000000b00b25a1e15b65mr172416ybb.5.1681919026732;
        Wed, 19 Apr 2023 08:43:46 -0700 (PDT)
Received: from localhost ([2620:0:1035:15:55c6:7cf1:a68:79b0])
        by smtp.gmail.com with UTF8SMTPSA id cc21-20020a05690c095500b00545a08184cesm4539823ywb.94.2023.04.19.08.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 08:43:46 -0700 (PDT)
From:   Mark Yacoub <markyacoub@chromium.org>
X-Google-Original-From: Mark Yacoub <markyacoub@google.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     seanpaul@chromium.org, suraj.kandpal@intel.com,
        dianders@chromium.org, dmitry.baryshkov@linaro.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org,
        Mark Yacoub <markyacoub@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v10 09/10] arm64: dts: qcom: sc7180: Add support for HDCP in dp-controller
Date:   Wed, 19 Apr 2023 11:43:19 -0400
Message-ID: <20230419154321.1993419-10-markyacoub@google.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
In-Reply-To: <20230419154321.1993419-1-markyacoub@google.com>
References: <20230419154321.1993419-1-markyacoub@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
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
2.40.0.634.g4ca3ef3211-goog

