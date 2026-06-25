Return-Path: <linux-arm-msm+bounces-114572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qLT4IZ5+PWrP3ggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 21:16:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B816C8559
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 21:16:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ORUVndAI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VZXxjFxF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114572-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114572-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A216F3073486
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 19:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16F42367280;
	Thu, 25 Jun 2026 19:15:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C004E35C1B7
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 19:15:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782414951; cv=none; b=jPseo5LMBgNs2GCwmdvbByAzSuKHh1rhBjl5rAiiCaQvam1E6ThdEMGQ9bopYDeo3WSx5BoJeklgWxmw7WdaQPT6GaIkjR/Qi092qDwJvKcuRGQD5iA1Ya+Xdmqr5Hat7GFP0Wy0tcl6dhvzMK5ujMWxfRJW/nwV8E657PGbD0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782414951; c=relaxed/simple;
	bh=KXwtNs5vrMjTCfjM/SAe7S3VaiWvP/VvYzYdKpdN/4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p665dVBFAI+PZuLipK3w6MEe8+SmHzeMO2s+OEeL0gWN8SBdlAWaNgFctuYPLGCKswuRdBCWjQ1yx5YPmTtw4HugB4u+lYBvRJoWTH+XEzeHy9rF3RfxsHhNmoXghzjQRuMaxt1/ci7af43ilsKQuKduI3qBRjR433rVW5iPxFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ORUVndAI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VZXxjFxF; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PFejEC2544189
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 19:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=H5SCzfZY+cZ
	y5PgYB+6BQtHFEsZ/Uoh4sUu9a8QqdLQ=; b=ORUVndAIKrxwQHEALCGh5hLrjda
	svk+CMaVOz4ZYK8DUZxd9Eko5S4zLilyBdfSonXN0N8ac4NG/k3kHIEvQlUVnjJO
	CdfIzq67amHAXXHBZMTWIh8SBTG91jjQ86gJVnebJIxUgTzqs2pZAKph83RnDlA5
	YX2ON/6nfLyrlwq8bimIgnHB78QfdxqCnCaPgaN85HBtBAk4VnFc98gL0w3G6JR8
	+T/6rKDxA7TD123MaVwhvG9d+TrpeWCUd7Zo/kfHj13vmTQ2MDsfXRXXiGhYDYAJ
	s4mKvQwKvRcsYUlEKVWMEOj8W0rG5X+fDNgh2w7ikYEHZ1OW6SPJC6iC12A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0w0q3j1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 19:15:48 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so121186a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 12:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782414948; x=1783019748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H5SCzfZY+cZy5PgYB+6BQtHFEsZ/Uoh4sUu9a8QqdLQ=;
        b=VZXxjFxFwv5r3g0wzBVI6k38mtZwB3gzx2BKh+SjtFdefT+Qp6xaH+s0Qm4vdRA+JP
         IqxM+KD8DI171qJywXgFfwWEmYH5Xcrebl0mxq5fzqwZoo+DipUrfcd/dr0ZAguEqFr8
         +vUgwkZs2R9Ta8Jg73Jx/bgjJ4Mw1CwUilc2RmeuE6ge89BJZo2eakBBtXkr9JxDzGXc
         xWVw2mgkg6VNA4HyRj7h+Q10ZR2CAe7ooGsmUXFIoyZiDzXtO3UFs/XQYPBZZ0NfhVd4
         yy3JctvKoCnff1frsfyK7euvo+bsyn7rhqbJDHzbjJf7PkDmJBuR7Z0KwwcUOPEKbXB8
         +p2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782414948; x=1783019748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H5SCzfZY+cZy5PgYB+6BQtHFEsZ/Uoh4sUu9a8QqdLQ=;
        b=i0US+L3zQHTYdXGk9oOMbBIQCq+yE5s/7q7KBBC18xADgvccZkdHSLt7JmKypIn8pZ
         xzfKw1be/lrTejloUx6RHQGKqBrs/yTeMt71H/g/NZXsJ9tiF91IZQi8vE22a6O851+Z
         8y9wIHa/6sSZMu5gebl2KUjf/4zz6kRMkXxH8Vp8X64EJiEn26SA4zBPBYXApSH3FStD
         Crq4b7JFA/rnoAGCf0C6qriP+dEIHGxUOB5SZKPrpcWVdEZdLhzAsyO38eLJLDQdcvCL
         I5cbOAJeNoepgJ0y1a7yfoOBQVlPp6lQHUPiPWLJrM2bn4f+wdhUZ9VNhOHPay6/MJou
         BZtA==
X-Gm-Message-State: AOJu0YwaN7VMhPiBul9iN6PYh7rZ1/fMzGDJVmMXiCtdWQKx6B9dsm3m
	5ogng9jiEIXYh+kti9GNrUktNv0AfugsmNBSBW+BvJc9P0G99ynKhPuFTF9SC6zov+A1qUmvgVx
	xRS4o9hAH6ADpwI6ChBzuvQqMH6fQmVJCqPZ7UF5Yzl0KpzdZ/041oKm0+HR8nnXHAty5NhaFj0
	dg
X-Gm-Gg: AfdE7ck1MBYxVlAxpOUIFx6y9DX+rdDrNlbBLkye35DllKX6KQirBlEM6zLU90nq98A
	wXwHuWNIbsaHlwlqKyUcc8yK0YJkzz6tRFwE/6LuSlbdS27N7tpqqX6cvu6MEdNIisZPO7qM8G0
	pe4MM35SwcqX0kiHzUgf/HP/T9ZNxjQy4nF7cFREN8STCQEKV7OgGxnNr8ZIoXzZG/m5wyDer2g
	m59Hva3edgR6s6nVDVt01H8mNYUFgVo3X5IsqYltEU/js5sECQktOWU2+zch/CBvMDZnKDEB1JW
	NAKsZyDiq/z5/BeXpZ0eFn05krbv2yj6gj8fSHBqFMwL6MNLf0bzrxreFD2//HihApCD5xC8ViT
	ehW/c2SZ0+CQrvQdN/6LpH/O7EKLt3t21rj4tg1bYvmkv5Gy3U/+AR1BEaQ==
X-Received: by 2002:a05:6a00:1a8e:b0:845:363e:12d7 with SMTP id d2e1a72fcca58-845b3ac25b2mr4424219b3a.6.1782414947748;
        Thu, 25 Jun 2026 12:15:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a8e:b0:845:363e:12d7 with SMTP id d2e1a72fcca58-845b3ac25b2mr4424184b3a.6.1782414947298;
        Thu, 25 Jun 2026 12:15:47 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fcc773sm5423026b3a.11.2026.06.25.12.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 12:15:46 -0700 (PDT)
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
Subject: [PATCH v2 3/3] drm/msm: Validate lazy VM in GEM_NEW
Date: Thu, 25 Jun 2026 12:15:35 -0700
Message-ID: <20260625191537.47965-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260625191537.47965-1-robin.clark@oss.qualcomm.com>
References: <20260625191537.47965-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Oip44zEHrcQml6lPlGi8q14oyP2AjUxv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDE2NSBTYWx0ZWRfX+S1XY9MCOi9j
 X3fYERBTW/Jz4ytThoeWGWeFd/0GdokTy6SJkByRVXVWlNVuOXbwcFbM8WcWVCbEgMIy+ZTJXKy
 wFmTNbQXPEh38nmM0VzqwGrfkwymh4U=
X-Proofpoint-GUID: Oip44zEHrcQml6lPlGi8q14oyP2AjUxv
X-Authority-Analysis: v=2.4 cv=R6Ez39RX c=1 sm=1 tr=0 ts=6a3d7e64 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VGCgC6sU4evaG-_1UnEA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDE2NSBTYWx0ZWRfX56j4088JEaeJ
 0JPNwCHVdAhIKzuXlA9ZjgHqEhQU0T4jCP6EkadSgEaLvesme2NIS3uRCSJWoPYsFY2KjHiMS8d
 lXI3urQEBMXJIjzg17LBsUiKwhTcY9uGGmEoz6tAt1acSGNd9CR6rK4VOQwbQ15Z4r7MU/+gAWT
 LYSCKtSNrpjo3lTrQqBe5ccZGVOxoDPuRQ20+S+xW6DKgZa7LuGQIc52tgh27oDrCzXifwAI0pW
 9ANozIFKrBJoyqzl5PfIE16jaGQ8VfgANPJqPqIxvSZ6s3mLc0fyTHTZDzXgFMFD3EFdIeXIr7h
 VzhZSaeP1HabiZqgfmtiTrgasKA2334d32G9NaA+ZVLlybF/iHDcLhPh1Oa2FHMGaY9rVHZLICn
 QEJr5SbxNogKj+i4YxQ5bpWP2dWLhreZ3etN9boqvIsLPIlnqo3SjCglTOwNab4LIWx9dHXDTum
 KVN3/vTiNf/jbDpBBRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250165
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-114572-lists,linux-arm-msm=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[oss.qualcomm.com:server fail,tor.lore.kernel.org:server fail,vger.kernel.org:server fail,qualcomm.com:server fail];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:robin.clark@oss.qualcomm.com,m:sashiko-bot@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E3B816C8559

Otherwise creating a _NO_SHARE BO before any BOs are mapped could cause
a NPE.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: b58e12a66e47 ("drm/msm: Add _NO_SHARE flag")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index efd3d3c9a449..733a094354e1 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1147,7 +1147,12 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 
 	if (flags & MSM_BO_NO_SHARE) {
 		struct msm_context *ctx = file->driver_priv;
-		struct drm_gem_object *r_obj = drm_gpuvm_resv_obj(ctx->vm);
+		struct drm_gpuvm *vm = msm_context_vm(dev, ctx);
+
+		if (!vm)
+			return UERR(EINVAL, dev, "not supported with shared VM");
+
+		struct drm_gem_object *r_obj = drm_gpuvm_resv_obj(vm);
 
 		drm_gem_object_get(r_obj);
 
-- 
2.54.0


