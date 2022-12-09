Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 076A46486F0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Dec 2022 17:49:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbiLIQtX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Dec 2022 11:49:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbiLIQtO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Dec 2022 11:49:14 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A02FA9492E
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Dec 2022 08:49:10 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id n1so5500755ljg.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Dec 2022 08:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wdvGCE6A5Qz1bklvfHnxkfpuGXom6zSelmomtAbrXE=;
        b=aqZmB3jJMJdeI62WhMUfzy9FBpQDC7pahkiFBq1dDw2K4vqgJnn+TG/8b/JHkCjLDU
         j3+NgD1XKrw1ZFRajEZ1btXF1LD2SmpHvw/q4DX9NOi+R1aBUhlsUzqdkF/HH6tszqo+
         tNpHSJ2qEU1JZ4GRVE5Wyy2ls/XtwDdSRJnCdj48Gh4wmlRPmvQXOEX9BJO/yxRpTVoY
         /i3l6eKeamqFP1nW0SEZH96nNmvubY5ThRW0xGKLADVRBu5OaCCNH4sKa+9zLWMt+vi8
         JRbgIjQJhpUXY3Snuzhe/0fL/8Dli2J5uLTNOVSlBJ5lQWNiuY+u3uXtchVR1P9Rd+nM
         9q1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8wdvGCE6A5Qz1bklvfHnxkfpuGXom6zSelmomtAbrXE=;
        b=2DmGgvWdHR7PMS3AC0AtYul+vC+k7jQXjZrOwhjKR3BCEDnFa4Iy/NIp2YKqyuE+iT
         eDjTUT4vEPg53CMeRRErIiRa6fdTVzi0Jnk4G5RNSooiGiG4saqh9/db9wbtaxs/vNwT
         jiqUembwXBPIoW8bv3x62qOQaM4zKqVmPq5+tpFFAnPAVdel+tWo+HA0OeUN1lJdrEOH
         +Zq0Mp/kZrilew6ng+nzKzgAoFALnEC6bCrooAu16rGz69e/YZGfnn+6/pVku5mQuMSm
         UJ0CAJJsBR7WbrBMHWM0UFzBoBi0I/YJp+TEGi1Z7qlA9mfHf62UVWWzpb2Ve3y+2sqv
         RKNg==
X-Gm-Message-State: ANoB5pkTXUtPMXvriIKPOQ6pc00/X+9uT5GY0gnAIrRr3gK0eaKEJmZK
        I16xORLOCBlmpjBPR8QvNYrr/g==
X-Google-Smtp-Source: AA0mqf4hFl1zvIurV5XKYfsq7T9XqCTTv+ZtjkaR6aAGgNlBuBGoT+8kK+RpmUCFHyfB/ZXZD1sUPw==
X-Received: by 2002:a2e:9d58:0:b0:277:8a7f:e67c with SMTP id y24-20020a2e9d58000000b002778a7fe67cmr1505849ljj.37.1670604548962;
        Fri, 09 Dec 2022 08:49:08 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y2-20020a05651c106200b002770fb5722fsm275242ljm.123.2022.12.09.08.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 08:49:08 -0800 (PST)
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
Subject: [PATCH v3 15/19] clk: qcom: smd-rpm: simplify SMD_RPM/_BRANCH/_QDSS clock definitions
Date:   Fri,  9 Dec 2022 18:48:51 +0200
Message-Id: <20221209164855.128798-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
References: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75 autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove the duplication between the names of the normal and active-only
clocks by moving common sufixes to the clock definition macros. This
simplifies adding new clock definitions and reviewing existing defs.

Reviewed-by: Alex Elder <elder@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 96 +++++++++++++++++++---------------
 1 file changed, 53 insertions(+), 43 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index c5a4a648ddb1..a3f08ebcae4e 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -100,17 +100,27 @@
 		},							      \
 	}
 
-#define DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id)	      \
-		__DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id,   \
-		QCOM_RPM_SMD_KEY_RATE)
-
-#define DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type, r_id, r)   \
-		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type,  \
+#define DEFINE_CLK_SMD_RPM(_platform, _name, type, r_id)		      \
+		__DEFINE_CLK_SMD_RPM(_platform, _name##_clk, _name##_a_clk,   \
+		type, r_id, QCOM_RPM_SMD_KEY_RATE)
+
+#define DEFINE_CLK_SMD_RPM_CLK_SRC(_platform, _name, type, r_id)	      \
+		__DEFINE_CLK_SMD_RPM(_platform,				      \
+		_name##_clk_src, _name##_a_clk_src,			      \
+		type, r_id, QCOM_RPM_SMD_KEY_RATE)
+
+#define DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, type, r_id, r)	      \
+		__DEFINE_CLK_SMD_RPM_BRANCH(_platform,			      \
+		_name##_clk, _name##_a_clk,				      \
+		type, r_id, r, QCOM_RPM_SMD_KEY_ENABLE)
+
+#define DEFINE_CLK_SMD_RPM_BRANCH_A(_platform, _name, type, r_id, r)	      \
+		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _name##_a, type,\
 		r_id, r, QCOM_RPM_SMD_KEY_ENABLE)
 
-#define DEFINE_CLK_SMD_RPM_QDSS(_platform, _name, _active, type, r_id)	      \
-		__DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id,   \
-		QCOM_RPM_SMD_KEY_STATE)
+#define DEFINE_CLK_SMD_RPM_QDSS(_platform, _name, type, r_id)		      \
+		__DEFINE_CLK_SMD_RPM(_platform, _name##_clk, _name##_a_clk,   \
+		type, r_id, QCOM_RPM_SMD_KEY_STATE)
 
 #define DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, r_id, r)		      \
 		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _name##_a,      \
@@ -408,51 +418,51 @@ static const struct clk_ops clk_smd_rpm_branch_ops = {
 	.recalc_rate	= clk_smd_rpm_recalc_rate,
 };
 
-DEFINE_CLK_SMD_RPM_BRANCH(sdm660, bi_tcxo, bi_tcxo_a, QCOM_SMD_RPM_MISC_CLK, 0, 19200000);
-DEFINE_CLK_SMD_RPM_BRANCH(sm6125, qdss_clk, qdss_a_clk, QCOM_SMD_RPM_MISC_CLK, 1, 19200000);
-DEFINE_CLK_SMD_RPM_QDSS(msm8916, qdss_clk, qdss_a_clk, QCOM_SMD_RPM_MISC_CLK, 1);
-DEFINE_CLK_SMD_RPM_BRANCH(sm6375, bimc_freq_log, bimc_freq_log_a, QCOM_SMD_RPM_MISC_CLK, 4, 1);
+DEFINE_CLK_SMD_RPM_BRANCH_A(sdm660, bi_tcxo, QCOM_SMD_RPM_MISC_CLK, 0, 19200000);
+DEFINE_CLK_SMD_RPM_BRANCH(sm6125, qdss, QCOM_SMD_RPM_MISC_CLK, 1, 19200000);
+DEFINE_CLK_SMD_RPM_QDSS(msm8916, qdss, QCOM_SMD_RPM_MISC_CLK, 1);
+DEFINE_CLK_SMD_RPM_BRANCH_A(sm6375, bimc_freq_log, QCOM_SMD_RPM_MISC_CLK, 4, 1);
 
-DEFINE_CLK_SMD_RPM_BRANCH(msm8992, mss_cfg_ahb_clk, mss_cfg_ahb_a_clk, QCOM_SMD_RPM_MCFG_CLK, 0, 19200000);
+DEFINE_CLK_SMD_RPM_BRANCH(msm8992, mss_cfg_ahb, QCOM_SMD_RPM_MCFG_CLK, 0, 19200000);
 
-DEFINE_CLK_SMD_RPM_BRANCH(msm8996, aggre1_noc_clk, aggre1_noc_a_clk, QCOM_SMD_RPM_AGGR_CLK, 1, 1000);
-DEFINE_CLK_SMD_RPM_BRANCH(msm8996, aggre2_noc_clk, aggre2_noc_a_clk, QCOM_SMD_RPM_AGGR_CLK, 2, 1000);
-DEFINE_CLK_SMD_RPM(msm8998, aggre1_noc_clk, aggre1_noc_a_clk, QCOM_SMD_RPM_AGGR_CLK, 1);
-DEFINE_CLK_SMD_RPM(msm8998, aggre2_noc_clk, aggre2_noc_a_clk, QCOM_SMD_RPM_AGGR_CLK, 2);
+DEFINE_CLK_SMD_RPM_BRANCH(msm8996, aggre1_noc, QCOM_SMD_RPM_AGGR_CLK, 1, 1000);
+DEFINE_CLK_SMD_RPM_BRANCH(msm8996, aggre2_noc, QCOM_SMD_RPM_AGGR_CLK, 2, 1000);
+DEFINE_CLK_SMD_RPM(msm8998, aggre1_noc, QCOM_SMD_RPM_AGGR_CLK, 1);
+DEFINE_CLK_SMD_RPM(msm8998, aggre2_noc, QCOM_SMD_RPM_AGGR_CLK, 2);
 
-DEFINE_CLK_SMD_RPM(msm8916, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
-DEFINE_CLK_SMD_RPM(msm8916, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
-DEFINE_CLK_SMD_RPM(msm8936, sysmmnoc_clk, sysmmnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
-DEFINE_CLK_SMD_RPM(msm8974, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
-DEFINE_CLK_SMD_RPM(msm8974, mmssnoc_ahb_clk, mmssnoc_ahb_a_clk, QCOM_SMD_RPM_BUS_CLK, 3);
-DEFINE_CLK_SMD_RPM(sm6125, snoc_periph_clk, snoc_periph_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
-DEFINE_CLK_SMD_RPM(sm6125, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
-DEFINE_CLK_SMD_RPM(sm6125, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
-DEFINE_CLK_SMD_RPM(sm6125, snoc_lpass_clk, snoc_lpass_a_clk, QCOM_SMD_RPM_BUS_CLK, 5);
+DEFINE_CLK_SMD_RPM(msm8916, pcnoc, QCOM_SMD_RPM_BUS_CLK, 0);
+DEFINE_CLK_SMD_RPM(msm8916, snoc, QCOM_SMD_RPM_BUS_CLK, 1);
+DEFINE_CLK_SMD_RPM(msm8936, sysmmnoc, QCOM_SMD_RPM_BUS_CLK, 2);
+DEFINE_CLK_SMD_RPM(msm8974, cnoc, QCOM_SMD_RPM_BUS_CLK, 2);
+DEFINE_CLK_SMD_RPM(msm8974, mmssnoc_ahb, QCOM_SMD_RPM_BUS_CLK, 3);
+DEFINE_CLK_SMD_RPM(sm6125, snoc_periph, QCOM_SMD_RPM_BUS_CLK, 0);
+DEFINE_CLK_SMD_RPM(sm6125, cnoc, QCOM_SMD_RPM_BUS_CLK, 1);
+DEFINE_CLK_SMD_RPM(sm6125, snoc, QCOM_SMD_RPM_BUS_CLK, 2);
+DEFINE_CLK_SMD_RPM(sm6125, snoc_lpass, QCOM_SMD_RPM_BUS_CLK, 5);
 
-DEFINE_CLK_SMD_RPM(msm8916, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
-DEFINE_CLK_SMD_RPM(qcm2290, cpuss_gnoc_clk, cpuss_gnoc_a_clk, QCOM_SMD_RPM_MEM_CLK, 1);
-DEFINE_CLK_SMD_RPM(msm8974, gfx3d_clk_src, gfx3d_a_clk_src, QCOM_SMD_RPM_MEM_CLK, 1);
-DEFINE_CLK_SMD_RPM(msm8974, ocmemgx_clk, ocmemgx_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
-DEFINE_CLK_SMD_RPM(qcs404, bimc_gpu_clk, bimc_gpu_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
+DEFINE_CLK_SMD_RPM(msm8916, bimc, QCOM_SMD_RPM_MEM_CLK, 0);
+DEFINE_CLK_SMD_RPM(qcm2290, cpuss_gnoc, QCOM_SMD_RPM_MEM_CLK, 1);
+DEFINE_CLK_SMD_RPM_CLK_SRC(msm8974, gfx3d, QCOM_SMD_RPM_MEM_CLK, 1);
+DEFINE_CLK_SMD_RPM(msm8974, ocmemgx, QCOM_SMD_RPM_MEM_CLK, 2);
+DEFINE_CLK_SMD_RPM(qcs404, bimc_gpu, QCOM_SMD_RPM_MEM_CLK, 2);
 
-DEFINE_CLK_SMD_RPM(msm8992, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
-DEFINE_CLK_SMD_RPM(msm8992, ce2_clk, ce2_a_clk, QCOM_SMD_RPM_CE_CLK, 1);
-DEFINE_CLK_SMD_RPM(msm8994, ce3_clk, ce3_a_clk, QCOM_SMD_RPM_CE_CLK, 2);
+DEFINE_CLK_SMD_RPM(msm8992, ce1, QCOM_SMD_RPM_CE_CLK, 0);
+DEFINE_CLK_SMD_RPM(msm8992, ce2, QCOM_SMD_RPM_CE_CLK, 1);
+DEFINE_CLK_SMD_RPM(msm8994, ce3, QCOM_SMD_RPM_CE_CLK, 2);
 
-DEFINE_CLK_SMD_RPM(msm8976, ipa_clk, ipa_a_clk, QCOM_SMD_RPM_IPA_CLK, 0);
+DEFINE_CLK_SMD_RPM(msm8976, ipa, QCOM_SMD_RPM_IPA_CLK, 0);
 
-DEFINE_CLK_SMD_RPM(qcm2290, hwkm_clk, hwkm_a_clk, QCOM_SMD_RPM_HWKM_CLK, 0);
+DEFINE_CLK_SMD_RPM(qcm2290, hwkm, QCOM_SMD_RPM_HWKM_CLK, 0);
 
-DEFINE_CLK_SMD_RPM(msm8996, mmssnoc_axi_rpm_clk, mmssnoc_axi_rpm_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 0);
-DEFINE_CLK_SMD_RPM(sm6125, mmnrt_clk, mmnrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 0);
-DEFINE_CLK_SMD_RPM(sm6125, mmrt_clk, mmrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 1);
+DEFINE_CLK_SMD_RPM(msm8996, mmssnoc_axi_rpm, QCOM_SMD_RPM_MMAXI_CLK, 0);
+DEFINE_CLK_SMD_RPM(sm6125, mmnrt, QCOM_SMD_RPM_MMAXI_CLK, 0);
+DEFINE_CLK_SMD_RPM(sm6125, mmrt, QCOM_SMD_RPM_MMAXI_CLK, 1);
 
-DEFINE_CLK_SMD_RPM(qcm2290, pka_clk, pka_a_clk, QCOM_SMD_RPM_PKA_CLK, 0);
+DEFINE_CLK_SMD_RPM(qcm2290, pka, QCOM_SMD_RPM_PKA_CLK, 0);
 
-DEFINE_CLK_SMD_RPM(qcs404, qpic_clk, qpic_a_clk, QCOM_SMD_RPM_QPIC_CLK, 0);
+DEFINE_CLK_SMD_RPM(qcs404, qpic, QCOM_SMD_RPM_QPIC_CLK, 0);
 
-DEFINE_CLK_SMD_RPM(sm6125, qup_clk, qup_a_clk, QCOM_SMD_RPM_QUP_CLK, 0);
+DEFINE_CLK_SMD_RPM(sm6125, qup, QCOM_SMD_RPM_QUP_CLK, 0);
 
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk1, 1, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk2, 2, 19200000);
-- 
2.35.1

