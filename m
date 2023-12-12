Return-Path: <linux-arm-msm+bounces-4304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 831A280E00A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 01:23:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A5411F21BCF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 00:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C192625;
	Tue, 12 Dec 2023 00:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jbzOhRcL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B87D10B;
	Mon, 11 Dec 2023 16:23:15 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BBNvsQK013531;
	Tue, 12 Dec 2023 00:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=tsxYs1fuHcx4vLRl1xXfE1z7QmpFwUZYGeyYd91+J2Y=; b=jb
	zOhRcLZin3YtJduBFsaWZ+p7EIhNvGVb8PKVPDFePetQ2AykfvdRM5eNYtI3pqKI
	WEkWO8q9yNaAPMrdIkoFAry7wMyuA1mp4UG49gF2pCCGwdeRkvxnWq4Xe/V0TgU0
	H18O749yJjJ8WOrBuHnaGWsvL38Y8f/9256X1gHo0PYLHSgKXklJeXSuv8F75VsF
	DnxiApZD+6y3zIPbrsM7mOWy1L7qtP6+9aYm49vjwNrb+OZyh9GolmP+0nO42iS4
	mUM9TDL6HREqRe5AvZjT4duSQy5NBhBMbC2Ljb9LpBL195glk1xvuN9ZCm+khz/4
	+Q9hhEQMVTKXwbuM85GA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uxa900a4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 00:23:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BC0N6XJ011020
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 00:23:06 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 11 Dec 2023 16:23:06 -0800
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
CC: <dri-devel@lists.freedesktop.org>, <seanpaul@chromium.org>,
        <quic_jesszhan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 06/15] drm/msm/dpu: add cdm blocks to sm8250 dpu_hw_catalog
Date: Mon, 11 Dec 2023 16:22:36 -0800
Message-ID: <20231212002245.23715-7-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231212002245.23715-1-quic_abhinavk@quicinc.com>
References: <20231212002245.23715-1-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bMbUkZfMeB3xGBNbTnruG4Heo9nSSXiw
X-Proofpoint-ORIG-GUID: bMbUkZfMeB3xGBNbTnruG4Heo9nSSXiw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 adultscore=0 mlxlogscore=995 malwarescore=0 impostorscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312120001

Add CDM blocks to the sm8250 dpu_hw_catalog to support
YUV format output from writeback block.

changes in v2:
	- re-use the cdm definition from sc7280

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 2359c16e9206..58b0f50518c8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -384,6 +384,7 @@ const struct dpu_mdss_cfg dpu_sm8250_cfg = {
 	.mdss_ver = &sm8250_mdss_ver,
 	.caps = &sm8250_dpu_caps,
 	.mdp = &sm8250_mdp,
+	.cdm = &sc7280_cdm,
 	.ctl_count = ARRAY_SIZE(sm8250_ctl),
 	.ctl = sm8250_ctl,
 	.sspp_count = ARRAY_SIZE(sm8250_sspp),
-- 
2.40.1


