Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE7D4F1F3C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Apr 2022 00:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232931AbiDDWrX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Apr 2022 18:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346234AbiDDWrN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Apr 2022 18:47:13 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA0CFDF52
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Apr 2022 14:59:16 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id b17so12186465lfv.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Apr 2022 14:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NIur641qqE47js/eSqxuyeklFj3KcTRAZf+bgsz5Hag=;
        b=oZj3klbbgQBD0RKYYpP0V35ax/q4oH2qi1TqJJs4s1E0AxYc+9BtC4bD9xgqchtLci
         3mpQwRNoXNVfNLc81G3FfVyIhxCwXMhsFToptfNPiTV3KP6leiEMvR3kQslKJ80y4BAP
         Gt7diZYR1NABvpYm7oExWgu3xuA6EI9LUnZgxYuX94dHxC1x2U1tUxEj8dQTgKLFG4Yl
         F5l2+f/YvsUiYFWLncnOWnyU9XA0yJ2mFhDt2oxHxfADqhjV2eSiFHS7HeI8tcQM5XSf
         BfRU3TAJgqV6vKXpLIpObt8ZiHBAivifetcp74wSS/J9AOvQYGu8A4NBcWNSwcY39EiX
         NkIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NIur641qqE47js/eSqxuyeklFj3KcTRAZf+bgsz5Hag=;
        b=jUqTycWu+zSycb2wtED/ysqDdGr5S/795XLpDIbSRXmqAG7Y8vyjQs92QK41KqWACr
         vXRTWCl586R/eKCbyhUsCVaMBXvX8+aPy6wDjld3teWrrpKo0AX74g7HMaoOlqzHn5lU
         hJGTu5t9kikPOsDboLWaYuZ7shyh1781SZDKyULBV7bXZc+Yv4QbHpX4Q96scJKsTzwF
         R97VErRBuvof7VC235PEqllMtRTK7I13Ro0Jka/aufkVGCy+Og9xtEo/mo6N8XG0UxoK
         oWooHX/+13sZfzRX0UY6DoIzxLms2T59Kco2/G/EVl61vM261eAaej//kJwvl1qXBUA3
         KQpg==
X-Gm-Message-State: AOAM531JulR4QHSqbbD2EIQIu7aTZ4MSjDsb3FKvz4qkPvmMQ/NqGvco
        utVJDqtzm42Eqnp9iu8KZ/WpZQ==
X-Google-Smtp-Source: ABdhPJzRLuEs0GkUzkUsPfxGECD8mi/erqWxhuCBJeIAienKSlk0uH2Gy3H5eQg0p1I3ZylJ5nTH5A==
X-Received: by 2002:ac2:424a:0:b0:44a:e7bb:e990 with SMTP id m10-20020ac2424a000000b0044ae7bbe990mr281021lfl.651.1649109554298;
        Mon, 04 Apr 2022 14:59:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z16-20020a195e50000000b0044a77156ef5sm1282402lfi.242.2022.04.04.14.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 14:59:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: [PATCH] arm64: defconfig: reenable SM_DISPCC_8250
Date:   Tue,  5 Apr 2022 00:59:13 +0300
Message-Id: <20220404215913.1497172-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

CONFIG_SM_DISPCC_8250 is not enabled by default, but it is still
necessary for the Qualcomm RB5 board. Reenable it (as it was enabled
before the commit dde8cd786e37 ("arm64: defconfig: rebuild default
configuration")).

Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Fixes: dde8cd786e37 ("arm64: defconfig: rebuild default configuration")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index ca83390cd4fe..52c4408abb29 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1052,6 +1052,7 @@ CONFIG_SM_GCC_8350=y
 CONFIG_SM_GCC_8450=y
 CONFIG_SM_GPUCC_8150=y
 CONFIG_SM_GPUCC_8250=y
+CONFIG_SM_DISPCC_8250=y
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
-- 
2.35.1

