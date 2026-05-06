Return-Path: <linux-arm-msm+bounces-106159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DMjCY12+2lVbgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 19:12:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D71E14DEB1C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 19:12:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AFEEB301485A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 17:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 570F54B8DE8;
	Wed,  6 May 2026 17:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gzT/d7WN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YmFartSr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333CD3F787C
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 17:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778087533; cv=none; b=uiFg792L6ZBdDFsZGP5VciRmcYZ689bQqoz4ew1YlHGQf5K7sy8CGaVgt2MGBwhK5GY0vBDXG0kcn4hG9GIaqc6U2P6NJrCCLdeSmy4PD69fiXm+vd/xfOxHkseSd2juIBnNjbf8GMNzzdIsuXI1KS+iRE9IF/Ry5GgDRhDPpBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778087533; c=relaxed/simple;
	bh=nf/AzQJzAwD5Wdqnd6VCCPR5ecVd2qygEvoiPvLJ7Vg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OzCiBM9nu82oisjnZziFKVY079BXJ63L+2Wksmh7WV+8CjNNVwTiJq4iLBIKvF35uen/MS0NBAPnt4CTAepTC1+nrpCUunyg9rnwSTcfdy/SBa+Yri4XiVgiEeHql5l7T9+UmAAgmLNwSmFkbgk/ZlJJao2sNyhbYaQAeA5EyIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gzT/d7WN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YmFartSr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646H2Q013524219
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 17:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZFtTLmOQAzj
	qHoC3Fafdx5s7yem/Cv9ClA1WpeTUDMw=; b=gzT/d7WNqGmxVLtlW2PMnUu3LvO
	pVFpqm0R0wCsUY41DCKVjP4WEJG848U6lwXUmChfZgW3foHt5xBMZEzzodKLVuQk
	YOjFliIqCsy376bDsAaohLxPxr0skFqXIrPbgBQAafslEA+ozXZUIRSKkRN8rPJJ
	Ctq6N0/XeVV+RyKlv2Y4DBpZE10B3PhSxim6SldaRhhFQqH+IDhOq2DcvMS1Lero
	9lRcWHDsYfDQN5uiIpymmD4xdzgvadFDP/CrWlIdlf+zHC+nuGsLFRB8wJ6Ovoyt
	iAyLdP/BhWN5CV2WMSV4i1m8uHUmAVkopggu2YKrKoSs0tj78mWzMWKs4UA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e03jwsm13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 17:12:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35845fcf0f5so1081520a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 10:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778087522; x=1778692322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFtTLmOQAzjqHoC3Fafdx5s7yem/Cv9ClA1WpeTUDMw=;
        b=YmFartSrpg51YFXGmrlXpdVZ82ZQVLTHlYe/GPP4FnCBrUpgXrkqm/Zkn20yzB1yvN
         URu6pUX8SsrbG1yvZI4mQ9kXDG4QIEjyw9lXAVsANpn3afzE01EF8Ssr0/TN6LbehmS+
         JsDQNguHZ4K3aMaxz4NaB69DbIVKr37oifF6H2G8WtPwcJPJ2kxVnTFk4wrCbqhFgKFJ
         j9Q1CitetmgTuUUSpaojFG2MCcsnezbrfbP+2rqnjKaKrxTJJgasajHSw1t2ZWTKNQ89
         vpALky4Kb7cvylsek99FGzg4SEEHgKziRldJ8/c9naHgQ4K+R8HNYkqAebFiDrTvRlVh
         bbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778087522; x=1778692322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZFtTLmOQAzjqHoC3Fafdx5s7yem/Cv9ClA1WpeTUDMw=;
        b=pX8Osm4QwQgK6oDF9/yk4mbQ2XFXCSvZHf2n6eu5dGCTKj4zpa7eEHpKF9YpliEWso
         anQHpXHgLCb5bXH7SDePTaL+44k7nQwqePjC4K/NeqGhOy+iC0zLL+h1jMbFGi+8u0Pb
         24oEAQ2G1lXhkgsDOE8sP9wiwFVUMfdfNZMzVwCJy7MxMeaMBttmOtEibGjUxxUnCYJv
         D33G740KtaqeUHXHhmwyVlnTuCSJWigwpOo5YW3D8oi9T+B2wWKC7BYMOwfd6YXMDFgT
         AGLrpZoKxnDtAn/0UAkcOVLOGIC7xeJWVixwhZwl4TxOZjldcJtTEPcnm3X2uxNFgGX5
         8evw==
X-Gm-Message-State: AOJu0YwrKzWsRGWn3lB8tF9GDNgd6uIF7PBLLToDM6BCPZYl9nhWc8Nm
	Pueq03Qa4P1Zprw1PbTyytfwm3AR6rbhQEtIKYQdmNgodZYz/h03L3quLzadK5Mdu1dEkwjvAub
	UXUUyR/eY638QlLySvnptl2TC3ZIT4IH4WTbXQZZsLzOtu1LFQ+KVrVZMtQ9/ZVX6N9fz
X-Gm-Gg: AeBDies8JROgyIedDRSB/dmXqWri0linlPHmKdVJR9kIvl7S+2nep5EwR0FB19wEGHq
	eNEfv8O4gbXnR5Wy+6KUWpDsyWkGKc/ZJfNONoJlMnDBjRsduvMwppmn9rjr0SgOzmgrDNHHxvi
	jclyxGIuySQXycjR50YzmNFFQTAR7eaHC2xAm0Its3lst4POnqJgGKSKP2HbTw7sWByS8pa3q6l
	G4Fn2/W3lEp5bZVHUaeOw0C9xpxj8esIQKpBTDmEMygStaWWbtxwvpxCkp/yIud0BiQcZ9ywWpi
	w7D+52hEXBOeffBrOWD/EaWnxZcJHNlM1ja4D0BBRZtbb5O9qqIpPBDZWCiAfI8OWV2N3QgXZ/l
	zBKwGGp/EHDiLf7Db3g9LDaVkDMXrXwQf4a5UcBfXXdM=
X-Received: by 2002:a17:90b:3d08:b0:35f:bb17:39f with SMTP id 98e67ed59e1d1-36572246912mr7800352a91.1.1778087521638;
        Wed, 06 May 2026 10:12:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3d08:b0:35f:bb17:39f with SMTP id 98e67ed59e1d1-36572246912mr7800316a91.1.1778087521065;
        Wed, 06 May 2026 10:12:01 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8242ac9146sm2903659a12.8.2026.05.06.10.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 10:12:00 -0700 (PDT)
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
Subject: [PATCH v4 08/16] drm/msm/a6xx: Add yield & flush helper
Date: Wed,  6 May 2026 10:10:32 -0700
Message-ID: <20260506171127.133572-9-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=J4CaKgnS c=1 sm=1 tr=0 ts=69fb7662 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=7a4_7rcHm0II5uOVc2AA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2OCBTYWx0ZWRfXz+fXuA1DwrBU
 blUS0RH0hXWoS5XQDjerRvDhRxLRgzoPsyNXwt00B6u4XnEdU23RhNY/psqG0McXJiE7ys+Bfxz
 pcAvHJGfvyxIqdwoaEvFUhAW4dbvN/Bfddso+NC9n81EWekE+e1kZHBikBkryfYOi1M9X1Huq8M
 jJR7wGKeKnYv0IeAGqiKZuplKgaLfsT9rpniw6kjzdEi4sXn/IEvRpsp9THEXDnNq7BVQiOr2LQ
 OLofAuuK7pojOeAKdnWoHIYn4POVN5ela4DgXUKu5sLcW0PEfPnMlsRX2tftrtMratERfjiFQUY
 j+ENDhq1pAwLWrzSLTLcfS4eJnhmmDw84T604XAxKJYSeTMB5klw+vahOgl6BVGfeFUWWRNctAS
 5g0qWHT3z0PJ+L/xh0cxH9C5n4BMqJ2nkwF50U4imU7exxTeWg5R5ACZKTkH7WUJe0k8j5aTveX
 g3+/TOeMp8mhxjIEv7g==
X-Proofpoint-GUID: 2Tfmqt8RZMvfYYTHrg5fcyDhJm6BiEwL
X-Proofpoint-ORIG-GUID: 2Tfmqt8RZMvfYYTHrg5fcyDhJm6BiEwL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060168
X-Rspamd-Queue-Id: D71E14DEB1C
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
	TAGGED_FROM(0.00)[bounces-106159-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

It's a common pattern, needing to insert a yield packet before flushing
the rb.  And we'll need this once again for configuring perfcntr SEL
regs.  So add a helper.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 55 +++++++++++++--------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 10 +----
 3 files changed, 28 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 71f54ab5425d..415902f6e5d7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -189,6 +189,30 @@ void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	spin_unlock_irqrestore(&ring->preempt_lock, flags);
 }
 
+void
+a6xx_flush_yield(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
+{
+	/* If preemption is enabled */
+	if (gpu->nr_rings > 1) {
+		/* Yield the floor on command completion */
+		OUT_PKT7(ring, CP_CONTEXT_SWITCH_YIELD, 4);
+
+		/*
+		 * If dword[2:1] are non zero, they specify an address for
+		 * the CP to write the value of dword[3] to on preemption
+		 * complete. Write 0 to skip the write
+		 */
+		OUT_RING(ring, 0x00);
+		OUT_RING(ring, 0x00);
+		/* Data value - not used if the address above is 0 */
+		OUT_RING(ring, 0x01);
+		/* generate interrupt on preemption completion */
+		OUT_RING(ring, 0x00);
+	}
+
+	a6xx_flush(gpu, ring);
+}
+
 static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
 		u64 iova)
 {
@@ -597,28 +621,9 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_PKT7(ring, CP_SET_MARKER, 1);
 	OUT_RING(ring, 0x100); /* IFPC enable */
 
-	/* If preemption is enabled */
-	if (gpu->nr_rings > 1) {
-		/* Yield the floor on command completion */
-		OUT_PKT7(ring, CP_CONTEXT_SWITCH_YIELD, 4);
-
-		/*
-		 * If dword[2:1] are non zero, they specify an address for
-		 * the CP to write the value of dword[3] to on preemption
-		 * complete. Write 0 to skip the write
-		 */
-		OUT_RING(ring, 0x00);
-		OUT_RING(ring, 0x00);
-		/* Data value - not used if the address above is 0 */
-		OUT_RING(ring, 0x01);
-		/* generate interrupt on preemption completion */
-		OUT_RING(ring, 0x00);
-	}
-
-
 	trace_msm_gpu_submit_flush(submit, adreno_gpu->funcs->get_timestamp(gpu));
 
-	a6xx_flush(gpu, ring);
+	a6xx_flush_yield(gpu, ring);
 
 	/* Check to see if we need to start preemption */
 	if (adreno_is_a8xx(adreno_gpu))
@@ -958,15 +963,7 @@ static int a7xx_preempt_start(struct msm_gpu *gpu)
 
 	a6xx_emit_set_pseudo_reg(ring, a6xx_gpu, NULL);
 
-	/* Yield the floor on command completion */
-	OUT_PKT7(ring, CP_CONTEXT_SWITCH_YIELD, 4);
-	OUT_RING(ring, 0x00);
-	OUT_RING(ring, 0x00);
-	OUT_RING(ring, 0x00);
-	/* Generate interrupt on preemption completion */
-	OUT_RING(ring, 0x00);
-
-	a6xx_flush(gpu, ring);
+	a6xx_flush_yield(gpu, ring);
 
 	return a6xx_idle(gpu, ring) ? 0 : -EINVAL;
 }
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index eb431e5e00b1..99c3e55f5ca8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -317,6 +317,7 @@ void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_
 void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert);
 int a6xx_fenced_write(struct a6xx_gpu *gpu, u32 offset, u64 value, u32 mask, bool is_64b);
 void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
+void a6xx_flush_yield(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 int a6xx_zap_shader_init(struct msm_gpu *gpu);
 
 void a8xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index e022c9a162a4..124d315b2469 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -488,15 +488,7 @@ static int a8xx_preempt_start(struct msm_gpu *gpu)
 
 	a6xx_emit_set_pseudo_reg(ring, a6xx_gpu, NULL);
 
-	/* Yield the floor on command completion */
-	OUT_PKT7(ring, CP_CONTEXT_SWITCH_YIELD, 4);
-	OUT_RING(ring, 0x00);
-	OUT_RING(ring, 0x00);
-	OUT_RING(ring, 0x00);
-	/* Generate interrupt on preemption completion */
-	OUT_RING(ring, 0x00);
-
-	a6xx_flush(gpu, ring);
+	a6xx_flush_yield(gpu, ring);
 
 	return a8xx_idle(gpu, ring) ? 0 : -EINVAL;
 }
-- 
2.54.0


