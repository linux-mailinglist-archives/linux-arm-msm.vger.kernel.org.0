Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EFD73548BF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 00:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242855AbhDEWsA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 18:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242852AbhDEWr6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 18:47:58 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70177C061756
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Apr 2021 15:47:51 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id o126so19731055lfa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Apr 2021 15:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1jU9us/3mI30guyXLRXo1PxXu6Cnze2Bw7/gT4xxmgc=;
        b=eHnqqFh4vgt3vbvjl38u7WjqYB3KSjYXly1PUNC0CdLm7U9pzOBhHywPaaYox9apmz
         bkiPXrR9iUyS4+GKy2f+9aA23Bb0NEPniZKhGwsAYnuZ2zsgzJNuqg5/ciwT6VqZV9Ch
         fH9CqKOuYK6KNhtxbrv+EXvE1HFRZ1TCtuw8LEZh/ffjEjAPl2v66cJsBX/t9Bk2FQqv
         515IdjPfSSW1UVCjXPdjta8/gyHoOls+gtmzTSIfbkkTalYmo62dC56xE0PSkly/rEDG
         H0k54EuRaONfZDKr1SGYYEXlbSRh6eiHRqruoEQrBdx7UCQuw0+2nHUNbTSSjWQJw9+7
         tvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1jU9us/3mI30guyXLRXo1PxXu6Cnze2Bw7/gT4xxmgc=;
        b=KZc6AgYF1m/3b3HqgCzX3HE7dERnDrbaXC1M/AZ/Z9Dqx8e8S9bYlS0eB+YXcX0286
         DTRjBPPV6V8ai0KNEj2fApy5fy5cHdeUpJJ/8UlyqAP1511LXi19kNIIjrILtt830HEP
         6hhQmM2AlO81tSi+gV+gWntGdEuBEUlmZ1ETXihAahQTACVgijHYiebhC+M5q/Ick97R
         JwJPJNEoBwiOYm/z+G9BekHTnG1YUsSABcEi1GpM/pxIypVoj8Kz9ctBS1IvE7LALvCp
         vY8YM0SmWjw8M+9/yhLbvFdv1gvnY4RY1SZ3kSnNJ+fDWWxD57EN8b+kunxHPDFbAbdT
         Jm6w==
X-Gm-Message-State: AOAM5331hj7UfySa6Ckgp2T9WS/t5tfkxXubx4CGrfVESW5vhMoQeoFS
        Cfio+SEWF/IbKt/epzpK8Rz5gg==
X-Google-Smtp-Source: ABdhPJyWLwaivqRvmtPm6E1egqt4ERO2mpjYBmvWXmgalpv0qcB16VOrwavqnkZrQGhW1dHPK4PyYQ==
X-Received: by 2002:ac2:568f:: with SMTP id 15mr1586974lfr.216.1617662870026;
        Mon, 05 Apr 2021 15:47:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:47:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v4 07/33] clk: qcom: gpucc-sm8250: drop unused enum entries
Date:   Tue,  6 Apr 2021 01:47:17 +0300
Message-Id: <20210405224743.590029-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
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

