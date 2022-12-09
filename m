Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 937896486CB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Dec 2022 17:49:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbiLIQtD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Dec 2022 11:49:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbiLIQtB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Dec 2022 11:49:01 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 415B493A68
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Dec 2022 08:49:00 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id b9so5501954ljr.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Dec 2022 08:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9CXWcWlkBJUa7YPlXrMChel1p4HqV+iokIH++6hLrA=;
        b=k4FL6RUn5WnoQ4Tqrkkqawsa4qeg6hRD2VMGVmBijzJAUMj+i37o0nLi0Oh2wTfBd2
         HT4iL/jWzih1Yh/GSiUfs6sGT2eNFq10EtCbaF/2mePM7FXnyAIJrGQy/D6x05AhEZMZ
         J5jIX7UwezY6PWDB+dfjbAA5Ts8MlA+jlNlQosT6T2jc/tJCMW//yhPC2QkiLqOhFsxq
         PkcXZ7aGqdWIKTIjpuLJI2LAtWYOcTAd8jDL+9M/uFKjchORbz0EXuRaeDHcl6BWyKwX
         vtJwJc7CnztzHUovGhs3/NyEm/p6tXicI+UyWiKrl6pQ7//XJw4qOyB79DIC/IEiqote
         bogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T9CXWcWlkBJUa7YPlXrMChel1p4HqV+iokIH++6hLrA=;
        b=Q5tabkh2x5Rhi0x6TyBrdKIkxAfa1eNepbg08qw1DynUnfuMn8WxUfaPJ/0cUJkaiy
         rtz+0veP9l42uxhE/ixEHBR1u46k6+t6OBXUucy3wa/lCUewhynzQHQGmfMluBsAH7Ew
         3iiZrX9Mv8dkRhCP6Dn4l/tphDcUHEC8d1+mLB0LeZQzYbSO5chSM7MhwVAOJVw/UMmO
         PZTc/znhU7q6yNLCaq+DJN6CzX9OLFai+2+5IW40ITAYScGCAmyJgsbid6Ob3flLlOoO
         hkqSt+lQzNd3uYmXXEn6AbByJsnRj6h7MR6gOhD9HakX/pRoebJrMwHgTvxbVeeZFMLA
         6bww==
X-Gm-Message-State: ANoB5plRWIbkf+ZAc2oECOaX+G0zfdqFWXnKjg7MxGDgEokXq5fzUfVW
        O9eq2T7Ig+tJnZCYcbFpqSsAMA==
X-Google-Smtp-Source: AA0mqf5rWYGwdEwpXBnfhadSytTWKqSUhUq7msiFzrbpF4wq/w6UlZ5pQCTVNLofQxWC3i6xdcZB/Q==
X-Received: by 2002:a2e:a884:0:b0:278:d139:74dd with SMTP id m4-20020a2ea884000000b00278d13974ddmr1585943ljq.41.1670604538570;
        Fri, 09 Dec 2022 08:48:58 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y2-20020a05651c106200b002770fb5722fsm275242ljm.123.2022.12.09.08.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 08:48:58 -0800 (PST)
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
        devicetree@vger.kernel.org, Alex Elder <elder@linaro.org>
Subject: [PATCH v3 03/19] clk: qcom: smd-rpm: remove duplication between MMXI and MMAXI defines
Date:   Fri,  9 Dec 2022 18:48:39 +0200
Message-Id: <20221209164855.128798-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
References: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
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

The commit 644c42295592 ("clk: qcom: smd: Add SM6375 clocks") added a
duplicate of the existing define QCOM_SMD_RPM_MMAXI_CLK, drop it now.

Fixes: 644c42295592 ("clk: qcom: smd: Add SM6375 clocks")
Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c   | 4 ++--
 include/linux/soc/qcom/smd-rpm.h | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 3082f38513fa..ccc54913eca5 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -1122,8 +1122,8 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6115 = {
 };
 
 /* SM6375 */
-DEFINE_CLK_SMD_RPM(sm6375, mmnrt_clk, mmnrt_a_clk, QCOM_SMD_RPM_MMXI_CLK, 0);
-DEFINE_CLK_SMD_RPM(sm6375, mmrt_clk, mmrt_a_clk, QCOM_SMD_RPM_MMXI_CLK, 1);
+DEFINE_CLK_SMD_RPM(sm6375, mmnrt_clk, mmnrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 0);
+DEFINE_CLK_SMD_RPM(sm6375, mmrt_clk, mmrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 1);
 DEFINE_CLK_SMD_RPM(qcm2290, hwkm_clk, hwkm_a_clk, QCOM_SMD_RPM_HWKM_CLK, 0);
 DEFINE_CLK_SMD_RPM(qcm2290, pka_clk, pka_a_clk, QCOM_SMD_RPM_PKA_CLK, 0);
 DEFINE_CLK_SMD_RPM_BRANCH(sm6375, bimc_freq_log, bimc_freq_log_a, QCOM_SMD_RPM_MISC_CLK, 4, 1);
diff --git a/include/linux/soc/qcom/smd-rpm.h b/include/linux/soc/qcom/smd-rpm.h
index 3ab8c07f71c0..82c9d489833a 100644
--- a/include/linux/soc/qcom/smd-rpm.h
+++ b/include/linux/soc/qcom/smd-rpm.h
@@ -41,7 +41,6 @@ struct qcom_smd_rpm;
 #define QCOM_SMD_RPM_HWKM_CLK	0x6d6b7768
 #define QCOM_SMD_RPM_PKA_CLK	0x616b70
 #define QCOM_SMD_RPM_MCFG_CLK	0x6766636d
-#define QCOM_SMD_RPM_MMXI_CLK	0x69786d6d
 
 int qcom_rpm_smd_write(struct qcom_smd_rpm *rpm,
 		       int state,
-- 
2.35.1

