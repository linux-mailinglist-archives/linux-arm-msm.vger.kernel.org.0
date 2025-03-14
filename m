Return-Path: <linux-arm-msm+bounces-51350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAF9A608B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 07:00:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 938E116C090
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 06:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 638FB15667B;
	Fri, 14 Mar 2025 06:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KDJFY7vg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BD715B984
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 06:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741932008; cv=none; b=A55dDV+Z97PjDPtqipPXSjDvJf0EPZROIXlEUDAmZIhEEZYFl/37aGv2CQGg0NNuR20iiH2Fe38YPSZTdV09198bUbh5NbubRxmYZUFJu6QGZEPguuzlP2bgYUrrnMVEz9sC3s5zyKEHjhuIxLKLCzFxgHS40WcCpH4DeSQgImw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741932008; c=relaxed/simple;
	bh=PRGKIea3IlpKbk68rroWTZLt3foX0024PS9zHngAeL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cKDS0OeaSChcQ5ILFxOThlkcPcRSOR3OVTotJ2XFLEAjq/s22sTLMAScbdiwBH9XTRaD1vEPT0b9Oz19nk8GqMILzsrb0V/U+2ENvzqbb74FTALnJC2yNyetITxNRKikc7XtF4RwVfWSsD4CJIiAziLZwvMEWIZhyW1q5Q5PEPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KDJFY7vg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DKdIbj015977
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 06:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xwh0kAnHT7FdNhb96gdjp7PUruv4t4YUK908RVrCz7k=; b=KDJFY7vgLmFnHksr
	JiiA303xG/V2xt9VWrXzg1Fkve33dle/iq87SiehFh7DbqVAgcOdNvWO2k44FIuX
	ZtgH4uhk6zorcYH5B8d0YQmfeaVjTFMKl5J0eHxiW+ZvgJM2Wp4zDAEDjWkBlwCk
	xrf2HWwyYn4MwNzB6NuNzJCDhvpSQF1RtjxJQsOci3xzqN3HA3rALJXhWjWtpSlx
	pzyX07jGV9ZwUFw3qlcXAnzLLa6IsRwB04kdUsfM+2ILPgXtfzIqX+enl4RbVHde
	ZxXIA6ULz2iDikBc1DRI5WJKbTWoHNal2I9cmdxDW7dMQnVV8huxQ11MqpRwK1C7
	Np2AaQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2p06g6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 06:00:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4768656f608so35084101cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 23:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741932004; x=1742536804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwh0kAnHT7FdNhb96gdjp7PUruv4t4YUK908RVrCz7k=;
        b=TY081JC1c8QxiV4/HbQYe/FRVz76gDGXf9ABb55le1jDTw9F3WwKkYRmHuw2TC3Hvv
         ksD9z3YqQrgAqiK6ywOsESiRkBMVhIcafdziPRxdWCvfmyZmpnxGAIHTxmGysFKzjMrc
         0WpWNx/V8SncRpgGi/nLIRuWmUoS5cloB7nY0TMFX5cEo/kuGy7q5hhxVQJLwIvfjBj4
         RmnP3Muv0glKmWfFMhMGhCzT5Bel+nYhe10eXLp9vpb8acYnT9aqQVot2Lhv5/V/CfLL
         7dIpBRzfVXwTsCTc5ae3KBYIxTaze5mt58r9D4Obc1zpYYJMOYzpLCiruXoZyzNbW4il
         scwg==
X-Forwarded-Encrypted: i=1; AJvYcCXHAQRjh0CtwpYTl7Wsx2XCXYDhhEwY4lxAIDGq/kZtv2IIf5d1qA2/ngCpkqTNlFkyza1b4+dertprvrEt@vger.kernel.org
X-Gm-Message-State: AOJu0YxzbgLDCtdR45ZTkcJNYdcZew4EBzKYmkxjo4Tswgtm9F85NA/A
	ojWWcNTNjNA+4G1l+ghTEbB2Pj/Vz6uLJBb1zu5rwXqBagLOoEKPq/Tn3yIs2WcsO5Rtvlo61Td
	/RLQ/CA+uPHrgb7svNB268ZIKMJ5/yIkqegcOhqhxlsDGWu/2ngTMDhK9CpiH/fsV
X-Gm-Gg: ASbGncs6jWZLKvFJhYEus8v5Sm6ucZ33D4WmK1PIzHI16oyOUHd2MbRBwGfN4SDGDVV
	4bowAUwwbfWYt1cgF07OMaloiWDSWvilg3Iz+bSSAYqo7L39vYga4YDvwDoP/rcV3yWiRIlWhck
	EKuHtf3MlomOkSdWgKJwm6NJfjWZ/nycpYWvi6t2RXSuAhSysISpMuzX5JmgpWa8bN0ccqL+VPf
	KQArnLGt1o9Tui3kazv5HNCJit6an8jnmx4ipKemzGhSvdzDODN1Vn08eE8V5zs0z4099e621xg
	a6Ifm++l9hOfToHpCfqSMogglUVcxshKpAqbLlbbTvR7I5S0QC+JmqAxJMsqeS8gu9rc0hkbYbT
	8nnb8ZFwiUnHTUnSubyCAkdNBARer
X-Received: by 2002:a05:622a:1116:b0:476:8960:d1a3 with SMTP id d75a77b69052e-476c813ade5mr19140481cf.14.1741932004302;
        Thu, 13 Mar 2025 23:00:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7W2OQ7A9S8YCLXKW598exLMciYwyh7aYTDa8T9i+XTPgfRVoKtUUfUUMEljyBOSYXIsoNng==
X-Received: by 2002:a05:622a:1116:b0:476:8960:d1a3 with SMTP id d75a77b69052e-476c813ade5mr19140091cf.14.1741932003867;
        Thu, 13 Mar 2025 23:00:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba88332dsm416136e87.181.2025.03.13.23.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 23:00:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 07:59:43 +0200
Subject: [PATCH RFC v4 2/6] drm/display: dp: change
 drm_dp_dpcd_read_link_status() return value
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-drm-rework-dpcd-access-v4-2-e86ef6fc6d76@oss.qualcomm.com>
References: <20250314-drm-rework-dpcd-access-v4-0-e86ef6fc6d76@oss.qualcomm.com>
In-Reply-To: <20250314-drm-rework-dpcd-access-v4-0-e86ef6fc6d76@oss.qualcomm.com>
To: Lyude Paul <lyude@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10619;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XBxhw4jfP8Ib9Agf9heZOk6AB5nizhAMmuxM/unOe1k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn08XZrrhr+hcfA8QE/UFPAhqQppqvI+igpL/x9
 ErT7DACxb+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9PF2QAKCRCLPIo+Aiko
 1UggB/wPAlK8HEjL0DhPPOk5/KF/hAZsSWAV9nnvVfzWxVQP5y2ILu9sXmS3c7nW+r77goT4Fi4
 ZZFpZJvsI8AejPJRT8EzuzJO8Slz0u8n/4vI0n+B19AUGotXL8d0MH2/iI4Somf0LWyp8AcowJQ
 4nbQmbMxIhZCVKAZme71TkAmFEvnhFofAjhodXKsvfbk18zJ+9DELVYgCQKg3h+9km6U81Z1CXp
 zR7gIGkAWkgcHANYhl5dSyLv7rTMF3PVrFNpHl4kSQYp2lQ68bHnbpF5LrqAbhXPWbU1nqB+Ci2
 P2SAAvREoyrOr2QfA2631mb8A4ugGeHKJGAuQKwnH6kHGWNP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Q7X-OnPXzTXr7gpERjQUOTz9rZMxBZqp
X-Authority-Analysis: v=2.4 cv=ZObXmW7b c=1 sm=1 tr=0 ts=67d3c5e5 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=QyXUC8HyAAAA:8 a=20KFwNOVAAAA:8 a=SwUNW72u-79MlN5x3aoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Q7X-OnPXzTXr7gpERjQUOTz9rZMxBZqp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_02,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140045

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

drm_dp_dpcd_read_link_status() follows the "return error code or number
of bytes read" protocol, with the code returning less bytes than
requested in case of some errors. However most of the drivers
interpreted that as "return error code in case of any error". Switch
drm_dp_dpcd_read_link_status() to drm_dp_dpcd_read_data() and make it
follow that protocol too.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/atombios_dp.c           |  8 ++++----
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |  2 +-
 drivers/gpu/drm/display/drm_dp_helper.c            |  7 +++----
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c       |  4 ++--
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 24 +++++-----------------
 drivers/gpu/drm/msm/dp/dp_link.c                   | 18 ++++++++--------
 drivers/gpu/drm/radeon/atombios_dp.c               |  8 ++++----
 7 files changed, 28 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
index 521b9faab18059ed92ebb1dc9a9847e8426e7403..492813ab1b54197ba842075bc2909984c39bd5c1 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
@@ -458,8 +458,8 @@ bool amdgpu_atombios_dp_needs_link_train(struct amdgpu_connector *amdgpu_connect
 	u8 link_status[DP_LINK_STATUS_SIZE];
 	struct amdgpu_connector_atom_dig *dig = amdgpu_connector->con_priv;
 
-	if (drm_dp_dpcd_read_link_status(&amdgpu_connector->ddc_bus->aux, link_status)
-	    <= 0)
+	if (drm_dp_dpcd_read_link_status(&amdgpu_connector->ddc_bus->aux,
+					 link_status) < 0)
 		return false;
 	if (drm_dp_channel_eq_ok(link_status, dig->dp_lane_count))
 		return false;
@@ -616,7 +616,7 @@ amdgpu_atombios_dp_link_train_cr(struct amdgpu_atombios_dp_link_train_info *dp_i
 		drm_dp_link_train_clock_recovery_delay(dp_info->aux, dp_info->dpcd);
 
 		if (drm_dp_dpcd_read_link_status(dp_info->aux,
-						 dp_info->link_status) <= 0) {
+						 dp_info->link_status) < 0) {
 			DRM_ERROR("displayport link status failed\n");
 			break;
 		}
@@ -681,7 +681,7 @@ amdgpu_atombios_dp_link_train_ce(struct amdgpu_atombios_dp_link_train_info *dp_i
 		drm_dp_link_train_channel_eq_delay(dp_info->aux, dp_info->dpcd);
 
 		if (drm_dp_dpcd_read_link_status(dp_info->aux,
-						 dp_info->link_status) <= 0) {
+						 dp_info->link_status) < 0) {
 			DRM_ERROR("displayport link status failed\n");
 			break;
 		}
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 81fad14c2cd598045d989c7d51f292bafb92c144..8d5420a5b691180c4d051a450d5d3d869a558d1a 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2305,7 +2305,7 @@ static int cdns_mhdp_update_link_status(struct cdns_mhdp_device *mhdp)
 		 * If everything looks fine, just return, as we don't handle
 		 * DP IRQs.
 		 */
-		if (ret > 0 &&
+		if (!ret &&
 		    drm_dp_channel_eq_ok(status, mhdp->link.num_lanes) &&
 		    drm_dp_clock_recovery_ok(status, mhdp->link.num_lanes))
 			goto out;
diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index e43a8f4a252dae22eeaae1f4ca94da064303033d..410be0be233ad94702af423262a7d98e21afbfeb 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -778,14 +778,13 @@ EXPORT_SYMBOL(drm_dp_dpcd_write);
  * @aux: DisplayPort AUX channel
  * @status: buffer to store the link status in (must be at least 6 bytes)
  *
- * Returns the number of bytes transferred on success or a negative error
- * code on failure.
+ * Returns a negative error code on failure or 0 on success.
  */
 int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
 				 u8 status[DP_LINK_STATUS_SIZE])
 {
-	return drm_dp_dpcd_read(aux, DP_LANE0_1_STATUS, status,
-				DP_LINK_STATUS_SIZE);
+	return drm_dp_dpcd_read_data(aux, DP_LANE0_1_STATUS, status,
+				     DP_LINK_STATUS_SIZE);
 }
 EXPORT_SYMBOL(drm_dp_dpcd_read_link_status);
 
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
index f6355c16cc0ab2e28408ab8a7246f4ca17710456..a3b78b0fd53ef854a54edf40fb333766da88f1c6 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
@@ -188,7 +188,7 @@ static int hibmc_dp_link_training_cr(struct hibmc_dp_dev *dp)
 		drm_dp_link_train_clock_recovery_delay(&dp->aux, dp->dpcd);
 
 		ret = drm_dp_dpcd_read_link_status(&dp->aux, lane_status);
-		if (ret != DP_LINK_STATUS_SIZE) {
+		if (ret) {
 			drm_err(dp->dev, "Get lane status failed\n");
 			return ret;
 		}
@@ -236,7 +236,7 @@ static int hibmc_dp_link_training_channel_eq(struct hibmc_dp_dev *dp)
 		drm_dp_link_train_channel_eq_delay(&dp->aux, dp->dpcd);
 
 		ret = drm_dp_dpcd_read_link_status(&dp->aux, lane_status);
-		if (ret != DP_LINK_STATUS_SIZE) {
+		if (ret) {
 			drm_err(dp->dev, "get lane status failed\n");
 			break;
 		}
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index d8633a596f8da88cc55f60de80bec8999ffb07c8..69a26bb5fabd1c3077573ad5a1183ee69cf3b8cd 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1100,20 +1100,6 @@ static bool msm_dp_ctrl_train_pattern_set(struct msm_dp_ctrl_private *ctrl,
 	return ret == 1;
 }
 
-static int msm_dp_ctrl_read_link_status(struct msm_dp_ctrl_private *ctrl,
-				    u8 *link_status)
-{
-	int ret = 0, len;
-
-	len = drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
-	if (len != DP_LINK_STATUS_SIZE) {
-		DRM_ERROR("DP link status read failed, err: %d\n", len);
-		ret = -EINVAL;
-	}
-
-	return ret;
-}
-
 static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
 			int *training_step)
 {
@@ -1140,7 +1126,7 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
 	for (tries = 0; tries < maximum_retries; tries++) {
 		drm_dp_link_train_clock_recovery_delay(ctrl->aux, ctrl->panel->dpcd);
 
-		ret = msm_dp_ctrl_read_link_status(ctrl, link_status);
+		ret = drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
 		if (ret)
 			return ret;
 
@@ -1252,7 +1238,7 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
 	for (tries = 0; tries <= maximum_retries; tries++) {
 		drm_dp_link_train_channel_eq_delay(ctrl->aux, ctrl->panel->dpcd);
 
-		ret = msm_dp_ctrl_read_link_status(ctrl, link_status);
+		ret = drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
 		if (ret)
 			return ret;
 
@@ -1805,7 +1791,7 @@ static bool msm_dp_ctrl_channel_eq_ok(struct msm_dp_ctrl_private *ctrl)
 	u8 link_status[DP_LINK_STATUS_SIZE];
 	int num_lanes = ctrl->link->link_params.num_lanes;
 
-	msm_dp_ctrl_read_link_status(ctrl, link_status);
+	drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
 
 	return drm_dp_channel_eq_ok(link_status, num_lanes);
 }
@@ -1863,7 +1849,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 			if (!msm_dp_catalog_link_is_connected(ctrl->catalog))
 				break;
 
-			msm_dp_ctrl_read_link_status(ctrl, link_status);
+			drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
 
 			rc = msm_dp_ctrl_link_rate_down_shift(ctrl);
 			if (rc < 0) { /* already in RBR = 1.6G */
@@ -1888,7 +1874,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 			if (!msm_dp_catalog_link_is_connected(ctrl->catalog))
 				break;
 
-			msm_dp_ctrl_read_link_status(ctrl, link_status);
+			drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
 
 			if (!drm_dp_clock_recovery_ok(link_status,
 					ctrl->link->link_params.num_lanes))
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 1a1fbb2d7d4f2afcaace85d97b744d03017d37ce..92a9077959b3ec10c2a529db1a0e9fb3562aa5d3 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -714,21 +714,21 @@ static int msm_dp_link_parse_request(struct msm_dp_link_private *link)
 
 static int msm_dp_link_parse_sink_status_field(struct msm_dp_link_private *link)
 {
-	int len;
+	int ret;
 
 	link->prev_sink_count = link->msm_dp_link.sink_count;
-	len = drm_dp_read_sink_count(link->aux);
-	if (len < 0) {
+	ret = drm_dp_read_sink_count(link->aux);
+	if (ret < 0) {
 		DRM_ERROR("DP parse sink count failed\n");
-		return len;
+		return ret;
 	}
-	link->msm_dp_link.sink_count = len;
+	link->msm_dp_link.sink_count = ret;
 
-	len = drm_dp_dpcd_read_link_status(link->aux,
-		link->link_status);
-	if (len < DP_LINK_STATUS_SIZE) {
+	ret = drm_dp_dpcd_read_link_status(link->aux,
+					   link->link_status);
+	if (ret < 0) {
 		DRM_ERROR("DP link status read failed\n");
-		return len;
+		return ret;
 	}
 
 	return msm_dp_link_parse_request(link);
diff --git a/drivers/gpu/drm/radeon/atombios_dp.c b/drivers/gpu/drm/radeon/atombios_dp.c
index fa78824931cc428b1f9e23fe8f98867136ef9883..3f3c360dce4bcf2c87a6c7adbbf7a727a4f8eb4c 100644
--- a/drivers/gpu/drm/radeon/atombios_dp.c
+++ b/drivers/gpu/drm/radeon/atombios_dp.c
@@ -501,8 +501,8 @@ bool radeon_dp_needs_link_train(struct radeon_connector *radeon_connector)
 	u8 link_status[DP_LINK_STATUS_SIZE];
 	struct radeon_connector_atom_dig *dig = radeon_connector->con_priv;
 
-	if (drm_dp_dpcd_read_link_status(&radeon_connector->ddc_bus->aux, link_status)
-	    <= 0)
+	if (drm_dp_dpcd_read_link_status(&radeon_connector->ddc_bus->aux,
+					 link_status) < 0)
 		return false;
 	if (drm_dp_channel_eq_ok(link_status, dig->dp_lane_count))
 		return false;
@@ -678,7 +678,7 @@ static int radeon_dp_link_train_cr(struct radeon_dp_link_train_info *dp_info)
 		drm_dp_link_train_clock_recovery_delay(dp_info->aux, dp_info->dpcd);
 
 		if (drm_dp_dpcd_read_link_status(dp_info->aux,
-						 dp_info->link_status) <= 0) {
+						 dp_info->link_status) < 0) {
 			DRM_ERROR("displayport link status failed\n");
 			break;
 		}
@@ -741,7 +741,7 @@ static int radeon_dp_link_train_ce(struct radeon_dp_link_train_info *dp_info)
 		drm_dp_link_train_channel_eq_delay(dp_info->aux, dp_info->dpcd);
 
 		if (drm_dp_dpcd_read_link_status(dp_info->aux,
-						 dp_info->link_status) <= 0) {
+						 dp_info->link_status) < 0) {
 			DRM_ERROR("displayport link status failed\n");
 			break;
 		}

-- 
2.39.5


