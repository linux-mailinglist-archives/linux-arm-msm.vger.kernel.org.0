Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEE7B64C695
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Dec 2022 11:07:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238107AbiLNKGv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Dec 2022 05:06:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238001AbiLNKGo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Dec 2022 05:06:44 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B98F1A3B5;
        Wed, 14 Dec 2022 02:06:33 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BE3fhfM021078;
        Wed, 14 Dec 2022 10:06:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=WMiXTUhsANyKwtU1kgDcixY5iL4SEDlcQ33BndswIII=;
 b=SterlQ3db2+HQTxmF3yU2cU4S7hJy/xQzRsuTUlv7wmQT1u3qwLWzIpBDyPBc3oSdQG+
 YdMpTS11SYa/181RDaTbe8hrD+3ftZR2ewHwMjIRU6WhJgFsDiKDB4rAmm8vY0D6OEUj
 Kad917OumN6EEaBPQnitgRGfFTF8Zai+2RIp/jsur0jNTF11K0ZDJP1N/0TSywjnQnsm
 xtMESpGHkNoN6N2Du3Bc9B6atvfROLemMmAS78cvW80Q00qzRdHl5XqqBoA9XQqDudum
 A3Wsqg2SvfRsL1G7pK50IrprfascWjJdJG/20nrYv4EV22wMg8g+iZIJLcK68Re0CDA+ WA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mf6re8ppq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 14 Dec 2022 10:06:27 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BEA6Qti023259
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 14 Dec 2022 10:06:26 GMT
Received: from vpolimer-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 14 Dec 2022 02:06:21 -0800
From:   Vinod Polimera <quic_vpolimer@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>
CC:     Vinod Polimera <quic_vpolimer@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <robdclark@gmail.com>,
        <dianders@chromium.org>, <swboyd@chromium.org>,
        <quic_kalyant@quicinc.com>, <dmitry.baryshkov@linaro.org>,
        <quic_khsieh@quicinc.com>, <quic_vproddut@quicinc.com>,
        <quic_bjorande@quicinc.com>, <quic_aravindh@quicinc.com>,
        <quic_abhinavk@quicinc.com>, <quic_sbillaka@quicinc.com>
Subject: [PATCH v9 02/15] drm: add helper functions to retrieve old and new crtc
Date:   Wed, 14 Dec 2022 15:35:39 +0530
Message-ID: <1671012352-1825-3-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1671012352-1825-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1671012352-1825-1-git-send-email-quic_vpolimer@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ETTnduFy_8NkCVdyXXZ22XNd1v89ywSW
X-Proofpoint-ORIG-GUID: ETTnduFy_8NkCVdyXXZ22XNd1v89ywSW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-14_04,2022-12-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=763 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212140079
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add new helper functions, drm_atomic_get_old_crtc_for_encoder
and drm_atomic_get_new_crtc_for_encoder to retrieve the
corresponding crtc for the encoder.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/drm_atomic.c | 60 ++++++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_atomic.h     |  7 ++++++
 2 files changed, 67 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index f197f59..941fd6d 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -985,6 +985,66 @@ drm_atomic_get_new_connector_for_encoder(struct drm_atomic_state *state,
 EXPORT_SYMBOL(drm_atomic_get_new_connector_for_encoder);
 
 /**
+ * drm_atomic_get_old_crtc_for_encoder - Get old crtc for an encoder
+ * @state: Atomic state
+ * @encoder: The encoder to fetch the crtc state for
+ *
+ * This function finds and returns the crtc that was connected to @encoder
+ * as specified by the @state.
+ *
+ * Returns: The old crtc connected to @encoder, or NULL if the encoder is
+ * not connected.
+ */
+struct drm_crtc *
+drm_atomic_get_old_crtc_for_encoder(struct drm_atomic_state *state,
+				    struct drm_encoder *encoder)
+{
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
+
+	connector = drm_atomic_get_old_connector_for_encoder(state, encoder);
+	if (!connector)
+		return NULL;
+
+	conn_state = drm_atomic_get_old_connector_state(state, connector);
+	if (!conn_state)
+		return NULL;
+
+	return conn_state->crtc;
+}
+EXPORT_SYMBOL(drm_atomic_get_old_crtc_for_encoder);
+
+/**
+ * drm_atomic_get_new_crtc_for_encoder - Get new crtc for an encoder
+ * @state: Atomic state
+ * @encoder: The encoder to fetch the crtc state for
+ *
+ * This function finds and returns the crtc that will be connected to @encoder
+ * as specified by the @state.
+ *
+ * Returns: The new crtc connected to @encoder, or NULL if the encoder is
+ * not connected.
+ */
+struct drm_crtc *
+drm_atomic_get_new_crtc_for_encoder(struct drm_atomic_state *state,
+				    struct drm_encoder *encoder)
+{
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
+
+	connector = drm_atomic_get_new_connector_for_encoder(state, encoder);
+	if (!connector)
+		return NULL;
+
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (!conn_state)
+		return NULL;
+
+	return conn_state->crtc;
+}
+EXPORT_SYMBOL(drm_atomic_get_new_crtc_for_encoder);
+
+/**
  * drm_atomic_get_connector_state - get connector state
  * @state: global atomic state object
  * @connector: connector to get state object for
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 10b1990..fdbd656 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -528,6 +528,13 @@ struct drm_connector *
 drm_atomic_get_new_connector_for_encoder(struct drm_atomic_state *state,
 					 struct drm_encoder *encoder);
 
+struct drm_crtc *
+drm_atomic_get_old_crtc_for_encoder(struct drm_atomic_state *state,
+					 struct drm_encoder *encoder);
+struct drm_crtc *
+drm_atomic_get_new_crtc_for_encoder(struct drm_atomic_state *state,
+					 struct drm_encoder *encoder);
+
 /**
  * drm_atomic_get_existing_crtc_state - get CRTC state, if it exists
  * @state: global atomic state object
-- 
2.7.4

