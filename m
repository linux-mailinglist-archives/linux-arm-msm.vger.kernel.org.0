Return-Path: <linux-arm-msm+bounces-105797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKfKCcru+Gla3QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 21:08:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E1F4C2FAD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 21:08:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61379301F148
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 19:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1088E3EF65F;
	Mon,  4 May 2026 19:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AYBo1g/Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RpW+Ytv9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F385E3EF649
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 19:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777921715; cv=none; b=DyaJcLfSUvJp3fv2ejqhNyBAFpTI5Z5AOcvNdRbzFknVovzbk9JiJHL9GmhBL5t8wMq/+iS8N3oko9Id10gLBJbBxJNYRi03jvMmRGsnjnpAb04qlQUqL7ad79Zl7tNf0WGPrkJE+JtkWMbaNS6fgtzsiyY0mPRGRXAebjU2Gds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777921715; c=relaxed/simple;
	bh=EM7ENbxlrlWP9nDeXhbulykziWmwjg0MWHFUydnf3Gg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vurm7uvLj50WOcXQ8x2XRsaZgwgIsD5Riv+ctf85jvIOrI3UeQwD58F8EQ2Zp3zUID/CEHVx34E2/Ze1whnYuVRjRHqwaQOGNfLZI3sNM0WgOvPJQFC1ybXWSNElkzeE1KRT8IFU1s7aELSFCfiUbUCQ+fpCE2TV5bpkxb0PwSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AYBo1g/Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RpW+Ytv9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644DlMwi366722
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 19:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nY8Zf16hfaV
	mHNExd3/Edt40koDFD/E4yWO1TVKH8HE=; b=AYBo1g/YCo07xifCZTxImkFEyIs
	2CaoxM5v8ho7UJ80SVUJtQe3XnGk4Y/BnxMSAUDIW7OZMkz6wkNvWAAeIsSVrRtW
	C49FD3Mm18cWyeV15R+LTHzHFdv5VR9LXudxlxiv+3Tgu5ew0Jw/9rl3okv/ef/F
	THPKLSc4V99ZtapUriKLLjKMB7zni7Ag4tKLMTEONo0jaiNCu+VDAX/tZXwJBYCN
	SXPJ5EpJDki7IjqzNOWjzNNQ/6jDQ47VmsvyeSIZPe/gbxG77R8a02het5wrUIfQ
	KQCbPdKQzoNFCiTd9Jqf3NsPw5r7gBl/ySTiEaTGqXGXEvj2S9hO6sJNPVQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvn6s96t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 19:08:32 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b630753cc38so5853286a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 12:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777921712; x=1778526512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nY8Zf16hfaVmHNExd3/Edt40koDFD/E4yWO1TVKH8HE=;
        b=RpW+Ytv9BKJjhBWYG3/oyFm6Hq9A3W/r5d5Fwq3WRuni4L55pu1TqWsV21J+GohFl4
         KQkYPMz+WayZXWHtDBr8UZPv7RCOxRPt+sEMuoFn+P8p6hfHlhf1hdOu4C9yWv/a90vh
         vEH9cRuvNrsJMWKV+AGcD7rVHKq4bPNn3BStEI3hfnI7k4j4TDtvluiDoX94K7KF2eSC
         5oyBPPW4xOhzWZSSC3DTPoSeHWkOTmgN7nBi17eEVv4FHqNwx8UlPF4RQfZoiQEHN/6e
         T1NxlSKt8l9mXdMgCXVFzWKe6oEqxrKPJp9vlr54jk6kjpA/GS0T0+wIDxqeRG6Gk0m1
         uw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777921712; x=1778526512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nY8Zf16hfaVmHNExd3/Edt40koDFD/E4yWO1TVKH8HE=;
        b=e5z4K+lerbdsOmGs75cBn8Dp552QBKZoKWfrtZwiBp0EnjWNw4mnN74xaLWt36u/Kp
         PVyFxtk/23GJHAIaX/b4S7FHSPfX2Fgd0zGzGXq3xLp+IDVzIONxKlBZ266xChdFgV2Q
         QrP+vkek7NN1gIV/SV6akbMPsuH0VGsMvfViO4QynbMz49X1QPZDRdhDtx41k7m4VFZV
         JsNx7BkOvmKmASwwcHW2ati4hii5P6Au/IQgKP92doHr2aUFl8XO83gVqIR1WaYZ9Knc
         6P2q44CwiZMgf8JECZaILo3CyBi3twl27uTifC9dOOSDFzyjcX1oLJ53C3uEjiijyF63
         mMXg==
X-Gm-Message-State: AOJu0YwR5PQRFayPFNnKdIKHkSXmXjjd0Kif7m4Bqkym9Fp3CpA/C7TY
	qUwSj/XXoPXBAkaD+sOg6xPL5PTDwQ60Tr5PO1GLi/hvZEW27EPWUy5OfFaJugB3Mnrt2r4FQRa
	oNRln/7TTlJV8ZoFOzvxxUyr8wcoJNQTWs5+EQeFxRPStv+ha842eA3oU7Q/XgaSwAF3n
X-Gm-Gg: AeBDiev8CVF+j79EJ6iHH4qjblbDfFDIFXIjV8vVfw+QOz0IExb3oLG3C2hIOJAyZRd
	YEAD+AG3FmsNQw89NroLPAhsqb0VnFZx5kfEWO+w9WMRNxpDNlw0jexMm5tAwla3D+i/ndqOuqO
	/IYMjO7LfFD7iw5UZcgy2klg+R3GGc3SQmAP5nTcKUXww8rHbDw2ZrOf1vs0irOfZrXgUDpUBPx
	XzcmJUtFVnNRYGL+qJYg1gZQDh7FmlAMrFG3cL/v+7quKs52RBRqqu+i23A5124uj0pj/TMRQa7
	yOH7YZ/CaOX92zbmttpmZy2nJWMhfe/CUWLJdOb90+5uRtlAI6pLuX6jXwv3V0bZKeJojrDVyTs
	HpIFONQUiQ8KBT9W3HCVZC0wVTV5PreNq8Rn82ybE8/8=
X-Received: by 2002:a05:6a20:4326:b0:398:8870:b58f with SMTP id adf61e73a8af0-3a7f1ad133amr11856286637.14.1777921711550;
        Mon, 04 May 2026 12:08:31 -0700 (PDT)
X-Received: by 2002:a05:6a20:4326:b0:398:8870:b58f with SMTP id adf61e73a8af0-3a7f1ad133amr11856247637.14.1777921711051;
        Mon, 04 May 2026 12:08:31 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbc8ad8dsm10017506a12.23.2026.05.04.12.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 12:08:30 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 06/16] drm/msm: Add a6xx+ perfcntr tables
Date: Mon,  4 May 2026 12:06:49 -0700
Message-ID: <20260504190751.61052-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504190751.61052-1-robin.clark@oss.qualcomm.com>
References: <20260504190751.61052-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uq4SCa555nLoQk2us5QtaZFJpJi8N50W
X-Authority-Analysis: v=2.4 cv=Z+vc2nRA c=1 sm=1 tr=0 ts=69f8eeb0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=UuwE4gOO9k-hs8zF27AA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: uq4SCa555nLoQk2us5QtaZFJpJi8N50W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE3NSBTYWx0ZWRfX7EH18h1DpySX
 FOX020qC4H8vU8u9pbxr//Ne7buXSGRsg3dNupL+LU+zMbwF+S7rPqMOZRtlJJ/bCbnLR7OCR7q
 uMhM0wfWN+BEAm+vsNl8H88pAdjMyJuVrLwY3G/Lbfx4pDLSUG5agqgWx4RTwO6M3GITjYtHeN2
 YFq+YLtGKNhQiUwIxCdpWu39aOvy7bN2F2NJs+DU64xgWoR7uQBF5xbR0eVANKaSIbMYsJyOCAd
 i+qP5SVys2bIxnIfvoFwFxxidvuXPvNyuSwfAD5aSBlDcj/Q7EEZWeHs2qvdqI0DHBBz20N3sYJ
 NAppucUGcU36TjfY4m+kfESvUMXXnxEsl4+gNrP1N8y/U3EsTD8J1Bq0PJLU8mhRFQJGtqwJhxM
 reaFK9YGaEiy40mYCpUhxnGmP2LDegSc2QKvjIlzwzOZhSTaY2zcwFWNPAAIa85IvhUulNrJ/Gj
 nEkIi3Hb8M4sjaJRAJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040175
X-Rspamd-Queue-Id: B4E1F4C2FAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-105797-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Wire up the generated perfcntr tables for a6xx+.  The PERFCNTR_CONFIG
ioctl will use this information to assign counters.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
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


