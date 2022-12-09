Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 713916486F9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Dec 2022 17:49:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbiLIQta (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Dec 2022 11:49:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbiLIQtS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Dec 2022 11:49:18 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E730294183
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Dec 2022 08:49:12 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id f16so5497157ljc.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Dec 2022 08:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eS18dDYAFlu7NH8lIu24kELjsWR0luh+6GBIKlov3hk=;
        b=sQiVKBHXFDd9lrj1l/dwnpSU+GrE6+T6KFF4NUPUr8LJ7jVMXeR90RbWLOeH26tDUV
         7IuJTH8rINSWnrpaOG8eQmdkMcRCMDihknI8gzk8udlL6n1rr1HE5XJhikhygb/eUWPX
         6ArWR6Qy8cKytbWBt6WIFC3b/zPOJx1uMixwjfotkm+ICWKL9sFrfhmV6tIQCd/flgTp
         wbi5R94q4D3Dh6GcqnuuEXgdsqXFxgIjjsHJO3HtgUvKgwkzpQMNCki7HliR7Wz6PN9j
         05ZWMIN+pRd/W7JcskXuwqJkYZlGEGzgdbEEYAg+Dselcucb1vQbvjHm8zTQpsTLO3DV
         Hpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eS18dDYAFlu7NH8lIu24kELjsWR0luh+6GBIKlov3hk=;
        b=AKPKJI6qejxsLTs6nviG2q8TLh9K99/BxD4BBWppf5mmeRR1dw+c2LQD1kp7HNa7qN
         wEQwFxwvqiImL44bsEfQ8DmpkbPSyUgFa026O2nFO0TSEhejERCbSABGaWBq0fGDf3dB
         b7XclYAM3aoCHkZXfD+NXzmgM8gecdh15N7aUHN8Vin5aRlcW4xlhJDHIebef6qsO7sF
         t8UTbLJUzt05cQoG8m/iYRUIydPkB57/B0deKqoJhEPf9XJHx+RfMg7xDZYlkqs5BmKk
         XFs4iboeKKdK9SBODBFG5zcHVV3h2TUEeO24QEl9YDtvPhYbFgCdnSBRec4eFl+O0j4J
         j/YQ==
X-Gm-Message-State: ANoB5pnWRYp6iBaoLh3+ALSN8oYRN65VvvUqm4cTVTBX3xn8UMYr11aW
        eMfyyx0WF9B+DME55zSVevwlD/peX/zJN0R4mIY=
X-Google-Smtp-Source: AA0mqf775J/uPlFcSaGi/iTFFWG05/4DSw0YfDdi5Sv12u75rViv/T8FnmVJKt+z83QjPvSIYb2HGQ==
X-Received: by 2002:a05:651c:887:b0:26f:db35:ec42 with SMTP id d7-20020a05651c088700b0026fdb35ec42mr1603386ljq.28.1670604552274;
        Fri, 09 Dec 2022 08:49:12 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y2-20020a05651c106200b002770fb5722fsm275242ljm.123.2022.12.09.08.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 08:49:11 -0800 (PST)
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
Subject: [PATCH v3 19/19] clk: qcom: smd-rpm: remove usage of platform name
Date:   Fri,  9 Dec 2022 18:48:55 +0200
Message-Id: <20221209164855.128798-20-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
References: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
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

Now that all clocks have individual names, remove the names of SoCs from
the SMD RPM clock definitions. Replace it with the common clk_smd_rpm_ prefix.

Reviewed-by: Alex Elder <elder@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 1328 ++++++++++++++++----------------
 1 file changed, 663 insertions(+), 665 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index b8e649a6a76c..8f6e274c6030 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -25,14 +25,14 @@
 #define QCOM_RPM_SMD_KEY_STATE				0x54415453
 #define QCOM_RPM_SCALING_ENABLE_ID			0x2
 
-#define __DEFINE_CLK_SMD_RPM_PREFIX(_platform, _prefix, _name, _active,	      \
+#define __DEFINE_CLK_SMD_RPM_PREFIX(_prefix, _name, _active,		      \
 				    type, r_id, key)			      \
-	static struct clk_smd_rpm _platform##_##_prefix##_active;	      \
-	static struct clk_smd_rpm _platform##_##_prefix##_name = {	      \
+	static struct clk_smd_rpm clk_smd_rpm_##_prefix##_active;	      \
+	static struct clk_smd_rpm clk_smd_rpm_##_prefix##_name = {	      \
 		.rpm_res_type = (type),					      \
 		.rpm_clk_id = (r_id),					      \
 		.rpm_key = (key),					      \
-		.peer = &_platform##_##_prefix##_active,		      \
+		.peer = &clk_smd_rpm_##_prefix##_active,		      \
 		.rate = INT_MAX,					      \
 		.hw.init = &(struct clk_init_data){			      \
 			.ops = &clk_smd_rpm_ops,			      \
@@ -44,12 +44,12 @@
 			.num_parents = 1,				      \
 		},							      \
 	};								      \
-	static struct clk_smd_rpm _platform##_##_prefix##_active = {	      \
+	static struct clk_smd_rpm clk_smd_rpm_##_prefix##_active = {	      \
 		.rpm_res_type = (type),					      \
 		.rpm_clk_id = (r_id),					      \
 		.active_only = true,					      \
 		.rpm_key = (key),					      \
-		.peer = &_platform##_##_prefix##_name,			      \
+		.peer = &clk_smd_rpm_##_prefix##_name,			      \
 		.rate = INT_MAX,					      \
 		.hw.init = &(struct clk_init_data){			      \
 			.ops = &clk_smd_rpm_ops,			      \
@@ -62,19 +62,19 @@
 		},							      \
 	}
 
-#define __DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id, key)      \
-	__DEFINE_CLK_SMD_RPM_PREFIX(_platform, /* empty */, _name, _active,   \
+#define __DEFINE_CLK_SMD_RPM(_name, _active, type, r_id, key)		      \
+	__DEFINE_CLK_SMD_RPM_PREFIX(/* empty */, _name, _active,	      \
 				    type, r_id, key)
 
-#define __DEFINE_CLK_SMD_RPM_BRANCH_PREFIX(_platform, _prefix, _name, _active,\
+#define __DEFINE_CLK_SMD_RPM_BRANCH_PREFIX(_prefix, _name, _active,\
 					   type, r_id, r, key)		      \
-	static struct clk_smd_rpm _platform##_##_prefix##_active;	      \
-	static struct clk_smd_rpm _platform##_##_prefix##_name = {	      \
+	static struct clk_smd_rpm clk_smd_rpm_##_prefix##_active;	      \
+	static struct clk_smd_rpm clk_smd_rpm_##_prefix##_name = {	      \
 		.rpm_res_type = (type),					      \
 		.rpm_clk_id = (r_id),					      \
 		.rpm_key = (key),					      \
 		.branch = true,						      \
-		.peer = &_platform##_##_prefix##_active,		      \
+		.peer = &clk_smd_rpm_##_prefix##_active,		      \
 		.rate = (r),						      \
 		.hw.init = &(struct clk_init_data){			      \
 			.ops = &clk_smd_rpm_branch_ops,			      \
@@ -86,13 +86,13 @@
 			.num_parents = 1,				      \
 		},							      \
 	};								      \
-	static struct clk_smd_rpm _platform##_##_prefix##_active = {	      \
+	static struct clk_smd_rpm clk_smd_rpm_##_prefix##_active = {	      \
 		.rpm_res_type = (type),					      \
 		.rpm_clk_id = (r_id),					      \
 		.active_only = true,					      \
 		.rpm_key = (key),					      \
 		.branch = true,						      \
-		.peer = &_platform##_##_prefix##_name,			      \
+		.peer = &clk_smd_rpm_##_prefix##_name,			      \
 		.rate = (r),						      \
 		.hw.init = &(struct clk_init_data){			      \
 			.ops = &clk_smd_rpm_branch_ops,			      \
@@ -105,54 +105,52 @@
 		},							      \
 	}
 
-#define __DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type, r_id,    \
-				    r, key)				      \
-		__DEFINE_CLK_SMD_RPM_BRANCH_PREFIX(_platform, /* empty */,    \
+#define __DEFINE_CLK_SMD_RPM_BRANCH(_name, _active, type, r_id, r, key)	      \
+		__DEFINE_CLK_SMD_RPM_BRANCH_PREFIX(/* empty */,		      \
 		_name, _active, type, r_id, r, key)
 
-#define DEFINE_CLK_SMD_RPM(_platform, _name, type, r_id)		      \
-		__DEFINE_CLK_SMD_RPM(_platform, _name##_clk, _name##_a_clk,   \
+#define DEFINE_CLK_SMD_RPM(_name, type, r_id)				      \
+		__DEFINE_CLK_SMD_RPM(_name##_clk, _name##_a_clk,	      \
 		type, r_id, QCOM_RPM_SMD_KEY_RATE)
 
-#define DEFINE_CLK_SMD_RPM_BUS(_platform, _name, r_id)			      \
-		__DEFINE_CLK_SMD_RPM_PREFIX(_platform, bus_##r_id##_,	      \
+#define DEFINE_CLK_SMD_RPM_BUS(_name, r_id)				      \
+		__DEFINE_CLK_SMD_RPM_PREFIX(bus_##r_id##_,		      \
 		_name##_clk, _name##_a_clk, QCOM_SMD_RPM_BUS_CLK, r_id,	      \
 		QCOM_RPM_SMD_KEY_RATE)
 
-#define DEFINE_CLK_SMD_RPM_CLK_SRC(_platform, _name, type, r_id)	      \
-		__DEFINE_CLK_SMD_RPM(_platform,				      \
+#define DEFINE_CLK_SMD_RPM_CLK_SRC(_name, type, r_id)			      \
+		__DEFINE_CLK_SMD_RPM(					      \
 		_name##_clk_src, _name##_a_clk_src,			      \
 		type, r_id, QCOM_RPM_SMD_KEY_RATE)
 
-#define DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, type, r_id, r)	      \
-		__DEFINE_CLK_SMD_RPM_BRANCH_PREFIX(_platform, branch_,	      \
+#define DEFINE_CLK_SMD_RPM_BRANCH(_name, type, r_id, r)			      \
+		__DEFINE_CLK_SMD_RPM_BRANCH_PREFIX(branch_,		      \
 		_name##_clk, _name##_a_clk,				      \
 		type, r_id, r, QCOM_RPM_SMD_KEY_ENABLE)
 
-#define DEFINE_CLK_SMD_RPM_BRANCH_A(_platform, _name, type, r_id, r)	      \
-		__DEFINE_CLK_SMD_RPM_BRANCH_PREFIX(_platform, branch_,	      \
+#define DEFINE_CLK_SMD_RPM_BRANCH_A(_name, type, r_id, r)		      \
+		__DEFINE_CLK_SMD_RPM_BRANCH_PREFIX(branch_,		      \
 		_name, _name##_a, type,					      \
 		r_id, r, QCOM_RPM_SMD_KEY_ENABLE)
 
-#define DEFINE_CLK_SMD_RPM_QDSS(_platform, _name, type, r_id)		      \
-		__DEFINE_CLK_SMD_RPM(_platform, _name##_clk, _name##_a_clk,   \
+#define DEFINE_CLK_SMD_RPM_QDSS(_name, type, r_id)			      \
+		__DEFINE_CLK_SMD_RPM(_name##_clk, _name##_a_clk,	      \
 		type, r_id, QCOM_RPM_SMD_KEY_STATE)
 
-#define DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, r_id, r)		      \
-		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _name##_a,      \
+#define DEFINE_CLK_SMD_RPM_XO_BUFFER(_name, r_id, r)			      \
+		__DEFINE_CLK_SMD_RPM_BRANCH(_name, _name##_a,		      \
 		QCOM_SMD_RPM_CLK_BUF_A, r_id, r,			      \
 		QCOM_RPM_KEY_SOFTWARE_ENABLE)
 
-#define DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(_platform, _prefix, _name, r_id, r) \
-		__DEFINE_CLK_SMD_RPM_BRANCH_PREFIX(_platform, _prefix,	      \
+#define DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(_prefix, _name, r_id, r)	      \
+		__DEFINE_CLK_SMD_RPM_BRANCH_PREFIX(_prefix,		      \
 		_name, _name##_a,					      \
 		QCOM_SMD_RPM_CLK_BUF_A, r_id, r,			      \
 		QCOM_RPM_KEY_SOFTWARE_ENABLE)
 
-#define DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(_platform, _name, r_id, r)	      \
-		DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, r_id, r);      \
-		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name##_pin,	      \
-		_name##_a##_pin,					      \
+#define DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(_name, r_id, r)		      \
+		DEFINE_CLK_SMD_RPM_XO_BUFFER(_name, r_id, r);		      \
+		__DEFINE_CLK_SMD_RPM_BRANCH(_name##_pin, _name##_a##_pin,     \
 		QCOM_SMD_RPM_CLK_BUF_A, r_id, r,			      \
 		QCOM_RPM_KEY_PIN_CTRL_CLK_BUFFER_ENABLE_KEY)
 
@@ -440,102 +438,102 @@ static const struct clk_ops clk_smd_rpm_branch_ops = {
 	.recalc_rate	= clk_smd_rpm_recalc_rate,
 };
 
-DEFINE_CLK_SMD_RPM_BRANCH_A(sdm660, bi_tcxo, QCOM_SMD_RPM_MISC_CLK, 0, 19200000);
-DEFINE_CLK_SMD_RPM_BRANCH(sm6125, qdss, QCOM_SMD_RPM_MISC_CLK, 1, 19200000);
-DEFINE_CLK_SMD_RPM_QDSS(msm8916, qdss, QCOM_SMD_RPM_MISC_CLK, 1);
-DEFINE_CLK_SMD_RPM_BRANCH_A(sm6375, bimc_freq_log, QCOM_SMD_RPM_MISC_CLK, 4, 1);
+DEFINE_CLK_SMD_RPM_BRANCH_A(bi_tcxo, QCOM_SMD_RPM_MISC_CLK, 0, 19200000);
+DEFINE_CLK_SMD_RPM_BRANCH(qdss, QCOM_SMD_RPM_MISC_CLK, 1, 19200000);
+DEFINE_CLK_SMD_RPM_QDSS(qdss, QCOM_SMD_RPM_MISC_CLK, 1);
+DEFINE_CLK_SMD_RPM_BRANCH_A(bimc_freq_log, QCOM_SMD_RPM_MISC_CLK, 4, 1);
 
-DEFINE_CLK_SMD_RPM_BRANCH(msm8992, mss_cfg_ahb, QCOM_SMD_RPM_MCFG_CLK, 0, 19200000);
+DEFINE_CLK_SMD_RPM_BRANCH(mss_cfg_ahb, QCOM_SMD_RPM_MCFG_CLK, 0, 19200000);
 
-DEFINE_CLK_SMD_RPM_BRANCH(msm8996, aggre1_noc, QCOM_SMD_RPM_AGGR_CLK, 1, 1000);
-DEFINE_CLK_SMD_RPM_BRANCH(msm8996, aggre2_noc, QCOM_SMD_RPM_AGGR_CLK, 2, 1000);
-DEFINE_CLK_SMD_RPM(msm8998, aggre1_noc, QCOM_SMD_RPM_AGGR_CLK, 1);
-DEFINE_CLK_SMD_RPM(msm8998, aggre2_noc, QCOM_SMD_RPM_AGGR_CLK, 2);
+DEFINE_CLK_SMD_RPM_BRANCH(aggre1_noc, QCOM_SMD_RPM_AGGR_CLK, 1, 1000);
+DEFINE_CLK_SMD_RPM_BRANCH(aggre2_noc, QCOM_SMD_RPM_AGGR_CLK, 2, 1000);
+DEFINE_CLK_SMD_RPM(aggre1_noc, QCOM_SMD_RPM_AGGR_CLK, 1);
+DEFINE_CLK_SMD_RPM(aggre2_noc, QCOM_SMD_RPM_AGGR_CLK, 2);
 
-DEFINE_CLK_SMD_RPM_BUS(msm8916, pcnoc, 0);
-DEFINE_CLK_SMD_RPM_BUS(msm8916, snoc, 1);
-DEFINE_CLK_SMD_RPM_BUS(msm8936, sysmmnoc, 2);
-DEFINE_CLK_SMD_RPM_BUS(msm8974, cnoc, 2);
-DEFINE_CLK_SMD_RPM_BUS(msm8974, mmssnoc_ahb, 3);
-DEFINE_CLK_SMD_RPM_BUS(sm6125, snoc_periph, 0);
-DEFINE_CLK_SMD_RPM_BUS(sm6125, cnoc, 1);
-DEFINE_CLK_SMD_RPM_BUS(sm6125, snoc, 2);
-DEFINE_CLK_SMD_RPM_BUS(sm6125, snoc_lpass, 5);
+DEFINE_CLK_SMD_RPM_BUS(pcnoc, 0);
+DEFINE_CLK_SMD_RPM_BUS(snoc, 1);
+DEFINE_CLK_SMD_RPM_BUS(sysmmnoc, 2);
+DEFINE_CLK_SMD_RPM_BUS(cnoc, 2);
+DEFINE_CLK_SMD_RPM_BUS(mmssnoc_ahb, 3);
+DEFINE_CLK_SMD_RPM_BUS(snoc_periph, 0);
+DEFINE_CLK_SMD_RPM_BUS(cnoc, 1);
+DEFINE_CLK_SMD_RPM_BUS(snoc, 2);
+DEFINE_CLK_SMD_RPM_BUS(snoc_lpass, 5);
 
-DEFINE_CLK_SMD_RPM(msm8916, bimc, QCOM_SMD_RPM_MEM_CLK, 0);
-DEFINE_CLK_SMD_RPM(qcm2290, cpuss_gnoc, QCOM_SMD_RPM_MEM_CLK, 1);
-DEFINE_CLK_SMD_RPM_CLK_SRC(msm8974, gfx3d, QCOM_SMD_RPM_MEM_CLK, 1);
-DEFINE_CLK_SMD_RPM(msm8974, ocmemgx, QCOM_SMD_RPM_MEM_CLK, 2);
-DEFINE_CLK_SMD_RPM(qcs404, bimc_gpu, QCOM_SMD_RPM_MEM_CLK, 2);
+DEFINE_CLK_SMD_RPM(bimc, QCOM_SMD_RPM_MEM_CLK, 0);
+DEFINE_CLK_SMD_RPM(cpuss_gnoc, QCOM_SMD_RPM_MEM_CLK, 1);
+DEFINE_CLK_SMD_RPM_CLK_SRC(gfx3d, QCOM_SMD_RPM_MEM_CLK, 1);
+DEFINE_CLK_SMD_RPM(ocmemgx, QCOM_SMD_RPM_MEM_CLK, 2);
+DEFINE_CLK_SMD_RPM(bimc_gpu, QCOM_SMD_RPM_MEM_CLK, 2);
 
-DEFINE_CLK_SMD_RPM(msm8992, ce1, QCOM_SMD_RPM_CE_CLK, 0);
-DEFINE_CLK_SMD_RPM(msm8992, ce2, QCOM_SMD_RPM_CE_CLK, 1);
-DEFINE_CLK_SMD_RPM(msm8994, ce3, QCOM_SMD_RPM_CE_CLK, 2);
+DEFINE_CLK_SMD_RPM(ce1, QCOM_SMD_RPM_CE_CLK, 0);
+DEFINE_CLK_SMD_RPM(ce2, QCOM_SMD_RPM_CE_CLK, 1);
+DEFINE_CLK_SMD_RPM(ce3, QCOM_SMD_RPM_CE_CLK, 2);
 
-DEFINE_CLK_SMD_RPM(msm8976, ipa, QCOM_SMD_RPM_IPA_CLK, 0);
+DEFINE_CLK_SMD_RPM(ipa, QCOM_SMD_RPM_IPA_CLK, 0);
 
-DEFINE_CLK_SMD_RPM(qcm2290, hwkm, QCOM_SMD_RPM_HWKM_CLK, 0);
+DEFINE_CLK_SMD_RPM(hwkm, QCOM_SMD_RPM_HWKM_CLK, 0);
 
-DEFINE_CLK_SMD_RPM(msm8996, mmssnoc_axi_rpm, QCOM_SMD_RPM_MMAXI_CLK, 0);
-DEFINE_CLK_SMD_RPM(sm6125, mmnrt, QCOM_SMD_RPM_MMAXI_CLK, 0);
-DEFINE_CLK_SMD_RPM(sm6125, mmrt, QCOM_SMD_RPM_MMAXI_CLK, 1);
+DEFINE_CLK_SMD_RPM(mmssnoc_axi_rpm, QCOM_SMD_RPM_MMAXI_CLK, 0);
+DEFINE_CLK_SMD_RPM(mmnrt, QCOM_SMD_RPM_MMAXI_CLK, 0);
+DEFINE_CLK_SMD_RPM(mmrt, QCOM_SMD_RPM_MMAXI_CLK, 1);
 
-DEFINE_CLK_SMD_RPM(qcm2290, pka, QCOM_SMD_RPM_PKA_CLK, 0);
+DEFINE_CLK_SMD_RPM(pka, QCOM_SMD_RPM_PKA_CLK, 0);
 
-DEFINE_CLK_SMD_RPM(qcs404, qpic, QCOM_SMD_RPM_QPIC_CLK, 0);
+DEFINE_CLK_SMD_RPM(qpic, QCOM_SMD_RPM_QPIC_CLK, 0);
 
-DEFINE_CLK_SMD_RPM(sm6125, qup, QCOM_SMD_RPM_QUP_CLK, 0);
+DEFINE_CLK_SMD_RPM(qup, QCOM_SMD_RPM_QUP_CLK, 0);
 
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk1, 1, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk2, 2, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk1, 1, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk2, 2, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk3, 3, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, rf_clk1, 4, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, rf_clk2, 5, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk3, 6, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, ln_bb_clk, 8, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(bb_clk1, 1, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(bb_clk2, 2, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(ln_bb_clk1, 1, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(ln_bb_clk2, 2, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(ln_bb_clk3, 3, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(rf_clk1, 4, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(rf_clk2, 5, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(rf_clk3, 6, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(ln_bb_clk, 8, 19200000);
 
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(qcm2290, 38m4_, rf_clk3, 6, 38400000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(38m4_, rf_clk3, 6, 38400000);
 
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d0, 1, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d1, 2, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a0, 4, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a1, 5, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a2, 6, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(cxo_d0, 1, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(cxo_d1, 2, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(cxo_a0, 4, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(cxo_a1, 5, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(cxo_a2, 6, 19200000);
 
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, diff_clk, 7, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk1, 11, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk2, 12, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, div_clk3, 13, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(diff_clk, 7, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(div_clk1, 11, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(div_clk2, 12, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(div_clk3, 13, 19200000);
 
 static struct clk_smd_rpm *msm8909_clks[] = {
-	[RPM_SMD_PCNOC_CLK]		= &msm8916_bus_0_pcnoc_clk,
-	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_bus_0_pcnoc_a_clk,
-	[RPM_SMD_SNOC_CLK]		= &msm8916_bus_1_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK]		= &msm8916_bus_1_snoc_a_clk,
-	[RPM_SMD_BIMC_CLK]		= &msm8916_bimc_clk,
-	[RPM_SMD_BIMC_A_CLK]		= &msm8916_bimc_a_clk,
-	[RPM_SMD_QPIC_CLK]		= &qcs404_qpic_clk,
-	[RPM_SMD_QPIC_CLK_A]		= &qcs404_qpic_a_clk,
-	[RPM_SMD_QDSS_CLK]		= &msm8916_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK]		= &msm8916_qdss_a_clk,
-	[RPM_SMD_BB_CLK1]		= &msm8916_bb_clk1,
-	[RPM_SMD_BB_CLK1_A]		= &msm8916_bb_clk1_a,
-	[RPM_SMD_BB_CLK2]		= &msm8916_bb_clk2,
-	[RPM_SMD_BB_CLK2_A]		= &msm8916_bb_clk2_a,
-	[RPM_SMD_RF_CLK1]		= &msm8916_rf_clk1,
-	[RPM_SMD_RF_CLK1_A]		= &msm8916_rf_clk1_a,
-	[RPM_SMD_RF_CLK2]		= &msm8916_rf_clk2,
-	[RPM_SMD_RF_CLK2_A]		= &msm8916_rf_clk2_a,
-	[RPM_SMD_BB_CLK1_PIN]		= &msm8916_bb_clk1_pin,
-	[RPM_SMD_BB_CLK1_A_PIN]		= &msm8916_bb_clk1_a_pin,
-	[RPM_SMD_BB_CLK2_PIN]		= &msm8916_bb_clk2_pin,
-	[RPM_SMD_BB_CLK2_A_PIN]		= &msm8916_bb_clk2_a_pin,
-	[RPM_SMD_RF_CLK1_PIN]		= &msm8916_rf_clk1_pin,
-	[RPM_SMD_RF_CLK1_A_PIN]		= &msm8916_rf_clk1_a_pin,
-	[RPM_SMD_RF_CLK2_PIN]		= &msm8916_rf_clk2_pin,
-	[RPM_SMD_RF_CLK2_A_PIN]		= &msm8916_rf_clk2_a_pin,
+	[RPM_SMD_PCNOC_CLK]		= &clk_smd_rpm_bus_0_pcnoc_clk,
+	[RPM_SMD_PCNOC_A_CLK]		= &clk_smd_rpm_bus_0_pcnoc_a_clk,
+	[RPM_SMD_SNOC_CLK]		= &clk_smd_rpm_bus_1_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK]		= &clk_smd_rpm_bus_1_snoc_a_clk,
+	[RPM_SMD_BIMC_CLK]		= &clk_smd_rpm_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK]		= &clk_smd_rpm_bimc_a_clk,
+	[RPM_SMD_QPIC_CLK]		= &clk_smd_rpm_qpic_clk,
+	[RPM_SMD_QPIC_CLK_A]		= &clk_smd_rpm_qpic_a_clk,
+	[RPM_SMD_QDSS_CLK]		= &clk_smd_rpm_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK]		= &clk_smd_rpm_qdss_a_clk,
+	[RPM_SMD_BB_CLK1]		= &clk_smd_rpm_bb_clk1,
+	[RPM_SMD_BB_CLK1_A]		= &clk_smd_rpm_bb_clk1_a,
+	[RPM_SMD_BB_CLK2]		= &clk_smd_rpm_bb_clk2,
+	[RPM_SMD_BB_CLK2_A]		= &clk_smd_rpm_bb_clk2_a,
+	[RPM_SMD_RF_CLK1]		= &clk_smd_rpm_rf_clk1,
+	[RPM_SMD_RF_CLK1_A]		= &clk_smd_rpm_rf_clk1_a,
+	[RPM_SMD_RF_CLK2]		= &clk_smd_rpm_rf_clk2,
+	[RPM_SMD_RF_CLK2_A]		= &clk_smd_rpm_rf_clk2_a,
+	[RPM_SMD_BB_CLK1_PIN]		= &clk_smd_rpm_bb_clk1_pin,
+	[RPM_SMD_BB_CLK1_A_PIN]		= &clk_smd_rpm_bb_clk1_a_pin,
+	[RPM_SMD_BB_CLK2_PIN]		= &clk_smd_rpm_bb_clk2_pin,
+	[RPM_SMD_BB_CLK2_A_PIN]		= &clk_smd_rpm_bb_clk2_a_pin,
+	[RPM_SMD_RF_CLK1_PIN]		= &clk_smd_rpm_rf_clk1_pin,
+	[RPM_SMD_RF_CLK1_A_PIN]		= &clk_smd_rpm_rf_clk1_a_pin,
+	[RPM_SMD_RF_CLK2_PIN]		= &clk_smd_rpm_rf_clk2_pin,
+	[RPM_SMD_RF_CLK2_A_PIN]		= &clk_smd_rpm_rf_clk2_a_pin,
 };
 
 static const struct rpm_smd_clk_desc rpm_clk_msm8909 = {
@@ -544,30 +542,30 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8909 = {
 };
 
 static struct clk_smd_rpm *msm8916_clks[] = {
-	[RPM_SMD_PCNOC_CLK]		= &msm8916_bus_0_pcnoc_clk,
-	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_bus_0_pcnoc_a_clk,
-	[RPM_SMD_SNOC_CLK]		= &msm8916_bus_1_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK]		= &msm8916_bus_1_snoc_a_clk,
-	[RPM_SMD_BIMC_CLK]		= &msm8916_bimc_clk,
-	[RPM_SMD_BIMC_A_CLK]		= &msm8916_bimc_a_clk,
-	[RPM_SMD_QDSS_CLK]		= &msm8916_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK]		= &msm8916_qdss_a_clk,
-	[RPM_SMD_BB_CLK1]		= &msm8916_bb_clk1,
-	[RPM_SMD_BB_CLK1_A]		= &msm8916_bb_clk1_a,
-	[RPM_SMD_BB_CLK2]		= &msm8916_bb_clk2,
-	[RPM_SMD_BB_CLK2_A]		= &msm8916_bb_clk2_a,
-	[RPM_SMD_RF_CLK1]		= &msm8916_rf_clk1,
-	[RPM_SMD_RF_CLK1_A]		= &msm8916_rf_clk1_a,
-	[RPM_SMD_RF_CLK2]		= &msm8916_rf_clk2,
-	[RPM_SMD_RF_CLK2_A]		= &msm8916_rf_clk2_a,
-	[RPM_SMD_BB_CLK1_PIN]		= &msm8916_bb_clk1_pin,
-	[RPM_SMD_BB_CLK1_A_PIN]		= &msm8916_bb_clk1_a_pin,
-	[RPM_SMD_BB_CLK2_PIN]		= &msm8916_bb_clk2_pin,
-	[RPM_SMD_BB_CLK2_A_PIN]		= &msm8916_bb_clk2_a_pin,
-	[RPM_SMD_RF_CLK1_PIN]		= &msm8916_rf_clk1_pin,
-	[RPM_SMD_RF_CLK1_A_PIN]		= &msm8916_rf_clk1_a_pin,
-	[RPM_SMD_RF_CLK2_PIN]		= &msm8916_rf_clk2_pin,
-	[RPM_SMD_RF_CLK2_A_PIN]		= &msm8916_rf_clk2_a_pin,
+	[RPM_SMD_PCNOC_CLK]		= &clk_smd_rpm_bus_0_pcnoc_clk,
+	[RPM_SMD_PCNOC_A_CLK]		= &clk_smd_rpm_bus_0_pcnoc_a_clk,
+	[RPM_SMD_SNOC_CLK]		= &clk_smd_rpm_bus_1_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK]		= &clk_smd_rpm_bus_1_snoc_a_clk,
+	[RPM_SMD_BIMC_CLK]		= &clk_smd_rpm_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK]		= &clk_smd_rpm_bimc_a_clk,
+	[RPM_SMD_QDSS_CLK]		= &clk_smd_rpm_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK]		= &clk_smd_rpm_qdss_a_clk,
+	[RPM_SMD_BB_CLK1]		= &clk_smd_rpm_bb_clk1,
+	[RPM_SMD_BB_CLK1_A]		= &clk_smd_rpm_bb_clk1_a,
+	[RPM_SMD_BB_CLK2]		= &clk_smd_rpm_bb_clk2,
+	[RPM_SMD_BB_CLK2_A]		= &clk_smd_rpm_bb_clk2_a,
+	[RPM_SMD_RF_CLK1]		= &clk_smd_rpm_rf_clk1,
+	[RPM_SMD_RF_CLK1_A]		= &clk_smd_rpm_rf_clk1_a,
+	[RPM_SMD_RF_CLK2]		= &clk_smd_rpm_rf_clk2,
+	[RPM_SMD_RF_CLK2_A]		= &clk_smd_rpm_rf_clk2_a,
+	[RPM_SMD_BB_CLK1_PIN]		= &clk_smd_rpm_bb_clk1_pin,
+	[RPM_SMD_BB_CLK1_A_PIN]		= &clk_smd_rpm_bb_clk1_a_pin,
+	[RPM_SMD_BB_CLK2_PIN]		= &clk_smd_rpm_bb_clk2_pin,
+	[RPM_SMD_BB_CLK2_A_PIN]		= &clk_smd_rpm_bb_clk2_a_pin,
+	[RPM_SMD_RF_CLK1_PIN]		= &clk_smd_rpm_rf_clk1_pin,
+	[RPM_SMD_RF_CLK1_A_PIN]		= &clk_smd_rpm_rf_clk1_a_pin,
+	[RPM_SMD_RF_CLK2_PIN]		= &clk_smd_rpm_rf_clk2_pin,
+	[RPM_SMD_RF_CLK2_A_PIN]		= &clk_smd_rpm_rf_clk2_a_pin,
 };
 
 static const struct rpm_smd_clk_desc rpm_clk_msm8916 = {
@@ -576,32 +574,32 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8916 = {
 };
 
 static struct clk_smd_rpm *msm8936_clks[] = {
-	[RPM_SMD_PCNOC_CLK]		= &msm8916_bus_0_pcnoc_clk,
-	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_bus_0_pcnoc_a_clk,
-	[RPM_SMD_SNOC_CLK]		= &msm8916_bus_1_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK]		= &msm8916_bus_1_snoc_a_clk,
-	[RPM_SMD_BIMC_CLK]		= &msm8916_bimc_clk,
-	[RPM_SMD_BIMC_A_CLK]		= &msm8916_bimc_a_clk,
-	[RPM_SMD_SYSMMNOC_CLK]		= &msm8936_bus_2_sysmmnoc_clk,
-	[RPM_SMD_SYSMMNOC_A_CLK]	= &msm8936_bus_2_sysmmnoc_a_clk,
-	[RPM_SMD_QDSS_CLK]		= &msm8916_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK]		= &msm8916_qdss_a_clk,
-	[RPM_SMD_BB_CLK1]		= &msm8916_bb_clk1,
-	[RPM_SMD_BB_CLK1_A]		= &msm8916_bb_clk1_a,
-	[RPM_SMD_BB_CLK2]		= &msm8916_bb_clk2,
-	[RPM_SMD_BB_CLK2_A]		= &msm8916_bb_clk2_a,
-	[RPM_SMD_RF_CLK1]		= &msm8916_rf_clk1,
-	[RPM_SMD_RF_CLK1_A]		= &msm8916_rf_clk1_a,
-	[RPM_SMD_RF_CLK2]		= &msm8916_rf_clk2,
-	[RPM_SMD_RF_CLK2_A]		= &msm8916_rf_clk2_a,
-	[RPM_SMD_BB_CLK1_PIN]		= &msm8916_bb_clk1_pin,
-	[RPM_SMD_BB_CLK1_A_PIN]		= &msm8916_bb_clk1_a_pin,
-	[RPM_SMD_BB_CLK2_PIN]		= &msm8916_bb_clk2_pin,
-	[RPM_SMD_BB_CLK2_A_PIN]		= &msm8916_bb_clk2_a_pin,
-	[RPM_SMD_RF_CLK1_PIN]		= &msm8916_rf_clk1_pin,
-	[RPM_SMD_RF_CLK1_A_PIN]		= &msm8916_rf_clk1_a_pin,
-	[RPM_SMD_RF_CLK2_PIN]		= &msm8916_rf_clk2_pin,
-	[RPM_SMD_RF_CLK2_A_PIN]		= &msm8916_rf_clk2_a_pin,
+	[RPM_SMD_PCNOC_CLK]		= &clk_smd_rpm_bus_0_pcnoc_clk,
+	[RPM_SMD_PCNOC_A_CLK]		= &clk_smd_rpm_bus_0_pcnoc_a_clk,
+	[RPM_SMD_SNOC_CLK]		= &clk_smd_rpm_bus_1_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK]		= &clk_smd_rpm_bus_1_snoc_a_clk,
+	[RPM_SMD_BIMC_CLK]		= &clk_smd_rpm_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK]		= &clk_smd_rpm_bimc_a_clk,
+	[RPM_SMD_SYSMMNOC_CLK]		= &clk_smd_rpm_bus_2_sysmmnoc_clk,
+	[RPM_SMD_SYSMMNOC_A_CLK]	= &clk_smd_rpm_bus_2_sysmmnoc_a_clk,
+	[RPM_SMD_QDSS_CLK]		= &clk_smd_rpm_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK]		= &clk_smd_rpm_qdss_a_clk,
+	[RPM_SMD_BB_CLK1]		= &clk_smd_rpm_bb_clk1,
+	[RPM_SMD_BB_CLK1_A]		= &clk_smd_rpm_bb_clk1_a,
+	[RPM_SMD_BB_CLK2]		= &clk_smd_rpm_bb_clk2,
+	[RPM_SMD_BB_CLK2_A]		= &clk_smd_rpm_bb_clk2_a,
+	[RPM_SMD_RF_CLK1]		= &clk_smd_rpm_rf_clk1,
+	[RPM_SMD_RF_CLK1_A]		= &clk_smd_rpm_rf_clk1_a,
+	[RPM_SMD_RF_CLK2]		= &clk_smd_rpm_rf_clk2,
+	[RPM_SMD_RF_CLK2_A]		= &clk_smd_rpm_rf_clk2_a,
+	[RPM_SMD_BB_CLK1_PIN]		= &clk_smd_rpm_bb_clk1_pin,
+	[RPM_SMD_BB_CLK1_A_PIN]		= &clk_smd_rpm_bb_clk1_a_pin,
+	[RPM_SMD_BB_CLK2_PIN]		= &clk_smd_rpm_bb_clk2_pin,
+	[RPM_SMD_BB_CLK2_A_PIN]		= &clk_smd_rpm_bb_clk2_a_pin,
+	[RPM_SMD_RF_CLK1_PIN]		= &clk_smd_rpm_rf_clk1_pin,
+	[RPM_SMD_RF_CLK1_A_PIN]		= &clk_smd_rpm_rf_clk1_a_pin,
+	[RPM_SMD_RF_CLK2_PIN]		= &clk_smd_rpm_rf_clk2_pin,
+	[RPM_SMD_RF_CLK2_A_PIN]		= &clk_smd_rpm_rf_clk2_a_pin,
 };
 
 static const struct rpm_smd_clk_desc rpm_clk_msm8936 = {
@@ -610,48 +608,48 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8936 = {
 };
 
 static struct clk_smd_rpm *msm8974_clks[] = {
-	[RPM_SMD_PNOC_CLK]		= &msm8916_bus_0_pcnoc_clk,
-	[RPM_SMD_PNOC_A_CLK]		= &msm8916_bus_0_pcnoc_a_clk,
-	[RPM_SMD_SNOC_CLK]		= &msm8916_bus_1_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK]		= &msm8916_bus_1_snoc_a_clk,
-	[RPM_SMD_CNOC_CLK]		= &msm8974_bus_2_cnoc_clk,
-	[RPM_SMD_CNOC_A_CLK]		= &msm8974_bus_2_cnoc_a_clk,
-	[RPM_SMD_MMSSNOC_AHB_CLK]	= &msm8974_bus_3_mmssnoc_ahb_clk,
-	[RPM_SMD_MMSSNOC_AHB_A_CLK]	= &msm8974_bus_3_mmssnoc_ahb_a_clk,
-	[RPM_SMD_BIMC_CLK]		= &msm8916_bimc_clk,
-	[RPM_SMD_GFX3D_CLK_SRC]		= &msm8974_gfx3d_clk_src,
-	[RPM_SMD_GFX3D_A_CLK_SRC]	= &msm8974_gfx3d_a_clk_src,
-	[RPM_SMD_BIMC_A_CLK]		= &msm8916_bimc_a_clk,
-	[RPM_SMD_OCMEMGX_CLK]		= &msm8974_ocmemgx_clk,
-	[RPM_SMD_OCMEMGX_A_CLK]		= &msm8974_ocmemgx_a_clk,
-	[RPM_SMD_QDSS_CLK]		= &msm8916_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK]		= &msm8916_qdss_a_clk,
-	[RPM_SMD_CXO_D0]		= &msm8974_cxo_d0,
-	[RPM_SMD_CXO_D0_A]		= &msm8974_cxo_d0_a,
-	[RPM_SMD_CXO_D1]		= &msm8974_cxo_d1,
-	[RPM_SMD_CXO_D1_A]		= &msm8974_cxo_d1_a,
-	[RPM_SMD_CXO_A0]		= &msm8974_cxo_a0,
-	[RPM_SMD_CXO_A0_A]		= &msm8974_cxo_a0_a,
-	[RPM_SMD_CXO_A1]		= &msm8974_cxo_a1,
-	[RPM_SMD_CXO_A1_A]		= &msm8974_cxo_a1_a,
-	[RPM_SMD_CXO_A2]		= &msm8974_cxo_a2,
-	[RPM_SMD_CXO_A2_A]		= &msm8974_cxo_a2_a,
-	[RPM_SMD_DIFF_CLK]		= &msm8974_diff_clk,
-	[RPM_SMD_DIFF_A_CLK]		= &msm8974_diff_clk_a,
-	[RPM_SMD_DIV_CLK1]		= &msm8974_div_clk1,
-	[RPM_SMD_DIV_A_CLK1]		= &msm8974_div_clk1_a,
-	[RPM_SMD_DIV_CLK2]		= &msm8974_div_clk2,
-	[RPM_SMD_DIV_A_CLK2]		= &msm8974_div_clk2_a,
-	[RPM_SMD_CXO_D0_PIN]		= &msm8974_cxo_d0_pin,
-	[RPM_SMD_CXO_D0_A_PIN]		= &msm8974_cxo_d0_a_pin,
-	[RPM_SMD_CXO_D1_PIN]		= &msm8974_cxo_d1_pin,
-	[RPM_SMD_CXO_D1_A_PIN]		= &msm8974_cxo_d1_a_pin,
-	[RPM_SMD_CXO_A0_PIN]		= &msm8974_cxo_a0_pin,
-	[RPM_SMD_CXO_A0_A_PIN]		= &msm8974_cxo_a0_a_pin,
-	[RPM_SMD_CXO_A1_PIN]		= &msm8974_cxo_a1_pin,
-	[RPM_SMD_CXO_A1_A_PIN]		= &msm8974_cxo_a1_a_pin,
-	[RPM_SMD_CXO_A2_PIN]		= &msm8974_cxo_a2_pin,
-	[RPM_SMD_CXO_A2_A_PIN]		= &msm8974_cxo_a2_a_pin,
+	[RPM_SMD_PNOC_CLK]		= &clk_smd_rpm_bus_0_pcnoc_clk,
+	[RPM_SMD_PNOC_A_CLK]		= &clk_smd_rpm_bus_0_pcnoc_a_clk,
+	[RPM_SMD_SNOC_CLK]		= &clk_smd_rpm_bus_1_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK]		= &clk_smd_rpm_bus_1_snoc_a_clk,
+	[RPM_SMD_CNOC_CLK]		= &clk_smd_rpm_bus_2_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK]		= &clk_smd_rpm_bus_2_cnoc_a_clk,
+	[RPM_SMD_MMSSNOC_AHB_CLK]	= &clk_smd_rpm_bus_3_mmssnoc_ahb_clk,
+	[RPM_SMD_MMSSNOC_AHB_A_CLK]	= &clk_smd_rpm_bus_3_mmssnoc_ahb_a_clk,
+	[RPM_SMD_BIMC_CLK]		= &clk_smd_rpm_bimc_clk,
+	[RPM_SMD_GFX3D_CLK_SRC]		= &clk_smd_rpm_gfx3d_clk_src,
+	[RPM_SMD_GFX3D_A_CLK_SRC]	= &clk_smd_rpm_gfx3d_a_clk_src,
+	[RPM_SMD_BIMC_A_CLK]		= &clk_smd_rpm_bimc_a_clk,
+	[RPM_SMD_OCMEMGX_CLK]		= &clk_smd_rpm_ocmemgx_clk,
+	[RPM_SMD_OCMEMGX_A_CLK]		= &clk_smd_rpm_ocmemgx_a_clk,
+	[RPM_SMD_QDSS_CLK]		= &clk_smd_rpm_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK]		= &clk_smd_rpm_qdss_a_clk,
+	[RPM_SMD_CXO_D0]		= &clk_smd_rpm_cxo_d0,
+	[RPM_SMD_CXO_D0_A]		= &clk_smd_rpm_cxo_d0_a,
+	[RPM_SMD_CXO_D1]		= &clk_smd_rpm_cxo_d1,
+	[RPM_SMD_CXO_D1_A]		= &clk_smd_rpm_cxo_d1_a,
+	[RPM_SMD_CXO_A0]		= &clk_smd_rpm_cxo_a0,
+	[RPM_SMD_CXO_A0_A]		= &clk_smd_rpm_cxo_a0_a,
+	[RPM_SMD_CXO_A1]		= &clk_smd_rpm_cxo_a1,
+	[RPM_SMD_CXO_A1_A]		= &clk_smd_rpm_cxo_a1_a,
+	[RPM_SMD_CXO_A2]		= &clk_smd_rpm_cxo_a2,
+	[RPM_SMD_CXO_A2_A]		= &clk_smd_rpm_cxo_a2_a,
+	[RPM_SMD_DIFF_CLK]		= &clk_smd_rpm_diff_clk,
+	[RPM_SMD_DIFF_A_CLK]		= &clk_smd_rpm_diff_clk_a,
+	[RPM_SMD_DIV_CLK1]		= &clk_smd_rpm_div_clk1,
+	[RPM_SMD_DIV_A_CLK1]		= &clk_smd_rpm_div_clk1_a,
+	[RPM_SMD_DIV_CLK2]		= &clk_smd_rpm_div_clk2,
+	[RPM_SMD_DIV_A_CLK2]		= &clk_smd_rpm_div_clk2_a,
+	[RPM_SMD_CXO_D0_PIN]		= &clk_smd_rpm_cxo_d0_pin,
+	[RPM_SMD_CXO_D0_A_PIN]		= &clk_smd_rpm_cxo_d0_a_pin,
+	[RPM_SMD_CXO_D1_PIN]		= &clk_smd_rpm_cxo_d1_pin,
+	[RPM_SMD_CXO_D1_A_PIN]		= &clk_smd_rpm_cxo_d1_a_pin,
+	[RPM_SMD_CXO_A0_PIN]		= &clk_smd_rpm_cxo_a0_pin,
+	[RPM_SMD_CXO_A0_A_PIN]		= &clk_smd_rpm_cxo_a0_a_pin,
+	[RPM_SMD_CXO_A1_PIN]		= &clk_smd_rpm_cxo_a1_pin,
+	[RPM_SMD_CXO_A1_A_PIN]		= &clk_smd_rpm_cxo_a1_a_pin,
+	[RPM_SMD_CXO_A2_PIN]		= &clk_smd_rpm_cxo_a2_pin,
+	[RPM_SMD_CXO_A2_A_PIN]		= &clk_smd_rpm_cxo_a2_a_pin,
 };
 
 static const struct rpm_smd_clk_desc rpm_clk_msm8974 = {
@@ -660,32 +658,32 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8974 = {
 };
 
 static struct clk_smd_rpm *msm8976_clks[] = {
-	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
-	[RPM_SMD_PCNOC_CLK] = &msm8916_bus_0_pcnoc_clk,
-	[RPM_SMD_PCNOC_A_CLK] = &msm8916_bus_0_pcnoc_a_clk,
-	[RPM_SMD_SNOC_CLK] = &msm8916_bus_1_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &msm8916_bus_1_snoc_a_clk,
-	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
-	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
-	[RPM_SMD_SYSMMNOC_CLK]	= &msm8936_bus_2_sysmmnoc_clk,
-	[RPM_SMD_SYSMMNOC_A_CLK] = &msm8936_bus_2_sysmmnoc_a_clk,
-	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK] = &msm8916_qdss_a_clk,
-	[RPM_SMD_BB_CLK1] = &msm8916_bb_clk1,
-	[RPM_SMD_BB_CLK1_A] = &msm8916_bb_clk1_a,
-	[RPM_SMD_BB_CLK2] = &msm8916_bb_clk2,
-	[RPM_SMD_BB_CLK2_A] = &msm8916_bb_clk2_a,
-	[RPM_SMD_RF_CLK2] = &msm8916_rf_clk2,
-	[RPM_SMD_RF_CLK2_A] = &msm8916_rf_clk2_a,
-	[RPM_SMD_BB_CLK1_PIN] = &msm8916_bb_clk1_pin,
-	[RPM_SMD_BB_CLK1_A_PIN] = &msm8916_bb_clk1_a_pin,
-	[RPM_SMD_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
-	[RPM_SMD_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
-	[RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
-	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_clk2_a,
-	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
-	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
+	[RPM_SMD_XO_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo_a,
+	[RPM_SMD_PCNOC_CLK] = &clk_smd_rpm_bus_0_pcnoc_clk,
+	[RPM_SMD_PCNOC_A_CLK] = &clk_smd_rpm_bus_0_pcnoc_a_clk,
+	[RPM_SMD_SNOC_CLK] = &clk_smd_rpm_bus_1_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &clk_smd_rpm_bus_1_snoc_a_clk,
+	[RPM_SMD_BIMC_CLK] = &clk_smd_rpm_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK] = &clk_smd_rpm_bimc_a_clk,
+	[RPM_SMD_SYSMMNOC_CLK]	= &clk_smd_rpm_bus_2_sysmmnoc_clk,
+	[RPM_SMD_SYSMMNOC_A_CLK] = &clk_smd_rpm_bus_2_sysmmnoc_a_clk,
+	[RPM_SMD_QDSS_CLK] = &clk_smd_rpm_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &clk_smd_rpm_qdss_a_clk,
+	[RPM_SMD_BB_CLK1] = &clk_smd_rpm_bb_clk1,
+	[RPM_SMD_BB_CLK1_A] = &clk_smd_rpm_bb_clk1_a,
+	[RPM_SMD_BB_CLK2] = &clk_smd_rpm_bb_clk2,
+	[RPM_SMD_BB_CLK2_A] = &clk_smd_rpm_bb_clk2_a,
+	[RPM_SMD_RF_CLK2] = &clk_smd_rpm_rf_clk2,
+	[RPM_SMD_RF_CLK2_A] = &clk_smd_rpm_rf_clk2_a,
+	[RPM_SMD_BB_CLK1_PIN] = &clk_smd_rpm_bb_clk1_pin,
+	[RPM_SMD_BB_CLK1_A_PIN] = &clk_smd_rpm_bb_clk1_a_pin,
+	[RPM_SMD_BB_CLK2_PIN] = &clk_smd_rpm_bb_clk2_pin,
+	[RPM_SMD_BB_CLK2_A_PIN] = &clk_smd_rpm_bb_clk2_a_pin,
+	[RPM_SMD_DIV_CLK2] = &clk_smd_rpm_div_clk2,
+	[RPM_SMD_DIV_A_CLK2] = &clk_smd_rpm_div_clk2_a,
+	[RPM_SMD_IPA_CLK] = &clk_smd_rpm_ipa_clk,
+	[RPM_SMD_IPA_A_CLK] = &clk_smd_rpm_ipa_a_clk,
 };
 
 static const struct rpm_smd_clk_desc rpm_clk_msm8976 = {
@@ -694,56 +692,56 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8976 = {
 };
 
 static struct clk_smd_rpm *msm8992_clks[] = {
-	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
-	[RPM_SMD_PNOC_CLK] = &msm8916_bus_0_pcnoc_clk,
-	[RPM_SMD_PNOC_A_CLK] = &msm8916_bus_0_pcnoc_a_clk,
-	[RPM_SMD_OCMEMGX_CLK] = &msm8974_ocmemgx_clk,
-	[RPM_SMD_OCMEMGX_A_CLK] = &msm8974_ocmemgx_a_clk,
-	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
-	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
-	[RPM_SMD_CNOC_CLK] = &msm8974_bus_2_cnoc_clk,
-	[RPM_SMD_CNOC_A_CLK] = &msm8974_bus_2_cnoc_a_clk,
-	[RPM_SMD_GFX3D_CLK_SRC] = &msm8974_gfx3d_clk_src,
-	[RPM_SMD_GFX3D_A_CLK_SRC] = &msm8974_gfx3d_a_clk_src,
-	[RPM_SMD_SNOC_CLK] = &msm8916_bus_1_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &msm8916_bus_1_snoc_a_clk,
-	[RPM_SMD_BB_CLK1] = &msm8916_bb_clk1,
-	[RPM_SMD_BB_CLK1_A] = &msm8916_bb_clk1_a,
-	[RPM_SMD_BB_CLK1_PIN] = &msm8916_bb_clk1_pin,
-	[RPM_SMD_BB_CLK1_A_PIN] = &msm8916_bb_clk1_a_pin,
-	[RPM_SMD_BB_CLK2] = &msm8916_bb_clk2,
-	[RPM_SMD_BB_CLK2_A] = &msm8916_bb_clk2_a,
-	[RPM_SMD_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
-	[RPM_SMD_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
-	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
-	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_clk1_a,
-	[RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
-	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_clk2_a,
-	[RPM_SMD_DIV_CLK3] = &msm8992_div_clk3,
-	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
-	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
-	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
-	[RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
-	[RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
-	[RPM_SMD_MMSSNOC_AHB_CLK] = &msm8974_bus_3_mmssnoc_ahb_clk,
-	[RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8974_bus_3_mmssnoc_ahb_a_clk,
-	[RPM_SMD_MSS_CFG_AHB_CLK] = &msm8992_branch_mss_cfg_ahb_clk,
-	[RPM_SMD_MSS_CFG_AHB_A_CLK] = &msm8992_branch_mss_cfg_ahb_a_clk,
-	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK] = &msm8916_qdss_a_clk,
-	[RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
-	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
-	[RPM_SMD_RF_CLK2] = &msm8916_rf_clk2,
-	[RPM_SMD_RF_CLK2_A] = &msm8916_rf_clk2_a,
-	[RPM_SMD_RF_CLK1_PIN] = &msm8916_rf_clk1_pin,
-	[RPM_SMD_RF_CLK1_A_PIN] = &msm8916_rf_clk1_a_pin,
-	[RPM_SMD_RF_CLK2_PIN] = &msm8916_rf_clk2_pin,
-	[RPM_SMD_RF_CLK2_A_PIN] = &msm8916_rf_clk2_a_pin,
-	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
-	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
-	[RPM_SMD_CE2_CLK] = &msm8992_ce2_clk,
-	[RPM_SMD_CE2_A_CLK] = &msm8992_ce2_a_clk,
+	[RPM_SMD_XO_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo_a,
+	[RPM_SMD_PNOC_CLK] = &clk_smd_rpm_bus_0_pcnoc_clk,
+	[RPM_SMD_PNOC_A_CLK] = &clk_smd_rpm_bus_0_pcnoc_a_clk,
+	[RPM_SMD_OCMEMGX_CLK] = &clk_smd_rpm_ocmemgx_clk,
+	[RPM_SMD_OCMEMGX_A_CLK] = &clk_smd_rpm_ocmemgx_a_clk,
+	[RPM_SMD_BIMC_CLK] = &clk_smd_rpm_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK] = &clk_smd_rpm_bimc_a_clk,
+	[RPM_SMD_CNOC_CLK] = &clk_smd_rpm_bus_2_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &clk_smd_rpm_bus_2_cnoc_a_clk,
+	[RPM_SMD_GFX3D_CLK_SRC] = &clk_smd_rpm_gfx3d_clk_src,
+	[RPM_SMD_GFX3D_A_CLK_SRC] = &clk_smd_rpm_gfx3d_a_clk_src,
+	[RPM_SMD_SNOC_CLK] = &clk_smd_rpm_bus_1_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &clk_smd_rpm_bus_1_snoc_a_clk,
+	[RPM_SMD_BB_CLK1] = &clk_smd_rpm_bb_clk1,
+	[RPM_SMD_BB_CLK1_A] = &clk_smd_rpm_bb_clk1_a,
+	[RPM_SMD_BB_CLK1_PIN] = &clk_smd_rpm_bb_clk1_pin,
+	[RPM_SMD_BB_CLK1_A_PIN] = &clk_smd_rpm_bb_clk1_a_pin,
+	[RPM_SMD_BB_CLK2] = &clk_smd_rpm_bb_clk2,
+	[RPM_SMD_BB_CLK2_A] = &clk_smd_rpm_bb_clk2_a,
+	[RPM_SMD_BB_CLK2_PIN] = &clk_smd_rpm_bb_clk2_pin,
+	[RPM_SMD_BB_CLK2_A_PIN] = &clk_smd_rpm_bb_clk2_a_pin,
+	[RPM_SMD_DIV_CLK1] = &clk_smd_rpm_div_clk1,
+	[RPM_SMD_DIV_A_CLK1] = &clk_smd_rpm_div_clk1_a,
+	[RPM_SMD_DIV_CLK2] = &clk_smd_rpm_div_clk2,
+	[RPM_SMD_DIV_A_CLK2] = &clk_smd_rpm_div_clk2_a,
+	[RPM_SMD_DIV_CLK3] = &clk_smd_rpm_div_clk3,
+	[RPM_SMD_DIV_A_CLK3] = &clk_smd_rpm_div_clk3_a,
+	[RPM_SMD_IPA_CLK] = &clk_smd_rpm_ipa_clk,
+	[RPM_SMD_IPA_A_CLK] = &clk_smd_rpm_ipa_a_clk,
+	[RPM_SMD_LN_BB_CLK] = &clk_smd_rpm_ln_bb_clk,
+	[RPM_SMD_LN_BB_A_CLK] = &clk_smd_rpm_ln_bb_clk_a,
+	[RPM_SMD_MMSSNOC_AHB_CLK] = &clk_smd_rpm_bus_3_mmssnoc_ahb_clk,
+	[RPM_SMD_MMSSNOC_AHB_A_CLK] = &clk_smd_rpm_bus_3_mmssnoc_ahb_a_clk,
+	[RPM_SMD_MSS_CFG_AHB_CLK] = &clk_smd_rpm_branch_mss_cfg_ahb_clk,
+	[RPM_SMD_MSS_CFG_AHB_A_CLK] = &clk_smd_rpm_branch_mss_cfg_ahb_a_clk,
+	[RPM_SMD_QDSS_CLK] = &clk_smd_rpm_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &clk_smd_rpm_qdss_a_clk,
+	[RPM_SMD_RF_CLK1] = &clk_smd_rpm_rf_clk1,
+	[RPM_SMD_RF_CLK1_A] = &clk_smd_rpm_rf_clk1_a,
+	[RPM_SMD_RF_CLK2] = &clk_smd_rpm_rf_clk2,
+	[RPM_SMD_RF_CLK2_A] = &clk_smd_rpm_rf_clk2_a,
+	[RPM_SMD_RF_CLK1_PIN] = &clk_smd_rpm_rf_clk1_pin,
+	[RPM_SMD_RF_CLK1_A_PIN] = &clk_smd_rpm_rf_clk1_a_pin,
+	[RPM_SMD_RF_CLK2_PIN] = &clk_smd_rpm_rf_clk2_pin,
+	[RPM_SMD_RF_CLK2_A_PIN] = &clk_smd_rpm_rf_clk2_a_pin,
+	[RPM_SMD_CE1_CLK] = &clk_smd_rpm_ce1_clk,
+	[RPM_SMD_CE1_A_CLK] = &clk_smd_rpm_ce1_a_clk,
+	[RPM_SMD_CE2_CLK] = &clk_smd_rpm_ce2_clk,
+	[RPM_SMD_CE2_A_CLK] = &clk_smd_rpm_ce2_a_clk,
 };
 
 static const struct rpm_smd_clk_desc rpm_clk_msm8992 = {
@@ -752,58 +750,58 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8992 = {
 };
 
 static struct clk_smd_rpm *msm8994_clks[] = {
-	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
-	[RPM_SMD_PNOC_CLK] = &msm8916_bus_0_pcnoc_clk,
-	[RPM_SMD_PNOC_A_CLK] = &msm8916_bus_0_pcnoc_a_clk,
-	[RPM_SMD_OCMEMGX_CLK] = &msm8974_ocmemgx_clk,
-	[RPM_SMD_OCMEMGX_A_CLK] = &msm8974_ocmemgx_a_clk,
-	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
-	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
-	[RPM_SMD_CNOC_CLK] = &msm8974_bus_2_cnoc_clk,
-	[RPM_SMD_CNOC_A_CLK] = &msm8974_bus_2_cnoc_a_clk,
-	[RPM_SMD_GFX3D_CLK_SRC] = &msm8974_gfx3d_clk_src,
-	[RPM_SMD_GFX3D_A_CLK_SRC] = &msm8974_gfx3d_a_clk_src,
-	[RPM_SMD_SNOC_CLK] = &msm8916_bus_1_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &msm8916_bus_1_snoc_a_clk,
-	[RPM_SMD_BB_CLK1] = &msm8916_bb_clk1,
-	[RPM_SMD_BB_CLK1_A] = &msm8916_bb_clk1_a,
-	[RPM_SMD_BB_CLK1_PIN] = &msm8916_bb_clk1_pin,
-	[RPM_SMD_BB_CLK1_A_PIN] = &msm8916_bb_clk1_a_pin,
-	[RPM_SMD_BB_CLK2] = &msm8916_bb_clk2,
-	[RPM_SMD_BB_CLK2_A] = &msm8916_bb_clk2_a,
-	[RPM_SMD_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
-	[RPM_SMD_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
-	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
-	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_clk1_a,
-	[RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
-	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_clk2_a,
-	[RPM_SMD_DIV_CLK3] = &msm8992_div_clk3,
-	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
-	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
-	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
-	[RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
-	[RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
-	[RPM_SMD_MMSSNOC_AHB_CLK] = &msm8974_bus_3_mmssnoc_ahb_clk,
-	[RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8974_bus_3_mmssnoc_ahb_a_clk,
-	[RPM_SMD_MSS_CFG_AHB_CLK] = &msm8992_branch_mss_cfg_ahb_clk,
-	[RPM_SMD_MSS_CFG_AHB_A_CLK] = &msm8992_branch_mss_cfg_ahb_a_clk,
-	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK] = &msm8916_qdss_a_clk,
-	[RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
-	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
-	[RPM_SMD_RF_CLK2] = &msm8916_rf_clk2,
-	[RPM_SMD_RF_CLK2_A] = &msm8916_rf_clk2_a,
-	[RPM_SMD_RF_CLK1_PIN] = &msm8916_rf_clk1_pin,
-	[RPM_SMD_RF_CLK1_A_PIN] = &msm8916_rf_clk1_a_pin,
-	[RPM_SMD_RF_CLK2_PIN] = &msm8916_rf_clk2_pin,
-	[RPM_SMD_RF_CLK2_A_PIN] = &msm8916_rf_clk2_a_pin,
-	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
-	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
-	[RPM_SMD_CE2_CLK] = &msm8992_ce2_clk,
-	[RPM_SMD_CE2_A_CLK] = &msm8992_ce2_a_clk,
-	[RPM_SMD_CE3_CLK] = &msm8994_ce3_clk,
-	[RPM_SMD_CE3_A_CLK] = &msm8994_ce3_a_clk,
+	[RPM_SMD_XO_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo_a,
+	[RPM_SMD_PNOC_CLK] = &clk_smd_rpm_bus_0_pcnoc_clk,
+	[RPM_SMD_PNOC_A_CLK] = &clk_smd_rpm_bus_0_pcnoc_a_clk,
+	[RPM_SMD_OCMEMGX_CLK] = &clk_smd_rpm_ocmemgx_clk,
+	[RPM_SMD_OCMEMGX_A_CLK] = &clk_smd_rpm_ocmemgx_a_clk,
+	[RPM_SMD_BIMC_CLK] = &clk_smd_rpm_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK] = &clk_smd_rpm_bimc_a_clk,
+	[RPM_SMD_CNOC_CLK] = &clk_smd_rpm_bus_2_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &clk_smd_rpm_bus_2_cnoc_a_clk,
+	[RPM_SMD_GFX3D_CLK_SRC] = &clk_smd_rpm_gfx3d_clk_src,
+	[RPM_SMD_GFX3D_A_CLK_SRC] = &clk_smd_rpm_gfx3d_a_clk_src,
+	[RPM_SMD_SNOC_CLK] = &clk_smd_rpm_bus_1_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &clk_smd_rpm_bus_1_snoc_a_clk,
+	[RPM_SMD_BB_CLK1] = &clk_smd_rpm_bb_clk1,
+	[RPM_SMD_BB_CLK1_A] = &clk_smd_rpm_bb_clk1_a,
+	[RPM_SMD_BB_CLK1_PIN] = &clk_smd_rpm_bb_clk1_pin,
+	[RPM_SMD_BB_CLK1_A_PIN] = &clk_smd_rpm_bb_clk1_a_pin,
+	[RPM_SMD_BB_CLK2] = &clk_smd_rpm_bb_clk2,
+	[RPM_SMD_BB_CLK2_A] = &clk_smd_rpm_bb_clk2_a,
+	[RPM_SMD_BB_CLK2_PIN] = &clk_smd_rpm_bb_clk2_pin,
+	[RPM_SMD_BB_CLK2_A_PIN] = &clk_smd_rpm_bb_clk2_a_pin,
+	[RPM_SMD_DIV_CLK1] = &clk_smd_rpm_div_clk1,
+	[RPM_SMD_DIV_A_CLK1] = &clk_smd_rpm_div_clk1_a,
+	[RPM_SMD_DIV_CLK2] = &clk_smd_rpm_div_clk2,
+	[RPM_SMD_DIV_A_CLK2] = &clk_smd_rpm_div_clk2_a,
+	[RPM_SMD_DIV_CLK3] = &clk_smd_rpm_div_clk3,
+	[RPM_SMD_DIV_A_CLK3] = &clk_smd_rpm_div_clk3_a,
+	[RPM_SMD_IPA_CLK] = &clk_smd_rpm_ipa_clk,
+	[RPM_SMD_IPA_A_CLK] = &clk_smd_rpm_ipa_a_clk,
+	[RPM_SMD_LN_BB_CLK] = &clk_smd_rpm_ln_bb_clk,
+	[RPM_SMD_LN_BB_A_CLK] = &clk_smd_rpm_ln_bb_clk_a,
+	[RPM_SMD_MMSSNOC_AHB_CLK] = &clk_smd_rpm_bus_3_mmssnoc_ahb_clk,
+	[RPM_SMD_MMSSNOC_AHB_A_CLK] = &clk_smd_rpm_bus_3_mmssnoc_ahb_a_clk,
+	[RPM_SMD_MSS_CFG_AHB_CLK] = &clk_smd_rpm_branch_mss_cfg_ahb_clk,
+	[RPM_SMD_MSS_CFG_AHB_A_CLK] = &clk_smd_rpm_branch_mss_cfg_ahb_a_clk,
+	[RPM_SMD_QDSS_CLK] = &clk_smd_rpm_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &clk_smd_rpm_qdss_a_clk,
+	[RPM_SMD_RF_CLK1] = &clk_smd_rpm_rf_clk1,
+	[RPM_SMD_RF_CLK1_A] = &clk_smd_rpm_rf_clk1_a,
+	[RPM_SMD_RF_CLK2] = &clk_smd_rpm_rf_clk2,
+	[RPM_SMD_RF_CLK2_A] = &clk_smd_rpm_rf_clk2_a,
+	[RPM_SMD_RF_CLK1_PIN] = &clk_smd_rpm_rf_clk1_pin,
+	[RPM_SMD_RF_CLK1_A_PIN] = &clk_smd_rpm_rf_clk1_a_pin,
+	[RPM_SMD_RF_CLK2_PIN] = &clk_smd_rpm_rf_clk2_pin,
+	[RPM_SMD_RF_CLK2_A_PIN] = &clk_smd_rpm_rf_clk2_a_pin,
+	[RPM_SMD_CE1_CLK] = &clk_smd_rpm_ce1_clk,
+	[RPM_SMD_CE1_A_CLK] = &clk_smd_rpm_ce1_a_clk,
+	[RPM_SMD_CE2_CLK] = &clk_smd_rpm_ce2_clk,
+	[RPM_SMD_CE2_A_CLK] = &clk_smd_rpm_ce2_a_clk,
+	[RPM_SMD_CE3_CLK] = &clk_smd_rpm_ce3_clk,
+	[RPM_SMD_CE3_A_CLK] = &clk_smd_rpm_ce3_a_clk,
 };
 
 static const struct rpm_smd_clk_desc rpm_clk_msm8994 = {
@@ -812,50 +810,50 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8994 = {
 };
 
 static struct clk_smd_rpm *msm8996_clks[] = {
-	[RPM_SMD_PCNOC_CLK] = &msm8916_bus_0_pcnoc_clk,
-	[RPM_SMD_PCNOC_A_CLK] = &msm8916_bus_0_pcnoc_a_clk,
-	[RPM_SMD_SNOC_CLK] = &msm8916_bus_1_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &msm8916_bus_1_snoc_a_clk,
-	[RPM_SMD_CNOC_CLK] = &msm8974_bus_2_cnoc_clk,
-	[RPM_SMD_CNOC_A_CLK] = &msm8974_bus_2_cnoc_a_clk,
-	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
-	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
-	[RPM_SMD_MMAXI_CLK] = &msm8996_mmssnoc_axi_rpm_clk,
-	[RPM_SMD_MMAXI_A_CLK] = &msm8996_mmssnoc_axi_rpm_a_clk,
-	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
-	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
-	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
-	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
-	[RPM_SMD_AGGR1_NOC_CLK] = &msm8996_branch_aggre1_noc_clk,
-	[RPM_SMD_AGGR1_NOC_A_CLK] = &msm8996_branch_aggre1_noc_a_clk,
-	[RPM_SMD_AGGR2_NOC_CLK] = &msm8996_branch_aggre2_noc_clk,
-	[RPM_SMD_AGGR2_NOC_A_CLK] = &msm8996_branch_aggre2_noc_a_clk,
-	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK] = &msm8916_qdss_a_clk,
-	[RPM_SMD_BB_CLK1] = &msm8916_bb_clk1,
-	[RPM_SMD_BB_CLK1_A] = &msm8916_bb_clk1_a,
-	[RPM_SMD_BB_CLK2] = &msm8916_bb_clk2,
-	[RPM_SMD_BB_CLK2_A] = &msm8916_bb_clk2_a,
-	[RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
-	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
-	[RPM_SMD_RF_CLK2] = &msm8916_rf_clk2,
-	[RPM_SMD_RF_CLK2_A] = &msm8916_rf_clk2_a,
-	[RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
-	[RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
-	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
-	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_clk1_a,
-	[RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
-	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_clk2_a,
-	[RPM_SMD_DIV_CLK3] = &msm8992_div_clk3,
-	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
-	[RPM_SMD_BB_CLK1_PIN] = &msm8916_bb_clk1_pin,
-	[RPM_SMD_BB_CLK1_A_PIN] = &msm8916_bb_clk1_a_pin,
-	[RPM_SMD_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
-	[RPM_SMD_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
-	[RPM_SMD_RF_CLK1_PIN] = &msm8916_rf_clk1_pin,
-	[RPM_SMD_RF_CLK1_A_PIN] = &msm8916_rf_clk1_a_pin,
-	[RPM_SMD_RF_CLK2_PIN] = &msm8916_rf_clk2_pin,
-	[RPM_SMD_RF_CLK2_A_PIN] = &msm8916_rf_clk2_a_pin,
+	[RPM_SMD_PCNOC_CLK] = &clk_smd_rpm_bus_0_pcnoc_clk,
+	[RPM_SMD_PCNOC_A_CLK] = &clk_smd_rpm_bus_0_pcnoc_a_clk,
+	[RPM_SMD_SNOC_CLK] = &clk_smd_rpm_bus_1_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &clk_smd_rpm_bus_1_snoc_a_clk,
+	[RPM_SMD_CNOC_CLK] = &clk_smd_rpm_bus_2_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &clk_smd_rpm_bus_2_cnoc_a_clk,
+	[RPM_SMD_BIMC_CLK] = &clk_smd_rpm_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK] = &clk_smd_rpm_bimc_a_clk,
+	[RPM_SMD_MMAXI_CLK] = &clk_smd_rpm_mmssnoc_axi_rpm_clk,
+	[RPM_SMD_MMAXI_A_CLK] = &clk_smd_rpm_mmssnoc_axi_rpm_a_clk,
+	[RPM_SMD_IPA_CLK] = &clk_smd_rpm_ipa_clk,
+	[RPM_SMD_IPA_A_CLK] = &clk_smd_rpm_ipa_a_clk,
+	[RPM_SMD_CE1_CLK] = &clk_smd_rpm_ce1_clk,
+	[RPM_SMD_CE1_A_CLK] = &clk_smd_rpm_ce1_a_clk,
+	[RPM_SMD_AGGR1_NOC_CLK] = &clk_smd_rpm_branch_aggre1_noc_clk,
+	[RPM_SMD_AGGR1_NOC_A_CLK] = &clk_smd_rpm_branch_aggre1_noc_a_clk,
+	[RPM_SMD_AGGR2_NOC_CLK] = &clk_smd_rpm_branch_aggre2_noc_clk,
+	[RPM_SMD_AGGR2_NOC_A_CLK] = &clk_smd_rpm_branch_aggre2_noc_a_clk,
+	[RPM_SMD_QDSS_CLK] = &clk_smd_rpm_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &clk_smd_rpm_qdss_a_clk,
+	[RPM_SMD_BB_CLK1] = &clk_smd_rpm_bb_clk1,
+	[RPM_SMD_BB_CLK1_A] = &clk_smd_rpm_bb_clk1_a,
+	[RPM_SMD_BB_CLK2] = &clk_smd_rpm_bb_clk2,
+	[RPM_SMD_BB_CLK2_A] = &clk_smd_rpm_bb_clk2_a,
+	[RPM_SMD_RF_CLK1] = &clk_smd_rpm_rf_clk1,
+	[RPM_SMD_RF_CLK1_A] = &clk_smd_rpm_rf_clk1_a,
+	[RPM_SMD_RF_CLK2] = &clk_smd_rpm_rf_clk2,
+	[RPM_SMD_RF_CLK2_A] = &clk_smd_rpm_rf_clk2_a,
+	[RPM_SMD_LN_BB_CLK] = &clk_smd_rpm_ln_bb_clk,
+	[RPM_SMD_LN_BB_A_CLK] = &clk_smd_rpm_ln_bb_clk_a,
+	[RPM_SMD_DIV_CLK1] = &clk_smd_rpm_div_clk1,
+	[RPM_SMD_DIV_A_CLK1] = &clk_smd_rpm_div_clk1_a,
+	[RPM_SMD_DIV_CLK2] = &clk_smd_rpm_div_clk2,
+	[RPM_SMD_DIV_A_CLK2] = &clk_smd_rpm_div_clk2_a,
+	[RPM_SMD_DIV_CLK3] = &clk_smd_rpm_div_clk3,
+	[RPM_SMD_DIV_A_CLK3] = &clk_smd_rpm_div_clk3_a,
+	[RPM_SMD_BB_CLK1_PIN] = &clk_smd_rpm_bb_clk1_pin,
+	[RPM_SMD_BB_CLK1_A_PIN] = &clk_smd_rpm_bb_clk1_a_pin,
+	[RPM_SMD_BB_CLK2_PIN] = &clk_smd_rpm_bb_clk2_pin,
+	[RPM_SMD_BB_CLK2_A_PIN] = &clk_smd_rpm_bb_clk2_a_pin,
+	[RPM_SMD_RF_CLK1_PIN] = &clk_smd_rpm_rf_clk1_pin,
+	[RPM_SMD_RF_CLK1_A_PIN] = &clk_smd_rpm_rf_clk1_a_pin,
+	[RPM_SMD_RF_CLK2_PIN] = &clk_smd_rpm_rf_clk2_pin,
+	[RPM_SMD_RF_CLK2_A_PIN] = &clk_smd_rpm_rf_clk2_a_pin,
 };
 
 static const struct rpm_smd_clk_desc rpm_clk_msm8996 = {
@@ -864,26 +862,26 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8996 = {
 };
 
 static struct clk_smd_rpm *qcs404_clks[] = {
-	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK] = &msm8916_qdss_a_clk,
-	[RPM_SMD_PNOC_CLK] = &msm8916_bus_0_pcnoc_clk,
-	[RPM_SMD_PNOC_A_CLK] = &msm8916_bus_0_pcnoc_a_clk,
-	[RPM_SMD_SNOC_CLK] = &msm8916_bus_1_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &msm8916_bus_1_snoc_a_clk,
-	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
-	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
-	[RPM_SMD_BIMC_GPU_CLK] = &qcs404_bimc_gpu_clk,
-	[RPM_SMD_BIMC_GPU_A_CLK] = &qcs404_bimc_gpu_a_clk,
-	[RPM_SMD_QPIC_CLK] = &qcs404_qpic_clk,
-	[RPM_SMD_QPIC_CLK_A] = &qcs404_qpic_a_clk,
-	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
-	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
-	[RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
-	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
-	[RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
-	[RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
-	[RPM_SMD_LN_BB_CLK_PIN] = &qcs404_ln_bb_clk_pin,
-	[RPM_SMD_LN_BB_A_CLK_PIN] = &qcs404_ln_bb_clk_a_pin,
+	[RPM_SMD_QDSS_CLK] = &clk_smd_rpm_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &clk_smd_rpm_qdss_a_clk,
+	[RPM_SMD_PNOC_CLK] = &clk_smd_rpm_bus_0_pcnoc_clk,
+	[RPM_SMD_PNOC_A_CLK] = &clk_smd_rpm_bus_0_pcnoc_a_clk,
+	[RPM_SMD_SNOC_CLK] = &clk_smd_rpm_bus_1_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &clk_smd_rpm_bus_1_snoc_a_clk,
+	[RPM_SMD_BIMC_CLK] = &clk_smd_rpm_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK] = &clk_smd_rpm_bimc_a_clk,
+	[RPM_SMD_BIMC_GPU_CLK] = &clk_smd_rpm_bimc_gpu_clk,
+	[RPM_SMD_BIMC_GPU_A_CLK] = &clk_smd_rpm_bimc_gpu_a_clk,
+	[RPM_SMD_QPIC_CLK] = &clk_smd_rpm_qpic_clk,
+	[RPM_SMD_QPIC_CLK_A] = &clk_smd_rpm_qpic_a_clk,
+	[RPM_SMD_CE1_CLK] = &clk_smd_rpm_ce1_clk,
+	[RPM_SMD_CE1_A_CLK] = &clk_smd_rpm_ce1_a_clk,
+	[RPM_SMD_RF_CLK1] = &clk_smd_rpm_rf_clk1,
+	[RPM_SMD_RF_CLK1_A] = &clk_smd_rpm_rf_clk1_a,
+	[RPM_SMD_LN_BB_CLK] = &clk_smd_rpm_ln_bb_clk,
+	[RPM_SMD_LN_BB_A_CLK] = &clk_smd_rpm_ln_bb_clk_a,
+	[RPM_SMD_LN_BB_CLK_PIN] = &clk_smd_rpm_ln_bb_clk_pin,
+	[RPM_SMD_LN_BB_A_CLK_PIN] = &clk_smd_rpm_ln_bb_clk_a_pin,
 };
 
 static const struct rpm_smd_clk_desc rpm_clk_qcs404 = {
@@ -892,58 +890,58 @@ static const struct rpm_smd_clk_desc rpm_clk_qcs404 = {
 };
 
 static struct clk_smd_rpm *msm8998_clks[] = {
-	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
-	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
-	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
-	[RPM_SMD_PCNOC_CLK] = &msm8916_bus_0_pcnoc_clk,
-	[RPM_SMD_PCNOC_A_CLK] = &msm8916_bus_0_pcnoc_a_clk,
-	[RPM_SMD_SNOC_CLK] = &msm8916_bus_1_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &msm8916_bus_1_snoc_a_clk,
-	[RPM_SMD_CNOC_CLK] = &msm8974_bus_2_cnoc_clk,
-	[RPM_SMD_CNOC_A_CLK] = &msm8974_bus_2_cnoc_a_clk,
-	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
-	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
-	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
-	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_clk1_a,
-	[RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
-	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_clk2_a,
-	[RPM_SMD_DIV_CLK3] = &msm8992_div_clk3,
-	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
-	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
-	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
-	[RPM_SMD_LN_BB_CLK1] = &msm8998_ln_bb_clk1,
-	[RPM_SMD_LN_BB_CLK1_A] = &msm8998_ln_bb_clk1_a,
-	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
-	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
-	[RPM_SMD_LN_BB_CLK3] = &msm8998_ln_bb_clk3,
-	[RPM_SMD_LN_BB_CLK3_A] = &msm8998_ln_bb_clk3_a,
-	[RPM_SMD_LN_BB_CLK1_PIN] = &msm8998_ln_bb_clk1_pin,
-	[RPM_SMD_LN_BB_CLK1_A_PIN] = &msm8998_ln_bb_clk1_a_pin,
-	[RPM_SMD_LN_BB_CLK2_PIN] = &msm8998_ln_bb_clk2_pin,
-	[RPM_SMD_LN_BB_CLK2_A_PIN] = &msm8998_ln_bb_clk2_a_pin,
-	[RPM_SMD_LN_BB_CLK3_PIN] = &msm8998_ln_bb_clk3_pin,
-	[RPM_SMD_LN_BB_CLK3_A_PIN] = &msm8998_ln_bb_clk3_a_pin,
-	[RPM_SMD_MMAXI_CLK] = &msm8996_mmssnoc_axi_rpm_clk,
-	[RPM_SMD_MMAXI_A_CLK] = &msm8996_mmssnoc_axi_rpm_a_clk,
-	[RPM_SMD_AGGR1_NOC_CLK] = &msm8998_aggre1_noc_clk,
-	[RPM_SMD_AGGR1_NOC_A_CLK] = &msm8998_aggre1_noc_a_clk,
-	[RPM_SMD_AGGR2_NOC_CLK] = &msm8998_aggre2_noc_clk,
-	[RPM_SMD_AGGR2_NOC_A_CLK] = &msm8998_aggre2_noc_a_clk,
-	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK] = &msm8916_qdss_a_clk,
-	[RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
-	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
-	[RPM_SMD_RF_CLK2] = &msm8916_rf_clk2,
-	[RPM_SMD_RF_CLK2_A] = &msm8916_rf_clk2_a,
-	[RPM_SMD_RF_CLK3] = &msm8998_rf_clk3,
-	[RPM_SMD_RF_CLK3_A] = &msm8998_rf_clk3_a,
-	[RPM_SMD_RF_CLK1_PIN] = &msm8916_rf_clk1_pin,
-	[RPM_SMD_RF_CLK1_A_PIN] = &msm8916_rf_clk1_a_pin,
-	[RPM_SMD_RF_CLK2_PIN] = &msm8916_rf_clk2_pin,
-	[RPM_SMD_RF_CLK2_A_PIN] = &msm8916_rf_clk2_a_pin,
-	[RPM_SMD_RF_CLK3_PIN] = &msm8998_rf_clk3_pin,
-	[RPM_SMD_RF_CLK3_A_PIN] = &msm8998_rf_clk3_a_pin,
+	[RPM_SMD_XO_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo_a,
+	[RPM_SMD_BIMC_CLK] = &clk_smd_rpm_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK] = &clk_smd_rpm_bimc_a_clk,
+	[RPM_SMD_PCNOC_CLK] = &clk_smd_rpm_bus_0_pcnoc_clk,
+	[RPM_SMD_PCNOC_A_CLK] = &clk_smd_rpm_bus_0_pcnoc_a_clk,
+	[RPM_SMD_SNOC_CLK] = &clk_smd_rpm_bus_1_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &clk_smd_rpm_bus_1_snoc_a_clk,
+	[RPM_SMD_CNOC_CLK] = &clk_smd_rpm_bus_2_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &clk_smd_rpm_bus_2_cnoc_a_clk,
+	[RPM_SMD_CE1_CLK] = &clk_smd_rpm_ce1_clk,
+	[RPM_SMD_CE1_A_CLK] = &clk_smd_rpm_ce1_a_clk,
+	[RPM_SMD_DIV_CLK1] = &clk_smd_rpm_div_clk1,
+	[RPM_SMD_DIV_A_CLK1] = &clk_smd_rpm_div_clk1_a,
+	[RPM_SMD_DIV_CLK2] = &clk_smd_rpm_div_clk2,
+	[RPM_SMD_DIV_A_CLK2] = &clk_smd_rpm_div_clk2_a,
+	[RPM_SMD_DIV_CLK3] = &clk_smd_rpm_div_clk3,
+	[RPM_SMD_DIV_A_CLK3] = &clk_smd_rpm_div_clk3_a,
+	[RPM_SMD_IPA_CLK] = &clk_smd_rpm_ipa_clk,
+	[RPM_SMD_IPA_A_CLK] = &clk_smd_rpm_ipa_a_clk,
+	[RPM_SMD_LN_BB_CLK1] = &clk_smd_rpm_ln_bb_clk1,
+	[RPM_SMD_LN_BB_CLK1_A] = &clk_smd_rpm_ln_bb_clk1_a,
+	[RPM_SMD_LN_BB_CLK2] = &clk_smd_rpm_ln_bb_clk2,
+	[RPM_SMD_LN_BB_CLK2_A] = &clk_smd_rpm_ln_bb_clk2_a,
+	[RPM_SMD_LN_BB_CLK3] = &clk_smd_rpm_ln_bb_clk3,
+	[RPM_SMD_LN_BB_CLK3_A] = &clk_smd_rpm_ln_bb_clk3_a,
+	[RPM_SMD_LN_BB_CLK1_PIN] = &clk_smd_rpm_ln_bb_clk1_pin,
+	[RPM_SMD_LN_BB_CLK1_A_PIN] = &clk_smd_rpm_ln_bb_clk1_a_pin,
+	[RPM_SMD_LN_BB_CLK2_PIN] = &clk_smd_rpm_ln_bb_clk2_pin,
+	[RPM_SMD_LN_BB_CLK2_A_PIN] = &clk_smd_rpm_ln_bb_clk2_a_pin,
+	[RPM_SMD_LN_BB_CLK3_PIN] = &clk_smd_rpm_ln_bb_clk3_pin,
+	[RPM_SMD_LN_BB_CLK3_A_PIN] = &clk_smd_rpm_ln_bb_clk3_a_pin,
+	[RPM_SMD_MMAXI_CLK] = &clk_smd_rpm_mmssnoc_axi_rpm_clk,
+	[RPM_SMD_MMAXI_A_CLK] = &clk_smd_rpm_mmssnoc_axi_rpm_a_clk,
+	[RPM_SMD_AGGR1_NOC_CLK] = &clk_smd_rpm_aggre1_noc_clk,
+	[RPM_SMD_AGGR1_NOC_A_CLK] = &clk_smd_rpm_aggre1_noc_a_clk,
+	[RPM_SMD_AGGR2_NOC_CLK] = &clk_smd_rpm_aggre2_noc_clk,
+	[RPM_SMD_AGGR2_NOC_A_CLK] = &clk_smd_rpm_aggre2_noc_a_clk,
+	[RPM_SMD_QDSS_CLK] = &clk_smd_rpm_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &clk_smd_rpm_qdss_a_clk,
+	[RPM_SMD_RF_CLK1] = &clk_smd_rpm_rf_clk1,
+	[RPM_SMD_RF_CLK1_A] = &clk_smd_rpm_rf_clk1_a,
+	[RPM_SMD_RF_CLK2] = &clk_smd_rpm_rf_clk2,
+	[RPM_SMD_RF_CLK2_A] = &clk_smd_rpm_rf_clk2_a,
+	[RPM_SMD_RF_CLK3] = &clk_smd_rpm_rf_clk3,
+	[RPM_SMD_RF_CLK3_A] = &clk_smd_rpm_rf_clk3_a,
+	[RPM_SMD_RF_CLK1_PIN] = &clk_smd_rpm_rf_clk1_pin,
+	[RPM_SMD_RF_CLK1_A_PIN] = &clk_smd_rpm_rf_clk1_a_pin,
+	[RPM_SMD_RF_CLK2_PIN] = &clk_smd_rpm_rf_clk2_pin,
+	[RPM_SMD_RF_CLK2_A_PIN] = &clk_smd_rpm_rf_clk2_a_pin,
+	[RPM_SMD_RF_CLK3_PIN] = &clk_smd_rpm_rf_clk3_pin,
+	[RPM_SMD_RF_CLK3_A_PIN] = &clk_smd_rpm_rf_clk3_a_pin,
 };
 
 static const struct rpm_smd_clk_desc rpm_clk_msm8998 = {
@@ -952,44 +950,44 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8998 = {
 };
 
 static struct clk_smd_rpm *sdm660_clks[] = {
-	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
-	[RPM_SMD_SNOC_CLK] = &msm8916_bus_1_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &msm8916_bus_1_snoc_a_clk,
-	[RPM_SMD_CNOC_CLK] = &msm8974_bus_2_cnoc_clk,
-	[RPM_SMD_CNOC_A_CLK] = &msm8974_bus_2_cnoc_a_clk,
-	[RPM_SMD_CNOC_PERIPH_CLK] = &msm8916_bus_0_pcnoc_clk,
-	[RPM_SMD_CNOC_PERIPH_A_CLK] = &msm8916_bus_0_pcnoc_a_clk,
-	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
-	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
-	[RPM_SMD_MMSSNOC_AXI_CLK] = &msm8996_mmssnoc_axi_rpm_clk,
-	[RPM_SMD_MMSSNOC_AXI_CLK_A] = &msm8996_mmssnoc_axi_rpm_a_clk,
-	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
-	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
-	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
-	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
-	[RPM_SMD_AGGR2_NOC_CLK] = &msm8998_aggre2_noc_clk,
-	[RPM_SMD_AGGR2_NOC_A_CLK] = &msm8998_aggre2_noc_a_clk,
-	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK] = &msm8916_qdss_a_clk,
-	[RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
-	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
-	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
-	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_clk1_a,
-	[RPM_SMD_LN_BB_CLK] = &msm8998_ln_bb_clk1,
-	[RPM_SMD_LN_BB_A_CLK] = &msm8998_ln_bb_clk1_a,
-	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
-	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
-	[RPM_SMD_LN_BB_CLK3] = &msm8998_ln_bb_clk3,
-	[RPM_SMD_LN_BB_CLK3_A] = &msm8998_ln_bb_clk3_a,
-	[RPM_SMD_RF_CLK1_PIN] = &msm8916_rf_clk1_pin,
-	[RPM_SMD_RF_CLK1_A_PIN] = &msm8916_rf_clk1_a_pin,
-	[RPM_SMD_LN_BB_CLK1_PIN] = &msm8998_ln_bb_clk1_pin,
-	[RPM_SMD_LN_BB_CLK1_A_PIN] = &msm8998_ln_bb_clk1_a_pin,
-	[RPM_SMD_LN_BB_CLK2_PIN] = &msm8998_ln_bb_clk2_pin,
-	[RPM_SMD_LN_BB_CLK2_A_PIN] = &msm8998_ln_bb_clk2_a_pin,
-	[RPM_SMD_LN_BB_CLK3_PIN] = &msm8998_ln_bb_clk3_pin,
-	[RPM_SMD_LN_BB_CLK3_A_PIN] = &msm8998_ln_bb_clk3_a_pin,
+	[RPM_SMD_XO_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo_a,
+	[RPM_SMD_SNOC_CLK] = &clk_smd_rpm_bus_1_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &clk_smd_rpm_bus_1_snoc_a_clk,
+	[RPM_SMD_CNOC_CLK] = &clk_smd_rpm_bus_2_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &clk_smd_rpm_bus_2_cnoc_a_clk,
+	[RPM_SMD_CNOC_PERIPH_CLK] = &clk_smd_rpm_bus_0_pcnoc_clk,
+	[RPM_SMD_CNOC_PERIPH_A_CLK] = &clk_smd_rpm_bus_0_pcnoc_a_clk,
+	[RPM_SMD_BIMC_CLK] = &clk_smd_rpm_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK] = &clk_smd_rpm_bimc_a_clk,
+	[RPM_SMD_MMSSNOC_AXI_CLK] = &clk_smd_rpm_mmssnoc_axi_rpm_clk,
+	[RPM_SMD_MMSSNOC_AXI_CLK_A] = &clk_smd_rpm_mmssnoc_axi_rpm_a_clk,
+	[RPM_SMD_IPA_CLK] = &clk_smd_rpm_ipa_clk,
+	[RPM_SMD_IPA_A_CLK] = &clk_smd_rpm_ipa_a_clk,
+	[RPM_SMD_CE1_CLK] = &clk_smd_rpm_ce1_clk,
+	[RPM_SMD_CE1_A_CLK] = &clk_smd_rpm_ce1_a_clk,
+	[RPM_SMD_AGGR2_NOC_CLK] = &clk_smd_rpm_aggre2_noc_clk,
+	[RPM_SMD_AGGR2_NOC_A_CLK] = &clk_smd_rpm_aggre2_noc_a_clk,
+	[RPM_SMD_QDSS_CLK] = &clk_smd_rpm_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &clk_smd_rpm_qdss_a_clk,
+	[RPM_SMD_RF_CLK1] = &clk_smd_rpm_rf_clk1,
+	[RPM_SMD_RF_CLK1_A] = &clk_smd_rpm_rf_clk1_a,
+	[RPM_SMD_DIV_CLK1] = &clk_smd_rpm_div_clk1,
+	[RPM_SMD_DIV_A_CLK1] = &clk_smd_rpm_div_clk1_a,
+	[RPM_SMD_LN_BB_CLK] = &clk_smd_rpm_ln_bb_clk1,
+	[RPM_SMD_LN_BB_A_CLK] = &clk_smd_rpm_ln_bb_clk1_a,
+	[RPM_SMD_LN_BB_CLK2] = &clk_smd_rpm_ln_bb_clk2,
+	[RPM_SMD_LN_BB_CLK2_A] = &clk_smd_rpm_ln_bb_clk2_a,
+	[RPM_SMD_LN_BB_CLK3] = &clk_smd_rpm_ln_bb_clk3,
+	[RPM_SMD_LN_BB_CLK3_A] = &clk_smd_rpm_ln_bb_clk3_a,
+	[RPM_SMD_RF_CLK1_PIN] = &clk_smd_rpm_rf_clk1_pin,
+	[RPM_SMD_RF_CLK1_A_PIN] = &clk_smd_rpm_rf_clk1_a_pin,
+	[RPM_SMD_LN_BB_CLK1_PIN] = &clk_smd_rpm_ln_bb_clk1_pin,
+	[RPM_SMD_LN_BB_CLK1_A_PIN] = &clk_smd_rpm_ln_bb_clk1_a_pin,
+	[RPM_SMD_LN_BB_CLK2_PIN] = &clk_smd_rpm_ln_bb_clk2_pin,
+	[RPM_SMD_LN_BB_CLK2_A_PIN] = &clk_smd_rpm_ln_bb_clk2_a_pin,
+	[RPM_SMD_LN_BB_CLK3_PIN] = &clk_smd_rpm_ln_bb_clk3_pin,
+	[RPM_SMD_LN_BB_CLK3_A_PIN] = &clk_smd_rpm_ln_bb_clk3_a_pin,
 };
 
 static const struct rpm_smd_clk_desc rpm_clk_sdm660 = {
@@ -998,20 +996,20 @@ static const struct rpm_smd_clk_desc rpm_clk_sdm660 = {
 };
 
 static struct clk_smd_rpm *mdm9607_clks[] = {
-	[RPM_SMD_XO_CLK_SRC]		= &sdm660_branch_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC]		= &sdm660_branch_bi_tcxo_a,
-	[RPM_SMD_PCNOC_CLK]		= &msm8916_bus_0_pcnoc_clk,
-	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_bus_0_pcnoc_a_clk,
-	[RPM_SMD_BIMC_CLK]		= &msm8916_bimc_clk,
-	[RPM_SMD_BIMC_A_CLK]		= &msm8916_bimc_a_clk,
-	[RPM_SMD_QPIC_CLK]		= &qcs404_qpic_clk,
-	[RPM_SMD_QPIC_CLK_A]		= &qcs404_qpic_a_clk,
-	[RPM_SMD_QDSS_CLK]		= &msm8916_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK]		= &msm8916_qdss_a_clk,
-	[RPM_SMD_BB_CLK1]		= &msm8916_bb_clk1,
-	[RPM_SMD_BB_CLK1_A]		= &msm8916_bb_clk1_a,
-	[RPM_SMD_BB_CLK1_PIN]		= &msm8916_bb_clk1_pin,
-	[RPM_SMD_BB_CLK1_A_PIN]		= &msm8916_bb_clk1_a_pin,
+	[RPM_SMD_XO_CLK_SRC]		= &clk_smd_rpm_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC]		= &clk_smd_rpm_branch_bi_tcxo_a,
+	[RPM_SMD_PCNOC_CLK]		= &clk_smd_rpm_bus_0_pcnoc_clk,
+	[RPM_SMD_PCNOC_A_CLK]		= &clk_smd_rpm_bus_0_pcnoc_a_clk,
+	[RPM_SMD_BIMC_CLK]		= &clk_smd_rpm_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK]		= &clk_smd_rpm_bimc_a_clk,
+	[RPM_SMD_QPIC_CLK]		= &clk_smd_rpm_qpic_clk,
+	[RPM_SMD_QPIC_CLK_A]		= &clk_smd_rpm_qpic_a_clk,
+	[RPM_SMD_QDSS_CLK]		= &clk_smd_rpm_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK]		= &clk_smd_rpm_qdss_a_clk,
+	[RPM_SMD_BB_CLK1]		= &clk_smd_rpm_bb_clk1,
+	[RPM_SMD_BB_CLK1_A]		= &clk_smd_rpm_bb_clk1_a,
+	[RPM_SMD_BB_CLK1_PIN]		= &clk_smd_rpm_bb_clk1_pin,
+	[RPM_SMD_BB_CLK1_A_PIN]		= &clk_smd_rpm_bb_clk1_a_pin,
 };
 
 static const struct rpm_smd_clk_desc rpm_clk_mdm9607 = {
@@ -1020,34 +1018,34 @@ static const struct rpm_smd_clk_desc rpm_clk_mdm9607 = {
 };
 
 static struct clk_smd_rpm *msm8953_clks[] = {
-	[RPM_SMD_XO_CLK_SRC]		= &sdm660_branch_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC]		= &sdm660_branch_bi_tcxo_a,
-	[RPM_SMD_PCNOC_CLK]		= &msm8916_bus_0_pcnoc_clk,
-	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_bus_0_pcnoc_a_clk,
-	[RPM_SMD_SNOC_CLK]		= &msm8916_bus_1_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK]		= &msm8916_bus_1_snoc_a_clk,
-	[RPM_SMD_BIMC_CLK]		= &msm8916_bimc_clk,
-	[RPM_SMD_BIMC_A_CLK]		= &msm8916_bimc_a_clk,
-	[RPM_SMD_IPA_CLK]		= &msm8976_ipa_clk,
-	[RPM_SMD_IPA_A_CLK]		= &msm8976_ipa_a_clk,
-	[RPM_SMD_SYSMMNOC_CLK]		= &msm8936_bus_2_sysmmnoc_clk,
-	[RPM_SMD_SYSMMNOC_A_CLK]	= &msm8936_bus_2_sysmmnoc_a_clk,
-	[RPM_SMD_QDSS_CLK]		= &msm8916_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK]		= &msm8916_qdss_a_clk,
-	[RPM_SMD_BB_CLK1]		= &msm8916_bb_clk1,
-	[RPM_SMD_BB_CLK1_A]		= &msm8916_bb_clk1_a,
-	[RPM_SMD_BB_CLK2]		= &msm8916_bb_clk2,
-	[RPM_SMD_BB_CLK2_A]		= &msm8916_bb_clk2_a,
-	[RPM_SMD_RF_CLK2]		= &msm8916_rf_clk2,
-	[RPM_SMD_RF_CLK2_A]		= &msm8916_rf_clk2_a,
-	[RPM_SMD_RF_CLK3]		= &qcs404_ln_bb_clk,
-	[RPM_SMD_RF_CLK3_A]		= &qcs404_ln_bb_clk_a,
-	[RPM_SMD_DIV_CLK2]		= &msm8974_div_clk2,
-	[RPM_SMD_DIV_A_CLK2]		= &msm8974_div_clk2_a,
-	[RPM_SMD_BB_CLK1_PIN]		= &msm8916_bb_clk1_pin,
-	[RPM_SMD_BB_CLK1_A_PIN]		= &msm8916_bb_clk1_a_pin,
-	[RPM_SMD_BB_CLK2_PIN]		= &msm8916_bb_clk2_pin,
-	[RPM_SMD_BB_CLK2_A_PIN]		= &msm8916_bb_clk2_a_pin,
+	[RPM_SMD_XO_CLK_SRC]		= &clk_smd_rpm_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC]		= &clk_smd_rpm_branch_bi_tcxo_a,
+	[RPM_SMD_PCNOC_CLK]		= &clk_smd_rpm_bus_0_pcnoc_clk,
+	[RPM_SMD_PCNOC_A_CLK]		= &clk_smd_rpm_bus_0_pcnoc_a_clk,
+	[RPM_SMD_SNOC_CLK]		= &clk_smd_rpm_bus_1_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK]		= &clk_smd_rpm_bus_1_snoc_a_clk,
+	[RPM_SMD_BIMC_CLK]		= &clk_smd_rpm_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK]		= &clk_smd_rpm_bimc_a_clk,
+	[RPM_SMD_IPA_CLK]		= &clk_smd_rpm_ipa_clk,
+	[RPM_SMD_IPA_A_CLK]		= &clk_smd_rpm_ipa_a_clk,
+	[RPM_SMD_SYSMMNOC_CLK]		= &clk_smd_rpm_bus_2_sysmmnoc_clk,
+	[RPM_SMD_SYSMMNOC_A_CLK]	= &clk_smd_rpm_bus_2_sysmmnoc_a_clk,
+	[RPM_SMD_QDSS_CLK]		= &clk_smd_rpm_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK]		= &clk_smd_rpm_qdss_a_clk,
+	[RPM_SMD_BB_CLK1]		= &clk_smd_rpm_bb_clk1,
+	[RPM_SMD_BB_CLK1_A]		= &clk_smd_rpm_bb_clk1_a,
+	[RPM_SMD_BB_CLK2]		= &clk_smd_rpm_bb_clk2,
+	[RPM_SMD_BB_CLK2_A]		= &clk_smd_rpm_bb_clk2_a,
+	[RPM_SMD_RF_CLK2]		= &clk_smd_rpm_rf_clk2,
+	[RPM_SMD_RF_CLK2_A]		= &clk_smd_rpm_rf_clk2_a,
+	[RPM_SMD_RF_CLK3]		= &clk_smd_rpm_ln_bb_clk,
+	[RPM_SMD_RF_CLK3_A]		= &clk_smd_rpm_ln_bb_clk_a,
+	[RPM_SMD_DIV_CLK2]		= &clk_smd_rpm_div_clk2,
+	[RPM_SMD_DIV_A_CLK2]		= &clk_smd_rpm_div_clk2_a,
+	[RPM_SMD_BB_CLK1_PIN]		= &clk_smd_rpm_bb_clk1_pin,
+	[RPM_SMD_BB_CLK1_A_PIN]		= &clk_smd_rpm_bb_clk1_a_pin,
+	[RPM_SMD_BB_CLK2_PIN]		= &clk_smd_rpm_bb_clk2_pin,
+	[RPM_SMD_BB_CLK2_A_PIN]		= &clk_smd_rpm_bb_clk2_a_pin,
 };
 
 static const struct rpm_smd_clk_desc rpm_clk_msm8953 = {
@@ -1056,40 +1054,40 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8953 = {
 };
 
 static struct clk_smd_rpm *sm6125_clks[] = {
-	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
-	[RPM_SMD_SNOC_CLK] = &sm6125_bus_2_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &sm6125_bus_2_snoc_a_clk,
-	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
-	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
-	[RPM_SMD_QDSS_CLK] = &sm6125_branch_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK] = &sm6125_branch_qdss_a_clk,
-	[RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
-	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
-	[RPM_SMD_RF_CLK2] = &msm8916_rf_clk2,
-	[RPM_SMD_RF_CLK2_A] = &msm8916_rf_clk2_a,
-	[RPM_SMD_CNOC_CLK] = &sm6125_bus_1_cnoc_clk,
-	[RPM_SMD_CNOC_A_CLK] = &sm6125_bus_1_cnoc_a_clk,
-	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
-	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
-	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
-	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
-	[RPM_SMD_LN_BB_CLK1] = &msm8998_ln_bb_clk1,
-	[RPM_SMD_LN_BB_CLK1_A] = &msm8998_ln_bb_clk1_a,
-	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
-	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
-	[RPM_SMD_LN_BB_CLK3] = &msm8998_ln_bb_clk3,
-	[RPM_SMD_LN_BB_CLK3_A] = &msm8998_ln_bb_clk3_a,
-	[RPM_SMD_QUP_CLK] = &sm6125_qup_clk,
-	[RPM_SMD_QUP_A_CLK] = &sm6125_qup_a_clk,
-	[RPM_SMD_MMRT_CLK] = &sm6125_mmrt_clk,
-	[RPM_SMD_MMRT_A_CLK] = &sm6125_mmrt_a_clk,
-	[RPM_SMD_MMNRT_CLK] = &sm6125_mmnrt_clk,
-	[RPM_SMD_MMNRT_A_CLK] = &sm6125_mmnrt_a_clk,
-	[RPM_SMD_SNOC_PERIPH_CLK] = &sm6125_bus_0_snoc_periph_clk,
-	[RPM_SMD_SNOC_PERIPH_A_CLK] = &sm6125_bus_0_snoc_periph_a_clk,
-	[RPM_SMD_SNOC_LPASS_CLK] = &sm6125_bus_5_snoc_lpass_clk,
-	[RPM_SMD_SNOC_LPASS_A_CLK] = &sm6125_bus_5_snoc_lpass_a_clk,
+	[RPM_SMD_XO_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo_a,
+	[RPM_SMD_SNOC_CLK] = &clk_smd_rpm_bus_2_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &clk_smd_rpm_bus_2_snoc_a_clk,
+	[RPM_SMD_BIMC_CLK] = &clk_smd_rpm_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK] = &clk_smd_rpm_bimc_a_clk,
+	[RPM_SMD_QDSS_CLK] = &clk_smd_rpm_branch_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &clk_smd_rpm_branch_qdss_a_clk,
+	[RPM_SMD_RF_CLK1] = &clk_smd_rpm_rf_clk1,
+	[RPM_SMD_RF_CLK1_A] = &clk_smd_rpm_rf_clk1_a,
+	[RPM_SMD_RF_CLK2] = &clk_smd_rpm_rf_clk2,
+	[RPM_SMD_RF_CLK2_A] = &clk_smd_rpm_rf_clk2_a,
+	[RPM_SMD_CNOC_CLK] = &clk_smd_rpm_bus_1_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &clk_smd_rpm_bus_1_cnoc_a_clk,
+	[RPM_SMD_IPA_CLK] = &clk_smd_rpm_ipa_clk,
+	[RPM_SMD_IPA_A_CLK] = &clk_smd_rpm_ipa_a_clk,
+	[RPM_SMD_CE1_CLK] = &clk_smd_rpm_ce1_clk,
+	[RPM_SMD_CE1_A_CLK] = &clk_smd_rpm_ce1_a_clk,
+	[RPM_SMD_LN_BB_CLK1] = &clk_smd_rpm_ln_bb_clk1,
+	[RPM_SMD_LN_BB_CLK1_A] = &clk_smd_rpm_ln_bb_clk1_a,
+	[RPM_SMD_LN_BB_CLK2] = &clk_smd_rpm_ln_bb_clk2,
+	[RPM_SMD_LN_BB_CLK2_A] = &clk_smd_rpm_ln_bb_clk2_a,
+	[RPM_SMD_LN_BB_CLK3] = &clk_smd_rpm_ln_bb_clk3,
+	[RPM_SMD_LN_BB_CLK3_A] = &clk_smd_rpm_ln_bb_clk3_a,
+	[RPM_SMD_QUP_CLK] = &clk_smd_rpm_qup_clk,
+	[RPM_SMD_QUP_A_CLK] = &clk_smd_rpm_qup_a_clk,
+	[RPM_SMD_MMRT_CLK] = &clk_smd_rpm_mmrt_clk,
+	[RPM_SMD_MMRT_A_CLK] = &clk_smd_rpm_mmrt_a_clk,
+	[RPM_SMD_MMNRT_CLK] = &clk_smd_rpm_mmnrt_clk,
+	[RPM_SMD_MMNRT_A_CLK] = &clk_smd_rpm_mmnrt_a_clk,
+	[RPM_SMD_SNOC_PERIPH_CLK] = &clk_smd_rpm_bus_0_snoc_periph_clk,
+	[RPM_SMD_SNOC_PERIPH_A_CLK] = &clk_smd_rpm_bus_0_snoc_periph_a_clk,
+	[RPM_SMD_SNOC_LPASS_CLK] = &clk_smd_rpm_bus_5_snoc_lpass_clk,
+	[RPM_SMD_SNOC_LPASS_A_CLK] = &clk_smd_rpm_bus_5_snoc_lpass_a_clk,
 };
 
 static const struct rpm_smd_clk_desc rpm_clk_sm6125 = {
@@ -1099,38 +1097,38 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6125 = {
 
 /* SM6115 */
 static struct clk_smd_rpm *sm6115_clks[] = {
-	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
-	[RPM_SMD_SNOC_CLK] = &sm6125_bus_2_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &sm6125_bus_2_snoc_a_clk,
-	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
-	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
-	[RPM_SMD_QDSS_CLK] = &sm6125_branch_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK] = &sm6125_branch_qdss_a_clk,
-	[RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
-	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
-	[RPM_SMD_RF_CLK2] = &msm8916_rf_clk2,
-	[RPM_SMD_RF_CLK2_A] = &msm8916_rf_clk2_a,
-	[RPM_SMD_CNOC_CLK] = &sm6125_bus_1_cnoc_clk,
-	[RPM_SMD_CNOC_A_CLK] = &sm6125_bus_1_cnoc_a_clk,
-	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
-	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
-	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
-	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
-	[RPM_SMD_QUP_CLK] = &sm6125_qup_clk,
-	[RPM_SMD_QUP_A_CLK] = &sm6125_qup_a_clk,
-	[RPM_SMD_MMRT_CLK] = &sm6125_mmrt_clk,
-	[RPM_SMD_MMRT_A_CLK] = &sm6125_mmrt_a_clk,
-	[RPM_SMD_MMNRT_CLK] = &sm6125_mmnrt_clk,
-	[RPM_SMD_MMNRT_A_CLK] = &sm6125_mmnrt_a_clk,
-	[RPM_SMD_SNOC_PERIPH_CLK] = &sm6125_bus_0_snoc_periph_clk,
-	[RPM_SMD_SNOC_PERIPH_A_CLK] = &sm6125_bus_0_snoc_periph_a_clk,
-	[RPM_SMD_SNOC_LPASS_CLK] = &sm6125_bus_5_snoc_lpass_clk,
-	[RPM_SMD_SNOC_LPASS_A_CLK] = &sm6125_bus_5_snoc_lpass_a_clk,
-	[RPM_SMD_RF_CLK1_PIN] = &msm8916_rf_clk1_pin,
-	[RPM_SMD_RF_CLK1_A_PIN] = &msm8916_rf_clk1_a_pin,
-	[RPM_SMD_RF_CLK2_PIN] = &msm8916_rf_clk2_pin,
-	[RPM_SMD_RF_CLK2_A_PIN] = &msm8916_rf_clk2_a_pin,
+	[RPM_SMD_XO_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo_a,
+	[RPM_SMD_SNOC_CLK] = &clk_smd_rpm_bus_2_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &clk_smd_rpm_bus_2_snoc_a_clk,
+	[RPM_SMD_BIMC_CLK] = &clk_smd_rpm_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK] = &clk_smd_rpm_bimc_a_clk,
+	[RPM_SMD_QDSS_CLK] = &clk_smd_rpm_branch_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &clk_smd_rpm_branch_qdss_a_clk,
+	[RPM_SMD_RF_CLK1] = &clk_smd_rpm_rf_clk1,
+	[RPM_SMD_RF_CLK1_A] = &clk_smd_rpm_rf_clk1_a,
+	[RPM_SMD_RF_CLK2] = &clk_smd_rpm_rf_clk2,
+	[RPM_SMD_RF_CLK2_A] = &clk_smd_rpm_rf_clk2_a,
+	[RPM_SMD_CNOC_CLK] = &clk_smd_rpm_bus_1_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &clk_smd_rpm_bus_1_cnoc_a_clk,
+	[RPM_SMD_IPA_CLK] = &clk_smd_rpm_ipa_clk,
+	[RPM_SMD_IPA_A_CLK] = &clk_smd_rpm_ipa_a_clk,
+	[RPM_SMD_CE1_CLK] = &clk_smd_rpm_ce1_clk,
+	[RPM_SMD_CE1_A_CLK] = &clk_smd_rpm_ce1_a_clk,
+	[RPM_SMD_QUP_CLK] = &clk_smd_rpm_qup_clk,
+	[RPM_SMD_QUP_A_CLK] = &clk_smd_rpm_qup_a_clk,
+	[RPM_SMD_MMRT_CLK] = &clk_smd_rpm_mmrt_clk,
+	[RPM_SMD_MMRT_A_CLK] = &clk_smd_rpm_mmrt_a_clk,
+	[RPM_SMD_MMNRT_CLK] = &clk_smd_rpm_mmnrt_clk,
+	[RPM_SMD_MMNRT_A_CLK] = &clk_smd_rpm_mmnrt_a_clk,
+	[RPM_SMD_SNOC_PERIPH_CLK] = &clk_smd_rpm_bus_0_snoc_periph_clk,
+	[RPM_SMD_SNOC_PERIPH_A_CLK] = &clk_smd_rpm_bus_0_snoc_periph_a_clk,
+	[RPM_SMD_SNOC_LPASS_CLK] = &clk_smd_rpm_bus_5_snoc_lpass_clk,
+	[RPM_SMD_SNOC_LPASS_A_CLK] = &clk_smd_rpm_bus_5_snoc_lpass_a_clk,
+	[RPM_SMD_RF_CLK1_PIN] = &clk_smd_rpm_rf_clk1_pin,
+	[RPM_SMD_RF_CLK1_A_PIN] = &clk_smd_rpm_rf_clk1_a_pin,
+	[RPM_SMD_RF_CLK2_PIN] = &clk_smd_rpm_rf_clk2_pin,
+	[RPM_SMD_RF_CLK2_A_PIN] = &clk_smd_rpm_rf_clk2_a_pin,
 };
 
 static const struct rpm_smd_clk_desc rpm_clk_sm6115 = {
@@ -1139,35 +1137,35 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6115 = {
 };
 
 static struct clk_smd_rpm *sm6375_clks[] = {
-	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
-	[RPM_SMD_SNOC_CLK] = &sm6125_bus_2_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &sm6125_bus_2_snoc_a_clk,
-	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
-	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
-	[RPM_SMD_QDSS_CLK] = &sm6125_branch_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK] = &sm6125_branch_qdss_a_clk,
-	[RPM_SMD_CNOC_CLK] = &sm6125_bus_1_cnoc_clk,
-	[RPM_SMD_CNOC_A_CLK] = &sm6125_bus_1_cnoc_a_clk,
-	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
-	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
-	[RPM_SMD_QUP_CLK] = &sm6125_qup_clk,
-	[RPM_SMD_QUP_A_CLK] = &sm6125_qup_a_clk,
-	[RPM_SMD_MMRT_CLK] = &sm6125_mmrt_clk,
-	[RPM_SMD_MMRT_A_CLK] = &sm6125_mmrt_a_clk,
-	[RPM_SMD_MMNRT_CLK] = &sm6125_mmnrt_clk,
-	[RPM_SMD_MMNRT_A_CLK] = &sm6125_mmnrt_a_clk,
-	[RPM_SMD_SNOC_PERIPH_CLK] = &sm6125_bus_0_snoc_periph_clk,
-	[RPM_SMD_SNOC_PERIPH_A_CLK] = &sm6125_bus_0_snoc_periph_a_clk,
-	[RPM_SMD_SNOC_LPASS_CLK] = &sm6125_bus_5_snoc_lpass_clk,
-	[RPM_SMD_SNOC_LPASS_A_CLK] = &sm6125_bus_5_snoc_lpass_a_clk,
-	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
-	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
-	[RPM_SMD_HWKM_CLK] = &qcm2290_hwkm_clk,
-	[RPM_SMD_HWKM_A_CLK] = &qcm2290_hwkm_a_clk,
-	[RPM_SMD_PKA_CLK] = &qcm2290_pka_clk,
-	[RPM_SMD_PKA_A_CLK] = &qcm2290_pka_a_clk,
-	[RPM_SMD_BIMC_FREQ_LOG] = &sm6375_branch_bimc_freq_log,
+	[RPM_SMD_XO_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo_a,
+	[RPM_SMD_SNOC_CLK] = &clk_smd_rpm_bus_2_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &clk_smd_rpm_bus_2_snoc_a_clk,
+	[RPM_SMD_BIMC_CLK] = &clk_smd_rpm_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK] = &clk_smd_rpm_bimc_a_clk,
+	[RPM_SMD_QDSS_CLK] = &clk_smd_rpm_branch_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &clk_smd_rpm_branch_qdss_a_clk,
+	[RPM_SMD_CNOC_CLK] = &clk_smd_rpm_bus_1_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &clk_smd_rpm_bus_1_cnoc_a_clk,
+	[RPM_SMD_IPA_CLK] = &clk_smd_rpm_ipa_clk,
+	[RPM_SMD_IPA_A_CLK] = &clk_smd_rpm_ipa_a_clk,
+	[RPM_SMD_QUP_CLK] = &clk_smd_rpm_qup_clk,
+	[RPM_SMD_QUP_A_CLK] = &clk_smd_rpm_qup_a_clk,
+	[RPM_SMD_MMRT_CLK] = &clk_smd_rpm_mmrt_clk,
+	[RPM_SMD_MMRT_A_CLK] = &clk_smd_rpm_mmrt_a_clk,
+	[RPM_SMD_MMNRT_CLK] = &clk_smd_rpm_mmnrt_clk,
+	[RPM_SMD_MMNRT_A_CLK] = &clk_smd_rpm_mmnrt_a_clk,
+	[RPM_SMD_SNOC_PERIPH_CLK] = &clk_smd_rpm_bus_0_snoc_periph_clk,
+	[RPM_SMD_SNOC_PERIPH_A_CLK] = &clk_smd_rpm_bus_0_snoc_periph_a_clk,
+	[RPM_SMD_SNOC_LPASS_CLK] = &clk_smd_rpm_bus_5_snoc_lpass_clk,
+	[RPM_SMD_SNOC_LPASS_A_CLK] = &clk_smd_rpm_bus_5_snoc_lpass_a_clk,
+	[RPM_SMD_CE1_CLK] = &clk_smd_rpm_ce1_clk,
+	[RPM_SMD_CE1_A_CLK] = &clk_smd_rpm_ce1_a_clk,
+	[RPM_SMD_HWKM_CLK] = &clk_smd_rpm_hwkm_clk,
+	[RPM_SMD_HWKM_A_CLK] = &clk_smd_rpm_hwkm_a_clk,
+	[RPM_SMD_PKA_CLK] = &clk_smd_rpm_pka_clk,
+	[RPM_SMD_PKA_A_CLK] = &clk_smd_rpm_pka_a_clk,
+	[RPM_SMD_BIMC_FREQ_LOG] = &clk_smd_rpm_branch_bimc_freq_log,
 };
 
 static const struct rpm_smd_clk_desc rpm_clk_sm6375 = {
@@ -1176,44 +1174,44 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6375 = {
 };
 
 static struct clk_smd_rpm *qcm2290_clks[] = {
-	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
-	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
-	[RPM_SMD_SNOC_CLK] = &sm6125_bus_2_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &sm6125_bus_2_snoc_a_clk,
-	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
-	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
-	[RPM_SMD_QDSS_CLK] = &sm6125_branch_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK] = &sm6125_branch_qdss_a_clk,
-	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
-	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
-	[RPM_SMD_RF_CLK3] = &qcm2290_38m4_rf_clk3,
-	[RPM_SMD_RF_CLK3_A] = &qcm2290_38m4_rf_clk3_a,
-	[RPM_SMD_CNOC_CLK] = &sm6125_bus_1_cnoc_clk,
-	[RPM_SMD_CNOC_A_CLK] = &sm6125_bus_1_cnoc_a_clk,
-	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
-	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
-	[RPM_SMD_QUP_CLK] = &sm6125_qup_clk,
-	[RPM_SMD_QUP_A_CLK] = &sm6125_qup_a_clk,
-	[RPM_SMD_MMRT_CLK] = &sm6125_mmrt_clk,
-	[RPM_SMD_MMRT_A_CLK] = &sm6125_mmrt_a_clk,
-	[RPM_SMD_MMNRT_CLK] = &sm6125_mmnrt_clk,
-	[RPM_SMD_MMNRT_A_CLK] = &sm6125_mmnrt_a_clk,
-	[RPM_SMD_SNOC_PERIPH_CLK] = &sm6125_bus_0_snoc_periph_clk,
-	[RPM_SMD_SNOC_PERIPH_A_CLK] = &sm6125_bus_0_snoc_periph_a_clk,
-	[RPM_SMD_SNOC_LPASS_CLK] = &sm6125_bus_5_snoc_lpass_clk,
-	[RPM_SMD_SNOC_LPASS_A_CLK] = &sm6125_bus_5_snoc_lpass_a_clk,
-	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
-	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
-	[RPM_SMD_QPIC_CLK] = &qcs404_qpic_clk,
-	[RPM_SMD_QPIC_CLK_A] = &qcs404_qpic_a_clk,
-	[RPM_SMD_HWKM_CLK] = &qcm2290_hwkm_clk,
-	[RPM_SMD_HWKM_A_CLK] = &qcm2290_hwkm_a_clk,
-	[RPM_SMD_PKA_CLK] = &qcm2290_pka_clk,
-	[RPM_SMD_PKA_A_CLK] = &qcm2290_pka_a_clk,
-	[RPM_SMD_BIMC_GPU_CLK] = &qcs404_bimc_gpu_clk,
-	[RPM_SMD_BIMC_GPU_A_CLK] = &qcs404_bimc_gpu_a_clk,
-	[RPM_SMD_CPUSS_GNOC_CLK] = &qcm2290_cpuss_gnoc_clk,
-	[RPM_SMD_CPUSS_GNOC_A_CLK] = &qcm2290_cpuss_gnoc_a_clk,
+	[RPM_SMD_XO_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo_a,
+	[RPM_SMD_SNOC_CLK] = &clk_smd_rpm_bus_2_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &clk_smd_rpm_bus_2_snoc_a_clk,
+	[RPM_SMD_BIMC_CLK] = &clk_smd_rpm_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK] = &clk_smd_rpm_bimc_a_clk,
+	[RPM_SMD_QDSS_CLK] = &clk_smd_rpm_branch_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &clk_smd_rpm_branch_qdss_a_clk,
+	[RPM_SMD_LN_BB_CLK2] = &clk_smd_rpm_ln_bb_clk2,
+	[RPM_SMD_LN_BB_CLK2_A] = &clk_smd_rpm_ln_bb_clk2_a,
+	[RPM_SMD_RF_CLK3] = &clk_smd_rpm_38m4_rf_clk3,
+	[RPM_SMD_RF_CLK3_A] = &clk_smd_rpm_38m4_rf_clk3_a,
+	[RPM_SMD_CNOC_CLK] = &clk_smd_rpm_bus_1_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &clk_smd_rpm_bus_1_cnoc_a_clk,
+	[RPM_SMD_IPA_CLK] = &clk_smd_rpm_ipa_clk,
+	[RPM_SMD_IPA_A_CLK] = &clk_smd_rpm_ipa_a_clk,
+	[RPM_SMD_QUP_CLK] = &clk_smd_rpm_qup_clk,
+	[RPM_SMD_QUP_A_CLK] = &clk_smd_rpm_qup_a_clk,
+	[RPM_SMD_MMRT_CLK] = &clk_smd_rpm_mmrt_clk,
+	[RPM_SMD_MMRT_A_CLK] = &clk_smd_rpm_mmrt_a_clk,
+	[RPM_SMD_MMNRT_CLK] = &clk_smd_rpm_mmnrt_clk,
+	[RPM_SMD_MMNRT_A_CLK] = &clk_smd_rpm_mmnrt_a_clk,
+	[RPM_SMD_SNOC_PERIPH_CLK] = &clk_smd_rpm_bus_0_snoc_periph_clk,
+	[RPM_SMD_SNOC_PERIPH_A_CLK] = &clk_smd_rpm_bus_0_snoc_periph_a_clk,
+	[RPM_SMD_SNOC_LPASS_CLK] = &clk_smd_rpm_bus_5_snoc_lpass_clk,
+	[RPM_SMD_SNOC_LPASS_A_CLK] = &clk_smd_rpm_bus_5_snoc_lpass_a_clk,
+	[RPM_SMD_CE1_CLK] = &clk_smd_rpm_ce1_clk,
+	[RPM_SMD_CE1_A_CLK] = &clk_smd_rpm_ce1_a_clk,
+	[RPM_SMD_QPIC_CLK] = &clk_smd_rpm_qpic_clk,
+	[RPM_SMD_QPIC_CLK_A] = &clk_smd_rpm_qpic_a_clk,
+	[RPM_SMD_HWKM_CLK] = &clk_smd_rpm_hwkm_clk,
+	[RPM_SMD_HWKM_A_CLK] = &clk_smd_rpm_hwkm_a_clk,
+	[RPM_SMD_PKA_CLK] = &clk_smd_rpm_pka_clk,
+	[RPM_SMD_PKA_A_CLK] = &clk_smd_rpm_pka_a_clk,
+	[RPM_SMD_BIMC_GPU_CLK] = &clk_smd_rpm_bimc_gpu_clk,
+	[RPM_SMD_BIMC_GPU_A_CLK] = &clk_smd_rpm_bimc_gpu_a_clk,
+	[RPM_SMD_CPUSS_GNOC_CLK] = &clk_smd_rpm_cpuss_gnoc_clk,
+	[RPM_SMD_CPUSS_GNOC_A_CLK] = &clk_smd_rpm_cpuss_gnoc_a_clk,
 };
 
 static const struct rpm_smd_clk_desc rpm_clk_qcm2290 = {
-- 
2.35.1

