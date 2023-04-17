Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B57C16E46C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Apr 2023 13:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbjDQLsL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Apr 2023 07:48:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbjDQLsK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Apr 2023 07:48:10 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69C0E65AF
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 04:47:06 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id e8so7940781ljn.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 04:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681732020; x=1684324020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kUIApCxHRXMR9r97tiawGsgCeEwOjVwHyinCZfxW1W0=;
        b=M8nRuba3eP6ZlV09KdMCztgFtMv01BGx2+nyHK4leSkoO6+p5mv7L17E1GjLX+i+mV
         Zsp5t9ErkKh7aIkz8YZCtFSoTDKXedH2eOn2JLRxcfB6FLeC9UTy9xhRO8nljoZ2Vbno
         2Jc44GoW+gtyLSvqYn6sbz4VFqVFlmn8UXmyAcbS75rcFeEeSU9OJwePemY3ddd+nLzM
         ij6q5rlX7yzwbryBD6YWd1TCX1FQ8lUNhwCjUhe/b7CjERpTHVrrkGV/IiJwH2CVptRG
         95eOVnwyZxOVlCXJ+OpikLBB/VYb/vJdy1Wxal6F+C+4Ps7huULweywala+YJjzhnc47
         np0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681732020; x=1684324020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kUIApCxHRXMR9r97tiawGsgCeEwOjVwHyinCZfxW1W0=;
        b=Dy++S73c+1DirGkG3kHBVU8EEvU+rE4tlmagigRC9GDRnQuLKWt955xY5w8i3lNOkk
         cKBkU4TjshA24kAjXgXRESx12QBz0V12BZl10PoTpvqEJt6G92K1Wf0fLo3uAubiluSx
         pHaB3FqKz5uTYs6JLIQ+x8vTmjEVxMZtixvLiRpHdytKgAsSkCy9BJkW8HCf0khfjvmZ
         eSC0m2GrNDbHpBZ11pXyIASriudrfeTU2LcjDUc82rFp0iHPCbi9u6NDijibhiPMzlxB
         V7y1yYkYpECpYgay8g5ZFtc/yFx6+tBnVYOUN23WUgFRnK4MUliczda6UAKz8b5rASRH
         AKXw==
X-Gm-Message-State: AAQBX9fRbUSltUMRAlvH/ig71MWO6BdOgft97glOyrHZa2bI0N2lGri9
        PQLTOl3wTBO1VNabZITlNW/Hgw==
X-Google-Smtp-Source: AKy350Y13uDz1cSJuHgD3oFACCaEgrsZ8ALiSnrybEdaQdry0Z5I39gAzs3Pc+MByw/d8mbYTsSiPQ==
X-Received: by 2002:a2e:9248:0:b0:2a8:c3c7:b551 with SMTP id v8-20020a2e9248000000b002a8c3c7b551mr920410ljg.17.1681732020426;
        Mon, 17 Apr 2023 04:47:00 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c26-20020a2e9d9a000000b0029b32a40934sm2181751ljj.113.2023.04.17.04.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 04:47:00 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: qcom: include cc device name into error messages
Date:   Mon, 17 Apr 2023 14:46:59 +0300
Message-Id: <20230417114659.137535-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To ease debugging of the incorrect clock configurations, add the name of
clock controller to the "invalid index" error message.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/common.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 75f09e6e057e..7dcf818e1dd9 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -19,6 +19,7 @@
 
 struct qcom_cc {
 	struct qcom_reset_controller reset;
+	struct device *dev;
 	struct clk_regmap **rclks;
 	size_t num_rclks;
 };
@@ -227,7 +228,7 @@ static struct clk_hw *qcom_cc_clk_hw_get(struct of_phandle_args *clkspec,
 	unsigned int idx = clkspec->args[0];
 
 	if (idx >= cc->num_rclks) {
-		pr_err("%s: invalid index %u\n", __func__, idx);
+		dev_err(cc->dev, "%s: requested invalid clock index %u\n", __func__, idx);
 		return ERR_PTR(-EINVAL);
 	}
 
@@ -251,6 +252,8 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 	if (!cc)
 		return -ENOMEM;
 
+	cc->dev = dev;
+
 	reset = &cc->reset;
 	reset->rcdev.of_node = dev->of_node;
 	reset->rcdev.ops = &qcom_reset_ops;
-- 
2.39.2

