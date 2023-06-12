Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B652F72BC59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 11:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234746AbjFLJ3E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 05:29:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230336AbjFLJ2Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 05:28:25 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 907A74C18
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 02:22:52 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b1adf27823so47353051fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 02:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686561771; x=1689153771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aokZ02DTWb9itSjNmX3GX1bnlGBgRvBPpzBUwT1r8Ks=;
        b=zgaXR068y2KvRcu+CefSXblQauZN/5694hY3v3A7mOv8L2XDoiACIFYh0En2bjFWO7
         elrV6OhqE7pubIBMZnNEpe3US8kk7cx7qjr/U3dOsamyYot1184AjFRQr74Nu3xec5pp
         4EmEIYb+GCt1S83vlEWaJor7gMzYeFdsu50yEG6n0Blk2gFifRyCFnPAdDUNNCU4CrJl
         NES3HC0wKGdRVeaa7i557J1WaXaISlJNWJLOO8+jV5VGT0Uo2gVx12TYt9qDZsKLF3jJ
         nBLzxypmxW1pNtaab38uryMBiz8WRkg0DEA56Bi4B+Ei1fn0Vewaymmg3YWbwf1v7unA
         ymcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686561771; x=1689153771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aokZ02DTWb9itSjNmX3GX1bnlGBgRvBPpzBUwT1r8Ks=;
        b=E4NBLDR6A03JxGJJ9pL4kZTxHwxldupqOk5NAIESPSG7BLCPAH2y8l2lVPNDF3y+cK
         MfNJtRF4qmkolSrZrTV3cxq9WYSmLKS6/m9raGAiCuVdpjBKHbIox1/Q4CQGGKtm0i/5
         bmrBPvMCw10b9CUJUYTYFxl+RFBC9onkQDXev7KElDMDGaU+H1mj60SaXDTkExk81uvj
         lbP36aXT33rjoR5L9rMmUQQ/j9j2RXLSbo434QDQvYUmMHQclod1JhyHOnCfNfojfZEF
         Wwd9dvlVmDdEzOATUuAI2fNVPwGNc046ODK5rRLcsn1p3uUUn0oWgblO9RNiYmHBEGMK
         rPyg==
X-Gm-Message-State: AC+VfDyKm+nEjaos0b0/jWTTewvmhbV56XiYaR6dgKmR3+bIqSY+xp2b
        EXfn+L/SgSakKQU9DjEHBKEgYA==
X-Google-Smtp-Source: ACHHUZ5AjcfJ5uMMKue3jHOWd8iRAU/zsDR+PTI2mRCF58UVPCYAZha4zaL1zKZ8sMKtUSCKN3XhxA==
X-Received: by 2002:a05:651c:22a:b0:2af:2441:f709 with SMTP id z10-20020a05651c022a00b002af2441f709mr2312656ljn.29.1686561770934;
        Mon, 12 Jun 2023 02:22:50 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id o20-20020a2e7314000000b002adc2fe3fc8sm1681722ljc.4.2023.06.12.02.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:22:50 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 12 Jun 2023 11:22:47 +0200
Subject: [PATCH 1/2] clk: qcom: rcg2: Introduce read-only RCG2 ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230612-topic-rcg2_ro-v1-1-e7d824aeb628@linaro.org>
References: <20230612-topic-rcg2_ro-v1-0-e7d824aeb628@linaro.org>
In-Reply-To: <20230612-topic-rcg2_ro-v1-0-e7d824aeb628@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686561768; l=1865;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=3gIA9vzv7N0fpwHj2dbt5ZFR2hwXZW2370PjU3vkRU0=;
 b=/QuvsvHHTCcXI2H4Y3Vl48qEwTbc+OqDpUK9QFPMGjfNXa4lqdxBVWHNLyqKbv6mkQe9Xoc0t
 SRRPfn5u4jmAHeAyOv/Oz3gazVUBpjYJv2DCh5qsADr/ZIRk9wy3zIF
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some clocks are physically part of a clock controller block (e.g. GCC),
but are under no circumstances supposed to be touched from HLOS/APSS, as
another subsystem manages them, and trying to alter its configuration
may (and likely will) wreck total havoc over whatever the clock is
attached to.

Add read-only ops for RCG clocks. This allows us to peak at the rates
(and other configuration parameters) of such clocks without the risk
of messing up half of the SoC due to an erroneous CCF call.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-rcg.h  | 1 +
 drivers/clk/qcom/clk-rcg2.c | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index e6d84c8c7989..4b4ff156539f 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -170,6 +170,7 @@ struct clk_rcg2_gfx3d {
 extern const struct clk_ops clk_rcg2_ops;
 extern const struct clk_ops clk_rcg2_floor_ops;
 extern const struct clk_ops clk_rcg2_mux_closest_ops;
+extern const struct clk_ops clk_rcg2_ro_ops;
 extern const struct clk_ops clk_edp_pixel_ops;
 extern const struct clk_ops clk_byte_ops;
 extern const struct clk_ops clk_byte2_ops;
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index e22baf3a7112..71de1cd8d45b 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -518,6 +518,14 @@ const struct clk_ops clk_rcg2_mux_closest_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_rcg2_mux_closest_ops);
 
+const struct clk_ops clk_rcg2_ro_ops = {
+	.is_enabled = clk_rcg2_is_enabled,
+	.get_parent = clk_rcg2_get_parent,
+	.recalc_rate = clk_rcg2_recalc_rate,
+	.get_duty_cycle = clk_rcg2_get_duty_cycle,
+};
+EXPORT_SYMBOL_GPL(clk_rcg2_ro_ops);
+
 struct frac_entry {
 	int num;
 	int den;

-- 
2.41.0

