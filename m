Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB75C581EA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jul 2022 06:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240327AbiG0EYq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jul 2022 00:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240343AbiG0EYo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jul 2022 00:24:44 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D91C73B95B
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 21:24:42 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id f11-20020a17090a4a8b00b001f2f7e32d03so2325429pjh.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 21:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jNjfWMIST+9EQW65g4EOXNYBjzp8Q3oEU/cOaI9tlIQ=;
        b=Y/1dTObZmop4N+owBJV/zHDB25DdNO92G20kEk8xB9l4NVrdIVYc+HGC7uSwyuw+j3
         n35sZOkWdWJrLH0yIdHFU56llHkfh7vDa6+AyhdXSZp7u422brlNcAo7kM+x2KP1DOwy
         TWNbwp6kseT7A+H9H8QBvjwcEYDydY0kzjbE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jNjfWMIST+9EQW65g4EOXNYBjzp8Q3oEU/cOaI9tlIQ=;
        b=lL12wDDtTfyXA9lu4QPx+ahYZCTo50/owzEHUzeYVCUJxHLBnm0MMB+oHTCvCYm93a
         LPQcGvJY9/JAVKK6RNnfIydbXIEXfSrrKvg/VEpsErdZYhG32IzjzKZ3YSRbXxnWgYSW
         N5QwkZeUyskm0tPq7aHJxTjATfRuQ/Pkfdk1XakMIfubaSYeoCBipBzjGIXvwYLtBIHb
         Jaa1dgb+7GgbrFV6tNEfsAHWPyxI2GsRD3EwkMiWRjqz2fPIaEoC4y8dkkyLSrrQAe2s
         Ahg4HTEHE/b13nBH06Wy+wd2aiXYZbeYQxpqyc0RGdHDC2nF32VIPVgFm2AHaWJfDtq9
         sUWw==
X-Gm-Message-State: AJIora9hNsMVVHaFodfcV82KI6eYNkFrqxF8FGvCrXYiRbyh2Dox+lCY
        qHWvF2EX6FgqwawbyNg5K0I2Cg==
X-Google-Smtp-Source: AGRyM1u8pW324tqb+Tq4hBfpdaUrNBPIRQ2cZIAw8cDLNPTypAl++bbEwxfk0PZmU6iPBVYq+6hqqg==
X-Received: by 2002:a17:90a:cb8d:b0:1f2:156f:f9ca with SMTP id a13-20020a17090acb8d00b001f2156ff9camr2548464pju.72.1658895882316;
        Tue, 26 Jul 2022 21:24:42 -0700 (PDT)
Received: from moragues-cloud.c.googlers.com.com (252.157.168.34.bc.googleusercontent.com. [34.168.157.252])
        by smtp.gmail.com with ESMTPSA id u5-20020a170902e5c500b0016d5a356b31sm8058538plf.116.2022.07.26.21.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 21:24:42 -0700 (PDT)
From:   Bob Moragues <moragues@chromium.org>
X-Google-Original-From: Bob Moragues <moragues@google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Bob Moragues <moragues@google.com>,
        Bob Moragues <moragues@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: sc7280: Add support for zoglin
Date:   Tue, 26 Jul 2022 21:24:32 -0700
Message-Id: <20220726212354.2.I7d57fb9c4806a8b3fe3501c766b64f4987c271ef@changeid>
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
In-Reply-To: <20220726212354.1.I5b9006878bdabd6493b866b46dbd6149968d545b@changeid>
References: <20220726212354.1.I5b9006878bdabd6493b866b46dbd6149968d545b@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Zoglin is a Hoglin Chromebook with SPI Flash reduced from 64MB to 8MB.
Zoglin is identical to Hoglin except for the SPI Flash.
The actual SPI Flash is dynamically probed at and not specified in DTS.

Signed-off-by: Bob Moragues <moragues@chromium.org>
Signed-off-by: Bob Moragues <moragues@google.com>
---

 arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
index 6d324ac2dda1..98d09187fc69 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
@@ -13,7 +13,7 @@
 
 / {
 	model = "Qualcomm Technologies, Inc. sc7280 CRD platform (rev5+)";
-	compatible = "google,hoglin", "qcom,sc7280";
+	compatible = "google,zoglin", "google,hoglin", "qcom,sc7280";
 
 	/* FIXED REGULATORS */
 
-- 
2.37.1.359.gd136c6c3e2-goog

