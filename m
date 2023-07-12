Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A6B374FC2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jul 2023 02:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbjGLAeY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 20:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbjGLAeX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 20:34:23 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19772DC;
        Tue, 11 Jul 2023 17:34:20 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36BNicCv029801;
        Wed, 12 Jul 2023 00:34:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=NlApmRMzOUtbAQ1SuobIKxTu/w6ZltmfJ79fYB7FTuE=;
 b=VVRuz/2vtE4FOi2//ctZ5DTtPSSFUt0GxqGhpTlWWLSbO2AoRYKJWa0aXxEr3TEQVZHa
 Hy5sWM7oBrrJ4YeUndmat45vOSP3Q0UN7JlmtpZ99hGE/+XLc7KnMW7/uFasjtL7q+nT
 kfzA+G1vdxQag/Av8SSHk5QIsrZzoIuKP+3dED3fqsXkoplXAnaNPgCULiCi4FGR784k
 zxKf34bIpdi2qyle8c14Khx6ZpgQoxw20zs9D4oduZY+3HdVQOhcIb/AQVYch7CEGWYF
 E1OGVgHTRb1MCivfbUnz+5asRWHvUDFCjAsmuJdd3J6pIc74sTKYZBf8IT/9nxl1XV1x /Q== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rse45gbqd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 12 Jul 2023 00:34:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36C0Y92o012794
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 12 Jul 2023 00:34:09 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 11 Jul 2023 17:34:09 -0700
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
To:     <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        "Daniel Vetter" <daniel@ffwll.ch>
CC:     <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
        <andersson@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/4] drm/msm/dpu: re-introduce dpu core revision to the catalog
Date:   Tue, 11 Jul 2023 17:33:06 -0700
Message-ID: <20230712003310.31961-2-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230712003310.31961-1-quic_abhinavk@quicinc.com>
References: <20230712003310.31961-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pvP0IZ1kg-5XJ21ElOAxEniePedNuoqk
X-Proofpoint-ORIG-GUID: pvP0IZ1kg-5XJ21ElOAxEniePedNuoqk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_14,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307120002
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce the dpu core revision back as an entry to the catalog so that
we can just use dpu revision checks and enable those bits which
should be enabled unconditionally and not controlled by a catalog
and also simplify the changes to do something like:

if (dpu_core_revision > xxxxx && dpu_core_revision < xxxxx)
   enable the bit;

Since dpu's major and minor versions are now separate fields, lets
drop all the DPU_HW_VER macros.

changes in v4:
	- removed hex prefix from the revisions
	- updated the commit text to move some parts to cover letter
	- rebased and added support for sm6125 into this
	- introduce struct dpu_mdss_version to hold the core revision

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h |  6 ++++++
 .../drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  |  6 ++++++
 .../drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  |  6 ++++++
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h |  6 ++++++
 .../drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h  |  6 ++++++
 .../drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  |  6 ++++++
 .../drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h  |  6 ++++++
 .../drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  |  6 ++++++
 .../drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  |  6 ++++++
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h |  6 ++++++
 .../drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  |  6 ++++++
 .../drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h  |  6 ++++++
 .../drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h  |  6 ++++++
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h    |  6 ++++++
 .../drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h  |  6 ++++++
 .../drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h  |  6 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h  | 17 +++++++++++++++--
 17 files changed, 111 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 7d87dc2d7b1b..b5fbac55f127 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -315,7 +315,13 @@ static const struct dpu_perf_cfg msm8998_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
+static const struct dpu_mdss_version msm8998_mdss_ver = {
+	.core_major_ver = 3,
+	.core_minor_ver = 0,
+};
+
 const struct dpu_mdss_cfg dpu_msm8998_cfg = {
+	.mdss_ver = &msm8998_mdss_ver,
 	.caps = &msm8998_dpu_caps,
 	.ubwc = &msm8998_ubwc_cfg,
 	.mdp = &msm8998_mdp,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 87459cf40895..8000b870d3a7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -332,7 +332,13 @@ static const struct dpu_perf_cfg sdm845_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
+static const struct dpu_mdss_version sdm845_mdss_ver = {
+	.core_major_ver = 4,
+	.core_minor_ver = 0,
+};
+
 const struct dpu_mdss_cfg dpu_sdm845_cfg = {
+	.mdss_ver = &sdm845_mdss_ver,
 	.caps = &sdm845_dpu_caps,
 	.ubwc = &sdm845_ubwc_cfg,
 	.mdp = &sdm845_mdp,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 96c542d620f1..7ce2d69d28f6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -375,7 +375,13 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
+static const struct dpu_mdss_version sm8150_mdss_ver = {
+	.core_major_ver = 5,
+	.core_minor_ver = 0,
+};
+
 const struct dpu_mdss_cfg dpu_sm8150_cfg = {
+	.mdss_ver = &sm8150_mdss_ver,
 	.caps = &sm8150_dpu_caps,
 	.ubwc = &sm8150_ubwc_cfg,
 	.mdp = &sm8150_mdp,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 4edc1060f05c..cea005382456 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -402,7 +402,13 @@ static const struct dpu_perf_cfg sc8180x_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
+static const struct dpu_mdss_version sc8180x_mdss_ver = {
+	.core_major_ver = 5,
+	.core_minor_ver = 1,
+};
+
 const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
+	.mdss_ver = &sc8180x_mdss_ver,
 	.caps = &sc8180x_dpu_caps,
 	.ubwc = &sc8180x_ubwc_cfg,
 	.mdp = &sc8180x_mdp,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index b3bfb897327b..5fddfcce6288 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -200,7 +200,13 @@ static const struct dpu_perf_cfg sm6125_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
+static const struct dpu_mdss_version sm6125_mdss_ver = {
+	.core_major_ver = 5,
+	.core_minor_ver = 4,
+};
+
 const struct dpu_mdss_cfg dpu_sm6125_cfg = {
+	.mdss_ver = &sm6125_mdss_ver,
 	.caps = &sm6125_dpu_caps,
 	.ubwc = &sm6125_ubwc_cfg,
 	.mdp = &sm6125_mdp,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index f8910dbc1952..893d1271fb71 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -390,7 +390,13 @@ static const struct dpu_perf_cfg sm8250_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
+static const struct dpu_mdss_version sm8250_mdss_ver = {
+	.core_major_ver = 6,
+	.core_minor_ver = 0,
+};
+
 const struct dpu_mdss_cfg dpu_sm8250_cfg = {
+	.mdss_ver = &sm8250_mdss_ver,
 	.caps = &sm8250_dpu_caps,
 	.ubwc = &sm8250_ubwc_cfg,
 	.mdp = &sm8250_mdp,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 8c046eacec7c..61118f648cbc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -204,7 +204,13 @@ static const struct dpu_perf_cfg sc7180_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
+static const struct dpu_mdss_version sc7180_mdss_ver = {
+	.core_major_ver = 6,
+	.core_minor_ver = 2,
+};
+
 const struct dpu_mdss_cfg dpu_sc7180_cfg = {
+	.mdss_ver = &sc7180_mdss_ver,
 	.caps = &sc7180_dpu_caps,
 	.ubwc = &sc7180_ubwc_cfg,
 	.mdp = &sc7180_mdp,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 473cdbace322..c0d7bb930e8a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -136,7 +136,13 @@ static const struct dpu_perf_cfg sm6115_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
+static const struct dpu_mdss_version sm6115_mdss_ver = {
+	.core_major_ver = 6,
+	.core_minor_ver = 3,
+};
+
 const struct dpu_mdss_cfg dpu_sm6115_cfg = {
+	.mdss_ver = &sm6115_mdss_ver,
 	.caps = &sm6115_dpu_caps,
 	.ubwc = &sm6115_ubwc_cfg,
 	.mdp = &sm6115_mdp,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index ac716c8dbd7f..11c50aa5034b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -207,7 +207,13 @@ static const struct dpu_perf_cfg sm6350_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
+static const struct dpu_mdss_version sm6350_mdss_ver = {
+	.core_major_ver = 6,
+	.core_minor_ver = 4,
+};
+
 const struct dpu_mdss_cfg dpu_sm6350_cfg = {
+	.mdss_ver = &sm6350_mdss_ver,
 	.caps = &sm6350_dpu_caps,
 	.ubwc = &sm6350_ubwc_cfg,
 	.mdp = &sm6350_mdp,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 7d9fdd807695..2182939bc026 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -126,7 +126,13 @@ static const struct dpu_perf_cfg qcm2290_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
+static const struct dpu_mdss_version qcm2290_mdss_ver = {
+	.core_major_ver = 6,
+	.core_minor_ver = 5,
+};
+
 const struct dpu_mdss_cfg dpu_qcm2290_cfg = {
+	.mdss_ver = &qcm2290_mdss_ver,
 	.caps = &qcm2290_dpu_caps,
 	.ubwc = &qcm2290_ubwc_cfg,
 	.mdp = &qcm2290_mdp,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index 5f36f9468853..f0c0aa90f82e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -146,7 +146,13 @@ static const struct dpu_perf_cfg sm6375_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
+static const struct dpu_mdss_version sm6375_mdss_ver = {
+	.core_major_ver = 6,
+	.core_minor_ver = 9,
+};
+
 const struct dpu_mdss_cfg dpu_sm6375_cfg = {
+	.mdss_ver = &sm6375_mdss_ver,
 	.caps = &sm6375_dpu_caps,
 	.ubwc = &sm6375_ubwc_cfg,
 	.mdp = &sm6375_mdp,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index b22e6b97c993..2460ced03610 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -383,7 +383,13 @@ static const struct dpu_perf_cfg sm8350_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
+static const struct dpu_mdss_version sm8350_mdss_ver = {
+	.core_major_ver = 7,
+	.core_minor_ver = 0,
+};
+
 const struct dpu_mdss_cfg dpu_sm8350_cfg = {
+	.mdss_ver = &sm8350_mdss_ver,
 	.caps = &sm8350_dpu_caps,
 	.ubwc = &sm8350_ubwc_cfg,
 	.mdp = &sm8350_mdp,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 4b2cc62b07ea..a8dea8f27c41 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -252,7 +252,13 @@ static const struct dpu_perf_cfg sc7280_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
+static const struct dpu_mdss_version sc7280_mdss_ver = {
+	.core_major_ver = 7,
+	.core_minor_ver = 2,
+};
+
 const struct dpu_mdss_cfg dpu_sc7280_cfg = {
+	.mdss_ver = &sc7280_mdss_ver,
 	.caps = &sc7280_dpu_caps,
 	.ubwc = &sc7280_ubwc_cfg,
 	.mdp = &sc7280_mdp,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index ec959f85ae2a..397fe01125dd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -445,7 +445,13 @@ static const struct dpu_perf_cfg sc8280xp_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
+static const struct dpu_mdss_version sc8280xp_mdss_ver = {
+	.core_major_ver = 8,
+	.core_minor_ver = 0,
+};
+
 const struct dpu_mdss_cfg dpu_sc8280xp_cfg = {
+	.mdss_ver = &sc8280xp_mdss_ver,
 	.caps = &sc8280xp_dpu_caps,
 	.ubwc = &sc8280xp_ubwc_cfg,
 	.mdp = &sc8280xp_mdp,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 98a4aaef94d2..90a8461911c8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -406,7 +406,13 @@ static const struct dpu_perf_cfg sm8450_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
+static const struct dpu_mdss_version sm8450_mdss_ver = {
+	.core_major_ver = 8,
+	.core_minor_ver = 1,
+};
+
 const struct dpu_mdss_cfg dpu_sm8450_cfg = {
+	.mdss_ver = &sm8450_mdss_ver,
 	.caps = &sm8450_dpu_caps,
 	.ubwc = &sm8450_ubwc_cfg,
 	.mdp = &sm8450_mdp,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 7de9eccf9181..c9252528136d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -420,7 +420,13 @@ static const struct dpu_perf_cfg sm8550_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
+static const struct dpu_mdss_version sm8550_mdss_ver = {
+	.core_major_ver = 9,
+	.core_minor_ver = 0,
+};
+
 const struct dpu_mdss_cfg dpu_sm8550_cfg = {
+	.mdss_ver = &sm8550_mdss_ver,
 	.caps = &sm8550_dpu_caps,
 	.ubwc = &sm8550_ubwc_cfg,
 	.mdp = &sm8550_mdp,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 1d150091da9c..98a04a39d333 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -746,6 +746,16 @@ struct dpu_perf_cdp_cfg {
 	bool wr_enable;
 };
 
+/**
+ * struct dpu_mdss_version - DPU's major and minor versions
+ * @core_major_ver: DPU core's major version
+ * @core_minor_ver: DPU core's minor version
+ */
+struct dpu_mdss_version {
+	u8 core_major_ver;
+	u8 core_minor_ver;
+};
+
 /**
  * struct dpu_perf_cfg - performance control settings
  * @max_bw_low         low threshold of maximum bandwidth (kbps)
@@ -796,8 +806,9 @@ struct dpu_perf_cfg {
 /**
  * struct dpu_mdss_cfg - information of MDSS HW
  * This is the main catalog data structure representing
- * this HW version. Contains number of instances,
- * register offsets, capabilities of the all MDSS HW sub-blocks.
+ * this HW version. Contains dpu's major and minor versions,
+ * number of instances, register offsets, capabilities of the
+ * all MDSS HW sub-blocks.
  *
  * @dma_formats        Supported formats for dma pipe
  * @cursor_formats     Supported formats for cursor pipe
@@ -805,6 +816,8 @@ struct dpu_perf_cfg {
  * @mdss_irqs:         Bitmap with the irqs supported by the target
  */
 struct dpu_mdss_cfg {
+	const struct dpu_mdss_version *mdss_ver;
+
 	const struct dpu_caps *caps;
 
 	const struct dpu_ubwc_cfg *ubwc;
-- 
2.40.1

