Return-Path: <linux-arm-msm+bounces-102045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MMPMtN41GlduQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 05:24:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7513A9657
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 05:24:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD138300E3B7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 03:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE72DDA9;
	Tue,  7 Apr 2026 03:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GEt+DKcT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aeiU+xzA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BDB374195
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 03:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775532240; cv=none; b=FUS3R2TCyN4w1f5LhmqHx8hIDxh/eTKfBRZACsizvBRtzjQYuksrpw/+bYFcGi/ZnSx6aZmJeMjzqwkGySCV4Ozq1O8CRyLjOJvMrSpLcuze3rvXarqWtcWHQ6bnUYRBtySBDQyCMD6LI7+1i/9Tie/Zmf6Lu6LoGIfCd3Kcif0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775532240; c=relaxed/simple;
	bh=worjPPj4ESVBaBV4MNEMASe3hAq2NdQk3yUJ68sqnTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=a7c4mUkoeUjRwtLKtcPqg/Je6JV5hsqqb3QV8wEkRtvYINiuI0YgeiVEJMqMUeUuACMLGN5A722NfDid76IpZ0uqau8UOtsz+vbn1i45gpN34Os5zk1EJgH4Q7Bw33s4s0RJOY6vrH9uzAULRCbORvbCfTXeADUzSdBFl/SPSNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GEt+DKcT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aeiU+xzA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQkwh1584872
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 03:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OK++8WcMbyqDqJRvkHrdUK
	BaMe3ofWql14darhFggQc=; b=GEt+DKcT9JCXfCu/QMCnfTshCZUlcvracIlddE
	YmMp0mMp1Jib900PZZAra22KI9yi8izg5L0W3vvl3LsCH9BT8zNdsHrgIetQsS7M
	ErCritSK7faQwtTiYO7WkNutc+o14spbUTPDi+PaLKWjcf59llozU/ONrHYKVeTY
	002W4lpM49b22qbJ+uAoTC8Ax1DB5PGYxieZxXNjQPRAEvTg13ct9mODSCdr236U
	m8MpA6m/nUqB+OXm0qGGOy78f963MlkOD+x8gmT6cSUPBN/aSqN8tAI4x21aVl+d
	vwGJm1/+JkXgPBKvV5nAkD4gO8dg64mwUaCnIIoKOaj/fY8w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr9rtms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 03:23:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso125421041cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 20:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775532237; x=1776137037; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OK++8WcMbyqDqJRvkHrdUKBaMe3ofWql14darhFggQc=;
        b=aeiU+xzA9I7VRDs3OcLvjuowHnY/l5/s989nnwHAZbjAftGfRk3dcQ2EVCKxgXTUNI
         b9kMzekCLP7opou2ng3mvYeGBDXtW03xPBByoX90Kv1SttD4flXnQf6ssjf2UBZFP7OB
         Q8889tpTWVhNnJ283Q32Oivs5vehO7Brt434jMk2Jp3ji/hpFUxpkK62YywlseAmjfos
         paysC6d9Al5P7MahhZJ39sFsFkw4Rq6MMETVq7ULmpbZXtfrwu9K+eLsV8O7vTh1LIuc
         /y9qYVmJA+qJszowJZDYbQ/4yJQWwJO37HECTGY7uX/wTX2vf7+ofmQ07/KZdbcYGoho
         RuxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775532237; x=1776137037;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OK++8WcMbyqDqJRvkHrdUKBaMe3ofWql14darhFggQc=;
        b=bu5EEWaPW1aaKywV9Wv3Eewu6HstULnEx0mtNVy37R9N5dt4O9SzggL+CafrChmQFM
         3rROQ6lo65+INPfp2qVFjy2t3i0TYxjKzKIywsB4xyUKtWqswI0qr1a3MKxJluQiBYoO
         yFnEmlg6l+66NcIxDNlenvvAryW38hhO4AyfImMbusxkawtmm6CfxdgHnMyBdV+JrYSZ
         Kg/4ATU6nd6953RTZkdHRMk+ZjdvnxmKH4VyOehpIf5SSWV604khzrPJGM3+sDT2CV0r
         wjs7cQfpz/psi0woCqlY3pHVbLzPjlIF7D6AFhO8jtwEj8YSOvMVBsAKpvcC39eKRr7Z
         Ssiw==
X-Gm-Message-State: AOJu0YyVkGjjiw1bg6cmjwgzhzJv0rk3J/cwT1uT1IqYydyrm1QR4ir1
	A4wLCGw95xAOuetTrpDRtItVNxegedWPeU94Co6gPk1oxmSXVOe7VCQD5o7m6RycQARNa+pGrI+
	YyDzqu8mOYWTFzJt7r7xW41pocHiVhvhQvKIQ4uyZgPtQUSSkL8g4DIlOqE3cR39mUsiH
X-Gm-Gg: AeBDieuVhCndWil5y++EbsbeNxOc99OEuqmBhL04PojsI+DsYsWGhU0TT6QTfu4wzV8
	pQVY8LnJa+8sVMSUeeV0hv84JyUnTcEzhqGeZiBZqLT6wrepcq+QlI81T2xe98q9ciddBWX4nIz
	AVBmO0D9TkKFieLPrvD8Lab79DOVvq7hUv5cDn2SkMhU3qjPFn9QQUdK2hDJYgJY8UwAJjM/Hx3
	j+gHgqppClSbvh8mq34IUNgDdnxQ8jBzB5tRPYJ7I1Is6vjgr73vbWt1b55Lf47yRLCIvWl3lMS
	FJjXhbSTAGrJJePDrZvBGwhcH/E3vung/Xi8/m06J+vTGSrXuT/CF9VZ4vFhYSMRJLxJsM6LSZ+
	J6/TZs7DKuAyEuT+CKocig/qmA5aJn0lCMfv7tuR9ZYxl+PGdqvIhtLbU5Ew6/YCyt8CG5xTwih
	9KHGArKCIvKntDoNVLoCDGMTeOKEepNyNRfIw=
X-Received: by 2002:ac8:7dc5:0:b0:509:202f:f03 with SMTP id d75a77b69052e-50d4fd24b4dmr235753111cf.38.1775532237205;
        Mon, 06 Apr 2026 20:23:57 -0700 (PDT)
X-Received: by 2002:ac8:7dc5:0:b0:509:202f:f03 with SMTP id d75a77b69052e-50d4fd24b4dmr235752751cf.38.1775532236732;
        Mon, 06 Apr 2026 20:23:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd1fff886sm30768591fa.17.2026.04.06.20.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 20:23:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 06:23:51 +0300
Subject: [PATCH v2] drm/msm/adreno: fix userspace-triggered crash on
 a2xx-a4xx
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-adreno-fix-ubwc-v2-1-7ff73624635e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMZ41GkC/3WNyw6CMBBFf4XM2iFtw0Nd+R+GRVtGqRGqHUAN6
 b9bcO1mkpN775kFmIIjhmO2QKDZsfNDArXLwHZ6uBK6NjEooSpRiBp1G2jweHFvnMzLYqVVWRW
 1FKQkpNUjUMo247n5MU/mRnZcNWujczz68NleznLt/bfPEiUao4w4FKUw+/rkmfPnpO/W932eD
 jQxxi9KCbVzxwAAAA==
X-Change-ID: 20260407-adreno-fix-ubwc-6a2564710e21
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1883;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=worjPPj4ESVBaBV4MNEMASe3hAq2NdQk3yUJ68sqnTA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp1HjIDXCRr5zKUdKi2UpZ12hKraipBs3O9o8Gu
 yc7oN+r8DWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCadR4yAAKCRCLPIo+Aiko
 1YQSCACIV5VUw/gWw2R562oWys03qBIMJyr2ym4v+Pg3fUrsAiIRATT3pSktxFBBM3n7DId+G0b
 83Fw2IdKcmLE83kLL2KEtqKH6t0L2sjk6/yc1mL9VwKH/uJXQLECUvhz2TWm0vpDv98lQ5P/PZW
 6RWB5uJywzfg7edo9NtTUCfQQ5RNu+8Zi62Dnc453Rt2eVbGt9kQRxNb1lpUTs8tlR6ZviCEoIc
 RWEz9u75r4D7r6DrtRRMsdyJZIwUqDWSP6D3GrYSj388eeOMJPvAMCxzn6yP+GN4G226xW1RSSO
 Nq4Jyzyia2TWyIqONt8Ua9d++lAcUkGXQ6Tpu8e0XR94LAXc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=SMdykuvH c=1 sm=1 tr=0 ts=69d478ce cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=5ICTkH4HVDsf0thFk5wA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDAyOSBTYWx0ZWRfXxd5qOH5mOlDz
 on9mnar0vxU/vXK0iN4vFFQsVfBbbQu4RtMUdCGbWwBIPXgL9n4HO9cAjVc51c5wPgb6yvInBps
 8FJGBjP1h1A9rvTwPAcmoo27BSJ/vyK+r0mVeXkyOXd5VR5+iYHahsmy/WCB+GfCoH1LL24097i
 b4/R+mspQzBFXZ4hYwF9kGQJFcr8LY0H0Kzr1N+FWBaecX1gm0N5LDfD8lX9aWXiEFnVhqVaLXz
 f22GgHWY/1qz4obO6royDWUf3W4eLC3OMFzDgKYka22LPzymxyMVoBdrWxflzDbev89ark/4bv4
 BcSAmghJHh3kB4KxpO8p0Xm/y4QeNqRIrPyUrPv3txkjkl9XeDNuM7niKaWTFU6R1Urj4sSsIob
 Qh9/QbE8tuqaUuMHNPvw1SlilGtrMGCOH/Y5nRiN08VFa6bfIbPnyQ6p757KVlH/XrFN5NSSkFw
 oc9YDhwb3aRDnSB7z+Q==
X-Proofpoint-GUID: dbKKwqyQ22qoC8YSJHNRwLoyZCprsS0d
X-Proofpoint-ORIG-GUID: dbKKwqyQ22qoC8YSJHNRwLoyZCprsS0d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070029
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102045-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1B7513A9657
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Before a5xx Adreno driver will not try fetching UBWC params (because
those generations didn't support UBWC anyway), however it's still
possible to query UBWC-related params from the userspace, triggering
possible NULL pointer dereference. Check for UBWC config in
adreno_get_param() and return sane defaults if there is none.

Fixes: a452510aad53 ("drm/msm/adreno: Switch to the common UBWC config struct")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Changed adreno_get_param() return -ENOENT for affected params (Rob)
- Link to v1: https://patch.msgid.link/20260407-adreno-fix-ubwc-v1-1-bb2b09450b87@oss.qualcomm.com
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index d5fe6f6f0dec..34e4ab43b0f6 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -426,15 +426,21 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = vm->mm_range;
 		return 0;
 	case MSM_PARAM_HIGHEST_BANK_BIT:
+		if (!adreno_gpu->ubwc_config)
+			return -ENOENT;
 		*value = adreno_gpu->ubwc_config->highest_bank_bit;
 		return 0;
 	case MSM_PARAM_RAYTRACING:
 		*value = adreno_gpu->has_ray_tracing;
 		return 0;
 	case MSM_PARAM_UBWC_SWIZZLE:
+		if (!adreno_gpu->ubwc_config)
+			return -ENOENT;
 		*value = adreno_gpu->ubwc_config->ubwc_swizzle;
 		return 0;
 	case MSM_PARAM_MACROTILE_MODE:
+		if (!adreno_gpu->ubwc_config)
+			return -ENOENT;
 		*value = adreno_gpu->ubwc_config->macrotile_mode;
 		return 0;
 	case MSM_PARAM_UCHE_TRAP_BASE:

---
base-commit: 36ece9697e89016181e5ae87510e40fb31d86f2b
change-id: 20260407-adreno-fix-ubwc-6a2564710e21

Best regards,
--  
With best wishes
Dmitry


