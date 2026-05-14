Return-Path: <linux-arm-msm+bounces-107624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKYCNOHVBWrxbwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:02:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5A8542B4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2EA8830C5190
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95CAF40F8E3;
	Thu, 14 May 2026 13:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bB1NJuNy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DUiJwDGz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87E640B6CF
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778766882; cv=none; b=fv9Xt236udarQ7hAnhCwp63S+A9+J3Vif0UGgTvNeEbuVye3EqvZsQ0W5m0RSd1o3itnl/Q7fECuTXfk6w5yGzd2J4nfjoh7h12pekg7bLpdGkAgKTjrp1W0NmiyurXfo/JOqhZrUYyYU6uMV7h4ymNT5n9XqZNANfUP6P0Sn3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778766882; c=relaxed/simple;
	bh=Go4EyvhlQyWzHCh2p+9M+OIk/P0VvfEAaU7NdiQe9WE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MxzQqvXr12fD7J9r6/qov4uQysiffjrfHoEkC7w4RVy3L09KO+HBP0+NmL5MNVSYI3Wsf/Oh/Kiyd0eGzS4dtHGW6QlZMeh7FtH5C3BbAKm2RdBK15un1yHkoie4VoGyZZh7XIP52madmPUyJlOD//zPL5b4HYWogvJEHDtCPHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bB1NJuNy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DUiJwDGz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBesr92842121
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Rv3QXoFqyvR
	3pKOjjPZUAdbwE5pf1YjcLxou3Iv6008=; b=bB1NJuNyqhGZYoB2UByMtpH1iEq
	dvl2cWOj9TZpqH5wBD5+cVCo9lqPkWjpRmh3FFH2DO90NzLNyL0FTYoOPQOoTq1T
	vaZ/lYPdLe3fBvy6QIzf2eJgYuzitLmllS4c10+DwxOf+7r3yq2EMO5INynEHM0C
	gCgGYHh5eFwobxuPPoTFrrCiz1j1pvWwrFrgKzAnmoFSyjcFxk9FF7L9uqj0kC7q
	qgyHYPqX6RDsqO0nqCqu0vEqDjUCS6JfFk79yxhUA6x3D95E+Bk5EkdbMAsVwcV3
	US3CFuAtEOY/x5jayfrUehSiFmrQNGYAqm9WVI9O4VNfUErXFFd5ADGbJpA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5899sn6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:38 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c82ba4715b6so1115800a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778766878; x=1779371678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rv3QXoFqyvR3pKOjjPZUAdbwE5pf1YjcLxou3Iv6008=;
        b=DUiJwDGzEPxf6CFzuVUkIdH2uzhnFogdZ8dku/fxEeYwxxLWjTQWeDHyw/46UqUGwJ
         vJo5D0TxDkLEjMm7tmJE4GLM9E28fyJlv4Wgx9E8L0km2gFAGf5oiYB1e4rLZYxSPQBo
         oTuLlP9+qEDHNfqVtnqKcz5l/1Tb8H2k66y9jeQfLAHqR8cfeTCB272AJwFcgdQEhArQ
         8GziNqEN/bvNDPGtgZSWayxu5OUGNQ4xpYWXmqgwqYb8QQSBadFJNcEj1eErdcalPGww
         fdlSxtFcgrCJDVYkGw3cafMjcI1fGRVpMpp0Mun2KkwJ6OJo0cfz10eOoP9wEPbbz6f1
         adfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778766878; x=1779371678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rv3QXoFqyvR3pKOjjPZUAdbwE5pf1YjcLxou3Iv6008=;
        b=Sf1PVaBgNJP9lqt2kRr7xcFpMRpUYLB1wxKL1Jz9MiY8EUnqtaFryplCGDSWcQHHlD
         dQky/kbhTvCt6s7KMKGR3OwByURwhbhgm6zgPJQArtNVYXBu13p2e0rUZ1vNlMx9O+/S
         ESUehDa9O5sAtUTYvhgXjTUDx7Gs1ej6+LT0Wa1SJnr8qqIxul1uHUaMut2oq11S2dyV
         AjNnHa8KUN91e33DIV0fjM6hX8vYd31hmcvpYiAWRSBwZ7oeUfbQR/krS736bS4CMBfg
         5jE64AuSE9jvcNz9wLLALNPHBwdr4GFknxmSFSfBg3+7I0qrwi3ddyn3xEJbj/bE2+rf
         0bow==
X-Gm-Message-State: AOJu0YyT+VM84xtqZEhhBGe1CZ7pAP0uutyD6kcfTsdCi1h0tl2i6X2Q
	x0hb0r4J1la6MQsGR4316EAmhZ8yPqCt+qsrz9HM/mQIdf1Dvha+aF+KRViPrL7HwnnpXyLtsfO
	DmH0idyy6z/dnAR4sFZ/IdNPxAXKqamQ6dho11ENXsQmGFpIq2+zB02eCpIAs3B3SABZ3
X-Gm-Gg: Acq92OEBm0IU5PKgVOXj3m3WAdCbppF+Mdumk42fSuIwzHc0ArfWeT13Lx6bjBPbL/z
	jtcUEnBA4BEFwAvJ6LkPS/R9UidOLeIesDKT5BKqeLT/psQgJmvAxbBBuhlJyxzFAhG+wMdU8Fn
	VWvMG3teEAU2vs5cO4ykKHk/x0OpHfW3ACXLACjfnrrsEYJIMrRqcYGoy7mO2gYam6qvTEB1x2t
	0jVYh+djNt2h6poQFk88d+D96lbJ3/k91S+ZBjqAYh0QBJL6olDiLqL22s0TQy0rWGFp//62Jfs
	39qUCimyDCNh88wofFSIvwdONF0Dk+9oykYMreROBhvWm01JrXNemlNV9uc9qjR3raqdpdlsIJN
	PntfHUngg4QeM5ZeHVG6wTHevzyanDZc2
X-Received: by 2002:a05:6a00:44c6:b0:83a:7516:5be0 with SMTP id d2e1a72fcca58-83f05bfdfa7mr7252569b3a.50.1778766877717;
        Thu, 14 May 2026 06:54:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:44c6:b0:83a:7516:5be0 with SMTP id d2e1a72fcca58-83f05bfdfa7mr7252531b3a.50.1778766877167;
        Thu, 14 May 2026 06:54:37 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5c020sm2828875b3a.30.2026.05.14.06.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:54:36 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 12/16] drm/msm/a8xx: Add perfcntr flush sequence
Date: Thu, 14 May 2026 06:40:00 -0700
Message-ID: <20260514134052.361771-13-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260514134052.361771-1-robin.clark@oss.qualcomm.com>
References: <20260514134052.361771-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0MCBTYWx0ZWRfXyzvZH1NTS/Nh
 +mlpUYwMPBUwcF1R5GFP3qdv/j6K++ZGs2Pa0z7CexiAebvbMwuP52058dVN4fTZ2+fEYfUOH17
 NcPQsvHJqyKg0VnDMhdHiIpHXtLhrGm+wulz3EroG2NvBTxY1BcL34HmBzhzBm0AbLosZoLb3M3
 zhwP+2BdsAtamtGoLINNi25RcB63yY27GSaNa3xd/cjmMpL8ipvEX2+EBndggWbeH0tSld/CmxN
 PPKlfjmfQDskFfMXli7EAZdQP8KvBX+V2jVqh6q4BMf6BxbG52726olMOutGfyGzPt1H90YtVwE
 H7gwtz0prF35DTlEJZKfXisEbavexxntHDeq8r27Mn24eW+4mTYdi+DoO44urlgpsrPGLoZ/+5+
 P/Weaej2/1sd0lXR2lYPfNRGFXNI+yIZv0xdmB7CI+ZbWzo2aRb8ofSk/Qs0FIoE7xSfmmL5BUf
 OEkfYjHee36u4K3258Q==
X-Proofpoint-ORIG-GUID: meBkKAHgQuBigsnk29n5XcVv3k38Bw2O
X-Authority-Analysis: v=2.4 cv=N6AZ0W9B c=1 sm=1 tr=0 ts=6a05d41e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=W-43u8CF5Pkpiqpb4b0A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: meBkKAHgQuBigsnk29n5XcVv3k38Bw2O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140140
X-Rspamd-Queue-Id: 2A5A8542B4E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-107624-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

With the slice architecture, we need to flush the slice and unslice
counters to perf RAM before reading counters.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 20 ++++++++++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 30df9bfa9ef8..a329d20033d7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2921,6 +2921,7 @@ const struct adreno_gpu_funcs a8xx_gpu_funcs = {
 		.progress = a8xx_progress,
 		.sysprof_setup = a6xx_gmu_sysprof_setup,
 		.perfcntr_configure = a6xx_perfcntr_configure,
+		.perfcntr_flush = a8xx_perfcntr_flush,
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a8xx_gmu_get_timestamp,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 99c3e55f5ca8..3491a24a9320 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -334,5 +334,6 @@ void a8xx_preempt_hw_init(struct msm_gpu *gpu);
 void a8xx_preempt_trigger(struct msm_gpu *gpu);
 void a8xx_preempt_irq(struct msm_gpu *gpu);
 bool a8xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
+void a8xx_perfcntr_flush(struct msm_gpu *gpu);
 void a8xx_recover(struct msm_gpu *gpu);
 #endif /* __A6XX_GPU_H__ */
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 124d315b2469..6c040f718176 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -1345,3 +1345,23 @@ bool a8xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 {
 	return true;
 }
+
+void a8xx_perfcntr_flush(struct msm_gpu *gpu)
+{
+	u32 val;
+
+	/*
+	 * Flush delta counters (both perf counters and pipe stats) present in
+	 * RBBM_S and RBBM_US to perf RAM logic to get the latest data.
+	 */
+	gpu_write(gpu, REG_A8XX_RBBM_PERFCTR_FLUSH_HOST_CMD, BIT(0));
+	gpu_write(gpu, REG_A8XX_RBBM_SLICE_PERFCTR_FLUSH_HOST_CMD, BIT(0));
+
+	/* Ensure all writes are posted before polling status register */
+	wmb();
+
+	if (gpu_poll_timeout(gpu, REG_A8XX_RBBM_PERFCTR_FLUSH_HOST_STATUS, val,
+			     val & BIT(0), 100, 100 * 1000)) {
+		dev_err(&gpu->pdev->dev, "Perfcounter flush timed out: status=0x%08x\n", val);
+	}
+}
-- 
2.54.0


