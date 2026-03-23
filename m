Return-Path: <linux-arm-msm+bounces-99398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AsHAY+gwWmFUAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:20:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C172FD1D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:20:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1765530DF82A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC3F3E2746;
	Mon, 23 Mar 2026 20:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OznWtNKr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ievc48a3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3313D3E3DBC
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774296845; cv=none; b=NoCJXsfjObotPVJRB3HhqGKejQ3ZuuXBcz19J3+y4eiDrZjOYgxKnT3bQIoHPQY+hG78HRgrXxp3/JfjU0jmfHCB5AZur6hoctNewsDCO2lU3nIm2iJ8qWO+mx4I55tQJsi5XDaiK93N0AYySBoI9Og0+btspVG5TB6ErcnyW/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774296845; c=relaxed/simple;
	bh=FEe8R/rRX361Ss9+y/FT4W1Kn3g7sYPWTSDSorPhJG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tUTMfzkRpP7ort/QesoMe+8snAI2P9d8RVwj8H6h7Mn0PgviMBvsg+H2mtmMSFjqUCwMH+x02gmuJ3gcc4JtDAOhhhaQ8rVPbSEozrJsxfQl/ENY9ecX8Mup7qe/qtLot6aYKAMXBwWWmrkeJ375uOIoe7cvZnYTweivDxSOjKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OznWtNKr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ievc48a3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqXak362491
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7LQmunI4gQedz7r93OpyXpHZ3BB8yObf9HrBwMQos40=; b=OznWtNKruncN03KZ
	o3EWBPCUGMLrmAMWSgsDQuLzr6eq5z7XpdnLa76x+Lusm2UHXiSX/qV7WAKt0/d/
	dV5uyYk1fhVPnHtKJYdNp2HN1wmVnTmI+dZF0PF2yTeoqCnpbaiePB6Y/XwLo8vv
	Xfl0bmuu12MkWte12YBDkYRSL9fK/2cuKxM2OCTdNgttXtuzCw7xXtBONl0aKXDV
	tqNybogA/oxJpifItUVbqeYOfVFlAkJ7VdXE3GPlSLTZmEkb5gV6cpsoYyEa4cqZ
	ZLVNj4L9/zffRuCzCmlrMkrb8KNaAVw+I/OotzIkPJ+KQZ48Cqm5hvTUyjufi3S2
	z0dO5g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d33k322cf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:14:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7656dba76aso602184a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774296841; x=1774901641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7LQmunI4gQedz7r93OpyXpHZ3BB8yObf9HrBwMQos40=;
        b=ievc48a3AEpODgPgW2204BxvaVunrmi3yP9nxWGAAQshTMYxtSBKgKTSg0pJJfCFJu
         I6Snx36Xxp7Gsjb7mpvXFrH1uFKyDG+xb682FHaT34KkNtybTSDYdOldIDgIJoA4YjyP
         c60alosdFvD5jr/dspv695Yy6O+BqQ19vidBGmX+oEm/8avwJ9to9xeKwmcy1s9Yu00w
         scZggc7gJSgeDqA22nqLN/hTRrF8grdG0wItt9HSmOMcpqP05dmz0jkbglMQneHdiFmu
         +pxOZNG2i89IEBsTXdlLfQZf9gXaJSdLcjbj115Wcb4wOOQ0HzpOUnL0lEL2SJqErljw
         nJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774296841; x=1774901641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7LQmunI4gQedz7r93OpyXpHZ3BB8yObf9HrBwMQos40=;
        b=ZUdnZye2IjqHIJTG5eskwc8RHMKDIrRfxg3i3cYK6ZsaX7uQxGHH4oZTNsNwvqZm5k
         WkEBYUh4mj42+pq6+isZU3BrxQjpAhP/8ieQE5Jos3HX3s72DQYVDWKXwPLBHPOAgyID
         Cvc3IvpA2RQhoXjEIX8dTIT7tg8bB3bB2H1hAVNiEKiHpdLYTUAuuvPetI/BuRQRgm7G
         kDoUeLUadf2GMptXkYm+hOP6fksTFleELqkP9gFjZU36lxCgwG6l986kTYYgvhcWkvKx
         27stLzuy7SqGwA9lwoC8dolRXd5i6znQIMiCPAJ51PxKee9ddOOprtjxMI6MpIuYFl2F
         uMpg==
X-Gm-Message-State: AOJu0YwkGfm8fqz0fCneKmJy/cSLmx7vOPcPTUJq/gj8UMtRLkY9pUUX
	QQoAn/6RlWK7Wpw7Rk9bGXAUEkSU6Jph8Ui4AR35f1yQej7MwTaZQFad89cRvnRG7tnVv+4CO8g
	1HqY6FtRvY86ZEtCGatOD5+aTScfAQbnsUzueJRUHUEneHej+FS6aJYKE4hHYdzG4f9WU
X-Gm-Gg: ATEYQzzFygjkU5GcEWKdumpYQKwtVpcuEfR6ygVh3wJwl9Kr65mek3knLQucsho9f7U
	wFPaVZ0tKy4AxNd+fyEbU7nnxCSyGQMFW+SfY00D6tp9dvjJ+7N0str2N0eChABweAnctU20IaD
	o7JIrB+xoe7AynA//1Ddm2pWXfC+Ubb904DotWIUtwpj2B416jOi13HxkGjQ7LUrhkxo+tYWNSZ
	0IGOvFXLCrUTxVq+UyNQIOjX6AwrKiZWGshUk83XBq+Vy96L1YHgX6lsc9hJuCsBr9mt++iOyZZ
	t4WcRAhR8xc8wifnE00kCWJwYuGY5V1fxkdBUEEas8ZtJ4ZQb+HfRHFY9P7yZw+632qe846fFmd
	1yv5aRxatQ2PIZu6jrbHyN41ACacR0wj5nnWHLKk6V+2mtQ==
X-Received: by 2002:a05:6a00:2d96:b0:829:7b0f:c9de with SMTP id d2e1a72fcca58-82a8c3217aemr10910323b3a.35.1774296840733;
        Mon, 23 Mar 2026 13:14:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d96:b0:829:7b0f:c9de with SMTP id d2e1a72fcca58-82a8c3217aemr10910260b3a.35.1774296839280;
        Mon, 23 Mar 2026 13:13:59 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409d148sm9510738b3a.29.2026.03.23.13.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 13:13:58 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 01:42:26 +0530
Subject: [PATCH 14/16] drm/msm/a8xx: Preemption support for A840
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-a8xx-gpu-batch2-v1-14-fc95b8d9c017@oss.qualcomm.com>
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
In-Reply-To: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774296753; l=20443;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=FEe8R/rRX361Ss9+y/FT4W1Kn3g7sYPWTSDSorPhJG8=;
 b=EY82Vnw4rrZ6M0p7UwGnQZ03qMdmO9QvxLosP04+LZqtu2A+S/LYjtfj3oavmYyMH8btrHpvV
 A4/lxU4XP43CmPnNXurptT4xJsRon/a5wVzV7KAd/rbsVbks2DLAgIF
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=CYYFJbrl c=1 sm=1 tr=0 ts=69c19f0a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=fmxdy_jVxe639krZ1D8A:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0OSBTYWx0ZWRfX9u23sY7cIapB
 QvJEgWpyPma5SDOTIATgAuUMsq1+raMDwoFsSHpRFJmDCn2stAFDHBHeng45RQiyKioGY3aFEKH
 a/vD3SKXKr64bJra8fd/Zr6H0V7REYGhLEpZchXra/EAW6TPrakwSJYCScFcgViRerEY2hoDla0
 Vn+ZHpCzpLurZl8XJDPd5qYVg741kqmAcRCVO3uglciuRNlW0O2TJukEyrCsw0cenvvMZKEvBzO
 KAUEPj8r6jhJuHmZZMpXo+XMxNapIvJicYQrEzFqDHd7nK+72GK6iMjCtnACR0kpPZf68qZGGRu
 jUS5lyxaoyoge3Mf2W96IiALjjWPZdrBycryjxu5xgT88nUvlckm6/bi6Mtr0vun/32/WinAg/c
 Boh44Q8Tg9pj0yPmPCCuYtrhToyUDHyzQBmMe0TJgr3EW6c2atd6+Xkc/ZQoJyH0ZAwTHyCzHLz
 Nz/fAP7n1BFXYfh/ZFA==
X-Proofpoint-GUID: yHZgqKvW0BgptD9x9fJvfHGbAGsN-bVH
X-Proofpoint-ORIG-GUID: yHZgqKvW0BgptD9x9fJvfHGbAGsN-bVH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_05,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230149
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99398-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 78C172FD1D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The programing sequence related to preemption is unchanged from A7x. But
there is some code churn due to register shuffling in A8x. So, split out
the common code into a header file for code sharing and add/update
additional changes required to support preemption feature on A8x GPUs.

Finally, enable the preemption quirk in A840's catalog to enable this
feature.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile              |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |   7 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |   5 +
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c |  77 +--------
 drivers/gpu/drm/msm/adreno/a6xx_preempt.h |  82 ++++++++++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c     |  37 ++++-
 drivers/gpu/drm/msm/adreno/a8xx_preempt.c | 262 ++++++++++++++++++++++++++++++
 8 files changed, 392 insertions(+), 80 deletions(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 8b94c5f1cb68..ba45e99be05b 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -25,6 +25,7 @@ adreno-y := \
 	adreno/a6xx_hfi.o \
 	adreno/a6xx_preempt.o \
 	adreno/a8xx_gpu.o \
+	adreno/a8xx_preempt.o \
 
 adreno-$(CONFIG_DEBUG_FS) += adreno/a5xx_debugfs.o \
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 53548f6e891b..21f5a685196b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -2120,6 +2120,7 @@ static const struct adreno_info a8xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_HAS_HW_APRIV |
+			  ADRENO_QUIRK_PREEMPTION |
 			  ADRENO_QUIRK_IFPC,
 		.funcs = &a8xx_gpu_funcs,
 		.a6xx = &(const struct a6xx_info) {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 0fe6d803e628..df739fd744ab 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -408,7 +408,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	a6xx_flush(gpu, ring);
 }
 
-static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
+void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
 		struct a6xx_gpu *a6xx_gpu, struct msm_gpu_submitqueue *queue)
 {
 	u64 preempt_postamble;
@@ -618,7 +618,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	a6xx_flush(gpu, ring);
 
 	/* Check to see if we need to start preemption */
-	a6xx_preempt_trigger(gpu);
+	if (adreno_is_a8xx(adreno_gpu))
+		a8xx_preempt_trigger(gpu);
+	else
+		a6xx_preempt_trigger(gpu);
 }
 
 static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index a4434a6a56dd..eb431e5e00b1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -278,6 +278,8 @@ void a6xx_preempt_hw_init(struct msm_gpu *gpu);
 void a6xx_preempt_trigger(struct msm_gpu *gpu);
 void a6xx_preempt_irq(struct msm_gpu *gpu);
 void a6xx_preempt_fini(struct msm_gpu *gpu);
+void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
+		struct a6xx_gpu *a6xx_gpu, struct msm_gpu_submitqueue *queue);
 int a6xx_preempt_submitqueue_setup(struct msm_gpu *gpu,
 		struct msm_gpu_submitqueue *queue);
 void a6xx_preempt_submitqueue_close(struct msm_gpu *gpu,
@@ -327,6 +329,9 @@ void a8xx_gpu_get_slice_info(struct msm_gpu *gpu);
 int a8xx_hw_init(struct msm_gpu *gpu);
 irqreturn_t a8xx_irq(struct msm_gpu *gpu);
 void a8xx_llc_activate(struct a6xx_gpu *a6xx_gpu);
+void a8xx_preempt_hw_init(struct msm_gpu *gpu);
+void a8xx_preempt_trigger(struct msm_gpu *gpu);
+void a8xx_preempt_irq(struct msm_gpu *gpu);
 bool a8xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 void a8xx_recover(struct msm_gpu *gpu);
 #endif /* __A6XX_GPU_H__ */
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index 747a22afad9f..df4cbf42e9a4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -6,85 +6,10 @@
 #include "msm_gem.h"
 #include "a6xx_gpu.h"
 #include "a6xx_gmu.xml.h"
+#include "a6xx_preempt.h"
 #include "msm_mmu.h"
 #include "msm_gpu_trace.h"
 
-/*
- * Try to transition the preemption state from old to new. Return
- * true on success or false if the original state wasn't 'old'
- */
-static inline bool try_preempt_state(struct a6xx_gpu *a6xx_gpu,
-		enum a6xx_preempt_state old, enum a6xx_preempt_state new)
-{
-	enum a6xx_preempt_state cur = atomic_cmpxchg(&a6xx_gpu->preempt_state,
-		old, new);
-
-	return (cur == old);
-}
-
-/*
- * Force the preemption state to the specified state.  This is used in cases
- * where the current state is known and won't change
- */
-static inline void set_preempt_state(struct a6xx_gpu *gpu,
-		enum a6xx_preempt_state new)
-{
-	/*
-	 * preempt_state may be read by other cores trying to trigger a
-	 * preemption or in the interrupt handler so barriers are needed
-	 * before...
-	 */
-	smp_mb__before_atomic();
-	atomic_set(&gpu->preempt_state, new);
-	/* ... and after*/
-	smp_mb__after_atomic();
-}
-
-/* Write the most recent wptr for the given ring into the hardware */
-static inline void update_wptr(struct a6xx_gpu *a6xx_gpu, struct msm_ringbuffer *ring)
-{
-	unsigned long flags;
-	uint32_t wptr;
-
-	spin_lock_irqsave(&ring->preempt_lock, flags);
-
-	if (ring->restore_wptr) {
-		wptr = get_wptr(ring);
-
-		a6xx_fenced_write(a6xx_gpu, REG_A6XX_CP_RB_WPTR, wptr, BIT(0), false);
-
-		ring->restore_wptr = false;
-	}
-
-	spin_unlock_irqrestore(&ring->preempt_lock, flags);
-}
-
-/* Return the highest priority ringbuffer with something in it */
-static struct msm_ringbuffer *get_next_ring(struct msm_gpu *gpu)
-{
-	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
-	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
-
-	unsigned long flags;
-	int i;
-
-	for (i = 0; i < gpu->nr_rings; i++) {
-		bool empty;
-		struct msm_ringbuffer *ring = gpu->rb[i];
-
-		spin_lock_irqsave(&ring->preempt_lock, flags);
-		empty = (get_wptr(ring) == gpu->funcs->get_rptr(gpu, ring));
-		if (!empty && ring == a6xx_gpu->cur_ring)
-			empty = ring->memptrs->fence == a6xx_gpu->last_seqno[i];
-		spin_unlock_irqrestore(&ring->preempt_lock, flags);
-
-		if (!empty)
-			return ring;
-	}
-
-	return NULL;
-}
-
 static void a6xx_preempt_timer(struct timer_list *t)
 {
 	struct a6xx_gpu *a6xx_gpu = timer_container_of(a6xx_gpu, t,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.h b/drivers/gpu/drm/msm/adreno/a6xx_preempt.h
new file mode 100644
index 000000000000..4e69ed038403
--- /dev/null
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2018, The Linux Foundation. All rights reserved. */
+/* Copyright (c) 2023 Collabora, Ltd. */
+/* Copyright (c) 2024 Valve Corporation */
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
+
+/*
+ * Try to transition the preemption state from old to new. Return
+ * true on success or false if the original state wasn't 'old'
+ */
+static inline bool try_preempt_state(struct a6xx_gpu *a6xx_gpu,
+		enum a6xx_preempt_state old, enum a6xx_preempt_state new)
+{
+	enum a6xx_preempt_state cur = atomic_cmpxchg(&a6xx_gpu->preempt_state,
+		old, new);
+
+	return (cur == old);
+}
+
+/*
+ * Force the preemption state to the specified state.  This is used in cases
+ * where the current state is known and won't change
+ */
+static inline void set_preempt_state(struct a6xx_gpu *gpu,
+		enum a6xx_preempt_state new)
+{
+	/*
+	 * preempt_state may be read by other cores trying to trigger a
+	 * preemption or in the interrupt handler so barriers are needed
+	 * before...
+	 */
+	smp_mb__before_atomic();
+	atomic_set(&gpu->preempt_state, new);
+	/* ... and after*/
+	smp_mb__after_atomic();
+}
+
+/* Write the most recent wptr for the given ring into the hardware */
+static inline void update_wptr(struct a6xx_gpu *a6xx_gpu, struct msm_ringbuffer *ring)
+{
+	unsigned long flags;
+	uint32_t wptr;
+
+	spin_lock_irqsave(&ring->preempt_lock, flags);
+
+	if (ring->restore_wptr) {
+		wptr = get_wptr(ring);
+
+		a6xx_fenced_write(a6xx_gpu, REG_A6XX_CP_RB_WPTR, wptr, BIT(0), false);
+
+		ring->restore_wptr = false;
+	}
+
+	spin_unlock_irqrestore(&ring->preempt_lock, flags);
+}
+
+/* Return the highest priority ringbuffer with something in it */
+static struct msm_ringbuffer *get_next_ring(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+
+	unsigned long flags;
+	int i;
+
+	for (i = 0; i < gpu->nr_rings; i++) {
+		bool empty;
+		struct msm_ringbuffer *ring = gpu->rb[i];
+
+		spin_lock_irqsave(&ring->preempt_lock, flags);
+		empty = (get_wptr(ring) == gpu->funcs->get_rptr(gpu, ring));
+		if (!empty && ring == a6xx_gpu->cur_ring)
+			empty = ring->memptrs->fence == a6xx_gpu->last_seqno[i];
+		spin_unlock_irqrestore(&ring->preempt_lock, flags);
+
+		if (!empty)
+			return ring;
+	}
+
+	return NULL;
+}
+
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index b1784e0819c1..3ab4c1d79fdb 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -463,6 +463,34 @@ static void a8xx_patch_pwrup_reglist(struct msm_gpu *gpu)
 	a8xx_aperture_clear(gpu);
 }
 
+static int a8xx_preempt_start(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct msm_ringbuffer *ring = gpu->rb[0];
+
+	if (gpu->nr_rings <= 1)
+		return 0;
+
+	/* Turn CP protection off */
+	OUT_PKT7(ring, CP_SET_PROTECTED_MODE, 1);
+	OUT_RING(ring, 0);
+
+	a6xx_emit_set_pseudo_reg(ring, a6xx_gpu, NULL);
+
+	/* Yield the floor on command completion */
+	OUT_PKT7(ring, CP_CONTEXT_SWITCH_YIELD, 4);
+	OUT_RING(ring, 0x00);
+	OUT_RING(ring, 0x00);
+	OUT_RING(ring, 0x00);
+	/* Generate interrupt on preemption completion */
+	OUT_RING(ring, 0x00);
+
+	a6xx_flush(gpu, ring);
+
+	return a8xx_idle(gpu, ring) ? 0 : -EINVAL;
+}
+
 static int a8xx_cp_init(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -738,6 +766,8 @@ static int hw_init(struct msm_gpu *gpu)
 	gpu_write64(gpu, REG_A6XX_CP_RB_RPTR_ADDR, shadowptr(a6xx_gpu, gpu->rb[0]));
 	gpu_write64(gpu, REG_A8XX_CP_RB_RPTR_ADDR_BV, rbmemptr(gpu->rb[0], bv_rptr));
 
+	a8xx_preempt_hw_init(gpu);
+
 	for (i = 0; i < gpu->nr_rings; i++)
 		a6xx_gpu->shadow[i] = 0;
 
@@ -800,6 +830,9 @@ static int hw_init(struct msm_gpu *gpu)
 	/* Enable hardware clockgating */
 	a8xx_set_hwcg(gpu, true);
 out:
+	/* Last step - yield the ringbuffer */
+	a8xx_preempt_start(gpu);
+
 	/*
 	 * Tell the GMU that we are done touching the GPU and it can start power
 	 * management
@@ -1209,11 +1242,11 @@ irqreturn_t a8xx_irq(struct msm_gpu *gpu)
 
 	if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS) {
 		msm_gpu_retire(gpu);
-		a6xx_preempt_trigger(gpu);
+		a8xx_preempt_trigger(gpu);
 	}
 
 	if (status & A6XX_RBBM_INT_0_MASK_CP_SW)
-		a6xx_preempt_irq(gpu);
+		a8xx_preempt_irq(gpu);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_preempt.c b/drivers/gpu/drm/msm/adreno/a8xx_preempt.c
new file mode 100644
index 000000000000..05cd847242f3
--- /dev/null
+++ b/drivers/gpu/drm/msm/adreno/a8xx_preempt.c
@@ -0,0 +1,262 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
+
+#include "msm_gem.h"
+#include "a6xx_gpu.h"
+#include "a6xx_gmu.xml.h"
+#include "a6xx_preempt.h"
+#include "msm_mmu.h"
+#include "msm_gpu_trace.h"
+
+static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu)
+{
+	u32 *postamble = a6xx_gpu->preempt_postamble_ptr;
+	u32 count = 0;
+
+	postamble[count++] = PKT7(CP_REG_RMW, 3);
+	postamble[count++] = REG_A8XX_RBBM_PERFCTR_SRAM_INIT_CMD;
+	postamble[count++] = 0;
+	postamble[count++] = 1;
+
+	postamble[count++] = PKT7(CP_WAIT_REG_MEM, 6);
+	postamble[count++] = CP_WAIT_REG_MEM_0_FUNCTION(WRITE_EQ);
+	postamble[count++] = CP_WAIT_REG_MEM_POLL_ADDR_LO(
+				REG_A8XX_RBBM_PERFCTR_SRAM_INIT_STATUS);
+	postamble[count++] = CP_WAIT_REG_MEM_POLL_ADDR_HI(0);
+	postamble[count++] = CP_WAIT_REG_MEM_3_REF(0x1);
+	postamble[count++] = CP_WAIT_REG_MEM_4_MASK(0x1);
+	postamble[count++] = CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0);
+
+	a6xx_gpu->preempt_postamble_len = count;
+
+	a6xx_gpu->postamble_enabled = true;
+}
+
+static void preempt_disable_postamble(struct a6xx_gpu *a6xx_gpu)
+{
+	u32 *postamble = a6xx_gpu->preempt_postamble_ptr;
+
+	/*
+	 * Disable the postamble by replacing the first packet header with a NOP
+	 * that covers the whole buffer.
+	 */
+	*postamble = PKT7(CP_NOP, (a6xx_gpu->preempt_postamble_len - 1));
+
+	a6xx_gpu->postamble_enabled = false;
+}
+
+/*
+ * Set preemption keepalive vote. Please note that this vote is different from the one used in
+ * a8xx_irq()
+ */
+static void a8xx_preempt_keepalive_vote(struct msm_gpu *gpu, bool on)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+
+	if (adreno_has_gmu_wrapper(adreno_gpu))
+		return;
+
+	gmu_write(&a6xx_gpu->gmu, REG_A8XX_GMU_PWR_COL_PREEMPT_KEEPALIVE, on);
+}
+
+void a8xx_preempt_irq(struct msm_gpu *gpu)
+{
+	uint32_t status;
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct drm_device *dev = gpu->dev;
+
+	if (!try_preempt_state(a6xx_gpu, PREEMPT_TRIGGERED, PREEMPT_PENDING))
+		return;
+
+	/* Delete the preemption watchdog timer */
+	timer_delete(&a6xx_gpu->preempt_timer);
+
+	/*
+	 * The hardware should be setting the stop bit of CP_CONTEXT_SWITCH_CNTL
+	 * to zero before firing the interrupt, but there is a non zero chance
+	 * of a hardware condition or a software race that could set it again
+	 * before we have a chance to finish. If that happens, log and go for
+	 * recovery
+	 */
+	status = gpu_read(gpu, REG_A8XX_CP_CONTEXT_SWITCH_CNTL);
+	if (unlikely(status & A8XX_CP_CONTEXT_SWITCH_CNTL_STOP)) {
+		DRM_DEV_ERROR(&gpu->pdev->dev,
+					  "!!!!!!!!!!!!!!!! preemption faulted !!!!!!!!!!!!!! irq\n");
+		set_preempt_state(a6xx_gpu, PREEMPT_FAULTED);
+		dev_err(dev->dev, "%s: Preemption failed to complete\n",
+			gpu->name);
+		kthread_queue_work(gpu->worker, &gpu->recover_work);
+		return;
+	}
+
+	a6xx_gpu->cur_ring = a6xx_gpu->next_ring;
+	a6xx_gpu->next_ring = NULL;
+
+	set_preempt_state(a6xx_gpu, PREEMPT_FINISH);
+
+	update_wptr(a6xx_gpu, a6xx_gpu->cur_ring);
+
+	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
+
+	a8xx_preempt_keepalive_vote(gpu, false);
+
+	trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
+
+	/*
+	 * Retrigger preemption to avoid a deadlock that might occur when preemption
+	 * is skipped due to it being already in flight when requested.
+	 */
+	a8xx_preempt_trigger(gpu);
+}
+
+void a8xx_preempt_hw_init(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	int i;
+
+	/* No preemption if we only have one ring */
+	if (gpu->nr_rings == 1)
+		return;
+
+	for (i = 0; i < gpu->nr_rings; i++) {
+		struct a6xx_preempt_record *record_ptr = a6xx_gpu->preempt[i];
+
+		record_ptr->wptr = 0;
+		record_ptr->rptr = 0;
+		record_ptr->rptr_addr = shadowptr(a6xx_gpu, gpu->rb[i]);
+		record_ptr->info = 0;
+		record_ptr->data = 0;
+		record_ptr->rbase = gpu->rb[i]->iova;
+	}
+
+	/* Write a 0 to signal that we aren't switching pagetables */
+	gpu_write64(gpu, REG_A8XX_CP_CONTEXT_SWITCH_SMMU_INFO, 0);
+
+	/* Enable the GMEM save/restore feature for preemption */
+	gpu_write(gpu, REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE, 0x1);
+
+	/* Reset the preemption state */
+	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
+
+	spin_lock_init(&a6xx_gpu->eval_lock);
+
+	/* Always come up on rb 0 */
+	a6xx_gpu->cur_ring = gpu->rb[0];
+}
+
+void a8xx_preempt_trigger(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	unsigned long flags;
+	struct msm_ringbuffer *ring;
+	unsigned int cntl;
+	bool sysprof;
+
+	if (gpu->nr_rings == 1)
+		return;
+
+	/*
+	 * Lock to make sure another thread attempting preemption doesn't skip it
+	 * while we are still evaluating the next ring. This makes sure the other
+	 * thread does start preemption if we abort it and avoids a soft lock.
+	 */
+	spin_lock_irqsave(&a6xx_gpu->eval_lock, flags);
+
+	/*
+	 * Try to start preemption by moving from NONE to START. If
+	 * unsuccessful, a preemption is already in flight
+	 */
+	if (!try_preempt_state(a6xx_gpu, PREEMPT_NONE, PREEMPT_START)) {
+		spin_unlock_irqrestore(&a6xx_gpu->eval_lock, flags);
+		return;
+	}
+
+	cntl = A8XX_CP_CONTEXT_SWITCH_CNTL_LEVEL(a6xx_gpu->preempt_level);
+
+	if (a6xx_gpu->skip_save_restore)
+		cntl |= A8XX_CP_CONTEXT_SWITCH_CNTL_SKIP_SAVE_RESTORE;
+
+	if (a6xx_gpu->uses_gmem)
+		cntl |= A8XX_CP_CONTEXT_SWITCH_CNTL_USES_GMEM;
+
+	cntl |= A8XX_CP_CONTEXT_SWITCH_CNTL_STOP;
+
+	/* Get the next ring to preempt to */
+	ring = get_next_ring(gpu);
+
+	/*
+	 * If no ring is populated or the highest priority ring is the current
+	 * one do nothing except to update the wptr to the latest and greatest
+	 */
+	if (!ring || (a6xx_gpu->cur_ring == ring)) {
+		set_preempt_state(a6xx_gpu, PREEMPT_FINISH);
+		update_wptr(a6xx_gpu, a6xx_gpu->cur_ring);
+		set_preempt_state(a6xx_gpu, PREEMPT_NONE);
+		spin_unlock_irqrestore(&a6xx_gpu->eval_lock, flags);
+		return;
+	}
+
+	spin_unlock_irqrestore(&a6xx_gpu->eval_lock, flags);
+
+	spin_lock_irqsave(&ring->preempt_lock, flags);
+
+	struct a7xx_cp_smmu_info *smmu_info_ptr =
+		a6xx_gpu->preempt_smmu[ring->id];
+	struct a6xx_preempt_record *record_ptr = a6xx_gpu->preempt[ring->id];
+	u64 ttbr0 = ring->memptrs->ttbr0;
+	u32 context_idr = ring->memptrs->context_idr;
+
+	smmu_info_ptr->ttbr0 = ttbr0;
+	smmu_info_ptr->context_idr = context_idr;
+	record_ptr->wptr = get_wptr(ring);
+
+	/*
+	 * The GPU will write the wptr we set above when we preempt. Reset
+	 * restore_wptr to make sure that we don't write WPTR to the same
+	 * thing twice. It's still possible subsequent submissions will update
+	 * wptr again, in which case they will set the flag to true. This has
+	 * to be protected by the lock for setting the flag and updating wptr
+	 * to be atomic.
+	 */
+	ring->restore_wptr = false;
+
+	trace_msm_gpu_preemption_trigger(a6xx_gpu->cur_ring->id, ring->id);
+
+	spin_unlock_irqrestore(&ring->preempt_lock, flags);
+
+	/* Set the keepalive bit to keep the GPU ON until preemption is complete */
+	a8xx_preempt_keepalive_vote(gpu, true);
+
+	a6xx_fenced_write(a6xx_gpu,
+		REG_A8XX_CP_CONTEXT_SWITCH_SMMU_INFO, a6xx_gpu->preempt_smmu_iova[ring->id],
+		BIT(1), true);
+
+	a6xx_fenced_write(a6xx_gpu,
+		REG_A8XX_CP_CONTEXT_SWITCH_PRIV_NON_SECURE_RESTORE_ADDR,
+		a6xx_gpu->preempt_iova[ring->id], BIT(1), true);
+
+	a6xx_gpu->next_ring = ring;
+
+	/* Start a timer to catch a stuck preemption */
+	mod_timer(&a6xx_gpu->preempt_timer, jiffies + msecs_to_jiffies(10000));
+
+	/* Enable or disable postamble as needed */
+	sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
+
+	if (!sysprof && !a6xx_gpu->postamble_enabled)
+		preempt_prepare_postamble(a6xx_gpu);
+
+	if (sysprof && a6xx_gpu->postamble_enabled)
+		preempt_disable_postamble(a6xx_gpu);
+
+	/* Set the preemption state to triggered */
+	set_preempt_state(a6xx_gpu, PREEMPT_TRIGGERED);
+
+	/* Trigger the preemption */
+	a6xx_fenced_write(a6xx_gpu, REG_A8XX_CP_CONTEXT_SWITCH_CNTL, cntl, BIT(1), false);
+}
+

-- 
2.51.0


