Return-Path: <linux-arm-msm+bounces-111573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dWZvFdF6JWp0IgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 16:06:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A03D0650B7A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 16:06:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ICccRE2a;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AP496Qgi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111573-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111573-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4ABEA303A8C0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 14:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29759380FF4;
	Sun,  7 Jun 2026 14:02:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2573A63F2
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 14:02:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780840928; cv=none; b=ioDAGr6Gn+hTBHkhHQOfX2i+7rtw3oTqRcrwIN7FghXlM4gem3zP61K7pLTaTADd49GVM5xfgt4vN5WnJIEljw2LrbshifkABwX8k2ZzjbOxRpB0jmwnrzsNOfP299ZfyNVU4WmQQJdiffrEVOpBlHjdBGiHmq0i+5AIbtQuIzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780840928; c=relaxed/simple;
	bh=uW+35qOnb2ZYnJq/hxZd+udgEcBycKJF6VpnI+PQTuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ngGv+Vd74xIkukai98/PqNusQ6IHw1kjt+EjX+Uww3ApFCndpvSCr5NR0W+fVBwlMPTKS6CRiIOMhYqGvMDfav4dTYgPv358iyXjiBDPbQCFEtXMSA7/5wdKAUhjG836K7uAJkZ77QwYM1Ebvpi8rJQGyLPSbzYPlO5iXyJ1CZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICccRE2a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AP496Qgi; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657B36Ls417844
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 14:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=p0pKjfrSRwq
	eE20la+/GnMQ/TJmUHYzFGb/Fleo0bCo=; b=ICccRE2afsq13iYk7SpzXgkxyab
	Wc7O+zlgXAPnECXY/CeCpKhXB4GQGsz6ng3Apaw1uGLu0j97u+ydsIrHnsJz8GJb
	zJFGl3Z6BBr6icV8Y8MBuWvWw9sXE71vlUYJhe0Q9KV9dd/HXzM0jq6smDZPdK79
	8FsWiImePGYiGK25ttSXdMpLxaJMXYkDwnCkvnAcG7EYh1aeRIAIz3nULtPJ6XEr
	SR13/xwdTSuqv0o6HAal4UuSE7PDq7Ttir7lcfiCUmxWsLw+jGjWvfhId/0UOVc4
	G17CiCFikTWW5rCrmMtot7D3Ejpv7ya2dRHBm58PCX3JBsEnsFTsP6daDOg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w42jw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 14:02:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d99333358so3438121a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 07:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780840925; x=1781445725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0pKjfrSRwqeE20la+/GnMQ/TJmUHYzFGb/Fleo0bCo=;
        b=AP496Qgi0rbsZV2QKZtAMB8U1JYBKFHW2s/KrjlUZuHqMcnOICRhXHH0fkbpj1s5oZ
         ZfHJaMa+Exw2Av6s5kIU/bWgVnR4L8XhZHQVNLfsoLHhOGYHUYBMFo34Kai5jZPuiDVr
         1Yq167FJFbKOD0Zmw8bG70Db+VY9NtOl7Y+1dHedUZXKTHV5BWysaURxgYzfudYb1nfc
         W0rmEgDqELIBjR+A3p1zUCPQr/gFaDJmqI25cYli1NkgqgEfk9hQ+WZplDvWvFY8Awvx
         ItVwEZmJbuKzYm/FZFYZykcaOJyWmI/9eErWBPHYbVzGmnPbLMLE1CkpYK1OZXwww++Z
         w6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780840925; x=1781445725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p0pKjfrSRwqeE20la+/GnMQ/TJmUHYzFGb/Fleo0bCo=;
        b=iXMKIevZmxpcaSoTVHx7ARLZHYJczTLaZ3vPJIg4e0WRp96XzQJnvyhVrsiccdoks9
         RGwAFw+Xr3RIMBG5gVLZb7zqy6NJPYaYbbm1R35XOBAbLlniZfii8aLCLWXnDL27KP2C
         5DjjEH/7JG1lv1YXsXrXhwRgvFFz6j9XOk+0UdqEDKvWMbjGqIDfQm9unFQGmLm9Usbn
         IV9CpU8eNTrGDTWVVwgsUmBy0R0Q55wOP2UdUtF2ayqs+s9OQBGU81jq/CPmErCqpk9c
         hsSGqMMdQpmdh/i6qzbXhB4ge6kGzGKi20EcB1lQX1ixAYocU0OjTBIqe2/smqFjrcks
         ySsg==
X-Forwarded-Encrypted: i=1; AFNElJ/tXPwICZrnqez+VPvh7Ptm2olz3sNG4ofFphJr3a5Lq0mri1U95bNmwCtguXViOuQWw+D9txKypUbykE88@vger.kernel.org
X-Gm-Message-State: AOJu0YxkK++BpbaPUk7XELleBUEHsc/EkbOtm7TPDdVs/kFuJudEufLt
	pKNfP2t/5/JTxFTI+tGKlMvDv/RXdrVxXFQWAPO1988SONjc0vPpZn3owbxDOhYQWJ/AkQ8PENH
	pGxxBHGraaGujGYkrffOEXOA0vvUkchBF+EfL5feCNpK7R8C1UGtk1QvfSqP6kLKMIQCO
X-Gm-Gg: Acq92OERopOJed7HT2Sjz/LJtFX7Pb7Bct2az//gEypkA6vnZFux+bng5wrYRAQDQaS
	JhCzaArkCgqg+a1um1+bfHpYvM7uA+6kU2g56AsNDz3BJ2MNBLsEfh9Jww/tUXmOJlmUi0tSKd7
	Z77Gx0Ez6UGSDq7aCUQHvzOQibc3xWWY5o384j3VvlwQFhh94zj/UuMIZI0dUWB/E0V6C4NEHyO
	LcYvQ0RtMfVdKQTfHaboDOm2PZTgqCyfcymmyQua8dLcNRkvI0KocLnamS0jsQt1gVsaLet0q+o
	53R64HynlMH31iBVH5g6zzka0y/4CX5xFcXJB5d1aAdRF98NsTkMEFDiHJ2LybwuoGr1JGW8624
	6CiOBuYRz/8a+5839VlDEwGE3FlxEz4vdltyiF9WsNFk=
X-Received: by 2002:a17:90a:dfcd:b0:36d:b12f:6143 with SMTP id 98e67ed59e1d1-370f1b09906mr15074529a91.25.1780840924827;
        Sun, 07 Jun 2026 07:02:04 -0700 (PDT)
X-Received: by 2002:a17:90a:dfcd:b0:36d:b12f:6143 with SMTP id 98e67ed59e1d1-370f1b09906mr15074474a91.25.1780840924385;
        Sun, 07 Jun 2026 07:02:04 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6dba8064sm12794126a91.12.2026.06.07.07.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 07:02:03 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/msm: Validate lazy VM in GEM_NEW
Date: Sun,  7 Jun 2026 07:01:58 -0700
Message-ID: <20260607140159.137068-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607140159.137068-1-robin.clark@oss.qualcomm.com>
References: <20260607140159.137068-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wx1pIn1YW7_P_XH3YV8pmTgtRjriEMvT
X-Proofpoint-GUID: wx1pIn1YW7_P_XH3YV8pmTgtRjriEMvT
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a2579dd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=VGCgC6sU4evaG-_1UnEA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDEzOSBTYWx0ZWRfX6mgnAbkctoUN
 sNZttk71l1sGrOJVvBY7gsJxUVeL9ChMKm0rpTKDXeBm7b7cxFRNObvYAB8AOHfSgzWuxKdDtE8
 b558YaJbMFIt7tcyNThvKA3tCZg/G3PpAVIAGm/euS254KBGsw2SKCkhVjicXoBwqEn/oaluVkT
 Q9bWx1biZWHq3kGUVJfHK32r4UJt9s+8WzLxW3EYmjn/n+LyDQhnh89THOOqYnC+yB+clzWPIQh
 5P9giiDAoQWfyCPPkxqKlx7hz8zvVnPlEsMHFEa3PG+qndpRqNQ9RrflkYRSa4rjNEOf/mh7krP
 v/1BPTkMHNuUrVGlIRDiCZa4A6nz4zttMdUjmw5AOrLysZILKEIty+QL0pZG+rOmnDKJeQpdZPy
 nWvnQCVN+135g9v+00j1G2RHh51GL41fQxi/qxSI10Pa67C/Q3DRwr3LMGmUoBbNBroQu6PwWwW
 LxjWa6tz/AHXopBmnTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070139
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
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-111573-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:robin.clark@oss.qualcomm.com,m:sashiko-bot@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A03D0650B7A

Otherwise creating a _NO_SHARE BO before any BOs are mapped could cause
a NPE.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: b58e12a66e47 ("drm/msm: Add _NO_SHARE flag")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 2cb3ab04f125..ef14ee66c6c3 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1148,7 +1148,8 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 
 	if (flags & MSM_BO_NO_SHARE) {
 		struct msm_context *ctx = file->driver_priv;
-		struct drm_gem_object *r_obj = drm_gpuvm_resv_obj(ctx->vm);
+		struct drm_gpuvm *vm = msm_context_vm(dev, ctx);
+		struct drm_gem_object *r_obj = drm_gpuvm_resv_obj(vm);
 
 		drm_gem_object_get(r_obj);
 
-- 
2.54.0


