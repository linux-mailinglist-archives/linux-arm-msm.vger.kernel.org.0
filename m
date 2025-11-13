Return-Path: <linux-arm-msm+bounces-81553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D37DC564CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 09:37:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7A4C64E5DB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 08:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A5FB3271EB;
	Thu, 13 Nov 2025 08:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oI9oInL8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D462857FC
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 08:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763022552; cv=none; b=cyJQBWxxe6bFwOiKeZCW23wPdAcL7ylB7Ut2WQJhY8GuQ7tgDXR8jbxiAs85IIMmpk0TT/kp20Rp1iFxYQxYXNcAKO3yWPBc7mEga7Q0PLNFNQg3HhG/XZ9ST05n+G6j9c4PyTrkZOMEvnwRH09Serkw8vHIkOcMVmJKExJRhyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763022552; c=relaxed/simple;
	bh=7ir2dzCmPjOMDDWYm7JMvNqyd6yeMfgRQ21NvYll934=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XDnfZnzK0ypxFNmi5mPIjLAyyEgnh/pKWp5/ScpwOoipszFKTe/MUZKoy0OX00oaY59II49G/LhIQuJY24rb4K08Z/qzBjebHpRaYh7Jj5pmm6FEOpGu2xecGvCQKAHg/SCIjvCDgSc4ut9gdVZrOGa+cF9EcevTXKCLV9GICLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oI9oInL8; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AD1hL5f031849;
	Thu, 13 Nov 2025 08:28:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=L755pfX4QkDpSZyK7BWp0gYkFZGjW
	0PmXIOXR6FLM6w=; b=oI9oInL877eAM6b8/YFX+pQOAG/i4q+kPdgvySR/9+UF6
	9h+379hV8zqpWoialvNP1nXA6T/h8DuFqj94Ed4OCZF6IpjYLgE2VGvOPrzfnBZZ
	jr8fvNcJnN83Gep3fncSQK0C8N/m3hrClGJ0vsOcZPAvKL4SOXdlszv/oUoGBcpl
	7pveHYLNZ1ehRd5vhDkQRTaHGxNpMhrxCdHm2FMNn3BaQ86CSTzhffmScGmyqMLl
	2makasNqwxH+DlG8EXe3BdojyRJ3KPUi7KLMd8dCeyqi6M8PmnFMOY6XxBVmrU1m
	bZlIus9rqK4CndujKka8d7cVp5rVt3qHG1/hzz7aw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4acyra95v6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Nov 2025 08:28:44 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AD84fU2005516;
	Thu, 13 Nov 2025 08:28:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4a9vabt63r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Nov 2025 08:28:43 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AD8SgPq010061;
	Thu, 13 Nov 2025 08:28:42 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4a9vabt63a-1;
	Thu, 13 Nov 2025 08:28:42 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, antomani103@gmail.com,
        akhilpo@oss.qualcomm.com, simona@ffwll.ch, airlied@gmail.com,
        marijn.suijten@somainline.org, robin.clark@oss.qualcomm.com,
        sean@poorly.run, konradybcio@kernel.org, lumag@kernel.org,
        abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com
Cc: alok.a.tiwarilinux@gmail.com, alok.a.tiwari@oracle.com
Subject: [PATCH] drm/msm/a6xx: move preempt_prepare_postamble after error check
Date: Thu, 13 Nov 2025 00:28:31 -0800
Message-ID: <20251113082839.3821867-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510240000 definitions=main-2511130060
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDE1MSBTYWx0ZWRfX5sE5d3HnRC0s
 Unohqy4sNW838gfuRybSh/4Lta+QRIcdY9Sy+HE6/OsdZnP06y8x9dFebH3t0r91/JS2YC3lSqH
 Pg3qqzgso+FuFozMmgezE0ky0Afebb9a0rQl/2OV11qQKUiVsG+TZSSF89vY5nUexZNw1YDqdgS
 gz+bg9sLX2TuonkJu3WgGs2rVRoYwd9+xVAXaxDmeDdVS2WnMSdWYfngDTGb6pzCLNPtJ9VcF9p
 oVMg+Dtoqz4N6+48F9KIOcT+MuXJyfed1acmfXxmn5+LorFdNEZF0C2B1WKVAE2o4018NLd2K4F
 iW1nhDVoWo7Z+cTqmPSlgZpxbSJTiJ9FT0dnPJehWjcU5m7kHes631JUXO/CWfLMO3r31Ae/qFU
 rXNMEWRaVHFa3hBr7iF1jOoP3XDMgw==
X-Proofpoint-GUID: G3sjtzsN5Qw7oFEiQZTzYoGQqQjBRMBi
X-Authority-Analysis: v=2.4 cv=ILgPywvG c=1 sm=1 tr=0 ts=691596bc cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=KEv1GmVSPCL-WcEB-q4A:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: G3sjtzsN5Qw7oFEiQZTzYoGQqQjBRMBi

Move the call to preempt_prepare_postamble() after verifying that
preempt_postamble_ptr is valid. If preempt_postamble_ptr is NULL,
dereferencing it in preempt_prepare_postamble() would lead to a crash.

This change avoids calling the preparation function when the
postamble allocation has failed, preventing potential NULL pointer
dereference and ensuring proper error handling.

Fixes: 50117cad0c50 ("drm/msm/a6xx: Use posamble to reset counters on preemption")
Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index afc5f4aa3b17..747a22afad9f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -454,11 +454,11 @@ void a6xx_preempt_init(struct msm_gpu *gpu)
 			gpu->vm, &a6xx_gpu->preempt_postamble_bo,
 			&a6xx_gpu->preempt_postamble_iova);
 
-	preempt_prepare_postamble(a6xx_gpu);
-
 	if (IS_ERR(a6xx_gpu->preempt_postamble_ptr))
 		goto fail;
 
+	preempt_prepare_postamble(a6xx_gpu);
+
 	timer_setup(&a6xx_gpu->preempt_timer, a6xx_preempt_timer, 0);
 
 	return;
-- 
2.50.1


