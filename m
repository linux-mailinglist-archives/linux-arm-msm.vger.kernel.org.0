Return-Path: <linux-arm-msm+bounces-105808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHyMMyrv+Gl93QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 21:10:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 451A04C2FF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 21:10:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8292D301CD93
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 19:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BAC33F0A83;
	Mon,  4 May 2026 19:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PaFmOxjs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FBLxTBpV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9083F0760
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 19:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777921733; cv=none; b=hJS0Zc8hWAKaUoOZJ+7QHEnTUmfM4OSaPay/IAfPsw29sVS9xz8B2biXqc7mJlGFe6hzbvOfNehQadfWDDd6CfaOSkKxaBa9uX+x82YFVJ1eAM0k8Zjh5oHSmtNQmP8UcZhZa2CHvRH1ul+YZCMtbfwKaCSgsi9pXiHOV94F1zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777921733; c=relaxed/simple;
	bh=3ZK8+sf7TdzMV+59OQ6CIU6fiDFZ7LVgZ0ccGqZAxCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uAc6Q5zk47RRw5lh0V2zK0JNlSG70CL6W8KGdrC9mcN10kOelKlNLNIrK1iL5r58UsbTTgdSQx8dGsG9BSodwfugII2igYvgaRLnvNTdCdyTW1tRTjYIF4UL45Wn7B9boTFcMFAUGdjCnkk+lWXziNEp/+7lVP1Bf4WTfZPxtS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PaFmOxjs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FBLxTBpV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644DrCiI331067
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 19:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k0Z25Ri0qsZ
	f4kdu4iu99TPanG49TW6penprmyqGHx0=; b=PaFmOxjsXBrkd/tQKSEVFdcgL1C
	yyaky2OyHEiB6aT8wjuO0n7hFAKM+MOmWiCuxMQwxiVJ+j12kKKf7amX+0aJQCCb
	UGcy91PzYaZyP7oeyFEIEsaWVwFUDtW8EK5uokOp0+KnHFdCVwGxu4V8zetA1tXt
	5ACrDsRZ6SaTg5C8ID5vZGu/ghIWmeGVOz6NqBC1oGpqu0JQlaPFkij8jQh1D4VD
	mqy0Oe1haBxSBJmxvADdDSIwNho5eZt26+548JeWKROPgui4AZ1mG44ef/VcoCyo
	RP2/GJbNt8c8mIErL4wwobLrJYY8mWNmmgRZSyvf/aE+GF/75y0qb44ZZhw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvr198sk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 19:08:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso44347915ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 12:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777921730; x=1778526530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0Z25Ri0qsZf4kdu4iu99TPanG49TW6penprmyqGHx0=;
        b=FBLxTBpVBRRwJ+eb7tJ90KJEv0VPj6r6XIYMXzTW8K74VTV80QyB1l7mg+y7zjZfrV
         Q/JQN3PXpMn5IBOKSB/4/wAY6teauvsdv4ANl2RZmsUfMMxwWWWEUX0xZUZJkvmD61vR
         xa1qJZOetK/Le1VtA4MPWtdtjO5ABM3edSspkdokqbL7cGo3winTfWaghbpKZTkaqtS3
         OIH7mRFmY+mTdt9xNu4VNRpNA7m3O6+cTduZjwXL3MUdobfjv3B47rJPrESqj1wPF2v9
         73hPYB0WFN5akmWAmVk79yVS+kKfCmAwafcz8LywLxqtVRSjMGE5CFGIiJE3Iw70+I23
         19kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777921730; x=1778526530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k0Z25Ri0qsZf4kdu4iu99TPanG49TW6penprmyqGHx0=;
        b=NpnRMfZtu+lLtIpLZX9bAQt/AtKZ88XNJFXK0m1VlZfckEhXS5aiiAXljPAzNGEUhv
         Bd13v06kQiZsMgJyq+KMm/cSKjz2/dNULNU3VHNda4lPIvjKyW2B7nmZuTJtVhJWXB2X
         0bHUE8mZ8R8/uahC05dMsmAp63JmKbsPZVTjg8G/TgwjTmfJyI71R/VLTLqsH2nL08FN
         1PV/rMBB1uClosi+wQdKz6JjU5tLmyMbxE0BBgGJwR9hRc+qJZS8IANUEM2BQTwTAgXd
         sB7GOFi7mPVgbU47Kzln7nRnIDAh6sTpG6Y+S3H8jhCo10yY+yeVpfXqJ70dBHLSeqUJ
         FkbQ==
X-Gm-Message-State: AOJu0Yw2IfrR0RPcQTDo3Mui1YOQOPXU3BLj7feJ98nAHGrLYvIPI1yb
	8hjdgjvYdz47iHohyem2FziEStaMm7v2r3klZOc5Z80Pe2kQiw9/lpS31MGND2WVsK6KXo/zMhk
	3nuP1s6n2b2gdzyHlpcQCHIWzlXk4Y3+jyTLVF+Q5mJfrOH6e+qL+weZxrR+nh02xcJL9
X-Gm-Gg: AeBDievpx4lPl3LD23zqAnAqEX1eAcVgzjU2lgnoGlfvCGoAJl+uUV/mSXcNZIBg2xD
	wsHoHzB1oEBlKoP7j3LnWhfP3him3Gu2dYmACZAZQjdx3AN9+Ofyn/b97l9DgLHCpKLfNqgsh9a
	g/SpEsi2TZmTeH1JxdzEdQktkhLVh9DNZTi1ikt3JyHrxxPpoR5VDEDk4JrklkYjTZQoCh5Okvl
	/CsXgIFaHVVCx8kStxcg9VDpafoAESe0JqO0cxLhg0SNPHLyW/7u86ThmTk0ib+HL3E4J2D1mxg
	w193/BMK4l9HKyHv8p/7Sx/3Qx/L2Pw0t8+aym+V66BV9SzFLH9gZWOfzSfDWn/5DiYi2l+/UVk
	rJROIKpRa7TccyNl1Vfl724cn4bWnPn2HG21RyNWtFS8=
X-Received: by 2002:a05:6a20:4321:b0:39b:8b8b:39ce with SMTP id adf61e73a8af0-3aa3b75d1d7mr67040637.28.1777921730355;
        Mon, 04 May 2026 12:08:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:4321:b0:39b:8b8b:39ce with SMTP id adf61e73a8af0-3aa3b75d1d7mr66994637.28.1777921729784;
        Mon, 04 May 2026 12:08:49 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbc8ee1csm10487520a12.25.2026.05.04.12.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 12:08:49 -0700 (PDT)
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
Subject: [PATCH v3 16/16] drm/msm/a6xx: Allow IFPC with perfcntr stream
Date: Mon,  4 May 2026 12:06:59 -0700
Message-ID: <20260504190751.61052-17-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504190751.61052-1-robin.clark@oss.qualcomm.com>
References: <20260504190751.61052-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vMLvU52Bo85KcB9AN_8ejbZCPk-Y4-6c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE3NSBTYWx0ZWRfXxlwI88quA6mD
 +DY4ZU/8E2o/2F5czN/Ei1gRPvTRN6HL8eB5v8ZnICgHQVrPZnxbXNw/hFnMu/r5VJmATuEr/Md
 +LvygjMPqcdjfRFfJk6lUI9MRcA2TCPshirfnwHrO0RWg6Vuq4P/wvuz0Qz/tIkReyjAZ2CV7z8
 8RcNzeUKSyuVwLcZ1AsZToY+BbJCWxsMAl57Ow6PEXCCgIO/WJoyv9zdXgj/SuQmeV53CNm3x9g
 BnZSvrE5OD6oER0pemrsLIJ96Nk/9F29MRfqxgv0dCfrlb9oDXQqPpCq6Fg67XTFG6wIRaZq5yE
 J3FlT2KbNkfurnehIUM1yTMnDXd9oToCRJVRqpHtQ/DeyurBVmlSYLe60hx2Dg2mMlSqChPD9IS
 qMCbt5pWIzZwr8lH9Gt0cF7BgRTAGtSDsjBS6vCTQBqOMM8l7QUVXdKIXfT70F43a3RtiQHkNAQ
 jZgbumoVzjPedMzFJpw==
X-Proofpoint-GUID: vMLvU52Bo85KcB9AN_8ejbZCPk-Y4-6c
X-Authority-Analysis: v=2.4 cv=RvL16imK c=1 sm=1 tr=0 ts=69f8eec3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=5obZvuzjGUYrwyXX1KsA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040175
X-Rspamd-Queue-Id: 451A04C2FF9
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
	TAGGED_FROM(0.00)[bounces-105808-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.998];
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
index aba08fb76249..3fe0f1cda46a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -2034,9 +2034,9 @@ static int a6xx_gmu_get_irq(struct a6xx_gmu *gmu, struct platform_device *pdev,
 	return irq;
 }
 
-void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu)
+void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu, bool force_on)
 {
-	bool sysprof = msm_gpu_sysprof_no_ifpc(gpu);
+	bool sysprof = msm_gpu_sysprof_no_ifpc(gpu) | force_on;
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
index 67f1e84eb631..93124c032dd4 100644
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
index 39bec201d5c9..d8ec65fa25f0 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.c
+++ b/drivers/gpu/drm/msm/msm_perfcntr.c
@@ -256,6 +256,10 @@ sample_worker(struct kthread_work *work)
 		return;
 	}
 
+	/* Inhibit IFPC while accessing registers: */
+	if (gpu->funcs->sysprof_setup)
+		gpu->funcs->sysprof_setup(gpu, true);
+
 	if (gpu->funcs->perfcntr_flush)
 		gpu->funcs->perfcntr_flush(gpu);
 
@@ -290,6 +294,10 @@ sample_worker(struct kthread_work *work)
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


