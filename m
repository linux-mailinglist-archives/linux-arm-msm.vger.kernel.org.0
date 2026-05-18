Return-Path: <linux-arm-msm+bounces-108273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gA6gOglkC2p5HAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:10:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE626572AC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:10:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4B7613021B75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C380394788;
	Mon, 18 May 2026 19:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IKEv5w3+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RJjdlXk2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462C8390222
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131301; cv=none; b=cdbpwv30/+MmwZERdiPc0Rb+RgB0tO4QvT2oxuORfhdlObYu8LERtSARVhQnEBC1F1eE0faYPnCr+N9grKYUaJXM18KsSk3IDr3T/6SvX3mF+z/f680qXhZpiqrk27r7IbF4O68RLpe/zNW6i/DOECRSGCUbWQjo3zRKIx2kC1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131301; c=relaxed/simple;
	bh=mwv5H2OOJDSZvW2SF1lbkPIcHxfB6ty1LqTAVICmuFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LmBozJrdNmsmZ7eIhXDFDGjFrNME6dXAQay2cKyiPFjTi7DkhmL+dqImcDaKwN+NQCJQ+HboGJG8xePTw1tWWuI4JsdDN4XW3gwzpcqky1fb1+ROgUDM3jA+S6XNAElsqu3NkJPisCVd/NMNv9zI7wVpQYTvLCcnzlh1qci8bJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IKEv5w3+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RJjdlXk2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ICG1dZ2701134
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eZl9dR5CO3E
	sJ00bvvdzTmB9yHRqOUcactLKgwAqf+4=; b=IKEv5w3+T/i9zYuUbXota53kbr9
	F0XRgiFa1HnYh2iJF6GiK2jAyCml13Z7ToSzOyTwswEwmYvIdrmhcx+JhDeLBMIG
	Tfva5qM1zZUf9kdTCejaUfkalMDLZBa6NVUWkRq7cmYbFg5/ZmwqZgOLOoqhrM88
	j934Cxk7fyw+pB+sF7n0Fga/k2k6K/KylvSRCT85lG7itrgEbknjecn8NwalkVEl
	pLyxpKTNcyPyTQ87+m5YPWLCbvDmg88SwkTRgDeUKG2A7+8Q7Br9BSt2ikwArUdL
	KvxKT64eix4o0kQR4J+ZVANwKRJORkbkm/c4m+ai3ZdRECGvKHOId+NV+kw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82mehjxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:08:18 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c829586e894so1274286a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 12:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779131297; x=1779736097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZl9dR5CO3EsJ00bvvdzTmB9yHRqOUcactLKgwAqf+4=;
        b=RJjdlXk2pcEQgxuUEYEQu6qwSYiUyf4hyp1MRJ6Q3cEHUXZvDnN7jcvys7+6umvLte
         93cOJEELo1HITfpng4dbmd4YRnRm18wnJ3wTUNS21CikX2TidEHj9bPpoSxmeVzFYCjO
         aFp/uAD1uy/1tFSbPni8raaZwQ6sh6TqBpXL7fyx1bQpnReBQJN4wosgfKeum0GkVKho
         +87AsGAKET9fXTwARgrCt0KJErtX3GOx3Msv1qpyIY8I468Egz26yK5UCQTZEvY2iIwJ
         yQFcZELSoH5n57xtSc6F30ZMlluaO6EKSqh/YExIBrEonm8c2EYpaitao8l6tt3KsO0R
         PHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779131297; x=1779736097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eZl9dR5CO3EsJ00bvvdzTmB9yHRqOUcactLKgwAqf+4=;
        b=UVah+PZE2QCU0FzJd9KPZSoO5irfzLdoZ3dTQUKV0xWpwIQSZIFbTbV5fqY8iFLn4q
         CqOp6QlccAbAwbj8ULcTtxbeFETMttfU2YPkLnLjw9Rhb324BWCISe7WzET+2oV4t0M1
         HWPAcTq/bXiiS1UJbIhz5h8CG3vCZiP1mbdGsZ7jXLTHF5I6CQ+7RL2Jes4y6l+1w7Og
         RejswGaXobmjgOZT3uh4zvy3N9PYdazg6VgULXf7kf5JBxK5lDVrxk8S3ZHPhpE8w5LT
         DQM++qqXM61uSIVqSMhmdhq7boXWWBS+ej9XRfWEA6pOUID7UwfHoUWtTYQBRHVqVswF
         cSlA==
X-Gm-Message-State: AOJu0YwzP+zTAKtB1sT5s9z0hGvgiBE5bkxEVOIyeao1WOr6IfB1pZSP
	i/oirT0tjvWrk64CbGUuMQATsAEdoTVe3ltugYoQr39R/bbfjLOJkgXYFz1Mo0uDYvH6IqQO74B
	+lzd0vZxWgk5fQTty2V3ASoNw6sTzkmH8UEDyLixfHYWYVnBSUMZC1kOffi2/n+cQw6BN
X-Gm-Gg: Acq92OHnazniPef+C6pCBtptObAB1qOhuCvImbhw5kz6unnDCp5c8FuF91id6ZvcmUA
	KS9r9J1QXoJWNxk+kaplou4WG4NW/DeMGR+g820Izr7ktbbeIahrlSkLs0CWQ+ft6dO3EQcbHPA
	1XynGM+uZMiCHCEZLgxEkVZHiv6Lzfu6lnZWcydfHA/LeKKgthuiyevAQt+t+6G18R0sMD5hOKf
	ttSlGAxLSARktBA2anCAlcKWoWdmT5Ju5oPHGCu48kmOW+PnDNeZXLeJRqObbHOYiYcTqtrXOzD
	ETZpfCG5FgMsQBAcqDBlR6CfK8cIHheYN9Giaq6Xi7OYrk9j8al6Ve1iGAZ07tq2GVvS8t89xHD
	s8SIap9QmSyOoPlPHoj0hnW9NY8Ub3ReK
X-Received: by 2002:a05:6a20:430b:b0:398:7357:bb91 with SMTP id adf61e73a8af0-3b22ecac139mr16137969637.33.1779131296961;
        Mon, 18 May 2026 12:08:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:430b:b0:398:7357:bb91 with SMTP id adf61e73a8af0-3b22ecac139mr16137942637.33.1779131296456;
        Mon, 18 May 2026 12:08:16 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7c008sm14598690b3a.46.2026.05.18.12.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 12:08:16 -0700 (PDT)
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
Subject: [PATCH v7 07/16] drm/msm: Add sysprof accessors
Date: Mon, 18 May 2026 12:06:34 -0700
Message-ID: <20260518190735.16236-8-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Tr7WQjXh c=1 sm=1 tr=0 ts=6a0b63a2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=v4b4B-quZFKF0PxyZCUA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: yCeutHkd-G47e2uTdeBKKxeM0dFIRHpL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE4OCBTYWx0ZWRfX9tnhu9+4ZdF9
 Q7CPng551m2KpIsbbw81xVoCyVhXnBrVLFVEHfRhIKdPu3HdZOQNqIGhWXxyervPZvpm3XFJ0+Z
 vh5zNnbMzCNnurioHV0olBR1/Tm7pA7AipfdB0OGpbpZ2P6KwTdRr/qJntnxPeUcSFcxdJ0OQKg
 Fb2loU4c3AJ3l3dUDTwFwHkKjzLvY15jbCgIkAbQtHn5PjruICag8BRp2F/T2RVR2rjmorMMqKM
 squ1+O0oQYHgl8dXAtnyo6dyNEX4ND3CIaspEBKKChlgjv832+aY1ZAP6mWNxgGMhb2KvW5HiTk
 rwqhWjCGxtRPWIOnspbo0NSRbqNpVjCDs+KuG6dygfsAPv9C9PQcbd77KcIUl0kXwq20HtpIFKC
 aVc6jALa0XSIc+FKalXIyKiTyeAWX1tp0Votob0fwhug/gFRee9Jsohegvi7gaUi2u4zXLW+Tfb
 ZvVryHM+EvsUPnqI0Iw==
X-Proofpoint-ORIG-GUID: yCeutHkd-G47e2uTdeBKKxeM0dFIRHpL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180188
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108273-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DE626572AC8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently the sysprof param serves two functions, (a) disabling perfcntr
clearing on context switch/preemption, and (b) disabling IFPC.  In the
future, with kernel side global perfcntr collection/stream, the decision
about disabling IFPC will change.

To prepare for this, split out two helpers/accessors for the two
different cases.  For now, they are the same thing, but this will
change.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     |  8 +++-----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  5 +++--
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c |  2 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c     |  2 +-
 drivers/gpu/drm/msm/adreno/a8xx_preempt.c |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h             | 18 ++++++++++++++++++
 6 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 1b44b9e21ad8..aba08fb76249 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -2036,10 +2036,10 @@ static int a6xx_gmu_get_irq(struct a6xx_gmu *gmu, struct platform_device *pdev,
 
 void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu)
 {
+	bool sysprof = msm_gpu_sysprof_no_ifpc(gpu);
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
-	unsigned int sysprof_active;
 
 	/* Nothing to do if GPU is suspended. We will handle this during GMU resume */
 	if (!pm_runtime_get_if_active(&gpu->pdev->dev))
@@ -2047,15 +2047,13 @@ void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu)
 
 	mutex_lock(&gmu->lock);
 
-	sysprof_active = refcount_read(&gpu->sysprof_active);
-
 	/*
 	 * 'Perfcounter select' register values are lost during IFPC collapse. To avoid that,
 	 * use the currently unused perfcounter oob vote to block IFPC when sysprof is active
 	 */
-	if ((sysprof_active > 1) && !test_and_set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
+	if (sysprof && !test_and_set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
 		a6xx_gmu_set_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
-	else if ((sysprof_active == 1) && test_and_clear_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
+	else if (!sysprof && test_and_clear_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
 		a6xx_gmu_clear_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
 
 	mutex_unlock(&gmu->lock);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 727281fbef36..71f54ab5425d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -203,7 +203,7 @@ static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
 static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 		struct msm_ringbuffer *ring, struct msm_gem_submit *submit)
 {
-	bool sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
+	bool sysprof = msm_gpu_sysprof_no_perfcntr_zap(&a6xx_gpu->base.base);
 	struct msm_context *ctx = submit->queue->ctx;
 	struct drm_gpuvm *vm = msm_context_vm(submit->dev, ctx);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
@@ -1608,7 +1608,7 @@ static int hw_init(struct msm_gpu *gpu)
 		a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_BOOT_SLUMBER);
 	}
 
-	if (!ret && (refcount_read(&gpu->sysprof_active) > 1)) {
+	if (!ret && msm_gpu_sysprof_no_ifpc(gpu)) {
 		ret = a6xx_gmu_set_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
 		if (!ret)
 			set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status);
@@ -2854,6 +2854,7 @@ const struct adreno_gpu_funcs a8xx_gpu_funcs = {
 		.create_private_vm = a6xx_create_private_vm,
 		.get_rptr = a6xx_get_rptr,
 		.progress = a8xx_progress,
+		.sysprof_setup = a6xx_gmu_sysprof_setup,
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a8xx_gmu_get_timestamp,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index df4cbf42e9a4..1e599d4ddea1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -261,7 +261,7 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
 	mod_timer(&a6xx_gpu->preempt_timer, jiffies + msecs_to_jiffies(10000));
 
 	/* Enable or disable postamble as needed */
-	sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
+	sysprof = msm_gpu_sysprof_no_perfcntr_zap(gpu);
 
 	if (!sysprof && !a6xx_gpu->postamble_enabled)
 		preempt_prepare_postamble(a6xx_gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index ccfccc45133f..e022c9a162a4 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -849,7 +849,7 @@ static int hw_init(struct msm_gpu *gpu)
 	 */
 	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
 
-	if (!ret && (refcount_read(&gpu->sysprof_active) > 1)) {
+	if (!ret && msm_gpu_sysprof_no_perfcntr_zap(gpu)) {
 		ret = a6xx_gmu_set_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
 		if (!ret)
 			set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_preempt.c b/drivers/gpu/drm/msm/adreno/a8xx_preempt.c
index 3d8c33ba722e..6cb53a071801 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_preempt.c
@@ -242,7 +242,7 @@ void a8xx_preempt_trigger(struct msm_gpu *gpu)
 	mod_timer(&a6xx_gpu->preempt_timer, jiffies + msecs_to_jiffies(10000));
 
 	/* Enable or disable postamble as needed */
-	sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
+	sysprof = msm_gpu_sysprof_no_perfcntr_zap(gpu);
 
 	if (!sysprof && !a6xx_gpu->postamble_enabled)
 		preempt_prepare_postamble(a6xx_gpu);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 8c08dc065372..9e5c753437c2 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -311,6 +311,24 @@ static inline bool msm_gpu_active(struct msm_gpu *gpu)
 	return false;
 }
 
+static inline bool
+msm_gpu_sysprof_no_perfcntr_zap(struct msm_gpu *gpu)
+{
+	return refcount_read(&gpu->sysprof_active) > 1;
+}
+
+static inline bool
+msm_gpu_sysprof_no_ifpc(struct msm_gpu *gpu)
+{
+	/*
+	 * For now, this is the same condition as disabling perfcntr clears
+	 * on context switch.  But once kernel perfcntr IFPC support is in
+	 * place, we will only need to disable IFPC for legacy userspace
+	 * setting SYSPROF param.
+	 */
+	return msm_gpu_sysprof_no_perfcntr_zap(gpu);
+}
+
 /*
  * The number of priority levels provided by drm gpu scheduler.  The
  * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially in some
-- 
2.54.0


