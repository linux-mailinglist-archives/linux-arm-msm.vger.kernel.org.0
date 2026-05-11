Return-Path: <linux-arm-msm+bounces-106930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPCtEezUAWryjwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 15:09:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9978050E95A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 15:08:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A22A30C0216
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89A12E11C7;
	Mon, 11 May 2026 13:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="onziXyfJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qe4tGWSd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38213D812D
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778504481; cv=none; b=kB2/RQ/1MNN9D9RwTEvC3DYtMMaJxOXfIPxzEQ1q5ekDOh4mv0l7RWgoj0Gp+iyNyT+WyBm2lHJ8cCBlT51NyoeRnwwlrChWpfriXZc9KJr8GPqou6MV//sOlPFtUyC+4sAB1lFFM2oC4o4v/LdQSLvTTTY6aGl3hfbMJmBUyCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778504481; c=relaxed/simple;
	bh=EM7ENbxlrlWP9nDeXhbulykziWmwjg0MWHFUydnf3Gg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rcUIW/EkpN+07AUJtsTHRpbZxlji6+5mxEM1RieG+ttUbpJxm+d1+bWCSuUWW0jdmDVEZwQ19ihxVmO2za5xLHvJvWB66xwQMr6pPQnFTbpgowcZubN/odVutCNN9Mho8xULn5Cq8jZvbt+DzNm8vOuy0BaM1DHOUhbKBaZ4UdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=onziXyfJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qe4tGWSd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7AQtm453496
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nY8Zf16hfaV
	mHNExd3/Edt40koDFD/E4yWO1TVKH8HE=; b=onziXyfJAeQ0gE0fEb2+dLroqHe
	KgTRLUHSAKybG+MaWZLxrAxISf9bPlYYP6NugrZII8vKvB++LGWSZGj2XVFFur0E
	CTmNDv0qm09T3zwqqqprJAoAI4XgRcnDiMsi6d+c6Q5gngnTrx4Q3Y73cJkl9Q5B
	wAbevurssyaYHS38TZjHUVukgegJuAitLP/BzGLSZUJWzIuWh1q3wVl+Dr1NUkrS
	oIbSovLL5tHWhAh1bcGS3QT4j8cmRHjHvYdo54HVIQvnD3SGCt/CFUQnk+y+nq1q
	tQGQQjey3huLpJXAm5SXhqrXIzrRt8UQRHXk9ddhcOzzlggutle7T+ZZVCA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ag6h6gp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:01:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3662eec5271so4485733a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 06:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778504475; x=1779109275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nY8Zf16hfaVmHNExd3/Edt40koDFD/E4yWO1TVKH8HE=;
        b=Qe4tGWSdnY0GQBCPoFYsjXrWMOTdNDMTImtp42bPv1qftwnrjfeD4MarhcWxntQFil
         iSiS6FZmrROIqXYSQfshx5jdLzl0s72l0bqPk4DpQxkBb32XfGQ/XZIKAt/6YXa6FqyL
         kwg8JjiYEcbV9ZbLBtfWDK6ERm/feiKvbJodEE0WDgBvr1pST2IuH/kG/eO5EpZhsEQY
         Ids7hVMstqVidw27rs+hXvIn5aNGhWXBCMQwPj+07OSZ7jitATt4US2Ig2zAAj1+KVgO
         3pzxJh7EWrPKIxz7qom118yd+il9rFgjUv3Ce1MlpGVb6pc4x95lS31U2HVTIVgIYKhV
         oYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778504475; x=1779109275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nY8Zf16hfaVmHNExd3/Edt40koDFD/E4yWO1TVKH8HE=;
        b=ei7d5fOPncI6AluPONCPD/1yei3Jb0d77gF05Vh9NedBhxEDn47oE7L7OrOiZh8Ye2
         bRMj+7skPThikXvtAhiHMP+8+dK4Dm157IUDDuixRgGFeF6kGdkxHYFIaPTm6qlXrDJb
         T8phXtAcxCe9F3DLWkeShL/iHhnBc+5pJi8uAXQwzfa4tpVMD3C6xXx8SJmaShzPaX3u
         aEvauOJIZ49lv/f9LueRFMg+LAqSEaM0EbDHQSSoT0h8X40nHvn5qXYOllw1pGJBHcOS
         IN/8GgnQdKYpBWjEMnKddty1zv4FzJKgPK/qUKUpF09+gfwm1meDW2+t6Aramodhkbmn
         sqhQ==
X-Gm-Message-State: AOJu0YwhErLpo7u7YrUe+v+SuW6A+5hMFsejfh3E1v1MI9K3vZek5Szi
	n2DIzpl6ur8C5GxVJBCzJXrZZZpwRTw6djDy/PBNbpgFh8Dx9g2FGo0Aj48TuYN9xK8qqi3wsOg
	7mxfU6XVGZAI5doHC+GmHQvrcM5tSt0h1a0OMgLF5QQrGRg6+TZLGGpanchjJ/iT5kTQR
X-Gm-Gg: Acq92OFFOfRJ3wp/c6v4l2OEcppQKYnSeEEjHoZEGk2FdGADT9Mrgq3G08UPL9z1EA5
	aZmOEvbSZmn6bKjlnThOSrf8RXovXmQUDbtWtSpM0DWKkqM+FCTk0LdUrjLZnEfP355UQ1301Xv
	NqD6iTDtJJmbsD0voQ1IFBtB7rQ4FtSeDf9+u8OxlS9/5YWOEvwFwCJ1XbvDl4zIIhfkZa24y1Y
	jaEflyaGPYSWhG5fGLs7KM4aIkyJmmAD8d0b0+ZqaBOMfKwrZS24i/123AD5i1PI5N4q7baIC5g
	B/36qevKXXOtDDBP0WRR/hKp8cB3oYFDuPqQcll5WRl869ra1uUpS+h7ktZule96G1DuVv0wYid
	cxr7mNdRZR0o0RPL1vUOZu32MOkbwfzZ6
X-Received: by 2002:a17:90b:5746:b0:367:bf59:6f99 with SMTP id 98e67ed59e1d1-367bf597967mr11496089a91.26.1778504475150;
        Mon, 11 May 2026 06:01:15 -0700 (PDT)
X-Received: by 2002:a17:90b:5746:b0:367:bf59:6f99 with SMTP id 98e67ed59e1d1-367bf597967mr11496005a91.26.1778504474449;
        Mon, 11 May 2026 06:01:14 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d623fd6csm10370504a91.1.2026.05.11.06.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:01:13 -0700 (PDT)
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
Subject: [PATCH v5 06/16] drm/msm: Add a6xx+ perfcntr tables
Date: Mon, 11 May 2026 05:59:19 -0700
Message-ID: <20260511130017.96867-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511130017.96867-1-robin.clark@oss.qualcomm.com>
References: <20260511130017.96867-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fOsJG5ae c=1 sm=1 tr=0 ts=6a01d31c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=UuwE4gOO9k-hs8zF27AA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE0NCBTYWx0ZWRfX5QyDNLj48RQP
 jhbR9cOoGBTWiqJTrqAeVugMlLKG3nBfNWVht5LOS5JtcNYmqNj4ZPa9Hsutjzmz/tjw2BPmehH
 rMmg4cW7jxrcI2yeAkTQuVetUluPbX2a6UwAzYxxzxj1gnCDSeIQWQCK4JhAPR8s8GfX4viBAxl
 TvP0xwqqCaEwAd7JmgWKhWcoHYs4PpwRjVSfAHmcAWysTS7L3DM5MoXCBNlt+Pg5JQEL0aWlqBL
 RnIwFmbpAXnJ/z/CLuRtpgF5F6PxC9PL174Nj8C+Tlbp7Cz5GHOk0d0yTxYck7wqxR4LwDRQ5bw
 IozYfeHNs0gnWITeUxCNla8v0or0JyLRaGGrUhcFw17Or6UxewO1E5/gpC7zXmmD3WLB2jFQ1pO
 Q2+igCqQMn4efn20+cwd6f5ev30TU++klXyRLXSFGzrp7gG5zIXqk6xAJXOKrSjW9zQJjy78xOI
 6/O7A7FXX7VJZZK0eQw==
X-Proofpoint-GUID: GXc5R2YSO5I7_8G6yBCTxHU3e6qhuC6u
X-Proofpoint-ORIG-GUID: GXc5R2YSO5I7_8G6yBCTxHU3e6qhuC6u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110144
X-Rspamd-Queue-Id: 9978050E95A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-106930-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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


