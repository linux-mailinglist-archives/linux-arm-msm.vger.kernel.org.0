Return-Path: <linux-arm-msm+bounces-109386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKOqALyXEGpTaAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:51:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F27865B8905
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:51:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 567C1306D40C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55AA937A494;
	Fri, 22 May 2026 17:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GseQe2s3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DRY7po38"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8337C357CF1
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779471306; cv=none; b=oWO4tgDXfkuv1EQ2Iwjyb/QFJAUpLS00/1T5A6/qjWi8fpj9CcgVkVR+rhNkcs/gpdFyI/D8ekS5p5zGWg0zje+aqU4AAwq7T3YeEgSVVAUNO8RN2rsrHQJcypdP0/uSBQiuV/F+/4CrmcyqQ5azd5yd/b4NARMxV8064T4yr2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779471306; c=relaxed/simple;
	bh=5Md1hzcm7OhrnjAQ/GlJVLxqZtYNlABLFKeWnLvV7Yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y/fA84idMkA75VrGoBQnJ4IvStrIh1VenSDK5Wd9r12I6lXhPWPlWVvyvMEaepagdl7uvC09gUoAul5UPGDBS0jhRXpi2C/COzw5HwCmwHcZV0RFzXbZaX4Ze9MBmhy7oulD5K8meL/XXLyORxfuEuZLOvmb6Y0PVBDS/ppYTpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GseQe2s3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DRY7po38; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MB6086776932
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:35:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iwPf7oJ62+a
	JHGIAyfRJce0NdbfHJ0BsASuIH0Plg9o=; b=GseQe2s3QLBUxzv3ggRxO++52ne
	wABQLquVe01M6Fhht9f8epU2X9CiZpjAHuoh2fxBvO2A9Zz/DR9Y205R4ASenNbW
	iZCJLqVb5SGG5Si5oR5Bc3R1Ag8qID1ApPXn9ekKcVd7Pa3h8XASO1dHEKudIrC0
	iTYnPouzrx+vaRQUqbUz65MUxVuHvulyv58y3csjwNzIyWCDxrR4jKjIRV4V6UVq
	RtQ045piv64SSSlBAAV2FkDKIwKPzFOvns0dqpRoNYR8Bxbv3ZkwsnkE5k1Yiyrf
	yQGD7hy+Ub6xwmBXGuAScVmY1UNMEY/lSOQ0VWuNUl3PcnIZ1v+taFPOF0w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea94h4nu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:35:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2babc42244aso177400665ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779471302; x=1780076102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwPf7oJ62+aJHGIAyfRJce0NdbfHJ0BsASuIH0Plg9o=;
        b=DRY7po38Q3lFuAmF6HNQ0yODnIhHrV6zVJmNsRUFDY8VyaN1+DBari1UyIgF62Dir5
         7KIFGE9TElAv6YDa+e/ZE2DU/aaxIp1V7QnTBQ8Z/gLMfo3urAJKkZ74hTt9uEM+xP6y
         kQjkyP116oI+j3N4/Wgpu9Z+aRmB+vwjpGFt+aDIsB6P5nl8je2DTiEF5BDdRmBo20qx
         9yNkhdtODH/J/aagOw2yWQMaL3q2wdXmxoyaIQYyHlCESFbxRcAJkSSL+cFP/ERjsL7L
         HYL628nJ3Q5pewAl6d5KI1djBlT3KRANZIAsUu5uV3brYFSl0t5g4M94u1DacKQnYFWe
         YcgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779471302; x=1780076102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iwPf7oJ62+aJHGIAyfRJce0NdbfHJ0BsASuIH0Plg9o=;
        b=cp/13x37394ZAAN+rGMVpLlOmjnjgTVruup2Jgpqg0CUxzwaY64mpIdSA22fG6L308
         OLkKr+Y+a92a8C9qj5vx9NmJ/Y6+kU773MvYh0jjksHxO2xGZdybpuGuYdu4OsRf9arj
         qEAeySFROxI4L4A1lYAIi+iWNoT+IxgblpPRxOJ4+O/52bVpR3fGmvgeMKGWjc4MS8+F
         rNXh2HP+o7iJVKYOv+4dM5yEnZaC7DoVIqpKhFn8bdisGWtMH6zFEZc5r7r5na4835jt
         Ocd+zvr3Ow7t6acQys3+vaui0YZgO0JvIVsIGWfInAnWW4fotiLhuumzS8vbggCilrht
         jzAQ==
X-Gm-Message-State: AOJu0YyLag1rxhGWkcL8naOw8RqumNzvWyXhLbvmh1MuukaqKh53Is1I
	WqWDk+tgpRdavirxpnckgqBo7ETCJcyCi2bI9qGIMFyrmkts42JWugdWqo4X5PUDHC/VeqtGVoo
	2HkPqHQ4haFajvwalvvK7V4mZjjAkp5wgPBpo7OMUPGB3Rqx2KRCQuGGrjjR9JLSOScQqA5Er+4
	ZP
X-Gm-Gg: Acq92OH1MmJFA9YViLfGqC+Hfa34R03A61v6prKDmaXp2LZ6SdMi9W6FNySHfGULY3e
	gxATzY2y9EQB3RmiqfAvfJoKWCyupQ0Ecidcu+59bo1/ggOYkbrySSSVj5r5YA8UweeM0a9oTUa
	SFLrWBShR1uK6WqRx29SzYiKPFvk54ux4LXMahdxd2hBL+5+4FTIFty1DsfMw94Q3C4fKSDxThR
	HPR6JA35Z8aVoxWZnNuYyrIP8h2mt0FW2nDm8LsO3Wv7xudr/V04OoW8kki4Mx4p0+4caZvPrRK
	g71kuDORfTcdOhSEUeJZ4ocVeTn7u8kXZAbiTnp1tmMQ5jQEWebN/YGWEd2zkyw5A5sfA5sAZHL
	as3hNcovQqjC0uW9+hnlIGdZJCcjsymRzp7TK8eJD6Kg=
X-Received: by 2002:a17:902:ef10:b0:2bd:6732:6817 with SMTP id d9443c01a7336-2beb05e291amr47621805ad.23.1779471301980;
        Fri, 22 May 2026 10:35:01 -0700 (PDT)
X-Received: by 2002:a17:902:ef10:b0:2bd:6732:6817 with SMTP id d9443c01a7336-2beb05e291amr47621415ad.23.1779471301483;
        Fri, 22 May 2026 10:35:01 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58c31a3sm22677045ad.55.2026.05.22.10.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 10:35:01 -0700 (PDT)
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
Subject: [PATCH v9 14/16] drm/msm/a6xx: Increase pwrup_reglist size
Date: Fri, 22 May 2026 10:33:00 -0700
Message-ID: <20260522173349.55491-15-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522173349.55491-1-robin.clark@oss.qualcomm.com>
References: <20260522173349.55491-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0IuiYmSIzvBW-wnhqb5WOGabaCi2_WsP
X-Authority-Analysis: v=2.4 cv=QblWeMbv c=1 sm=1 tr=0 ts=6a1093c7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=QVKJPBlc5dbYwvk_-wwA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 0IuiYmSIzvBW-wnhqb5WOGabaCi2_WsP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE3NSBTYWx0ZWRfX3TNxnVKhtHzC
 SdZTQw/eHEl0NStda1dNY+acgKASQxI2tdeoXPYwuzv2Tt+pbtDFCuOoPQrkYyJtO7cYuQZx7uV
 gIOPAweqvtUERszF7pZvYzIipI/8HkW8RFGYi4FEHedk5ul6Vz1fWWw5MFNLNbTKLPS1pNWGX4V
 hY8+wQGCi8p4E9RxMSYIuBk43/sHNsZCF2xTGwFfJt6mQgy7IoABN8+hPaM98rr0XsLm72fXHTp
 BMR6ZHSadDRg/fyXgngKhCcqbPftVCLX9k6hNhVwWT27eaiZHIfXRtHOiQlut1tc9qr2A2QhBrk
 772mwyWRc9ULCUM936ZtW3/e/hgiljxFdw/gAcmlF/Bt3mq5yX37HXyLGPQnZUI9p4afmeFuraB
 /hT7Gg5uW6JiIhTj1y+vq87Mog1L0Tua5sBMHUFveuk1Lb6TRxoEy6grarOEzPOxrrf38ubdcSG
 vRltnL3Y1SmXL1e9vHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220175
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
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-109386-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F27865B8905
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


