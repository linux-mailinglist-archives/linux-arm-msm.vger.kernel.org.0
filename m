Return-Path: <linux-arm-msm+bounces-71558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C8AB3FECD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 13:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD665163CD3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 11:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A811C2FC867;
	Tue,  2 Sep 2025 11:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oNw51qeb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7C42F998A
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 11:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756813860; cv=none; b=jxNwaykV21dAepyhbZKJK25qkuWYra/qemnadrBgPZ9Gnm1WEnW83ekr1KY+2LKQzE0cuh7nvOvWJ4HF6wOUcXNhUXGIQqTCWI65TaOuZK54cFCB7TUWalx80hsbGuYNjDjwOy2FHSgf4vpHUriXUAr+Yo4D9L5Yba/VsXcGszA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756813860; c=relaxed/simple;
	bh=NOwN+cR8tlV/aqnCXaU04cGy/XLeEqERgLf8m3fHuTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jycc0XQVqo4kN3jyGr8Kd0WV93JcezOo4SOZbK8UVebyX2yTMQqlw+HwnVYbnSr7LfruCX6yVdcS7V0POdUqv6cUIxmNk2iaMbiFcvqr8MusT92UM2QDWimU6yDEFhi4tZpnvbMCxZqhq53xHmBMFEohsicP0x5cZzND5TojNG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oNw51qeb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582AeGJC024999
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 11:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uX04f8wmwAHTEoCBwCRpg9tdJXyCAWOIBcQwAGC0LXw=; b=oNw51qeb20gRjh5K
	SJcSqN5ur9YoYdqRKWm9llbBe3eiVlesT2Fx66WHqOb034ZYy3dxmRjtYb72jMG5
	5/0vqw7EPbnbe7QVv+aPp1UWh0KHrSFGohsWTQN1VkfBuqogbs3IXMMwPvITfNDp
	VKZ4Lm3RH+KU3F0u/iGhPXWx1L2HBjOybiIN4WZnQ6oTmnUNJUX4krJqhzsmifsF
	uNjxD4q4MCtzk86FBcjDYPDQ76v4d58SfkT/di42x2MaC8ra9vHhOJXTCfZMe9nM
	5fiCvpVWJEwVBV9RKzLOgHzsFEpevhoY7FPLszqABuVCn6s+yZVDcUXqQ8UX2Iam
	tIk+EQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscuypcw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 11:50:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-329e1e3b25bso720894a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 04:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756813857; x=1757418657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uX04f8wmwAHTEoCBwCRpg9tdJXyCAWOIBcQwAGC0LXw=;
        b=h1l7D06GApe0BLfE8nU8na/P255o27zdNVfVYyydBFTfJLlyoOyAipw68UoZLCFakl
         FvaBZTQgdbKi3n2NxGNM+AFj5upPxcwaEnKeRJ67lzY2NCv3795SIpMAq73Js/Fd2liD
         V71ogEqQYvOdAahIOVx/fC8FeViaJNNIIn1A5lmSlbNZuUGFeqsXaWrFdS7pxm+6JFRz
         fwDUq9Ucf21+s9RR5PwY8/nqR0JCON1Yne/u6lwV1khVAGaCWvIVEsFSvWeq07BATbre
         ykJaerqZKQZP2fBkx1opjRiag7J2P/aDJjfWpZi6ZYxqZzdYKkod5W5pKSUyxuxgoE5H
         QU0w==
X-Forwarded-Encrypted: i=1; AJvYcCXKBLypHSZBgNYzU21E7W5/1HdSVYl3YLhjKH3kJHegyiih2t+XmLVT/V1sYPCoSCcyTQmC2qlZqchrvPld@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo0lvhq3r6b4JSrrVPgMth35hrwUFHh0DSnFIoSSzwk1BrYLD0
	/67ljkBpgcwz6bc1Expk0/RWv1ii4g+ck87faP8MV3vw0LdikDj7QhYQERQpHnzZl31M+QfM7Ap
	+ytGCT36BnPIxuPNmz9k5yCcyXC0RU31rLD05ior1wnCFwA+OE7LuXF+5AObNOnh5Q0yM
X-Gm-Gg: ASbGncvIprsmKGYVGPvOEbI9ho8rU/3I5ZieOp9HDBvwi9Pua7/tDEOOGd8BNKsoe7+
	t9JGC6y89UIc4MIaMs7mON5dD/J4hLIlDMfdwNjLZMGrdiMqpfPZpSW7IJEnoV9YW+oUATI4dzO
	6Ur+TLUUXRW5gHTJQ1Hn5P+SHqSUkAI7OvX3ANFHmH8pK79Hn91Eu3D3c6hVFeyni5qSCq1aMx5
	TSVI2Pki7l17wZ5gQsr4cygeSJnGac8/F3VY9QNrHJxkveDpqhVAhMibWgu0a4W9gS1b2IDunJL
	+dBaNywtyLh5dZztoK6WQZ9yDxRx6UEniZJhItfAA3xKztX6fExjYTm5FKIF5kyI
X-Received: by 2002:a17:90b:17cd:b0:32a:e706:b7b6 with SMTP id 98e67ed59e1d1-32ae706be21mr503222a91.11.1756813856666;
        Tue, 02 Sep 2025 04:50:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErTRmAFRWJHqjCbxLE3P2bbrtdzC5Cpz+xDsMeCUqIW1F+tMhJ6J1sfw37u0AjKJ9vrGGI6Q==
X-Received: by 2002:a17:90b:17cd:b0:32a:e706:b7b6 with SMTP id 98e67ed59e1d1-32ae706be21mr503191a91.11.1756813856183;
        Tue, 02 Sep 2025 04:50:56 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329d089395esm3175428a91.1.2025.09.02.04.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:50:55 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 02 Sep 2025 17:20:02 +0530
Subject: [PATCH 3/4] drm/msm/adreno: Add a modparam to skip GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-assorted-sept-1-v1-3-f3ec9baed513@oss.qualcomm.com>
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
In-Reply-To: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek <jonathan@marek.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756813835; l=1742;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=NOwN+cR8tlV/aqnCXaU04cGy/XLeEqERgLf8m3fHuTk=;
 b=nETh6INr+D/D59TGsO48PohgUoYDADrMA8vDopH+eYwucT0xR9w6Xy9nVRTXxpN6RHUT8Y2cd
 vj8CoQJRz/+CLeVlmJ41VG+K5uMvPKxvAXahNtEUBILnkPu31iD82g2
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX30jW4PIHNE2P
 zof0l8OAn5HOoM/m3qyUQSyL98nCtD1fqrpTUjyCiBtcl5TDJr+OzRtJ1Z5dRPzThBXYUJLoRpz
 drw5K08060NPuQ9PWOGoPprSrq048d/EaJkhioO5eN0rp5xA1+QXv5gajHOjLr+cMscHlD/4u4k
 5FVZQV1IWrRf0NYl3/nMDDOwMWHFuBYiBHE3wSSnIHjvNHvIS96sVdAERJx+ySXKL8KGUBvyM9N
 UWl3jkx7bS2iDLAKWkvwOFZJaEeK1vLDj/+XYfglM1Q2njpMV5yxn6T2qcwtYOgIZZOF26D+hEN
 DUOyaXM4GuKcjcbDIUVzuswe/k2ov6ThtK9X3VBmghAxFL4ytpUbkEUNJnfaVyO+G33GgH+prQD
 /M5N8rGU
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b6da21 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=5u7-6dn6khLgd3CzhdsA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: ufyQy0GAg3j-aK_CLWbZU4F6EyXaKp2W
X-Proofpoint-GUID: ufyQy0GAg3j-aK_CLWbZU4F6EyXaKp2W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031

During bringup of a new GPU support, it is convenient to have knob to
quickly disable GPU, but keep the display support. This helps to
fallback to 'kms_swrast' in case of bootup issues due to GPU. Add a
modparam to support this.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 50945bfe9b4992118f23db3cd17ac348be9f9c9d..28f744f3caf7c59412aab06f912cd09a01e185ea 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -24,6 +24,10 @@ bool disable_acd;
 MODULE_PARM_DESC(disable_acd, "Forcefully disable GPU ACD");
 module_param_unsafe(disable_acd, bool, 0400);
 
+static bool skip_gpu;
+MODULE_PARM_DESC(no_gpu, "Disable GPU driver register (0=enable GPU driver register (default), 1=skip GPU driver register");
+module_param(skip_gpu, bool, 0400);
+
 extern const struct adreno_gpulist a2xx_gpulist;
 extern const struct adreno_gpulist a3xx_gpulist;
 extern const struct adreno_gpulist a4xx_gpulist;
@@ -184,6 +188,9 @@ bool adreno_has_gpu(struct device_node *node)
 	uint32_t chip_id;
 	int ret;
 
+	if (skip_gpu)
+		return false;
+
 	ret = find_chipid(node, &chip_id);
 	if (ret)
 		return false;
@@ -404,10 +411,16 @@ static struct platform_driver adreno_driver = {
 
 void __init adreno_register(void)
 {
+	if (skip_gpu)
+		return;
+
 	platform_driver_register(&adreno_driver);
 }
 
 void __exit adreno_unregister(void)
 {
+	if (skip_gpu)
+		return;
+
 	platform_driver_unregister(&adreno_driver);
 }

-- 
2.50.1


