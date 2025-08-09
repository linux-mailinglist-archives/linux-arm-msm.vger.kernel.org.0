Return-Path: <linux-arm-msm+bounces-68144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10909B1F1A2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 02:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAD413B2A6E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 00:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B0B24E4AF;
	Sat,  9 Aug 2025 00:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="npBGLZGl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37F024729A
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 00:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754699751; cv=none; b=Vvo/aO4ZZdtWV0RTdAG2f4P+dh5FLSjIGx6dzeK1ruvxtKVhu1i4DmH+FlErCqNXAXu29buDOp1tG+kvBMrjGP9WDve7eYIBltI9KPE1d/SgerlLIE6b4+h6bGUwwWD5QDZwfsOUpsRMJeZeBR1I0aBAq/wwVlcqPdSo5AQqbzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754699751; c=relaxed/simple;
	bh=ggjVjCaXkx6Mamyc1EgH8Z1xDLiJkr291pJTB5zorsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NIhXgfv88qPeyqK2eWVBGUGlBoxaJjKGz7WUuJwWxg7fdOUECfBXBY2xRLiaLoVqSRNF55/BY54zoQQHT10kcuy8YMmW6byjDv0PKjRhUeT4B3Bm//tEjKNODA+e7R67o4MIH/Orukmv0un6aeRj/jlzPj1q6VKjH5WEykaF+ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=npBGLZGl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578EwkhA011668
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 00:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3eZyTM1lKAlxwHu0KgfbpHrzCleYc0+uy6KH19detY8=; b=npBGLZGlyc08LaU9
	kco4hlyvKU2rGweNbK6e3aJwO4lcjBj+EJeHiLv+73LNdhlCU6JX/eG4np2vuZGv
	+N1c2UGqOJFE8HnKbNzQ65/jM11QgmHEmx3zaH41+Y1Mq3F6so2XKaW2HQ/QeEfX
	ZHJ5R9GDF3elvWzYIU5eBP56zcnqXdUtpjYEjjJ+QI8uTqrZes3Wp8/uefdFgNJr
	+1YL567h9yr+WnujIu9aaX+kJ3VQQvAFyql3HzgJ5/qd8EL7/VYfA9uVx9WfyC3o
	kXSS0c6L2Fe516WBdcJwDLkZm8zFBF00MwHWFkPWHKiC7ykul2CFwJFHMgdqpUol
	qkUX4A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48cpvy69dq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 00:35:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23fd8c99dbfso22177965ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 17:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754699748; x=1755304548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3eZyTM1lKAlxwHu0KgfbpHrzCleYc0+uy6KH19detY8=;
        b=wMKrgHXfmsRkQ82AiWgKiNBvmEjugOe8331Hr+Mxn3GbU3jvBWwdXyyVIjp23PzOnI
         0exTtMUQ2ng5IVglXN374M3isZyC+6dRiu+/UN2VgOSCEek9yiEaAaDxhlfJ4KjAMPJF
         HMGt7Zgw1C01pD+7nVvAfGeQiVmTu4OyoeXaUjVdyKs9W/hL/zNKe2PBAGqB20dHBmFe
         pymk5caXE4xM9umTleezIvCL3NOWSuj77p2dXQMqxj+Tp/J/NtpwlhrtWrfbyhF7Vhmt
         NWLLccoOr+yRy+qu37IjC+eph9/dGDWKIli3kPrtqnuP3Z/IbILRFRHmcCYiWGgpUxGF
         NZNw==
X-Gm-Message-State: AOJu0YxhXqX1evXsxxnLeVnyUPfqRhD1snKJfOv3FkP3HhU0OjavoAPX
	5RebqgG/ExGQFIGQJrUuA7X2xaJAPPBusBjSxNs+/MoVBNfNMTl9Xv74dLfzCFgi0+3J1Ma0ZqU
	cQsX2gldc+Og6pAyU1pFm19N4mV4fJPP2a+7XYFsReuSWQ5p7nppNvQOaf6Tt9z8fqgmOB9hTPB
	xx
X-Gm-Gg: ASbGncuVSywAPqz4174BX71OhqHKoFwZBr+rynMitlE7NF/+iKNVWysmJktaAg49DIq
	16TDxCW6OQQeFsueJpXj6WLue9clzwltZ7gWNO0+ch1YwDk87rxFijkAqcgoXR/Y3WNK3r1HefE
	NjyuF55QDyqjBaSUOAUy/f2muPwlAY/FsQkFJOrWNkMn69Xhb1zJiq080lraLVSJKKiveoTWt0G
	WmLaamFDi6LThuH5chXhzDYdBB2ejPWJZLomChQ7dlr7CjSorh1FlkwckcresKCb4c1ZBIDFWPL
	ZXXzsIHmHtIaLbilAri8IAeaH2aVmT4nFtISeqa0cLd+6mtdFTdNxjSK9C2WSiSxPEW6ZNvqdKk
	ThQb4+SBvLmgCQUUAQd1SSZmK
X-Received: by 2002:a17:902:e786:b0:23f:f96d:7581 with SMTP id d9443c01a7336-242c2039e50mr64542955ad.20.1754699748042;
        Fri, 08 Aug 2025 17:35:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcMrJNf4hYbUM6Mca4QfD0ZQhsL/38byXKglBB4WfSR1lbVjH3mDxc+Vqs9SUlmhl07AwLRQ==
X-Received: by 2002:a17:902:e786:b0:23f:f96d:7581 with SMTP id d9443c01a7336-242c2039e50mr64542765ad.20.1754699747607;
        Fri, 08 Aug 2025 17:35:47 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef678dsm219865355ad.39.2025.08.08.17.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 17:35:47 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 08 Aug 2025 17:35:21 -0700
Subject: [PATCH v2 09/12] drm/msm/dp: remove redundant checks related to
 ST_DISPLAY_OFF in plug handler
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-hpd-refactor-v2-9-7f4e1e741aa3@oss.qualcomm.com>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
In-Reply-To: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754699734; l=1745;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=L/K5K5k1xBQ/wx+huy+cI13UFEAuqZN8YUVxLinE3Yk=;
 b=bDAongJDXX6a6O+352pvsIP13wU3uFnz7DQHr8iAWYbGG6fO0Ff2FBG7AzARKFuAkqFwsvxpz
 WAmus7KaTCSAThVoDDaKKbokeJY6sI8CUyT3NiIbYW7Lmqljm/T3ElI
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=TJpFS0la c=1 sm=1 tr=0 ts=689697e5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=3iXaqZgdguojTDSw8eMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: tsnRY5PqAUD8AJVleYhfFqAyywnlNBKQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDA0NiBTYWx0ZWRfX9xU3kenP1pt3
 qBdtIYA3avRAjEGLHM4Pl0xXZ48NcKu3nTEW0HFypUY/Al136nM5tsnB8C+MFxnDfT4WjT6t74K
 96MYevzdlPMP+fZKk93T1iKMKmTQBUXalk+RnUBKAlZhyOoe1sKxM4VeyQmshS2WTyVlS7Ku8Zr
 2NqYg4OHBM82CcllV8Wj19+7GdYIdDB++hjdmIckVxzJvsg/40RYtmQzMYXMRl2kwaEoMljaDSc
 Lra0g7PsObCE7hAOp4y1+ehapdE8HQWWGWM9mT1i+vyYElrlQz2fvduyM3EPNO+ZuGjzao+OLqU
 OFq3cQKjWU/eM2vEa6/ZyFC2CK+//HX4Z8xcNv1nCZG3IMt2Vk0U8dN7z7jr7lCUeBpXivGm/y4
 iDqqfzQM
X-Proofpoint-ORIG-GUID: tsnRY5PqAUD8AJVleYhfFqAyywnlNBKQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508070046

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

In commit 8ede2ecc3e5ee ("drm/msm/dp: Add DP compliance tests on Snapdragon
Chipsets"), checks were introduced to avoid handling any plug event in
ST_DISPLAY_OFF state.

Even if we do get hpd events, after the bridge was disabled,
it should get handled. Moreover, its unclear under what circumstances
these events will fire because ST_DISPLAY_OFF means that the link was
still connected but only the bridge was disabled. If the link was
untouched, then interrupts shouldn't fire.

Even in the case of the DP compliance equipment, it should be raising these
interrupts during the start of the test which is usually accompanied with
either a HPD pulse or a IRQ HPD but after the bridge is disabled it should
be fine to handle these anyway. In the absence of a better reason to keep
these checks, drop these and if any other issues do arise, it should be
handled in a different way.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
Note: Taken from https://patchwork.freedesktop.org/series/142010/
---
 drivers/gpu/drm/msm/dp/dp_display.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index eabd6e6981fb..dd3fdeaacc91 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -495,9 +495,6 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
 			dp->msm_dp_display.connector_type, state);
 
-	if (state == ST_DISPLAY_OFF)
-		return 0;
-
 	if (state == ST_MAINLINK_READY || state == ST_CONNECTED)
 		return 0;
 

-- 
2.50.1


