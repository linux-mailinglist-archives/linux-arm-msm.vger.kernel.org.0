Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F10C83548C6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 00:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241382AbhDEWsB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 18:48:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242856AbhDEWsA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 18:48:00 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C46CC06174A
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Apr 2021 15:47:53 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 15so14319861ljj.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Apr 2021 15:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e7cDGwvCK159I/9FSrY1M64d33eVbPn2loBLKSHFDao=;
        b=iO17GaXV+HCFVR6adStyMQ6Kq1k/DXe2MXVjWfuL4gNcK1XowODZQ0xOiXWzrklyz9
         PndQ2u13UXj50usm68Z0TFhvasExah/39jRF2h5FS2ASiAxoo1dbKoQv587/ol65ZKUD
         389roAZzyKe7tAOBF21H2g4aCzHIF3FbPqe3e8u1WrrtArIVCC6SraHQBW5thEOWHc6f
         hl13WAyfVMx7H3Spm82orf/HMpTrUqNms4W4uyKPnjF8KabeObBvblnBzLpn9OSx+R1J
         SU1E8BZRZs9NnfWUpNLoP20A9od5+k2E6DNjPree/DBce9QbJyUW1En4fuo3nxJ809X+
         v4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e7cDGwvCK159I/9FSrY1M64d33eVbPn2loBLKSHFDao=;
        b=cIuAvkP+sXlCVdJte/QvfDninvv9aJVImw6b93PCsyp3KjZWIToKP97ur4V0Zk9IH9
         QL/Ct0+sia8F0jIFNI5480lnXUYXgDmaJb7yCQVtNNQmPMeojpuEE2dpQCILIQFVyraW
         FXewRzcy9pk9WP1h8JUeVGqQEB8ICYHOYe5Ed8sC4pb9nyPdkKsSqHCDIGfXxo9tLehs
         QZwhNLjZnxw1zbfKrRBEfVPpZxwTobiXuzJ10XISBOm6MQQKSnTU5PtCAZquu1SeEgoi
         I+PnlvuUPUYPpetypiE0wr5ApV6JnHL8IXotjkLm4A33MH47lHjJ6Y26SA729pSaOMVZ
         YW1Q==
X-Gm-Message-State: AOAM533F+0nSOVovuIp+Tbz/31Zb03beWLZuk5KhgBZAVR+ZMWwYnFs7
        dxi/4Twf+sYmG+B50nu0VbZ/iDLzzk/YiQ==
X-Google-Smtp-Source: ABdhPJyLTG9aCXEDyChdCwUCn5sSiBa5lzAKE7LglrDQOvlPNhnZHgZH7yBWepx5SUfVwODwjO8drQ==
X-Received: by 2002:a2e:6a17:: with SMTP id f23mr18113277ljc.91.1617662871983;
        Mon, 05 Apr 2021 15:47:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:47:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 10/33] clk: qcom: videocc-sm8250: drop unused enum entries
Date:   Tue,  6 Apr 2021 01:47:20 +0300
Message-Id: <20210405224743.590029-11-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/videocc-sm8250.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index b0efadc19634..06a8a2c98deb 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -21,8 +21,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CHIP_SLEEP_CLK,
-	P_CORE_BI_PLL_TEST_SE,
 	P_VIDEO_PLL0_OUT_MAIN,
 	P_VIDEO_PLL1_OUT_MAIN,
 };
-- 
2.30.2

