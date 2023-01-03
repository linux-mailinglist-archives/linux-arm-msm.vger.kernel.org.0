Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 905CF65C268
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 15:57:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238049AbjACOzr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 09:55:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237409AbjACOza (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 09:55:30 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE5BD11C2A
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 06:55:26 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id n1so32077074ljg.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 06:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CORyEBVk4ytlzf3SV0AvS8Vw2uTC9W6YTVva2pzko0=;
        b=PudTq5ApZhZRaa1vda81G0kuNP9lHxWTUebYjno9oiJLEBhwvq3/1NEeZ7LZA9e1YT
         qg5liDZ6dfKo5EtI3k0qdtYz8zAe1x8bBtYDZof/nxzePTxzGbaCnbRLw9fhK6l2aSKo
         7B6mjrIj0IV33cX1IWbvpboX/iT+GOa2jRsGI31J6GWjGXckMX6y2FyIk0upTlNDsTFK
         SG/rFkW7zT2SXHZ/34g0ZVbgumFKbcUYN257Cmy7dCbSbMNA9fSG5N0XkLwTbpKmr807
         SsXYLi4f8tQCulbbl0o38AvacKE8pBANqLwJiNN8onTNRMhL6oARskXV4LO2wyZF+gBG
         SXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8CORyEBVk4ytlzf3SV0AvS8Vw2uTC9W6YTVva2pzko0=;
        b=iEbDQO+sV1+EZ6mAPwupttOSRu6IZd6CmB4bo5AiiO2b0gvzTmaVVxtW9GphYxClZ8
         68ERP/1tWZJ9mwmxLdL1FZ62e4ykNpt5GufVGZW762RZ7DKNNUGIxdv+6vwTNEOQelCI
         TKDlPCaBp572pj3JKtB3AZvoQFa7YS852rPrugOz8cufdv74S/Pox4GmGNsCn4SJhUDS
         NfGS93wicOahb4F95eBL5P3eK1rtsEoauLTbcQNhQmPDLrl5d4MD4k4cu88ds48vNmNk
         Apc5U4D95Smfye9dUMKKmRpvAOUgAs/dI5AJUYZc3LB2otKQ5AQC5AulFZsA8S8qJCmK
         4v+A==
X-Gm-Message-State: AFqh2kpB116eyBlwtnvDumJdEqHquZYOBb4DZ2WQZc2O5seN6JRboIWT
        uX78OCGln6ajBZGlzcwwz6uPPA==
X-Google-Smtp-Source: AMrXdXvErvxfWe0ekiZsXw5jd0JN48+mgXA+JgYfCe3cFVNSXr7trFtxW/1WyUVjBXTVjkcgJ7FDnQ==
X-Received: by 2002:a05:651c:10a1:b0:27f:c535:523b with SMTP id k1-20020a05651c10a100b0027fc535523bmr7564706ljn.25.1672757725270;
        Tue, 03 Jan 2023 06:55:25 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s24-20020a2eb638000000b00279cbcfd7dbsm3544015ljn.30.2023.01.03.06.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:55:24 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 09/21] clk: qcom: gcc-sc7280: switch to parent_hws
Date:   Tue,  3 Jan 2023 16:55:03 +0200
Message-Id: <20230103145515.1164020-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
References: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change several entries of parent_data to use parent_hws instead, which
results in slightly more ovbious code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sc7280.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index 46d41ebce2b0..1dc804154031 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -2760,9 +2760,8 @@ static struct clk_branch gcc_usb30_prim_mock_utmi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_prim_mock_utmi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw =
-					&gcc_usb30_prim_mock_utmi_postdiv_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb30_prim_mock_utmi_postdiv_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2810,9 +2809,8 @@ static struct clk_branch gcc_usb30_sec_mock_utmi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_sec_mock_utmi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw =
-					&gcc_usb30_sec_mock_utmi_postdiv_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb30_sec_mock_utmi_postdiv_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.39.0

