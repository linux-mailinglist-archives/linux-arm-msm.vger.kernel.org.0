Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A37B35EC1A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 13:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231890AbiI0Lip (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 07:38:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232125AbiI0Lih (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 07:38:37 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BB4214F818
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 04:38:31 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id z25so15302094lfr.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 04:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Gr5CEgDVOE5rYe54LqDlFWEZZi0bLxgPcprD1LhFhqg=;
        b=oO3qAwWRsfRO8Tq9lg2LEI4+frhgojlVy8Ke4i7Wwsp2Xr1bgANp/uarnxob+oHLrO
         zBt2etJ0Q9esEW2LS//IGuZpKzJ4HxDC/43JZltOX5M/SBaGWPiBtscgWUGD5WStjSPa
         ZGoyzaL6s6c1SsUNvAIrEGKXfgI8tOYT/UNgOq9MDNDzIt4GVHIk//LK2D/GikNpg13p
         iVjiOtI78umfgYq91U2kxRs9OxzNFohJPKhRnJC+SvwbJrdgB+Z7idJ+O9PqVhgiWxht
         ZZ+xE3kOaDAQh3ujEJoZeW3VCvPqdDDDiRvcdUtlciJK5gLkQ2TSqQa+D6jQxG+b5t4F
         p7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Gr5CEgDVOE5rYe54LqDlFWEZZi0bLxgPcprD1LhFhqg=;
        b=um5ggFNfn0b7CXsRk7XHXebfLHjoEhRifbQoBF8t8U0JJHybXU5MpW6jVSkzu0w+CE
         68iNyWKgVPl+DmN0THvS+mDQRQgxBP3qRVqz7lOE2mv1UtROvfTnGqZYOpVskKKb09wb
         0dcdiZHgTw1Y2+geuxFuRWQO7CVRz9jxTeL4KqDv2vNxwCU2vdV+LVxBvn0vNfO/Pzf3
         ehMw0ywvNaiWdCqzipVeCb6/TnDmpPsi6gTpJYDkKW4LfVHyrTtuznXz3Ke2k9GIMzhx
         m0xDfTkAeRCcchPHOo3x+t2VTpNDtbu0OPw1I1c4tOMulkzKwdhs8ExMhnUofaJ5pU8j
         PTpw==
X-Gm-Message-State: ACrzQf3b16s0vnsePFpIBt2xk/7XsuHVQqkHyuoNW6t4ekbm2SVdDI4b
        ti5Dgua+lPaWwz0s6mozIvv5Jg==
X-Google-Smtp-Source: AMsMyM5IqnHIXXTzsqi0PpNYabfJQJD8Z7/CNouCVgSwtAjqsgkihlSd+urh6QohEIkvpck1nV5shg==
X-Received: by 2002:a05:6512:3d07:b0:498:f201:5679 with SMTP id d7-20020a0565123d0700b00498f2015679mr12134111lfv.161.1664278709573;
        Tue, 27 Sep 2022 04:38:29 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t12-20020a056512208c00b00492dfcc0e58sm142165lfr.53.2022.09.27.04.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 04:38:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 2/3] clk: qcom: gcc-ipq806x: use parent_data for the last remaining entry
Date:   Tue, 27 Sep 2022 14:38:25 +0300
Message-Id: <20220927113826.246241-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220927113826.246241-1-dmitry.baryshkov@linaro.org>
References: <20220927113826.246241-1-dmitry.baryshkov@linaro.org>
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

Use parent_data for the last remaining entry (pll4). This clock is
provided by the lcc device.

Fixes: cb02866f9a74 ("clk: qcom: gcc-ipq806x: convert parent_names to parent_data")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-ipq806x.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-ipq806x.c
index 718de17a1e60..6447f3e81b55 100644
--- a/drivers/clk/qcom/gcc-ipq806x.c
+++ b/drivers/clk/qcom/gcc-ipq806x.c
@@ -79,7 +79,9 @@ static struct clk_regmap pll4_vote = {
 	.enable_mask = BIT(4),
 	.hw.init = &(struct clk_init_data){
 		.name = "pll4_vote",
-		.parent_names = (const char *[]){ "pll4" },
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "pll4", .name = "pll4",
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_vote_ops,
 	},
-- 
2.35.1

