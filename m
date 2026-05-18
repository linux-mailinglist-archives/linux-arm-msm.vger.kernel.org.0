Return-Path: <linux-arm-msm+bounces-108283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKSAJnZkC2qUHAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:11:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72249572B31
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:11:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3B6433026587
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33C439C00A;
	Mon, 18 May 2026 19:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pvYv4GC7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dMw8ogqA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4812390229
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131316; cv=none; b=C+1/0gdQRkxeCM1Yb/IuE1jTe5VZ14nvZVAoNqQCIILuZzJtIKsPzhdB8KCAsfEbqcAIkGtCIKYqGL677BzwLeWoO+/jA3FZ3Wsd6UisOupV6QJaJcdQCSeOsuQbbESztni3UcnfC/lthpCIFKZCnRHu9eYOfAWdKexuQTsfqqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131316; c=relaxed/simple;
	bh=aEg6qv/MhNxT9vLy7tOPVIfFb1MrsJHJCvcM47yPnBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ifMF/kdSfU3o9G3ggyY1UilvpsMS2ilRxBnJNSXz0pXa9tNQakktAL554zS4qM4PtbQCCsygUKw99XzfwUSwIPl7ib6hl1qwYoeCSACYsand7U2gP9bIhAQgVDEpqStUbsDi8e07tt6wf4oMa6UbYrhSLXm4FHvdZXO7/Hz4TdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pvYv4GC7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dMw8ogqA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IEnG7Q2975395
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=55Z0+HKKOjd
	4ey37cISeALnhSf6P7jsMdBMIO2WE5Vw=; b=pvYv4GC7HArbaVawg/BoTjQFhqQ
	xoVo5uLDbmtNJpTEdhPKvCPXb27uO5HVWiDUc7Scs+Y04mlMRiNWFcariT2FmEP+
	1lSWF3W5zYz9LzyRw7VWIEz/BBZLgF1v40DeEIGkHtBVfdf+F2xYje8oxQBEUte4
	Kkczdd+6B3vLNckjrpvM5y3ng741+ciZhRopRlhdN43bI5tLzFqZtK87mZw6I1Bq
	wIUjFYmwex+hu7TbL5R3eVbFJkYJbzC1lqVw+mIJOw+CPacItl6aEJUHoQM4h19P
	aVmI0YhRaW83HddRi05X2NwvB1mKMBcuaZyA5MhXSrLGxJ2gJkUv/9bJ40A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e84v48yjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:08:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bd5b20aaa6so30171885ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 12:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779131313; x=1779736113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55Z0+HKKOjd4ey37cISeALnhSf6P7jsMdBMIO2WE5Vw=;
        b=dMw8ogqAFOek6vTtQA+KZtyGS5viUderWr+rVMS32iJd3tMEhddGeUbVmr3raHEUyt
         nfESOTPRYP1p7glXVy9hDP1TJh++8R0bvP8Cf/m6SGiakpCfX6u2qPZTkc0i4hckJq1X
         b3LoYMpHbe352B2lNsz1wz6wMHDRbW9ec/Nz+F1z7IvpgELmee+15BUBgMBaAGHir4J3
         oLlHLurUTb39tLA0mmctR97RSAHu1z7xidf6VI2RFJ1vyGbsspbKZoVc36stmMMkFi+f
         nGzJqJNDilQmML6B5tJQQ/POeKJrLrtdS9tJ8rJ2WpKFvNTmdYlNXcIzEu4zs3IaaSuG
         Lq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779131313; x=1779736113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=55Z0+HKKOjd4ey37cISeALnhSf6P7jsMdBMIO2WE5Vw=;
        b=CIfkS0tO9I1uaQ/o76RcombilC8azDlfnc6bU8Mo4fdzPrNwiR5fZDKVs48EpRW2SS
         dL07oYl3R8Q8SWxjMIzUtTvc3hL/UEyERAj85LdYEDr/yf4MIcbxbDkRHiF9BeL8pDBa
         At5mWj0p66EUy2ok8srqIXYiVOJdS7gYViyRxGP+1gorjrpPSVRNDP1P6sLJl/YpfUoF
         H8yA2hIZ4Uz3DqACgt0kNSWXtShmeqqsg4S36zxdV1KBZtU1rOwMT3CnVsAragS3N0p0
         LtQ9n8lIXcmDWVcXk6+AzCeDbixASQpKoRVVhCdIzJR/j6bj6mhTYgqOTJx9T++H5/g5
         bf5g==
X-Gm-Message-State: AOJu0YxcG0D5DM0NxXRvF0X2PokmRGGNYOdQ9ins695e3+ArVDZnDM+D
	1B90RjkK2TDGNGu4kN4XSJepfGv3cwhcGu9Z3SVw/Q4VAyfunjgEQYyBU/gOpR7L/bwq3xnZk8h
	Ryxb+mw438gVmgS4QOdcOyez5B9rfUf9k+iefS+DePWvUabi0N5kzL2xE0WFa599NlTbC
X-Gm-Gg: Acq92OGCX8H+Ce7qyU8n2GaPp/qRXvRIYLl4IUjDdtbX0tt2srM0dpoUm2Potm8dLD9
	g8VLPyO0LQy1EC34C4b4PvffVv7EHVTk83X7efFnj1YKprkK/sSd2qf3K3/fT3nnO/KFkwdUgfw
	ElbQPJqPjFBwytXwJ4srp11ZgfpKz162rTuhwlgZ0MXLUDX+NfysmmV6mzCfguMSOIxOq2bgiLl
	aszjzaaG1hpH8gsPziMaof9mUKwElmlM8I3wnYXjgrfXPrML6rchJ6bD18KQXN5QWL2cELbI+ai
	IhZZZ7CE9A82tYcgZCwVb42C+Zrymulh4GE19Kh65qmcDDQYDWHW1sc2pzbIsZob7DXoSL6pYbp
	CcdNk9XatKD+33vG8OKOac9zAjCJtw1T2
X-Received: by 2002:a17:902:7484:b0:2bc:ac76:c1d3 with SMTP id d9443c01a7336-2bd7e9af975mr125817205ad.29.1779131313171;
        Mon, 18 May 2026 12:08:33 -0700 (PDT)
X-Received: by 2002:a17:902:7484:b0:2bc:ac76:c1d3 with SMTP id d9443c01a7336-2bd7e9af975mr125816965ad.29.1779131312681;
        Mon, 18 May 2026 12:08:32 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0f94c6sm161995935ad.56.2026.05.18.12.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 12:08:32 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 16/16] drm/msm/a6xx: Allow IFPC with perfcntr stream
Date: Mon, 18 May 2026 12:06:43 -0700
Message-ID: <20260518190735.16236-17-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518190735.16236-1-robin.clark@oss.qualcomm.com>
References: <20260518190735.16236-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VJPtWdPX c=1 sm=1 tr=0 ts=6a0b63b1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=5obZvuzjGUYrwyXX1KsA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: nwqhbr9mTLp8ZXnK0azRxXpNFDbfTvfB
X-Proofpoint-GUID: nwqhbr9mTLp8ZXnK0azRxXpNFDbfTvfB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE4OCBTYWx0ZWRfXzHwHLajeHaK6
 bgvvZpzRgCiNPpoNy83W6j3nq8PIX8wi0KPWnpoXpMLhEhv2cOp9d//r+57UjW8MRugFMwZepke
 1UAxs1hn3Nbvg8MQkaQD1/J5Vq7rynqcZSTadAZCMJ3vnAYG0VVg+2I3sH7tkbIleWDzyD2/6EZ
 tEbQwDo4A0RO2aClFgI1Mn99kku/z2PyLofBCmMNRc6zCkxdWVWq7JQyHwJ6p8rI+WTb2M34C6z
 Ar4V660OwGZKFzGY5sil97D1PFwvjwy0Bt+twu4FB7iBrtjV4Af6A4yz2U6Y1YTm4FDIvPKfoaJ
 K1POhyMgYbZuAUPSkUoQg5ABMB5qdM/g2vPTs3W2NZqAu1HPyXBPZavRF4LXJTB24r/BRDR3hBx
 FreU0u8s7O9ShxPLRNHtzJyfetWdIbYJCXyZczbfjTD7V3j7cnx8D7EcLyw1AiBLTGX4JtHoOz5
 DmPTg5WzCiQENFqUPFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180188
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108283-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 72249572B31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 38f1130b99fb..6875c44222fe 100644
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


