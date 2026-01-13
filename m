Return-Path: <linux-arm-msm+bounces-88852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FABDD1A7DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 18:01:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24751308F750
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 16:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA21334F244;
	Tue, 13 Jan 2026 16:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CiJRy9dc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TBFofBcD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C554B350297
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323469; cv=none; b=Na72mzoNGOQ1/A6kyVLtr9u5DfnG2bfnz4qEirSsq7L6FaL0gaxHBcUETyzeg518b8kItkFQrIgClQ1b8KXY/BYz+d96+YGG9EohKjEeA2zuDGPdR0q47LiJnSApTuP9mWxE/MYqxFZoSNr+NcoIcJmXQUiL75qTP4EXf12VkTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323469; c=relaxed/simple;
	bh=h7MMn6eoIT/MLTtBQ0NByysAANWVyaCDgHBC25L6vPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qptJzPyGJEIcGQIGO0QgQtDKAB56Jj8W50QNHhrksphv51Kc0fKmrjPM0BmsGPK8ti0r22FEZzi/2ZeJPuANg9x4F+aSd6EV0h+Wohq9IQmZyHvS1vk5+U1JcpBo4UeRrDJvuoQgpW4b943IdiZsq/pX/DPzhAH5WCWLSzbKa60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CiJRy9dc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TBFofBcD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DG5Cop1295008
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ln+HxvUbm17UzFH53D4M7bFPebJ/beboKgAcEXWZ3Q=; b=CiJRy9dcnIbnk+bV
	stUMsfuWAJaVHkzK/H6VNN7SccgDAczR5qhRgLCTZGxqQZVJUCCLhaDANk7VttEX
	c0gtwreQi1LkwG577E0zK+IJhLHeBMwAdminnWB668LHCsJsmVqm3Y0SxooNfXYm
	3uzqaF0n23FjmhMMBmSq/IHI+SMRiatrYatE8DaZWREJfLMYH/qhyUSJzRB5D530
	36QJ3x5odjj33quKOqo5/PHN8WqAExkfs1DMbMnvw6sQrr1IhG+pvIA3HS4hbcS8
	/6HtUD0U5TsdTGoRoHwz9RuBIHLQu5RAX9GeMCzwo1iJNLrIeuX9V+7yjms8uaQA
	jEPBNQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bns8v05ws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:57:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e235d4d2so3029012885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768323464; x=1768928264; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ln+HxvUbm17UzFH53D4M7bFPebJ/beboKgAcEXWZ3Q=;
        b=TBFofBcDkQ1TdMVLx/pRxAf3Kqj5EVBsSt+QmdBwuvWIqpTVXS00q8K3hWsslFvNUs
         XQMpstBzDBA1y+sg97z2GLmatEP6VPJMdzgH07u4zj/jxF/efhie6UwOqCs1Y//8D8kj
         3hqC48Mc3XlCDimH8EkfocxDQw1o79YpBI6IkfSPnDd9blb/xuO/Kjk7WJn8Z7HLdJM6
         hnfXVH5RmwGI3YF2dUB7lks0pi4V+OvkFHzxU6x4+u+mPNCGQmwQ2oyHi1rlkzwxbrq1
         rBQl2HtW3HyvFZneAjrgwfCud+dkHlvZKX++3Wj2z9oyybIx+exfLD42PRlLBPXF+hbc
         EH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768323464; x=1768928264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9ln+HxvUbm17UzFH53D4M7bFPebJ/beboKgAcEXWZ3Q=;
        b=UcjwHHqxuFkxRzbcseZy1NZLZem1smRFlHLAxljjCajrcMD4caEfT5ROE0S2iNj+t4
         E/kbSx0OgaUzX5UH/iyd2ipm5kBG0FRkMr/LOgVk8H0L+Duy6Fkqetn4XPwHhIyv3HA1
         Ho6c4667sG9f1UPXfEMWQkpkQXyfw5hJb4n/0ZAztp78L03K0ym9wi0YTHhN7m+rYavI
         4QoPTge/CV7C7ocqbPxHHnY4no80nN+6IwrAayGqXD3CAB4a5aIpJ0PgNL7GV9HKHVH6
         Kqb6TC6P8ep8FYHPV5GmvuVA/er3TsnuECLqUcqEJgl65WC+w4fcc8uO+t67D81Qyzzu
         YIcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV90Psfnltbh6/Lneco7rNhsTKhe4EdmB8fTUBG+2nGiw34j9Yfqc9lP2O2cdTKSX0U9I3nYRzP9HlJGSu/@vger.kernel.org
X-Gm-Message-State: AOJu0YyqLkfyoSwS4MxXNwsUrIbVL2Utj8SZdKKI8HmH1TVLYMzZKcnA
	Ie2jW/Y0suUP1COcTXAnxCjybOxQ4vWHb0XnO4Ms0s9Y1mlLvADpcuy9Htqjoh1T5Sk2I05kWQ3
	P0rmFi4Cfr8A+4r+jZAz6B28TfZBTnTWU3aZSHfnAaLxPyX+xLjlFcItregeHhbZLzArl
X-Gm-Gg: AY/fxX4asjKfHcOdWIWjOrcx3k5ekrA2wNpoMqJw5FDmwj6Bs4ql/P2Njp7odNw4zvd
	w0phUX5GJoxD59pAOjwe2ayLJ+F0zzQlZlxf94JlrBZr4kgMUGcflzjVVf9PpRzxCMk5oWekh9l
	GD4F1pI7Q+YXxuo9+eZbxwFRv8wX25otk/wn7KuJy/S0CuGrhWLRONGDgqI2xzk5dzUJu2UDfwm
	eGAm0/YRZSgRvxWKsQcZpflN/1yZmX9kjMRmLbVTRRdssdkR3jsvIqdHFp6RiEn6b8pqA4DyiTz
	2T+LXVO9V62Q6XxbPr6gOYeNQM2LL+SZxGpJibI2bLayuovewBJBJMHZ/J2hHTFSS12mgRsYbeZ
	5tgoEnVH9iMzghmwoBOkm8w2bU5cJCn7mi+DBtSKKji0fCyr/BXp3Pe9uXzEWKOBgg0kQ5gleBn
	HmjYhsFQySqq83dBHdravsP+8=
X-Received: by 2002:a05:620a:4508:b0:891:a6b0:7cda with SMTP id af79cd13be357-8c389421ca4mr2991199885a.81.1768323464135;
        Tue, 13 Jan 2026 08:57:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGD/VzWtFUF012GOVfTS2hWslL26e4LFDs4fm8YOUqIn+Z0vpR8oG7HeQedj+KqHXV1pPkbog==
X-Received: by 2002:a05:620a:4508:b0:891:a6b0:7cda with SMTP id af79cd13be357-8c389421ca4mr2991194385a.81.1768323463585;
        Tue, 13 Jan 2026 08:57:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:57:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:26 +0200
Subject: [PATCH v2 11/11] drm/msm/a6xx: use new helper to set min_acc
 length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-11-4346a6ef07a9@oss.qualcomm.com>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1349;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=h7MMn6eoIT/MLTtBQ0NByysAANWVyaCDgHBC25L6vPE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnl0qQzEujC0Os2qq3L19Z8ETx14X5sDCLumN
 QrOk+2NC6GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5dAAKCRCLPIo+Aiko
 1QNbB/9KFj3Ho6JZZambhNWCFaRf5CMzHvKhgD6aAHu/3jrbNWTIhWCZEZ6DHPQ6+581Nfl2fBj
 ViJ8+XB6bNZOyMTaJjbOzcvjWXi30dI+b4P2hH6cuJjkyH8BPxAMbBMQ6i4bgLZzYCYGEa0lp/N
 Z6WvrkerxNaudzOyUcJwlFnoLhzy/Ehvy0bSnKIO6AMEGlWbGjGSVZBaQjd7jp7LC/j3GlGhndR
 Tn35YWUmeO+YHWngHqxDCxEWf8qZDMgq2R0JNdeNoYsZvPcfyP9+UaXIm6IDzoMJwLDeeeJGE8o
 7am1BUVE1uZ43IdeV1qn8nBJTqu+EVGZUR5LSraprkj8zXjp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=aY5sXBot c=1 sm=1 tr=0 ts=69667988 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=X-e67srwgh_QgMMAbO4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 0ukzz4Uj3rGfqZ6QEtneftwvxrYXIVhn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX7v51w6fqelUS
 bdgE5R5ZtOX+LYRmrrWTQfim0Z8PGRdCcVYhEP9+QBYngMzC2lUz65u7vOZZ6eQInekQjMHLf8C
 ewkcFhtGZ3YCxj4JvenuHLrY6YDTntyfC/5M3Qigg2+zJMOaueMxJbULFoF+LBGJ3VJluNayDh8
 wmDBkmREzkWgx/85sSolWErFgYuQFadjSAwzddtv6Ykm8Q2aGUWYNcSlsToe8ThKbze/LugNMOs
 QFYYWz+JI83EhwmnIrvf6Q6PPja9RfxeEOzCWa+gX5kOFqVoP5BbSq2FcFnbUmx9kBdGcZjUWBs
 +xwKC/ifoITQhY/CIYaJKl5Kr4b0shI39SrO9EaA0m8YGUmsxMnXTYGX8fE+qnqPAMdaW0C1otd
 fHbcHqDEn80Ydl05CuPyXN4nrPwT+kTrA+7YD6UQMCRXHJYrg+3o8s1d9RtJY6XgoKhkdP+NQyf
 y8UIY7c8hmFkv3HNnig==
X-Proofpoint-GUID: 0ukzz4Uj3rGfqZ6QEtneftwvxrYXIVhn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130140

Use freshly defined helper instead of hardcoding the checks in the
driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2129d230a92b..04de4d598da0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -820,7 +820,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
-	bool min_acc_len_64b = false;
+	bool min_acc_len_64b;
 	u8 uavflagprd_inv = 0;
 	u32 hbb_hi = hbb >> 2;
 	u32 hbb_lo = hbb & 3;
@@ -828,8 +828,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	if (adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu))
 		uavflagprd_inv = 2;
 
-	if (adreno_is_a610(adreno_gpu) || adreno_is_a702(adreno_gpu))
-		min_acc_len_64b = true;
+	min_acc_len_64b = qcom_ubwc_min_acc_length_64b(cfg);
 
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
 		  level2_swizzling_dis << 12 |

-- 
2.47.3


