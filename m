Return-Path: <linux-arm-msm+bounces-106169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNFWBrp2+2lnbgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 19:13:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F8C4DEB65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 19:13:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7EBC8301B4F2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 17:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0927F4B8DE5;
	Wed,  6 May 2026 17:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cwvoxX5K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sx+QZy5K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B030147DD56
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 17:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778087549; cv=none; b=prrdfhs8R0Y1HMjGJXPkXvoGJRtwOZaZDhF/NmSOfAZpvjOw/3GRc+Y59GxsdgXkA+SglYX+W8yuFzn3yOUI0H9kVUhrsYGe/sInHNz8d0huKoN3a8RIy+j+cgzei4Q2qTE4I8SJmhpdLgf1CGqIElhS4gH6grzA8oarr5PcPts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778087549; c=relaxed/simple;
	bh=nSimtzMCf03reIDW/ZPwUxMG3evkLnwMtQ7AanDREFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q2URWHhe/lFNvc+roqjbF8cYebPUGU+PHvzyFmlGgrwu6qcfwgIw0P5NHRoSWE6SqpXOzMJrKvB4jcMLa6Fn66ShjnbvQy1QMgd2+a9SXLAjY1pwV3eaPN7wRUxyOOlYGu+zubFY3UP2qEglPTWcMC0FQa475VuyLV2lK4B67J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cwvoxX5K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sx+QZy5K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646Buprf2581710
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 17:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ltx6YbZjqP0
	n0TLXyDmoE2icoLsRZfk+xmP0o/mye+A=; b=cwvoxX5KO7zWLFEHNViksRIsoMf
	0d1ZwErrxXaJyvgu7csZvX1XGcTS2GZoimbPPc9fMrJ+/3TF0dUauCy0yOXKqQoM
	z8PDRTZrt2/jtz7aTFwxqRUMb/Rw1YFFcoPnIkW68rG0MTOiwSpLtkHf3uRdFei+
	ha6/rD1bCyekL6mwUKnVB2oiVExvFjOuUuwZsfOjo5u5+AGNl0UiZMGPmblMz7Gq
	lIZtdFjXvBWfW3IfVhGJcDOWnFsaHGnJv2hsC+C6ayJg4AhEYzRlMqYVIhSCrZtu
	ylEWNbc+O2jmbDdx6uNEn+0ab6804bvzDSfSvVHjEk7jiakWdFpdv62i+RA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyyvw2n1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 17:12:17 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c82346bdb00so2476350a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 10:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778087536; x=1778692336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ltx6YbZjqP0n0TLXyDmoE2icoLsRZfk+xmP0o/mye+A=;
        b=Sx+QZy5KBqKtMv1Y3yv1Nd4DPgRyd4G6qke1U8/ASprgkcyetd1vIj4+/1+GjeLd4t
         0U2X+urQ7BRkG60N4hsvtsDXmBdw47YNYR/JG4+ZHAlCcFEVLzcwkXeO9OEbDg2+/9I4
         7wEgic87LPKfr4VzQkaJfbtKodjWwm4iRRNU+JkoTAB3g6fLVe4QpKNnS8ny85HlkxXA
         60SWgGWrDf7T+I25JCS4JKghGfD0JtfX2IT/1hOFAWIbwN86Sp1oTcyUGJI7K0Nw7sI8
         t44G78mliyTQ4acTJsOfwHd5yBSPLpF8p2ByAJAUnCcZNR/F1JHKohjldSeG09U9zyP8
         0f4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778087536; x=1778692336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ltx6YbZjqP0n0TLXyDmoE2icoLsRZfk+xmP0o/mye+A=;
        b=Ms6f/DzV5nAuqITLLXAPJC10OULn4cu2YlmdLsCH+xzQMR/4PRIpALaXW5TU5GSWBd
         uzg3inAx4ypsCko/Bfe+VHNu/c3XuOLg63EZrraQMVjAjOqXgox+QarTRykK7hjdzE6L
         rMzcY1GPUbvN01F5sYIp+G7Dp2J4e7oo9WcsudhY44O2l4r33ECQDIui393DSNUPSpuZ
         crWjiGRPrQgvNeQQbqT4qDxakKwU/ewtsWZDHuTebghNBB+M6W1ot4TvrOY7Mj17AQr0
         0+taSmkRy5W4SOzcODzQkueCl7Ch8CMs5BnBX5oSV1i/SUxHlGFIKvKvL7X+uix+/X6u
         FDDw==
X-Gm-Message-State: AOJu0YzUZdjYZWwDngLmRSGMS9eFvji2Zu/QGNmMwPKq2nvglCzBcFkX
	QRKseC4/KlLYk5HTNY+wStIStymAAC1fZRlUUk/3pqoBUQsGFD8QH8c31kwgiAfcD4znerPrCH2
	iUBLf++sjhto9a9NACfQTC+pef9gY6tRC58zPV3Ju8s76R4Bh/ptNMJMrc2sqKYY9aGEd
X-Gm-Gg: AeBDietRXoE0xdc4H4OcFVDzUPEaWKI05EGKNOnVwLaV6qoxrP+/FF/5GOCGU/X9hZK
	oslnDzZmPhG2jrT9XfQPn2b21V/AZ6uM8JMfV+X2nLxSvTcWqxZYGvWm6VHM/8Gronm3LlU/pn4
	UPXvjrZjXoTIBnTJRpHcehK57lq9MYzyjLFJEU2Kcv3i0kvEDuQeQcqj81X0u6k8kt+bCIeuNBE
	DRxv0EDH7HzTBk0tbVXFwTlBmZvzAVZ34DSv8Ushw5Skm5wYYT/eRAzaUzbEza1pznRT/rb8HJF
	E0s+N8JSNWOLfv/0e1TYbemXYVWI07Fg4dy8KieLT21Kzl8DE9eLK1bq4FHJY9WTIlkSiY3czEj
	hUtjbIGytq+pgJM76E5aMOrJzDHSAW5uQnk+iDUTgQ0ENDZw2LOqYsQ==
X-Received: by 2002:a05:6a00:2356:b0:81f:31c3:2e34 with SMTP id d2e1a72fcca58-83a5dd5c7a8mr4219527b3a.25.1778087536503;
        Wed, 06 May 2026 10:12:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:2356:b0:81f:31c3:2e34 with SMTP id d2e1a72fcca58-83a5dd5c7a8mr4219457b3a.25.1778087535860;
        Wed, 06 May 2026 10:12:15 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839682a4bffsm5597815b3a.56.2026.05.06.10.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 10:12:15 -0700 (PDT)
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
Subject: [PATCH v4 16/16] drm/msm/a6xx: Allow IFPC with perfcntr stream
Date: Wed,  6 May 2026 10:10:40 -0700
Message-ID: <20260506171127.133572-17-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=YYCNIQRf c=1 sm=1 tr=0 ts=69fb7671 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=5obZvuzjGUYrwyXX1KsA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2OCBTYWx0ZWRfX+jTFCXtTYwkT
 A8k1o1nquVjcnSvx3qwbO8MFDLZZmCfDIR2Lev4uo2y1mqztweEAeiwXF47xRJxJWJYZp70kIyZ
 tVyEJF8BZbHbXBDNWuqcvBX1F/gkg9IiAMrayHsDMnmJLUnh7vdSaRH4Yr5w1Ar5pVlFMtR6fK6
 M2yKmrFCRtZ42hwVbl1RQRsaRahsvZ1nQ7X53LcUR/bIX4bLfYMr2Awb6elTZ4clDWryWbRT4r/
 lHe2fDVzJZFRzGj3GaDV5qnTz+X0fzKsP1fGgyPrZMmCkz26azNTrRJURx1AN5NilRVw45VPblx
 3OHUFK6Sk0ETP9vq5dXz+fcUzn6sayGDzBjgENEI9WQ/kTqm99H7YTCPOXYiu+hB7V3e84dnoyB
 4loUbyldePke0bB0ciRqGmmjZn4ceTfcfOYu2o3n/k/U31EhP0pQiBvLfE9rTdnafYeaoMxhPEE
 j0Yd7NzPrtXPL/G8exw==
X-Proofpoint-ORIG-GUID: Mr-gybFD2tfzS7fi4jSgVmSMhnhMoCme
X-Proofpoint-GUID: Mr-gybFD2tfzS7fi4jSgVmSMhnhMoCme
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060168
X-Rspamd-Queue-Id: 84F8C4DEB65
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
	TAGGED_FROM(0.00)[bounces-106169-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Now that the dynamic pwrup reglist has SEL reg values to restore
appended, so that SEL regs are restored on IFPC exit, we can stop
completely disabling IFPC while global counter sampling is active.

To accomplish this, we re-use sysprof_setup() with a force_on param
to inhibit IFPC specifically while the counter regs are being read,
while leaving IFPC enabled the rest of the time.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  4 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h         | 10 ++--------
 drivers/gpu/drm/msm/msm_perfcntr.c    |  8 ++++++++
 drivers/gpu/drm/msm/msm_submitqueue.c |  2 +-
 5 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index aba08fb76249..0a7d49a2c877 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -2034,9 +2034,9 @@ static int a6xx_gmu_get_irq(struct a6xx_gmu *gmu, struct platform_device *pdev,
 	return irq;
 }
 
-void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu)
+void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu, bool force_on)
 {
-	bool sysprof = msm_gpu_sysprof_no_ifpc(gpu);
+	bool sysprof = msm_gpu_sysprof_no_ifpc(gpu) || force_on;
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index f3cc9478b079..eecc71843bed 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -280,7 +280,7 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
 int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
 int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
 void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);
-void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu);
+void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu, bool force_on);
 
 void a6xx_preempt_init(struct msm_gpu *gpu);
 void a6xx_preempt_hw_init(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index cb74b7606987..e3b5fab6f68f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -93,7 +93,7 @@ struct msm_gpu_funcs {
 	 * for cmdstream that is buffered in this FIFO upstream of the CP fw.
 	 */
 	bool (*progress)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
-	void (*sysprof_setup)(struct msm_gpu *gpu);
+	void (*sysprof_setup)(struct msm_gpu *gpu, bool force_on);
 
 	/* Configure perfcntr SELect regs: */
 	void (*perfcntr_configure)(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
@@ -378,13 +378,7 @@ msm_gpu_sysprof_no_perfcntr_zap(struct msm_gpu *gpu)
 static inline bool
 msm_gpu_sysprof_no_ifpc(struct msm_gpu *gpu)
 {
-	/*
-	 * For now, this is the same condition as disabling perfcntr clears
-	 * on context switch.  But once kernel perfcntr IFPC support is in
-	 * place, we will only need to disable IFPC for legacy userspace
-	 * setting SYSPROF param.
-	 */
-	return msm_gpu_sysprof_no_perfcntr_zap(gpu);
+	return refcount_read(&gpu->sysprof_active) > 1;
 }
 
 /*
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.c b/drivers/gpu/drm/msm/msm_perfcntr.c
index b7a9e3967a82..09e58a9a20bf 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.c
+++ b/drivers/gpu/drm/msm/msm_perfcntr.c
@@ -261,6 +261,10 @@ sample_worker(struct kthread_work *work)
 		return;
 	}
 
+	/* Inhibit IFPC while accessing registers: */
+	if (gpu->funcs->sysprof_setup)
+		gpu->funcs->sysprof_setup(gpu, true);
+
 	if (gpu->funcs->perfcntr_flush)
 		gpu->funcs->perfcntr_flush(gpu);
 
@@ -295,6 +299,10 @@ sample_worker(struct kthread_work *work)
 		}
 	}
 
+	/* Re-enable IFPC: */
+	if (gpu->funcs->sysprof_setup)
+		gpu->funcs->sysprof_setup(gpu, false);
+
 	smp_store_release(&stream->fifo.head, head);
 	wake_up_all(&stream->poll_wq);
 }
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index a58fe41602c6..1a5a77b28016 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -42,7 +42,7 @@ int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sy
 
 	/* Some gpu families require additional setup for sysprof */
 	if (gpu->funcs->sysprof_setup)
-		gpu->funcs->sysprof_setup(gpu);
+		gpu->funcs->sysprof_setup(gpu, false);
 
 	ctx->sysprof = sysprof;
 
-- 
2.54.0


