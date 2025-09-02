Return-Path: <linux-arm-msm+bounces-71559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF62B3FED1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 13:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 826257B6570
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 11:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F8A2FF147;
	Tue,  2 Sep 2025 11:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m0oklpbH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3C82FF174
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 11:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756813865; cv=none; b=gpiCCq+Gyi4ZnXftpREfGrACkRYh1yEEWucKDssqEB96YHXfRSy3XalnsWFiqjyswGttF6uUu5jCmyLBDCdINyow8MYnie/BT9AzSLzhnhEUafvODsXUMwZmvbfthbCYeqVfYuvlkEDZbDUmvBqW7Ybl9MX54QACMaN0ipm1owM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756813865; c=relaxed/simple;
	bh=u+jvzNK2e56X8NgPlWVyKgTqTb6j7//8GPSdT1wszhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c13E3J6B7fZxjOdayl48KleAKHjOo8s1BUl+eHK711Fk3qLhZ9EU6K5Yapi4WO4slDkRDBn1x/nVDsLQuQPwCEz9Hasa3GpNxZK5lmEgFNwHqjaLvb5fDU5b/peGv/8FfZHPM+VbvRHpD/yHk+hOpb7TZ/Pda/WI+2dr/Js6nu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m0oklpbH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582BBvVd032344
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 11:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RXbXSoN8+xcQeFZSW7xnjf1gqgKzPw5UBm5otQcCyVc=; b=m0oklpbHMHSvAIv6
	e4GB3pxIvHi3cNzY7ndYtkhNsyPO2fsmSPj/2HU8XnmguTPeAGBz0LGdMkny3Mvw
	Wl+uT2fw4vhblBgRWHPQdKv4UPmKXgC5xd5mbe7i2B6NecSueo+GKCTfzJWnKiPF
	IDlgS+vt3VPOsTnqgSG+EmwnKBr0bm6lugIWPWAYDzZaunBPVo63b/2mf7Qxgeuy
	+8DOkuPzU8y3xf0ogyzPYXnEmt2TqdgnBbzhJ4x/8h4Qeg7o+zg65N2hrmx+lc8F
	dou2AbanwvWOL1mM7igQnDqnO/15dS9/fqmJqVy9p2RIFEL4yX4CAP9NW5eq+8GW
	fIzS9Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8qmas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 11:51:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-329ccb59ef6so1183841a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 04:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756813862; x=1757418662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXbXSoN8+xcQeFZSW7xnjf1gqgKzPw5UBm5otQcCyVc=;
        b=A+W6CJTAyj7s7aDGLd9Nquq4K3VlJRUmtw+Mx6iz65YU1JXXDphjmbpRVAw8ffi38P
         AcdRyd3/XCCJqCSJvGHtdrTdA94UbEdd4FO1sl04KtuGuco6KgfvFwHL6vddgpBBIErc
         18WBM6Dg7+OPLlbQXP464ulz5pHcoDrJy9xIoDyfHfYlzlag6D879it42Wwsh42ozj1l
         6VC1JMZGHA3Cmy8r7aI8JQGDmlVlck+XTFhM4iyRn124JKoVnCQGfD+SsIdZItZLh61b
         Ad9JfS3ilkMczzqLNRTeqlY5NPAHM7H2Rsc6uet+M2fex8jRERlBAWIGiPOXXEdLTnLr
         2x6A==
X-Forwarded-Encrypted: i=1; AJvYcCUX+V8ZyfjAkJCSA+8zwFvpT06XxEkP9QmuLwSCzeW7GDwa//VooGJjg91JXu3BhAvp/9Ah1FxSBtM41bFa@vger.kernel.org
X-Gm-Message-State: AOJu0YyIBry6T6sHFesl92YNPMlfNpyuI1xfBw5SZXFversQgqpZw9ZU
	A4Fm8T8CcJ8cWZo/0r5PbqD8Vmpx6+qlVMAwI5wvWUmS21MOUFDCyWL5qYjPBstcuJMPTHTqDS6
	G6TBp3bjZAj8yKPdT3nNVLdFE80CQi91gXI4UQiPePvO003LCAyqMYGw4gWUUe63hcv2K
X-Gm-Gg: ASbGncvjlyFVP8IkoIPK68RtTWJKwy6K18vpXj3jFmId6Yizu3YIJafr/+UHnn7G8y9
	5vn8KVSuUUf4C67yNdSrdER4qSNup7fZNA9GdUXjHCMxdjyvub1CdRazF1ZKxOVERyF1ddtW2Sh
	TnPjfWjc4YHklNeFZ2ztpmGRQunDmVhMJJQdcXOJ+oEJLQlWA8Dyf34pMK3SdV/oX+XsCvEFxfr
	emAf1fZPJ+vOLBYVVUhl9HDBf07AwpI04HDLpJQ8l627/AuIqykEN3hj8ISHw7rWjgQgBgbBLAH
	tfdCrgTIJnOHc625PDbkU49xm0sPG31ZNvbEIz61EJw0Lq6M7gtD6wAPwf4NO47c
X-Received: by 2002:a17:90a:e7cc:b0:327:dce5:f644 with SMTP id 98e67ed59e1d1-32815436034mr14083554a91.11.1756813861798;
        Tue, 02 Sep 2025 04:51:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoSouSKhDw/XMbQucJtw29inwJa9PXd0lM4uXnFSu8NXWhDmuE8ewb2G9NTAHJCIwa3AK6Vw==
X-Received: by 2002:a17:90a:e7cc:b0:327:dce5:f644 with SMTP id 98e67ed59e1d1-32815436034mr14083530a91.11.1756813861277;
        Tue, 02 Sep 2025 04:51:01 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329d089395esm3175428a91.1.2025.09.02.04.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:51:00 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 02 Sep 2025 17:20:03 +0530
Subject: [PATCH 4/4] drm/msm/a6xx: Add a comment to acd_probe()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-assorted-sept-1-v1-4-f3ec9baed513@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756813835; l=862;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=u+jvzNK2e56X8NgPlWVyKgTqTb6j7//8GPSdT1wszhc=;
 b=h1wuLBfHfxcnM6zFAKgRxWdVDGgBm+1UEUHwJUPl+idhjvX3cN7t259RcLJnP/jnGewak+bBJ
 jWeTxOAo6mMC9ctIPcO0kjFFpFYt5i3C+xqg+hvMMdgsFtncKo35DtR
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: -TOtu-pGCvFai_YNJ3NqqG8K2FRjqaI8
X-Proofpoint-GUID: -TOtu-pGCvFai_YNJ3NqqG8K2FRjqaI8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX41XkNsifO4SV
 Fcv9OC9XQ9AspspOPbSMrgpvA7D40OeQD6M+EHDp2RZLoWJercmppK8hSkM4kuRw9OxcXGUPBUL
 fMTB5xMphpBllQkLTkIAgaSjmIzR2vyFpgFxHse1P76cfCIedEuXsi09HGwJwiWJKK+g6+1pZyA
 P5oERpyCSTdxvh+3fN6izUphmX6xndK9nCs6CUBL0YDdyVuJ9AOL8r9dChlyOgXY5TuxihgZ5m+
 RyeZAbj+ikGi3rlnpTy9wkO+7Fu+yEAYNkU7tSSvWIL/pbSrULPlSq1lKsZumsy03f6ueuWfHAI
 6E/aGAX/gg+1ZWB9zphgaz6X5sxWGu+XV3DQciP+enCnvdwXD9jJzilVnuJJqPswA4eyXlERa0M
 uGr29xnD
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b6da27 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7jaC3Q-7aBCS2g4HU_oA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

It is not obvious why we can skip error checking of
dev_pm_opp_find_freq_exact() API. Add a comment explaining it.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index ea52374c9fcd481d816ed9608e9f6eb1c2e3005a..de8f7051402bf0fd931fc065b5c4c49e2bfd5dc7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1694,6 +1694,7 @@ static int a6xx_gmu_acd_probe(struct a6xx_gmu *gmu)
 		u32 val;
 
 		freq = gmu->gpu_freqs[i];
+		/* This is unlikely to fail because we are passing back a known freq */
 		opp = dev_pm_opp_find_freq_exact(&gpu->pdev->dev, freq, true);
 		np = dev_pm_opp_get_of_node(opp);
 

-- 
2.50.1


