Return-Path: <linux-arm-msm+bounces-100177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIp3FujMxWndBwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:18:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC93233D7FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:18:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 87C9230A6E7B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 00:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2838E2472A5;
	Fri, 27 Mar 2026 00:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P3hivlc6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vem0bMme"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352E424503F
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774570564; cv=none; b=m9dLkC8UgDbyJsp9nGPnzsTc9KUSgkT9Oz9KACjMvpSyFxXu7IBDH854CRsrPzfmPn1LMu8adaI0lygQRhAjVisdwcc89BimtEfLZ5IWOeABMvXEbTzq46fGZCTBXpHc9W7TRYPca/XJgJ/eM116khndFZiq/80Ymyt+fD4plVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774570564; c=relaxed/simple;
	bh=tt0zxOn0F3KPZtR4wFuXFE/i1ZPf9HE4HzthvNFKFac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SXL9RWlb3VrwMQK3hHwa5vHF18Ni58QHXe7Cw/Goq0rJcUPsmv0WtkGXCunTcyLnZ0sLk3c4iF2k0CR6GEjzB9Sl0DRpeejUJuIhGK0PdPi98PyuPQLnVUURHgQi5hfGzXgv6MgGIfnZ6aHWLYSNCBkrN5INNfA+/s6p08Dzvig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P3hivlc6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vem0bMme; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QKY6x7518360
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M+LSsVoBmj2hs/kesjMZJeiXdSALhgP/HVqOgOjjPvQ=; b=P3hivlc6IpllqeGh
	Vvr3UFnmt66gWi22CjQAojM/lh60DvptKjLZ1YgvzKOoKaxEYiKnqslDMjRAkCkD
	28UWQfs9qU/pyroIcgY49orLLRhecrHSokL/c2b1Qb2g0VgTUAfkYku5yP1sGmi1
	sp8qJAY2xtVimdRNub+EW96aDjJv2zTaRuonLZ8fCb21blvGGsfedNWbMcGwYiq8
	tzM/2xV6EGJy16lnVpS4I/jWR6uyi0tBzYQKT/mD6JmOseyF2RQ/bQtPIKiQKK4u
	wEuuHChGqHyce4XS8FmJ76mNUAXx56mcpodi8j2LUsVAEVMaQ6gLv7W74nKWCy4X
	X3eGFQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxv0h7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:16:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35c0bd3a968so1541287a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 17:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774570561; x=1775175361; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M+LSsVoBmj2hs/kesjMZJeiXdSALhgP/HVqOgOjjPvQ=;
        b=Vem0bMmep/dOVjPFrvUaB7gA4daoTKCu0nnbD47nj8bA2d6rtvm+wZpmu3SczolNrX
         eYL8FS82hxEWtLqVYSuDK1H8u5PtJByysASp+5BiIxBK5nTrbileo9v6l1BGDXOpqwKN
         qI4v+JGUHwV5FH6J5sylJcOzmh216EPfN3raXjGJbDR3L6Vg3GyVjdntQUDO35AVMKM3
         f4xSou6puMbVbOMFbC891TISgbPmQ7kruDqmx55eohYAFf2EWyO6XomGZDyqkmQ3QWOC
         AHcc2ExKkXqGjXbmNYi5QAb0qaktWvrIWdagD58FEiS+ZoGKNPRgjyxk2yBqEco5PCZs
         janA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774570561; x=1775175361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M+LSsVoBmj2hs/kesjMZJeiXdSALhgP/HVqOgOjjPvQ=;
        b=FPk3/tw0ZfW5cDmD+C1nKOwaI/Hkf+uAuMPEfwOb4uDzVlGXqnVyueMJDOfqQdqAjt
         tCzHLmyI50Cf9jsgtMyTLda3Uvy9EPLvHpI2cTnfpsz+YgkxE5B2JH/6XheV9ijzJ/tk
         Hvb0KaUamKfQnpux3TTbcgL42d+F7JCW31TkQ7dFAeFMjsCG09y3TxrJ4Ra2ykCzn9PJ
         DsMADDK1ufaJzs1WfIvyE31MUOXF57su79TXN9iJ66d7VHRiltp1Ztl35OykhVjaMEjn
         n78BAJpGhbNwu+nVxhL2+R90QYOY38a4LDwpNWEoSTLTFir58bAltX/DYcj50uCa/Ac+
         dEFg==
X-Gm-Message-State: AOJu0YwZa2v7zQ2nIi8n024Gb0YJCd5XrvNmEP08vfoL6zSvc6TszlC3
	tXWay+3F0Hiksyz9Qe14XdlESVPu2qP4jC14XET7FOG56xJM8HfG2zAclMn/d2lwxw9n92P7oVV
	y+kBVcsdVRxkbb24q3JLrfkce66Yhfw86xWxBm0v8fDbr/RA1cnH2DQgz+3GeyD/VKJCO
X-Gm-Gg: ATEYQzxx1iBgGjkbqZi3r7/NA679xk3HnfgILYEF632wiaXwDKW/Q2TaSbDN1iH6rti
	BiDoylA+EQeBRTI1IU10B7XFrFXi4XmzrIYOylHFevjolrilJjSmrQUwMLve6f7OI9HEk76WzHc
	E4uSSSf3I4s3Z+fpCFYXWhotLNbwGwKXsDkpfi2WRl8TqAMG9u+Lj62YaCXJh/Nc5rKCc1v7yXD
	CuHkuye6DxtCEd2cFXBkBAyZTvqjE/880Pji3gyu4hc0eSEucUCOh2pVUxmcaO8Z2YZMB0u/d6z
	Hy/zTJFTy4BnvZmDGT5Oc9GuzR1oZMd91/lYPyuQgUHhgg5WFAEgaWj3I1TvHzRbl/lx80T6Gwv
	njJ1B6B6L5y/MFm6Yjeuxf6vGzvd01Bo4+kwxxhWz5l4OCQ==
X-Received: by 2002:a17:90b:3cce:b0:336:b60f:3936 with SMTP id 98e67ed59e1d1-35c3000c6f0mr481759a91.12.1774570560559;
        Thu, 26 Mar 2026 17:16:00 -0700 (PDT)
X-Received: by 2002:a17:90b:3cce:b0:336:b60f:3936 with SMTP id 98e67ed59e1d1-35c3000c6f0mr481719a91.12.1774570559941;
        Thu, 26 Mar 2026 17:15:59 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2ec799eesm163155a91.10.2026.03.26.17.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 17:15:59 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 05:44:04 +0530
Subject: [PATCH v2 15/17] drm/msm/a8xx: Preemption support for A840
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-a8xx-gpu-batch2-v2-15-2b53c38d2101@oss.qualcomm.com>
References: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
In-Reply-To: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774570466; l=20393;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=tt0zxOn0F3KPZtR4wFuXFE/i1ZPf9HE4HzthvNFKFac=;
 b=kw9wA2jEl7hdpfsW676iDqH9fJtCxLToXAiAPvv1IrAaCNGe8UaaUnkJjcbPatMBl6yPQIam5
 G3OGgYEjAqzAdm/LoAdkfYdQk+aAa/lRsSsgeACnc7rxJgwxTV6W2UL
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=A99h/qWG c=1 sm=1 tr=0 ts=69c5cc41 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=fmxdy_jVxe639krZ1D8A:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: pe343reiN_h-espDgH_j4EZF8rizf6Kg
X-Proofpoint-GUID: pe343reiN_h-espDgH_j4EZF8rizf6Kg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAwMCBTYWx0ZWRfX9pucSgzQ4eRF
 EWgn1LArkiJ6KUKpObXDo5E/5p5OrduXNqHzAY6cOTq9wIWhm2AZbWXdii52kI9SzFmpQcVL0e7
 Jb7dUjPmCWqFeZLWtVtGVPGrWQnCwBLBXAWWuxWwLJFxdSS6ecwPxWX1dqfGPJwixWV9bCm36L3
 RUUxY6xs4i6YC8ViV6RKL4If1NGIQLKabbM2TtSq8Wuba8Jm6Fbqr4nEM4pchuK5WyI3yvMGMLY
 jQUYwPi/j5f43YFAr+Fntbv/eljexREYeE8fTZF3hswU2rXza1GFL85T00/Vk3/ldWOqPoGlybf
 Zym0a7svWqFkMPPBi/pxaeINuafxtu63qdHsST9zLFu9+TWnQj94j9TsSCWsnCF8nxYXn/MQiND
 aOZpcSko51SKiVlTNLi5Bke94xadBKFrKmho1BgKjjs3ZkM99Wdh7e67+X6APvYiu8hq+dBVdGz
 EBQ+StQLGIoujcW1LOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270000
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100177-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CC93233D7FC
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
 drivers/gpu/drm/msm/adreno/a8xx_preempt.c | 259 ++++++++++++++++++++++++++++++
 8 files changed, 389 insertions(+), 80 deletions(-)

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
index fb9662b946d0..44ce02b412ca 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -410,7 +410,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	a6xx_flush(gpu, ring);
 }
 
-static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
+void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
 		struct a6xx_gpu *a6xx_gpu, struct msm_gpu_submitqueue *queue)
 {
 	u64 preempt_postamble;
@@ -620,7 +620,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
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
index 000000000000..df36c945b836
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
+	/* ... and after */
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
+static inline struct msm_ringbuffer *get_next_ring(struct msm_gpu *gpu)
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
index e406681b8c80..9e6f2ed69247 100644
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
index 000000000000..3d8c33ba722e
--- /dev/null
+++ b/drivers/gpu/drm/msm/adreno/a8xx_preempt.c
@@ -0,0 +1,259 @@
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


