Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 491D961F6C7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 15:56:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232649AbiKGO4A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 09:56:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232514AbiKGOzz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 09:55:55 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B4C91E3F0
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 06:55:36 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id u24so17907550edd.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 06:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7GKMF/lET5d/bSPpn69UJxHLYl9FEVbhPqltHrC3iU=;
        b=HRAzrmSotF5vn7R4dpjJ1TJqTjoyO0iB7MFkiXMx8kZFwXTnRzBh/dCFFO92llq7aY
         9QNnyrNPA4hekLR7q6GWEUbLcBbFHag1GV7mNjIRL4guOl7x/zHAi10mjRn4/4k6HuyA
         eopb8efMBrN5Di+T8A35xySQUUwOhztFp30y9etxH+1T27L50cTDxNBnc2XloBMi4Ps3
         TS4p3KRj9Eysbbo+O6++0t7FjhPXmcDM7dsKZwD5/ewBxcQQYm+8v93AOyjyw4VxwNAi
         cKMPTttiEqbQxB0K441z6C4J3oWiq71T0kukuiH5xAJ+bq/XIbYbxns/mB4TK/Ty3I2m
         ZA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7GKMF/lET5d/bSPpn69UJxHLYl9FEVbhPqltHrC3iU=;
        b=WPq5zZ1VoPXsByESiAhOMC/Jd3+nfL3yJZ4FeDMiY34d4FQDzJyoWfDmWhTxyQUfwY
         CfEHuQPm8AE497mGQ4a8CoT54hqNCEGq7xfWZkw5UXjWr/Qqdjo1wpXnAd2ZqnaQGLcF
         XoBPLJt1WI0FInPjbdvMKdt8WAqXfXRRin++S419hgkYytVYvM4RCepx9Ueukcdz52JE
         iv1UOJhUFACs0XE++uTpBr2d9CUlDs1N3zl+WAkkr/e/0BXwL9ywjE5+5rUX8Hbfo7m/
         PhJ7PgTnZ4zWfRGDSkp1YmiuxrSS6Qew4dUfsAXahR57OxxBJ+efzj+udGg4Nk4mwWpk
         ywBg==
X-Gm-Message-State: ACrzQf0oE37F+oqps4Jd5syBJ30Lw+fDAtoJkIQc/eDBTlSeNlgBtUZU
        dDJF1MUrSbTQuEYc4cnpMTmZTe9QNa5mBV9q
X-Google-Smtp-Source: AMsMyM4SA0SE5ADDHc+/PcE4KIzL/N7XSfEc3jBsJUWiMf3ZzwKwNb3BjpJR6oQgczMj/7ZTM/AHUQ==
X-Received: by 2002:aa7:d889:0:b0:460:62ef:2695 with SMTP id u9-20020aa7d889000000b0046062ef2695mr48931916edq.273.1667832934997;
        Mon, 07 Nov 2022 06:55:34 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id d1-20020a1709067f0100b0078907275a44sm3503049ejr.42.2022.11.07.06.55.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Nov 2022 06:55:34 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 05/11] arm64: dts: qcom: sc8280xp-x13s: Fix up comments
Date:   Mon,  7 Nov 2022 15:55:15 +0100
Message-Id: <20221107145522.6706-6-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20221107145522.6706-1-konrad.dybcio@linaro.org>
References: <20221107145522.6706-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Switch '//' comments to C-style /* */.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 68b61e8d03c0..381d521d2ba0 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -95,7 +95,7 @@ vreg_l6b: ldo6 {
 			regulator-max-microvolt = <880000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 			regulator-boot-on;
-			regulator-always-on;	// FIXME: VDD_A_EDP_0_0P9
+			regulator-always-on;	/* FIXME: VDD_A_EDP_0_0P9 */
 		};
 	};
 
-- 
2.38.1

