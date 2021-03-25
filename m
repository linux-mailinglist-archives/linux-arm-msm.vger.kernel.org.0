Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2919348E9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 12:12:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbhCYLLz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 07:11:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbhCYLLv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 07:11:51 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C69CAC06175F
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 04:11:50 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id g8so1881512lfv.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 04:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yw9v3FzQxmFiB5ZmaLj1VaafcFx5aWR8q2x1pRfX23w=;
        b=OKL0kMbz00h0Z011f8bDng4Ulz2k1Q0UylW+myTy7tTUOn3u0xldXMO2FZNm/mr+UX
         4ertnJwbYPoszseq4rH4wNmKVRdaDdrvqGsvtTXbQ3Lz/d0kBnY50Kbe7haJndbbdg/G
         Op+YPsHOwuiuVYjiraIQaqYFlTdzwj3YffVSe6cug/EYbV6bQOWIz9R4ZtsFwN52giam
         D6s8FMwkVv0RHNZ0P0yuGumtEBI1QqbEB8C0zp6qa4pC+dw/AleUlp66TNFhQXEhylkR
         c9bCQRIQw9ouoWlUNnifiptImdOQWTIDbjSqLJ7RXxONZ/FfWtfV5sl6QmRy0K7ZpCOB
         PKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yw9v3FzQxmFiB5ZmaLj1VaafcFx5aWR8q2x1pRfX23w=;
        b=ljX+uF2WV65aucW93Q05r6/EVTD9HKas58cMgtHsWcfma9osvB0HT2KZTtL/RABDdM
         lbw2zJEqw5Bai9EB7C2kel3cV+Z+8QYECAz8h9CB+swb6Zy7BkBZSu5P+qH2VvJmabZT
         Mpx1k8l4rcP0zD86Y492X2xTyEv4J5S1ZpebCQN3glqvKAHEt2DpCA33mZKUugYs+LoD
         OS0Q5w7WjCNVf9DMupDMJ8qwcOnEnFT659iDpKUC41Y40vRJ18FAejrPa+Jd2EFReEFI
         wBxwkqyb7JqhUKYGH1t2gSjLDq+xVOytHNwMIvQMkHb15k6k1mceXW9jp2gjZRHZfjTY
         sVpQ==
X-Gm-Message-State: AOAM531phtkJguZMiHTHe5yrf+hIHhx33aLX4FLlRDC9pU+sfdwlXXhM
        7EZTJkU/daBvTwL686f09be+dw==
X-Google-Smtp-Source: ABdhPJxH4oWb7M/hZSIblGO+zn8CN1vqhRAhGYR8yWRmbxhDB742nXP/jOhXDhE4QrmHlAUmjm/X0A==
X-Received: by 2002:a05:6512:31c8:: with SMTP id j8mr4651883lfe.288.1616670709358;
        Thu, 25 Mar 2021 04:11:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t22sm715191ljj.94.2021.03.25.04.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 04:11:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v1 03/15] clk: qcom: gcc-sm8250: drop unused enum entries
Date:   Thu, 25 Mar 2021 14:11:32 +0300
Message-Id: <20210325111144.2852594-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
References: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop unused enum entries from the list of parent enums.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sm8250.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
index ab594a0f0c40..86626a027f6f 100644
--- a/drivers/clk/qcom/gcc-sm8250.c
+++ b/drivers/clk/qcom/gcc-sm8250.c
@@ -25,7 +25,6 @@
 enum {
 	P_BI_TCXO,
 	P_AUD_REF_CLK,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_EVEN,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL4_OUT_MAIN,
-- 
2.30.2

