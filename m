Return-Path: <linux-arm-msm+bounces-8307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FBC83CCB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 20:41:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F33501F222E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 19:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F24135A7C;
	Thu, 25 Jan 2024 19:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="klvlA/tB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC2013666C
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 19:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706211558; cv=none; b=eKq9rUV0qV3oa7xYskmOArO0DbPa6hO/jzpP6UavAvHFSaLl6aV5kgm9Q3pp8WAIglz9wUscmQwczn278CnhBdRMlGEDaTjFuORxy3tTLRtH4HGn1g1JP2nfhxjIeyHImnwCUYTczC0a0JDtPhoLGNUWHEiduBc5EQQ311idmSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706211558; c=relaxed/simple;
	bh=fBdGB7tfeL8/As5QpSq7QILQkuloiVNjhhvgFvR0AyQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aFeZPI99eeM2Rdld8zFZGIQkFC7s0gt6Wah4//hDus+HX68UlWU8CT0kGOwy873qNYZNnjdpMUNZHwkGBK32+0YxyfTtK2ayKyYIGdAQwhBJdbEqptyf4hDYpjXuHk6aC9QwyaZo33oOhGAq5IlILf0OhLfDIgpD4LwfleHBfZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=klvlA/tB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40PEhrpm000914;
	Thu, 25 Jan 2024 19:39:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=s1Ns/BzLRttaPLxZ1E/i2AaxP4u8TZuh7UhL5s8ULik=; b=kl
	vlA/tBixYm23NwuGnX/Db9IEUdPInm7w519TulRUFjugEvYE2WTHIpBLMuT6jre4
	Olcbtp4afJ3YrDT6dLafSK6fsu8hlYFAsmgFfGWwbKZU1wQ1yu+qFUSj7S8WRMTx
	BHaUQ50wVa2HZCU32shPD4+iujo7yaVNpRbyW3+fcDVUAMyVIlYB293KNzLc5xtD
	i5hKg9JexEn9JIs0VR7CXlFoA0zPDHNCvUmtMwwaNEKA089adopDvzOcVnUUpajm
	fpi7WFlL+I4YhGbOohCNbK8sw48zIkXwQiytaakzjUC8JewjyXadt3PBCxw6Po8c
	MCMEoIf91SxITqRjt/3Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vun5yhn6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 19:39:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40PJdA0V027397
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 19:39:10 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 25 Jan 2024 11:39:10 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH 15/17] drm/msm/dpu: allow certain formats for CDM for DP
Date: Thu, 25 Jan 2024 11:38:24 -0800
Message-ID: <20240125193834.7065-16-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240125193834.7065-1-quic_parellan@quicinc.com>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
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
X-Proofpoint-GUID: 1UEaqpJeOvINVMdj3oX2YKGgeTnLHJLI
X-Proofpoint-ORIG-GUID: 1UEaqpJeOvINVMdj3oX2YKGgeTnLHJLI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_12,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=530 adultscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401250142

CDM block supports formats other than H1V2 for DP. Since we are now
adding support for CDM over DP, relax the checks to allow all other
formats for DP other than H1V2.

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
index e9cdc7934a499..9016b3ade6bc3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
@@ -186,7 +186,7 @@ static int dpu_hw_cdm_enable(struct dpu_hw_cdm *ctx, struct dpu_hw_cdm_cfg *cdm)
 	dpu_hw_cdm_setup_cdwn(ctx, cdm);
 
 	if (cdm->output_type == CDM_CDWN_OUTPUT_HDMI) {
-		if (fmt->chroma_sample != DPU_CHROMA_H1V2)
+		if (fmt->chroma_sample == DPU_CHROMA_H1V2)
 			return -EINVAL; /*unsupported format */
 		opmode = CDM_HDMI_PACK_OP_MODE_EN;
 		opmode |= (fmt->chroma_sample << 1);
-- 
2.39.2


