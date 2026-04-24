Return-Path: <linux-arm-msm+bounces-104476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kI8OO3iI62n8NwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 17:12:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 717224609D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 17:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1494F30364F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 15:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F39CF2C1594;
	Fri, 24 Apr 2026 15:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lcsx29i6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YkFWq7m5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888842BEC27
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777043529; cv=none; b=sCaySsrFMP67vvPR5NnfErlx4SkClFZVri+s+t0BMevhmZhOdAKic0u92CNTf3xMhJT1NkPKZunvS1cNScUoTHsPGMiqm7TJ9uWtQQYxGbO+JJtj+jk8TL4TUL5Bw7cZSyQlGPA++TBiyyKMbrQbIr06Ia5SciCdDDiWKRGiSiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777043529; c=relaxed/simple;
	bh=UzSwe7nNkzpB+wS6zyIpQUgsfG1m2PPOjvq+pqnFQbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QAWP/hCvDofzTczhMxUism/my7BGsfZWZ9nWRGwho8baBoAzV2orvg9zY+luiK4d5yU7FhjpCbvqxbfATTyALfs5hZPRoJbHg7Y3btiJwamVemAszlrZj5Tw0HUA6M8zqBlB5XGJkzV7GwYy6Xx9osrgYKoiHNO1LXG9HaFgArE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lcsx29i6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YkFWq7m5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63OE2icA4012285
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hqrgam/FCMU
	6TRDYGic4FvNbNNuPhpsx7Cb0DIkY9Rw=; b=Lcsx29i6XWCGLkBzXoFywk57VYU
	CgWI1XgAfl7h6ESMlUXBOHPZH9N1NuzHYK1PybY3TbegLNfKd5ZDYZVJrwZLHB+e
	qx/R2rkP0z6bhyiqD00UydYh+eoXtBITE5HcJHGuaKZPswdv/NMG99BFXz9tUQXv
	9RLwT3lszlGusRwv5I1doqk/xe8+ucW2Apm9mppDy6OGl3pcLsufYrB3DQD7ID1K
	UpGMTOflUk4y1fGV2Zz2HYj73Vfl2fVNwsBHPVn9WZM6/Wz6WiCYGbncCMdEL1aB
	4IBEdLfo5S6R1p6picxGotbZiMGNsRjrKP20KJJAJjgFmtCgHdLVoj67Jag==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqpq9w02h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:12:07 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c798e905c29so3038085a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 08:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777043526; x=1777648326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqrgam/FCMU6TRDYGic4FvNbNNuPhpsx7Cb0DIkY9Rw=;
        b=YkFWq7m5ZvlPjCFG9bh2Q08Aw/JuC7yms0z6yb2mtFia8ik+ZvVFCU37mEaCKSpI+H
         srevZ5acjYKlsUTW3Iw+56VqravJfI4Jojw+zwRjmJtuD9/U+KZTiIcpWJnVmlIBg9MD
         F6BwDv6iBLn12HhUJDCvpv3TxbgmmeeaZLXq/MKehmhEhv8pb/RtvHuhOfnAuWnmWhLb
         RdWuluOhnXjTdqFH5cXO43+OCuhjZyTaX/RP83wP2qNXh4bCZ7Kz+0SujM+tPH/ouD+h
         r8TgespqgugF/hvN/BCruCW20BwJDsQ0JjjS1QaxnBcL0sfm1VzXfuGmHVxtu/UqYAxX
         dLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777043526; x=1777648326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hqrgam/FCMU6TRDYGic4FvNbNNuPhpsx7Cb0DIkY9Rw=;
        b=gXSNvLuhB1p9JuMO8X9koW6sMdo9ySLRTf3tgvtlcBetxMFUir3OrTyJ+Vi0GeHLXA
         4UwG9+TQgA7huyt7AqEBAQhwW5ERb1qgbChZ1pldElFO1TNOc/jxpD8I2WKeUtRDBO1V
         FAoG5vWL4iUMrT5q0CVvk7RF11n4fuaDRQ9dFxBQP9u5H5khkXwRITeHuEwV5I2cQwrv
         dPnnvI6GJPKpw+um5mh6Q97uMdMqdfEwyvWzilxGBbDkx6ZRQrKko/tBSqqba4xt2o3c
         iRW1tdgjm69atVaWOYQ2EBWmifpeuKeTp/m0/PFyL6rg46VEkmXUWvl1CXTMTxP8w006
         XvdQ==
X-Gm-Message-State: AOJu0YyRyW+A+B9HeEQ8ObZRx2x2Z/u9+h1+XNIIfkPsCuaV2u0PGSnY
	NNyQQqlxJYP2FfTxuYPH/27yW65Axx1doRedytP71R20BYKLGzj/43BoA2qVNUJzaeMpVdwUgUZ
	zgV9DChRYv/8L5wAtMRiOTCEkZ58D4qbb+KDh50DZ7zTkZurmYFHD2wL47DzjHSSliDtJ
X-Gm-Gg: AeBDietsIj59AmNDPciGdj1koWMmmYl12+NWcsHav5U4KWL0JfbYphD54CN9uw/93qM
	/sSiecVBF2wGeo/uXhGQCbqbPqFblpsd2nLptHv55NJTrOA7BJ4PeQObQx+V/yJdkniYPtUsLg0
	rts/B5Pwv13BpE2DrMJJVasflw+NoXSK/WWTV+iUwwsrxW5yWHDKHPH/Z4U5eqx3vER1phLyMn4
	9iNtKk6QEGwRhcWOSsv7oE7ZAORqDtWl0HN5WtCSGl8+btCttaY0FcABXBPvAwR1dXBIlq+XAmD
	Vo0kZ+Fv/w16OZ1QGS3OhygSvFDFlatLL8npoHsOVXjQJwW9LiztcUTWJLfJsAob6YM3a1WAOMS
	qvcCLnnG8KL77gi2FEKucTGK7uaj8ybXxTgQuwN35lAU=
X-Received: by 2002:a05:6a20:7fa5:b0:398:a76e:4ad4 with SMTP id adf61e73a8af0-3a08d76d92fmr36814960637.21.1777043526263;
        Fri, 24 Apr 2026 08:12:06 -0700 (PDT)
X-Received: by 2002:a05:6a20:7fa5:b0:398:a76e:4ad4 with SMTP id adf61e73a8af0-3a08d76d92fmr36814927637.21.1777043525796;
        Fri, 24 Apr 2026 08:12:05 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797702faaesm17883136a12.23.2026.04.24.08.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 08:12:05 -0700 (PDT)
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
Subject: [PATCH v2 06/16] drm/msm: Add a6xx+ perfcntr tables
Date: Fri, 24 Apr 2026 08:10:41 -0700
Message-ID: <20260424151140.104093-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424151140.104093-1-robin.clark@oss.qualcomm.com>
References: <20260424151140.104093-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDE0NyBTYWx0ZWRfX5EQMCCTkTuI5
 2/F7sq06Y5XeXzAb4YzddaccjtJ4ceYZKQvgqmbRjjed5hl9nj2FxeSOMnRAUbDdCgRzXNZcdGR
 omdEHEw3qc9UybrUC6c2bVndJNrLYneS8xs7ZbjbiYHVAkWk9ory0EEKvAhBpNm3t9oWY3ONnA2
 GGbOetdjgJmcliVSzYW1X43LkmBX5AvGviFZBY8kNueCnEjuQmGBlrNWIpgKUnoZge6TVrsQQ7J
 eILc0RL13tlg6rA+1tseCOYmFlFRflygWlxF+BAPnwzbBpinCpY5QssXJapN1L7OsWBilPVwbzD
 zMzwgEoSRboAu20CE3sgtoCMNDnRsJGaIHgHBxtPNQYISp1ZR5Hc57W61CPt+xATYR0RdbAc1Nm
 rgfEDo+hnCgHn3E3uJrK7oidol03HiSJSPpkK1xcB1o4DvxRrm+gEWkdYg83wJ5HLFw8fUAbv4b
 nHBnK7EE7R8ImBgIAUw==
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=69eb8847 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=UuwE4gOO9k-hs8zF27AA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: PHuPof6c1yihiD23PinU6VVFz9LFjgeY
X-Proofpoint-ORIG-GUID: PHuPof6c1yihiD23PinU6VVFz9LFjgeY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240147
X-Rspamd-Queue-Id: 717224609D9
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
	TAGGED_FROM(0.00)[bounces-104476-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
2.53.0


