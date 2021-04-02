Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2851F353074
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 22:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235307AbhDBU6S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 16:58:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235228AbhDBU6M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 16:58:12 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED4EBC0613E6
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 13:58:10 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id g8so9053859lfv.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 13:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yw9v3FzQxmFiB5ZmaLj1VaafcFx5aWR8q2x1pRfX23w=;
        b=EdE4Uauelokt7xJ8GNSA/FafwJPDUu/E9F0/s6dQMveuzf9EbySyzJ1QZhasSeFGiV
         In1Oe6wWLt5pwak2dplQy/FGxFE7M1GZhX6ZrutCzP0NtM6RTKSjwEtMMyydBbtSy1Sj
         p+MfMAhpzFwdnYP0znf9m2h1zX02CTyNBatAGCKyN6A0mRWBxXD161eahDQzpXmYFVSe
         MSHP3KWvQTwLNXGDr+Bn3bz6Te0RsONWOuzRCKzTuDASqjZ22dUMAauuVAguILFSpjLj
         mfGqNxm2xTqHJC08SiEF3ON94hsGBMHgwXE+u/Fxh041fxyoc/OaChix72FdJFAYl5QT
         afrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yw9v3FzQxmFiB5ZmaLj1VaafcFx5aWR8q2x1pRfX23w=;
        b=FLNIcU8y7R356kMohwNb1S2M8gMhj5UkfQPTtsNFEAi47mMOgB9bLQ0RgR+aPz3mA5
         PwbAv5JuGu3SFfRNrJvyRXNiQZ/VoQZFu1f3SsplfNDOG4f0MA1vKPn/cUVtpILRV9gw
         zRx6dYx9s2qqStReYWeirWafz2dnYSlPHJbGfYlb+XsopvtHHit7IV2eWo0S7gZfUwwd
         Qly3ZTjtAyfosmiJy1kC8eOw5Dc5h82qwzs0rhpyUg8GwfabAV+k7ldHm5Zn9aSbxuLp
         JXIn7oKxsD8YyrvrADjzJozMihfZCpAH+erP8mzLXaH8n9p+cSAOIRCVFAhZjr/6/X9x
         9aMw==
X-Gm-Message-State: AOAM532NiVi253Zu3cu8SLWPCP1fJx9Pm1wu4OVqtoaAjDKRc9NkUlex
        Aa4U8o5jU4y3nikhT031Z03YoA==
X-Google-Smtp-Source: ABdhPJz9NqFHiFwIosV/uv8W0EuFsxZEE28rJBZatW4rJ+++4xXxZb/zm5HGE0G1t3vwGZCc1GOYpQ==
X-Received: by 2002:a19:8c19:: with SMTP id o25mr10009188lfd.547.1617397089547;
        Fri, 02 Apr 2021 13:58:09 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b17sm959076lfi.57.2021.04.02.13.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:58:09 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 03/16] clk: qcom: gcc-sm8250: drop unused enum entries
Date:   Fri,  2 Apr 2021 23:57:51 +0300
Message-Id: <20210402205804.96507-4-dmitry.baryshkov@linaro.org>
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

