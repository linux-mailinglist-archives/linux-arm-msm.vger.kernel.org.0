Return-Path: <linux-arm-msm+bounces-20014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CD79A8C8E9B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 May 2024 01:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8B98B20A02
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 23:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A680E1411D8;
	Fri, 17 May 2024 23:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F4UT8TTr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1523721373;
	Fri, 17 May 2024 23:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715989104; cv=none; b=G4J82nnrkauEg18qofRlcTLSqzZp2ig8uGnH6XVjE4IDf1a4FaTrIPigedLTqU53HjTdcR9vu6e6vqeuUBIiaXKX9jIl5vm30Ru9sEJp67O2afn17lmRBYr2+hEVUQyHN9o1BNtg23psstCS1VT393EWaOPvisJAvXCBaWyDDh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715989104; c=relaxed/simple;
	bh=7Z0hd8gMVwETlvpFubrYKupvU3aDqQQdhXmZ5V+apZw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rcZ3EKvlsfb61uGyyGuGYiqQweW8KNaXX6LQQKLGpI/d7zn6KvhLnQD5PcNh2QrJUiAzsSVandUaBRqXu+PcbvwEpVXdKx9kpg+WzOKesWpdg31PslPPTbTvk1Vgy6QPDPwGY6ydZU2wX6/5d2qJeNKBstS/6GhKRmvu4KiEIvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F4UT8TTr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44HI0dwC014256;
	Fri, 17 May 2024 23:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=UcTAQeJAbUmaz0Egw29a72Y6nLLIJr98LFms+WVPNYI=; b=F4
	UT8TTrCnmldBt56JPNyk0lrdm6XUFcWUM0HzyCwr7WvhlgXOzKoclE0xFT0/xjRJ
	HQGVgwdJeB+7VBlEUUhv5mdAf7EzNZxTzVU+WS8VSm+yt11Ju9/ZwBS9oRFJLisB
	yM9rHNHoTsjNaqz/RxrUySR+tBEivEqK667LZ1x8WVBzptTg8sz6MuVp+HZhY82e
	1THrTEkuy1cJf1UN+w0X5ZtKE8y1ofVYuQhtH9QoIFy6+9q7fjF6wwOCFLr+kFPR
	7OPlxUQjj2u6Jnkv4aV8jItZQkXquqt/PcNBQahhNRi9vvme0awBh6Ma+XASdjqp
	MaTLut3+zDkYzIGyJUmw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y2125qe2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 23:38:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44HNcBe7006584
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 23:38:11 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 17 May 2024 16:38:11 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <dianders@chromium.org>,
        <quic_jesszhan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 1/4] drm/msm: register a fault handler for display mmu faults
Date: Fri, 17 May 2024 16:37:56 -0700
Message-ID: <20240517233801.4071868-2-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240517233801.4071868-1-quic_abhinavk@quicinc.com>
References: <20240517233801.4071868-1-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YMqC9xMwEsDHwtiNuFoNmJgO9-l6pWjb
X-Proofpoint-ORIG-GUID: YMqC9xMwEsDHwtiNuFoNmJgO9-l6pWjb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-17_11,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405170184

In preparation to register a iommu fault handler for display
related modules, register a fault handler for the backing
mmu object of msm_kms.

Currently, the fault handler only captures the display snapshot
but we can expand this later if more information needs to be
added to debug display mmu faults.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/msm_kms.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index af6a6fcb1173..62c8e6163e81 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -200,6 +200,28 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
 	return aspace;
 }
 
+static int msm_kms_fault_handler(void *arg, unsigned long iova, int flags, void *data)
+{
+	struct msm_kms *kms = arg;
+	struct msm_disp_state *state;
+	int ret;
+
+	ret = mutex_lock_interruptible(&kms->dump_mutex);
+	if (ret)
+		return ret;
+
+	state = msm_disp_snapshot_state_sync(kms);
+
+	mutex_unlock(&kms->dump_mutex);
+
+	if (IS_ERR(state)) {
+		DRM_DEV_ERROR(kms->dev->dev, "failed to capture snapshot\n");
+		return PTR_ERR(state);
+	}
+
+	return 0;
+}
+
 void msm_drm_kms_uninit(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -261,6 +283,9 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 		goto err_msm_uninit;
 	}
 
+	if (kms->aspace)
+		msm_mmu_set_fault_handler(kms->aspace->mmu, kms, msm_kms_fault_handler);
+
 	drm_helper_move_panel_connectors_to_head(ddev);
 
 	drm_for_each_crtc(crtc, ddev) {
-- 
2.44.0


