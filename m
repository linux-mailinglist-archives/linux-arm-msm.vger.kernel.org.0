Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18C8E26600E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 15:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726025AbgIKNMV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 09:12:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbgIKNLy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 09:11:54 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DF6DC0617A1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 06:10:03 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id r24so12411822ljm.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 06:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KSlhvEq07UrSHzoeR1SRzs3RyWctK5k6m6swaX7LLqY=;
        b=wFaVSsWYdhfEmFdxO736pNv7rQ/OInzLf+QLdk7eZLS1hmB+bPlm95xD3FsH/wdANP
         fcQg0SF14eprMQx0oMvKO43/BuxO216vAxuFaZH6dtZMhNxSoG9RRx5c+IZSZJHu5X9l
         aehikXMqzYz2HmZCXtVJxj9dvw2CW9CyhbkQ4wqUSLE4ck3H0ofKORXATtC4Y1Mfy5XE
         dnLADeSedLKU20XrEqdmyWxvSoClgggd7ONJo/NmsBosYRZbiz6/jbgCRIeHeEbm3tHZ
         63vIJQjT2nz0luT1vq8BJjE/bxTVJ3RVm+qxO7qlN2t996CSYkmVA0R/sV8kUwh6NKEF
         XvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KSlhvEq07UrSHzoeR1SRzs3RyWctK5k6m6swaX7LLqY=;
        b=XkqisOGoDOKhCbde0Gr5FJrXC0Cw/kTzUjB/FRnSQ8mDnmReAthqmWwcCH+rUzP5RD
         RohUCN5eaNPrNKyslJi7nHt1TbqbxnCBat6qfroJOWwFv8oRgYFyRx9JkXoammfDCu7T
         SNLH+rfE+7zyD1xeezn0TTTs/g4Dxb+GnQA0y9Wq6XxKPLVA1doDMEdE8lh/VhHZSSg7
         qO/Ol8sLjiTAoJ4kY+1joKL4vhO2Rh4kqlCL20s6F6TzxF+P05sLwQbxfdICJ8RCe2Jn
         JvJ275Sa/88CtmVY6PH5lwBuuet3OgqXsDdApkjtYjZQ7qs+CVNOA3OgbQTuYOQfjAlb
         Gqbw==
X-Gm-Message-State: AOAM533fbTANQW4KI8ullw4+AVdeBH8ZS4nvHoDW+8bA8FA8ETiPGjbf
        JAcgeiIelOiY52Mf2xq1FdtCTw==
X-Google-Smtp-Source: ABdhPJzAyIeWpRWAivAJ0Mv70OonVsORAIWs5rND0Sb1rqKDi3fekdt8Ho7v9PX/dUHyZtoyFmmRwA==
X-Received: by 2002:a2e:2286:: with SMTP id i128mr888221lji.288.1599829801429;
        Fri, 11 Sep 2020 06:10:01 -0700 (PDT)
Received: from eriador.lan ([188.162.64.141])
        by smtp.gmail.com with ESMTPSA id 10sm429500lfq.64.2020.09.11.06.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 06:10:00 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org
Subject: [RFC 3/4] clk: qcom: dispcc-sm8250: handle MMCX power domain
Date:   Fri, 11 Sep 2020 16:09:49 +0300
Message-Id: <20200911130950.578483-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200911130950.578483-1-dmitry.baryshkov@linaro.org>
References: <20200911130950.578483-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On SM8250 MMCX power domain is required to access MMDS_GDSC registers.
Enable using this power domain for the gdsc.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8250.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index 7c0f384a3a42..fc5fb2b2fe5e 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -970,6 +970,8 @@ static struct gdsc mdss_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = HW_CTRL,
+	.domain = "mmcx",
+	.perf_idx = 0,
 };
 
 static struct clk_regmap *disp_cc_sm8250_clocks[] = {
-- 
2.28.0

