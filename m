Return-Path: <linux-arm-msm+bounces-28202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D501594C77A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 01:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7117DB228E3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 23:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075DC15EFA3;
	Thu,  8 Aug 2024 23:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FWNDrtDF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36446155A59;
	Thu,  8 Aug 2024 23:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723161169; cv=none; b=O2Ccwy3m8xvol6H1L5ybBecTyLFc2UXyuNDDyt5CVQEpoG/ymgSRnzcI3UfqlW0ooxcZoEUOirYCEwVFj50xiHBMYzPbHErWOHZHnHOmEuQMyzhq5lPHu0aXIYPjen3YodPZ7U/DHdU4zic2HzhX1QQBmPBuzRp+bhe/U2sgklo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723161169; c=relaxed/simple;
	bh=GRsxKtTOIRZmHVUh9hxafCS4w11kOesvHLVzznZbEZ8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JxnXrtswn29UuPPUPvpzYvpgfDdRGJ8MfOyuEq2lugfD9HMz885f1s/NX/Y6vjypkw4HJAP8zm3zvT9m6v5jvmchyD11yFPo8JSCQKE6ZwaWyS/LhL+OSU/19LumXYEed3dtidCHU9gzHxbZDqaHdMNAj1oMTVecTrf8vFFGo3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FWNDrtDF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 478KdMQg000984;
	Thu, 8 Aug 2024 23:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Y58ptjjUhGCMOz+7FvFiIg
	/x6Y6RLTKIpv6zC/SCqn0=; b=FWNDrtDF6Ha4Pxmfo2guG9Jg/i4Jx3iWfhv8t4
	N9dZHuvmUsgeZcfPJyTHa1/7Ry8CQxrEmlI1A0LJ/MCW1FHNZjbRabPnHA8SEWLN
	XKwWcBFCjqG70PySXa6RAsH08iWWyAEOMg7mYrpGjLLfldR+YDLDRHQCsOWLz5hz
	mTxl9pI5kKTujUGPzzBFqmS37DtRBCowvZboVSd8JHMKaGUFWDr27foWvO7TtxI6
	oPgOYvI2wKNJFxFEROnDSYyQ3SfY+XKyFcf2W1VvifhA7fv46oQSp033SDqPL5X+
	ZjR/Jn3hCw7xljhyqwmFdmWJN1iThC8CiX+eI3nBQE7Fzisg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40vfav3nna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Aug 2024 23:52:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 478Nqba9026272
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Aug 2024 23:52:37 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 8 Aug 2024 16:52:36 -0700
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
CC: <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
        <swboyd@chromium.org>, <dianders@chromium.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/msm: fix the highest_bank_bit for sc7180
Date: Thu, 8 Aug 2024 16:52:27 -0700
Message-ID: <20240808235227.2701479-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tLrREVdqVD1VRV76mscCDOTuVCETMhfF
X-Proofpoint-GUID: tLrREVdqVD1VRV76mscCDOTuVCETMhfF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_23,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=954 adultscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408080171

sc7180 programs the ubwc settings as 0x1e as that would mean a
highest bank bit of 14 which matches what the GPU sets as well.

However, the highest_bank_bit field of the msm_mdss_data which is
being used to program the SSPP's fetch configuration is programmed
to a highest bank bit of 16 as 0x3 translates to 16 and not 14.

Fix the highest bank bit field used for the SSPP to match the mdss
and gpu settings.

Fixes: 6f410b246209 ("drm/msm/mdss: populate missing data")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index d90b9471ba6f..faa88fd6eb4d 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -577,7 +577,7 @@ static const struct msm_mdss_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_static = 0x1e,
-	.highest_bank_bit = 0x3,
+	.highest_bank_bit = 0x1,
 	.reg_bus_bw = 76800,
 };
 
-- 
2.44.0


