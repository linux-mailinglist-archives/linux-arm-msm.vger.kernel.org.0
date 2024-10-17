Return-Path: <linux-arm-msm+bounces-34663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B178B9A17C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 03:22:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAA6F1C210CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 01:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E8E61304B0;
	Thu, 17 Oct 2024 01:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nH+SZ/e8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C80225D7;
	Thu, 17 Oct 2024 01:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729128100; cv=none; b=AptCZYZxZVKJGEcngZb6htW+3KFWqFL22Qq3SQGy4coZwWiN7A64l2I4YVt/sQTkgVtZ+ToxC9+UPvCAurqsEm2Xhy19lvFUxsOXzHV9dhQtR4E0wfdvxLbB1bz8l2slQfGdDtUD1SFEg48/wSSVGqcEm1OiNZIvIHkPA1O1wV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729128100; c=relaxed/simple;
	bh=Qb9UFKq41sBFErH0ZXhhxT+IwPO4V7234OTWrld/2tY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=nhGN72j7hrlJHNDS8u73hizcOzndDoyyYsXAW0BXuxNQFOXTrV1nEjXNRPrrSZMH5vQPtN5NLOsMmO0WadRlAUbFUJBcaz4BKo72RA9uHA0mUbfkC/u5k7cl11yGkQzHjDnnEJ4P8tS74qj8qWK72tcJAWTcdJNpSpDg2QeFnKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nH+SZ/e8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GFXcJl026705;
	Thu, 17 Oct 2024 01:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v0OoYdCR/FABXob+SbmqZL1H54lznwoBj79Kj+lLs+I=; b=nH+SZ/e8ZbAEGTdD
	BPsxA9Td0X28sYpdavznjo8xQfuB4NTCjsRW2eztgqmjjFqOEi3XHluzYtOxw15v
	GAjlPoL1XYPAbcMHNBdcE9QjfQbXiZUNj1nMMJZX7F2uV78AK5UvYGpQCLcY5sKa
	/NraRPuN5PfeBx2VCBiHB3iZ/JGtGIBwkvv7vd/ICB2/lfBHuzbeT7R0Pw+Uo2L3
	AkEoRwyuP549CqIhKf5275Ty63b11Sgxoe2z7HGhAbF5b6zM6wboX4mT2s8S7d3o
	uwnk/85yA0ZVYBIRqb+6O+W8iNFOMDaDJoy55vM5BRSCcgYj+9o/4gGemSnrclay
	plKMfA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42a8w6jw6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 01:21:19 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49H1LJsx030706
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 01:21:19 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 16 Oct 2024 18:21:18 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 16 Oct 2024 18:21:17 -0700
Subject: [PATCH v3 11/23] drm/msm/dpu: add CWB support to dpu_hw_wb
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241016-concurrent-wb-v3-11-a33cf9b93835@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729128075; l=982;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=EX/WAsZGgUX6e0Ubex7hWonPs77v7zolFFUqmjndj6A=;
 b=g53WvHK0AQitbMqwq8wRSGm+B40AjsgBhUcXY90SVyyuSO7PR2gnWhRUvIKMUH/OcBEe7VdbQ
 Gt35qz+Cc/pBOrK2q3Q5Db5jml9YTsswib7iXTCtBOAcqsZMu2zVE8d
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cP9fruA9j56a-RIIwvxnybPkL7WtMd9D
X-Proofpoint-ORIG-GUID: cP9fruA9j56a-RIIwvxnybPkL7WtMd9D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=916
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170008

From: Esha Bharadwaj <quic_ebharadw@quicinc.com>

Adjust the WB_MUX configuration to account for using dedicated CWB
pingpong blocks.

Signed-off-by: Esha Bharadwaj <quic_ebharadw@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index 93ff01c889b5a8e4b742856a2fdbf5b8e7d6c305..76d6fd614b7e2636191ca79a1daaac23edf9155e 100644
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


