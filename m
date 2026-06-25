Return-Path: <linux-arm-msm+bounces-114580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kDVTGKCrPWrH5QgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 00:28:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB02C6C8F79
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 00:28:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=j9FEKbYs;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=i+d9SEfp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114580-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114580-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2D563085FF3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 22:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A126384CFB;
	Thu, 25 Jun 2026 22:27:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C3E384CFF
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:27:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782426478; cv=none; b=iDB12b4VvgkbU3hbdjHD5SV2kdDFjy2Dx/LJsKiIZrd6hpdUn20bODQleEaO/J97irOwL+/su1z/9FWXmwJ+2DLHgEuEENU013hc1mjES9boHt+Aptl3o3yd9IHiSayPthPUX+lsSjhJuEkWGgxMo7vAnl2D/6jukDNDwZhmy1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782426478; c=relaxed/simple;
	bh=78QZi+j6Y2VyxhafxfaICkEDWefl3Eh8NkMxLY818SM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ITtCEeV3MoniwBglegbbEWNQrDPioo/XJqZ8uPDGTazT7gLpvlL+Lq8LvPRzK9dmkI/QDQ8xPZ9Z++Es9IbIclkadu8UW+5GNsqOZ2MOwvzHVpfEiYqJ7ARFyADhle4xPVVhqfH8gLT5N7ZHxYUzKPe8Jd3uijlM+GbGQDwgp9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9FEKbYs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i+d9SEfp; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PIQPPh1196373
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UhRPqBPtVcz
	hZaFi2XBpS+shrYhW3crlCtWaN/PGJnQ=; b=j9FEKbYsqGek9p/xF1e2n+le2BM
	ZuuU0Kyskzn0t3W7r9giUcqb/ZatXEkG2pASCI41rYD0YmAeu884us7ZYLPVi0aB
	xOeE+mL5eQV7l2/cGAynGCdGYV65iH9ddTIGp7p0tnELGmbFCNR8gtpetZJBkzk2
	mkYIlWHhJSpzYHn3WdE2G0YpuEKq9FW5rhvLGGtzMqxlJIdp/52pRfsckRm+ODLp
	Duvq8VheQM7gWAaO1osEpi2Ng9I9t4Vpp5pA+DfSs3OUo9w1HTvrmZIrLZRYrQwx
	/0JFA8CBqoWt/AOX7tbcUkK+hqrFd6WBqttnsFabZP4uiZads1HS5Nlnhxg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f19m3rr8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:27:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-845317fa7e6so366885b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 15:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782426476; x=1783031276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UhRPqBPtVczhZaFi2XBpS+shrYhW3crlCtWaN/PGJnQ=;
        b=i+d9SEfpf8E5uBPCoivnz0/1n8lhZaYGRXTo0ACcoG8Q5U8zTpXRgwXc+dTKwamXOm
         k4dxCZGguAfy2QF4DS5OYF+ywLqkqzHDZc0J1iGFt9z8HffRLvgczeHHftviE5w0MM9Q
         ye5xlruimIjE45YR1Bj2fWJhlka+jSYszYVWMyBlCaf1Ov4bKlLW+59ULLCVtWRvT2i4
         RfVwhvShVGq+4VMiNCREEW3cJEYBX+Gq1CumaZRYw86MqSjDsbcdkqZCcD0fz/CI0Qi5
         TLQERr9WQ+JM57lxOccG9C18/DXYxD6/0e+fR+u8mSzLNS/7oZE/3F6253vGsKnR30/y
         lVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782426476; x=1783031276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UhRPqBPtVczhZaFi2XBpS+shrYhW3crlCtWaN/PGJnQ=;
        b=gwYYCgladL1ODnvn7hdXOepWcn8IdA1+ALaIMJqWSCbKNvYk2f7TcKJF/fPOsDnP+F
         LrXbFC4zcGRLp7LdqJoXjiuVCSnvtQGuoU5Qk+tlBqXm6Y3N8NH6An0OF0p9CgeZB0pF
         Nbjgty/GFTSb6m7bhKDUxrCFIX7cwjV3LFVfGqeg6tHsuWjj0o1TmzwTMHBtSgKjdot3
         A5yKl8vW+SsDSo/3s9qjAs7EqmzFfnJBKRgK7OCnQ2CtCQ0OYCh3ONN7CkC1npdbWUTo
         2sUmpPrJSmHkhp3FbdNIo0xycRemuPLkJsGsbB/cnlT13CvBXo2Un9ohKYsiQ6p0lDro
         SXJA==
X-Gm-Message-State: AOJu0YzMjw3dFHl6XU5iwmkpkICEhrVd6Lwc3ccQ2PdmyQ3X+j1XEfwF
	Kpzc7vYv+J0K3NPMZqn9w0i6n2mGctSTPwFVM18nm7V6RSzJtvX17ymg3NCyfTiI/RO7SURhzS9
	QnUd+zodz5lR6Aj288HuYGr+TNfqcOgSd+FYAv6ufKoMgmY2eyhPqGiFILEXTklMo1Qhio7Lo02
	lK
X-Gm-Gg: AfdE7ckp+CbbmRz2pLq4cG/++kGvmFJ3GT/yF5OF+8EzKlvD+xVHAIvxzNeIIoAsKt4
	63Zl1uc61H8uQpfqFy5zJm/iK/+4SPinvfuFYlKQ+wScfVH/gTXXl9pXiIevfumuIrHVKeUpppB
	HKDpO3zWP3qpkKFgMl9YlwBSPGSvmCf5jaM+ZNLBXIcmMiYGPBUk2CPFVTbIc8uedYFM98NqINU
	UibNLYODKqFxDkuZ1f/uvfZOoKLTW0C/82bDZzq95BWnjClumlkfm/W9gb2yXwE9RLuDcX/sY1B
	4Es/XDocd6dhPncL/ltmswBbKct0T7cQ9JPojVaITtoMgSPBwhLxGeHq+Wm0LP4oOgmaku8s7m3
	/y2OGJvuPuolfKe1GcJJW9Xr9RrOK2TAbQNjcTVPivpPi81zbZ9STkNQJCA==
X-Received: by 2002:a05:6a00:919d:b0:845:beb1:f05b with SMTP id d2e1a72fcca58-845beb1f4c6mr2206048b3a.45.1782426475780;
        Thu, 25 Jun 2026 15:27:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:919d:b0:845:beb1:f05b with SMTP id d2e1a72fcca58-845beb1f4c6mr2206022b3a.45.1782426475388;
        Thu, 25 Jun 2026 15:27:55 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fcc773sm5625925b3a.11.2026.06.25.15.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 15:27:54 -0700 (PDT)
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
Subject: [PATCH v3 3/4] drm/msm: Validate lazy VM in GEM_NEW
Date: Thu, 25 Jun 2026 15:27:42 -0700
Message-ID: <20260625222744.22254-4-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDE5MyBTYWx0ZWRfX2oEOaZLD7+u8
 7BjufZixcrw+nBXwNZjPq5J4xY/XREm9A6ZMKAW2WXasNn4p04M+NmPjtpN4OgfXpIU0n8rdSMo
 BDW/x6HW2ifL9HkGIqFM5rOFY+vH/ss=
X-Proofpoint-GUID: F0iOBSrQNhdsdo5eyBqmXlGD0Y2WwfMS
X-Proofpoint-ORIG-GUID: F0iOBSrQNhdsdo5eyBqmXlGD0Y2WwfMS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDE5MyBTYWx0ZWRfX/X4Rr6AHAvJU
 uG9wP5hWjAMwF3IZy5O4AudIrlRgZNlak7Qi8hCAOXbHiJ9KEiuweSFEaXeKkSN2V+douyrn/kh
 JHbtLIUQrVynrHWgUVvHxdUr4MLs2Qxe4aTgVgHqwhdqC1/UGcNJDOl+hr32wzwQKOzEA7+L3bO
 0bWmCyq2wYsUna9vFku4C6rhSOEuBIMnk+4FRk21RK3yXZhgEXgxlsUPOeV7VZeJ3elI6FY3THk
 m+eDpS51pOm1T0lEX1plj9DnV4ncFlXnPkM0uSp+8RcwELEQfViz+U6g24mM8BASqSuCNbMvIvU
 FdGlsbCoieJUIsS+UqQGmjt0jpH+ojClQQcAJ0ygeRjOCg8uZWHaUOI9ak38ncEdc4Pl4C/IA6E
 KKfA1mhkawgNQH48gzNHtOW67X4il8mE3jcvw4HQb+5evEVjYztjdWeukXGYGNL8+8XRpOUFm8x
 YY6Lava2eSI/fAYQ0kA==
X-Authority-Analysis: v=2.4 cv=Vv0Txe2n c=1 sm=1 tr=0 ts=6a3dab6c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=mcLY6QNbnPi337aWdgEA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
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
	TAGGED_FROM(0.00)[bounces-114580-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: BB02C6C8F79

Otherwise creating a _NO_SHARE BO before any BOs are mapped could cause
a NPE.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: b58e12a66e47 ("drm/msm: Add _NO_SHARE flag")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index efd3d3c9a449..3ff0399c020e 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1147,7 +1147,14 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 
 	if (flags & MSM_BO_NO_SHARE) {
 		struct msm_context *ctx = file->driver_priv;
-		struct drm_gem_object *r_obj = drm_gpuvm_resv_obj(ctx->vm);
+		struct drm_gpuvm *vm = msm_context_vm(dev, ctx);
+
+		if (!vm) {
+			ret = UERR(EINVAL, dev, "not supported with shared VM");
+			goto out_put;
+		}
+
+		struct drm_gem_object *r_obj = drm_gpuvm_resv_obj(vm);
 
 		drm_gem_object_get(r_obj);
 
@@ -1157,6 +1164,7 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 	ret = drm_gem_handle_create(file, obj, handle);
 
 	/* drop reference from allocate - handle holds it now */
+out_put:
 	drm_gem_object_put(obj);
 
 	return ret;
-- 
2.54.0


