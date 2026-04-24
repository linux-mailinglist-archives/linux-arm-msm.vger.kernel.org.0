Return-Path: <linux-arm-msm+bounces-104487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBthCamJ62lBNwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 17:18:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D866460AFC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 17:18:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F619307886C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 15:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82D22BDC13;
	Fri, 24 Apr 2026 15:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Idw+3XcZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qob6OPr9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDF23B960B
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777043553; cv=none; b=uZC8Nq67qzz4cIvoBBhc210mxMtUXBTtory+WCACoUrtSQ2vy1c6fHR1mqnP0AFblz/Xm0M2kYSM+S//U/vX++fIr2jxqfuQ2e+U5hhOTbpvHj5glhj8QHN2qKSrM+4kfSallm7yTMeR6mcTu4msnt097DIDsjHBZjwPR6WM53Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777043553; c=relaxed/simple;
	bh=SQyIN2lvht2yWROU012olknUSmPQZ8vHuGc5ANUQgvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JuIKOtCWGQag7SwRUN9PioUqn61q1a8eM+6D/yTLiIB1DlXkjarhUV9AvtLi22bkKp3LHTNFAJracgF25tW6hTofJSBMRBWvWVYfZ7yUihGqdUNO202dXJ0psQWXGTjw11Y4aPiFL5HOvVcaWpKhohcH+7peF3EhlC1GlNUmX/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Idw+3XcZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qob6OPr9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9146S756716
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:12:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HLnAwFPOk/J
	Qm30uB0uKT2zj47gE1NdrqCSNluQVCr4=; b=Idw+3XcZ9HglK+Fam3941GQrCWS
	RuPu/UMx3L0XxJT8R+rWo3GQWcVa8gehHnZaFvaJhledjNRYHjwmuaLxNf7PG/As
	hRDSfBGSZqvbOW6BGb216aLfPO0bIsUY0UI7OoFaVuBoRq98O4TQKyj4sZ6ujpm7
	Cl1tAMHLGlxtN7KS3kEduj0aWkhPkJczqFxP0JsEp7YFPnitCmtEb5hE3Grj7Z1h
	t+cbb4yn+9TSKvEgFPHNtZQukl+nJdkLkie0TZHhcKgM5zK6YxSvPClLVk2Su2sF
	dyGYijVwav1R0gpH3hBCv4VuPAwjZoWg+EVnV38rOoqLYFNb91SOjLXye/Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr4bmn5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:12:27 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f9aa52c92so8256939b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 08:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777043547; x=1777648347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLnAwFPOk/JQm30uB0uKT2zj47gE1NdrqCSNluQVCr4=;
        b=Qob6OPr9byecUbVImT2hnnReA1GK0Ix95+9ilUz94OyAnsAoomMrcoFMmoQEAHyzpw
         xzodLBjnk8Ox2hLv7sScwlozbWQuIkRLvmSX4/Co2JXwywAaEoX6rBWMwoegsePghIzt
         ezvrsWXfN+Naoxz1etT4ysRBH+URm3b8RKo9rUSBbmGcfgI4EclAmER5uObCd77M9g7Y
         ef913nW0HWaEjumjBHjgDba6eGX52i/SDAnUNCkFh+Rr9Y4Xe5G637L8zmpedX/+1dTM
         CnExVc4v1CJ08tyACmzwoFJUrSUCf9O2BIbUdb2wLGXvA9MNeUjUkHAqZe33gOxrqlHZ
         sbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777043547; x=1777648347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HLnAwFPOk/JQm30uB0uKT2zj47gE1NdrqCSNluQVCr4=;
        b=HSle5O3mrPb6RnN3/uutmCnziwXLNSv7othbWCPPQddY0QzFcY+xe85ToaXJVMjY9h
         ogLu3xnU4oPt8TpxWZtvZY1sn/DMD0hBTKCvgi+dxfbSpE+xfh/qM//gaz5jVSNmeVzD
         FxkTLJTciNfRzU1vz1hhvQREO5SGn9RX8yd6vcp6I9Lmyj+Gw5ZpTDz7dkMBoAxdKDAY
         j6BIhaMirONVAEEBmt8E+UmkRzVegxLaZ5tPw0FxapE322JlDsC7UXTITKTXo2NdbAjT
         wle6zfHLqnCb9CLi0/McnpCe1+R2uO2eudk9A0X68du+Nh3PMdlj7obYke3wg/pDyhbg
         NDLA==
X-Gm-Message-State: AOJu0YzFxwQuBR2Frkb2NTVAypKi+pU5WYh2KTVX+8mK44G/QGdrm1Bj
	9sThGecwdiO9a8jQ3W3UJLHXTR5OpAB1I4fzHd90zKQxNHvVWuk4pgezjIk+FbyvHYGGC8Clqqg
	hsCi4hIlizgYlka8dMS5168i/C9nuS8IAUpOpOjHA3ZRCXte1HW0KuTCDP1rIxOFuykIC
X-Gm-Gg: AeBDiev5YvSCaLaUPU9lqN09DfexeyObp+CzwjqoaLAUGBq2MPP8PyxZdBJ9SS1ijeH
	TWV3s1VtQ8lfvXUGBnwnQR0i3dCR4XuAGzXDyJ3gbXRBnUs2BxC/TWwLZG5TPLX+S3/yHFdEtZ1
	N/y2dw24YgSfqnHFjSJHZWJY1yoGl1FbmUtRHZaCzwnkLVCiXVHrsA9EHrHk3CPIHuo8DmNIDR9
	MTetZygLcvXI4nL+a+ACeZLJKXvKjFEuYIe1g5/5oFuOyTE7lPNYLe003OP7mmLtHHsvpiWsL8n
	HBzMGLUqdeza+nPW7ZbUYrNE1kyAwnXDTSliFD7c6fcdmuXnwyMhzBOgzgbR5EnVcdI2vxeXEgP
	1mPYmOYyTr4ZUgMv4CXTWQY9/f0CBi75A8h1hsAeYYN0=
X-Received: by 2002:a05:6a00:8011:b0:81e:12f1:d8a with SMTP id d2e1a72fcca58-82f8c90497bmr34751508b3a.34.1777043546764;
        Fri, 24 Apr 2026 08:12:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:8011:b0:81e:12f1:d8a with SMTP id d2e1a72fcca58-82f8c90497bmr34751449b3a.34.1777043546148;
        Fri, 24 Apr 2026 08:12:26 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe40e5sm22200402b3a.42.2026.04.24.08.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 08:12:25 -0700 (PDT)
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
Subject: [PATCH v2 16/16] drm/msm/a6xx: Allow IFPC with perfcntr stream
Date: Fri, 24 Apr 2026 08:10:51 -0700
Message-ID: <20260424151140.104093-17-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424151140.104093-1-robin.clark@oss.qualcomm.com>
References: <20260424151140.104093-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDE0NyBTYWx0ZWRfXy1ZK4rfQcCJ6
 Np0WZovz15keTxSmlUDBsIdXRyA7htXH/HuGapJZqUvjoRgWIGyJq4t86OYLhAGuKgM0Ji3WX1b
 FH2GN3vtxN+m4VDTg9JUNMpU3EpCeGTC73af/gEt+x4TskjJmgcxK6wzeFOinIKp1hnz5LX0qf3
 08H/6zRLo2tDIxB5xh4ssZalo9NAvvXfaI70yB9NTK1yt+NRsYE3+UYXRsDSchDkUpjFgHFiVmx
 aTvChYNTserV3nMNzoBap+zf2bWQHVLxY5lqD8We0ctpTBCl4WGWUtl8ZgeG1W0RAx3xxCWrpBs
 6LWb3qZK5rLyulLOyRzOAuqRCL6kDKJSVBYCNevTO1d0wv8dxEk34iOIe16+JdAvADSQsrZjlF4
 zY0VIldEhfLtU24Ctfthm7SNLyT3scNwJtn4Ygfp3GXOuVmrbCXbQqJ9ee9iZYKSmQmBzhjYxE+
 KeNNtrngpZ8Gu5mKl9Q==
X-Authority-Analysis: v=2.4 cv=TtnWQjXh c=1 sm=1 tr=0 ts=69eb885b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=5obZvuzjGUYrwyXX1KsA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 37i_NCllsamXcfUu7-6H_65E3tVrhuZe
X-Proofpoint-GUID: 37i_NCllsamXcfUu7-6H_65E3tVrhuZe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240147
X-Rspamd-Queue-Id: 8D866460AFC
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
	TAGGED_FROM(0.00)[bounces-104487-lists,linux-arm-msm=lfdr.de];
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
index 8dd919c004a2..891c21be6158 100644
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
2.53.0


