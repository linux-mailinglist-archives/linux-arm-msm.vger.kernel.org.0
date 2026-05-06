Return-Path: <linux-arm-msm+bounces-106157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJGkDXx2+2lVbgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 19:12:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A40C44DEAEF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 19:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5A7003019148
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 17:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB314B8DC8;
	Wed,  6 May 2026 17:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a4vYDOcS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YLLHoXIW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2954A2E2A
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 17:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778087529; cv=none; b=tKwzCrkOaK78jnzQ8HrV3NLQXrah58EHS/D4cJdOiVFTtaYGvxkxKUXGeOl3W4LMRvhYivNA8e1zkjokWJtOoemLQ850eENWx7GGiGixX5k6KyUtIBapyRBTBoztxIQerwZqyvH/13ErDjXLreY6A0+dgE9+zuKWp0HOmWx52S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778087529; c=relaxed/simple;
	bh=EM7ENbxlrlWP9nDeXhbulykziWmwjg0MWHFUydnf3Gg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qeVlihvnoDDJT7z5nWo+7Dof9qMD23ScUB033EtaxHz9QIDm0QgI9oezjZStblEvY6acL6XNyYCDAvv/iyvWfcpq5YKOZ2GpxzS9CN6XoVI6KjZUJGqYgwZhyr6hE9rA/XhvxP02T8jrYQggZqEsH/6KA8FhxVmZ5+TsIB/KoPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a4vYDOcS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YLLHoXIW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646BVeq42581348
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 17:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nY8Zf16hfaV
	mHNExd3/Edt40koDFD/E4yWO1TVKH8HE=; b=a4vYDOcSiiN0dP9oZK53PrvzSbQ
	DrNMA7b5x7Z5P7hOiM/krxyULrnGlBcxln28lKPS1ZFk1SwSRaoEK83B82MG9gea
	wgHu4ACKegp17Qk0u+5w/yl54nNhTd6MLuzduSYk+GT7DUmMPjqQMlKFuUGXoccv
	o4YH/lsX7DN9VasidTp0SvECj5laJs4QRdkdQOE7f0PKpZRB3Qd9SC8MvJFYvLlf
	IKQ5ENPpzB/zWXfwr0vggL0gaq/xdfjlYZW2upDwZgbi241UtEXJmzM4Fe9VyfIY
	XY8Uy1jekKAzPdlZKonU48jO2MSgUnnrHhHIJZMGLdoddCfX2Byhm1BAGxg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyyvw2my6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 17:11:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3568090851aso16072808a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 10:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778087518; x=1778692318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nY8Zf16hfaVmHNExd3/Edt40koDFD/E4yWO1TVKH8HE=;
        b=YLLHoXIWeGaHKAhxeJMz2tIWK5DH6TWaG0yhGVvPr3F+sklupeZ1X+umrsJ5tcdhNr
         B+wtpluiQxQysmqy1fy0AYodHYeC1FAklt6xkdcEXfFCNTbGOdq+lkGxKXgJG1DOv0Gp
         qb55X24IOK5nxZXV/TKIjhHObj2hsTXDOHj/cz7QaOjhh9em8MkKwUVtoscjpMos8X01
         He+WxNWixlYikgRh1iIvJmoVE9gU7svKHq2pG57Fk0EfKC0OlNHaWPcnMuGtojE5zxqx
         B4e5zjycCLEszv4ybxwDZBAtpVV39iYUCjJ1Dai7fGW2Agxq5OG1FDf/Mer3VlI2cp3Y
         sG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778087518; x=1778692318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nY8Zf16hfaVmHNExd3/Edt40koDFD/E4yWO1TVKH8HE=;
        b=oARG3FGihzB4qskHtvW/zGqdgdRko9742tD8cN17NGTYL0isEcJ0X9FGhbmcOVRDr5
         CR+hABqwkWYVv4RyjJEeiKy21gEX1M1cdYf6m2CukbhFN6HNueEH86CiDnECvffFZ+Xj
         7f1YfBYJuXxyagRXYtRDiTKJQFivFAtftACWWWc1H+kN3Ca0n6D5owAwjTOeI5u2x/Rc
         +44IB0MIrLDehk4nxrrbQwZH/vMoEtRzeK8fnKp+rj5BJSSvNER8sU4TV0S4qyzUJV8k
         0A15kSOAreC59s1SxuiuxFiwqiyUDwXP5I5wuya4GbIdJhLyYAsDlA/SnCG540lit1PM
         IjjA==
X-Gm-Message-State: AOJu0Yw19Fda2ow893qlH4s0zAK9jg0mMDHtEFrdeyI13E3PdW0jTKpI
	dEJqgQa3q5/azMcMQxJKvUbazSTca+qNx/jq8oR/ooZcdwXPGJiP0iAS0Up+/4xzZ0gq27RxBYy
	A/iWB39tuklqVvFZgeXZwqza85D9AZfnBd14qZElV1M37h7zWrmlbgTyWYWa7ZgaxlnpS
X-Gm-Gg: AeBDiesu0b8qq9Xm9nc1q/+FjG2in9uB4JpZLwddaxR9dmgr94BwTO2GHxzj2rdWJVW
	QtNgVQYEg4hvEHZKnk6Uw96fGVAR1Qoac3zyLE/fVDeSZKm5tpj9mxGFe9g3OGbnA9x/j3OCj6I
	lTwIdpBPKWYWYcbEIkj5+pFWNJDYGfuf1Til2Tq3ZUL/MONs39brrEsxrJaHTXZgxa+n65zYvw0
	TSSeVye18kA2yjbe2Yw/7nXf2+b4tAhBWK7x0ZlSrCbnUUq/epD1A+cmtlJXpb/zmKm/NduuWTm
	MVPo7Wqg123X56aRmN1Jz83vJucF+Xat/9BXLFrRbwf/7dpdC9owypbwXDysr4B+fQO4NUO1dEO
	bWFDE/T5BjvqNhoPtZxnocgS2Q3oCv44rZepwglLGpak=
X-Received: by 2002:a17:90b:4b87:b0:365:46aa:e68c with SMTP id 98e67ed59e1d1-365abe79170mr4073668a91.15.1778087518043;
        Wed, 06 May 2026 10:11:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4b87:b0:365:46aa:e68c with SMTP id 98e67ed59e1d1-365abe79170mr4073619a91.15.1778087517517;
        Wed, 06 May 2026 10:11:57 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b4fb5f1esm2963395a91.14.2026.05.06.10.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 10:11:57 -0700 (PDT)
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
Subject: [PATCH v4 06/16] drm/msm: Add a6xx+ perfcntr tables
Date: Wed,  6 May 2026 10:10:30 -0700
Message-ID: <20260506171127.133572-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506171127.133572-1-robin.clark@oss.qualcomm.com>
References: <20260506171127.133572-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YYCNIQRf c=1 sm=1 tr=0 ts=69fb765e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=UuwE4gOO9k-hs8zF27AA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2OCBTYWx0ZWRfX8lGCL4kie1Kq
 keRCYKxWWGhjgspUrp/iVIweiH2NY8wyTRLPqd73mWoXxb2t7thFfNcyPRDYD/W6TFwiobWTjvb
 /5f6zj7DtvsT0MvuUD45Hi+qUOp8UhYWHg0OOj6e4484ZTEZpW66Xq1LCZD/R1CgNAQH8Cwl29T
 MpoCmWOeOM6Kd+aaxF/TOPFocztJk55Cvbbx5ZaYwuGshTRqFDRxB2Bn7vUVLKZKhd4XXUtzXp3
 Z4kJRJ9r5a7EhVJQmsw1K9hBgP44aVsnKANvjnVzqWEQhipLmyzPNyku7AIjbKN7p9lNA+Sd4Ck
 nCbaHWckrQDff+S9ZEGbEp4Gwfc0WPU7FujuHX/3od9oXgaDUPmARpWvLSxOnIWHZt93BNuu82d
 NmXwCA3782M9ZKfwE18pXdffVCnVvEp3UFKEfGDXtISDq82jHoTzdgmUcPmo+kW5FkmWfUeDolx
 iGtDqZ74Io2nMTH2DFg==
X-Proofpoint-ORIG-GUID: o9TqQFt9Y_8HM48K1gnLvoO7CEKc2_72
X-Proofpoint-GUID: o9TqQFt9Y_8HM48K1gnLvoO7CEKc2_72
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060168
X-Rspamd-Queue-Id: A40C44DEAEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-106157-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
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


