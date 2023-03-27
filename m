Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9AAB6CA742
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 16:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232958AbjC0ORS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 10:17:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232850AbjC0OQx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 10:16:53 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 589E07AB6
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 07:15:23 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id eg48so36722998edb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 07:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679926472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMo5mk6M+0hlW82wXM7SGHXpxbM/f39pn/sc0oURYAs=;
        b=QgkE+mkboWATCDENaIf+7VwDJST7w1u9Js4eaaCtIYD9EbO+hBcE8XnJpjYxgz2QiQ
         gSyET6cvy7IK+V5YAsIPhdH/u3aqtkm9h1m1ek0NknaiUfczWiMRWnx1z/pgMNcCbsZO
         q4KxeX+owvBgA/ieX9XPJYKUTlR87q9PwAfmKg4Pzi5/z4T5W8kn65eAWwyTwWwUB9tl
         TdXITiqc06D3PqeMO1FE3AcXcEojdc0oyjCJQLYTByUU70pFOsb8kuGOaIBslLglWKyL
         ulJz46GUoaYku8y2XDG6JG4V2F6uUpztxiZbf+O81IAJlLWq5lc+76LV60FmxgFOQR32
         ySTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679926472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VMo5mk6M+0hlW82wXM7SGHXpxbM/f39pn/sc0oURYAs=;
        b=xixbDgKxPiGnMKGZM3osWfFv0SKsGQECiLsn/xhU29On26wsb+DQdBVq5Kwctcg9C9
         thMnWKz926AkprH2NPyBfsYfmepX7mpkgGpnUHsbfaqqMND/NepB+twV1SjyDu9J5Ija
         Ga4FI7D87T9EAQTjWQWF7feLLapmdhREdcw7ib/G4SStbtPdey/F9wnuPve5c3dAVVrO
         2rX5T63CAAoD5WbSQHPnobD7Z5Rw3QTM8jIEk0veV7OeBQhVbXB/Fx2kAN/cDPd6DTRp
         Mx6HLPHOUfWxc4X/ujo6hAXglftprD8tt9IsNwEqhyhUHkvRP/hkCBBJOGRshrheq+0X
         BOmQ==
X-Gm-Message-State: AAQBX9cFcb07twQ5t+5udocmeJaeYGMbpkwiOi0tcUzMHV3KbZXfaP2K
        ld+xjrHfByqxIfv7uuL3kNYGCQ==
X-Google-Smtp-Source: AKy350bquPBTcGxJPoF+/Q5WSiFpB7Ht3GStZp0nKS61pRxY9nxjIafot0ypLdfHQfP3b91rf7253A==
X-Received: by 2002:a17:906:f2d1:b0:932:35b1:47f8 with SMTP id gz17-20020a170906f2d100b0093235b147f8mr12600175ejb.34.1679926472472;
        Mon, 27 Mar 2023 07:14:32 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:581e:789c:7616:5ee])
        by smtp.gmail.com with ESMTPSA id ha25-20020a170906a89900b00934212e973esm11273339ejb.198.2023.03.27.07.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 07:14:32 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 4/5] arm64: dts: qcom: sc7180: add compatible fallback to mailbox
Date:   Mon, 27 Mar 2023 16:07:51 +0200
Message-Id: <20230327140752.163009-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327140752.163009-1-krzysztof.kozlowski@linaro.org>
References: <20230327140752.163009-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SC7180 mailbox is compatible with SDM845.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 3c799b564b64..009e054d53e5 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3413,7 +3413,8 @@ msi-controller@17a40000 {
 		};
 
 		apss_shared: mailbox@17c00000 {
-			compatible = "qcom,sc7180-apss-shared";
+			compatible = "qcom,sc7180-apss-shared",
+				     "qcom,sdm845-apss-shared";
 			reg = <0 0x17c00000 0 0x10000>;
 			#mbox-cells = <1>;
 		};
-- 
2.34.1

