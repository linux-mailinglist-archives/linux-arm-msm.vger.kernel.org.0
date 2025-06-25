Return-Path: <linux-arm-msm+bounces-62552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66550AE8E00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 21:09:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F0A95A4DD2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 19:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 659552FCFD0;
	Wed, 25 Jun 2025 18:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aXY8dKKs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913512FCE27
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877966; cv=none; b=i8R8Td6GaXj4RMIcIIrMq4NHh2zwtyhhBDQJu7Ki5aEv6vOqUZr9hfL6CuByiqsW2MrKxd/r2de7R28HFaOAU5+qdPXP5nRuj5TududUeKRCYsKKRLgZJqWgjScQ9STPfI98Mbbwg7V6kKp4MnGAcJFWNZPTKn1R+liIlQSzorQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877966; c=relaxed/simple;
	bh=Yc9/xrKw3NesAc8iIakavO1+bxkLrBo6rWFNSTz0mhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GfNc7Hl0Njv30Ss7G59U9YIdKur805ErquOqxRI7/4oC5PAIVvUMqbigunsBQ08ZwceGxCePdU+eIvBaj5U0h7B8ZC77JDbMTxyIXxqABWut9XJnxCvAa5wWG5z8kZXooOnMK2x5/+EuTtaNS1JqHl6ApeXRLjBh1spcSPkJ5XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aXY8dKKs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PD1Ml3015342
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VHBzJXi95z6
	O97WECG8ege8Ip+1ENafn5APqxEppLk8=; b=aXY8dKKsLj/cT/1qK7TVhpav/7L
	UPP86Cr1vsRkmb0BWeGizTgB/q5Qx91qYGLq8/lts3a5LNr2x4p4SZJMxRi6bGKN
	PwdFBELzWvU5FTiWkhGYv1H87BJINRiiCtbtgu1VM5LAka/a98HsKnzn99H3Z/BP
	wv9VzFGfQIkEI3RH+C85UirTfCdKiWozEJjC7NbYofLAq/TjiR/ciwrYsTSGHfV+
	XMvkAZbexekRF4xD85S7FROndkdWfJQdRUw8E0XlKBV5vcCCRmVP8BJrNWSB6y72
	AK1KBhhS7aZiISGhY9EFFKEMbsLPy38kgK/uJOZIxLkkiZiNSfIo1hYUYwA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqqdkh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:23 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7494999de28so303391b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:59:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877962; x=1751482762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHBzJXi95z6O97WECG8ege8Ip+1ENafn5APqxEppLk8=;
        b=LF3C1JFCrjE1+GSrnJdOY9TUcdYaRXh9oVlTcHCI1WBcBEbJvlNPB3L/UHB720hXRJ
         8UXcZO+FNhnMkKYzpQ1aqd24TBcIn1c1H3koEAGiaLn5QS8rdVzvQdh/NNaWX/twJh5U
         Xeo79IekD/FWfIrZ0EwqeYGSeVgDTMjV9V0oIwrbbb99IcJZ1DjamdCvHn7kC9p0ZT/1
         fpGFU7YmzLg0SGHbtZNwC8vhEwzMqxHCA/hU78XQjaDTcE2GDwovr9A7I/Yzk6eFJmeZ
         SFdPazuGnF6CQ1YVb/JpEfwUu0bOXjYJwC3lZcO3tK9HCjAHtISgqDrI8KMdZ9ctqnhD
         +pcA==
X-Gm-Message-State: AOJu0YyYscIOLx9ueoKDeZ/6Pbtl211sKIhFFPqrsRQTyVUswvKrEqn+
	MhmwL2OtixspBen02navWrRFs3F8JXuG6yNlfk1vjZa9NyKKy3LGC5suPJNPXs4oM3DdqJJITXH
	FasKOHE0gKE3UvU/u1Bg1MV/Hrq5O4bj9buULAy6J8DIVBlbHD/E+r06JY9gcB7+9P/DZ
X-Gm-Gg: ASbGnct1XWDc8XJmgnRHPpkGqQyMSoPcUlhfYVdKUp8M8GeJ3L+5NlS5jIhF7cHlyva
	bsqDusJbdFDTqhQPZuGAgZzBQ/A4nx9NfIPGSVYgjTCuWcDVjVOj58mfoOH7vfYjnIooO6TW0YD
	f6LofEvW51kCDDcckai3NhvYpcG3EnLWTvUZBhTlNfNoZDuJFhISU2HRsJwoaNRycFx9aPWaLD1
	lUvYLEUrJe42lZqjLKshFpwiaK5mLaUwrlOV/GnSgLpRITXYJqtk9dJdH0yu6RtUzeznHA2tP60
	IvIlrniZnL8q/kOfQuowV4Zb+YoThrzT
X-Received: by 2002:a05:6a21:596:b0:21f:5598:4c2c with SMTP id adf61e73a8af0-2207f192b9fmr6464799637.13.1750877962249;
        Wed, 25 Jun 2025 11:59:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdvmmyyyzB3Yjf1DpzF4jlr0xSFd/MY9FsPMtHRz/B0Yw+Ld6nyFDHhrmVvlIxCATF6VP5Sg==
X-Received: by 2002:a05:6a21:596:b0:21f:5598:4c2c with SMTP id adf61e73a8af0-2207f192b9fmr6464773637.13.1750877961841;
        Wed, 25 Jun 2025 11:59:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c889d219sm4961586b3a.180.2025.06.25.11.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:59:21 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 40/42] drm/msm: Bump UAPI version
Date: Wed, 25 Jun 2025 11:47:33 -0700
Message-ID: <20250625184918.124608-41-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GyHnTu424NmiiUK1vQVh_iqXUppNZnfC
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685c470b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=KgEaFMypzpKrXJt10QQA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: GyHnTu424NmiiUK1vQVh_iqXUppNZnfC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfXyv/gUYUBN17f
 el96WK5zFM2d2F46A6Hl0h3lOwTB2iLtwk5XcydQ5vntVMsdUU4or6pDxfIgpSfueJjJSne+GXI
 ezFCgr4A9IB13rhQ2J+ZPLGUxOGNcZnKD5T6CoqzqKbgEa0lBB4Xx9Ia3dueKX4D9V7onby6t49
 HaSQNyc3q+tlHhjDbuyVUUPwdwyu/0+2x4GxgJM3LUuueYSMbmqB//N7h7Q8MD9+LCuZp2FH2dL
 pnU5BTMbcCxM59Fd04EVe2YmWDdFh2lYQZCSNZJEWSDNkbV0Rj/GoyUYWFL2QiRiCV0aSE/7d3U
 PC3BxAJG21489VL8geDVIh1hetzpKdCf6Pv3pM3cqr75ANpUtRninqiadFLjTXle3Jc/H8vrtbk
 setM47i9F4yeAx/mLGiEBdN+vKvSu6fLD7xdKmNysrtx5004hGWtcX0yqMIjvaqUrwdHxcLU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143

From: Rob Clark <robdclark@chromium.org>

Bump version to signal to userspace that VM_BIND is supported.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index bdf775897de8..710046906229 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -41,9 +41,10 @@
  * - 1.10.0 - Add MSM_SUBMIT_BO_NO_IMPLICIT
  * - 1.11.0 - Add wait boost (MSM_WAIT_FENCE_BOOST, MSM_PREP_BOOST)
  * - 1.12.0 - Add MSM_INFO_SET_METADATA and MSM_INFO_GET_METADATA
+ * - 1.13.0 - Add VM_BIND
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	12
+#define MSM_VERSION_MINOR	13
 #define MSM_VERSION_PATCHLEVEL	0
 
 bool dumpstate;
-- 
2.49.0


