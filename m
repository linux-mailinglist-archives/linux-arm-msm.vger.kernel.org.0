Return-Path: <linux-arm-msm+bounces-109872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKvcD8K2FWrKYQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:05:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D1A5D8480
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:05:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 48A0D306A74F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35251403155;
	Tue, 26 May 2026 14:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VI2S3K6n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KsJBdkiy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF1B40B6DF
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807267; cv=none; b=U8pIbUOHKU6IUmG8zYuxtZCKCpgadbbzJwF7m4oDLCBinW9TTN5y0dnzSlJvrIpchPTpkcRd/2S3qrDO95XPRmS6ZjQJqAhn1ux/81BvJDxc6iigHfHSmoAv9ev6by01OT00NzQOdEtxIUg6LZvmzewN/8cADfMC8Ujn/ZjwCS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807267; c=relaxed/simple;
	bh=5Md1hzcm7OhrnjAQ/GlJVLxqZtYNlABLFKeWnLvV7Yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z1lFjjj1UTL0J4Z2OtmFG86aNayDbK+rimHASGaYnpO/rNKo99/cAsk067zTFuMTCM4ujn0/Utcj3nS6JvBwUhGnE6JQpUev8gBxNO0MqpwxMSR63mbAj8wDtxXyOIE18CGwnFOd5wo2rFbKcRxw6/V+M1XscrJARv/pY4XOqkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VI2S3K6n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KsJBdkiy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QEI2pr1360726
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:54:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iwPf7oJ62+a
	JHGIAyfRJce0NdbfHJ0BsASuIH0Plg9o=; b=VI2S3K6nHKlEbs156SjW1/yMidc
	mg5tANLUmrcTsHCI0yU+8InXIOYzaqban5S8h466Oni6xFjUbf1GsYHq7HeYTetQ
	lZZJw+apzAKB/WfeWLIviTsqqYTzXz9ReMHUheG5ayVZYd5+jcKS62U4ttCJpUYK
	YsowBDDitXQFxnaf5WbZJgrG2nRCq6M5bFU8kJsql3mlirIi1eNmKn2ZghS3WW6c
	nzYFFhE0rPhFLM53O7+7S7sYXZ+3A2hFOZOJv5saMZ8x0HSsXaaR2+yM+A7DuoCn
	602+pWn9rZKApeNoepfsnsPIbC/kYVP0jqQXVoipFYn1BQgm//Qf9keWL3Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edd5ng567-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:54:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-366344513a3so21433987a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779807264; x=1780412064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwPf7oJ62+aJHGIAyfRJce0NdbfHJ0BsASuIH0Plg9o=;
        b=KsJBdkiyZfr1hZ+bLpi2U1loFu4yuaKMQkuXENO/eDYKncGjLNuUZceQRjRUnZcN7f
         oA+LYClSjNRj7DhmZSzP+jm5QYQajgZErZnB+5PSzQjCA0a1esxi+JXVox4BhQxeN9HG
         5XvUE5bNqCDoNcwMnJtGfbyC8GsfzbB1xRG7QQLgoEBAcRFCrptrBmgmDsZMVeTngHRd
         xuRct8ZQcSY9gGpFvQ/FFKbKzMvZh+x0SIS/F4t8kGiZregq6dT0Y6vDwzPrpF7Ker/c
         vpyjO9h7o/rREQZtmfZr0qHXnO0rMS+qBAIAU4Dd3UnbsagAXN06xaDCx1l/vijOWOMW
         BIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779807264; x=1780412064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iwPf7oJ62+aJHGIAyfRJce0NdbfHJ0BsASuIH0Plg9o=;
        b=X3yOTzVjZMP6ffdd/tqaVZvmKas9M3I4xNpcrJ+9/AMY8cGpj3VJabtCZTxbhU8m64
         8GVa9R9C2oF7bjeXxoOiVyVTFl7n7EPt3X5UlcPzwL/Q0G+txI5W35Ufw8JAZoz6fbch
         TKIh8aqjpj2mRzZuFUpKcsGOgXydfTzRuh6yW3VactLmo8tqez9+pa33yNsBso4qcMjB
         4cnvGKhoHLQV1pvRhJsctbT3ApnSZ9OrBoMgiMe11x+SpFoic8Ngv4uhUXTGejK0sQsU
         DKL/qqzrznOZTNc387eJqYMa7T35Msv946a3Trvbe5TLhXBFPtd6t/WVKdKwRPKvWyOi
         Fcxg==
X-Gm-Message-State: AOJu0YxvhtHMCxUOu1VE51eULjCe+6Bec/SraHy1qNJ0VzpErZbKrlZc
	iPWB9N+oFHV0QixSWq1ezr235qGvR5j17ky3gfLMgxCDIJgXHP2NKQEd0yYjoB/ryHh0G10iOW5
	F9bA2/SWxexEXqggfI3WWjjBIwAtuUH16VCsvkdE/CB1vhE8zfSlBz5WPek5RUEYQ1+mW
X-Gm-Gg: Acq92OH7Avxtm0eSvWhRxM5E9QH0M8HnkMaiEZJ7ZkzmdqxVL151HB1Nf4mXfQ+SBLS
	PdZ17KVcn78MSkk1T+TJXiVLAUJNDBSxj4vRI6Q+Ix0wF1wDrUv5ncKEoYcMWh4gQtYfBUKQIkM
	0atppoeTT82WtLqhzHxw+EI5OW+fUMLdB9dkX8R0LfDyC2lM0LzEvybyBpjewtivLesy2KMC/HJ
	VdCYYOwd5TPTTe62L8x2ma05lulWZsuhoXxufzx1q8M/sTvxRJcWSzK2L0UriLHDBDWjGeV4iNc
	+AxBzco3zBjJAdz7T+EHKSYI7/cFfyVwqFb9rDHt+zL++ZFrO91RKvFZRytS9uDfMyH3CkHWzbp
	o9enWXx42gq33uPcyM4euDOkIaKUmyvIy
X-Received: by 2002:a17:90b:224e:b0:368:b917:79b9 with SMTP id 98e67ed59e1d1-36a67658122mr19483165a91.25.1779807263681;
        Tue, 26 May 2026 07:54:23 -0700 (PDT)
X-Received: by 2002:a17:90b:224e:b0:368:b917:79b9 with SMTP id 98e67ed59e1d1-36a67658122mr19483139a91.25.1779807263222;
        Tue, 26 May 2026 07:54:23 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6d810772sm5764136a91.8.2026.05.26.07.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:54:22 -0700 (PDT)
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
Subject: [PATCH v10 14/16] drm/msm/a6xx: Increase pwrup_reglist size
Date: Tue, 26 May 2026 07:50:48 -0700
Message-ID: <20260526145137.160554-15-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526145137.160554-1-robin.clark@oss.qualcomm.com>
References: <20260526145137.160554-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: faJsmksdw6MNpzDLre347aW-pnDuK713
X-Authority-Analysis: v=2.4 cv=TZ+mcxQh c=1 sm=1 tr=0 ts=6a15b420 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=QVKJPBlc5dbYwvk_-wwA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: faJsmksdw6MNpzDLre347aW-pnDuK713
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyNyBTYWx0ZWRfXzYDTYf1hG0SV
 kC2WdBzJ+C+tNaqzlklLERwHMvSvYyRwwO2k8B7xEFnoZbItjkz+2WAfJmQ8UIuAwT9SMGudROe
 nHC12C55dGKhd/XHN0tK4IoP3AppkoFt9HwA+loUnHV7FQh/sEoQW6KnEqmyENIZlzb96FFh5Ne
 gke83RGTHECK6EVtwuQmpz3wllrpNXbRCJ9sF744OmNB5mA7FENoELF11rCWiB7ok+eCOljnrHO
 iHAmOoSC9c209hzWbB+ElQdABzD8xoPF176nP1ERR0jV1PZksvDVW+aZXGiXRcLHHhfo5inVhUU
 YDi9qO2Q+XPtt60g+WW87s+UHr5LeVwRPQira7Nn1mkmEYdizahirYCZPyZb69C1CjGOWUqsfwx
 n10Cu48nbNQBrSq74x1saKTWPacfT42a238Z+g0zaWPWUdio1NUZ7jHR5FxIFnt0kwcNqzD0WqN
 eYQNMee0kn3oE1kTL1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260127
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-109872-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.984];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D6D1A5D8480
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

To make room for appending SEL reg programming.  Without increasing the
size, we would overflow the pwrup_reglist at ~190 counters on gen8.
Or possibly fewer, considering that some gen8 counter groups also have
separate slice vs unslice SELectors.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index a329d20033d7..e6c362c55dee 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1183,7 +1183,7 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
 		msm_gem_object_set_name(a6xx_gpu->shadow_bo, "shadow");
 	}
 
-	a6xx_gpu->pwrup_reglist_ptr = msm_gem_kernel_new(gpu->dev, PAGE_SIZE,
+	a6xx_gpu->pwrup_reglist_ptr = msm_gem_kernel_new(gpu->dev, PWRUP_REGLIST_SIZE,
 							 MSM_BO_WC  | MSM_BO_MAP_PRIV,
 							 gpu->vm, &a6xx_gpu->pwrup_reglist_bo,
 							 &a6xx_gpu->pwrup_reglist_iova);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 3491a24a9320..d3f0b40787db 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -96,6 +96,7 @@ struct a6xx_gpu {
 	uint32_t *shadow;
 
 	struct drm_gem_object *pwrup_reglist_bo;
+#define PWRUP_REGLIST_SIZE (2 * PAGE_SIZE)
 	void *pwrup_reglist_ptr;
 	uint64_t pwrup_reglist_iova;
 	bool pwrup_reglist_emitted;
-- 
2.54.0


