Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCF7A674D20
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 07:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbjATGOa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 01:14:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbjATGO2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 01:14:28 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 440F47DF86
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 22:14:26 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id ud5so11435027ejc.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 22:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2uAEhDuH3NIHA6CqlxnXiQf838dWc0BvnrN7qCC9V3o=;
        b=ahbihXODT2QmVfQucJAm1a0WUIpN/M9OQ6NJ7g8G+C960BQYJ6e8wvVdQCaIDWkFNc
         TEdUyAtA4bAO7hQqvM5jZhgDE+q3OjyygGMMdQtit4UT2LbruFy/XrLzJyBj+nos3CyZ
         wQdMFiQ7j4VaNxA4gngN3Khfe8rm+ofPw+BSsBZvs6E9I5gTnfChaRg5OLJQ3kIbvc3t
         dems2OGciUGxYGG7HuZ8SF6LJs+FoBBqJ/SHI3U4k6B1Qve9oaT4uq/o00vHn0U7FAkX
         s/Y58S3aogpSiTsNVhcDpTilO0NcIL8Adp+e2rmATY1dp7I6aj6YrG2FCAuAIN9ZX4BW
         cYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2uAEhDuH3NIHA6CqlxnXiQf838dWc0BvnrN7qCC9V3o=;
        b=0UVKEMRtrTwDb8SFbj6cFQXgEeXSyhELJLDYNuarQyDTI0k2hUbmK8T84r7Fhwt/in
         R1CvRO1HbQk4WKUfIroFkuEULfpWFkeSyz4Vk20ZcGspK+jkN5or0drV4+6nmqJXnOy0
         Eopi7QHWKvaim7kjW/ABi6PexBTZd3Hr9h0mgah4fnEwyLaj2bMeRvWpCYrZO/TE0aEE
         eYBIUDEeNAInTV5S4ewHyH0hFEdJP8NQj4X675DTU10i+ynVqa9a0WG9QTHCkbjDPNnr
         G1wxhNzAyRyzgywFvrjigKMg1ogxQLBvHH3fJPtCArcljD7eYEzuQ3txUZqEPxzdla9H
         Yy7w==
X-Gm-Message-State: AFqh2kq3i9nnpa2ia4Khxe61j7EI7/sPgkPNIdkkG+Yld+KHjryA+VIn
        C3J9XKKmn3djdkFeu34uaiSNvg==
X-Google-Smtp-Source: AMrXdXtD5HZhuSK0qxLTidHYAc5hPH9VZUXMWHqZl4I5KEH/CqfMQ9awpE84B0WM3rVAtXYf9Kug0A==
X-Received: by 2002:a17:907:8dca:b0:85f:5d72:1841 with SMTP id tg10-20020a1709078dca00b0085f5d721841mr15759109ejc.39.1674195264806;
        Thu, 19 Jan 2023 22:14:24 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id hp24-20020a1709073e1800b008720c458bd4sm5813358ejc.3.2023.01.19.22.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 22:14:24 -0800 (PST)
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
Subject: [PATCH v3 5/8] clk: qcom: smd-rpm: provide RPM_SMD_XO_CLK_SRC on MSM8996 platform
Date:   Fri, 20 Jan 2023 08:14:14 +0200
Message-Id: <20230120061417.2623751-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120061417.2623751-1-dmitry.baryshkov@linaro.org>
References: <20230120061417.2623751-1-dmitry.baryshkov@linaro.org>
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

Extend the list of RPM clocks provided on MSM8996 platform to also
include RPM_SMD_XO_CLK_SRC and RPM_SMD_XO_A_CLK_SRC.

Fixes: 7066fdd0d742 ("clk: qcom: clk-smd-rpm: add msm8996 rpmclks")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 6f23ca4828f4..198886c1b6c8 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -812,6 +812,8 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8994 = {
 };
 
 static struct clk_smd_rpm *msm8996_clks[] = {
+	[RPM_SMD_XO_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo_a,
 	[RPM_SMD_PCNOC_CLK] = &clk_smd_rpm_bus_0_pcnoc_clk,
 	[RPM_SMD_PCNOC_A_CLK] = &clk_smd_rpm_bus_0_pcnoc_a_clk,
 	[RPM_SMD_SNOC_CLK] = &clk_smd_rpm_bus_1_snoc_clk,
-- 
2.39.0

