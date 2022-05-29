Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E56E53727A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 May 2022 22:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbiE2U0n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 May 2022 16:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231538AbiE2U0j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 May 2022 16:26:39 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 325C32B1AE
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 May 2022 13:26:38 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id h5so4118629wrb.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 May 2022 13:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hHi3QBFwCXmqlLHYHksg4ge5xGm0n6+LjU5yPR19Zx4=;
        b=e9oGoTSh0tWkfvRnuv+IHjFghKNM5oTGbVheNxmRU0HGipNoeBuFWUwTtdIEB0OBBd
         Khx4FylHBg/pPoBMOg4bEAGn/hle997JQ0y1RTA2Czs5QR/ZRejjcQZ7Dx7DsRuZLJ6G
         vdcEh4+ZsOPpdyluZ6nNm6dEBIWTQsGFGNTzWPqIYVSmeqXGLWe3A1s54xGfqdMmxI4Z
         CCtEHN/3xmBmSqHiKYpzn1wIbjMDM2IXv30TEOjZN1cNMxuLBnzL+GK2b9cjWO7xKC0H
         z+tLGmd5WvlYQ/fYoPF45V7nesUxbPhqL6PAkSsaFEndDoK3xGF15eqkiLt7vXqqg4gv
         bs9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hHi3QBFwCXmqlLHYHksg4ge5xGm0n6+LjU5yPR19Zx4=;
        b=RBQsQCaiOA1XFzO6s9XkrVdkXbtZQwL2zvcfnce9q6Myirgh75/7fRpRKE/JF8AYVQ
         2kAyJHWYONWvlFRQSFTeTNCsogYyX+xsTjd3Ivyxk4wEojiJwFWwlbXKd3Antc/30VTt
         Ihghy+gA6ToVAxx7A8w6JLjbdwNC0oikQIAmn2PYl9Qr2sR0r6sq8XymwmmuvjqJlTZt
         PUzFfZzbytmimuH3b/Yd4UYlasmAO8VHTy/1v3FuxoJS2Yp5k408kFe+0bgkZI0Y6LNZ
         PBMV7LN8sr/J97ibNQ7qSIChloYR+S15j6VIO9hol+OE9K6x5avd+w4E3vaSKZZYTwtU
         WoLA==
X-Gm-Message-State: AOAM531pY7Zd+MHvQvCj93xQ2ZMrBttWAofbYJ0EjDx7iBV+gHTxYLZ7
        gNfVJsumo/7fRZKT8igRJLbMCg==
X-Google-Smtp-Source: ABdhPJyTTgnF/wU13PPKvTRh4pV1B09BRx4hG9kjESJxmKNCdUqSxaDErvlUIOARkVsQ4Qb1D6GJGA==
X-Received: by 2002:adf:e712:0:b0:210:3db:fdbd with SMTP id c18-20020adfe712000000b0021003dbfdbdmr17066207wrm.625.1653855996751;
        Sun, 29 May 2022 13:26:36 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id y4-20020a5d6144000000b0020c5253d8f7sm7099310wrt.67.2022.05.29.13.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 13:26:36 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/4] arm64: dts: qcom: msm8992-xiaomi-libra: split qcom,msm-id into tuples
Date:   Sun, 29 May 2022 22:26:27 +0200
Message-Id: <20220529202629.47588-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220529202629.47588-1-krzysztof.kozlowski@linaro.org>
References: <20220529202629.47588-1-krzysztof.kozlowski@linaro.org>
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

The qcom,msm-id is an uint32 matrix, so a list of tuples.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
index 7748b745a5df..15467b697e94 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
@@ -17,7 +17,7 @@ / {
 	chassis-type = "handset";
 
 	/* required for bootloader to select correct board */
-	qcom,msm-id = <251 0 252 0>;
+	qcom,msm-id = <251 0>, <252 0>;
 	qcom,pmic-id = <65545 65546 0 0>;
 	qcom,board-id = <12 0>;
 
-- 
2.34.1

