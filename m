Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF5370FD10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 May 2023 19:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236117AbjEXRqd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 May 2023 13:46:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236165AbjEXRqa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 May 2023 13:46:30 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8525410C1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 10:46:01 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34OEvxUo014271;
        Wed, 24 May 2023 17:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=A1a6jDnGA7SNFxcrtMVPxRVI3BxjNApTWwZnU6MS68M=;
 b=BFq3NabFM6dhnHXISIAmBj8oMnH894xyzSHVnR90e6x+V8MX1nD46/pXUQ3wFEDWthLw
 plinFbLuMTEOAnJuhJdFKIb0FgIEUgdFowzEbRSIfWyPsF5nTQqkVaZ69Xf2AKfmAtwg
 bqnyu2TrFD2LVl82p8+uP9ecDtWLvnSR2jYEXRcKbhgQYRm/iNx8CqWlWmfCQtfDx3F8
 JEc2AH3moQ66Cr0YvPWaFLqWHEJF2DaLhtSEIfF3NoF6BoBEeIXV15K1rXy7dkSKFbDM
 1Y6w3igweYuYEP9Ih6/urZxoS9uNUPUHGECrt0Gb/u2c/lShEoWMiDf2bLL+wKSCSypO fg== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qs9wesy94-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 24 May 2023 17:45:36 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34OHjZIs001190
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 24 May 2023 17:45:35 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 24 May 2023 10:45:35 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
Date:   Wed, 24 May 2023 10:45:16 -0700
Subject: [PATCH v14 3/9] drm/display/dsc: Add drm_dsc_get_bpp_int helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v14-3-bafc7be95691@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v14-0-bafc7be95691@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v14-0-bafc7be95691@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        "Daniel Vetter" <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, <dri-devel@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>,
        "Jessica Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684950334; l=1973;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=eiZOej2w9zQ5b6opXu5NDtkGz6oteCbOWDYUqGrdp8M=;
 b=WrsEnvBZNxdmmvPmObzqI/mk2tlL6vp2S5qXuasq7cm1o/pS5PP2T0YR88HGVAFsplYXyawj/
 GPdZQbn04umCqq+vr1LMPfhgw26yg0tOZO6M9Ws09vlEmj5FKXm6b2U
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jYCjYxH5cYNSt92UsdSJNZ34YoF18Uk8
X-Proofpoint-GUID: jYCjYxH5cYNSt92UsdSJNZ34YoF18Uk8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_11,2023-05-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=923 impostorscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305240146
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add helper to get the integer value of drm_dsc_config.bits_per_pixel

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/display/drm_dsc_helper.c | 13 +++++++++++++
 include/drm/display/drm_dsc_helper.h     |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
index b31fe9849784..4424380c6cb6 100644
--- a/drivers/gpu/drm/display/drm_dsc_helper.c
+++ b/drivers/gpu/drm/display/drm_dsc_helper.c
@@ -1436,6 +1436,19 @@ int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg)
 }
 EXPORT_SYMBOL(drm_dsc_compute_rc_parameters);
 
+/**
+ * drm_dsc_get_bpp_int() - Get integer bits per pixel value for the given DRM DSC config
+ * @vdsc_cfg: Pointer to DRM DSC config struct
+ *
+ * Return: Integer BPP value
+ */
+u32 drm_dsc_get_bpp_int(const struct drm_dsc_config *vdsc_cfg)
+{
+	WARN_ON_ONCE(vdsc_cfg->bits_per_pixel & 0xf);
+	return vdsc_cfg->bits_per_pixel >> 4;
+}
+EXPORT_SYMBOL(drm_dsc_get_bpp_int);
+
 /**
  * drm_dsc_initial_scale_value() - Calculate the initial scale value for the given DSC config
  * @dsc: Pointer to DRM DSC config struct
diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
index f4e18e5d077a..913aa2071232 100644
--- a/include/drm/display/drm_dsc_helper.h
+++ b/include/drm/display/drm_dsc_helper.h
@@ -27,6 +27,7 @@ int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params
 int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
 u8 drm_dsc_initial_scale_value(const struct drm_dsc_config *dsc);
 u32 drm_dsc_flatness_det_thresh(const struct drm_dsc_config *dsc);
+u32 drm_dsc_get_bpp_int(const struct drm_dsc_config *vdsc_cfg);
 
 #endif /* _DRM_DSC_HELPER_H_ */
 

-- 
2.40.1

