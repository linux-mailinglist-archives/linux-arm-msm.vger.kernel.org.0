Return-Path: <linux-arm-msm+bounces-34649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E37F9A1796
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 03:21:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13A00286280
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 01:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73ECF1D540;
	Thu, 17 Oct 2024 01:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Kcm/MJi2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE5718641;
	Thu, 17 Oct 2024 01:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729128096; cv=none; b=qhhSljuWS3c1ruOK63tXiwspk+ZQABJidPushBb0syOHSeO9YAz+ur1bmQ6S75A2MRvmIDYQ4zz7siFPr14MMG3pdGYZseGGaNK3BUh8UP5OeWXWamPn4FHvFH1N7yMXwtPN60oKNcccH7r/sdGQOYTJZRdnZuCaoKJVqXWUxDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729128096; c=relaxed/simple;
	bh=SKSTHC86GxuGqAwsBF3Jposi+MFglnRiv+Fymt5D1LA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ZabGvEzGDYXFURNGxZQGBOarbnOUx5tvna7cwHy5z2h/Ui8aWiqC0AbKp55jClQx7yiXtGuh2V1EU4yDnO6Qwczp8YUzVgbSjTpGAQZtNJcPIIPGCIBDM9f++Er84js72Mj+n8GESMxD/d9VdzlitndED5+pWlqzlxyBAVbgdW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Kcm/MJi2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GJOWwc012503;
	Thu, 17 Oct 2024 01:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2zJKfsipSJSY5sCNNAjAt0WMVIL0bVi25JbjpvO29/E=; b=Kcm/MJi2GJlsBssn
	og/GF46tdT5CPh7Fo7UT+C2VKDe+/zvAew4VYiF1A3pU/6GiX0ycTkPe0kgHn5pW
	jsEsc/Cfer1gbnsrQon2BspBLFPQtYb2xFiu6eIU57xbmcfeZBjeRMTJLvDuPQed
	vVvSVZuMd0E7HP1KTSd3whJHQRMw+PRpn2sA7ZAw/PgOav2U5cIgwg++aA9e4zA5
	9UoTba7qJBTT7Q7ih6oWNzDfSzvR32JmVRoN1WRv9gHsjwtRHOmKjBbpsaxLdHGT
	aU+ufVFNtmVb2DOUemk8T4SSpF6Qudh+fSyJZCCPE4aH3ioL5If7D1kkIb7IwFnc
	cwPagw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42abbxtc6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 01:21:21 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49H1LJ98022783
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 01:21:19 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 16 Oct 2024 18:21:19 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 16 Oct 2024 18:21:21 -0700
Subject: [PATCH v3 15/23] drm/msm/dpu: Fail atomic_check if CWB and CDM are
 enabled
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241016-concurrent-wb-v3-15-a33cf9b93835@quicinc.com>
References: <20241016-concurrent-wb-v3-0-a33cf9b93835@quicinc.com>
In-Reply-To: <20241016-concurrent-wb-v3-0-a33cf9b93835@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        <quic_abhinavk@quicinc.com>, Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David
 Airlie" <airlied@gmail.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Simona Vetter <simona@ffwll.ch>,
        Simona Vetter <simona.vetter@ffwll.ch>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
        =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
        "Jessica
 Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-2a633
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729128075; l=1021;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=SKSTHC86GxuGqAwsBF3Jposi+MFglnRiv+Fymt5D1LA=;
 b=oA3BXpZ1zeriNX5Q4CGElNeq2VbFGBvOVJHYC0OujZXSmKtFDGKQZiO8RUBlZVP1KQs3/CnQb
 ss8rgaEOMP8Dy/eo+oqZ8CPryP61C3ejuhGjILgfm0Tcj+MFamrQlNN
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 80gVVt-Lm26bduI4jR7Vk3WEgWq_mrzk
X-Proofpoint-GUID: 80gVVt-Lm26bduI4jR7Vk3WEgWq_mrzk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410170008

We cannot support both CWB and CDM simultaneously as this would require
2 CDM blocks and currently our hardware only supports 1 CDM block at
most.

Thus return an error if both CWB and CDM are enabled.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 118ef6c14d0c9207329b9fdbf590e392fcb87ecd..b156175c81898d5c0b5dc4692bf44fa74dffa574 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1239,6 +1239,10 @@ static int dpu_crtc_assign_resources(struct drm_crtc *crtc, struct drm_crtc_stat
 		return 0;
 
 	topology = dpu_crtc_get_topology(crtc, dpu_kms, crtc_state);
+
+	if (topology.cwb_enabled && topology.needs_cdm)
+		return -EINVAL;
+
 	ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
 			     crtc, &topology);
 	if (ret)

-- 
2.34.1


