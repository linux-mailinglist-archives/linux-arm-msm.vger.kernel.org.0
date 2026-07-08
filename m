Return-Path: <linux-arm-msm+bounces-117782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 25wZH0eLTmp5PAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 19:39:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ED572949A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 19:39:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eDO7R5h1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="NOTJmqn/";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117782-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117782-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35C4430D4F90
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 17:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC6B4C6F0D;
	Wed,  8 Jul 2026 17:34:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FF84A138B
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 17:34:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783532081; cv=none; b=HqULn+fK/oynJ8XJYa6MPheS9ryrzXFc+WrVJxoS6/YWwjDU8qikFS+5KeOCJpdW4lKWzcPBl/J1fZ+XuyaHB9LokAgrCMXTm/mREkB3as1u6+d/eHVO9FvcUB5/goaRBJtrKw0m/D/xuCzHtUM7W4JgMvAjpr/doViipzqcNQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783532081; c=relaxed/simple;
	bh=I9tJsv2yZxCYpVVJfepNuH5FBHbvsIcfOdgszmUj7R8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K+tkXP3n7TJgZjF3V5VUrD6ddJaDpM0EYdqGCZEcqOrIu0FbsU4z3j/VnOj4FTg4v4MHR4ny2g0d8f9Aw6uuDmiRUEGOnyW1Ebs1BeInmEEi/VKOpyku61yZDJh2yHaSP7chQf06TI0T/ywSKT2RhL3MTsfF9YHXgkNw4PiCXKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eDO7R5h1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NOTJmqn/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668GLCEc3256486
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 17:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EhQM9yoBxVO
	cZmBC5qd4hROEhHqhjZj00aJ/HtUenEY=; b=eDO7R5h1OuGhxKu3dSrkemvFIxD
	x65fp7ISvzqP0aEiy94TX1nRtV4ITGlqkFhFWTr2zEKfFkI8JbpItIhfgZEYO/5b
	BayJiS3GebAZ2VcHklou5UhFennNVuDBhsGYmjuD2mb+LTXRtpr8DwB7pUiYw3NY
	SPn3aNcpku0XXp2ddKHi0thMtsJ8in+YtFVzUW/9hc3BaMV8uH56eez/CnuGlUat
	Cgncs8wjOq0Ikys0JaSLt+ef6TYzMG3cQayrA7EfmWMwqeBiBah4x8PfFQWORS/I
	4rsdKPdjjkYE/PIJtj+/9jACLAgcAqBUQUsIzkkUHZyGTiO7LEAzM5Yhhqg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqw8dht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 17:34:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccafc5e82cso12925435ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 10:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783532077; x=1784136877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EhQM9yoBxVOcZmBC5qd4hROEhHqhjZj00aJ/HtUenEY=;
        b=NOTJmqn/RRgefhZ98KEntW8GU9RoxXckYBJPsCgk/4X5nT8xV5H3nmjquZZTJLCKNV
         mSr4OusGl7HcKIooA8kiVPSSWnI/Chh8Ohadtnfu1zM5Pz6ST07Otz5mFzcrA/go7456
         A83la3QsGXCiaFwPrfjWTcu9B3fXTfN+TVinCxgkX/NSHkl4ciCdw3RE23GvCie32jWy
         +4cIRPe4R1XErVeeFjWHdhSfGtwgT1PO+wPEB9ebSv0AuI8rlMpjIc2zz0I5Me4LDp9B
         l6iG0/CBGEwlyEAXXRpAw4FImEVgwP/NMSa8UAvY7BL6m6uKG99dII+aCdxlelSw5IAd
         kvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783532077; x=1784136877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EhQM9yoBxVOcZmBC5qd4hROEhHqhjZj00aJ/HtUenEY=;
        b=LZvYEqomnQHd40Wb5ozpWhqLfmA++DhXV6o5vzTcDkxJX2MKlgI7lgzziYOXf8fRCn
         mcPiw+j0xx/p9d6Ym01wsX3IGVR4GgKYQu2eAMYXowEpBIFN4buMPMJZwvQtPiNzouI7
         uJroZGjxWboJ89zrv+AXWRF7tcFcSrmL9oRDeit4nf/DQDkjz0g+bZudy5P2AxFyCUS/
         V4z2ATaCYOnU3VxBDUN8NNK+F5ZorMqyuXr9ftQEVyRms50fmHGmzmrMaI2fdlZbjgRT
         HOzyMIJVpU6tAuHEzhiIUKH5Yck9scDQWdTwCMP539d3no14bYWzB6/T9pIykEqgnzoV
         0k6w==
X-Gm-Message-State: AOJu0YxxZF8xtlZNXG3VWrW6NQcuclHLxVoqfh8VwNpXoBFsbtDWO7HD
	Qk3dZmlDRFktsIq5+K6Xw6N7Op92veEV6HrJ7DBVxVNRN4wrCl7iHkfgRoHPwGQBYQECdoAXJSD
	yC72LrRDn5w80rJ4t6zIo//UmjodXDDYXx3a2YTlb533iG5+TQfES0GXHv1CKPlTvGvU5
X-Gm-Gg: AfdE7ckeRrmDElcpL2t9tmtI7lZHKEoBcWEmy7k+xFaYB4OflWazKJfT9WfepC2zU6q
	0w8PJXsY58Kn66zzJMH9Uhjt5wf+UER2+oTZPd7giuv3XNtktlUAgbv86cMo2qsNHuhEMmyIOmu
	yWw/UMcor44Z8k3iJfhFFc8n+hUdjf6t8L6tnoALaqJ5jQYY77dAgtHj16uC2aviGkgcTlgpUzr
	n0HFXNBDYjUTTJ5MaH9lTvJI0FuEVzZrwDrG2IS4xwMwrksgLjxibVUyTGF2zDKTM052B12EUuG
	SGcxG/qjtYjgHjkztbdInoDNCC7p3AIIKvTncQ403q35b5W7jnhtmsr979FIKb9xyI2u5DbmrDn
	IGGzNeTi8acU63dND5c/v/j+0/lvrQUK/LuCHpMkcHkhSxOD7GApIMmh3/Q==
X-Received: by 2002:a17:902:d48f:b0:2c6:a981:b591 with SMTP id d9443c01a7336-2ccea40c7b2mr36562125ad.30.1783532077021;
        Wed, 08 Jul 2026 10:34:37 -0700 (PDT)
X-Received: by 2002:a17:902:d48f:b0:2c6:a981:b591 with SMTP id d9443c01a7336-2ccea40c7b2mr36561855ad.30.1783532076592;
        Wed, 08 Jul 2026 10:34:36 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d57bsm30956125ad.59.2026.07.08.10.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 10:34:36 -0700 (PDT)
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
Subject: [PATCH v4 4/6] drm/msm: Validate lazy VM in GEM_NEW
Date: Wed,  8 Jul 2026 10:33:52 -0700
Message-ID: <20260708173356.578713-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260708173356.578713-1-robin.clark@oss.qualcomm.com>
References: <20260708173356.578713-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE3MiBTYWx0ZWRfXx39hlaAIhpAx
 wNRxF/GskBJr1vTNiHkkLCO361t85KGR2CjX/LeJmAihHN3/IiXAEe/M+wxFqcSStOTaTAg4lWC
 r5k80qPFmk/lGNNgd8burRVJb1AS8RqMpjXKZh83kOSJmxoGw3HEengOTV6xk+HOsv/OBE1xPEq
 zOOwkTBVvPuIU8etrWyTTLZNjtWcYMJ7gzKbIIG7V5WVSuA3xz5JhEGrXA+WQcfGIReOoPE+J67
 5H74rx+1ycA4x6mqlg83uDK1sz1GtF3116kF1jxweXfpbXuLLnNp0alsLFOEXPKn6lJjs7XrU9w
 cY8KegWDpJxs9cpTMKvyRdUqww0X7elW22uQ99nyATH7ql5lv5r5auizGGJDJKXmhMZFBlXDnv6
 wrXwldkzHbpF4Ctn6mMK1xJjSKt5Qqqs6LzF3WCWWm5mfdWZg9GU1KPl6rcEeDBbElHVnK1f60C
 G4gz20cKdeW/V0/XxgA==
X-Proofpoint-GUID: OebOCvEUFRV4vkKyYNEYwjQBVy1u8SKq
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4e8a2d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=mcLY6QNbnPi337aWdgEA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: OebOCvEUFRV4vkKyYNEYwjQBVy1u8SKq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE3MiBTYWx0ZWRfXybyZttesczHZ
 Rwvofnxokxfdk2Hn6HIL/k4x1sC0FYL5jje56KHWYAwKz/JRwcJm2tnm+drWrvgBSljE67s9N/J
 cvBp0FwmUO5Iu3dVK0mYAI3w4ssox1o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080172
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
	TAGGED_FROM(0.00)[bounces-117782-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C8ED572949A

Otherwise creating a _NO_SHARE BO before any BOs are mapped could cause
a NPE.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: b58e12a66e47 ("drm/msm: Add _NO_SHARE flag")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index efd3d3c9a449..4442cfa55b00 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1146,8 +1146,16 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 		msm_gem_object_set_name(obj, "%s", name);
 
 	if (flags & MSM_BO_NO_SHARE) {
+		struct msm_drm_private *priv = dev->dev_private;
 		struct msm_context *ctx = file->driver_priv;
-		struct drm_gem_object *r_obj = drm_gpuvm_resv_obj(ctx->vm);
+		struct drm_gpuvm *vm = msm_context_vm(dev, ctx);
+
+		if (!priv->gpu || (vm == priv->gpu->vm)) {
+			ret = UERR(EINVAL, dev, "not supported with shared VM");
+			goto out_put;
+		}
+
+		struct drm_gem_object *r_obj = drm_gpuvm_resv_obj(vm);
 
 		drm_gem_object_get(r_obj);
 
@@ -1157,6 +1165,7 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 	ret = drm_gem_handle_create(file, obj, handle);
 
 	/* drop reference from allocate - handle holds it now */
+out_put:
 	drm_gem_object_put(obj);
 
 	return ret;
-- 
2.55.0


