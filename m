Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15B5B707558
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 00:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbjEQW1h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 18:27:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjEQW1d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 18:27:33 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73B9B5B84
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 15:27:32 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34HM8PCA001899;
        Wed, 17 May 2023 22:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=a7B0ayGIh8OzYClD/n9CcobgsgRTzEzQ4uODoawXCl8=;
 b=liNeFnrGtGPi4eR+S35JQMQlmuWnqCl/lcbSBIol0d6xvWfbnj+orQRIvahihywirEny
 gpSwdRbncBSU0I8p7Ax8Z7shW8Si/vaQwDfFuNj0oTtJ3vTE0SEn24lsQlE7YTnz3Vv2
 RagI0O1anwB8ECvoMpdwVN3CzwPLdfPojQpqGpZMWtOqa3OMmqbQtWE7hlupYQ8CwmiC
 Hs07L7rhuI8RIJWEpueK+dTEFoqZWaBxiyJyuSIM9V8vau93FaB4aXV7CPPH1aPxnkqw
 y5C1yDvruWDtFkL7v+LeTqIe+Tp9meyJuRilXA9RfPXYWAoGf8DgcS8S6RlRRfhk9m+b 2g== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qmcc63hb1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 May 2023 22:27:25 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34HMRPPR029254
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 May 2023 22:27:25 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 17 May 2023 15:27:24 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
Date:   Wed, 17 May 2023 15:27:14 -0700
Subject: [PATCH v12 1/9] drm/display/dsc: Add flatness and initial scale
 value calculations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v12-1-9cdb7401f614@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v12-0-9cdb7401f614@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v12-0-9cdb7401f614@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        "Daniel Vetter" <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, <dri-devel@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684362444; l=1178;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=HBLjkYM0NIQaOe9ib9DOZITFLYC9xanJfw8kq+YKhqk=;
 b=fXb9kf522h5cDSRYUcBiopEy8Z4H/kQW13oq1cvL1kHj3/6TjzQMYTGcRK918O9Wjl2JS6INN
 PteIZs3+b1WBbsu2gOYdoRZIpKdeP1gHQopfvjZaCZoP+HneoxVgu8s
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XCAKxHZwd9mjTvDkg_YxQ20hfTTaLCdF
X-Proofpoint-ORIG-GUID: XCAKxHZwd9mjTvDkg_YxQ20hfTTaLCdF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_04,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305170185
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add helpers to calculate det_thresh_flatness and initial_scale_value as
these calculations are defined within the DSC spec.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 include/drm/display/drm_dsc_helper.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
index fc2104415dcb..753b0034eda7 100644
--- a/include/drm/display/drm_dsc_helper.h
+++ b/include/drm/display/drm_dsc_helper.h
@@ -25,5 +25,15 @@ void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
 int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_type type);
 int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
 
+static inline u8 drm_dsc_initial_scale_value(const struct drm_dsc_config *dsc)
+{
+	return 8 * dsc->rc_model_size / (dsc->rc_model_size - dsc->initial_offset);
+}
+
+static inline u32 drm_dsc_flatness_det_thresh(const struct drm_dsc_config *dsc)
+{
+	return 2 << (dsc->bits_per_component - 8);
+}
+
 #endif /* _DRM_DSC_HELPER_H_ */
 

-- 
2.40.1

