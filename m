Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC06835307B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 22:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235559AbhDBU6U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 16:58:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235296AbhDBU6S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 16:58:18 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58DE1C0617A9
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 13:58:13 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id s17so6712600ljc.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 13:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1jU9us/3mI30guyXLRXo1PxXu6Cnze2Bw7/gT4xxmgc=;
        b=GTnbEgbKsX79rBeA/vMUlcHO7mDwhKtf+xQR8oPPUIzwRdFkxYLMffZk9dI4IU8Qta
         vKWmzv+KYxbThatuZ/TeKAUgzdQNhuOd4FBAed73evEOeZbrWiE6tSODoVvBRtuY0pC3
         T55OfbjOoOJh0n6ux3q0FaHfouDctxFbbc30OwGNvOlMqdLRy1EEVZtvYQlZwfA/hX6S
         J6j9rgTkm5bLzimzfFXyF7rbLe7M07e3S5YZPpTOrjJwdfZqD45LeyV1+5wClX9wc4rv
         Yv6yGLdsgBVBAhyzGmfOoClzfBZ5Z3KU4HVBgmFZDzzzQJJ2IF5xyIUbDjb650FerqVE
         KZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1jU9us/3mI30guyXLRXo1PxXu6Cnze2Bw7/gT4xxmgc=;
        b=qNjSCKZdeZ/Ge85n3yiP1JLAivl1X4txByGWGp904aQpY7NZmRaFsrKKhZPAgWHENs
         BGLXyRZMftqR5nJ58F0f4tHA7UYIBII6EhrfHptI68ErCNoqz943pL5Fn6t+4CqWNA3a
         nWoSNth0B6O5hb62EQk+OSFU4nUq+hTMr+ycymCDq+ziV3UKsT5PWqJyicU8j2F19FLK
         TWLf1hA9IzJMQDImgaKbCQqiBBs738ya+puVzE+8AYH4JbJuACadFLMTlMVu4E7agtm2
         G0U2Oq690zTcM8IDjCP2LBEN8wDm3cKCyMcX6FoZn5Ze+5UeLQ4vmbeOQlChnzpIGkcC
         HQfA==
X-Gm-Message-State: AOAM532i/nu1HEDv3Omvj9Jl1I5WZNV/AzkbUcRl0dwiE8lhwA2kY42X
        4f4TwwjQEs3W2n1ukTXNbRUeDw==
X-Google-Smtp-Source: ABdhPJxXhxuLXYyk89jk1XXEgijIWsZZ0JiIkXfQjfUh2ZTVAqOjkWOiSDAAp4CXRr0M+I1s4DjA4g==
X-Received: by 2002:a2e:9952:: with SMTP id r18mr9079603ljj.180.1617397092255;
        Fri, 02 Apr 2021 13:58:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b17sm959076lfi.57.2021.04.02.13.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:58:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v3 07/16] clk: qcom: gpucc-sm8250: drop unused enum entries
Date:   Fri,  2 Apr 2021 23:57:55 +0300
Message-Id: <20210402205804.96507-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210402205804.96507-1-dmitry.baryshkov@linaro.org>
References: <20210402205804.96507-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop unused enum entries from the list of parent enums.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/gpucc-sm8250.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-sm8250.c b/drivers/clk/qcom/gpucc-sm8250.c
index 3fa7d1f9ff98..67c136a77efb 100644
--- a/drivers/clk/qcom/gpucc-sm8250.c
+++ b/drivers/clk/qcom/gpucc-sm8250.c
@@ -26,7 +26,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL0_OUT_MAIN_DIV,
 	P_GPU_CC_PLL0_OUT_MAIN,
-- 
2.30.2

