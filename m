Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 615CD544AA3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jun 2022 13:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244170AbiFILlr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jun 2022 07:41:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244178AbiFILlD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jun 2022 07:41:03 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E49E1DBD65
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jun 2022 04:40:24 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id c2so30781756edf.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jun 2022 04:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8KUiL3np2ygfecmy1I7ARIj+Q5w0zv0RhTyVvk3vWH4=;
        b=ZfKVGFlwB0drMUpClH6ongnfbVocJ0aqGHXDS1dsMV50ImoeWbAyRxLd/rHuTeXR/T
         AJwBFWLIJtbVf9dNdY7wpfGDOFdrfspUlyU2+AU7m4YhuhcWezFGQGA4s/SkHBf7xihy
         LHBsvGnEUhPmiLPWiGMVeBGXQSZi1eORQEj9fNDnPskVHaJtQ4aa7Mvt9LUzAJD/UpLg
         vFBwTXazpJwJOWp/63jYbRprEyF9akD8QtIPCgh2PgUF98CksArZKHjoTxyTcSE6CrLH
         hldtJEqSIW+bIYkShF4H5En8f+ReUjh0DAQwEzwigzMtSH/Fkq12OiZ3L0nH/++Yr804
         22KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8KUiL3np2ygfecmy1I7ARIj+Q5w0zv0RhTyVvk3vWH4=;
        b=rSqo2BHeoUjq1ABYnyNqor1h2lfY0TRZUYPXGIhAFoy1zcbgpWso9xsqRoAbHGpD9D
         63uGYP2CbncbKqCq+ZlY4QGB2CYtDX3XoKAWq3znS5omJzgacwERrLTkb4kgNnjktFxG
         jtQkLsrIfDIp5u+DROt1BbMKGrUZQ38h9BdzRhCAtdOaTmEK4vUA3vAKWEcKRBOLyYAT
         xDRLsRCi/BoeQFW6lOdwX/dP3oMzCReShpeB4vgWWmF19Kfz8BTxPousNJyFVYw0Vumu
         avL6f5/TcNdzPwxgzoUuAQl/nsl4lUU5tsZwsfHlYP67qrvC37EAiqiOWHi6soIqNaUT
         Rqow==
X-Gm-Message-State: AOAM531C+YYSBAqO5qIHJu6FiA4z6feNZc28D5V1X0vezgwyuseOkYSb
        Hm+WzfdDCuQBskRvfaHdwB55Ew==
X-Google-Smtp-Source: ABdhPJxWyUWnpnMAnMIiVKwloAstsGYLRows2ba9PpTywVn/DLl1wCQGuTV0zQouD8RF+lfJ+Mtqvg==
X-Received: by 2002:a05:6402:17c8:b0:42d:dc6f:f17c with SMTP id s8-20020a05640217c800b0042ddc6ff17cmr45215591edy.17.1654774823223;
        Thu, 09 Jun 2022 04:40:23 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q1-20020a170906360100b006ff59151e34sm10638441ejb.39.2022.06.09.04.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:40:22 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        arm@kernel.org, soc@kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 29/48] arm64: dts: qcom: sdm630-sony-xperia-nile: drop unneeded status from gpio-keys
Date:   Thu,  9 Jun 2022 13:40:02 +0200
Message-Id: <20220609114002.380563-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
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

