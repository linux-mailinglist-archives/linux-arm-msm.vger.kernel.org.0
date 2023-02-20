Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5F2369CA7E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Feb 2023 13:08:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231649AbjBTMIp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Feb 2023 07:08:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbjBTMIn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Feb 2023 07:08:43 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A816CDE8
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Feb 2023 04:08:41 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id l8so948310ljq.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Feb 2023 04:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JL8S79pZmvWgV7qwFqlM7bRr0tK+jdMcMIVg+zahXW4=;
        b=xD39Or7bW9DgBSJLIi5SpdIhQ5k5E6dINKE+OgyryZJ+BqPgNpJwE+qPOYYyYLg+L3
         /m22Ude7GD4WO72wt4PiBXNGI0K5mPQ4PJ7GXs0aSt1Q9c7ioxFCALKz5XrxEwgmULVA
         zcP8MA+sbLwwQQxMpIg889txsugEmMOp2XqRgbwPxI9gBGt4xN2q2/gzRW6aFHjnP8Nm
         fd3YP3V0A6qhhnQqT/fSqBbmkvIk8IxPxMGo9XXyyYpynJ7hcDfe39BTOX+Srz1g1AT3
         O6wHsw7UhSIoVzSyPt1AMMzZRTMTmZ/iAd8H7PxTOptaqehWVjvP4cQKR7BQToA1m+32
         5btw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JL8S79pZmvWgV7qwFqlM7bRr0tK+jdMcMIVg+zahXW4=;
        b=7kkxz5JhOLuMUlcisGv9KoYqXtzlyvwDZ8dG04y7B1PqJAumQcyIolRcG6+qzKT/8o
         rroX9O9YYyMnW9xM3sScpIKsDrNPxpyoLLFr298f7qWycEN7/EkQmFI+mUOz9cQOGsYh
         +o2Rjz86uGlLaKSyS549Q624bKlzzKnmRFqR9mEjA+Yuy54x6BrgKIKAl7ICLojMVbHt
         PI3LDn3TK0ux9i2P1+8xrTZg0KdSAA7MtIUYyYi2ZNp+vr5Ev0CS5LUNbtyPnrf29JuG
         ncXEQFde6RHQbTAaqt3YthvO3pfhOgCw25/drxw7PNmDCUgSJZZhcJnplwC4fLTDuMf9
         unJw==
X-Gm-Message-State: AO0yUKXfSw3Rsa67Xo8XlL8kIyGrP715HT+0BxtNwgYPxZGHx2RKLck/
        433RUX6suM8culIEzBji5jqW/VrN1PNg/Heq
X-Google-Smtp-Source: AK7set+vhV/IbCiIxMxKR2t6lRDxsby85xnzAcCA+pIxw1IkfsaH4TAT7A4R9R7IDPG3aMxjM3jYuA==
X-Received: by 2002:a2e:9a87:0:b0:294:70ba:1f37 with SMTP id p7-20020a2e9a87000000b0029470ba1f37mr129019lji.3.1676894919128;
        Mon, 20 Feb 2023 04:08:39 -0800 (PST)
Received: from localhost.localdomain (abxh184.neoplus.adsl.tpnet.pl. [83.9.1.184])
        by smtp.gmail.com with ESMTPSA id d11-20020a2e928b000000b00294e89cfed2sm593113ljh.111.2023.02.20.04.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 04:08:38 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        David Heidelberg <david@ixit.cz>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: qcom-apq8064: Fix opp table child name
Date:   Mon, 20 Feb 2023 13:08:31 +0100
Message-Id: <20230220120831.1591820-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.2
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

The opp-320000000 name is rather misleading with the opp-hz value
of 450 MHz. Fix it!

Fixes: 8db0b6c7b636 ("ARM: dts: qcom: apq8064: Convert adreno from legacy gpu-pwrlevels to opp-v2")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 92aa2b081901..3aeac0cabb28 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1260,7 +1260,7 @@ &gfx3d1 30
 			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
-				opp-320000000 {
+				opp-450000000 {
 					opp-hz = /bits/ 64 <450000000>;
 				};
 
-- 
2.39.2

