Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F0F47E3015
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 23:44:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233366AbjKFWog (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 17:44:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233368AbjKFWoc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 17:44:32 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD56210DF
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 14:44:26 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6b7f0170d7bso5074140b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Nov 2023 14:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699310666; x=1699915466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CL6rNqUZZ/R7S5vMBh8Bonhs6IZKDfrdmFtaTOQlgvk=;
        b=CSqLR8BeVRWdemljm7igAtREKR8rhIPSka/BQLGCezQwEbyf8B+CGWDHBDXRt9URe8
         cko2aRE7+WBXaVx4ehKNIYTMUcKbRQ9NIb1UMT7dsLkkTqcdISaVFaVbvnWCJZ7CQBck
         Hg5vp8Ru9+p7G05kB84i2BJDsPjTDeD1XUNaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699310666; x=1699915466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CL6rNqUZZ/R7S5vMBh8Bonhs6IZKDfrdmFtaTOQlgvk=;
        b=dh/FwRQu0hSTkZbHrImTStnkmwIo9PEu+hYLBLdsP9pReBQ64p7K7omsMZH6YWwYEw
         EVTwm+oUXkmTndXK660pmwpVoZNKmDQJ8BTLC0lFZj1O3kKvDAxrBDB8fV1YWZ2xj2AT
         sc4kU8n35U7ZnKgBpUzcrmu9qamT/6VV8+RKPkrrNwqmMLpQpFhqMljLeMl+9STY3c8j
         fI5NiXRuOTZbgHN2xX2fpK2leVbk4g1ix03VD7PilkZMpKRK+9bt9D9QUgjz9hnORUc8
         RSEbHRkA8Z9jN49Eev2xi5U6ZECUb+F1ymnWdX6ZqAMWe5UOTyzdwYIgRTKLtlPSxGg0
         u61w==
X-Gm-Message-State: AOJu0Yw+HLcmDtp1G//Kn0gqzH/TT0OSJLtpU1kJyRfdj7KejN9Ymosi
        smAuFgUM7gWvvWWwqw6PtqvEWw==
X-Google-Smtp-Source: AGHT+IGeaYGnK2mOvcF4px0EdMUPyG/1hdE+Ly1oivTOAyc2DaqvSBOFigg78Ncdu9XjKlpJUhYFqg==
X-Received: by 2002:a05:6a20:4412:b0:154:3f13:1bb7 with SMTP id ce18-20020a056a20441200b001543f131bb7mr41711778pzb.49.1699310666346;
        Mon, 06 Nov 2023 14:44:26 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:16a7:2c01:9126:36a4])
        by smtp.gmail.com with ESMTPSA id c10-20020a056a00248a00b006b725b2158bsm6043402pfv.41.2023.11.06.14.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 14:44:25 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     swboyd@chromium.org, linux-watchdog@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/9] arm64: dts: qcom: sc8280xp: Make watchdog bark interrupt edge triggered
Date:   Mon,  6 Nov 2023 14:43:34 -0800
Message-ID: <20231106144335.v2.7.I1c8ab71570f6906fd020decb80675f05fbe1fe74@changeid>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231106144335.v2.1.Ic7577567baff921347d423b722de8b857602efb1@changeid>
References: <20231106144335.v2.1.Ic7577567baff921347d423b722de8b857602efb1@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As described in the patch ("arm64: dts: qcom: sc7180: Make watchdog
bark interrupt edge triggered"), the Qualcomm watchdog timer's bark
interrupt should be configured as edge triggered. Make the change.

Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index cad59af7ccef..b8081513176a 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -4225,7 +4225,7 @@ watchdog@17c10000 {
 			compatible = "qcom,apss-wdt-sc8280xp", "qcom,kpss-wdt";
 			reg = <0 0x17c10000 0 0x1000>;
 			clocks = <&sleep_clk>;
-			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
 		};
 
 		timer@17c20000 {
-- 
2.42.0.869.gea05f2083d-goog

