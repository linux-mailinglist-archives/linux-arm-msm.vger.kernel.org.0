Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68E6D3548B7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 00:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236230AbhDEWr6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 18:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237861AbhDEWr4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 18:47:56 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C67ABC0617A7
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Apr 2021 15:47:48 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id v15so19657763lfq.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Apr 2021 15:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yw9v3FzQxmFiB5ZmaLj1VaafcFx5aWR8q2x1pRfX23w=;
        b=qZn7TQFEMse95Tv7s5fztc9JMxAHGZe1yzeapMY2DbDtaZxySiMEQ//iUjOAAMP26X
         QgARWe/ViQrNO3RQCezO1GSALYqYCGJjgUkOL/Pr3UuKHURkSr8dKG6wywZ1Ngv+Byje
         omnOg+LbPvJtMbxGNPqlKRLInTCt73QxTrMY3HFhTBYV900Tx6Gt1K/1FZL74actir3d
         zIF3TZkIsv8+2Y2P3Jjg0wsTduqlLLPXBvNQn/bQm7NikWFVi2PcngxHJeAqGA3GkFbJ
         7iKdOy1Z/gNyvqkdG0CJkZ4/xCSooDt8wcjs8Z/G22GYKu7ZdFQshO0eNjLa2EVNjktX
         B47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yw9v3FzQxmFiB5ZmaLj1VaafcFx5aWR8q2x1pRfX23w=;
        b=L2SAt/YdVLtLMefSd0WHMvKLpLhHXuXsA2o9zphboUToY4qORL00OCHYi0Ek5RfV/f
         r/2bzuJXDFOKrw0MJ8QzaPI7TETlLuTvbuygyUbzmpZdy52UoS/14H6UW4bzmOBt3oNV
         Faz5rFtuQ8cudMnM+8Evly0Ngpf8UnC7mIwTKHQcaJO2TTb8ZndlT1Oj/ovRIzt4B+Ek
         jW92Suy9j66dgubP20TChdeXT5aByIjPUmuQFynh1qBt23HIq5ERag9ByaLlBZSecuvO
         /a4FoL03wmwsaKhWhhFyN+Hie2C04noqRNrcd2HWY+2SANhhtggkOp8Co7Xlq3v+8U1d
         auAA==
X-Gm-Message-State: AOAM533fLylKA96EIDeH8j+NuoKG7IQLboL410ZOZolpY/gRyFyWJSwk
        GbUJ5VvOefgbBUC9IsBJXlK+HQ==
X-Google-Smtp-Source: ABdhPJwzxnjyc9sUZi+RNjd4KNHYY8jzcVcTKiPy2e55PO/HSWSWaghbRNkiX9Bth+GY1Avo91LCTw==
X-Received: by 2002:ac2:47f2:: with SMTP id b18mr7705789lfp.471.1617662867308;
        Mon, 05 Apr 2021 15:47:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:47:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 03/33] clk: qcom: gcc-sm8250: drop unused enum entries
Date:   Tue,  6 Apr 2021 01:47:13 +0300
Message-Id: <20210405224743.590029-4-dmitry.baryshkov@linaro.org>
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

