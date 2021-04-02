Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80E9E352571
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 04:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234229AbhDBCVX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 22:21:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234174AbhDBCVU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 22:21:20 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECE96C0613E6
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 19:21:16 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id u9so4236695ljd.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 19:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LaVGcGxnlvWl/N60TSPqkBXVPvOJpnJu23KDJt8v/cE=;
        b=qL8V/rUglrm7QXoXNI4eaFBE2y27GGvk+aXQpUPQu52oOh5iMakv9/04aAFor+/zYG
         GvHASM1e3SMZXL4tisx3adwZ4CnmTc0SIcMEXn76NGCTv0+daB1H01+7K6NDPW2eq47G
         MC4Vmee5FRyU1fkaDykZFYi0hpo8b2mQTVu+TUvOlblWIc38JSZZ5CMp9s2XeK5UhXQ3
         I0RlubCuEkk4lCSYMOSwNGTvdP00krah2qEnL5UNA/p1Osak+Vzjm1ezClRhKuBtYIWz
         9e9+OaM/oFmCjNJvJ3/FxUA86F72rrEaGJdlAr8JQTUE1haoqMYwbyUltrCDHpp1jr82
         1v5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LaVGcGxnlvWl/N60TSPqkBXVPvOJpnJu23KDJt8v/cE=;
        b=qJ5p6+TxKvZi82Mh/XOgGTSRXdaNCrjDCjl6R0HTfRFqAYLqivhc01RrZJuFD1XX+k
         rB6GyV0uT4cdWxr9Fr1EvbouxGFk0jDQ6EjsCauENnGOd3RR/yRpSvqxNb4ub94+ceTn
         u7Ra+KytSIUbF8keWrCVtDYUiHSWVD/u4icXt0A9Wj/cpL0PuRTZsjT4mShISFbMiv74
         zEBeheg9osj6y2knQYZWhSy4yQHtgMRjH4IyRb+nAQV2dZlDnmwdC50v1g9+ZRDdFZLW
         w9Q3hYvafzdDNYlezxfDpkDMVPcd95ptmuKSoVNdP98SUnMgpC4IiYDi0Cr0HMyH3zFj
         NGtw==
X-Gm-Message-State: AOAM5329L17J3hWkZU3U1+Kez7+50yiBkx1h7/NPA8m7U1cPEC/yip3k
        NCy9CssUUwAaM4UhmRwJxkzyXg==
X-Google-Smtp-Source: ABdhPJxeZGdbKZB4ruHFH+dGln6t9eqe1jXdghIAcD3WpwFu3SVaoBar0hCX1kiHLB9sJWdoIMByew==
X-Received: by 2002:a2e:6e1a:: with SMTP id j26mr7069514ljc.171.1617330075472;
        Thu, 01 Apr 2021 19:21:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x74sm713634lff.145.2021.04.01.19.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 19:21:14 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 06/16] clk: qcom: gpucc-sm8150: drop unused enum entries
Date:   Fri,  2 Apr 2021 05:20:58 +0300
Message-Id: <20210402022108.4183114-7-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/gpucc-sm8150.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-sm8150.c b/drivers/clk/qcom/gpucc-sm8150.c
index 27c40754b2c7..2b952f561537 100644
--- a/drivers/clk/qcom/gpucc-sm8150.c
+++ b/drivers/clk/qcom/gpucc-sm8150.c
@@ -21,7 +21,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL0_OUT_MAIN_DIV,
 	P_GPU_CC_PLL1_OUT_MAIN,
-- 
2.30.2

