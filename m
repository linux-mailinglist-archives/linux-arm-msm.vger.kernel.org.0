Return-Path: <linux-arm-msm+bounces-114579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZfkNKJGrPWq35QgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 00:28:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D7E6C8F74
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 00:28:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XGqmr+Yi;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ApWvPYp7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114579-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114579-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD79B3073860
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 22:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B75202963;
	Thu, 25 Jun 2026 22:27:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC07537F737
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:27:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782426476; cv=none; b=iBTs6OqHU2+FcywKjtcpsqSsf+efkYN3koonTTTp/LK6NjzqLwEg+XsPtZTdp4LptlhWaRwmnyK/26TJmXqr55nRsC7uJa/TUWPRn1DF9g09/+peqyC7HpkMtRTT/avHUQmmT+wuZybAURD+BAlxasLd6caJ5nfWOCUIgCRNXuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782426476; c=relaxed/simple;
	bh=/p15D98oWQTSYv5HabnMOz6/z7N7M8gk/34A7MEKXiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hy+zusYLXpWSVV6jUzwfnhTEjMtKI0/F/mANUbUO0phamm+gKyv9JPMsUmX5nCaeOUrMyWgZea1p7tIfKbsQYvKBlIMI7gDfNn8+6X2O/nJQIBi5yvrSzde8RoxIm/TWJloOmb8G/flZQIKGO/pBUFhcHUX0Lvh18BUjVh7UU1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XGqmr+Yi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ApWvPYp7; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PFe5as2192030
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7V7Err/Z+6B
	Igi6OReMeeTwMA3vE41djVqJiMjm/22I=; b=XGqmr+YiJ+zTTAcHdKlbYzM616P
	AE3DNAHx4DTCD3ko3CAaH7JuCLhUzkfA5ERX/K17VQSHnZApjpprQDX7ENS95w1z
	ShZSdTDmCSShKrqNagoL6ZSFTepFlqNgOhzFzM23d8kdz35uwP4j4JxC2hUoVdTB
	xqm6cmfuMup2UF9u/JVtAn105Iu7se32GwwEy25Ng9wXPRBnVjiEob0UmiWzFhUW
	BypZHzO+dIMOuM6A0xzRGXPy8PqEb60wgyGqCoB+R8WlaPfZ+CdKMfkF+Fkvlc28
	L5QS/EP1reV1lcOIJOV/cdtpEzLjxpdanm6nq0mZbYN7WZKmirrQKXdqQzA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uudmee5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:27:54 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-845c296374cso155901b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 15:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782426474; x=1783031274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7V7Err/Z+6BIgi6OReMeeTwMA3vE41djVqJiMjm/22I=;
        b=ApWvPYp7cGTCbC6HH+LHC6qGg/LeF8O86mbHlpObQEg7a9yp4NDbE09qHKJ2gxNHkX
         HhlD0TaxuCXdljVJIofjerFIe+aH3MqScM7hLNmMR6wBZhbGwmZwBACv8k6faqg/1E3P
         +oxTtd6G7Vyfwe1Y2i4B7X8uxdsG5rajjNBztOsdVTfC74exScTnX/WtoMEfatu93lj6
         cQlkQrwm3A3r+j+2sKkyaiLwo9KOhTzWmZHg3+A8+VGeXuCEodVFowZgVi0Afj4MnHqb
         Px1g9me1vDHsxEnY/cfcKsv7Ob9IhGpBa1I1uuRwjGV5LGtKGix237LHguiJmsj5K1Yg
         FNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782426474; x=1783031274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7V7Err/Z+6BIgi6OReMeeTwMA3vE41djVqJiMjm/22I=;
        b=qxVrKx1/8/s/pmjb8zavdac8aFAN1/SP3JfDaSxt+6zSMdTOKdArZtbhPYXU4DOzH/
         UXV+/mLx6uf22hhnXILXZf2e0fSproqhHAJu+Mw4snRkemTf7BZeVngAuilQmkceGyPk
         vZ263q+P5RcgCdnzWWr27DTF4IEyqK5dYGe0Mo4IGZgbI73E6VjDW9IpMpso/Je2KCsI
         btyEe2tkr/S35m2sc1J2aFc84DXlYyiNTXiGMXnHqLb5MtUspSbfkXaWDl6HjfhDkVIH
         X01tQyOWAt8BF3EmyocEgAXb59mX0q0cseQ7+ycrkPDHu62gGis8KuJ22tq4zF8TLq4h
         AkDQ==
X-Gm-Message-State: AOJu0YzlpgcjwBsYDq7gcTVZinzl/55JQBqCHZLth7CqB6IBc0Wuj9j8
	TxLsrJR48bVbxWEOsmWQYXRN6x2jKg8O9sL+GmRp5zhPJgSPajbnYHVcli/BACymAhcn4zXQ+qv
	vUT4526NW1CAiGIAk/8dx0z/U0nVXmJkMLzXOlD1pYCjUsndBQ4jT7rVgDw6AFR2TjePi
X-Gm-Gg: AfdE7clO/2gL71mPdtU2C3rjLnjHsYSyC//zz+8Y2IxLduIbUkF8CmVlAGyWEoke97n
	SokAp9GLr/W+a5rm54/DD9xSCOPJsw61tebW7X6lmSSrhoGyusClU5iRyOtM3bIbNseSFlRpJfr
	2VSEqnX8x8lZtsGlOTFLSPu+niEyiCy64WTQ32IxHfNJUqwrEBxzJawpF0GVhod9Z1im+LcAW/c
	nqe/zMzcG0nREthY/5YRG8/CmzRwvpVllQO5Gkx7kFSNMzbc5nMx4sY6Op1QezYZFPn3dTj9bFX
	UOesMPInrCKQTK3Q+l6qnWLBghFNUZbwHNgx2J++FJVfVL/lG0YMp6I8gM+icr3C7PklmEH42J/
	rNdvtB7OGhdlR6ltt8J2LoPOQ+g0n7TTnEjpmNYKzyFMUxWLA8VU3AR9u5w==
X-Received: by 2002:a05:6a00:94d6:b0:842:66af:5bf2 with SMTP id d2e1a72fcca58-845b3ae5703mr4586728b3a.38.1782426474189;
        Thu, 25 Jun 2026 15:27:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:94d6:b0:842:66af:5bf2 with SMTP id d2e1a72fcca58-845b3ae5703mr4586706b3a.38.1782426473642;
        Thu, 25 Jun 2026 15:27:53 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845c104113esm866863b3a.57.2026.06.25.15.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 15:27:53 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 2/4] drm/msm: Validate lazy VM is created in GEM_SUBMIT
Date: Thu, 25 Jun 2026 15:27:41 -0700
Message-ID: <20260625222744.22254-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260625222744.22254-1-robin.clark@oss.qualcomm.com>
References: <20260625222744.22254-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDE5MyBTYWx0ZWRfX4v3QsZSzCzbT
 V1/319obJxYvGPnh0nk8M1C6XkJMDihkxy+myQPMxTPGxZpOBvf8RBy+2SDQkHCin0mCUTryROq
 3rlJnUv+DUPaKBd+oNLtb3pPslqWink=
X-Proofpoint-ORIG-GUID: xMO-Ste2RFGGMOP5gb8gR20Eu8ZQdUZ-
X-Proofpoint-GUID: xMO-Ste2RFGGMOP5gb8gR20Eu8ZQdUZ-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDE5MyBTYWx0ZWRfX4cbZpxf85F4b
 +tlDzcaHSOCgl/DzZjnjrnAMImeiZk+iTfiXmOyvI7JvwXJnyPAkmUiK4w4D5nstZ7qNv5GEOy9
 mtICPvPPV4gbO17P5oTn6qP8INvbN/8EIYNj/x7SqvhAQ+mE3PL5tdEybiPBl3QNomWxvaTGM6l
 1dVJt+eQXVV2Shy5sShmbXxPufFqPlVHFYiOf67LLi//LgTtixYXSz0e+bi/AuSIaWVIz5R+lSv
 bO6jpVnrP31zTIuH35e/qejBCIjUcUurIGtozaBSTcP5T/8pwir5H52PGt4CUdZQhl91jSeYxOI
 r+loDX3s4LARHw/2nj2iGcv448CG4hq3pWRpkk+rQ0dEI516YB5/lOSIpC6NuisBhgHDRMNwxFw
 J1bdZVaCmoFqpHsYe14HjOCxTHBYAWlnYr2dn8tutvOT+mCEI+QOL3ZN+ehZzZ+7R47AKw/Ynl6
 4vbGauzONTPrtBuiAFA==
X-Authority-Analysis: v=2.4 cv=HdckiCE8 c=1 sm=1 tr=0 ts=6a3dab6a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZH_LIYEqPuu6AAuj7cUA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250193
X-Rspamd-Action: no action
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
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-114579-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:robin.clark@oss.qualcomm.com,m:sashiko-bot@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1D7E6C8F74

Otherwise a GEM_SUBMIT ioctl before any BOs are mapped could cause a
NPE.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 6a4d287a1ae6 ("drm/msm: Mark VM as unusable on GPU hangs")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 3c6bc90c3d48..56929e821200 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -30,7 +30,7 @@
  */
 
 static struct msm_gem_submit *submit_create(struct drm_device *dev,
-		struct msm_gpu *gpu,
+		struct msm_gpu *gpu, struct drm_gpuvm *vm,
 		struct msm_gpu_submitqueue *queue, uint32_t nr_bos,
 		uint32_t nr_cmds, u64 drm_client_id)
 {
@@ -66,7 +66,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 
 	kref_init(&submit->ref);
 	submit->dev = dev;
-	submit->vm = msm_context_vm(dev, queue->ctx);
+	submit->vm = vm;
 	submit->gpu = gpu;
 	submit->cmd = (void *)&submit->bos[nr_bos];
 	submit->queue = queue;
@@ -554,6 +554,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_msm_gem_submit *args = data;
 	struct msm_context *ctx = file->driver_priv;
+	struct drm_gpuvm *vm = msm_context_vm(dev, ctx);
 	struct msm_gem_submit *submit = NULL;
 	struct msm_gpu *gpu = priv->gpu;
 	struct msm_gpu_submitqueue *queue;
@@ -572,7 +573,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (args->pad)
 		return -EINVAL;
 
-	if (to_msm_vm(ctx->vm)->unusable)
+	if (vm && to_msm_vm(vm)->unusable)
 		return UERR(EPIPE, dev, "context is unusable");
 
 	/* for now, we just have 3d pipe.. eventually this would need to
@@ -609,7 +610,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		}
 	}
 
-	submit = submit_create(dev, gpu, queue, args->nr_bos, args->nr_cmds,
+	submit = submit_create(dev, gpu, vm, queue, args->nr_bos, args->nr_cmds,
 			       file->client_id);
 	if (IS_ERR(submit)) {
 		ret = PTR_ERR(submit);
-- 
2.54.0


