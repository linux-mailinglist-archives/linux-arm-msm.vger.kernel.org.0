Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9E496F7E47
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 May 2023 09:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231436AbjEEH6B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 May 2023 03:58:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231437AbjEEH5w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 May 2023 03:57:52 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3D2218854
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 May 2023 00:57:50 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-643465067d1so1179025b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 May 2023 00:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683273470; x=1685865470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JCViBdbMluKpXvpRwGUbaOGVsHxAxvw+9V3H+vfUho=;
        b=QugLlhRxXPi0EKqKheBYLUZy2i/olV0zZ6Jd04TZx41AhIdNvdLq66sRfmjxOv5Eb+
         bxiAMlG7vApTVC6Tj1AhPRXa01z5A8AgVksJjMYe7JE8un2yhoo8QAEQBdPxGQvB2dC7
         LPcIfCfqnlo6Z+0FAdQ3Zp1aK6XVQNL9M9yNwj57eR/Bz5v72h2bpZn1Nh9vPKG0T3fg
         hiT6Uzqs3pmIMMJZDdcVbtx+k1S9KawL1KF2sMenDKd0S8RfWCQYxi7KE2eaeHMDhxF1
         rO8DwC6vKZbgtggeFIhx5Q2QJCgaSPceHadn0EFEtXd6E3pW5Yp5uwWeCS/FN8mphaCb
         ir7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683273470; x=1685865470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+JCViBdbMluKpXvpRwGUbaOGVsHxAxvw+9V3H+vfUho=;
        b=kJXcL4Nmrsmcp8X9+QA/SUIcKybrZwiTdfBBndAYH0M8bQXBesZKJ6sLzrbUQIYqbD
         Cx3MUBR7oHt5rSNpZ8UZ9NaxutwFpZHA5CKkXCbtx+RC2roLvBpEHYSWpsq6sCm0yvC9
         0eI/UhzgqnPILcmHsXK3RjnQxzEthUbg8wY/IMfJVpdqZFHUJsLt932wHzAA6KV+FEK5
         0/Z42/1+WhqIYDGGEYFlrU7PTucRpfuTpAxRkC8eFhuEAH+ANmW4GDlAz1jWR3QnK79Y
         16d/fQTNdoqGwTFJrVUb253Q0wFC7eRy7XtwvRQjdH4tn0wGJoOBK9JwMHlsiXQnoU8l
         kHhg==
X-Gm-Message-State: AC+VfDzJZZLvEqinYB7SruCVf4UEpeDTXpsW5Erg5pPWXCt6Rhyo001M
        Z66c8hDiFAXaPzR/6HZdeY+FOWRM7sR1Kz/TON0=
X-Google-Smtp-Source: ACHHUZ6ZWQObC2JZZ8ajX6cy4UUZR7ZmXpQZHa8IGlB2PMHcdAbQDTId6sbH+gEDMegeUqLDsnWdEQ==
X-Received: by 2002:a05:6a00:2e8f:b0:63d:2343:f9b with SMTP id fd15-20020a056a002e8f00b0063d23430f9bmr1242587pfb.19.1683273469814;
        Fri, 05 May 2023 00:57:49 -0700 (PDT)
Received: from localhost.localdomain ([223.233.65.180])
        by smtp.gmail.com with ESMTPSA id p17-20020aa78611000000b006242f4a8945sm988873pfn.182.2023.05.05.00.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 00:57:49 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org, devicetree@vger.kernel.org
Subject: [PATCH v3 2/3] arm64: dts: qcom: qrb4210-rb2: Fix CD gpio for SDHC2
Date:   Fri,  5 May 2023 13:23:53 +0530
Message-Id: <20230505075354.1634547-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230505075354.1634547-1-bhupesh.sharma@linaro.org>
References: <20230505075354.1634547-1-bhupesh.sharma@linaro.org>
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

Card-Detect (CD) gpio for SDHC2 is an active GPIO line. Fix the same.
This allows the uSD card to be properly detected on the board.

Fixes: 8d58a8c0d930 ("arm64: dts: qcom: Add base qrb4210-rb2 board dts")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 504543ad1a1b..abea44fd369d 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -203,7 +203,7 @@ &sdhc_1 {
 };
 
 &sdhc_2 {
-	cd-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>; /* card detect gpio */
+	cd-gpios = <&tlmm 88 GPIO_ACTIVE_LOW>; /* card detect gpio */
 
 	pinctrl-0 = <&sdc2_state_on &sdc2_card_det_n>;
 	pinctrl-1 = <&sdc2_state_off &sdc2_card_det_n>;
-- 
2.38.1

