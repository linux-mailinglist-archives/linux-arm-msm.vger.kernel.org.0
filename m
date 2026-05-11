Return-Path: <linux-arm-msm+bounces-106942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LaTMEDWAWryjwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 15:14:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2893350EA99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 15:14:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4AE4B30E8815
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93B5B3DDDAD;
	Mon, 11 May 2026 13:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kba+iOcb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yvp35UyZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C953E2765
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778504505; cv=none; b=I6xtr+Wg+zUL1LzCbFbJRbVO2rhoNKcEf5yyg+PS9MSYwNG4IFGK1BLp76R4Qoc6Nso95yxKhNUS27Wd6aJworDQccHk9z8sRjx75POI3C3McuHltZrq2ykawW+B8mIfvEc3KMFpDsZfrYI2RK1IUBO4JMuFMOSdmRmJ84ht/Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778504505; c=relaxed/simple;
	bh=0P+NAm0c69QwjYdc91lHhCWzVkt/mEiu8Qof5iS/sDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o0mNrn8Tjk4t8uN1AdrL1CyrmJCp8PO03OpbAlJuYirk3NpcDhYs6cEN+Rc1gTA7wPoF+6mrV/PEGnqGKCus/9J568p66p1xMkzuHqDpg+v9yx4IubONYkgbvfqqrdVOXKVAAectT2J8We7YU/hMEUTeqLjSMGOlbdtpf/+snSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kba+iOcb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yvp35UyZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7FL643332707
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pm60+sSzy2D
	4YjgbnRdHOk9v8JwHh3XA05bqfGtoLS4=; b=Kba+iOcbBg5luoBp8cdSa4Ey2Xe
	Fa12cRjV29NpXOGOVn2X9C+u65gBQJH9dJE06KaEuNTcHpJg0WPRiSR4B1CXi0VD
	mi98KnN4xlZyLINsTVuFqzsZ5wiMxe48aaIUTWOYm4Q/ciYE4q/5H3WoUaexYe7H
	LOKSGSdA7vifxaRWrtv95s54px3HjSNtboK/iOVn5M7nY514M/lMPZm19oScjNsJ
	ligQ+v5porG8Hzdfe29vrIvpBXzP/FYsPAPvw0MqPozWrdd3R/tMA51rwGOqo18k
	Foe0+sp7pfOC4PZIbjXf+EYMBtyRr9t7kK1HAvtu/0ealpdlbpsgTqPxWRg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ajgs7h2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:01:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-365fd467cf6so3629007a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 06:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778504498; x=1779109298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pm60+sSzy2D4YjgbnRdHOk9v8JwHh3XA05bqfGtoLS4=;
        b=Yvp35UyZmkyTIQAsaP8w9M9wZl43cOjS8OomRH1/g4Qk9n07RyT+1Ogdg1lUuDrxfX
         jm6JJg3Z+rnB40uJ8nzC0cBVxl6jIOBF2hxC9x9b7KnZ2V2KoU4iYu8pw+mmxQC6SLjz
         LyQMGLyoW1WEIKgHGY14/87CIEZn/AMirmkRmm+9Hbx/khTNeiuk8dpx/czd6A53I+ps
         QrzgHn2ufrlxwATSuNSYnZzjDUW0SuMdG9t+w92Y5t7RK8VAf3xcfiusICjF5/pe/tNE
         7OHEcWf3XLT/bj6rZJ/JIlN1RoAOjzUGDozt7E4nmrKpvbcyUmHDSx3r8vKmcSxLEi/R
         zMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778504498; x=1779109298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pm60+sSzy2D4YjgbnRdHOk9v8JwHh3XA05bqfGtoLS4=;
        b=MA6QJRXrcx2NnMGThiY6M+Q1ZGhhifjIHkaOQNj2paJnybxObVF21j+yUZvxeRmgKI
         4fP9RMHt7dEpy7Aqp4e5L45nXeQujJOISwU/Sw+QFCpvdTv/CFKyLqP588ANZlOUmKjd
         8uWFBk68PtBBe9TLMT65alUecZVerBIy5DKtUdpzwPI8k/Y2XWvyj133Tn6XbYTp/6Mh
         BtteLQTg6X0B8jl+dYCAJZ50j9NykHTAdaMCNGjgj1783x14i99SzP7ga7owWQ4Qvb7r
         BgmIZSbI139OzyurUaY+tAJX+WvTPpiuopWFBckBA792dsXjOVMux6TA3iN+uz/wyOA0
         M4sg==
X-Gm-Message-State: AOJu0Yxwaa9o9P+Bcky0wiwCI5x5hCC90Zh21QgATEtCfaU20/yPWiIX
	/a0ltzXiqqsqpoItyPJbjSZIcV/9p6xN8vJKYpCk3ErctngM10qrQWQWs1yi/fojniKLqpy7nLr
	uTgxlVMu373gm+1C7RsXgvx9LvsRjEt2YtMDVW4TNBpUcwtW1xGQVIU95e6M0h86CcRHP
X-Gm-Gg: Acq92OE5GudHg1tS5nlblAD0rmnaZaRt5CZO5WYLEbHrWBBaOvgAUr6lLYZhmhSZNrr
	/ooIn+u2CjKB68P6iywm4sI8uZYFWdQxk1xprh62hybOVt0ztd7QgsCNoy5EY2UNxrex0DnWXv9
	16y2SeKMTJeGmo4rVRjONeZQ5pxQU0NVDyKNracpCNx5jGDzndL5nGJOeRd0rwkUVDwd3dupQ1R
	wttHDEVAyb6/bo22QOyOTC/B8pqXEOzBNrAb7eDrl02jM/Zz9UE6TlkgDuVTtcW3gSOUMh0y6qZ
	YUghOThqDlcijBEs5k/o83tnjFitgPiIcGl1WgS/wChZr+UkbA0gklH6TXaw0/uh6hOs1eDHE8N
	KvD5H12soP3MrU+7AXnu6bxNm8Lsgwxk9
X-Received: by 2002:a17:90b:5788:b0:368:433:b697 with SMTP id 98e67ed59e1d1-3680433ec4cmr7342450a91.19.1778504497379;
        Mon, 11 May 2026 06:01:37 -0700 (PDT)
X-Received: by 2002:a17:90b:5788:b0:368:433:b697 with SMTP id 98e67ed59e1d1-3680433ec4cmr7342350a91.19.1778504496698;
        Mon, 11 May 2026 06:01:36 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d63e03f6sm8293092a91.12.2026.05.11.06.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:01:36 -0700 (PDT)
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
Subject: [PATCH v5 16/16] drm/msm/a6xx: Allow IFPC with perfcntr stream
Date: Mon, 11 May 2026 05:59:29 -0700
Message-ID: <20260511130017.96867-17-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=GfgnWwXL c=1 sm=1 tr=0 ts=6a01d332 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=5obZvuzjGUYrwyXX1KsA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: FZWU4-m4M035gig06Hvb6uIbCKsMLb1y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE0NCBTYWx0ZWRfXygJp4KpNgMtN
 Ap/NjuI9p2IjY76pAXZonDppBkjhYArOFgGxH9+dn17+2Os2I+FRkeFO1RfFUikuiHrzD5XYdnp
 VqpzuYPiJlrRob39P94xqjl97tVcYBpi3wYTrBf+8bwFce47krm6aMIecbXfuAR1EjjZLdxYDCr
 SJt0m7zBSbn+jIDlsFY4zbKWmWEI9S3W/RGEBCZ8axICyxNUTJySDBNHttBdEc04KfUKHgGlhcn
 TLmvRhPtmi5lEULgzRFnc7X0xsTUzaEcosoPWX1ti4uyEHWGkCrLYsquvXvBKNDHnaBrPsoW01g
 ax+8yXQrhwRmkq2CXYqQfAK7RwrL2pDB5eMTqMlpLvPZW2Zgor+GzBKwFZi2a7+A+9NlNRp4AEW
 SYNDoTBD+MDukISGaBTargoG0oFf5Hrgqkm+mME3OFXr/pC+Pl0WvQqfhmPzwz/U9WGDGw3R2wo
 XrwjoCzo4DxaaktOxWQ==
X-Proofpoint-ORIG-GUID: FZWU4-m4M035gig06Hvb6uIbCKsMLb1y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110144
X-Rspamd-Queue-Id: 2893350EA99
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-106942-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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
index 64f788e4c95e..f06a51d1d25a 100644
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


