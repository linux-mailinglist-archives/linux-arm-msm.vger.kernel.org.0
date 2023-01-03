Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 132D765C28F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 15:57:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238070AbjACOzu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 09:55:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238009AbjACOzb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 09:55:31 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 429AEFD2B
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 06:55:30 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id bf43so45974178lfb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 06:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBFBa94LOYtAKTpqF+8YTvj5eVuXjTfFgPq2gtBk+vY=;
        b=XYTmZm+PHwqW5z+HjG22ssWjnCav6RgXY7u6MdYUnBRgSDa1q7ypb4zQ/UKfc2NSji
         YAJdkaVqcwv4ftWBpqxv0bayr5uGmHlByyJ9CADWfsgSbsrSIpzvsuDbO0tA69AoBMQB
         RpEYUfOZsXg/7Nr4PefjMAO99rqBO/izXgU7m3cN9R1V5UCxA6IdCxqYstv8m/qO4XiT
         HDVoyKES0ix865h4XhsfRXF+3QiRMWgG8GSYVwA1ntp63dTV5aQsT8RYxP7PEx4wbeFk
         5qK+JtTjFDL8mdmJIO9+rO7XwnFYhZ8JxQCDqpX8wf7G3yDZXrNC1fROu8PT4NE9g32a
         H6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBFBa94LOYtAKTpqF+8YTvj5eVuXjTfFgPq2gtBk+vY=;
        b=31umUfqko5BGjJ/4SdBGNXco+qKM8XAXOwNVxh4QsnJ4xRajn36olGyDIW+PYoIXvc
         mJPnUFf77RgwZ4x90J8DfUtGgCoWQg39473XWK3UbkGEstFI7edgRUHVpRYgAAlFupIe
         Xgox15J8rLMQh57s9fMJevOGnuUxBJIp7oKzUKuku7nBa0togKLgSx7blWFM9RNFX4/c
         RZAfnRXyzB5FHmhkZ4QxXI7kGPyIxnmP5IfAZ2uNPN4yjT5NJoL3KN0HBqK8DbVLf6+D
         9z3FaEgKbCK2I0l5d16DeYZi4/SNRjSFrbj9X+OR8363+qW+BkvEzn/KHpoDiGZMXL/O
         qJAQ==
X-Gm-Message-State: AFqh2kqLswsrLuVn6k9a7AQMgNXWJFbHZKiW11jb2HXF0jHk/iKAgVTX
        K+i1qoacc8SFJzQgMoxw4fXyYw==
X-Google-Smtp-Source: AMrXdXtqiZgPQreufD78ygd+6HpgUBbSO+ZongiSosHDBojzjh0/jzbLbazjz2lq1N4iMf8fOVgIhA==
X-Received: by 2002:a05:6512:3d08:b0:4b5:9b84:2366 with SMTP id d8-20020a0565123d0800b004b59b842366mr14336165lfv.58.1672757728601;
        Tue, 03 Jan 2023 06:55:28 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s24-20020a2eb638000000b00279cbcfd7dbsm3544015ljn.30.2023.01.03.06.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:55:28 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 12/21] clk: qcom: gcc-sm8250: switch to parent_hws
Date:   Tue,  3 Jan 2023 16:55:06 +0200
Message-Id: <20230103145515.1164020-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
References: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change several entries of parent_data to use parent_hws instead, which
results in slightly more ovbious code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sm8250.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
index a0ba37656b07..b6cf4bc88d4d 100644
--- a/drivers/clk/qcom/gcc-sm8250.c
+++ b/drivers/clk/qcom/gcc-sm8250.c
@@ -2998,9 +2998,8 @@ static struct clk_branch gcc_usb30_prim_mock_utmi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_prim_mock_utmi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw =
-			&gcc_usb30_prim_mock_utmi_postdiv_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb30_prim_mock_utmi_postdiv_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3048,9 +3047,8 @@ static struct clk_branch gcc_usb30_sec_mock_utmi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_sec_mock_utmi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw =
-			&gcc_usb30_sec_mock_utmi_postdiv_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb30_sec_mock_utmi_postdiv_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.39.0

