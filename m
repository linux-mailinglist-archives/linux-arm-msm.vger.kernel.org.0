Return-Path: <linux-arm-msm+bounces-83232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E811FC84993
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 11:57:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 955B84E7A34
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 10:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3510E315D2D;
	Tue, 25 Nov 2025 10:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O1tWbg8L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB05D314D1A;
	Tue, 25 Nov 2025 10:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764068211; cv=none; b=FD4BcadzTHh8lpiUm9pcZ2XM6y2ASZp0iujyMHjnJuPh+CZfcn6COWTU46f1pEFXq++GGgZXr669WEqEvYqPMjvK5sag/lwbKQNCc063FAGqw3ofppp7Kg9sh5O8D7bDue4htpxWJFbXtjUrtJunZ+HL5T7td0WhELNFlLjdThk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764068211; c=relaxed/simple;
	bh=jABcqQjE0yhkM3zQcCVkrUwyI/52DVqlu4Rpr0vqoiQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WnrXg1GIAvIDN7KL+ONYQtt53mSqUXn0StrYm1izKqmvnrfJRQu34HpAmvii3weKn8fieI7AgyUG5uaHuzdHw3BWOAxcZs1fE8Z1w7V6wuPccYMojvAy38lDMZt5MZhCv3GxOKnhTnKdtnk1PFTvVeeLWnLxkcpardhhia+fdTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O1tWbg8L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP9xXnm2651096;
	Tue, 25 Nov 2025 10:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RFEdqmwxv4p
	OJsiiFhS4oAK1y8+i/9/7lIO/EJIcd/A=; b=O1tWbg8Ln5JwscVqaKERyp8PB+I
	Fzgl7JDW2ohpLChB6u5VjpT/fXIT2PuNCiayRkkn1BgTPvHSa5XbqDNhVOD8H0J5
	lL0vBk8eV3t1O+FXCOtbie9T5PJGDwIP8MMcj3QOkoSdCG1cnrhmWIKo+gLqbPs0
	jfJnqsTK8B84zRRyV5yp/uHXTcOivTWak5VYqRGNn7QRJIySnDFgTSdL5YRg94X2
	ydjUuwHRO/1d8cErVV4yBf08AC7GknxOL9dhsY15PeGqmXl8jMy1ccsFlOzGqqSN
	EExin4D/UPID9U/s7mrkVB+rit86g4ZFsuDbErY8dabwzXYX4WWq9YZwPYw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anaabr4v9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 10:56:31 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5APAuSHw009129;
	Tue, 25 Nov 2025 10:56:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4ak68n435r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 10:56:28 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5APAuRfk009097;
	Tue, 25 Nov 2025 10:56:27 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mkuntuma-hyd.qualcomm.com [10.213.97.145])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5APAuRVp009092
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 10:56:27 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4582077)
	id D45FC3B1; Tue, 25 Nov 2025 16:26:26 +0530 (+0530)
From: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
To: dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicinc.com, quic_amitsi@quicinc.com
Subject: [PATCH v2 1/3] drm/msm/dp: Update msm_dp_controller IDs for sa8775p
Date: Tue, 25 Nov 2025 16:26:20 +0530
Message-Id: <20251125105622.1755651-2-quic_mkuntuma@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
References: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Vd36/Vp9 c=1 sm=1 tr=0 ts=69258b5f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8
 a=aneus3DpQx8xEqIVSrsA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: uMRC55gf7VdBJjuZnqPfyX9lPrUf3wm1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA4OSBTYWx0ZWRfX4qno6D/zhBFw
 WGXlcz+5sX680TJbfHd1GYwzkRjStbcpenwu5x2FqnHgOnoAGrY8MRXk13M9HMxIxS5R0Poub5V
 XEPZ4mI/9JZRgZiqXQX/YxgeFQPRQPWklvLx6sANUaZOT8xs9X3Fj/FxRQrSYWGS6E6TvuD92VZ
 ZL5eL2eChUmrFGETA63yotVfdspQH++IMkGFPIXplMPS5hqVInB1I5SQLRfPaoSH9Ur86iEYN1H
 NLTKlJ/qooATx/q7ZoO4RNTeRmExAnYvjwoYFmqOCy4Wjq8xUVbbHw6xlVGQaFGLKVBB+Fkru33
 RwP2Gi4sW4cj5zlV0YZKK4Rt05neLjN+sEQgPnGmgRmElqj4DQZGEqu8GOcOWq9GmJK5oSixEVR
 JaZRGH0ONbnEtKy2AjvmGCPFcWPddg==
X-Proofpoint-GUID: uMRC55gf7VdBJjuZnqPfyX9lPrUf3wm1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250089

The Qualcomm SA8775P platform comes with 2 DisplayPort controllers
for each mdss. Update controller id for DPTX0 and DPTX1 of mdss1.

Fixes: dcb380d19e58 ("drm/msm/dp: Add DisplayPort controller for SA8775P")
Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 9bd9cd5c1e03..a082f4d3ebe2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -141,8 +141,8 @@ static const struct msm_dp_desc msm_dp_desc_glymur[] = {
 static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
 	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
-	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
-	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
+	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
+	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
 	{}
 };
 
-- 
2.34.1


