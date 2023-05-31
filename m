Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACD4A717AFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 11:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235256AbjEaJBl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 05:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234726AbjEaJBh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 05:01:37 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E68CF129
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 02:01:34 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2af2c35fb85so57675741fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 02:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685523693; x=1688115693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7aNVVNs8eqPTnK0Wd32QsSw3ccebDUPM7FkJjTlItZ0=;
        b=DFpSVbtQAJdLS9L1Z4OqaYcq3z5wqP/Kjvjeuvb8W/UeZIZorQUgGLC+Ou6/dnQ1nM
         ohoLJ9zLgJkTWJAMxcSCaNpOZtWkeLgsiJNUs27ZJDu+rrINp1NXX/c6x6kIBc8XA/OC
         DfW0bMObEptzREw96ago+o/OQi8DEvQdFiNqEIViGG22BCVMn4bBFuVjQZ5g4ozTwMPz
         PPO+Dim+F2EMU/Jdj7XeYbPd78tSHTVVHCKITOnFcwMvYC+gTYbIFpQHzREtsoDUuIWd
         wXAKmCcHaC+WyJiE/wOXAhfHruz47163E9SSHYmZ8MGBWXgRdKAD+a6U5pGW0xYVhYVb
         KiFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685523693; x=1688115693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7aNVVNs8eqPTnK0Wd32QsSw3ccebDUPM7FkJjTlItZ0=;
        b=aRJ4DaFj3a7vkzVj0IRxQO51OtWuahCmgCs8C8hcBujjGX8GT/H8yymmqGvEFz6/pU
         Ey7jXiucr+lYkyNDmGwCcRpcwB+2RFtBHGtRXsKZlDICEBRBLEZkbdsBZOPU0+owOXAK
         2GHeM19ok4rTM0vivlzH6u3cs/WMHLIdVNSh9jb0s6HOpHbJNPohjPuvi6/pXwlJk3Ne
         LfJCXdWHoGfzW5SkqULFrHhXUSn1ZZLuADQJFumqnODmRMy6+dwVUDtZpx/6ibQ/U50Y
         Bw4CFjrgTmbFwtH/wR/BIaTQdNJvLJa5qbP3ms4KvV5+sDA6hptsz655IMy2E44yT986
         B99Q==
X-Gm-Message-State: AC+VfDwLgSfsNuJF626H1TPChqCpUbCZErTeGhkOLipYXwtQuzcqhs0p
        YQQj46Q4MHP/Fb/rrGDBf+OZRw==
X-Google-Smtp-Source: ACHHUZ4a/ohv1nAHcZ4EgpJh+dY8ucizn8JplkQ7RJTesz0nm6WL80NqRNfhJZMIQVHQEBEX6+6GQA==
X-Received: by 2002:a2e:9810:0:b0:2a7:853e:a43 with SMTP id a16-20020a2e9810000000b002a7853e0a43mr2078686ljj.40.1685523692380;
        Wed, 31 May 2023 02:01:32 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id f4-20020a2e9184000000b002adbe01cd69sm3217446ljg.9.2023.05.31.02.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 02:01:32 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 31 May 2023 11:01:22 +0200
Subject: [PATCH 3/4] clk: qcom: mmcc-msm8998: Don't check halt bit on some
 branch clks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230531-topic-8998_mmssclk-v1-3-2b5a8fc90991@linaro.org>
References: <20230531-topic-8998_mmssclk-v1-0-2b5a8fc90991@linaro.org>
In-Reply-To: <20230531-topic-8998_mmssclk-v1-0-2b5a8fc90991@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685523686; l=1355;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=bXqrPCtrvBWn269gLXl5t9pRQrXP7UP5yO8wMS9RYTM=;
 b=25wVDjm0aFKb9J+/7hjzG1PYk8SUins5HpBOIMcmo9kgItzdowE+W0TmGB+9j6TP2q68ZYpA9
 hSNCtDfJkB2DBdHtrip8T/GzVMUqVT6C5BxHs3AWbECJ60y0iYexcZc
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some branch clocks are governed externally and we're only supposed to
send a request concerning their shutdown, not actually ensure it happens.

Use the BRANCH_HALT_SKIP define to skip checking the halt bit.

Fixes: d14b15b5931c ("clk: qcom: Add MSM8998 Multimedia Clock Controller (MMCC) driver")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/mmcc-msm8998.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/mmcc-msm8998.c b/drivers/clk/qcom/mmcc-msm8998.c
index 4490594bde69..9b98e0fb8b91 100644
--- a/drivers/clk/qcom/mmcc-msm8998.c
+++ b/drivers/clk/qcom/mmcc-msm8998.c
@@ -2453,6 +2453,7 @@ static struct clk_branch fd_ahb_clk = {
 
 static struct clk_branch mnoc_ahb_clk = {
 	.halt_reg = 0x5024,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x5024,
 		.enable_mask = BIT(0),
@@ -2468,6 +2469,7 @@ static struct clk_branch mnoc_ahb_clk = {
 
 static struct clk_branch bimc_smmu_ahb_clk = {
 	.halt_reg = 0xe004,
+	.halt_check = BRANCH_HALT_SKIP,
 	.hwcg_reg = 0xe004,
 	.hwcg_bit = 1,
 	.clkr = {
@@ -2485,6 +2487,7 @@ static struct clk_branch bimc_smmu_ahb_clk = {
 
 static struct clk_branch bimc_smmu_axi_clk = {
 	.halt_reg = 0xe008,
+	.halt_check = BRANCH_HALT_SKIP,
 	.hwcg_reg = 0xe008,
 	.hwcg_bit = 1,
 	.clkr = {

-- 
2.40.1

