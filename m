Return-Path: <linux-arm-msm+bounces-76301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C1114BC351A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 06:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6E33F4F5856
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 04:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 635B22C08D5;
	Wed,  8 Oct 2025 04:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CLH7/0GW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4AB2BEC5A
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 04:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759898008; cv=none; b=OhGwjZgeWARPjqW6X8valyNTTxAGl0U96pWktnCFTdf122gp6iTquj5v4KPbYgre6UzdgkiFsECnslX/0qEMcrxAuVcbaeKLYxYzhFcG6jYrKKnXmlwDWi9Dx2gr7ZJJht+meLsxYaA1i/rloPxVap0hqTQwwnvCS3JdeeuxHvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759898008; c=relaxed/simple;
	bh=I4dDFo0IzxPriZN7knT5nIhKZ7qkayg76Lj+xM8mgJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vBLeMxsjEKiXTy9fdRdxsvVtcQ+3hAWElmwRACZkGD2oXO64h+ZyLNXPXQ1w4PIEUUieXkgx4/0CCTBCkj0raS20tDcuu8u8yYHoquvW3Su9DLlBgprkuoYFwfaMbv2HH5hvT3zUnfTtc2OhmPil8Q5JivdTNvU8AZR2/7E9N5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CLH7/0GW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59804GK1004949
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 04:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CkpGC3QKPB6IOx3Ma4I/10f0rxAG2IWVMaxvxoJMBGU=; b=CLH7/0GWHqEYGtuF
	3LAesdETOq7vS7zmDkVlcq+8Iow43Wfk347zzRhgXrs1+QTTYBIisoCaSQVZbFbD
	09L1oND2xFAFAB1sEYBcONWRo4PVpawYbThTgqR2h0R00IpCimJiKFFQxW2uJNh1
	ht86pXltU5mbfS35EdEx74vR1htU/F8OByXW6/yMpSFaQoCuIbgGruu5CCJWrrq3
	jxXoFqqwuKg1Kevobf01r5cJAzt+iv5+gH7Sa1YLpkxI8g7VbmI2hkJTtR19iXtD
	0Am+0q64rp33W+/RqiMV5Pdwpddqi+fip5d5xZ4YRKDxAC+HW0L/4AOLgIS9/bCL
	e2qtDw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvv7s6ha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 04:33:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4de53348322so279558991cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 21:33:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759898004; x=1760502804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CkpGC3QKPB6IOx3Ma4I/10f0rxAG2IWVMaxvxoJMBGU=;
        b=DTthxGPwgLK/oTErpk/HErPfbltsDv+JIt6nIPAbl1aeb7/Mu+gU9VTnuTZwpkTICA
         9IPrEgYruaSsRKRHpRSpxn5I0NE63ZhA0KYVQN51FcZHAZM/oKUb7g7ICcliaT7zWHFz
         BLn9AaHcGUjVmFCaK/8gInkSTybE+OxRpwN6ekA9TwmzlS18di54aJRzaWPO+ffODxOk
         sS8i8yNdYAVjEkgVQKWLcOuzinMDC6AyZ/JxbF2D7YHPvgxddpox2QZmiWhzJtuPVV4z
         37+epgJ3549bwt5GO6mYsJDDWbWsSZDyzZ1/PEy4RRhZGjvq/rqbTHc0PDBtSR+Wr4yO
         2OkQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0XIJiSsLqSSZzNnnhXzBevydLNd8Zor9Hn3Ff5kbV6oumhexzDRQz4ZMnhe/pc+3mJk0bumpbpqdEnwK+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2VEJXXRE2qN+iJZMeM7gH1GOZ5QqXEV49UXlZs9G1C+gmaFTF
	ai+Lh4ynuVR5SRUIOeu893NCU71NEENqOdj6PpHV2LTlWhpDznB8bwE43FGKXrrHH4+L4wyVNEa
	xa+htRWvojdfkkQMoUCfcB/y1zrf1d9ZbE/fpxFWTpEkjrqeBh08NZiqddGewS0Fg9FjY8Irpse
	pp
X-Gm-Gg: ASbGncu0nMOMU+FGkRubMPrs+MOAou2I3PZnzNanzMhWO3pT1dHY/lH5Atl+Iyxy7HL
	vaScT84/uvVGZVn6mRgHAUwr8cBhfTBsymYw19SwajGBVy2ABMLaK80XgpYD6mWCLQZsc4LJ9Fy
	vxAtQdQ8yDRHCHFar8AFl9irgtldWA8HmRRXURxXyD6lVMCTsAk6HLhkM3CDXisoBxjGHlfX/z1
	fYSQ//MoNcaR9ZLf3YL/9IBa4QBs1N23rX/LVIr/0ORMCpBlRXUDI768VZMlMjLHmIdwvKMcSIT
	dkTQd+OBxYM+CTqqTnwQhJN4zt/EmG+Z+SHsuoAwCjkBS/Wv9aBMlE1ON86xg65hFgsHgKL/bm8
	pnyuITKBld/IZouCJWj84e/MjmTm9L2s4tfK/oTN7wXey6yxEtSrQrP062A==
X-Received: by 2002:ac8:590c:0:b0:4e0:5cda:9ec6 with SMTP id d75a77b69052e-4e6ead91c12mr27068151cf.70.1759898004259;
        Tue, 07 Oct 2025 21:33:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8kM3Oryp3/2tw8jgZmztY0G7AFi+6cE/Qc5lYn5psXENVanRiu+Hhm5CHAlCXlL1gAxqVTw==
X-Received: by 2002:ac8:590c:0:b0:4e0:5cda:9ec6 with SMTP id d75a77b69052e-4e6ead91c12mr27067971cf.70.1759898003788;
        Tue, 07 Oct 2025 21:33:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119f461sm6751107e87.107.2025.10.07.21.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 21:33:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Oct 2025 07:33:04 +0300
Subject: [PATCH 6/8] media: iris: rename sm8250 platform file to gen1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-iris-sc7280-v1-6-def050ba5e1f@oss.qualcomm.com>
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
In-Reply-To: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1302;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=I4dDFo0IzxPriZN7knT5nIhKZ7qkayg76Lj+xM8mgJ8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo5emDHjUsiHFflcSEw1+UiRtQqy9E0yGxqmTqA
 kwhNWMOj0SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaOXpgwAKCRCLPIo+Aiko
 1bDXCACRECfYAltsL7sONUXIa5n0ZxrXgjkLfN5silrHFMw9KtoL4K1n8gFNsfen+1dqhTk2rGA
 5z+Z8xBegaaMfXqG0BD5v/cQDNU6O/pmyuPHPnpFJ+HXmkZUz1/FJ7AO1vtDJi/dgxWq47gjJbP
 Kd0RFrwRTXGrspxhO7ik2LLxqWjCiRXRc65H48JzplLRwl5HBjUCaTVgZuZYAcPk6X8iqcfSvb7
 iEXgMVSBiJsQLZp1qO5AGGOSLUM/mvfGfHAnLdaxXkm3erQTmTj3SvhcG85/cY570zJaraYXdEw
 ysRsNhzHkpcIqusnbos0bATGIdVVY+uM6VWSigOSC4gfbNlz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNyBTYWx0ZWRfX5RZ3WSYiwfHB
 A/n/hCOPWDGgONLjr7jatc8/Aqtg+o+V+fKlH+Pv3Mh2qhVVw6icyMOwxwd9hUPtvftLJAr5rTI
 PM6PNrYlQiUY48v031PemtsI9QCYowy/2UlZp0QvfM7iBRPTrZPp583/GtohGiNpfHpChjJYB5S
 FnFMW6FvslexKWFu3JDWtXXIRNjT9hEzlCasHnXjSw6f01Un5LZpK/zLc1o/GvjB3Xv89da2BCY
 sHyoVJwMXGDgBpx3lS5lpNLxeC+HwursJLG9vGo5I6lQ5nNJ8n3Iio6WW+gUgeZN6myRxefIgvO
 pPElbDmDOyi3LJRp3WlGVjASmnLmG5p9dA8B43IwKOlajaSwqfLSdY99Jc5fdrz1Jh4uY24URoA
 d8wDdTt9BCJRU8RV/BFct7iKBia9Yw==
X-Proofpoint-ORIG-GUID: nKXOrjgDop2bxFj-7taAvSRcI1Q9Fi-x
X-Authority-Analysis: v=2.4 cv=WIdyn3sR c=1 sm=1 tr=0 ts=68e5e996 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=OYuIXoeRUKmE5Kzn4ZAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: nKXOrjgDop2bxFj-7taAvSRcI1Q9Fi-x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040037

In preparation to adding more Gen1 platforms, which will share a
significant amount of data, rename the SM8250 platform file to
iris_platform_gen1.c.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile                               | 2 +-
 .../platform/qcom/iris/{iris_platform_sm8250.c => iris_platform_gen1.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 13270cd6d899852dded675b33d37f5919b81ccba..fad3be044e5fe783db697a592b4f09de4d42d0d2 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -26,7 +26,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_vpu_common.o \
 
 ifeq ($(CONFIG_VIDEO_QCOM_VENUS),)
-qcom-iris-objs += iris_platform_sm8250.o
+qcom-iris-objs += iris_platform_gen1.o
 endif
 
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
similarity index 100%
rename from drivers/media/platform/qcom/iris/iris_platform_sm8250.c
rename to drivers/media/platform/qcom/iris/iris_platform_gen1.c

-- 
2.47.3


