Return-Path: <linux-arm-msm+bounces-99749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BMrBG4Lw2lKnwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 23:08:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 661C231D235
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 23:08:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EC44315AD77
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65DFC35E927;
	Tue, 24 Mar 2026 22:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BWQZXGVR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LyLb0NLz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC29E3B19BC
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774389931; cv=none; b=p2lk43M8xiAdBsLNjMQI+QPwg+Bip53uLd+QvSQSMj8XeGcXXahJuRfmJFBPyciQPaSSxRDgQKeL+DDTaQqqOROhkC7+e6Z+rmdzeGv8wIQg7/iFLiihcQKT2bURMMSmAtILxFL3WmTjFxlyvmjOpxb6XK5Zt0q6OpALRVjPsCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774389931; c=relaxed/simple;
	bh=/9fTrHRnTkDBs/OY7n6Su/4q1bIQL3OgpER3yvd+nOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qIcnLmpi1klZSVND4Y0lv+4561XYkzPR2pQn7dx1zhLgJ6kKB0ZUZk1ENb1qNdonqKc7xaeEBprNE0L+Z3FqWO1tIm473PmFadTx+EiKLOTY5iyn2KeN4DayRt8bzI2ulBGDmRCW0eBy8wif/HpnFcjniG0Og3mWfNTtfsFmLgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BWQZXGVR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LyLb0NLz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCwH32340418
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hXs1ilEphqy
	uUJvSiSscnyD6ZgL5ByYr+YWWml4pGG8=; b=BWQZXGVRXF1yKOdkm3mktusTWAJ
	PKmrGhLoRX++t0nau4hYbyhyD1Cw1ntnl7VXuVqvhkQZLD3f2LRMA4ISFP0CTZUj
	xQPX1EIsOeu2uY8jUoTdOPrqOg+z0lWy/YtpW59g2Od09oFjADtMN/1MloOo8vK/
	UQDaWMw3PueUpAAiayMUfSw8dT1eAdz2JqW/T4+TZtmxAW3SjRMhQcz8i9zlBdO9
	cBtSSAZbq5yowX1d8o2dtYT4eKcE7p1BjmKs2Lily/vIJHUa57k3p+V5EDg3mzS+
	Q4Sot5oLNTkjZU12M/fVxM04bld8w47vgTQwnoGAY8SL07c33em7nDYu8AQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3sw42d6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:05:28 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c649dc145so716740b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 15:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774389928; x=1774994728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXs1ilEphqyuUJvSiSscnyD6ZgL5ByYr+YWWml4pGG8=;
        b=LyLb0NLz3tAzYS0LMqhHBus4RLTYwfHMGOrgnEpmW9WA/OTYoaovidn1en2qwWqpAv
         KVJ3QbcCO3ppgu4ZapRsgWpkTy1VwGzWT5o/U5D/NZLLWw0UrRbariny8SGIhwcQ932q
         RpWKIdgNgefOGd9y6UVmkwqemU8Y//JOsjQjBgH6vStAKB1LUrE1W0kS3NoE3tAyPy8E
         OwJDrswGDJQQK2P6fD7+PByluowMh3lvsGZDy8/70B9EjP0Sw6b7vMYnmkk7L1rWyw0D
         MfBJ50fZHwURC4EQc0zDNPYAxiM05szLLafmJmko9ysF4pyUL+yeJa0AUNuiQTxH/r4d
         uWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774389928; x=1774994728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hXs1ilEphqyuUJvSiSscnyD6ZgL5ByYr+YWWml4pGG8=;
        b=YC4g2j8Fy3vNHb+yMMO1OMb+YhSszUjYX0ephIReJ3eghfJGo00XMVh71vyWDX9C4J
         4BCTnZqQ4r57dPF7+ZSb7TCiybuBU3MOTkWoDTxEEpJfwvIZGlQG2ajA7k64eJJT/gQZ
         FokxgZvYmK+QVM6WcMyDGs0z2goyNx9AVurme0sM0fSFMOVM4qR14jfV+dB+xhSpbmKs
         r4zXVBRlFVthMrpmNkJkfoWm4QxkEZXv8tlXWkYY9IzjiAY5LiOFklvOV5IDm8n1Tlc2
         uXwJ/oM0Wx9DpA8tO5+1A5DIgVHB04nUNOdJbS/R/u+DQDn9OF8KR2x9XTy/xAc9/XN9
         PODw==
X-Gm-Message-State: AOJu0YxZfBg55UgE3bYahnJV1PbJZvz+XnSsecAPHOk23lIg7syvSqgv
	hBze+iJC30ZLSZpx0Wn46fYuGs4jqkQG8VVO9oFomU5DbQ+beAzrZo0qFh8wJHwtcmkPflnOVc2
	D+Nw98f7zKKfKVdTx6tbsvacI3gS7a7SRLE6j6qEwSM7lVV8ftfh8kd7gBS7Wr0Ll1c07
X-Gm-Gg: ATEYQzysfjncwv4kRaSkmo1jGkPMsoydPyUEgihaJF42xx+bjdJKKK/AQQEMsJtBf4V
	rTq4o8O9KPKF4IejPWJnWZRyl92WF+a6290OwfHXUTjjZpWRImKmuchbPB5Aou6mFTJZ3Qycn/U
	fZkuvvNNQkI+L3FxNe9LXpOo/PtjoUd5JJRBfwWHYSo10qpKF9XNEcu7cmu0wQOTyrt63jsHWt3
	MKO60LSzeKVk6zH8aAJTOsnhq3rsoDKnvX0hFDEF90WdJiexJ+PtcVjaQ/bnl+GrnmqJlZyWztp
	nPraxiHiQQfsESkdnsLM3GzN8oc+0K/JDqQcJa5L8Kxay+TnrhA34N9x+AGTjGvIlnT3C0TpTbj
	cP+rS5GiK36QA3ppuI7gObImTvbvbAcS+
X-Received: by 2002:a05:6a00:f05:b0:82a:6de8:fa4e with SMTP id d2e1a72fcca58-82c6de9f009mr1353453b3a.17.1774389928000;
        Tue, 24 Mar 2026 15:05:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:f05:b0:82a:6de8:fa4e with SMTP id d2e1a72fcca58-82c6de9f009mr1353343b3a.17.1774389926197;
        Tue, 24 Mar 2026 15:05:26 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bbf0c2sm15880581b3a.15.2026.03.24.15.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:05:25 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Victoria Brekenfeld <victoria@system76.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/msm: Fix VM_BIND UNMAP locking
Date: Tue, 24 Mar 2026 15:05:18 -0700
Message-ID: <20260324220519.1221471-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324220519.1221471-1-robin.clark@oss.qualcomm.com>
References: <20260324220519.1221471-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE3MCBTYWx0ZWRfX2OPcF4J/EO3v
 19glBvDGKf5sbtYtoHXiF5t3hxsuB6dTrpcqIobJDRR/nx0BnStOjB4MpZb3AknkGKcyXPeaf5S
 HZxTIMhloUX7lwHnIxSSEfAi7KWBaiGcE1fg0rjjEbo7IgrB+q685O0P0SS/tyYVjSi2dDBWtJR
 Tf8tlyON8BDGZ1eqNH/J3STzh1t6UTRZu/TiiiH9xE6Pr67yPNodQhg334DGncaNj2z9clDSDmu
 RqdLhCH7hTkdjTqbetCCPyCoTM67bvoI5wTp5lAYWRtuiEt6u2u7x/WLTluqUPQkJyHhM8PMTOM
 Hrat9e8VKAm9rp2EeEMPyAdV+/lnPAtscpVlYESqVMqfnEj+B5bC2Y1wJrWeGn92bCJU5+7fd+G
 qJe2L7AlMURShyTQFpXoIqEh5UzOk9zO9XMYPeB0b5yinEpnKEvCe8u/qDXXDLn2kS5TXa61IPM
 C/7onvXzJTTe00WzmJQ==
X-Proofpoint-GUID: 5fxtFuqH9akQGqWf4MgJreppE1G_9Tjf
X-Authority-Analysis: v=2.4 cv=bpVBxUai c=1 sm=1 tr=0 ts=69c30aa8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=e5mUnYsNAAAA:8 a=E-CVgwXbAAAA:8 a=EUspDBNiAAAA:8
 a=wHnczO1oL0llXtWWSCoA:9 a=OpyuDcXvxspvyRM73sMx:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=7UGCclw-5oBoqXlMmAWZ:22
X-Proofpoint-ORIG-GUID: 5fxtFuqH9akQGqWf4MgJreppE1G_9Tjf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240170
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
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,system76.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-99749-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,system76.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 661C231D235
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Wrong argument meant that the objs involved in UNMAP ops were not always
getting locked.

Since _NO_SHARE objs share a common resv with the VM (which is always
locked) this would only show up with non-_NO_SHARE BOs.

Reported-by: Victoria Brekenfeld <victoria@system76.com>
Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/94
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
v2: Add tags

 drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 43d61e0919bd..953a2403f598 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1251,7 +1251,7 @@ vm_bind_job_lock_objects(struct msm_vm_bind_job *job, struct drm_exec *exec)
 			case MSM_VM_BIND_OP_UNMAP:
 				ret = drm_gpuvm_sm_unmap_exec_lock(job->vm, exec,
 							      op->iova,
-							      op->obj_offset);
+							      op->range);
 				break;
 			case MSM_VM_BIND_OP_MAP:
 			case MSM_VM_BIND_OP_MAP_NULL: {
-- 
2.53.0


