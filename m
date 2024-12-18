Return-Path: <linux-arm-msm+bounces-42598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF7B9F5B6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 01:28:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C573E7A22AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 00:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736151BC4E;
	Wed, 18 Dec 2024 00:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NobHo0Az"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C0E8468;
	Wed, 18 Dec 2024 00:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734481713; cv=none; b=h5V+C/O4QnxkgqLq61PHpKf+N9O0/aHgumVBUCOSn6BAeTeuYZJg5Wze3yGfnPHQSGBcZfmAWvs6MmE+ZH+wuyJiIuOPfDwqGzDUE+yoYPTFZztREhVw/9iRDtnCQCDRxmSuapG1M8yOX2bwNQq99sAH8/W2M/b+Vs8rlSmujy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734481713; c=relaxed/simple;
	bh=ch/ao6Lzz8n8R0StTnQ8SaXQNkf5eZVghhGeGNMlLqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=pJHWhhN9XZLBWUiARK3HeqrKwgdkvIpF2I4XjxxJF1+9I1XCLehe2lp+3wmAEA8BN2nLLO6O/FYH3GR/Khc/3QlY786JC2othFuhwGKToJrEIy/hnchm3E6iul3l747ISU6L/9dWRtvgeh+oo80jAdW1E7F5W/q2CTqZV9hKVEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NobHo0Az; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHIvuZY001078;
	Wed, 18 Dec 2024 00:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eatGcBO1ye3S1irYRGwi+NsVwnHOup071UEBVyGZ398=; b=NobHo0AzFHtwYD8E
	+xX0Ahkepiv+FYGhAqkVWBVEsdqWEX9QpQw1tiIhabTDRTKFL9o9wVXHgGTxVby7
	I+z42y1l/vZd/voDThXR4UDGGqq4JlsTp1B6pgS1UMOBEUtKgYFVCMGd7OIRdrE8
	RqxKTdrYW1f6OPPpa/HZ3GCcTOf2AAv7b082KN7ZAog02kX2agsTOaf2befuPgsY
	F/SaN5RTcapgFeduONJJ78YFCnRBSx0ODzP0N2/Mt+24wzoxXeFkYxwteLonX6u7
	glfZsIfIVmu4x69uGT87IRgxAuQiPBQ63Y6RoZ4pEUo40jSO5iUQGGA9t0f+a5y+
	7y0hsg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kf1qgkvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 00:28:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BI0SOKN026683
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 00:28:24 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 16:28:23 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 17 Dec 2024 16:27:56 -0800
Subject: [PATCH v2 4/5] drm/msm: switch msm_kms to use msm_iommu_disp_new()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241217-abhinavk-smmu-fault-handler-v2-4-451377666cad@quicinc.com>
References: <20241217-abhinavk-smmu-fault-handler-v2-0-451377666cad@quicinc.com>
In-Reply-To: <20241217-abhinavk-smmu-fault-handler-v2-0-451377666cad@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734481701; l=921;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=o/9VibBpU72luH3wyOrmt7xGHpOph3iJcNJoXLj/MLc=;
 b=YZyv/7TwkKbVnXyJA9b9ijNu+WzveZJ+ZONpqY5o/ziLpeoBPiqZByJbEX1+mRDfUaNGF+CRK
 ckT8ZqUE1m/D+Wj/keZy9rDb2XDt6G1FFSAI1BFBc20KzAwbLm3rV1f
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: p8pdEviZf33UNsc4oWP0jiSKguMeFYyN
X-Proofpoint-ORIG-GUID: p8pdEviZf33UNsc4oWP0jiSKguMeFYyN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412180001

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Switch msm_kms to use msm_iommu_disp_new() so that the newly
registered fault handler will kick-in during any mmu faults.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/msm_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index cf5f15b9cd16a23e9bea820cfc096caa0d7da175..78830e446355f77154fa21a5d107635bc88ba3ed 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -192,7 +192,7 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
 	else
 		iommu_dev = mdss_dev;
 
-	mmu = msm_iommu_new(iommu_dev, 0);
+	mmu = msm_iommu_disp_new(iommu_dev, 0);
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
 

-- 
2.34.1


