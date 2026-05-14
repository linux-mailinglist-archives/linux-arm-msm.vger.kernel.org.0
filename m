Return-Path: <linux-arm-msm+bounces-107628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFH5JBHWBWrxbwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:02:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A9D542B6C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DA497306168F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3B63FD135;
	Thu, 14 May 2026 13:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="psN6SNR4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AykCxkbl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBAC421F05
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778766893; cv=none; b=sGVAkjn8oowsOsey+T3Hls7/6NEjSXMY5nOOKijLFFgB/1sQaZ4rJl9Yzkl+padm097G+O1BIhZgiR2J7KJpC6zlJiyDUBhjWMEd3GW1l9xkjrqC+mjcg0VAxj0V7V+fQ/tpaGz2ry7h4R9K81aP1NMcBS5TlzKXg8zTOL3TWmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778766893; c=relaxed/simple;
	bh=GhAfgX9cJ7jP15j1+grgn8Gt5zI3BjvXaBhW/QC8YrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QvP4OJgCTqF7IshQexxS41siap83oganQ9Yz/oA44cQw/eebxrld2iUs7Ka4z02qFQw6tZjwRlp6dDK1BjQiS5zy7DKtf55m2SWtzh/gta3Am5bpYMwEs3LipcDtzH59pGu/+NooBmiCP8APlIbqkNs2dPUaNvG2uJmVlJRwW5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=psN6SNR4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AykCxkbl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeWZR3048571
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jWB8IsiT3LX
	TyyABiITmFtV+44Tckxt2wHe2PuWE1WE=; b=psN6SNR4Qwpg6h9puonGz/3AZ89
	BUs2yHNi2GiBaHU1VAuqgtvmZAseDQklEp9JImWZthUGmkl9O+Ox2mV1W9qDRdPH
	qRoZDNPPCl48adb3Ejw4aajmQG9NUssI8BqhLTUDF414AXoIWinCVG1KF3RIpMf8
	DRPoj3NHR3VBERAJvNAytw8wx7sgZWV2jlBt1y+o61Pjdn4XaWDakLmtqbgEUo2n
	lfnVL0UhJ7f5gWsLaY+AUaHUXuSOdySn5wrezne9eOpOZJ2NfzXcE4IHvyOwVvHW
	k87Yx3aTWGMT2Q+U4hgfWY9AdjtQYRFqt4U9FW1ChrK4VmENP5+V+W1Gs/A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5492tc8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f9f49e4beso3924342b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778766889; x=1779371689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWB8IsiT3LXTyyABiITmFtV+44Tckxt2wHe2PuWE1WE=;
        b=AykCxkbl8IN7n1zHxV/pdIjA443eZWxgdJD5PplB0fPUSYMbFPkKkBKNJotW0uIrT9
         BPmNhqRMtY1+9onAl0TtxA5SCEw/WIGpuYeo++lhi9M842TICeQ4KS2KmqHC/j9n6H0w
         3X5h+DOO3PR4B+7OhAqCNnVp9hZbuhHDRPh7SBhi7SP2/t2ROQH08aihm3fPcHNQSmwv
         PTo9zlW/b1k+NAst0mpJszqrq7FgouQebQ7b0P3knglAt5wkP0Cg94IPXygOEXBnAs8o
         oAd3TZ5sh7zcjrL+R9i5BncClkahsN/gwgz0hGJpW2/pAFq5i5S2M5efIaF5aTXeqs69
         SSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778766889; x=1779371689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jWB8IsiT3LXTyyABiITmFtV+44Tckxt2wHe2PuWE1WE=;
        b=UeuelEpsxc0VYt3RzHJyN4cy6Luyq3SSWeu0fMSlZ2dTXd8e++CH+oO7DloMCNCE1U
         GXLKmByaM6riNlK5vxOxYJGO6r7kRxiZA/+Mm0t1s+FskAA8g2vAL7NDYAuWldfmh7Mm
         gElJ5dG+I7cKJ9zT+VvfzYfGcqWBJVkwgCHn2oeSDHwyPWSOEDtMUnHzbsWK2CPEXIh8
         L2ho0to2YWQSU1EAEQHw304gy2kNlYDQB8eDpyyT1T0g04Wqfzkim0TMlH/pwC4vxMWX
         tQZWMhdLmeX1Gdn00lgGXcRdRQxYlunm8Eta4Yg4zL3XC8Gkq2Stj8RmAe4AFyOQQENM
         Jksw==
X-Gm-Message-State: AOJu0YzI6zVKmVpGahsqlNd1IKf8Lztw+Jmjy7dn6xfv5HIxf9bGhYO2
	JYKnjODl2lf5NIDC15xuLEuMw9ZvLrHzr93c4Il2iU+bpmalqriTpwVP5ZJGi/kU54idMjQD9qz
	ik35roqSuFD7+7fiZj01cF2SZE35gCA/KyewPokbY66NOtpjuikRGnQRseUHKIt9wGSg9
X-Gm-Gg: Acq92OGBh9bqQKS8BZBDJNzfNHblgp07zJ/xN9/i2wXnR8voWvkrapW8RrhCKvUpcng
	7/jyj8egPbXcR/cLFlQqm7RZ2064rB5tORNDTJVDTajTXQ5HSsVK5xaeujY0bFCpsdVkgU04dRk
	KQAX2NvJMu/jq3Kn6c6FzceBorOiYjduCs0Lpnxj4H2EGTgMoAqOK4Ejw7hj6h2ij50YiNtz8oD
	NY7LcCsAn0SqeRRDvOywlx4LHqAwYuJ2VLcunFy/l/fmov5k6z4d4m0tdVq9lymRpjwLCNP+vNq
	sevvNMa7N+DcicvxeW2wM0pO3UjfGeKmleNKZiQts03iF6N/55loVhK6AwIcLHccJJctT5v2QmI
	Q1p/Zk2/hHeNKlcgHrcz+gxXRj1JdjWNH
X-Received: by 2002:a05:6a00:194e:b0:837:40f6:cb88 with SMTP id d2e1a72fcca58-83f0427d8b2mr8611811b3a.26.1778766889363;
        Thu, 14 May 2026 06:54:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:194e:b0:837:40f6:cb88 with SMTP id d2e1a72fcca58-83f0427d8b2mr8611772b3a.26.1778766888800;
        Thu, 14 May 2026 06:54:48 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f79b60sm3162132b3a.52.2026.05.14.06.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:54:47 -0700 (PDT)
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
Subject: [PATCH v6 16/16] drm/msm/a6xx: Allow IFPC with perfcntr stream
Date: Thu, 14 May 2026 06:40:04 -0700
Message-ID: <20260514134052.361771-17-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: uTTSefkEgxASVe3OqILb98cC9c-nwfT4
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a05d42a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=5obZvuzjGUYrwyXX1KsA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: uTTSefkEgxASVe3OqILb98cC9c-nwfT4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0MCBTYWx0ZWRfX46gQcd/sZw7w
 afpYyG/X0Vl9dR7mQmGQtC4uRqnKuU2pmFUFMNGGUHoHpF4KDj6GCM5KamcEk/FuLn/7dk0hXf+
 7cDL7L0JM2hwY5IgB2nzzgpXu8NHaMVD/PPdFWX2i9Vt60cVn6xO8WrAXYpfAaTZdgQsviTeqv7
 PVyhonL/ahTc3T31N2mpzXztL2aHyjD7GZAiVrukOR2jgyBlLX5V+exYBlwFNgzMXZK+fzMfFIc
 Zf5llwBMmzA9IPAXF+VRHJrG+pn7K1YOACGRzRlo+cObUIN6SUj8sGJ347eR2tb4mFNf22zG8LT
 jGTYB7xQgaf4xpXh2sBRLoIdnPQuJRkqKVJCbaMWH5x9a8CDy6IU9fLTrjL/XdrA+zQgZyJ0IqX
 HOY1vE53tWxmDE40v0TfrocFgoOY3feMjq18GfO872gu2EzWT6kAotX1lbJdZEJBT/8HNyY9kRO
 BI42MPJufgD1FEyOAFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140140
X-Rspamd-Queue-Id: 12A9D542B6C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-107628-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Now that the dynamic pwrup reglist has SEL reg values to restore
appended, so that SEL regs are restored on IFPC exit, we can stop
completely disabling IFPC while global counter sampling is active.

To accomplish this, we re-use sysprof_setup() with a force_on param
to inhibit IFPC specifically while the counter regs are being read,
while leaving IFPC enabled the rest of the time.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
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
index d6716ce0657a..df8c2602b4bc 100644
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


