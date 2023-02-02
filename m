Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CAAE687ABA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 11:47:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232731AbjBBKra (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 05:47:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232258AbjBBKrF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 05:47:05 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23ABC8A7C6
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 02:46:40 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id hn2-20020a05600ca38200b003dc5cb96d46so3378573wmb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 02:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAA7Ke5DBl8xbt1zInP+vTJBK9tUzjj+nLzA4OXjzeA=;
        b=EOt0foLfLMId0YC8cimHzXIl4ngL688Jju0RgrlX5GNvyz7d5qIzrq8036dEJKkYo4
         cIveJ9yBxlD6y3HvKx8YM4R33pw8IdWNj0RcoY6BeMKzVdKwVx6BAaJpAtT4nm8COHU/
         erPzzND9I1hc3Vfm9C0Fgg2I7H7qs1eZn6ISQSwEiEuxQyF55BzCfqQXYp5DFGO01WfR
         CBy6CzKzySBKhKuRHF9jLauLV7aApqNA7HocUHCqBz/G7vWfiInlKQu+Ob+j16sdlSIt
         pDlcGmrQLSVD8WQ1WlgxnVC9cTEEkT3JRRIXwfjDmkYq/bBtt1MM1QHKO9xa6C98dWNr
         u6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MAA7Ke5DBl8xbt1zInP+vTJBK9tUzjj+nLzA4OXjzeA=;
        b=VHpJ6O2c+GfQI+LBDsH/PHMBd3vI6dN6mCI8zzb2HWzftlI+BnZUksl4oey9AUTWnB
         0fKmWYV+csqkoeKR+mlZCcG39zV8LPp/GN9JSzpisx2juNrMEPIPOTcFClODrttZ+TtI
         vGAxiRIhcxgScJqk2ey0iZ86NGEH63oSM4yNtngpsPe+q6rq26qdAMIjZBcOYRrmLxK7
         zVkQwjXkWr+Hu0y+JBCNlLG8SoV9HglR6mDwLb4qS0FRbUf9vj9lo9zQ3EdFBY41FD28
         W8/ly4zAX1NaNRVbgLDe8UWrmvOKCe9S/kAObJ+/IeUmG87Io/DCynKsAAECEWoSsXDv
         UhzQ==
X-Gm-Message-State: AO0yUKUBH1rzg6ZK1vns3/HgJGh+upddeERRd5wcBy01g7BLRm0/7mIN
        gwpCXalGpFmMXKP2Fh0Wfoh2Gw==
X-Google-Smtp-Source: AK7set9k4GeZSBgG+mX7KWsL8+q02LZIWp4HJV19r+V6fICEJgXCu2bE16suXo3iuSavpmHD5JpdCA==
X-Received: by 2002:a05:600c:3caa:b0:3da:270b:ba6b with SMTP id bg42-20020a05600c3caa00b003da270bba6bmr5245110wmb.41.1675334764887;
        Thu, 02 Feb 2023 02:46:04 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n24-20020a05600c181800b003dc3f195abesm4307329wmp.39.2023.02.02.02.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 02:46:04 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>, Iskren Chernev <me@iskren.info>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 08/10] ARM: dts: qcom: sdx55: correct TLMM gpio-ranges
Date:   Thu,  2 Feb 2023 11:44:50 +0100
Message-Id: <20230202104452.299048-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202104452.299048-1-krzysztof.kozlowski@linaro.org>
References: <20230202104452.299048-1-krzysztof.kozlowski@linaro.org>
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

Correct the number of GPIOs in TLMM pin controller.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index a9433d1e4f54..f1553e1e40db 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -560,7 +560,7 @@ tlmm: pinctrl@f100000 {
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			gpio-ranges = <&tlmm 0 0 109>;
+			gpio-ranges = <&tlmm 0 0 108>;
 		};
 
 		sram@1468f000 {
-- 
2.34.1

