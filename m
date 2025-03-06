Return-Path: <linux-arm-msm+bounces-50433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE414A54123
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 04:17:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12F3916DA15
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 03:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5583F19342E;
	Thu,  6 Mar 2025 03:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Qqvef/Ja"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F3F18DB1E;
	Thu,  6 Mar 2025 03:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741231026; cv=none; b=e1fOaOFkKDZ9OOLUlrWPVq7MPXXRmwI2coBC5PAbx5TLmlwPWw4dd59rEOxCTspkO4okW/IALWbE4ztGoEN87Fv+dYpHv+48B9LMbbYWniqAkWbvqek/IDsr697s+2BrzXn+YVTAmlJm2dHe9Mo8b6LxJpq5N/xP2VZk8fvRfDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741231026; c=relaxed/simple;
	bh=fkuHWNIp9mbDnkSBisUx/9LDqBo+PNyE0ELIgVsNjDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=T/UFN9dbat8GZNCeJLz/lutltydCLRTU8AZz5q1VxDiFrxk/saqb1NJrfju24TN4haFhUQLSOibKI/bJStq5hguqxpnkEv2tC9cWhJShBdEsF3EEJCPBysoKuNSdCH79wMCLWbgOaBfh92rbDMgX9UactxxqEXQBDrgBL2rwrsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Qqvef/Ja; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525LVxVa023662;
	Thu, 6 Mar 2025 03:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=P3mSZ5beixp5dLwSV9CYy2
	ZDV1KaR7ii///D578aHsE=; b=Qqvef/JaeZYJylSOb/ZyRouhmcf58/X64+wvM8
	mcinpj1EHPDqXomkyPt1twFQLiZ5j9sfsI8/Ii6LgUSk8Mm0HGcSKabbsKPTp+a8
	G0ZM9TMnkLvBhQfw/L8wOlLFyOEhK6Cbo1kGWxcxdjFb1Jp3ceIpIb6scEdhe5Ba
	YNa28pZRcmSAvNr7+nI/3n/cfwT+14YEqTE26ZcN/GG3HyaMeJo1hL5Q1bhd04RR
	dJbtXlkJiHQeFMOmYugxnTzzaGBofnZudVUcxCPj3UaQ07szroc8hhxdFhpGangn
	PStGe40Ki2L9N/InkqruVuCITRbPe79tMVV03nEO2oM7QCjg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6t7m3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 03:16:59 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5263GwPX013269
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 03:16:58 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Mar 2025 19:16:57 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 5 Mar 2025 19:16:51 -0800
Subject: [PATCH] drm/msm/dpu: Adjust CDM_MUX to support CWB PINGPONG
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250305-cdm-cwb-mux-fix-v1-1-16148ca6e4d2@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAKITyWcC/x2MQQqAIBAAvxJ7bsEsk/pKdCjdag9WKJUg/T3pO
 AMzCQJ5pgB9kcDTzYGPPUNVFmC2aV8J2WYGKaQStVBorEPzzOiuiAtHbDuySnbaNouGXJ2esv6
 Pw/i+H3rjBGdhAAAA
X-Change-ID: 20250305-cdm-cwb-mux-fix-69ed5297d4f7
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>,
        "Jessica
 Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-f0f05
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741231017; l=988;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=fkuHWNIp9mbDnkSBisUx/9LDqBo+PNyE0ELIgVsNjDc=;
 b=MH0/sWHzZjK/KNIgbSlENvO2O/SZCBI2Vo06jiYjQD/gcCjkm2dwV4B1JpCRXOad8GONHqM4X
 MXXhmg7A4aUChqMWwHN6JFFfoKpSsGz7Z6A2pXlDMeb/TFbWeXR9SUz
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=I/ufRMgg c=1 sm=1 tr=0 ts=67c913ab cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=CSOFGFnX3rF4-v2d3RYA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: tru9hMmLR-G3KcZNJ90asiAYm633HDEW
X-Proofpoint-ORIG-GUID: tru9hMmLR-G3KcZNJ90asiAYm633HDEW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_02,2025-03-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxlogscore=963 impostorscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060020

Similar to WB_MUX, CDM_MUX also needs to be adjusted to support
dedicated CWB PINGPONGs

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
index ae1534c49ae0..3f88c3641d4a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
@@ -214,7 +214,9 @@ static void dpu_hw_cdm_bind_pingpong_blk(struct dpu_hw_cdm *ctx, const enum dpu_
 	mux_cfg = DPU_REG_READ(c, CDM_MUX);
 	mux_cfg &= ~0xf;
 
-	if (pp)
+	if (pp >= PINGPONG_CWB_0)
+		mux_cfg |= 0xd;
+	else if (pp)
 		mux_cfg |= (pp - PINGPONG_0) & 0x7;
 	else
 		mux_cfg |= 0xf;

---
base-commit: 6d3175a72cc07e90f81fb35841048a8a9b5134cb
change-id: 20250305-cdm-cwb-mux-fix-69ed5297d4f7

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>


