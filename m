Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8590053FB4F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 12:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241058AbiFGKd6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 06:33:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241009AbiFGKd4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 06:33:56 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 349315DD0E
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 03:33:55 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id c2so22372145edf.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 03:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z7y5ppJgpzR4qJH3r+2SuIsoUHOGR5gCCdmikAjr6os=;
        b=iafDT1DDwDEdaSEgRX3WPj+F2TFV+kSWzzGnXk73O6kjG9PAdA0kkCxcKSMV+QS0la
         o1H5nzhiF+qihE4lxY6qEkZi+s0ijawk3o3ZIiRQak1GtUKecvJPI5CckELrNcPr29zY
         TObd6Jbeoqw++uq9ObdZEE5C3NuGE1lndHQZzsEc92a7J7ITbK5D+AJGHxL3g/IwyWsa
         lFnsaRDq9Wn1MwU6uEun1TebfUvESQzemAEkRUBzPs0UIZ88B6eYebYm0HYt97PtM0WS
         ZRT0BzrC+9LGcMpTVkveM6D4UEFOCEQSjUrtpzguRo8BnEyKddmxPlDUndnmIPe8wetA
         5MNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z7y5ppJgpzR4qJH3r+2SuIsoUHOGR5gCCdmikAjr6os=;
        b=yLpdlCJ4KiGIzWlKZuoCOR1z7Jx2viO4IoP6yjyspvB/d+82PNtxDmPpIb2dehQNMh
         68WKj7VHKqJBWoTWfCHYwjcwetMEmpK/dHCoIweF77X6ItdFfYFyrc8K7taVe+ClOiW/
         4gUceP92gH+jqc/uLPLizQMQzdscO+wXi4+cEJsR6wjdV/Yl8lz8F2uMh/PQQLctLv6Z
         o/nf7uA4xjAWwTkzFEUDsHxoTDlCSN0qKI6i7PHiCzBl+CL5dp2xGgQodh8E9c1xtEoH
         tt/e/3M133Ks724bZswC4g10IaeRISsiV0vbL9TCUoOoOl7UpozrU6hXsJQ1phwZWuLR
         ArAw==
X-Gm-Message-State: AOAM533awoj4VT48I1Rez9K7FUuYMsBnj1dBWcPDT8IDKzwCSJZ2YYqA
        UrpMaNxyw+UUjdhgcrrv4t9ATQ==
X-Google-Smtp-Source: ABdhPJyxYwqsplvcowIuHcsSL/grfb+PJx9uT+VKmzzUJQHNtEUlYEAqW9RA7AFndpQzw8UPyklvbA==
X-Received: by 2002:a05:6402:703:b0:42d:d347:a586 with SMTP id w3-20020a056402070300b0042dd347a586mr33024148edx.316.1654598033813;
        Tue, 07 Jun 2022 03:33:53 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id x4-20020a1709065ac400b00704fa2748ffsm7505359ejs.99.2022.06.07.03.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 03:33:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 04/10] ARM: dts: qcom: ipq8064-rb3011: add color to LED node
Date:   Tue,  7 Jun 2022 12:29:25 +0200
Message-Id: <20220607102931.102805-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607102931.102805-1-krzysztof.kozlowski@linaro.org>
References: <20220607102931.102805-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add common LED property - the color - to LED node.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-ipq8064-rb3011.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts b/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts
index 596d129d4a95..68b2074807e1 100644
--- a/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts
+++ b/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "qcom-ipq8064.dtsi"
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "MikroTik RB3011UiAS-RM";
@@ -208,6 +209,7 @@ leds {
 
 			led@7 {
 				label = "rb3011:green:user";
+				color = <LED_COLOR_ID_GREEN>;
 				gpios = <&qcom_pinmux 33 GPIO_ACTIVE_HIGH>;
 				default-state = "off";
 			};
-- 
2.34.1

