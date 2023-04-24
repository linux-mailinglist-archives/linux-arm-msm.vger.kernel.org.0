Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 191546ECBD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Apr 2023 14:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231788AbjDXMOA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Apr 2023 08:14:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231666AbjDXMN7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Apr 2023 08:13:59 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D05F710FB
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Apr 2023 05:13:57 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2a8afef50f2so40877561fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Apr 2023 05:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=8devices.com; s=8devices; t=1682338436; x=1684930436;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQtohBky33MWUdeKOY9B0Jdzwvi92+shTR5B/pXImXU=;
        b=hTVanmBkAGPFQtISg9J3XJ+Tlq36EE9E8yJoC4vcotb1vZS68CHyPzfh7MQQ3KWvoY
         iK5E+RDuVKGBgDraT25L+lP6aRY9vY5TBAPhsDMMC5T/sC1GHjJkFsiQKZ13439Hj1c/
         xYsZUD4g6tqsXZc8K7+UatulGP6AAL6GuPw+/HQb5rXNLRGw/XflGuZhZoIrrV2cGmYl
         t2vD/lCz/2DJDSxV0mIGHUpLhappR9I0zILDu+GTu1RHnryQCdbJgr5+nYEqHYU1iJm2
         wfD1i+mIaW7SXYr5NwaXh0u/cMNmHi59PymlPUg3al20pUR48scVRwUajHgsO9E1V2M5
         Vjvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682338436; x=1684930436;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQtohBky33MWUdeKOY9B0Jdzwvi92+shTR5B/pXImXU=;
        b=aRsvgQQCZMIg3fpnqWSlwEBVd4EMd/h/6aCS/vj2iAlldoW5GTwsZZj6iPd4Dc2xst
         Y0i2mEOOTEix17bAH3VDvD799lF4DsDMK0cpxB9/xwiBYsFAl5FcmbNtdKFiBzGI204m
         ZDUQc0GteENvX7m7euiEjpO7KxdE5iOskj5CTc/AtIQsr6RB4lTwoKOkiMBytCQMdjKo
         qtw2pk0BPbXdMlUjylMNqxGG4OI6no77tA7yBnOivUaE8jf45zhcpCt2P7J15DBRZVY6
         a0G03quUfO5MqBNZd54kmRTs8TuM4a26Oos/GUXJhlcoULwtz8OLhg8kiKdRfVsQwc6S
         FnFg==
X-Gm-Message-State: AAQBX9dg/9FfgoELocB5Z0VfsXXGkYrNZ3KV9Zr48ZYlzZcRoRWk1cZo
        lEDRHJ3ZNkVsGESSLCZksX0qIQ==
X-Google-Smtp-Source: AKy350akQ8EciT+C0V8pKYtfqBhPEaEv5XPr4eaKZrvmhqi0oiXoFstBdBYa998MK2ui6b6T+gGuMQ==
X-Received: by 2002:a2e:2e0e:0:b0:2a8:d13d:88fb with SMTP id u14-20020a2e2e0e000000b002a8d13d88fbmr2642480lju.11.1682338436147;
        Mon, 24 Apr 2023 05:13:56 -0700 (PDT)
Received: from mantas-MS-7994.8devices.com ([84.15.37.222])
        by smtp.gmail.com with ESMTPSA id x23-20020a2e7c17000000b002a5f554d263sm1732382ljc.46.2023.04.24.05.13.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Apr 2023 05:13:55 -0700 (PDT)
From:   Mantas Pucka <mantas@8devices.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Abhishek Sahu <absahu@codeaurora.org>,
        Anusha Canchi Ramachandra Rao <anusharao@codeaurora.org>,
        Sricharan R <sricharan@codeaurora.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, Mantas Pucka <mantas@8devices.com>
Subject: [PATCH 1/3] clk: qcom: gcc-ipq6018: Use floor ops for sdcc clocks
Date:   Mon, 24 Apr 2023 15:13:30 +0300
Message-Id: <1682338412-15420-1-git-send-email-mantas@8devices.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SDCC clocks must be rounded down to avoid overclocking the controller.

Fixes: d9db07f088af ("clk: qcom: Add ipq6018 Global Clock Controller support")

Signed-off-by: Mantas Pucka <mantas@8devices.com>
---
 drivers/clk/qcom/gcc-ipq6018.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
index 3f9c2f61a5d9..5c5d1b04ea7a 100644
--- a/drivers/clk/qcom/gcc-ipq6018.c
+++ b/drivers/clk/qcom/gcc-ipq6018.c
@@ -1654,7 +1654,7 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
 		.name = "sdcc1_apps_clk_src",
 		.parent_data = gcc_xo_gpll0_gpll2_gpll0_out_main_div2,
 		.num_parents = 4,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_floor_ops,
 	},
 };
 
-- 
2.7.4

