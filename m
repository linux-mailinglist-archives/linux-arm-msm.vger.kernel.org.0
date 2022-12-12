Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC10764A4DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 17:36:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232770AbiLLQg1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 11:36:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232530AbiLLQgG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 11:36:06 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C98413F5E
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 08:35:50 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id x28so314689lfn.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 08:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JJv0ofBLKoLJVN69JWEtIQxQMwvVM2xRN5xcaxTrEIU=;
        b=WcEBvpkXwt1t9UaiOYqNJ6vJb9iamTE+AQelOAHKvqCyOYMdbvfrazvjRP7imi1AAt
         xqwB1NZEtyQumf68k89kuMbV5a40y9lCCH62ahA1HyC3/qd9gbUoD40EXvbFEoM7/fdR
         kZphHrWVPyxTI582GhrdNjxdMXRTdO758uPF7zbF3wY3kRVH8M0Vuhm28+A9/7BbZ5zt
         JeldgYhEYsDMKTrniuQK/P3zsC13leUuxsMJ7E/xUpbt1oYa0Q8thp44Ux6OJVfIMlSN
         UtSO/ilrVlfu2bMlkqC8LgkFMKUgl9kK/gff+obwfWV3sjR2uxxQ6J5EbAPyCE0FQWDr
         TdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JJv0ofBLKoLJVN69JWEtIQxQMwvVM2xRN5xcaxTrEIU=;
        b=nFRpxkieNwmSriW6fQlUUj442j9+oKnlI+K70+25POLslvAbD6DgzepJog/nVa3hnz
         Xlq7UUGYHkuwuIMkZBJDBdMbHqPYQavIHq1nY0Wno8Fnz792/NaBF3bjWvhCmhyyEGSI
         2P3m1U5Sp3b5cxcELNmArH3OS8pDGWbWcBm0XZrCC+4lIhqm3/s0k7q9OIXAIOGVHNNW
         YCj7V6Wy0UfDxmK1QVHe378ozRRhXfSGgsEyLH/uDsqmEEvfrGV7H49OqlM1QH5bhB5Y
         5o4hgSVzZtrhJOwluV1c+NiS9VuP1xCk8Xb8CcfWuLc/1fH1Z74HYPJc2cvIku/zmrRL
         bksg==
X-Gm-Message-State: ANoB5pk09x1ZINf3bPJ/xbaa/Cs1Yx1bks+LtR5i0qg+6xiHEWQ6ivAu
        LOB8IwNZAFbBIJhJGULqCX2/4g==
X-Google-Smtp-Source: AA0mqf4Q3dqqRpXFWgXQ9QG0XFecfleK0UEam7R5WficLSUWtKRmOfr1HbXsPng5RbpUEGg/fZDPYw==
X-Received: by 2002:a05:6512:4012:b0:4b6:e4e7:624c with SMTP id br18-20020a056512401200b004b6e4e7624cmr2447777lfb.0.1670862949936;
        Mon, 12 Dec 2022 08:35:49 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v16-20020ac25b10000000b004acff58a951sm29209lfn.133.2022.12.12.08.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 08:35:49 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 11/12] ARM: dts: qcom: msm8960: drop second clock frequency from timer
Date:   Mon, 12 Dec 2022 17:35:31 +0100
Message-Id: <20221212163532.142533-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221212163532.142533-1-krzysztof.kozlowski@linaro.org>
References: <20221212163532.142533-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Keep only one clock frequency for timer, because:
1. DT schema does not allow multiple frequencies in such property,
2. The Linux timer driver reads only first frequency.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8960.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom-msm8960.dtsi
index 63c3c40fe9a2..a0369b38fe07 100644
--- a/arch/arm/boot/dts/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8960.dtsi
@@ -109,8 +109,7 @@ timer@200a000 {
 				     <GIC_PPI 2 0x301>,
 				     <GIC_PPI 3 0x301>;
 			reg = <0x0200a000 0x100>;
-			clock-frequency = <27000000>,
-					  <32768>;
+			clock-frequency = <27000000>;
 			cpu-offset = <0x80000>;
 		};
 
-- 
2.34.1

