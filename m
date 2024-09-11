Return-Path: <linux-arm-msm+bounces-31475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F73A974F4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 12:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2483288349
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 10:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA311822F8;
	Wed, 11 Sep 2024 10:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nk3a5Nyo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FFF177992;
	Wed, 11 Sep 2024 10:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726049324; cv=none; b=eYlSb60CzF3tZSyMBz/xdQt7m5sBaRy3RKENO/FHFrvtdIyaqFCcDAfUf7VckPoz666vKAsS5h2g72NH8JSrDKhnAiemmyXJfzJ3VCDeqh1PGENqvQ8G4jrJQiV4XnhnLspxOr353aTQDeWrPDWgi9bZRJPnp0M3pXCXBSc1BS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726049324; c=relaxed/simple;
	bh=O3u1KO8LP7ny9ypAxDoTer6X+YBCNfOlTv7W7Ejrq7U=;
	h=From:To:Cc:Subject:Date:Message-Id; b=n7S9RA38mP1fZOHm9bH0dofwMtB8PN0qS3g7NYLwjWQG5Qa+jiI2DJ8sHOAYxN3JSr3WemNMfbhSd0sgMcx5cMv2KOTtZO6G8jegeAfNwrU46F5BXSLw3nXp+S6t+POsr8KCkwg7Z/iuhsYRoFYJUINXhXUEJSqnWnp7bBdb0Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nk3a5Nyo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B34BF6026623;
	Wed, 11 Sep 2024 10:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=BnFL1zK5XWvi
	VNBAS8D8GPwgrAIwcxsVLA3NzuLEKeU=; b=nk3a5NyoNxQyzioLgaBV437lbTb/
	HeCkbaYlWRxbpDdOudL+hPed23XJEtgkkcIx6K6nAAuBwV73j5qEIMbQBz9uqPee
	VQXEdCZ0/9dCV2Q+qXGnU0Bdon1pXnddVFVVdLFKGC22K2ZxiO5t2isGMQRQtN5p
	CjX3xpS5a0srfxmJVGmSGdW4WMEzZ0MH8/8g46Mh0FlLE4lzcdzydbGLptbqDiQP
	onj4g0Hx6uGE7maAYn30ooI4NmIE2134dKZdxbTQQXfl+X6plNHSLe0Wo7VTTnOU
	zNVduhUxo246janN7aSLDMDjM1svJXAeJ3NFrPVVCjyJLwLOC0ybmR+OxQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy7317jq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 10:08:25 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 48BA8LBH019432;
	Wed, 11 Sep 2024 10:08:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 41h168s1sv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 11 Sep 2024 10:08:21 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 48BA8Knn019405;
	Wed, 11 Sep 2024 10:08:20 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-mukhopad-hyd.qualcomm.com [10.147.244.250])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 48BA8Kro019400;
	Wed, 11 Sep 2024 10:08:20 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 3978529)
	id 8B4E35000A9; Wed, 11 Sep 2024 15:38:18 +0530 (+0530)
From: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, simona@ffwll.ch, dmitry.baryshkov@linaro.org,
        abel.vesa@linaro.org, robdclark@gmail.com, quic_abhinavk@quicinc.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_khsieh@quicinc.com, konrad.dybcio@linaro.org,
        quic_parellan@quicinc.com, quic_bjorande@quicinc.com
Cc: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        quic_riteshk@quicinc.com, quic_vproddut@quicinc.com
Subject: [PATCH 0/5] Add support for DisplayPort on SA8775P platform
Date: Wed, 11 Sep 2024 15:38:08 +0530
Message-Id: <20240911100813.338-1-quic_mukhopad@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4YNpG4g-x2O0KIkVy0afdD7WbAKQ5_vI
X-Proofpoint-GUID: 4YNpG4g-x2O0KIkVy0afdD7WbAKQ5_vI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409110075
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

This series adds support for the DisplayPort controller
and eDP PHY v5 found on the Qualcomm SA8775P platform.

Soutrik Mukhopadhyay (5):
  dt-bindings: phy: Add eDP PHY compatible for sa8775p
  phy: qcom: edp: Introduce aux_cfg array for version specific aux
    settings
  phy: qcom: edp: Add support for eDP PHY on SA8775P
  dt-bindings: display: msm: dp-controller: document SA8775P compatible
  drm/msm/dp: Add DisplayPort controller for SA8775P

 .../bindings/display/msm/dp-controller.yaml   |  1 +
 .../devicetree/bindings/phy/qcom,edp-phy.yaml |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c           |  7 ++
 drivers/phy/qualcomm/phy-qcom-edp.c           | 81 +++++++++++++++----
 4 files changed, 76 insertions(+), 14 deletions(-)

-- 
2.17.1


