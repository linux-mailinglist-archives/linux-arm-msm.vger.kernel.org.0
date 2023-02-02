Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C97868841A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 17:20:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232539AbjBBQUA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 11:20:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232926AbjBBQTr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 11:19:47 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A4EC63874
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 08:19:45 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so1837705wms.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 08:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgeAUb8nlJmXzc8cpw6rDfJT0U0Yi27jRpa30uyE/SQ=;
        b=PPZUN+ebJgHxincZRdcVIWQHbELBuf72NhLldy4dp7P+P1uUQJiCWTUL94g0deJy4d
         EgsFgiG2qvC1ssAI/qreen7G08Dp7s1DeJhJP3wuBh/uaGJwPesiH7AKEgga9wzlk91G
         owIzCRcPrs9wEqQy6vEDir5zPtDXUaShI3ixg7A24hqyTl0h+doXs89do8OF0D8wTgOg
         PiQXhkI4EvwAczir3B3kG2KI51Kkvf2++P53TRfeY9EH0YUV+KPMh/7s4xoaGsE5w1oZ
         gHM8VPygeaBSZK8VWsMqgn/f8mzFWkm9I0QpTG63tTb8OqmBhEnMMpMpeXNKchN/Igva
         56lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DgeAUb8nlJmXzc8cpw6rDfJT0U0Yi27jRpa30uyE/SQ=;
        b=IFf281drAoTOZBr0UPro0qeVWrLDUslTWcFxr5687zRlV8jRZ5uyvK67J474fmQ58N
         opr1KVjFCSBNYiQupBJusANAy+rAQjvbq3Hy8VCw/vPiPtczGkz59JZsp1615qPJwduU
         XD5eM4q91fkPySx87LEkUATk84JaA8unRjZxJCtOCbVe/5V5T61ABb4BwniBikXMnxcO
         nCuLvJ38emHyfK9mE2fjhetDi7BqQ7ijpqF39vXh09WrdE7hwT0RijXdjnQZi7Arrf+o
         D+O/afUqLYwSLy/XWrNA6Z431bJKpM1uoGQRsQDgVJ7+5L/AJv6bmlYCYtCZKg61nFEM
         aIfQ==
X-Gm-Message-State: AO0yUKXhCFepeHX0/CWyRhVR5BNMddPjBIv4OE42+YgrgXs4L4d7Zrqt
        rCr+vXquyr8ZXBhDjZvM9kVpRg==
X-Google-Smtp-Source: AK7set+OXfKZljGHSc3JwzuuWUDftF9vo/5sXNWHKceOefcOUR5p7vViZiOZxF4KPB/8K6QdH6Qocw==
X-Received: by 2002:a05:600c:4f53:b0:3dd:97d6:8f2a with SMTP id m19-20020a05600c4f5300b003dd97d68f2amr6586138wmq.33.1675354783910;
        Thu, 02 Feb 2023 08:19:43 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h16-20020a05600c351000b003dc521f336esm212416wmq.14.2023.02.02.08.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 08:19:43 -0800 (PST)
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
Subject: [PATCH 06/13] arm64: dts: qcom: msm8994: add compatible fallback to mailbox
Date:   Thu,  2 Feb 2023 17:18:49 +0100
Message-Id: <20230202161856.385825-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202161856.385825-1-krzysztof.kozlowski@linaro.org>
References: <20230202161856.385825-1-krzysztof.kozlowski@linaro.org>
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

MSM8994 mailbox is compatible with MSM8953.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 9ff9d35496d2..8afd9ec29ac8 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -351,7 +351,8 @@ intc: interrupt-controller@f9000000 {
 		};
 
 		apcs: mailbox@f900d000 {
-			compatible = "qcom,msm8994-apcs-kpss-global", "syscon";
+			compatible = "qcom,msm8994-apcs-kpss-global",
+				     "qcom,msm8953-apcs-kpss-global", "syscon";
 			reg = <0xf900d000 0x2000>;
 			#mbox-cells = <1>;
 		};
-- 
2.34.1

