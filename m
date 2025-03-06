Return-Path: <linux-arm-msm+bounces-50437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C16A5415E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 04:47:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DDFF3AA3F9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 03:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75C086330;
	Thu,  6 Mar 2025 03:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B4NHeXg+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D8F192D86;
	Thu,  6 Mar 2025 03:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741232829; cv=none; b=cVIlae5We8t8w7oLJEIQChcTZEf3itcCnRx7LWEkqz8kpO6c3jxYqzwcu18ThPEAZJMJPepP6X4l+kJX8RYGlRLPTwhWXQ7zo5uIruZ2IUw4bjYUQO/9Ce0JZ07oMGhgj4lS2k6XB/K+uAryv0PnGnpEDiqeLJbuqjlkqRx9udg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741232829; c=relaxed/simple;
	bh=Bb8oYvMsyb1MoMikQsGV7URm/yedArJDFdQnakFnq+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=Dr0YYpsFeMQ9CyOXt4MRXqD5A28xP/n+Hl/hjwkhvplVRMtjQyt9HlY/H/PHbE808OZ1UnL1DXDIrWwIss99b4JRIbiRvQ9xRNu3WuxzLcl3xJdXarSAwg7qsJPjpkzbBUdPCPTq9ARnJ5aevIoI/Pr5hkjlmuHGnJDLfnZ1UME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B4NHeXg+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525IUROW030789;
	Thu, 6 Mar 2025 03:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1fsI6ZosQTUK3pdp27dEKl
	AX/ATgdmaj398OKlradf4=; b=B4NHeXg++iW38k9BtrY+egoqaoYZoPvkVY8PXQ
	4u3EX0ss7OS+SsvkCWYpvuidMdNQL7YE904LsMGYA067sI6GTpsjplq7baCXLNHg
	FJvolOkS3IUA5X1hfpF7pG1dKhUpQOFrLqgxvPm/GjX+6+MoOb2sUTbc7IU605yF
	LfTvjPVPF6KGtvhGgKOX61x8XaOhdeSY7H2qWuM/QgnEqvX68mu7kq2DN+0hNTFW
	uKoKTwQEEvU79kIb3/FrC9MaqJPRzL4RICqXirUKEZ2LEpvr3AEcPZhB22irJQS9
	563pBOZIDUAX3R91zJsIddmyiUkRqaUqdZWFjLHS9LOLvENg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 456uy097tt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 03:46:58 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5263kw0l025269
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 03:46:58 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Mar 2025 19:46:57 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 5 Mar 2025 19:46:44 -0800
Subject: [PATCH] drm/msm/dpu: Clear perf params before calculating bw
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250305-perf-calc-fix-v1-1-d57f356caf59@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAKMayWcC/x2MQQqAIBAAvyJ7bmFNJegr0UFstxaiQiEC6e9Jx
 xmYqVA4KxcYTYXMtxY9jwa2M5C2eKyMujSGnvpAjgJenAVT3BOKPkiD9UN0It4StObK3PT/m+b
 3/QBXcJS7XwAAAA==
X-Change-ID: 20250305-perf-calc-fix-07147a3ff410
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741232817; l=1024;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=Bb8oYvMsyb1MoMikQsGV7URm/yedArJDFdQnakFnq+8=;
 b=e6NVU0pXMd2LPp1NptS8jow2SEKMBDZ7yuQVL0IbVoHqHhROrKsCnQc7D4skbe3gBTOhJraHW
 M475dQtDm+TBkvv93KVWP022JMSBhfYV7YRsBtIN+4tBrbNr1gwJDmp
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Pq5pbxM3 c=1 sm=1 tr=0 ts=67c91ab2 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=IWXia-4O5xEfaagEqdUA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: vPSGRd6CAt6kEC4NZlibD8KM0H8_Ylj-
X-Proofpoint-GUID: vPSGRd6CAt6kEC4NZlibD8KM0H8_Ylj-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_02,2025-03-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 mlxscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060024

To prevent incorrect BW calculation, zero out dpu_core_perf_params
before it is passed into dpu_core_perf_aggregate().

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 7ff3405c68675..0fb5789c60d0d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -164,7 +164,7 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 	u32 bw, threshold;
 	struct dpu_crtc_state *dpu_cstate;
 	struct dpu_kms *kms;
-	struct dpu_core_perf_params perf;
+	struct dpu_core_perf_params perf = { 0 };
 
 	if (!crtc || !state) {
 		DPU_ERROR("invalid crtc\n");

---
base-commit: 6d3175a72cc07e90f81fb35841048a8a9b5134cb
change-id: 20250305-perf-calc-fix-07147a3ff410

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>


