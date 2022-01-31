Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0022A4A4C7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jan 2022 17:51:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380616AbiAaQvD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 11:51:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380622AbiAaQvC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 11:51:02 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E957C061714
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 08:51:02 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id z19so28008702lfq.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 08:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CBkDrAMjshRvhGsI7UiuN5zXYzbw4ka5isoequ81RV4=;
        b=gp6vc3CWYoi33LQ5YYqUNWLLzkw0XUjp0sKdwY4D1pLQUJPLp6dXsbpcrzl4q+OkP1
         DHcC7/sEg6Kj00iju7km3nQGgAeLfidE8WxvvCKM+lk7SJ8ercLJMEdhMEbYRbuQLz62
         sud/Me8gk1AnNu94shk0JUAXpqvRpudMfgU5oTEN9dLFLUtIAooH1pCGsR6qpUXsXtLk
         vwd8fUapWCJiEd7yIccex1gBaRqsyKYBfcUaG1D+Vb1oo4tSH/kgIa8yVB5F8Ix/6JuU
         QT0jQBVJan2oNnuI7Xe+JUjdHY0/HTUvqF9Ft5FEdlQAcs8BvbPqbXH4bX4993nD+3ak
         hGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CBkDrAMjshRvhGsI7UiuN5zXYzbw4ka5isoequ81RV4=;
        b=UC4d1zECBA9Fj3YQJsNy46BkxJk87l/6h+vzDGybZ3ZMcgKK+s0Dybm3V3hPPGPs60
         0p1+M9mu4wz7CKPe3TeKxE/rqhflRhvy58EkfdnXCHnY/ypELLREInUGcxmHyuOWN03A
         1uNQhCKqC0cY+s92rxA9HikPQkrMeVbWoBAjw4VkFOPW5lf9TvoXdKRo3uwPJvD8j5KV
         rfjefFuqp0Am3wCHxz+DumV2dApqfdauy6/f8wesvdbu4vqRE2iJw6bj/ayB6xboH3kI
         hXRdYOvtzEHuySUBAaAXIQXWGllUhzz3mLxvR+3gKu/g/U0+6RD07FD+mkkAa/5MZf1j
         TvAA==
X-Gm-Message-State: AOAM531Mjns3gKkmbwfnLy42MK4mBOKYyDlaMGd+x5ra7S+3UJy9gKXC
        1gG33kzB23Y3GkfKd5+31SKCFQ==
X-Google-Smtp-Source: ABdhPJxk1L6WTdq72a03xQvE2dbzD7wbA7HnCP5wMZvcUtct8LdhV4dSEZvHmieei8q0mcfJdRoltg==
X-Received: by 2002:ac2:5095:: with SMTP id f21mr15965845lfm.20.1643647860635;
        Mon, 31 Jan 2022 08:51:00 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i19sm2749853ljm.51.2022.01.31.08.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 08:51:00 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 5/5] arm64: defconfig: Enable SM8250 video clock controller
Date:   Mon, 31 Jan 2022 19:50:56 +0300
Message-Id: <20220131165056.2117434-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131165056.2117434-1-dmitry.baryshkov@linaro.org>
References: <20220131165056.2117434-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Enable the building of the sm8250 video clock controller by default.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 8a68dadbcc7d..b2da438a40af 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1024,6 +1024,7 @@ CONFIG_SM_GCC_8350=y
 CONFIG_SM_GPUCC_8150=y
 CONFIG_SM_GPUCC_8250=y
 CONFIG_SM_DISPCC_8250=y
+CONFIG_SM_VIDEOCC_8250=y
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
-- 
2.34.1

