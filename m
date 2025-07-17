Return-Path: <linux-arm-msm+bounces-65502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A3BB09049
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 17:12:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F228E5A1597
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 15:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2CDE2F8C24;
	Thu, 17 Jul 2025 15:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G8AscNDs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFEB2D3A7D
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 15:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752765137; cv=none; b=G25tKRt0f2Jv1aZA47drNnxTLb9YPP3TWOl2c/UbwXDZbAh0f62SEdBlCZb0eQEst431W5DNta1toOfva4KA9yymxVYqD5hPMvI+tM+1YX3BZpkgJBOjMCfJOeoH1FtUQzgmPK70s1hg0wjWaqwIMK6s0nq3c0JxBZMJPlyCXY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752765137; c=relaxed/simple;
	bh=wVby8hajvrOhcz8Tf/GkjQJio0K2seS+IRlprPJ/ui8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qSE60QAXi0BTWLqIc927UxBETevBbC9TKGJ4y6XJPwRi9fzCUGE2Pp4fGAS0aKFLX+66tSMbps8W1zxzsBD3UEBS2NqAxSTAyE1MM0mdMQXRTrJZocVMSTAzC+l/cVP9Yxd275BHPHzioPEzucvigR14n2a5gsRxTTc4XMLqZXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G8AscNDs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCRR1o026790
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 15:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9pJTFEenY3rWVgqlsRhih+or7W0MW5NJ012
	2DRYZs8s=; b=G8AscNDsDktygSubSOSuuClEkViZ1voMSYdMFDhtdunPUR0EhvL
	v6b7c56Wiz2NOApId5/ok6ytPHNU392+vJ2g1mK9liSAvtsGTWHRrE9KL7DzDb2t
	/y08LE+AWiaJ/4HgY6+EjIRlfoBOSoO32iT403u9egb807ythASsuylRFeX3XNRv
	AmYy8llaKMTWLMnFEMsmwyxRyykTbtdARDkcmryxwZfYnevrkYkhzSZOiUWDsAb5
	G9gCoi0VuZ+DFb5VSMi/I5cwvZlmN4POT9bdcIkuoubQhCyx+VV4J1EEhERhUojz
	G+Okan//1h0laG764Evx4GavBX4xhqIwFEw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xbsqcbfj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 15:12:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b31f112c90aso927757a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 08:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752765127; x=1753369927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9pJTFEenY3rWVgqlsRhih+or7W0MW5NJ0122DRYZs8s=;
        b=G23TeYjITr/pDY03kmk8r6Hi4n7+m6sAsAHrWaerheJwSFoniHrh0SdOjgosviixJJ
         U43KhjdquGeIcNwkRrH607i8VXxj4iZQc08B1tG7Lg9goBcxd9TQDi0pgvlW4kAEuXjY
         L09iPy/NrH3TUNql876yycDe6ul2zbHzw+uJsTxPSuQBIkpUzfWxAM4p9uIyffMFOwEu
         8TlpCzRUJmMlZePRGoOf5HPX9+FYw+SzSwsrRghJ8BCgp2jMUEzBRc4PaZZmnlDnx+5w
         gwmLZV0PQa8wPGYETD5ZMzKCwB8Lzt/x8nLyFlulvZXSCorKUAU4XJM1+ax2IyoBm9Pe
         P8iQ==
X-Gm-Message-State: AOJu0YwmYUQnY+4uTlGH+2HjPgRLbQd3an3GMvTlGm5R2Iktr/vMB0FY
	gaG0QDE0C4j3AzD3KOzk9OwGtyVVjj6innC2y78OJtOh4wm/BTJWrQ7DLeAT/iYqSmYyuZUVuZZ
	9pxJ2ivj8g1+hDDhFKNijg82MKYuRt3HNYcA0y56KW9h4qKy5ELRusN1jnElwsU3lwjZL
X-Gm-Gg: ASbGncty7nAGz4I87MBI6t2Wz/mSkJSjaoPOca7K1IH/w0DJdWTJ8MvqqUx2NDxKTpc
	yxSAxIDWn8AcTW597Fu8/q3PIQpmr4R6IkqQFMEkJaso5gh5vNbm4dcDlrMmJwi9pa6XkZRB0Dk
	C0tJcrY6POGVzIdCJpgRteTss0JcKsymj5lmv4Zbq5CVqdoIQJODKHcAUrLqYfHiWqBKT56BCwO
	vwSoSRTqQoecLEIx56U6Q9ddmp5EixzUcdhL7VkFWO9ZpVgtWEX/+0OyZ1rX0rI7bpHwlHo4jpw
	GwbzHy70C29RaGpI8udo0VMXQhK3MidjYwcxynHa7zfNDRwRCgY=
X-Received: by 2002:a05:6a21:329d:b0:234:21aa:b538 with SMTP id adf61e73a8af0-2390c744e99mr5905541637.1.1752765127000;
        Thu, 17 Jul 2025 08:12:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTO8+Xo0qyZNjecPdyEQ1E7S+g3tlFLsy6r4ztKGL0EU33rzpzcW1a1wjSpktmiADaNdA2KQ==
X-Received: by 2002:a05:6a21:329d:b0:234:21aa:b538 with SMTP id adf61e73a8af0-2390c744e99mr5905493637.1.1752765126508;
        Thu, 17 Jul 2025 08:12:06 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5d3esm16293073b3a.4.2025.07.17.08.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 08:12:06 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Drop unneeded NULL check
Date: Thu, 17 Jul 2025 08:12:01 -0700
Message-ID: <20250717151202.7987-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ad1hnQot c=1 sm=1 tr=0 ts=687912c8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=eWlSUfSnBrBg5eVjM6UA:9
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: bwZhWaga0LnUx8nuhEW_WT6DdBeIdOGC
X-Proofpoint-GUID: bwZhWaga0LnUx8nuhEW_WT6DdBeIdOGC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDEzMyBTYWx0ZWRfXy7weSErexY/e
 KD0ZT0mz7iwDCwmv4ZoCV1nNYsKhu4SnkugA8r+bkuKatxEthVrISPkAKEBCOEIzyQpE6BzFdlw
 ZD3F19IE3C8t6AUOxuFLqblYPqi7P3Y81X9MnHpelSXMcLV9Py5WoIWati1a9Eh8CumtFE1CR3Y
 rojHJPWdRJ030FdcrFORoWL/vB+RS/BTNIevJn6Y1QijuUwsgeH+sP4U8wwNR9giLtdSATTjbp1
 NIxq8ei7rZmTixutwrdT8XcrhH6A2Q8rFf0R84+lDhpWKvxQlcQxHM8daj+LRPtYLLgchzzrE7n
 bwcZKbkTV0h3MED3bxkbgWYrl+xUel7dBOd9AHBv7OBlL1Yz+9sUTBVkt9wv7rybeeboNzOHkzv
 iAH6T4U3uMj4PdVq2ZhZHETdjRBhh1EXf8xvWxl7yOkC1cL/3dXzo3sejXlKBiMKj85/EzHK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170133

This is always set in msm_gpu_init(), and can never be NULL.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 55c29f49b788..cefa50192391 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -768,7 +768,7 @@ struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsig
 		return mmu;
 
 	iommu = to_msm_iommu(mmu);
-	if (adreno_smmu && adreno_smmu->cookie) {
+	if (adreno_smmu->cookie) {
 		const struct io_pgtable_cfg *cfg =
 			adreno_smmu->get_ttbr1_cfg(adreno_smmu->cookie);
 		size_t tblsz = get_tblsz(cfg);
-- 
2.50.1


