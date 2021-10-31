Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF2B440C80
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Oct 2021 03:07:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232167AbhJaCK0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Oct 2021 22:10:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232130AbhJaCKM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Oct 2021 22:10:12 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B96DAC061767
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Oct 2021 19:07:34 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id 187so12979718pfc.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Oct 2021 19:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vqKYg6dNuNcTvm4gAvh9iY3XhP1oG3tG2dM4lX9EWLU=;
        b=FqQ+WYpzW/8dJmtef4TQNCOMBHv/+8ehEx1sXKW5SitexXRcNqc+kl2iD6C7cIH13t
         X4dzh4sqB7sgNq9qVJB7U3Jid9Q8mzo5Oy3wcZFDK2RWR27DUzkz3xr7pplD1of6Hsln
         IME09zob+JHkU03vNL3kYCfnlEgVavqnKxEucgRolhsTqyHs6Jss015kuXyYPOrmctbf
         +2RQU8TGjmQVisadqnXVN2rXhe++c4jXuHDabGWx45QrcdsGlCG8dJkR+B2hLRbrxd+0
         BBSpUOngyF+xyjH+G/0Vc7xZtncucyEwszkpZlGqQlkOXaYb32iktiOZqZgLA6vxe4yb
         d1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vqKYg6dNuNcTvm4gAvh9iY3XhP1oG3tG2dM4lX9EWLU=;
        b=IxwX8fRTM/Vp2VQJsb+iV6QQ73r6awhVd269YkCLtj0N8dWvsOc3/9z9cFhEmlBU2A
         T3tYQjh8UCZxJf8nzZThtxMjo9kPrFfBuGAbpvkkcaEUREnbFFLhy1a8+MOdUv3SP3+I
         1h7xDa5eJ7+VEEVCr4MtnOznHXUuNNUYX6mNDIeVoR1WQh36dS1kFPv5EW/5Qrp0IofD
         ok111Sy/Lze/UKE8I4GVuJau7eMiw/BQ5eT/zDT2etXWZhbq15mj63NDPTu5G87Y1d7U
         rKep68XxUclASNEcP6Y3QxDZH8H5ZrNkKEGJZ7IPIbCN+TUk9OlELAgCpSmXZH84wp5e
         NSpg==
X-Gm-Message-State: AOAM531uM+oUWFYaccnNg8s4EJZqnzVPP8SGqaLKVhnaoqecSPrKyIpC
        ZuQs/pQN3qv/mROuJgo+qMoDhw==
X-Google-Smtp-Source: ABdhPJzn24RYS3oErnKGYpc3gzdG/yLAzl/Rea65kdjXmf4hJKcqkFFDBKEi5vC2ws5LUvYMd1P3sw==
X-Received: by 2002:a63:155d:: with SMTP id 29mr5700982pgv.245.1635646053900;
        Sat, 30 Oct 2021 19:07:33 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id p9sm10748986pfn.7.2021.10.30.19.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 19:07:33 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 3/3] clk: qcom: smd-rpm: Drop binary value handling for buffered clock
Date:   Sun, 31 Oct 2021 10:07:15 +0800
Message-Id: <20211031020715.21636-4-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211031020715.21636-1-shawn.guo@linaro.org>
References: <20211031020715.21636-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The buffered clock binary value handling added by commit 36354c32bd76
("clk: qcom: smd-rpm: Add .recalc_rate hook for clk_smd_rpm_branch_ops")
is redundant, because buffered clock is branch type, and the binary
value handling for branch clock has been handled by
clk_smd_rpm_prepare/unprepare functions.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index dd3d373a1309..ea28e45ca371 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -189,10 +189,6 @@ static int clk_smd_rpm_set_rate_active(struct clk_smd_rpm *r,
 		.value = cpu_to_le32(DIV_ROUND_UP(rate, 1000)), /* to kHz */
 	};
 
-	/* Buffered clock needs a binary value */
-	if (r->rpm_res_type == QCOM_SMD_RPM_CLK_BUF_A)
-		req.value = cpu_to_le32(!!req.value);
-
 	return qcom_rpm_smd_write(r->rpm, QCOM_SMD_RPM_ACTIVE_STATE,
 				  r->rpm_res_type, r->rpm_clk_id, &req,
 				  sizeof(req));
@@ -207,10 +203,6 @@ static int clk_smd_rpm_set_rate_sleep(struct clk_smd_rpm *r,
 		.value = cpu_to_le32(DIV_ROUND_UP(rate, 1000)), /* to kHz */
 	};
 
-	/* Buffered clock needs a binary value */
-	if (r->rpm_res_type == QCOM_SMD_RPM_CLK_BUF_A)
-		req.value = cpu_to_le32(!!req.value);
-
 	return qcom_rpm_smd_write(r->rpm, QCOM_SMD_RPM_SLEEP_STATE,
 				  r->rpm_res_type, r->rpm_clk_id, &req,
 				  sizeof(req));
-- 
2.17.1

