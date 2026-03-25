Return-Path: <linux-arm-msm+bounces-99933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OMwIGgtxGmZwgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 19:46:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D425B32ABCF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 19:45:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C6DE3012C53
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 18:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82CAD33A9CB;
	Wed, 25 Mar 2026 18:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="alB8XlKp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d7ufRlwZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2EE33C182
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 18:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774464056; cv=none; b=K/8hC+WC3vJTCLqyi7RhixCrDitzJ1d/xmHTpTdg/C+Pvo0bqrKioKYXyEFSpP1M26ccOiYqYsvWWqI5IM4koano1Vu5KMuwjE5+ftDwYc4wm81fFdllJ/a9e4/vaF9CX1OM0yTv+cyDpawDyzxNTwMAH/HI66V1l9kaj0++lA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774464056; c=relaxed/simple;
	bh=imin10cSx0YrxDj2Z4/XJpCeru83iyKHIxpZeZ+tMEI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=em8X3QEJtMPjFQIl7zzh7yxCaPG4u54CP9LZHP2cCbfDouqNtn2CdZ+sVaMgHwV292uhQRxILNUj4rIuM9Xm1m7U/QHKgB7bJjbnFDkWzYdIvX4rS/qO80hqkzezdTFpDkfayNYT6b+vaUSUvVfZ0fXIbz0PdmGwl/QU+Ik4sgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=alB8XlKp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d7ufRlwZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFH8NA3628166
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 18:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mvdkUSKRAO5A5qk1dmV1+LN6vXJ34iPcEA/
	OJJ+Ig1M=; b=alB8XlKpiWAXN7LlE++Jw/vtqeVlgKNabedRgJSzMbrw9weiY+0
	pFhM4qnkvY7YkAITdIWAaJEJJMBhH4goIivhBCWU/NmedpPjl/KYIVDcKthRoXak
	fG3SNQA0d8tfma0H4qbTz4tf3Ly8Q9THXD1KhLX5Tqr9AyeOQJU04EAz+FtuhLL3
	ydf7fhs2RMlB+FE8VU/PchGISiynzi4tKD36mru5QwhPdo3H5vrM7Krp/c7G9oX7
	6sAHwcHOEP78AKDfrf+zXLFSLc9a26OIqyI21+OcoZYLp+NSx4n9IhU4twQdiTJq
	/tvvOCC4m0XwFS05lvrdVe0z5gqRRFALk+g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dmpsxpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 18:40:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35b8f351debso349715a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774464050; x=1775068850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mvdkUSKRAO5A5qk1dmV1+LN6vXJ34iPcEA/OJJ+Ig1M=;
        b=d7ufRlwZi7COmb/5CIWwXW3y7R4eEbH4hSis8rfaATf5dEca/NZHwk7loBH+yeFrr4
         7YJTJ/ALsSnwbdwoRy96f9Z2G80vzjd5UGlARdKMfuqujMwHI63nsiegT2T5JDeQqeBn
         llvMYZhri8dktUB4aThfEkPvwVrCL5ZZDD+fw4Xzladn+DjMMevT17eqD8kpukY8Z11Z
         YWfzKyO7PwWtRLyLw8QNj6N3N4r50x2KeT0tq2WcREhT0wU7o1+GPycDq80ctJO+VP4K
         jUR/CuhDOTUBOlcveQQY/6pFJQnWHYky8cbkMVTGfVdQeJxiRrEOa/l8HMdLv+HwJRgQ
         SIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774464050; x=1775068850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvdkUSKRAO5A5qk1dmV1+LN6vXJ34iPcEA/OJJ+Ig1M=;
        b=q59JpL6VqFQmfNHQ33nBfKWkEQOeRnDKpHCVvkTo+9turb2s8mHIogng/2vrrP8BUP
         9yi3t+KCXD533l2CoRIZZKZ9i7fE2QuV9TDL7B03CZddRH3rznkEu+u1VT9Qa5Ot2SDK
         WGwwvlisjRAoVKCKm3bTbpK/Kmh+49QnJDKWltDY4Yaw+k3c8mLdTcWn8v2vKDPhLLaJ
         9xNayNdpD3D98F6PFiGugN3aP/Doh7mzse/zZxEZ+VBMo+WZnk2cnbR3srOqsqjYUXlC
         aqoXiSClKORvGN1kLOOsIW/rfZj9ff5mxBjJtdZV+Ia7LvKRAottFjplfLvs+1/44cFp
         /DvA==
X-Gm-Message-State: AOJu0YxNJ6+8bWjv9VblHoChxjlr88O6mXHgV8BTuQlrVl+eZpclDY0r
	cEnK6MAF/U9QvuegmRPWDMy7WvgdrnympMf03bMXgGBKR2vkN5VN3hRyra1ixBs6hpbrYBD51/X
	azmygmTShP2tCoM+CyB4fYMH/GXQDUNLVntYvtqrs4FSuuIEk3/m5EFOUSDY8hdjx9keU
X-Gm-Gg: ATEYQzwAy0kFCWNNJEgReO7UZ9ow6EJdV/8WP5pw7TqFO+KOnOtOonraUVSn34OyRlD
	6qlXnXgC6zah/N6TuJ2tGTn0RzPIB9fHM4R9xOeJiqQKgaAk7tQYd2Sp48rxg9Wzl6eIRqHon44
	+xpwsvYyVUR1sMlWrJIvJeCOarnktlGdwNupd+g75CeCYB2XidsQs+tb75r3ADjih+rzoISgCsu
	qf5uqYw7WnIFiMwfpDDqeMJbPv4iEd1mxfvZe1xgSnKv2JPASzf6y35PXv0LlCTU/eQbJHL288e
	s4q6sCfpYzPCsjh3gio+pN1kWlVkktVpR0uvzJWykBVBQjBsboexgtgCJtz8opOoESNm35HM0GZ
	5aDEf7XCSYy5Q8VD1BL3KK2Vu/H2/oQbv
X-Received: by 2002:a17:90b:6c3:b0:35a:1762:92ed with SMTP id 98e67ed59e1d1-35c0ddc589bmr3883530a91.24.1774464049574;
        Wed, 25 Mar 2026 11:40:49 -0700 (PDT)
X-Received: by 2002:a17:90b:6c3:b0:35a:1762:92ed with SMTP id 98e67ed59e1d1-35c0ddc589bmr3883507a91.24.1774464049121;
        Wed, 25 Mar 2026 11:40:49 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0e7452d8sm3198165a91.11.2026.03.25.11.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:40:48 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a6xx: Fix HLSQ register dumpping
Date: Wed, 25 Mar 2026 11:40:42 -0700
Message-ID: <20260325184043.1259312-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDEzNiBTYWx0ZWRfX+S2RfiUsVG+i
 SCrsq1ZJMkd/RG7hJ+avqslNj08NQ+6QdE+om5HqQe2gBmujCYiwgErE8Y/MeR7309ZRRRnTK8V
 bw0Gyl+q+cRTd2cJMO95d2K2mqSQOITQ2haVPzazt5zwzBvOeoNV0AWCaZLAQ/FxZyD/VAnbSCJ
 cv42DJZWXBvkPxehZYM9ANsGtScfq6mkvyvokqK0Dd+zyNrE/MeacKej/9tw6ZoLuQuBppYydlK
 6aQUf6GU9j4s6tMc2zDti7F2Od8ZF7O/vp50wbJHgcucqTzYRTotPcNns+YYBbQyYjsphm3+jX+
 dbSQ7tk3z8gRb4z8um178bh/By7LYlqkayoz2DPCELRD517bmyq4omyb0x5/W97B9wB0+tQrCGO
 9CTHqGQF50LJqQdQtnqwoO5GoKBjymeL7rSrz1tpIWSHxOueKKPN/CaqZW5YQNDykDJC2HRIegr
 kb1oR60UlC6DPnBNClA==
X-Proofpoint-GUID: eE4N7j-Q3z-d6OZFaE2sfeSBl0nyhPar
X-Proofpoint-ORIG-GUID: eE4N7j-Q3z-d6OZFaE2sfeSBl0nyhPar
X-Authority-Analysis: v=2.4 cv=O7w0fR9W c=1 sm=1 tr=0 ts=69c42c32 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=AYjmxK_A9T-BKwGzHN8A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250136
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99933-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D425B32ABCF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix the bitfield offset of HLSQ_READ_SEL state-type bitfield.  Otherwise
we are always reading TP state when we wanted SP or HLSQ state.

Reported-by: Connor Abbott <cwabbott0@gmail.com>
Suggested-by: Connor Abbott <cwabbott0@gmail.com>
Fixes: 1707add81551 ("drm/msm/a6xx: Add a6xx gpu state")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index d2d6b2fd3cba..f7598d0c3975 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1013,7 +1013,7 @@ static void a6xx_get_crashdumper_hlsq_registers(struct msm_gpu *gpu,
 	u64 out = dumper->iova + A6XX_CD_DATA_OFFSET;
 	int i, regcount = 0;
 
-	in += CRASHDUMP_WRITE(in, REG_A6XX_HLSQ_DBG_READ_SEL, regs->val1);
+	in += CRASHDUMP_WRITE(in, REG_A6XX_HLSQ_DBG_READ_SEL, (regs->val1 & 0xff) << 8);
 
 	for (i = 0; i < regs->count; i += 2) {
 		u32 count = RANGE(regs->registers, i);
-- 
2.53.0


