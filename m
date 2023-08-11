Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 000FD778F1B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Aug 2023 14:18:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236346AbjHKMRL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Aug 2023 08:17:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236398AbjHKMQx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Aug 2023 08:16:53 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 165933599
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 05:16:20 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b9f0b7af65so29356831fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 05:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691756151; x=1692360951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nkM+FovsTlUwb/sPXMPrEPRPO+X9OnVJmkSbyVZt4vc=;
        b=Soev9TgtBP478lr2f46cbWfE98N2qx6xm4tzGvNcemb83PSgILSbyx/Z0cA1ojjHn3
         lbYFYQBiWwVsHtFTUF9Vqv8GbDcRtPKfxp3bBwvvE1IJ3lPdARl25clxYr5r3y1/tyE+
         bD1HvcojqHLnCJCWknSnTVG34PiJPI5JQeuX37xf2Rq/GWWY/3x5ZrYBif3/IV1bskdz
         jNw5LeXelVtpXpUBurjlcd4zOZbztAs5dVMZGChL018AMPIJs/lHsyhR8b0PU/s7TmkF
         Fc/84btH757CljDlSKAFw1jzrts4WDBcjNf5jGOGe7PkDlGH5EG285lx4DY+KelH/iqc
         XEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691756151; x=1692360951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nkM+FovsTlUwb/sPXMPrEPRPO+X9OnVJmkSbyVZt4vc=;
        b=WBRd39jxptiYDkPwZo6yUi1TwxKWQ2ZngA4tu2R80+zqVSTpjyYPNhsGNw+KX/S0R5
         f60QuqTp1zSyFZqoudI9Xr9Mcsy9eekpdZxnJV+Y29GWIqjGDho9Lyo/9irNKmR2l4MG
         YX4uzKL0ZCMPeNpVZG8dtsX6r4K5DfK+BLWc15X6KlqcXYM1Slv30DqHfJL0JdJWO6zo
         VTrtc768BK3SOUQ09sYFO2fEjXkKYnv/xX1p5nM53uNBKSmN/ykMyq7/a//iojAx2qWQ
         coY++tJdc0t6OHqZ3s1ZYnkg6ZXTpqMeMbIWuV2ZvRkBJPIRK4Yv1iLfQQCaxXFmf8XS
         jmuA==
X-Gm-Message-State: AOJu0Yy4Ske212isRRbrf3+oFybT0oDLB3i2GL0RwP/ptq6qrqKOJv2a
        dqOTnla6e34wnf5m7ohyYmioJw==
X-Google-Smtp-Source: AGHT+IHNV9Q6Coi0Bh0gxX95eZRf9cwoIPIh4C4sJJljVVzInhuXsvsYF79RRLipqi0G2K96BhbapQ==
X-Received: by 2002:a2e:7209:0:b0:2b6:df8a:d44b with SMTP id n9-20020a2e7209000000b002b6df8ad44bmr1241676ljc.36.1691756151004;
        Fri, 11 Aug 2023 05:15:51 -0700 (PDT)
Received: from [192.168.1.101] (abyj188.neoplus.adsl.tpnet.pl. [83.9.29.188])
        by smtp.gmail.com with ESMTPSA id m12-20020a2e870c000000b002b9ec22d9fasm848487lji.29.2023.08.11.05.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 05:15:50 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 11 Aug 2023 14:15:30 +0200
Subject: [PATCH 19/20] interconnect: qcom: sm8350: Retire DEFINE_QBCM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230811-topic-icc_retire_macrosd-v1-19-c03aaeffc769@linaro.org>
References: <20230811-topic-icc_retire_macrosd-v1-0-c03aaeffc769@linaro.org>
In-Reply-To: <20230811-topic-icc_retire_macrosd-v1-0-c03aaeffc769@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691756124; l=9015;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=FY8c36vkvzMQhDJMdfMk6D0Dbl/U6g583C761q8CoX4=;
 b=M1K6A9PwRIKr1h8RCSzlQ0xKWaEaZ/LaPH3NbxYkOoH/bmikeWMlXexBfaE4lpPnwK0tBWiKO
 v/kH19L9EM3BUoM6F35UKm0IiybatAp6oOqCidip1FuZvclt89VHpPy
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The struct definition macros are hard to read and comapre, expand them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/sm8350.c | 308 +++++++++++++++++++++++++++++++++----
 1 file changed, 276 insertions(+), 32 deletions(-)

diff --git a/drivers/interconnect/qcom/sm8350.c b/drivers/interconnect/qcom/sm8350.c
index 4f3b9b1ab101..bdf75839e6d1 100644
--- a/drivers/interconnect/qcom/sm8350.c
+++ b/drivers/interconnect/qcom/sm8350.c
@@ -1354,38 +1354,282 @@ static struct qcom_icc_node qns_mem_noc_sf_disp = {
 	.links = { SM8350_MASTER_MNOC_SF_MEM_NOC_DISP },
 };
 
-DEFINE_QBCM(bcm_acv, "ACV", false, &ebi);
-DEFINE_QBCM(bcm_ce0, "CE0", false, &qxm_crypto);
-DEFINE_QBCM(bcm_cn0, "CN0", true, &qnm_gemnoc_cnoc, &qnm_gemnoc_pcie);
-DEFINE_QBCM(bcm_cn1, "CN1", false, &xm_qdss_dap, &qhs_ahb2phy0, &qhs_ahb2phy1, &qhs_aoss, &qhs_apss, &qhs_camera_cfg, &qhs_clk_ctl, &qhs_compute_cfg, &qhs_cpr_cx, &qhs_cpr_mmcx, &qhs_cpr_mx, &qhs_crypto0_cfg, &qhs_cx_rdpm, &qhs_dcc_cfg, &qhs_display_cfg, &qhs_gpuss_cfg, &qhs_hwkm, &qhs_imem_cfg, &qhs_ipa, &qhs_ipc_router, &qhs_mss_cfg, &qhs_mx_rdpm, &qhs_pcie0_cfg, &qhs_pcie1_cfg, &qhs_pimem_cfg, &qhs_pka_wrapper_cfg, &qhs_pmu_wrapper_cfg, &qhs_qdss_cfg, &qhs_qup0, &qhs_qup1, &qhs_qup2, &qhs_security, &qhs_spss_cfg, &qhs_tcsr, &qhs_tlmm, &qhs_ufs_card_cfg, &qhs_ufs_mem_cfg, &qhs_usb3_0, &qhs_usb3_1, &qhs_venus_cfg, &qhs_vsense_ctrl_cfg, &qns_a1_noc_cfg, &qns_a2_noc_cfg, &qns_ddrss_cfg, &qns_mnoc_cfg, &qns_snoc_cfg, &srvc_cnoc);
-DEFINE_QBCM(bcm_cn2, "CN2", false, &qhs_lpass_cfg, &qhs_pdm, &qhs_qspi, &qhs_sdc2, &qhs_sdc4);
-DEFINE_QBCM(bcm_co0, "CO0", false, &qns_nsp_gemnoc);
-DEFINE_QBCM(bcm_co3, "CO3", false, &qxm_nsp);
-DEFINE_QBCM(bcm_mc0, "MC0", true, &ebi);
-DEFINE_QBCM(bcm_mm0, "MM0", true, &qns_mem_noc_hf);
-DEFINE_QBCM(bcm_mm1, "MM1", false, &qnm_camnoc_hf, &qxm_mdp0, &qxm_mdp1);
-DEFINE_QBCM(bcm_mm4, "MM4", false, &qns_mem_noc_sf);
-DEFINE_QBCM(bcm_mm5, "MM5", false, &qnm_camnoc_icp, &qnm_camnoc_sf, &qnm_video0, &qnm_video1, &qnm_video_cvp, &qxm_rot);
-DEFINE_QBCM(bcm_sh0, "SH0", true, &qns_llcc);
-DEFINE_QBCM(bcm_sh2, "SH2", false, &alm_gpu_tcu, &alm_sys_tcu);
-DEFINE_QBCM(bcm_sh3, "SH3", false, &qnm_cmpnoc);
-DEFINE_QBCM(bcm_sh4, "SH4", false, &chm_apps);
-DEFINE_QBCM(bcm_sn0, "SN0", true, &qns_gemnoc_sf);
-DEFINE_QBCM(bcm_sn2, "SN2", false, &qns_gemnoc_gc);
-DEFINE_QBCM(bcm_sn3, "SN3", false, &qxs_pimem);
-DEFINE_QBCM(bcm_sn4, "SN4", false, &xs_qdss_stm);
-DEFINE_QBCM(bcm_sn5, "SN5", false, &xm_pcie3_0);
-DEFINE_QBCM(bcm_sn6, "SN6", false, &xm_pcie3_1);
-DEFINE_QBCM(bcm_sn7, "SN7", false, &qnm_aggre1_noc);
-DEFINE_QBCM(bcm_sn8, "SN8", false, &qnm_aggre2_noc);
-DEFINE_QBCM(bcm_sn14, "SN14", false, &qns_pcie_mem_noc);
-DEFINE_QBCM(bcm_acv_disp, "ACV", false, &ebi_disp);
-DEFINE_QBCM(bcm_mc0_disp, "MC0", false, &ebi_disp);
-DEFINE_QBCM(bcm_mm0_disp, "MM0", false, &qns_mem_noc_hf_disp);
-DEFINE_QBCM(bcm_mm1_disp, "MM1", false, &qxm_mdp0_disp, &qxm_mdp1_disp);
-DEFINE_QBCM(bcm_mm4_disp, "MM4", false, &qns_mem_noc_sf_disp);
-DEFINE_QBCM(bcm_mm5_disp, "MM5", false, &qxm_rot_disp);
-DEFINE_QBCM(bcm_sh0_disp, "SH0", false, &qns_llcc_disp);
+static struct qcom_icc_bcm bcm_acv = {
+	.name = "ACV",
+	.keepalive = false,
+	.num_nodes = 1,
+	.nodes = { &ebi },
+};
+
+static struct qcom_icc_bcm bcm_ce0 = {
+	.name = "CE0",
+	.keepalive = false,
+	.num_nodes = 1,
+	.nodes = { &qxm_crypto },
+};
+
+static struct qcom_icc_bcm bcm_cn0 = {
+	.name = "CN0",
+	.keepalive = true,
+	.num_nodes = 2,
+	.nodes = { &qnm_gemnoc_cnoc, &qnm_gemnoc_pcie },
+};
+
+static struct qcom_icc_bcm bcm_cn1 = {
+	.name = "CN1",
+	.keepalive = false,
+	.num_nodes = 47,
+	.nodes = { &xm_qdss_dap,
+		   &qhs_ahb2phy0,
+		   &qhs_ahb2phy1,
+		   &qhs_aoss,
+		   &qhs_apss,
+		   &qhs_camera_cfg,
+		   &qhs_clk_ctl,
+		   &qhs_compute_cfg,
+		   &qhs_cpr_cx,
+		   &qhs_cpr_mmcx,
+		   &qhs_cpr_mx,
+		   &qhs_crypto0_cfg,
+		   &qhs_cx_rdpm,
+		   &qhs_dcc_cfg,
+		   &qhs_display_cfg,
+		   &qhs_gpuss_cfg,
+		   &qhs_hwkm,
+		   &qhs_imem_cfg,
+		   &qhs_ipa,
+		   &qhs_ipc_router,
+		   &qhs_mss_cfg,
+		   &qhs_mx_rdpm,
+		   &qhs_pcie0_cfg,
+		   &qhs_pcie1_cfg,
+		   &qhs_pimem_cfg,
+		   &qhs_pka_wrapper_cfg,
+		   &qhs_pmu_wrapper_cfg,
+		   &qhs_qdss_cfg,
+		   &qhs_qup0,
+		   &qhs_qup1,
+		   &qhs_qup2,
+		   &qhs_security,
+		   &qhs_spss_cfg,
+		   &qhs_tcsr,
+		   &qhs_tlmm,
+		   &qhs_ufs_card_cfg,
+		   &qhs_ufs_mem_cfg,
+		   &qhs_usb3_0,
+		   &qhs_usb3_1,
+		   &qhs_venus_cfg,
+		   &qhs_vsense_ctrl_cfg,
+		   &qns_a1_noc_cfg,
+		   &qns_a2_noc_cfg,
+		   &qns_ddrss_cfg,
+		   &qns_mnoc_cfg,
+		   &qns_snoc_cfg,
+		   &srvc_cnoc
+	},
+};
+
+static struct qcom_icc_bcm bcm_cn2 = {
+	.name = "CN2",
+	.keepalive = false,
+	.num_nodes = 5,
+	.nodes = { &qhs_lpass_cfg, &qhs_pdm, &qhs_qspi, &qhs_sdc2, &qhs_sdc4 },
+};
+
+static struct qcom_icc_bcm bcm_co0 = {
+	.name = "CO0",
+	.keepalive = false,
+	.num_nodes = 1,
+	.nodes = { &qns_nsp_gemnoc },
+};
+
+static struct qcom_icc_bcm bcm_co3 = {
+	.name = "CO3",
+	.keepalive = false,
+	.num_nodes = 1,
+	.nodes = { &qxm_nsp },
+};
+
+static struct qcom_icc_bcm bcm_mc0 = {
+	.name = "MC0",
+	.keepalive = true,
+	.num_nodes = 1,
+	.nodes = { &ebi },
+};
+
+static struct qcom_icc_bcm bcm_mm0 = {
+	.name = "MM0",
+	.keepalive = true,
+	.num_nodes = 1,
+	.nodes = { &qns_mem_noc_hf },
+};
+
+static struct qcom_icc_bcm bcm_mm1 = {
+	.name = "MM1",
+	.keepalive = false,
+	.num_nodes = 3,
+	.nodes = { &qnm_camnoc_hf, &qxm_mdp0, &qxm_mdp1 },
+};
+
+static struct qcom_icc_bcm bcm_mm4 = {
+	.name = "MM4",
+	.keepalive = false,
+	.num_nodes = 1,
+	.nodes = { &qns_mem_noc_sf },
+};
+
+static struct qcom_icc_bcm bcm_mm5 = {
+	.name = "MM5",
+	.keepalive = false,
+	.num_nodes = 6,
+	.nodes = { &qnm_camnoc_icp,
+		   &qnm_camnoc_sf,
+		   &qnm_video0,
+		   &qnm_video1,
+		   &qnm_video_cvp,
+		   &qxm_rot
+	},
+};
+
+static struct qcom_icc_bcm bcm_sh0 = {
+	.name = "SH0",
+	.keepalive = true,
+	.num_nodes = 1,
+	.nodes = { &qns_llcc },
+};
+
+static struct qcom_icc_bcm bcm_sh2 = {
+	.name = "SH2",
+	.keepalive = false,
+	.num_nodes = 2,
+	.nodes = { &alm_gpu_tcu, &alm_sys_tcu },
+};
+
+static struct qcom_icc_bcm bcm_sh3 = {
+	.name = "SH3",
+	.keepalive = false,
+	.num_nodes = 1,
+	.nodes = { &qnm_cmpnoc },
+};
+
+static struct qcom_icc_bcm bcm_sh4 = {
+	.name = "SH4",
+	.keepalive = false,
+	.num_nodes = 1,
+	.nodes = { &chm_apps },
+};
+
+static struct qcom_icc_bcm bcm_sn0 = {
+	.name = "SN0",
+	.keepalive = true,
+	.num_nodes = 1,
+	.nodes = { &qns_gemnoc_sf },
+};
+
+static struct qcom_icc_bcm bcm_sn2 = {
+	.name = "SN2",
+	.keepalive = false,
+	.num_nodes = 1,
+	.nodes = { &qns_gemnoc_gc },
+};
+
+static struct qcom_icc_bcm bcm_sn3 = {
+	.name = "SN3",
+	.keepalive = false,
+	.num_nodes = 1,
+	.nodes = { &qxs_pimem },
+};
+
+static struct qcom_icc_bcm bcm_sn4 = {
+	.name = "SN4",
+	.keepalive = false,
+	.num_nodes = 1,
+	.nodes = { &xs_qdss_stm },
+};
+
+static struct qcom_icc_bcm bcm_sn5 = {
+	.name = "SN5",
+	.keepalive = false,
+	.num_nodes = 1,
+	.nodes = { &xm_pcie3_0 },
+};
+
+static struct qcom_icc_bcm bcm_sn6 = {
+	.name = "SN6",
+	.keepalive = false,
+	.num_nodes = 1,
+	.nodes = { &xm_pcie3_1 },
+};
+
+static struct qcom_icc_bcm bcm_sn7 = {
+	.name = "SN7",
+	.keepalive = false,
+	.num_nodes = 1,
+	.nodes = { &qnm_aggre1_noc },
+};
+
+static struct qcom_icc_bcm bcm_sn8 = {
+	.name = "SN8",
+	.keepalive = false,
+	.num_nodes = 1,
+	.nodes = { &qnm_aggre2_noc },
+};
+
+static struct qcom_icc_bcm bcm_sn14 = {
+	.name = "SN14",
+	.keepalive = false,
+	.num_nodes = 1,
+	.nodes = { &qns_pcie_mem_noc },
+};
+
+static struct qcom_icc_bcm bcm_acv_disp = {
+	.name = "ACV",
+	.keepalive = false,
+	.num_nodes = 1,
+	.nodes = { &ebi_disp },
+};
+
+static struct qcom_icc_bcm bcm_mc0_disp = {
+	.name = "MC0",
+	.keepalive = false,
+	.num_nodes = 1,
+	.nodes = { &ebi_disp },
+};
+
+static struct qcom_icc_bcm bcm_mm0_disp = {
+	.name = "MM0",
+	.keepalive = false,
+	.num_nodes = 1,
+	.nodes = { &qns_mem_noc_hf_disp },
+};
+
+static struct qcom_icc_bcm bcm_mm1_disp = {
+	.name = "MM1",
+	.keepalive = false,
+	.num_nodes = 2,
+	.nodes = { &qxm_mdp0_disp, &qxm_mdp1_disp },
+};
+
+static struct qcom_icc_bcm bcm_mm4_disp = {
+	.name = "MM4",
+	.keepalive = false,
+	.num_nodes = 1,
+	.nodes = { &qns_mem_noc_sf_disp },
+};
+
+static struct qcom_icc_bcm bcm_mm5_disp = {
+	.name = "MM5",
+	.keepalive = false,
+	.num_nodes = 1,
+	.nodes = { &qxm_rot_disp },
+};
+
+static struct qcom_icc_bcm bcm_sh0_disp = {
+	.name = "SH0",
+	.keepalive = false,
+	.num_nodes = 1,
+	.nodes = { &qns_llcc_disp },
+};
 
 static struct qcom_icc_bcm * const aggre1_noc_bcms[] = {
 };

-- 
2.41.0

