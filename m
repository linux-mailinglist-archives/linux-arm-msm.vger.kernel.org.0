Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60DC56696A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 13:13:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233109AbjAMMNs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 07:13:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231745AbjAMMM5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 07:12:57 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41B1B80995
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 04:07:21 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id bf43so32842482lfb.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 04:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VM3uEU/rjB+QCOtTn5z2Z6qfvJKbznw9HG9r7NidXzw=;
        b=rsZSZU/oiQFwGrlrVnZ6RZkfpTtKnVsx/no09HT9cZZxRIE5FZuhGEiv1vp4Om8xrp
         TbXMSxrvsGMYhQuJWWkRiAZicHpVQOI1CVxStllSbhblZ4jpBNrmQs9t0G+umHpHutB+
         Z2J60sXWZ1cpqIjaVFeMAd9ZlJt37+dcnucTftrTusEzxbW88FGGHjJOeFoZnIh5io5E
         lJpF88Cj/PTwB603Y6SywDGuO/ZMTRF/0gcMjqiY+UoG631pUKpll368VR9MyKo7/XzE
         t/MuGBGZp2OTIuIkH4320gEjbp7pdR4NywOrOADVRwX2h8OQgq2VPP+/hE4kNX6ze9N2
         HtYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VM3uEU/rjB+QCOtTn5z2Z6qfvJKbznw9HG9r7NidXzw=;
        b=OjjrWR9NDPXqppDuEu9PdUd54F0jGfY2xOSKkzri2jvhzSIBks4oV8e26dBN4Wze0J
         UNhcjnoKGyzPMfXwS4ksbXmW21bRez0E/z4A9JpDrW2E7kLYJqEh6rwWbGMxzeESXz12
         uzUOmcrawxM2s738Uqd3zW6gdFcjV2GTYj7MNPK1KcKSrddg7UBxkWk8H+W0x5V0JFun
         8XdADELeFFQ7GHZQRKw3ft5pyA2lNvxj7pgFOCjFivVpGoqCJpKyXo4N8uiMbEvKup1u
         N3TqFnpDU2dvfRpXj2EmMuyqkkeT6Z8Wbo2BXG0vZvouN0dWNrEccbzZDhOSldETTAgZ
         QFAg==
X-Gm-Message-State: AFqh2krdRqyKHLxrUd2P+3dDnB6wc8XZR4a/mNqHvvARcLvIMPjprDX/
        rDn8gq5Lh58eMLikf+RFmwjwgQ==
X-Google-Smtp-Source: AMrXdXvHwxsexvWyXWUJt0+ydKoQoFEG0P9L6Lf/XP66x2BDV7CqV9+usK6O65cmXX8ktDLRz/LpnQ==
X-Received: by 2002:a05:6512:3ba1:b0:4cb:f3d:c47f with SMTP id g33-20020a0565123ba100b004cb0f3dc47fmr21361040lfv.51.1673611640824;
        Fri, 13 Jan 2023 04:07:20 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.170.82.205])
        by smtp.gmail.com with ESMTPSA id i7-20020ac25227000000b004ac6a444b26sm3806290lfl.141.2023.01.13.04.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 04:07:20 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 12/14] clk: qcom: cpu-8996: fix PLL clock ops
Date:   Fri, 13 Jan 2023 14:05:42 +0200
Message-Id: <20230113120544.59320-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
References: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
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

Switch CPU PLLs to use clk_alpha_pll_hwfsm_ops, it seems to suit
better.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index c471c6836c63..b99a47aca478 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -128,7 +128,7 @@ static struct clk_alpha_pll pwrcl_pll = {
 		.name = "pwrcl_pll",
 		.parent_data = pll_parent,
 		.num_parents = ARRAY_SIZE(pll_parent),
-		.ops = &clk_alpha_pll_huayra_ops,
+		.ops = &clk_alpha_pll_hwfsm_ops,
 	},
 };
 
@@ -140,7 +140,7 @@ static struct clk_alpha_pll perfcl_pll = {
 		.name = "perfcl_pll",
 		.parent_data = pll_parent,
 		.num_parents = ARRAY_SIZE(pll_parent),
-		.ops = &clk_alpha_pll_huayra_ops,
+		.ops = &clk_alpha_pll_hwfsm_ops,
 	},
 };
 
-- 
2.39.0

