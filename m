Return-Path: <linux-arm-msm+bounces-108840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLJGFgLtDWo04wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 19:18:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 906D85934F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 19:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E4CC32BFFF3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D4B36CDE9;
	Wed, 20 May 2026 16:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iFnma6KF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OwcF2GY/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E05D36B05E
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779294332; cv=none; b=cPYpZzrszNfFbO80PW6rEn5vccPjJg+3o1c6x5CT9x01B90QrPEkELAwIiVT8dF9QG/RN53z8ryZ6dO6fWap66KXHQ0FoRP/sx1E0X8AEdF3UR61CjQwFjRJo0B+ZLb1JmC5gpiC7OyJsDVNSD0qNS2kXT3ZKSmRsFzvyzvaKTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779294332; c=relaxed/simple;
	bh=A6F5qReJDJgGgECAx/he/Gp+PHKgzH5mAl7LkVSzXqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DVuxGW+ac5rMrAo4HYsijcqRBYbAcrVE2yBsVF8iaOgseG5Rkn/gTMTstexiAPhsbRrvtcaPMQn8XhDmaxBC/eTkzv9JjKK0YFPNbjkzZOHxnBXhz/7YKQ63VVrbIDIfHEYChlxcScwMclkBaLTeapM2Q0+LrrvZRM7rWKEV1T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iFnma6KF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OwcF2GY/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9nQX6446560
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Uh+8YeArH5l
	xuIrq/0DkppLWphYU2zvQ1bZwgrXCWVs=; b=iFnma6KFpjfHQwCvKa9dKg5g4oi
	6huJvHDvSuAhS3K03qgn80WzB73AmsXS41pD43k7kETTl9GtIh19uC+UzHn2Cuzv
	7B1A1WS1CCXleHRg8nLU+UIBpEbJky//YPynDPKivBGngzjAIpb5GcNtrIFLIK3J
	/owtwv7ChEMLwkVmcRggcoUZtmm0Xri49bJfAxCovC0GMlcSk5SPMWZRE0jkisRx
	NFQmuz51khnH0oPI62wzj6G4vOf+J/hA0SFZ5RYqNpVP6syyjmE0zpfGkGLhfwQl
	aawwdOnhp3CteSKb89k1cgDnX5gnPEioRAoyGkoyOJM6q2SE25+m22R2jjQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9anrhj44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3663cbff31cso12757608a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779294328; x=1779899128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uh+8YeArH5lxuIrq/0DkppLWphYU2zvQ1bZwgrXCWVs=;
        b=OwcF2GY/eAeft7UH4xe2u/jOt83QmDM1smo3O59yWmzp2N+Lk7Ul/oUnx87VJ7HbKA
         zj/MJn0vKqPyYxZvILxo3tJHA6aN2tCdkQ8ncZjhRGlCY60rLi2xrg65G7H0XmgXQaWg
         w1mkiglOIA2SefqlTHy1+y9Vo5W1ZNPe0MwkQHH6qdPonjAbMEgL5tJy33tcigCnF1CY
         GMjKW0s6w5qTkXwXGBXzk1r44k7DYHHFYi9WCRaL7yup44PkUmS7t/ggtL3IoQhEVUMb
         YwLkiVo+SDYdW//tENKpVljfr9N5s94D3RvvxkPQLfStBVlmUlSqHatEjGbNitrOwKeQ
         sduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779294328; x=1779899128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uh+8YeArH5lxuIrq/0DkppLWphYU2zvQ1bZwgrXCWVs=;
        b=BT6R2oKz7M6hnMtLCKQHSkcc3+YLiiMxeuzP95+o0nU6i4iFIgZy00hViM7nf0IOSW
         n4AFhskzrbaYZ6G1RX025617R9lxtDQ0e7iCefmqdKlq3BJEP54gZF+GtKPApY0VNSIl
         0oFEubQj91ia37JnKBRofKoeZEb4jfY6tWflKtJwmZJLjey9fG1uZlD1pdgMUPLBNE74
         84Gk7JePODItcZoCY9oWeU5e+RHMYxuVAk14rpDwatMaKrsyJEz8+S8hA+KOrlsdUVym
         n13wXQr5BixBtrdhtvc/1ojzFMCT52rX+Vy8ZWQ7CkfhwQt+Bum8BQ+CogImtqlJrgwe
         LRBg==
X-Gm-Message-State: AOJu0YyjdvuUr1K/3RzkWHqNCF8EFij6wKbUkOXgYlusyIH9Q4P1vNk9
	bcVOkvBWYJXdDa8YM7SrYFxqwjO9BHgCBw9CIzGb5cYqIMlJykc4K+A8ZZMNgxAeL2I/7/Yzasa
	4iEQJpcuQhc8XV3DXFIeUAUHJWLe13pOw22MpEYrNydVenbD9kLcpBAKNRQr53kYsO2xA
X-Gm-Gg: Acq92OGQJpBPc2LfPlN/I27REy3cja937ueVZivkhswP9C/b6c83Rt7t3NBUA5bcGTE
	n19b61YWN6wPrIUBqTaoUuE1hsaAw+AFaNCO0t2D5v4hZ5RdWjoeDhHairfuBdBxk/0xd8QagHr
	u6a8yJTai0WC5pwMvm/icUZnfiEq10XNIhCs+po6cWDFJcz7NJSCMeRRm5m+Nf8uZJU59Zn/Q6i
	lU9H0729ZDvO95nBJH7jDSFMjxfULLBF4TPSm+Q6x+S+CB+DILNrOICljcFB8BfyNq9QyE/x8iS
	/c7m2893wuIQIpqHXis94GfDuwZ0Hjb4RSdA0yVuKFOjoahYoyxmbCpnxc6ex4o89U4BNohjjd1
	jp+gY8laZizNAupYua0PThvd7HP6X08Tw
X-Received: by 2002:a17:90b:53d0:b0:367:db13:aca6 with SMTP id 98e67ed59e1d1-36951dc1cc3mr24889525a91.26.1779294328088;
        Wed, 20 May 2026 09:25:28 -0700 (PDT)
X-Received: by 2002:a17:90b:53d0:b0:367:db13:aca6 with SMTP id 98e67ed59e1d1-36951dc1cc3mr24889499a91.26.1779294327641;
        Wed, 20 May 2026 09:25:27 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a3cc56cddsm114371a91.6.2026.05.20.09.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 09:25:27 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 06/16] drm/msm: Add a6xx+ perfcntr tables
Date: Wed, 20 May 2026 09:23:53 -0700
Message-ID: <20260520162454.18391-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520162454.18391-1-robin.clark@oss.qualcomm.com>
References: <20260520162454.18391-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: saa0fKVfYoBiauLPJjcg7EbyuhH74RBM
X-Proofpoint-ORIG-GUID: saa0fKVfYoBiauLPJjcg7EbyuhH74RBM
X-Authority-Analysis: v=2.4 cv=UuJT8ewB c=1 sm=1 tr=0 ts=6a0de079 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=tmZHKQuSfWdd6biKE2QA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1OSBTYWx0ZWRfX9rtEO2Y9LCjP
 lFAzIPfeM33bF1uF0xENuCFfaZvV6U2Avb+GAazkNoFs7BAJnDVp3la33Bhm/foI1701IATHh5L
 fqLVPA/fX/GvzIIaDub7qZ/RuVzdzPbd6s1Dp59Lxvzx57VYCBdnqG2uUOMsVcEqTRCXf4yq3uI
 dkKBNxv+B88jw2bo9YkuywFaEr2WHB4ji44HetOBKTI/xwkq6ukMbJpd5+f7gyzGsaeh0QLkdv5
 J4tYqy7IPOH55znBBQxcZ9TZ6xy3Knv98b1CZlcBzr1G9XDiA17U158sQLf/d2ty97/8Qg93N1i
 SXIgWwNwfTHp/Iwme3CLaq7bDtc0DK/CP0NQ/lQCbeaOHRBWwm2mP0Ee/J4LBeELTlFCFxjEnWN
 a0WiJpLNooEpy2UTKeWwHGGj9rqulaHC0iVhIsUvnPRTgfr8Ow/OrL+GAJBgXR2ewij7t8uVApl
 iIdZuy/4vOqQ0qrfxIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200159
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108840-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 906D85934F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Wire up the generated perfcntr tables for a6xx+.  The PERFCNTR_CONFIG
ioctl will use this information to assign counters.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 +++++++++++++++
 drivers/gpu/drm/msm/msm_gpu.h         |  4 ++++
 drivers/gpu/drm/msm/msm_perfcntr.h    |  9 +++++++++
 3 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index e578417a4949..727281fbef36 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -5,6 +5,7 @@
 #include "msm_gem.h"
 #include "msm_mmu.h"
 #include "msm_gpu_trace.h"
+#include "msm_perfcntr.h"
 #include "a6xx_gpu.h"
 #include "a6xx_gmu.xml.h"
 
@@ -2637,6 +2638,20 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	adreno_gpu = &a6xx_gpu->base;
 	gpu = &adreno_gpu->base;
 
+	if ((ADRENO_6XX_GEN1 <= config->info->family) &&
+	    (config->info->family <= ADRENO_6XX_GEN4)) {
+		gpu->perfcntr_groups = a6xx_perfcntr_groups;
+		gpu->num_perfcntr_groups = a6xx_num_perfcntr_groups;
+	} else if ((ADRENO_7XX_GEN1 <= config->info->family) &&
+		   (config->info->family <= ADRENO_7XX_GEN3)) {
+		gpu->perfcntr_groups = a7xx_perfcntr_groups;
+		gpu->num_perfcntr_groups = a7xx_num_perfcntr_groups;
+	} else if ((ADRENO_8XX_GEN1 <= config->info->family) &&
+		   (config->info->family <= ADRENO_8XX_GEN2)) {
+		gpu->perfcntr_groups = a8xx_perfcntr_groups;
+		gpu->num_perfcntr_groups = a8xx_num_perfcntr_groups;
+	}
+
 	mutex_init(&a6xx_gpu->gmu.lock);
 	spin_lock_init(&a6xx_gpu->aperture_lock);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 78e1478669be..8c08dc065372 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -24,6 +24,7 @@ struct msm_gem_submit;
 struct msm_gem_vm_log_entry;
 struct msm_gpu_state;
 struct msm_context;
+struct msm_perfcntr_group;
 
 struct msm_gpu_config {
 	const char *ioname;
@@ -262,6 +263,9 @@ struct msm_gpu {
 	bool allow_relocs;
 
 	struct thermal_cooling_device *cooling;
+
+	const struct msm_perfcntr_group *perfcntr_groups;
+	unsigned num_perfcntr_groups;
 };
 
 static inline struct msm_gpu *dev_to_gpu(struct device *dev)
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.h b/drivers/gpu/drm/msm/msm_perfcntr.h
index 305dcde15c5e..64a5d29feba1 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.h
+++ b/drivers/gpu/drm/msm/msm_perfcntr.h
@@ -35,6 +35,15 @@ struct msm_perfcntr_group {
    const struct msm_perfcntr_counter *counters;
 };
 
+extern const struct msm_perfcntr_group a6xx_perfcntr_groups[];
+extern const unsigned a6xx_num_perfcntr_groups;
+
+extern const struct msm_perfcntr_group a7xx_perfcntr_groups[];
+extern const unsigned a7xx_num_perfcntr_groups;
+
+extern const struct msm_perfcntr_group a8xx_perfcntr_groups[];
+extern const unsigned a8xx_num_perfcntr_groups;
+
 #define GROUP(_name, _pipe, _counters, _countables) {                          \
       .name = _name,                                                           \
       .pipe = _pipe,                                                           \
-- 
2.54.0


