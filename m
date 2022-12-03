Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B18B164184C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Dec 2022 18:58:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbiLCR63 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Dec 2022 12:58:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbiLCR6X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Dec 2022 12:58:23 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2A4510072
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Dec 2022 09:58:21 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id x6so8838267lji.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Dec 2022 09:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w2LY/89mmeTUIZopN5A6SJ+c8eYCXKPGM2EY1YL99XE=;
        b=I68dxrTkL8qMLmKGNiDi8Arj7peGGa+cnFCkOQ+7e0twgDYiv6AoMtXjqSbKnG1ABT
         jz0Ehd58yM1GaxXJbFLu1vnH1AkcX40LqfkhHoxxtsRONdwZcrUEodWCkRuJ/NxtPxDe
         ERBHJgM1N6MVuQH+m2F9nS1/U10HkGn9A4x2dCWKNf5/55u7MkgDytnhDbaVuXyjDkh2
         Jv8LMYRozKSdr06hY/eJbryZ0bzJZXQ4olRLT6c4cIn7Agcnfi3OvAhVU+P6y+ftZjSh
         dAcVUYtERXi0xzzpPHyQf87ZcWjz/M5iAoHbLig8E+8h7Fp6toq5orpArTmqylhCbDpe
         lDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w2LY/89mmeTUIZopN5A6SJ+c8eYCXKPGM2EY1YL99XE=;
        b=jHbiw4u/tHOJVhSYvctBas+EGW2YsZ4YN+hTdF0MFa2dvSFFsGQFwmHgPI5cs3g17Z
         JttWuLYwv39XEeN38V7Gwh/OvAi6XAX1+cRXSgTkwCp3HDjsvXWFTjAoF2FTMs2NJGLL
         0ZdJoFxOrkP7OlUUBD6Y7QvxWQqA+CdZ1NzTwxaeWSdrsaCBG7gn0JeVCy35W2S3kHH9
         Fjr5Q38Mk23lCW3Jl3lLXu/m1njzCqdaYqx7DUYW0mbyyhxwZx73AKnH7OHIXpKPg+H7
         CwIvZK2/FsCttq9+PWCOHFjHYqgUm2RxuQThQyluN+MknUmzqoBuYSTjmJEyy/2Km27y
         r9Rw==
X-Gm-Message-State: ANoB5pkcOyoPFsKczXtX5H5nPKqua63lEbhBnS/xviON2qTC+30F+khN
        VBACfSiwvZe52WrlzVhGggCIKg==
X-Google-Smtp-Source: AA0mqf507Cx4Mq79gM3CSexYO2U9v65cRDWm8p+B4qwJZZsAPIPXRTFIiyK4jrmHUN3Yf94rWMW33g==
X-Received: by 2002:a2e:9c4e:0:b0:26e:2bda:1821 with SMTP id t14-20020a2e9c4e000000b0026e2bda1821mr18768453ljj.241.1670090299994;
        Sat, 03 Dec 2022 09:58:19 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m4-20020a056512358400b004b19f766b07sm1124703lfr.91.2022.12.03.09.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 09:58:19 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH 12/16] clk: qcom: smd-rpm: simplify SMD_RPM/_BRANCH/_QDSS clock definitions
Date:   Sat,  3 Dec 2022 19:58:04 +0200
Message-Id: <20221203175808.859067-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 90 ++++++++++++++++++----------------
 1 file changed, 49 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 9f33dbd60e96..59abc6bf475d 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -62,7 +62,7 @@
 	}
 
 #define __DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type, r_id,    \
-				    r, key)			      \
+				    r, key)				      \
 	static struct clk_smd_rpm _platform##_##_active;		      \
 	static struct clk_smd_rpm _platform##_##_name = {		      \
 		.rpm_res_type = (type),					      \
@@ -100,16 +100,24 @@
 		},							      \
 	}
 
-#define DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id)	      \
-		__DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id,   \
+#define DEFINE_CLK_SMD_RPM(_platform, _name, type, r_id)		      \
+		__DEFINE_CLK_SMD_RPM(_platform, _name##_clk, _name##_a_clk, type, r_id,   \
 		QCOM_RPM_SMD_KEY_RATE)
 
-#define DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type, r_id, r)   \
-		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type,  \
+#define DEFINE_CLK_SMD_RPM_CLK_SRC(_platform, _name, type, r_id)	      \
+		__DEFINE_CLK_SMD_RPM(_platform, _name##_clk_src, _name##_a_clk_src, type, r_id,   \
+		QCOM_RPM_SMD_KEY_RATE)
+
+#define DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, type, r_id, r)	      \
+		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name##_clk, _name##_a_clk, type,  \
+		r_id, r, QCOM_RPM_SMD_KEY_ENABLE)
+
+#define DEFINE_CLK_SMD_RPM_BRANCH_A(_platform, _name, type, r_id, r)	      \
+		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _name##_a, type,\
 		r_id, r, QCOM_RPM_SMD_KEY_ENABLE)
 
-#define DEFINE_CLK_SMD_RPM_QDSS(_platform, _name, _active, type, r_id)	      \
-		__DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id,   \
+#define DEFINE_CLK_SMD_RPM_QDSS(_platform, _name, type, r_id)		      \
+		__DEFINE_CLK_SMD_RPM(_platform, _name##_clk, _name##_a_clk, type, r_id,   \
 		QCOM_RPM_SMD_KEY_STATE)
 
 #define DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, r_id, r)		      \
@@ -410,51 +418,51 @@ static const struct clk_ops clk_smd_rpm_branch_ops = {
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

