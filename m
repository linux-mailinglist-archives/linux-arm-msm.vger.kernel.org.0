Return-Path: <linux-arm-msm+bounces-109862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFB9Hp66FWrKYQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:22:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3175D898B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7469530C5FD1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D6B401A00;
	Tue, 26 May 2026 14:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KNrBTtCl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="huiFniJy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5260B3FE34B
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807253; cv=none; b=a56PDD/vjoDJsK6Q9Zgv7RWnfRZUa+yitAJFJulNykD36TSI/xn97oesQ6S1amc8k9V1uQWEz/FIiMA7dZAJ32uVUHF9q05HDQ+nhIRwQ8qPHACEZA+KkEIvn8b9e8qeFfrmFGkmBswrUnwqiAe0euNCgvJpkOQaRyvUVAedJIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807253; c=relaxed/simple;
	bh=XNhR9wJ6Xe5Ap7GfKXvLHhbeJhmNM8Szb1KAjUtjki8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pO247sgGUrx5GKXHYifZFWNZq1nu8ABakipL0JmtBuSe7d1bfdiL3o5PF8YvwcmsvhY4z6uu0Vo/2ZyQTpz9ILK43X3EDO/ngJ7jGo2s8zIC+PidOpwVxK2MCrtIZWyMk4gR+AfUJOR/j4xGjYZQkylW9Z85EEYZkZjlR9dQi+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KNrBTtCl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=huiFniJy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsZRZ2496687
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:54:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FTzqvCJ4e/b
	0k11FoL9bAgllsh2Gh/B4rquYdI+KjCM=; b=KNrBTtClxs239+IrLK6flfCerlV
	NE2iYGPUvBHFC2aLGMbbJbRUFONQmcHMe7kbmfjiQeOVvJU5wbO5pidrBUuWLV94
	/S7xsqp3E+tOtix11AwhMsC6z7SztrAnutw6R9MxbVgLaG+JcSDgwMRz8PfLGrnh
	XPADLkSa/yJNWgGmESZd/tUk842FMzNAAE3Xq5FSqTfl7N2gKq80g5Awgehw/Ucz
	6sdAl6WjBnSTOTrmq6xDXW8a1uZgwo6hpRbJX9TcgzGZu8LpjnVU+g4LcGTzitvb
	q64nSkG0ezBIWILqB/FbYAAkh1n4RjvQUqApOlbw5W+HH4yITqDmNlFznRg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpyqmybh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:54:10 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-83f7e7f7457so6717608b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779807250; x=1780412050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTzqvCJ4e/b0k11FoL9bAgllsh2Gh/B4rquYdI+KjCM=;
        b=huiFniJy2aNBqwQH9Kbs4TxIOwaX1gkvrn88BfVt4pnHWacexk0m9Gol3LXHJP0i7i
         WX5ysQi19G9TFll5HNahTXt8LbzqPg5eJeKyXH18JGsT5TO4LcsdB9eL2nR6vZL9x7KH
         MVsUe2xiSHYZL4CT6DlRrfKyROx20dQWTDco4Jx7cURFqnrHECfqljUQDC7j/Pd2Azs3
         2yAvztVjGyslZ5CByqE66r3Xi9oQJmXWSgl3w77AajHS1zAMiuhpuZmDPRCM0zA0Fbsl
         PlN0pfSx+tevqW7E2UKJUZwvVQHZcLvIInS2yKOs4UzmhE+P+fXezRpJg2paS7OiOlcI
         LKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779807250; x=1780412050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FTzqvCJ4e/b0k11FoL9bAgllsh2Gh/B4rquYdI+KjCM=;
        b=FaPrXxwbXCLc9nWNmDKaEyG1gwL2ALn/jaYiIvTG/f0UaXMq2MfjRvi0DYir8bkyoY
         xScMgYGsKh2osngIWE5BvnHjmNiQbnJ0BXv6NRg3kjeoIKNPRWZQw3p3AjORKHSOMgVE
         WZK9nRtsX9wkSWYHZU55RtsCP7sjXxR9hREWwDGEi+KkBy3NRuS49uWKXHZeTNXB4CEM
         giiOdQkzEKhwiVSyNUGHDD3jlw4LQtMVEPGr54ZcxPsKgF5MiuGCDxTuQdx+NLb58fwf
         9qfbIWllRJ0WRRw44c7digEM9lVuulubhtKxuBzD1uLOt3MM4BzpOKcyWm9GCu9hJPx4
         DBww==
X-Gm-Message-State: AOJu0Yz6J8ExUEIZwoRZZp6tSlkveKZiu8nAaD4b2P8fH7Lv0EMAjElu
	yNo127D0Zoho50n1gPMr57XdS2aQbUBfl7cPdABNVP23ZhTbJRgFM/BPXvPimgHhkIYeq7tnERt
	Cmb3uVM+Vcr6BXs6AwjWRoWcctpgpwQl19m6y6lt3beVe0uqm7l9KJ9m6hwsq0h2x0kTranhgDt
	Q8
X-Gm-Gg: Acq92OEU3kyfdzuxDCTBRW/Z4jctCATG8SmKEcIm9q8uATaKYU4Wg7Mf2fRuRHr600x
	nX4khC7GqGm9HYEtmCNOVZjSM60W5wo5oIpEH/US7f076+tFt9qMLE1Nsy2YDvjSS0A2h630p16
	s068IdNGs2Sost9GCa2Omi6+wgrCcrpi0Z31x3U3X6S6rk9gl16BlKOYhXz/opJmQesf9nKayZ4
	E1zb5U59iruzgDlmOUonWvVGRxNrpWq0TGpuQARCd+Xz0t71iVU8fDQURjlOIcngNa7XOajcfOT
	GgYI4jyJq7DjuC1XhsZ04bVl+K0PS4GXITFlMmzgWGYhwyxeUb9jI9T5nZrfUzVjaXt50LP9iF1
	EquGJSYzrKvAGB8MlVzGZsHEAE5pHGCJe
X-Received: by 2002:a05:6a00:6c83:b0:82c:9c90:6ea0 with SMTP id d2e1a72fcca58-84160b84f62mr13220141b3a.3.1779807249820;
        Tue, 26 May 2026 07:54:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c83:b0:82c:9c90:6ea0 with SMTP id d2e1a72fcca58-84160b84f62mr13220100b3a.3.1779807249163;
        Tue, 26 May 2026 07:54:09 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8419a140893sm6498627b3a.46.2026.05.26.07.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:54:08 -0700 (PDT)
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
Subject: [PATCH v10 06/16] drm/msm: Add a6xx+ perfcntr tables
Date: Tue, 26 May 2026 07:50:40 -0700
Message-ID: <20260526145137.160554-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526145137.160554-1-robin.clark@oss.qualcomm.com>
References: <20260526145137.160554-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a15b412 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=tmZHKQuSfWdd6biKE2QA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 8S-A_0bHISrQUJs3b0rbxE0E-4PUxwk9
X-Proofpoint-ORIG-GUID: 8S-A_0bHISrQUJs3b0rbxE0E-4PUxwk9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyNyBTYWx0ZWRfX3n9T/RneLgSA
 QjYddgn71+VsIuKIF15FXJMSJpzBkniy2juh2gz+H8yhTye6pYdFyQd5SIKpLuLuy8NpX0bdWLc
 9yy0TKCT/HlJDCyLlUPjerMl7uBRkHxqjsOEAGLJb+JD2OBOaEl1/6jsoA6PVx74i2DvjqBOMJj
 iBv3asN2uZUOB+qDr9Pkp2ksVBZD9wya+vi/8vPemC3Ax4sETF74c3Ckyte61aWg0FWBvCWXU9e
 DuXdvKrTaA+1+yLGOjXtXqTM/R6BWAlFsL22e+L6PlxJeFNvnJszt/I9E5ZDy85l9wZHzSRB7KQ
 SULXas8teCezj2YJJJFJA5kSJnZwvPT2qWJvBkoESIHPRd/N2mW23hvfOfar9rtOG5kjahmycpc
 YPXUN1goBHmexvb3ttzjHSt+wgxKW4N542NUipLbF3blp0joVT+hdCyB+veGjcao7ii3sqHGQTB
 4JMuRx6QyRNdvhUHzDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260127
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-109862-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.986];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7D3175D898B
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
index 75300bd69e80..8b0d627b2779 100644
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


