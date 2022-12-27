Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0FB656680
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Dec 2022 02:32:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232644AbiL0Bcj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Dec 2022 20:32:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232618AbiL0Bcf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Dec 2022 20:32:35 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80BEC5F7F
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Dec 2022 17:32:33 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id x11so12474324ljh.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Dec 2022 17:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okVtysJEYsu2vepo7AuLC4w3erHw027/QBvpC+SNb7M=;
        b=bgyh8eOIoqoVHq/ImPctPBT8jBi6PyqSfP+by9+HVnpN3Fh0kiFbYC3X0c2rkvExAq
         YZVutq/u9EHK6iwqSJejBaOQm00CkR6g0rwv6cWIFNVMEmjbe7OElJfyYrffmGCkB4jZ
         hwygqKyIScMrmuEY6hw13Rfccofwb3nfkHYdATrhH7OoHgmp4NXBYqLa/Fk2f7qA+aYW
         tGYTNNWMwq1PCUxFXV2SYTO52amxlkrivH2ZE+z4VpuzmYLy4mKlPI0cSAIxyJCTBwbv
         zWF0YbyH3c4cXtfngC9g0PHPtZcDeC91Zyl0PCPCHWP7aKJdIgbCMWv093h+WYZ8b9Rd
         nnMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=okVtysJEYsu2vepo7AuLC4w3erHw027/QBvpC+SNb7M=;
        b=IT5iP3mYzzp/oFy3HFGTTgEBd0T4BYSI1736PEK4FEmDOcTjnK9cOZ1uLpXQNuFaRz
         xLFtQwuPKoFLHn/1Orbm7GnCIt6v/1aqXQA95K2Mk/+U+PRtp2y5cMzPiC02sEUOkswB
         YjuivtaWji0DWmnazZ2jgUZBYv5EaJ3WpIwYcVM1vR/URsWsZhPQW0Hp9SIOn46j2HR3
         nF6udZPr2IjaOzECB+Ax+agq9x8k2uGErQaOwFiTeKTQItleqjyNyzUpY6wnvg2iBYTU
         74DBm2YbGwcAUvNMH9Zwg+IOa0qwYZPvkgfSyJOtNAVRqpM6xth091+Dqqa9c9H08nfu
         8A1g==
X-Gm-Message-State: AFqh2kqlkz0f4UBMBkKw6413r8z5luCeGha3j1Hnf34mktY48pvzl37A
        Zj6D3bMzAOKHjUe0CPcwqjTLlg==
X-Google-Smtp-Source: AMrXdXvqtA9jloew5Jm+vPmL+qF0fLhaHhtzxmXE+gfaytVom9DcoKSMfsNtiDCXU/A4+z6rb4Tlcw==
X-Received: by 2002:a2e:9c8f:0:b0:26f:db34:a13f with SMTP id x15-20020a2e9c8f000000b0026fdb34a13fmr5566472lji.2.1672104751891;
        Mon, 26 Dec 2022 17:32:31 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v6-20020a2e87c6000000b0027fbb12aa53sm674752ljj.20.2022.12.26.17.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 17:32:31 -0800 (PST)
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
Subject: [RFC PATCH 07/12] clk: qcom: gcc-apq8084: add GCC_MMSS_GPLL0_CLK_SRC
Date:   Tue, 27 Dec 2022 03:32:20 +0200
Message-Id: <20221227013225.2847382-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221227013225.2847382-1-dmitry.baryshkov@linaro.org>
References: <20221227013225.2847382-1-dmitry.baryshkov@linaro.org>
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

Add the GCC_MMSS_GPLL0_CLK_SRC, the branch clock gating gpll0 clock for
the multimedia subsystem.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-apq8084.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/qcom/gcc-apq8084.c b/drivers/clk/qcom/gcc-apq8084.c
index c26e222c78d4..7085d2ccae49 100644
--- a/drivers/clk/qcom/gcc-apq8084.c
+++ b/drivers/clk/qcom/gcc-apq8084.c
@@ -1382,6 +1382,19 @@ static struct clk_rcg2 usb_hsic_system_clk_src = {
 	},
 };
 
+static struct clk_regmap gcc_mmss_gpll0_clk_src = {
+	.enable_reg = 0x1484,
+	.enable_mask = BIT(26),
+	.hw.init = &(struct clk_init_data){
+		.name = "mmss_gpll0_vote",
+		.parent_hws = (const struct clk_hw*[]){
+			&gpll0_vote.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_branch_simple_ops,
+	},
+};
+
 static struct clk_branch gcc_bam_dma_ahb_clk = {
 	.halt_reg = 0x0d44,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -3480,6 +3493,7 @@ static struct clk_regmap *gcc_apq8084_clocks[] = {
 	[GCC_USB_HSIC_IO_CAL_SLEEP_CLK] = &gcc_usb_hsic_io_cal_sleep_clk.clkr,
 	[GCC_USB_HSIC_MOCK_UTMI_CLK] = &gcc_usb_hsic_mock_utmi_clk.clkr,
 	[GCC_USB_HSIC_SYSTEM_CLK] = &gcc_usb_hsic_system_clk.clkr,
+	[GCC_MMSS_GPLL0_CLK_SRC] = &gcc_mmss_gpll0_clk_src,
 };
 
 static struct gdsc *gcc_apq8084_gdscs[] = {
-- 
2.35.1

