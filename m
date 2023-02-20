Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1A069C7D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Feb 2023 10:43:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbjBTJnx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Feb 2023 04:43:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231137AbjBTJnw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Feb 2023 04:43:52 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BD8CBDDD
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Feb 2023 01:43:51 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id h16so2363511edz.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Feb 2023 01:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vEraJFOkiEGJPLBJkOQj/cMWUDEIwe2prS5AlZkeQe8=;
        b=LY6eJtyEwOc/eQ/HgsxjJcxEyyZ67VvZ0eC58vOWNi4kwPkVNQEjuBsBf1UGJq+Ekh
         jnAA4rcs0JIjQd5J7rlXZyJIQ2eCKVg2CHnUi4O9vsK67FSnM0wvMyJCduI29h+vfuNc
         fViLpDtKTHJmnPS9F5Ygouxu7pfZumeGkrGybrD2Ima0iScrzK+yh8T5Qx4JHpRAH7vx
         oH5+kJVPn8R3XMTpBCxAGtPlr/5pqTVt4WUuIWbAzBmG8apRHVBW7z/oUXR2IJCM8eRx
         TF5sLumOpRGmOamU1wy6M9B6fkevaaPRv+kSKSx0fq9PFntmIG79a9FYaWRdaEl+yzPZ
         LE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEraJFOkiEGJPLBJkOQj/cMWUDEIwe2prS5AlZkeQe8=;
        b=xpPS2hrU6ODv+WDacycOSzZ9CQdObJfoJxIkd0vYUV0G+KRK9oUULNVAlJws5CJVb7
         5ZLG1LD74qkaXDRC93HcL1Qr3+B28R58XTshapG/NGrr/kE47heISH/KqzAjdKjCBuK5
         amL+DD2ZUKEweMsvS4UHhMrsAK/jejrInGaTgBRKGf22B+LYrF9bJm2PENj4MAUv6+EN
         neeX1ud3mECnQPJwVyW91HLZv6H2KthcWMKujT1nI86YDfnUGBYrH3k99PnH62wEVGtl
         JPYzaaOPOIn2bczFnnw2VejQUqsEeirEEE3M4YGlA7CauFFkIv92Y9OZ9RBf9KsPX8XB
         JH2Q==
X-Gm-Message-State: AO0yUKXXD/avM8yk9KBQMsL64B2Ukpz0q1j6AQIl8QpkYwXnDAgVcBAK
        I3ngrvvL6W6gOUTVPMtZnSzwimxRz2hW8Vi1
X-Google-Smtp-Source: AK7set8XWwJEnqzoWn70CIKQF4YspfORAwRtN+QfjYi/mURoJub4rkTkRIi0zJs53MSsYxYchEp1Iw==
X-Received: by 2002:aa7:c302:0:b0:4ac:b950:a11 with SMTP id l2-20020aa7c302000000b004acb9500a11mr754880edq.33.1676886229705;
        Mon, 20 Feb 2023 01:43:49 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id b2-20020a50b402000000b004aef4f32edesm1557645edh.88.2023.02.20.01.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 01:43:49 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: apq8096-db820c: fix indentation
Date:   Mon, 20 Feb 2023 10:43:39 +0100
Message-Id: <20230220094339.47370-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220094339.47370-1-krzysztof.kozlowski@linaro.org>
References: <20230220094339.47370-1-krzysztof.kozlowski@linaro.org>
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

Correct indentation.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
index ce189dea2760..eb18811b2676 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
@@ -1070,7 +1070,7 @@ cpu {
 
 		platform {
 			sound-dai = <&q6routing>;
-	};
+		};
 
 		codec {
 			sound-dai = <&wcd9335 AIF4_PB>;
-- 
2.34.1

