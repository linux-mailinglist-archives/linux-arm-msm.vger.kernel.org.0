Return-Path: <linux-arm-msm+bounces-12221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F563860309
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 20:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC36F2866A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 19:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949B512D1FC;
	Thu, 22 Feb 2024 19:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CWmi2YGO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F059612D1F4
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 19:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708630848; cv=none; b=uzlQ7FzCL3dJkaMVwdNH7VpuHvCsm5GSAeIBvooH8QdohGPbdMuAoD0zM3qix9dQand0cgDf06ReCXmOp+kydpR4DCkZ8G6WcPhm7k+BzmHhbnBPBES46SmkRdmRqBDc6grF1sJrqq8Ebi3w0xCsqrrFex0zTX0NauQ9qjVghz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708630848; c=relaxed/simple;
	bh=IWoTDg9fvQNePOO5XKCKhWhYhVUrgYZqJoxovbTtXPs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vDAWEjLjWsFllVTOvBg6zZ7tXuifzCf7re13ovkKOig/sfGkkzwX19gZX3wE4E7vhvDuezuQo5ADzfra62hsHGAiKQxPFqBB+6jaKlOfvGliLSLvZOaJRoLFWQlnZM1Y/MyoPvi97wh2MtTuYHkvdS2yjDiZ58nrhK7e5bOtSkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CWmi2YGO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41MAHqER022548;
	Thu, 22 Feb 2024 19:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=+vBcTzOaGVfpKvunYVqvY2DUYLLVpP/IVPHY49gkZeQ=; b=CW
	mi2YGOSPTN9kn89bHQvjMJE/rXIbH6MRZLayO5qz+P6IIOjc/cPnT9K2lXa8Zo2S
	7+Gl3S038D8PuBRIhBcqGrcL2GdrF5uvoBdGG3ddeco3dpbK/9SHxtCwr5ZqXgdH
	5TmkT0U6jZuXSaNT1sWFXkFfvibzrsejsWfga36wzk4MMnjje1kfF8N7dgXBxWc4
	a5T1+n+wfAQUGR1qFwtCJ/VdGkYot21pKSYqBigps+OrXpvmyzFjAqbU6PLuKgmO
	gaUhx1JzFKS6zR4uuCFlSRqb2fq2tfT2eNH4G/cxal1o0XBABLP9N4tZmHJUBgDJ
	XKUq911Ytvg7CTmG/DtA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3we2bxa7kn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 19:40:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41MJeeGY018261
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 19:40:40 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 22 Feb 2024 11:40:40 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v5 02/19] drm/msm/dpu: add division of drm_display_mode's hskew parameter
Date: Thu, 22 Feb 2024 11:39:47 -0800
Message-ID: <20240222194025.25329-3-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240222194025.25329-1-quic_parellan@quicinc.com>
References: <20240222194025.25329-1-quic_parellan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PHnJxx3Y61rEvdUmyKWh0SY79NzlTe11
X-Proofpoint-GUID: PHnJxx3Y61rEvdUmyKWh0SY79NzlTe11
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402220154

Setting up the timing engine when the physical encoder has a split role
neglects dividing the drm_display_mode's hskew parameter. Let's fix this
since this must also be done in preparation for implementing YUV420 over
DP.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index f562beb6f7971..f02411b062c4c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -260,12 +260,14 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 		mode.htotal >>= 1;
 		mode.hsync_start >>= 1;
 		mode.hsync_end >>= 1;
+		mode.hskew >>= 1;
 
 		DPU_DEBUG_VIDENC(phys_enc,
-			"split_role %d, halve horizontal %d %d %d %d\n",
+			"split_role %d, halve horizontal %d %d %d %d %d\n",
 			phys_enc->split_role,
 			mode.hdisplay, mode.htotal,
-			mode.hsync_start, mode.hsync_end);
+			mode.hsync_start, mode.hsync_end,
+			mode.hskew);
 	}
 
 	drm_mode_to_intf_timing_params(phys_enc, &mode, &timing_params);
-- 
2.39.2


