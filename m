Return-Path: <linux-arm-msm+bounces-64671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B5FB028B8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 03:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 944DA1C81CE0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 01:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71511F09A3;
	Sat, 12 Jul 2025 00:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DzYmnk9p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57827205AB8
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752281929; cv=none; b=tZA1d8rF+E0MxfWG7KaGBJ/n3A2mP3hX6vG0yF0uZSJ/WQfNB44MSgzjF9zP4/WEcm2FNyxQ77VApokqLpptYtUq9/w0PRkYs+xCH197ham7zRpcLy3dLCjupLBtGU6xuA4qlZLiU+TWg5oJPNkhYfc8JBsrFkDlfmTF9qkdFB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752281929; c=relaxed/simple;
	bh=yjltdvgzQFS/rBBYfAe4dvA1j+EvnEUZxQgjt30Wp1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RYKWEw+NOj380FMwo3Ux0kEtGCQls58LJezfFbtLcBVoRisEKpMLg9jxlX/I68AKVqknINi+zhT+UNc+Jaudlh/vzm8QPfzY1RUInvf1lqokHarcJ3LqOQxwwSPL6MFTzuNFvm7dme46PGJnymJbEEltVWwAGLao/P9BlHvBOYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DzYmnk9p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAmQ7u007998
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kpz0sBR+v1h/WdMG/RhlIYKzhzI8L7RbaceCFIlPTic=; b=DzYmnk9pMCKKLcPt
	7or/cvo+N4cER94N3rqKy+jWI5yc7iOodbhyOMV977WQQZdDRP980jFaXGYZNoKi
	uuZF9rAjhOOcXixzXjOeljeh2e0wYJpEIIUqNAfLP2iE22Z8jYdhH55uNDd9fCyD
	iVeZ9Yao2qNOCWV3J7aaCXNlFmTIOz311RshrAyn3ip2TnUYZm0GA3pckQsxlrAh
	fqkHpDmlk3rLB9gStkwLeECtrqZMasxD0/ydCR+jSRN6pD0+7mDNdMX7g8fPiZyz
	Z8hK5S1E7xOg4ExlnsLNyKGlqWrCJlBAVV+cNQvtmfZLiTZUle9yLZ0lB1pOQYXl
	XLeuvA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcga6t7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3132c8437ffso4011302a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 17:58:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752281926; x=1752886726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kpz0sBR+v1h/WdMG/RhlIYKzhzI8L7RbaceCFIlPTic=;
        b=F9UNsusG0Q6mJYSdZQ28LcEjba77OL8KF+I/svePvNznIWI6Ceb7etrmDJbzdbedyR
         nU+0u8VQ+l7cizuld2xt/jaaxFPE3CKpx5oWlYqJvNWnMGTGlEEqzkW3CDxo3HnY6XU2
         ZwDkfPytUarKXITCuq2PjUF5MpKwg8CsIBTU7qr7bcuI6s/8BXv3MUVaIX8h3uKuqDbd
         Zl0RWNEKLBFkDWcX3u/gFjtVMw5MZhB3q5fGM2EdTIBY3ut+dqQARhJr8Mpj+BGqoPbH
         Nugspc6xZkoTFt6CbkiXOWB6QeJkhMD/3DbM15qrb/j068Z4ZoRaCrLqITddiJUcaEIi
         1t8w==
X-Gm-Message-State: AOJu0Yw9mXAn5EBdmT3KmJSI9gXYIZOMwbCVXKyvfFH0JeRUYO891/2p
	CpHUVMY46iYrqwmcOTCK27HguZQLPrVuNetodFnvQaQADcNrnuwh38N97+R7pNyKf5WYX16P1he
	ZocFN1MBdLiBzETs+zqKc9zkBLtoMJDOLJeNiuICERA/OPMncQBEBywm7wa3D7y3cNNzbzZ2nOV
	Ec
X-Gm-Gg: ASbGncsVBCxR9FG9YFO18rlGWBf5NynefEN9d68PWAqYqqyoZqHH/7QNXuTZn74eGEM
	AZKMOdZRmGA0Bbeui6jO5Q4n1OlroHTjTGeBVnHJbc7GJWU6m2o4vLaQuJN9GvBtXlsAPOuL4Om
	0WTqmhnR75sDVt3Qe2bDIp/e/+gqXSA8qzM3gMLLPb2vTdDRXjtCl/6tvqb1KJO32VH6RziJrcd
	MITuLu2dl2496+pcFkrcIKFncYS6APCaZV21tNZev1sz3RzAVHZ5/C8nnShlrLJSYP3IUDWd3X5
	a0kod00sMT9HP8liQ2rTWfU0i2jlFYTK0kYeGmuHQ3R+IBkmu3L+k1bAu2HGuucsru5afCSnqyO
	uIsLVG2Cud2442AiwgYAnWhM5
X-Received: by 2002:a17:90b:3886:b0:311:d28a:73ef with SMTP id 98e67ed59e1d1-31c4ca845famr8018760a91.10.1752281925785;
        Fri, 11 Jul 2025 17:58:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKh0L/9TQnNmBay88tOhLWbbUb90POPJfrncC4mgSklO12N0KVR5eOs5fxviRSmmoM4Hox/g==
X-Received: by 2002:a17:90b:3886:b0:311:d28a:73ef with SMTP id 98e67ed59e1d1-31c4ca845famr8018725a91.10.1752281925320;
        Fri, 11 Jul 2025 17:58:45 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 17:58:44 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:17 -0700
Subject: [PATCH 12/19] drm/msm/dp: Drop ST_MAINLINK_READY hpd_state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-12-33cbac823f34@oss.qualcomm.com>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
In-Reply-To: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=1230;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=yjltdvgzQFS/rBBYfAe4dvA1j+EvnEUZxQgjt30Wp1o=;
 b=WfFiy+F0KkPjBLpzzbEf5tdoau0ORRRNR4ey0sQZ/xL06nlHnVc1WCtGxOBpGqdwwrs2bFYu6
 FD54qCrYupNCmUD7Gmmd/+FQEoCpVzIuDjYOmuh1aFneX8YdiD/3Rp/
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=6871b347 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=5QVpEtgF4fCaE371oBMA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: wG7xUwc95sleL-uw_HeMkbh1IB-S9wOB
X-Proofpoint-GUID: wG7xUwc95sleL-uw_HeMkbh1IB-S9wOB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfX1+hGfcI3aPBH
 resfSttgl19YoZMK4mWfJcXGTG8SWALTr3yJQMQkcswgD4qq1N0RDBM+OzDQMh5oC3868dfJjdi
 KMTgvUymPo19fC4L4637pXVFIKXNinQs7JW0tHaEK9KFCOZginGWOT0osp1ise4fQOH3py0XMo6
 whq3MolMAqcwLBuxZGLsS5LZf3UBc66/ln8cizAfo2JF7MNFCAwtrSKLO15PIWwXgeyw5DpQJNZ
 +HI5dMk7VF8jklJyor07U+WxOovChZxzBYugyv5FEHSwKTQUIeI/X2K7S9gDZT02+UeL3Szth11
 0WRxtDxQ4kEeA0N4SPMNjE2BW7VEK5bC9DK84vPt2xp8rXaoTXrYiYd96pxv81kqVksJrGfPI/l
 OMae6LivXO5e2khn34sos9+csujGFrbyn94MleGLqKJgiY97tcgW5Fgcaqr3XkkQtvfI7NGL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507120005

Drop the now-unused ST_MAINLINK_READY hpd_state.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 17093b78900c..5efc8d4ecf54 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -46,7 +46,6 @@ enum {
 /* event thread connection state */
 enum {
 	ST_DISCONNECTED,
-	ST_MAINLINK_READY,
 	ST_CONNECTED,
 	ST_DISCONNECT_PENDING,
 };
@@ -526,7 +525,6 @@ static int msm_dp_display_handle_port_status_changed(struct msm_dp_display_priva
 		}
 	} else {
 		if (!dp->msm_dp_display.connected) {
-			dp->hpd_state = ST_MAINLINK_READY;
 			rc = msm_dp_display_process_hpd_high(dp);
 			if (rc)
 				dp->hpd_state = ST_DISCONNECTED;
@@ -613,8 +611,6 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 		dp->hpd_state = ST_DISCONNECTED;
 		dp->msm_dp_display.connected = false;
 		pm_runtime_put_sync(&pdev->dev);
-	} else {
-		dp->hpd_state = ST_MAINLINK_READY;
 	}
 
 	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",

-- 
2.50.1


