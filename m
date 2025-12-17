Return-Path: <linux-arm-msm+bounces-85442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6619CCC64DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 07:52:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B04D30575B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 06:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F74932D448;
	Wed, 17 Dec 2025 06:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FuQi89Fg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R2G/KxAG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC04B32C954
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 06:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765954296; cv=none; b=FWSchPF1mFwNJoFc00JzT5+fiSQX2IH9yvZJ10MQHuEp5Bkx9be477nAiaqUgduvOwIFbU7phx6ZvfZaU0HE0WoIDoByLJXA34nzba2MpWrhTDLOMAHHwLh9B0aIjFiruLdd+NANytmRbatpFzqMbS8iPncLXJGag/ffUDtj6Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765954296; c=relaxed/simple;
	bh=WU4YCpuN2WnD6U8Z8IJ4kJne3uzXJ2vUUx1RNzxXTBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mkiuo+OJ1/FbV5H+PFG/+mWdmBpYSVlSGFwR2MSHg1zThbXtA1t1lDqimP2+gTTmf8E5k3+i+RQffJFAqXUWoCkqycqFkaRl8G3LbB+mipkye8QKrwTS9XTczUOhtbbADzVvGkw0w/G3+E7xALKhM7zKqijXfE3e9iB0f7Qdq1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FuQi89Fg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R2G/KxAG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH4XU1U2316155
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 06:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RwaICuxiYsG3y9nIJZac4i/l8YIIA0taYYtciFqIqkw=; b=FuQi89FgPujVhVeB
	AXZOxriGnZsGxtyrKz44h93BrOPjeRBbKhq2R+Dq9vQyAxyPNkkbag3ppMpVZUdt
	5Lv7//DOfRxnrs4Q7BC4B7MeukLYRAvKuKY7aWkhPzkUuxbAaXGvO9pVMCYvdhzj
	GQrYjI34BMIhWGGb4y+JXCufBEM3BUj3YdaaxHrHpUGW2kVa8K+MjTNjzA+7eV7n
	bFvqIHKFJi+CZ3XbaT94T7M3gVLkLrqV5pMabYbP3lTbiiGadTgxxIbhAgS/P4Uj
	rTn10k9Jr2C8Bm05RP5lM0xZNh+DJgW8ZvO8JqPZ6eAEC23sl4LQXFmEoMzVdLUz
	wu7OWw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3nkkgcs7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 06:51:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f2b45ecffso74278835ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 22:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765954287; x=1766559087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwaICuxiYsG3y9nIJZac4i/l8YIIA0taYYtciFqIqkw=;
        b=R2G/KxAGnH4XddV+GHYQ8NGkzdgL5at6jZddlTFMF+jIbIV24U7591vaVFybdG28P0
         AUjUAo936unrMl4W3G5xQZOIRIwqMaG+3lqguSfL7zozTCalJXBh7oCnYsMiGnxWXIYC
         LxbDKkuE53qww+fR6XzwUEOGkMdNeAoIOHL+0cDSDzGMQm2atrtl06mdRkujcZu5SRQz
         97XA9kigpUr/mNXtr72LltiUV3tzPp4f2clW1CjwaGi36QZXUJBb7FS5LLWEHsccRqhW
         AA6kOToT7AOhe43zgl+FA/sOOkJt9eZ0WQwRJ8JTFJpIPVyJY0KNc/ogMxY4Hlw3ImUi
         8wDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765954287; x=1766559087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RwaICuxiYsG3y9nIJZac4i/l8YIIA0taYYtciFqIqkw=;
        b=XtGK5hynnk5i/dOj3rhgOXzgDxCpjwl4PAFPy6emMaxoGLewsIpg9INoqkPg0DxRGh
         JB48zE+KwYv9r/6P7hR6s85yMg3kWLo18vtlahFX2D8ezRzd6ir8wkRsTYd4S6SIzOO+
         0ZBsSMzK9GZGtfGF//bgxvdEr/4ShIOrzY049J8F1yGB1LL6msUz/Rxg977dTOfprsia
         HGwoTGxE5bWCqd/zYE7rnf8h/NiSPzhi+IdNBP0uxNcs2rARAodLr/Isrl2Np+Dy/G3g
         8Ni7u5XltGj/JfPoZZrG0DkB3C/bHz4SdYKyPBUzjR+gGCjfcF9lucV2S8hEYkqzVjhw
         ha+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFEBI8EBd+hVx32DiW0cCz46q9FnG78g+MU6dtcJ35KI+8vKVzr6Tie2T7aVRmKq7DQLYMX9Qe3HXSiwqd@vger.kernel.org
X-Gm-Message-State: AOJu0YyYWc9oJZCZyWo4qe2R5uuR+aJ5cUh7YSeRmbybWE5XuegXUvs9
	N+6Te6F8UfYIMXh1NRMy5InnF+xwExh5bVrYZhVBmjNSxOwNbbXW0QkYgyA57oKAibwQtzIrerH
	ynDVmg6pTlwpadbcNmE1b3Tqof3Rqfud57sknd09feneCdrmm4rlXpRIRZo8+kUTWqZy8
X-Gm-Gg: AY/fxX5yTTzmUw1Rkg0fVE0lD+h7KExZ1Kj8SImSYZxKYmtKq7mtxivaTSHXhe2ALyE
	jP9h92VMaVxXfp1RRgcyxXV+byPb/pF3U9sOJvh/40hEZof8i09NNDodNjf5+YlLS74RJ8hZCcQ
	HDnNu+ALj2czUbl13kj0hsKmbEIX+bx7NWl4WUY2mUG1/4Y7K47PviuDSBHdePkR4fARtFyD7Cs
	T606MPmS2nvoB2UIJ1o1Z4KXIXwbNatXWF8Bp2grfBVQ05dAjb6ufX3a+/FuxzCmxFOT729G+cH
	bLYk2s2VJK+3mZNq3SQCklIGHLii0aTt00SIthFrm+2MoSas9TuMjRKdqhU92m+PneAKw0wm+dD
	XngZoAK1k/afO3KNyRiZ/OeO0+qy3blO5TS2MiYodptOiIgMXcUzOmTPdGO8qBQcFvXiW8NZ8+s
	oi
X-Received: by 2002:a17:903:1aac:b0:298:5fde:5a93 with SMTP id d9443c01a7336-29f23c677edmr164280305ad.32.1765954287161;
        Tue, 16 Dec 2025 22:51:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF58BJXn3L4f73R4hK7FiOEUWAG+6wWfw5TzAMcuw5HCxg3IPDoRUMpLvbBG3oYJf7SYmLA2A==
X-Received: by 2002:a17:903:1aac:b0:298:5fde:5a93 with SMTP id d9443c01a7336-29f23c677edmr164280045ad.32.1765954286732;
        Tue, 16 Dec 2025 22:51:26 -0800 (PST)
Received: from zhonhan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a0993ab61dsm118846515ad.46.2025.12.16.22.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 22:51:26 -0800 (PST)
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, corbet@lwn.net,
        rusty@rustcorp.com.au, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
Subject: [PATCH 3/5] rpmsg: char: Fix typo in comment
Date: Wed, 17 Dec 2025 14:51:10 +0800
Message-ID: <20251217065112.18392-4-zhongqiu.han@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
References: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TRFas9dwrRyDxuAfK9apLpVTboWvmHMe
X-Proofpoint-ORIG-GUID: TRFas9dwrRyDxuAfK9apLpVTboWvmHMe
X-Authority-Analysis: v=2.4 cv=f/RFxeyM c=1 sm=1 tr=0 ts=694252f0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=sB-E2kKsXCsxT4_ri-wA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA1MyBTYWx0ZWRfX7HV57QoB4YTS
 vVaj+DvSCXLibSehIwjZB7v3LQHkISzxyOs81RYi/lYB35FlLGhygOoW4/KzPQRbHguZLLqV/nX
 2jzAvmp1ABDs8GpXDYYLxdhKSgv7byoCqWt7Ru0ksb6HkC82ANJ8CWp4rgpVMsfNWDiRioCtjWs
 tcFoV4rOKhT3kH3Rai37RGyL5BNarEf/BcZBhqLstNiQnG+2l2FHSpA32KPCbs4q+G6p9GCmeAz
 kitdUegDWMk6yG8o2hWN1N9S5Oyr2SX5aijPz9obRAhKu3ERarfXQQWxsJ0olmd2BO13yuJ3S8u
 1mzj7sVJl070hhnZY26BYrpiJa9dIP+W0QqDY9NsZTKeB+CXTs9AZ2WZBtoQroz9eHJfoQwGdP/
 McAzZMI6ixmESFtZd97h9QQOQl7p2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170053

Correct a spelling mistake in a comment: "Storedit" → "Stored it".

Signed-off-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
---
 drivers/rpmsg/rpmsg_char.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 3287e7941c8c..073d56858b88 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -504,7 +504,7 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
 
 	/*
 	 * The rpmsg_ept_cb uses *priv parameter to get its rpmsg_eptdev context.
-	 * Storedit in default_ept *priv field.
+	 * Stored it in default_ept *priv field.
 	 */
 	eptdev->default_ept->priv = eptdev;
 
-- 
2.43.0


