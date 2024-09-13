Return-Path: <linux-arm-msm+bounces-31699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FDE977DF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 12:49:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D0E71C209A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 10:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A56E1D7E5F;
	Fri, 13 Sep 2024 10:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DKDtu1tA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296831D58A8;
	Fri, 13 Sep 2024 10:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726224556; cv=none; b=b6iSAFAozCpQC8FDEfBHMaQ7XtcwHyS6XAdvLaz0ZQE0SBMmTn5oRJwlEum99rXUx6yphqk6UZjGHNgGn+KRqIzES2yS7ZOmf/JDUmy8q0241HjrqTjfsDNgwvfnf3lk8YZRRflmkItjOK4WyZbG4XNyqzezUeBn03tsLU9Yvyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726224556; c=relaxed/simple;
	bh=EyH/VSN68skuuoKiqyeFlp9tXrWX5o1yjV9sTkx4df0=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Q23vLcWVoCtWiiY3PI0slYdU9H+J3Qtm2hn30UhK1DNhcACgT/e+8nzq6L9JB1oCcR8nxtnKZ109gRTtPhxmSCikCrk7JuoXLRbEWm8ZvKF/xRZuOuJsz8wSrKT05mRRbhvZA1mpBUHDURAtvecI1AEZ/twmKMjMWwBPw7/d9q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DKDtu1tA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48DAUR3F016801;
	Fri, 13 Sep 2024 10:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=D4LbTFvYAn54
	L7SxpTc+XzckHw9ndSNUzGsHpRkMvvs=; b=DKDtu1tA+HFt2B9k6ebMOMaDIWRI
	Mt5PuXEDPZZYjCbCO0JN6ZyoiPa7tlPgTxXPiqWHvaoyqVebxyUthdoIjzHu/xPe
	LtErklID6ptkqaejPhEOwVNMBB/RQW8amyzWHS9k9+CuZuem6MnfBKvA6DhP5vaY
	dax+7/bMU4gqIc9xlBZe5S+HLdvyYQJm1b73I6jPn+hn1SIx681AOu+HDIfXWaEA
	vCqT4tazzhhw1t6Ex1nsnebnYGAQVJKxZAWAXGYwNHOUEvaEjjXSSAQaTHpMDJZb
	WYsd1IQE2rYToooNs8Y2yG2ltf2Ovoe8i+41kN4qDM+A/QiObhm4cOXiPQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41he5e7qe2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 10:48:59 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 48DAjLL7030765;
	Fri, 13 Sep 2024 10:48:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 41h0eru4vd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 13 Sep 2024 10:48:55 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 48DAmtCo001193;
	Fri, 13 Sep 2024 10:48:55 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-mukhopad-hyd.qualcomm.com [10.147.244.250])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 48DAmtlD001191;
	Fri, 13 Sep 2024 10:48:55 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 3978529)
	id 822895000A9; Fri, 13 Sep 2024 16:08:01 +0530 (+0530)
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
Subject: [PATCH v2 0/5] Add support for DisplayPort on SA8775P platform
Date: Fri, 13 Sep 2024 16:07:50 +0530
Message-Id: <20240913103755.7290-1-quic_mukhopad@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: r0JNGIwx-pvtKgJvi9fa_iuyJkGq1d_o
X-Proofpoint-GUID: r0JNGIwx-pvtKgJvi9fa_iuyJkGq1d_o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409130074
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

This series adds support for the DisplayPort controller
and eDP PHY v5 found on the Qualcomm SA8775P platform.

---
v2: Fixed review comments from Dmitry and Bjorn
	- Made aux_cfg array as const.
	- Reused edp_swing_hbr_rbr and edp_swing_hbr2_hbr3 for v5.
	 
---
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
 drivers/phy/qualcomm/phy-qcom-edp.c           | 70 +++++++++++++++----
 4 files changed, 65 insertions(+), 14 deletions(-)

-- 
2.17.1


