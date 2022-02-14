Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D2AB4B43EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Feb 2022 09:20:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241908AbiBNIUE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Feb 2022 03:20:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241904AbiBNIUE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Feb 2022 03:20:04 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1004E25C47
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 00:19:57 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B93F5407E6
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 08:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644826795;
        bh=23CQAl/07AaN2dxN1TfTdDj5so/NCdWTbjb57ZtNLwo=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=Ah1UupAoINeRCa+UtdPXztTePkYfs2ooX5tQRF6YqDHLCj4fOsLrLszYyo1SzXCyq
         axMRDOzHIudG+Pqc0ec6ebKh4zmyKcerOvHSWvpFsbPW1YBYwnjGWpY7zVcRZHWhNe
         OaNIWiFdGgZPeE5n3cjNx1f3goxIl7Fp2KpN8B9BniBYhXMv4Ferp1VQhCznIrLVdy
         LE2uktIzvLNe2G04mkiN0IDujzL7SkBspAqMUePvKEv2g0zqb9XiwMEpvmQDavRPyO
         +4WpWvTRdL15qFsiBc1D+9I87h2YPFqisEBAeWqc7GlVwK6qDLc1rhee4/NHUBylnn
         nRJ1FYkb1mKAg==
Received: by mail-ed1-f69.google.com with SMTP id z8-20020a05640240c800b0041003c827edso8127036edb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 00:19:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=23CQAl/07AaN2dxN1TfTdDj5so/NCdWTbjb57ZtNLwo=;
        b=2UxxYdq9VfQLyetdL3ha1fGXFmUYZUJAYt0GhRPhe004voGrbBQHna9GijuFm3BZda
         SZTjPPJo3xQnOVdEq7lWPDMCRV5vdb4/CI5Oi4QMHLxcBOkeTXh+0DWi39siMr8/7uXg
         bVDv3mMoZAAVOdRvppR65TNYj5IMYvaGlEl9R3igKGAWlp5FLkeSuGZAi9b6TvkbmoLE
         AyXL5pvgMY2zvbl4RklE9o3B+fW1GOeN4HI2IjSit1S085zLpqa7U8q3EWMPosgx7tcU
         ge4NnHNqY7gnGDqElo6BgTu9E/5UexiXCl8pNqoTdkRId03sXHLqNZVbKOGXpyJLuZ+t
         733A==
X-Gm-Message-State: AOAM531aShniqSETbcIGvY1fpme4FEaDSPW0uc1qZBnUYBXkcLaqGmvB
        sog/HakzryZT+zqxAKrtF88ZIW8ZGrSEhWIhByJ9f/CFLXn5GRAf0Z+SH1tZLkJmwQb4PTzfJic
        hZyZvC9/J6XXIZFU8rBAEw8+2PlXR0nlEs8ast2YejMg=
X-Received: by 2002:a17:907:3d01:: with SMTP id gm1mr10671210ejc.695.1644826795048;
        Mon, 14 Feb 2022 00:19:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyduVMGZqiqcBn+5NbYVmKbo23S2Kx2GnaG0uOcebe1lzeD4dxVvKdv5SiQHDzJAeAj67dMnw==
X-Received: by 2002:a17:907:3d01:: with SMTP id gm1mr10671188ejc.695.1644826794896;
        Mon, 14 Feb 2022 00:19:54 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id b20sm2022941ede.23.2022.02.14.00.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 00:19:54 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 2/4] arm64: dts: mt8183: align Google CROS EC PWM node name with dtschema
Date:   Mon, 14 Feb 2022 09:19:14 +0100
Message-Id: <20220214081916.162014-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

dtschema expects PWM node name to be a generic "pwm".  This also matches
Devicetree specification requirements about generic node names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
index 8f7bf33f607d..2d7a193272ae 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
@@ -92,7 +92,7 @@ volume_up {
 };
 
 &cros_ec {
-	cros_ec_pwm: ec-pwm {
+	cros_ec_pwm: pwm {
 		compatible = "google,cros-ec-pwm";
 		#pwm-cells = <1>;
 		status = "disabled";
-- 
2.32.0

