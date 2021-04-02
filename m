Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48094352560
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 04:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233894AbhDBCVP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 22:21:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233974AbhDBCVO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 22:21:14 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62E5DC061794
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 19:21:14 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id o16so4276302ljp.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 19:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yw9v3FzQxmFiB5ZmaLj1VaafcFx5aWR8q2x1pRfX23w=;
        b=F9JfnSruyG9bfx0EiX92NJ/xb6mtfovTEVnuKHvgUZD4MlSBbLJY93dWUsRElMeFDC
         xdspI2lfzuzkFMTC7YbhKs5nE3AmU1w9OqMgmlblkkkz0sLqbABtMtnCuuAhRn9m+4Pc
         ggs8wNEpfoFCIaun5g2R0Nrw93LnTgQkKtCnpfooqpo3PB4DjOBVwdiqbrjFl2Q4LCaq
         9N8TlPWPHMjPGTBVhmfQfc5FTx5Kj6zuwUXPWvUg9dFmIGRVTu06p/LGsal8S2KoIYf9
         tMVbrl1TXswQkHm6r64wTwcypHhTAVjP2H63K6atX7ypOh70SPTykT5wuvGCdH2lVGbL
         gxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yw9v3FzQxmFiB5ZmaLj1VaafcFx5aWR8q2x1pRfX23w=;
        b=E+g2dIHZ4jLk4EMZkuZ1/K/6rFQF1zydEubi7NsXvnW+mDVZo27+e4kCy0wz3a/XFp
         syXHrIPUYRsgNfv/PM0i8zBJ2BD2XT6NggrUho2Tm6PvXOU427OII/sEPf2uKoXH3j6q
         noYa0zeF9YQQxg/9+GMeNb7QY19oAX/OodKV7ElOiPYLjc3j1sJP3AwY2zALSm6nBMWA
         wEECP3K9dU9qEyCzxotKoxmUz5DYiqndLGiCrq8yYxKZy7KW0YG/lSMEGa/yaJDtleEh
         YpeJr9TtNfVxtEdTekzse5T1poDs3AgFISKo7/AnIutqIKKneeHFVJLrIR33Ylv/fecE
         i+Yg==
X-Gm-Message-State: AOAM530GHpwCzwNvqhiCiRBjkBgGPMp0RDtpVuLF4A1Z5g5UyCdWwgLL
        6jLkSWsJwQCGOP7N/t/qwgzXwg==
X-Google-Smtp-Source: ABdhPJz5wnijXZs+821/KVGqrlpnLdiNb08tnuwyD4dAJbmw5AtUs4ogpdVMOI6kcjF5qG+PPPEKOA==
X-Received: by 2002:a2e:9857:: with SMTP id e23mr7169891ljj.78.1617330072920;
        Thu, 01 Apr 2021 19:21:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x74sm713634lff.145.2021.04.01.19.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 19:21:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 03/16] clk: qcom: gcc-sm8250: drop unused enum entries
Date:   Fri,  2 Apr 2021 05:20:55 +0300
Message-Id: <20210402022108.4183114-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210402022108.4183114-1-dmitry.baryshkov@linaro.org>
References: <20210402022108.4183114-1-dmitry.baryshkov@linaro.org>
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

