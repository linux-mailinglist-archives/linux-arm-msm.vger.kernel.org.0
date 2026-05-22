Return-Path: <linux-arm-msm+bounces-109378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4I6uCj6WEGqBZwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:45:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 992865B87AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37C08307C4B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5F6367282;
	Fri, 22 May 2026 17:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="air3kRtD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U0hc4Wwz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E15365A03
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779471292; cv=none; b=H9xvgroGCPkdZ44Y8IN8uKgBuQv6hU9xXfdOuDj6CzT+5mrSk22lV8iA6+JupmktwaL5XWWalOuUYTqPKcXmLh8Szt0ZBCtwqJ9GFZcnZb5lNm2XF2ZExSneqsKV4AmLzKSji3B2JQo8Sd0LL8r3aPvdL5ZPMSeTNVdVT9qMfdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779471292; c=relaxed/simple;
	bh=A6F5qReJDJgGgECAx/he/Gp+PHKgzH5mAl7LkVSzXqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c0wrNl3gR/Ap8vOe878vYvX1g/uKvSEvuJUzAZ5v/+hLd4NDeQUIaz9AFDq7SKqwZBfWaS4UWs56n/VTf+PQ5oLfFgBmbTQj2tfNhIpEo0rOdHw6j56TDf/aJZZFm7J037nCIS/ZnC16+YCVERIknOkQgfIBZLbbQqVkkhQHlBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=air3kRtD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U0hc4Wwz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MHUcSu1800934
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:34:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Uh+8YeArH5l
	xuIrq/0DkppLWphYU2zvQ1bZwgrXCWVs=; b=air3kRtDA09Uyrt7IzbcPzQktN0
	kG6T/kwCP8BohzLfrNGshaB2Tj39ogphVQDFxhFyb0927MiL0dB3UPIB8PgpF7AZ
	sYWu0L8jVbACAYIpD4VGDPN8JUeKOl4VvQ/7mLoeOlQJq0IHpE+LPKvOb53QQO7k
	icUWQlb4hpwktDGNiBf5aEBhX+cS/5MPDBc3dNCAU9NhKgXqzOmnIWGPK0H+z81J
	2l2AJm7SapDSBzvjHnHAQahMw2Ap4snWuYzDRKy3hOvnjX9t7GtiiXLdlGx0eOry
	gwgch9R49yjlqkP50XMbiNGzpeg5w8ljB1KeUgvnKIbxYuQGXyQ3Zw7anIQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean9g1q68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:34:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba86e35aa1so123496785ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779471287; x=1780076087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uh+8YeArH5lxuIrq/0DkppLWphYU2zvQ1bZwgrXCWVs=;
        b=U0hc4Wwzpiz2eDG+E+bGuKNEXAAelC8kY5lH1STL8HjPmCIIsbcag2sfI7iackSKz7
         aurSumbjdd356txHn/PQGnAw2xYUht3pGKKp8mduigjKZXnwLlxAIepTmyi4LCJ0nxqO
         qePi1TaUmGRHhDjPUCmTPuTlol7S5J3fmzoT+xFX7Mn/6CIGt8gx6dMvY/iE/KE15wVk
         jYv2sIgqwFc1N2Z1olohWCZZfeetGZzlnu3d5ZQ/wqNFTjCRHRRgaG6HRzv6ksveIkxJ
         i1XycJ8e6uRasR+juWkRczDHK7SiAVGjwV8DfW68busn2eamaqjpiqWrGA6Qj67QuVIj
         qCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779471287; x=1780076087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uh+8YeArH5lxuIrq/0DkppLWphYU2zvQ1bZwgrXCWVs=;
        b=MVugqTzswQ5JmbV05tMpTs1Cq22EEFS4gHgZYQLbMDK7mGwjgk9EJig9n3kxT+y5dd
         U5IQl+OMHDCO3ZxtBz1CYmALuQgzWAm2KBVo3+KLIScVshZa9Cm0IY8krek5PLLGhVvw
         dUxO055IIRQnmuS1KRAIb9ZaHBVfBHtAvJj09rtixVXy976hD3EpyVd2QDyR1cBu7P6h
         DutQn0d/gJUEWBHWWadQJro7ELS/H0ud5cGAI1y+XPmS18BFQgmTmGH1KfUhbaiq4n9K
         hGLrfP8G9TBgkLRIySR9pJut1yntEvBvmF+EgOM+WXgvWWLBTU0NHhPeO57CVqal11MP
         excw==
X-Gm-Message-State: AOJu0YxP56M0Fx0SICk2ICOMNoGbXAL0ZkFHXWOid96RwHn4RNBH3Ccf
	pV7+0gos7/L5vAZhdIG1oCWHf2UEPey9KMvwuRjYCEYhpcfyDKub6UnQ9Ka5up9+zO8VFT5y6+7
	JoTfsXb6soOMN+2yBNu/8u8FlmTg8UPPP4gf5gDOL4e+cF6W77rQPsIMa3msN9OBNg2lF
X-Gm-Gg: Acq92OH/CJffYIb+200rKMgdvs4siY/2NAJVJXNLWeknObLYD7Y0cww9wlnvham4Yxg
	BeRmeeP+DL78sHJYz/Sy2El49poY5vObTuzzdbt0P8x0tt2KXsyJoUR+5uo83lYP9tV1PF7dRhB
	XMsI3ENzTV7B+PVzTvtkS2KOxVCnEFNXnaVDLxam/QkUPNuzxjvY8LkP4N2pMpPNwKsfoBgO2Fk
	hSMu9RKAxlPuOZxXshcr1bj4/O79/5g3iFQjuVKpn1mny7LZEtpWKSWbNWIRiMVfOKIReGAabpu
	36QiAYf+VK0TB8HXdPwF8z1//Vdl+I9H8F/FxxpFYE2Vw3teKd2d1Wlw2octr2EGBKR9xbjQRJr
	eSc+B7dy2309VVXDJ0SW9knJXNQyWLknh
X-Received: by 2002:a17:903:350d:b0:2b2:4cd2:e162 with SMTP id d9443c01a7336-2beb065aa18mr50980525ad.34.1779471286965;
        Fri, 22 May 2026 10:34:46 -0700 (PDT)
X-Received: by 2002:a17:903:350d:b0:2b2:4cd2:e162 with SMTP id d9443c01a7336-2beb065aa18mr50980165ad.34.1779471286487;
        Fri, 22 May 2026 10:34:46 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56f9100sm21464675ad.37.2026.05.22.10.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 10:34:46 -0700 (PDT)
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
Subject: [PATCH v9 06/16] drm/msm: Add a6xx+ perfcntr tables
Date: Fri, 22 May 2026 10:32:52 -0700
Message-ID: <20260522173349.55491-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522173349.55491-1-robin.clark@oss.qualcomm.com>
References: <20260522173349.55491-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xN0kJgqMn4Yrl4GYvtimFbB92cb4r9Tx
X-Authority-Analysis: v=2.4 cv=B/qJFutM c=1 sm=1 tr=0 ts=6a1093b7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=tmZHKQuSfWdd6biKE2QA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: xN0kJgqMn4Yrl4GYvtimFbB92cb4r9Tx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE3NSBTYWx0ZWRfXwEL1kw8LcI8+
 xOoYWHCwkf1sj11+ag4x7zy0G19yYovhbpgb+7E/uX1w2hvPwpoFvvGoizD/cysd64jyMxAGTub
 RdLpSPCKjWNWNMtnw7exmalanjjpCKYcc7FfcrYREt1waBjYAdW/zKuCAZvmo1WoSxF+GNWcmGO
 gPW2hUFckfkA3N8hw2dP7WxOEm+1hgexgyA6jV12gDJuBeXvx5S7dvqYyKy/PRq5KJqL1ynGcm5
 aipGH6oS0DGLLFeEjtcY0jdTR5aKi4Le2lOrzFk1MGlE0/CEn6N46IIs2QIFRu9VOf/eYbAXF9b
 +tftNgO/wUOJvAFGRzy9q/+sX4t4xkod3mNR+ogCaK/r2Bh+qp2E6fjiFIqvn1BTNWgNgl/YkrE
 KxmaYqisES1OyjAN15CiTRdjDUVAejqhXmiDBzdThuHOdOND5Qi5OkBHex7Q94fXoEUJg1iIcab
 v+oyOHDdsi/V/QryyCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220175
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-109378-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.987];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 992865B87AC
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


