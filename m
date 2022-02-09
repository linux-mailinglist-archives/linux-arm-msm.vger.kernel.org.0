Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C36B4AEE73
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Feb 2022 10:51:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235000AbiBIJuM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 04:50:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233701AbiBIJuJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 04:50:09 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7619DE03A99A
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 01:50:03 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id u12so1719161plq.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Feb 2022 01:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1wTIjLivrgPfop/XqqzPH2ki4x3bw9zR7SXERTNkUpE=;
        b=BmPUOAsOyFIy/ROJwTkfoKGMMQeUrXZ/VeQ51zjV07Oac0N2yds6QbO0e46Q0aEy+w
         RzfdmSJfLrhkXDvAl+TStnSEorr/uvecb97lskcIQtfwWhvJ4ULNtZJqGkOkpmCZNH3W
         Q6m40/vzhC4VIgAJBBiRZi6TgEXtztRXLD+lh/tF+6LBexJo1/3l4XEeFynju7nYyt7C
         esNcDX/34rID/6YlaNhDw23+D8wYzL5R9OfLtxRkvEBgA5SmDaXbrKVVDubjfSQbQ5qj
         tHj5ovyN2qH2tYJPqoZj3rlC+i+EcTfJcc1CbvjrT4K6nu7+qQT4M0mNfeGhQv/BYlAl
         NEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1wTIjLivrgPfop/XqqzPH2ki4x3bw9zR7SXERTNkUpE=;
        b=EAN9Aq/yr3A3GnX/cazhIoakZ9zl7a17A8aDkEzl9Xw8yhw98w6FzS2Td1s0742+Ke
         Z7wU3KaqhcckL7GhZF31PXJ4lO7vlE6tC7K8d5K406by/QniFfZDTkGR1emJWxPQ1hRO
         WZtLM0kqie+YQtj5NNouuStNVVXlHPyJqeNK5XjprAph2Fam/4MsgslI2Bw6XlD0FZxR
         Ix7Dhhy5QKWVKj1VkkrZwlbCLib6c0WzZYMiA1t1pjaDJUjUN3iPbXWRDdTcGMXP/yox
         IiMsdWSyzCqWqWJes5M4agY+8mJOorvZcHaQTxl5PaBKyVDbpoqm/Zl9288AivXxp+Ey
         /aTA==
X-Gm-Message-State: AOAM531BzlpbWF8taIF2xxlTH1sHHYVwCgBilijE6n9tuSGIyM1xhYPo
        zlBDthJGjFr4saMmk2u/cynW
X-Google-Smtp-Source: ABdhPJzfyc6tO7XYdUYzeul0/pG0KZLMVeopkZCqa+HTMN4bS4LlZLAjPlc7RWJovlvCfqbxESALbQ==
X-Received: by 2002:a17:902:ce04:: with SMTP id k4mr1403914plg.153.1644399983719;
        Wed, 09 Feb 2022 01:46:23 -0800 (PST)
Received: from localhost.localdomain ([117.217.179.178])
        by smtp.gmail.com with ESMTPSA id p4sm1912948pgh.53.2022.02.09.01.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 01:46:23 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
        quic_jhugo@quicinc.com, vinod.koul@linaro.org,
        bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org,
        quic_vbadigan@quicinc.com, quic_cang@quicinc.com,
        quic_skananth@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, elder@linaro.org,
        Paul Davey <paul.davey@alliedtelesis.co.nz>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>, stable@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 01/23] bus: mhi: Fix pm_state conversion to string
Date:   Wed,  9 Feb 2022 15:15:39 +0530
Message-Id: <20220209094601.26131-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209094601.26131-1-manivannan.sadhasivam@linaro.org>
References: <20220209094601.26131-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Paul Davey <paul.davey@alliedtelesis.co.nz>

On big endian architectures the mhi debugfs files which report pm state
give "Invalid State" for all states.  This is caused by using
find_last_bit which takes an unsigned long* while the state is passed in
as an enum mhi_pm_state which will be of int size.

Fix by using __fls to pass the value of state instead of find_last_bit.

Fixes: a6e2e3522f29 ("bus: mhi: core: Add support for PM state transitions")
Signed-off-by: Paul Davey <paul.davey@alliedtelesis.co.nz>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Cc: stable@vger.kernel.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 046f407dc5d6..0d588b60929e 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -79,10 +79,12 @@ static const char * const mhi_pm_state_str[] = {
 
 const char *to_mhi_pm_state_str(enum mhi_pm_state state)
 {
-	unsigned long pm_state = state;
-	int index = find_last_bit(&pm_state, 32);
+	int index;
 
-	if (index >= ARRAY_SIZE(mhi_pm_state_str))
+	if (state)
+		index = __fls(state);
+
+	if (!state || index >= ARRAY_SIZE(mhi_pm_state_str))
 		return "Invalid State";
 
 	return mhi_pm_state_str[index];
@@ -789,7 +791,6 @@ static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
 		mhi_chan->offload_ch = ch_cfg->offload_channel;
 		mhi_chan->db_cfg.reset_req = ch_cfg->doorbell_mode_switch;
 		mhi_chan->pre_alloc = ch_cfg->auto_queue;
-		mhi_chan->wake_capable = ch_cfg->wake_capable;
 
 		/*
 		 * If MHI host allocates buffers, then the channel direction
-- 
2.25.1

