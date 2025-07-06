Return-Path: <linux-arm-msm+bounces-63846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19369AFA499
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 12:50:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F87B189EC0A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 10:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9EC202C46;
	Sun,  6 Jul 2025 10:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="goY77ZMh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CEE1FAC4A
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Jul 2025 10:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751799048; cv=none; b=NM7IoNw5Nj7Qk67PRvgVQZXU4EVnbYhxVfD3NAFAonbkhdrQtDXNc7Xse74V1u08XEeRBRTtT0jh9S+1Z66j9xT51hcsc9uY57cj+HENGyjeHcIgiee5o8PrWdj7crwFZkTOPKS/j07HUuWrvu5gPhUE0hUkMPK6ex6p1lfv0dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751799048; c=relaxed/simple;
	bh=N1V1r2a+Uu111oA5aVLPWmTma/v7zxodScONBUW8ukI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wavq/8+qlGZ1uWhA0lHSWwKtLLHKjPCRZjo9N6v0hPEa06/golVt/q7XSTCUudLMdnoNcQQzWYjZD1gbqjwSlBmELHeqNdPpD2pVF+s9a2wRpcZgMbtFoTYzx7hWVD33ou6I1xIKw6aUUwSYYQE9TwXyFQky3vNnEG+EEak5AgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=goY77ZMh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5666xTXB015390
	for <linux-arm-msm@vger.kernel.org>; Sun, 6 Jul 2025 10:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TXj2kLxWlavFfODBCwO4C0ty0sy70kRk1f8+2FzBiKk=; b=goY77ZMh7wpYl4CD
	97r0d25IbvAKRjshLAnj/gebj0p7V0ciNSu2pJKCR7nZ5W2rnw7vU8x2pcT8TWMr
	WreXaFnLMszLfn6FJrz3ISm2wYOz3qlwyCIDLOK+wtwm9k1sgmngyxnegxB72q9Q
	cUH59uIqnc2DBCLcXsmdxQNVom040/8Yj/PritiKPxk+LbHNxcP3vWnEBH4aONrt
	mEEccjWRn3JMMfC2csJclEHKVPurYmRsLCW43jaGhuEhH1awuHbXddPRcnmucP6d
	o8383lK+NTs5/RSKWMuSX0recRtg01/A2II/03Lr1TjjfmZVSLKfFUcRM92Rdvns
	PtCYMw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu0vukfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 10:50:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d460764849so559485085a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 03:50:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751799045; x=1752403845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXj2kLxWlavFfODBCwO4C0ty0sy70kRk1f8+2FzBiKk=;
        b=bc1AQp5PPTZFFX3mxx1Mb+lJpV9o8RJNF/JBf+vMXDGJeqxef2RSG2tW5fmhl1GQAL
         vhRDcJAaTf8SnKDENjoyBmlkdR5xJcrJNWisT3VmDD3cKxqstqrhbrESI/5lBxo80KeG
         74CLAJxT+GlDGu4umToWYMhE40gzEIHZ/GnUlPNFzuX3tmIfsrHBCdqdTKwhJ3mUtc6G
         jpoVROR4MPqzB7fAVPKIN1XOBEVE67bZ3k8/oAbtQG+nHDM9JS1HN1FYBM8OfSRztSmt
         98FMq7hBvXzXdjvMv9U/wpWurcR0RJ2Fh1Nmd14JiVfZS2H88RIoaNI0Zgr/Rlhai/ee
         5cvg==
X-Gm-Message-State: AOJu0YxicKOvGQA059hKWgUaOUDwpLAAY3VS1i1ODohpo5BSrgR/Kfep
	woyHjGfwryrzc+S+EQ/QFOiG4I38W8UxSybnlX1sDaoZ0360H/+cZ9CbLbz78wUDzRtxZKQQAhc
	udQ9K5blJIRzciaLQphL7rOnsKkGcMqoWZHc/u5FJXpy3FW6SqzWdPey4EL0PuqnHxFIZ
X-Gm-Gg: ASbGncvUIxQceioMF94CF1XSSJ1zDReuSeyZK8vO3DIfLYzZPt9Rq1Ov9IvD+E5QMiP
	7p8ywyDuvKBQn1APHUz2rNVFNH/4qkwm3bWrBkQpNZTjBbW7dPKlrQRXAuLjIUOvK9CaOpLP2tG
	hdjTePAOjHEU24+DybHY0wtrAVurnQXYJ0TPXETPSwYr2KutMSgp5bfox4DShurWAav+2GZ08vi
	Skc2k4O6dEpxvCZXWcgLv+iiusnVaJ/FJh2kIKefEynDRyr7i+3YZYfgapRBhHb280vN4Gf/4/M
	y5BvnNHgjHQYbWA5LqqZCAA8fDvjS1JRaEXJkNU5PDU4jKS867FuzzOwgROCCOIWYNKpPGjV8Xv
	w2JEWBGa3KaUANTWl5J6ajwZkifb16W1m6tE=
X-Received: by 2002:a05:620a:6289:b0:7c5:95e6:62c9 with SMTP id af79cd13be357-7d5dcd47e14mr1035826685a.29.1751799045094;
        Sun, 06 Jul 2025 03:50:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENzyvjnnPNU0+auiROsO8L9tJv+5rcHPjjuz97ShcVFzt8dFEs20zG+8sIADzQBxRqDaUTUA==
X-Received: by 2002:a05:620a:6289:b0:7c5:95e6:62c9 with SMTP id af79cd13be357-7d5dcd47e14mr1035824685a.29.1751799044764;
        Sun, 06 Jul 2025 03:50:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383bb555sm920621e87.20.2025.07.06.03.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 03:50:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 06 Jul 2025 13:50:36 +0300
Subject: [PATCH 1/3] drm/msm/mdp4: stop supporting no-IOMMU configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-msm-no-iommu-v1-1-9e8274b30c33@oss.qualcomm.com>
References: <20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com>
In-Reply-To: <20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1188;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=N1V1r2a+Uu111oA5aVLPWmTma/v7zxodScONBUW8ukI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoalUBQahHAv2TwvvVK6FFPuXM20VbAQOAG8788
 ssuEBgbNNGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGpVAQAKCRCLPIo+Aiko
 1f0mB/9PUKhWISZlHBDACtU3YF/1alKgkRr5n3JHsdRqlQeuTcv7GtWeTdbBgfcxxcR1qnFRZwd
 +o40ttKKbXMaTPm3hfz9nSbot1W+caMuNXSLtZUzk2tDECCK0EGsPk5UrRHzVOV9RGR8fWK0Gqo
 GW9m7ZEIJOJqOPXtzaXSeF9DBgHtbWr4mvxSvipVlRBUgJzUCQ8rmNdkpcvdwB/LWtX+d9OSdGD
 XuiYccV7R44JUN6RSc6EhjfQM953FfA9QFRMvrTSqbYhpy+DrYQyOGQm+MvMJmU45x+ofhnueYa
 6rrDlr4nMhqujzT8V2Zrk7tqCMpl4zFHJMRZGA/hBUIxxDMa
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: QSfscaK3M071TXqfDPlwlPR5o-5Uh1B-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA2NyBTYWx0ZWRfX/qA5cOGbAOAP
 aaZdCDfEXq9V8yT09q8A7OdsJ3q3sMnnD4sg9WY68pWBktmmQ5XEz44Kl+kcmP4nYlplWLrbX3L
 Wrv7Jg7j4+wECkz/lNpeZKLhS3M9mPynbD3yPMND9hu2jFQsvRl54GdQcBu/ipKKL7bhphQ6n5y
 je139XIrIKQek+NxLXDgMw2spT6ztC00a3zk8XYdLj+doic1ck1DkozSTJ+O9ZrP0jT9rQZwD6l
 8cdGqyTvTTAzGZAh4mJDWwc0PXjBgT/6BONA23DcBwRX2CSo4zDyvlz0Z4Q2MfarXHDPtHecZVq
 dVfDoviLnzTDGS8afVicxQAmst2iQC3ox9C6Mp0AbIrMIhJJYZeSEHvMmmELwllDhCERsuvKdci
 zU5C62y5MpKl8V20xCL2k+jL1NyWukD1TWIp9EHu7wvoB4p27nh+XDRV9erRnYierBxT0tNC
X-Authority-Analysis: v=2.4 cv=Rd2QC0tv c=1 sm=1 tr=0 ts=686a5506 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=0pe4r8NFi1m0JDAohsgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: QSfscaK3M071TXqfDPlwlPR5o-5Uh1B-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060067

With the switch to GPUVM the msm driver no longer supports the no-IOMMU
configurations (even without the actual GPU). Return an error in case we
face the lack of the IOMMU for an MDP4 device.

Fixes: 111fdd2198e6 ("drm/msm: drm_gpuvm conversion")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 0952c7f18abdca4a7e24e5af8a7132456bfec129..88296c41d1a5eb0e16cb6ec4d0475000b6318c4e 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -463,9 +463,9 @@ static int mdp4_kms_init(struct drm_device *dev)
 		ret = PTR_ERR(mmu);
 		goto fail;
 	} else if (!mmu) {
-		DRM_DEV_INFO(dev->dev, "no iommu, fallback to phys "
-				"contig buffers for scanout\n");
-		vm = NULL;
+		DRM_DEV_INFO(dev->dev, "no IOMMU configuration is no longer supported\n");
+		ret = -ENODEV;
+		goto fail;
 	} else {
 		vm  = msm_gem_vm_create(dev, mmu, "mdp4",
 					0x1000, 0x100000000 - 0x1000,

-- 
2.39.5


