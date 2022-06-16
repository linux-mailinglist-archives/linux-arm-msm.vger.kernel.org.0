Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D4F054D679
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 02:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350749AbiFPAzT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jun 2022 20:55:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349884AbiFPAyl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jun 2022 20:54:41 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70484580D4
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 17:54:29 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id y196so105599pfb.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 17:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8KUiL3np2ygfecmy1I7ARIj+Q5w0zv0RhTyVvk3vWH4=;
        b=qTu+cDWP2SW+X/kxzM9HzF4tQCSbSVySmmELcTZ4ArgF64hnXlwU5OFTDcmYSrEJqV
         J3V/CnQBgrZaENLjncNSN2f+Vgi35snbWabs3pNJrkOqLHXQYvjl6xfJ1uRxe0N8S/vv
         PNsLemAjaQ0ny8pTaXCbRdadciaEnTn762LEa8nN8dBJVp+RjnAywG0Xqxj9MjgPtySv
         4TTv49H3iVXOzYHkSirgjjf41mbJbuMkxA8EbwG7qSraxDXxEUA6ufpA+WxO4TZRdegD
         MUwzkuKT1S+sr3yr0qGbHnXDgxdbw27JCazs4sXZ0lYo9d5icvRt7QSS4KrihUcj2Asb
         ShSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8KUiL3np2ygfecmy1I7ARIj+Q5w0zv0RhTyVvk3vWH4=;
        b=Ygs3GEXMAJOEkLoGR+CQBjq4H5fWsJZnxJH1VWzf1rZDg8rNBOhA1M3UM3/kfj7iHz
         ghv9jG4NIEjv8RbiW5X/5+tm5YobTsIkYy3ZTgxgXjJnLNn+ewDoEmgCD2Os57jVjzBs
         mwWuGjywCc1c1BLAFiNpFivkN1KzWeh6m6vZa46Mqo7mqfht4U2Z/tE4ElQRxH4atsOi
         Eq3trEzEzNGlcG0qIRY9OHkOHbySNha10KgMy6wJyiSSUUtCzGm/t7UIzNiNrKmEC+78
         0EwcTv2OasYjRFL5MTN87IQ5h5RfexN5N2ocY/PazEvnkDKh2hCHFLsB0W1TyZYmo0ol
         xU0Q==
X-Gm-Message-State: AJIora/ax5IPh4AcwyoS+fnotmGM/1GM0cDNHo2dynWt5kM554oOvcEp
        MC1u3BrAui273nSAeM1PZkmdgAGLNbvtQg==
X-Google-Smtp-Source: AGRyM1sQO1seQ1T1fSTkQxKxi0GxBWaONbYL90YcQ+4JTholhfwkn0saBCHtFOJyC2TUQaJpfiI0vA==
X-Received: by 2002:a05:6a00:1894:b0:522:d414:61f7 with SMTP id x20-20020a056a00189400b00522d41461f7mr2209200pfh.18.1655340868943;
        Wed, 15 Jun 2022 17:54:28 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:54:28 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 23/40] arm64: dts: qcom: sdm630-sony-xperia-nile: drop unneeded status from gpio-keys
Date:   Wed, 15 Jun 2022 17:53:16 -0700
Message-Id: <20220616005333.18491-23-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Nodes do not need explicit status=okay.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
index 42e89f41eb7d..48720026423d 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
@@ -88,7 +88,6 @@ cam_vana_rear_vreg: cam_vana_rear_vreg {
 	};
 
 	gpio-keys {
-		status = "okay";
 		compatible = "gpio-keys";
 
 		key-camera-focus {
-- 
2.34.1

