Return-Path: <linux-arm-msm+bounces-32358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3F3984E88
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 01:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5409D1F2466D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 23:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1C9187FF0;
	Tue, 24 Sep 2024 23:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gNTYlrul"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E4F16F8E5;
	Tue, 24 Sep 2024 23:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727218818; cv=none; b=IxZMJvejcCh3K/Z82+mOZEkwb+Fse2WtvdK12wi3c9KsV3dGacuEL6reuQQ4HySZ/m+fRAOZpDqbpPBpQQO/tdrEZP0EE1tv1ea6H63z9G2LLS8l7V1Gs375SNfEE/4Cz64t7gteMOoVrAMyb8spEYTdqCAZ2/3QN2a7ByhFaxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727218818; c=relaxed/simple;
	bh=IKWG0smsKALPYzClFGWT1bIwHZ8Lh0oYiN6xOKAlDyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=BPJ/NXrPHHMYDRRbI+ubZCApMBUGlb1gdjvUTKoP17CZemxBO/TJCv3o72r+ohIMAGku6ERidR1YOfUAJEPZpWjdiYqmdAniO7LCA6nLJbosSFAaxZ0Xl3Su1frkF8NfbcKp4dEGsokMmO/j7hoKPV7TnQGnRyYIRkCXNfZbfOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gNTYlrul; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OI3YHu018219;
	Tue, 24 Sep 2024 22:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Oww9KJRAk3vmomdB+iFyXpj8WK1VJ+UpFLBWJYA5Ig=; b=gNTYlrulslOilu9z
	FXTyIhyBhVPuEuyOTmGbsPWU77SmsNGyYwgBHtpLSHcYlVgtTNKZL2S9toexA6Xy
	4uEm+rR9pZMLlJZwL1F8VDw5wCN4KZl+3/0qGTYsJdzhVIxaT+Ct3P1A8PpqDl74
	25O94gT2bmC0n+/ZlBWaDTHtruy10mu/bC2vjhzjl8iMwsoOyExcGO3/t80iHNT5
	fHUXlQK1Hgvz+pfGG4brWVrFAhoxw+Dk/MzwelDEGOcvM2yxE9LQcvnNtVcpJgRF
	wsfn6XzZIDWihc6SdpTE4gdEc4p5zaYsDkamkfAj75LcBDyuVMwArHamCfnuPgZX
	DKzweg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41skgnamk4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 22:59:58 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48OMxvgc024739
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 22:59:57 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Sep 2024 15:59:56 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 24 Sep 2024 15:59:27 -0700
Subject: [PATCH v2 11/22] drm/msm/dpu: add CWB support to dpu_hw_wb
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240924-concurrent-wb-v2-11-7849f900e863@quicinc.com>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
In-Reply-To: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        <quic_abhinavk@quicinc.com>, Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
        =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
        "Jessica
 Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727218793; l=865;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=MzpyKCvc2HlObWYEumRDAZ96sXDtcth8DOLv987dk2I=;
 b=E188VcZSKC2GbR3BOzaVlVGwaJyaxlplZcPODxpHGoBAOyyO34Q5GLkf1/ZJGryQKc9SK80BE
 4Kl0Xs1K+a0A9jS1nFQdAwktqsrqSHmn6ilWcZRPXJqG8pXqFc5zntK
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: EcH--NAMiLcWbB7UdDTdYif0iblOk-49
X-Proofpoint-GUID: EcH--NAMiLcWbB7UdDTdYif0iblOk-49
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxlogscore=917 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240160

From: Esha Bharadwaj <quic_ebharadw@quicinc.com>

Adjust the WB_MUX configuration to account for using dedicated CWB
pingpong blocks.

Signed-off-by: Esha Bharadwaj <quic_ebharadw@quicinc.com>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index 93ff01c889b5..76d6fd614b7e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -173,7 +173,9 @@ static void dpu_hw_wb_bind_pingpong_blk(
 	mux_cfg = DPU_REG_READ(c, WB_MUX);
 	mux_cfg &= ~0xf;
 
-	if (pp)
+	if (pp >= PINGPONG_CWB_0)
+		mux_cfg |= (pp < PINGPONG_CWB_2) ? 0xd : 0xb;
+	else if (pp)
 		mux_cfg |= (pp - PINGPONG_0) & 0x7;
 	else
 		mux_cfg |= 0xf;

-- 
2.34.1


