Return-Path: <linux-arm-msm+bounces-105794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHEvMrfu+Gl93QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 21:08:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA054C2EF6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 21:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BA8E303AB71
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 19:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB9683EF670;
	Mon,  4 May 2026 19:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WNJqRhap";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f46l7Pr6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D313E3159
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 19:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777921700; cv=none; b=NUEic7dahktvw4paEniu0t/7/gr4uENch6Qb9uUugDgteBRhRLwxU7ltDwPqLY+CHQPZpAxVwgMObPvYzrbg2HyuX4F9PS6b/NBHNcfioQ1no2v0BT+Hrhtk2SORQuqguYykS5KH96sIk/Xg0dKwGqrO8FAzMDsEvhFRhJTmHSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777921700; c=relaxed/simple;
	bh=/NsgYCf/YJOjQfBrxIduQkHUSM4dKNrQiRj00JRK8V0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BtnuTZ2FGIfCyDhEWBWzqeGolWeiTS5qJMbsPd/N9MxysFMqnfB5E+TYdTTkK30A7Y9SxwHD8Ggx0e1JPzg/HEAFcwn8IBjwDhJ0h/UZLqr1U/s3h06T3SqNF2woRkFg2d5wj/bqyHni7JrLtVBp74Y3MGm/rnLlGWFrWsGY9WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WNJqRhap; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f46l7Pr6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644Iq2ek4128658
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 19:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QpEOCCW2frO
	5RjDS7yw8Uzvvr6ebtp3PdlAzKWnUJ/s=; b=WNJqRhapNaIGfUkgELB7bB9p/Sn
	wH5IACswdNeuv7ebxiGWk36eB5G2Ebvb1fl3KZSZXnXIjjij6ZXTLArrDA1f+fqY
	b9CV2qzT/9a0dVr2dZisqn3y/zx90Ct+9LFEpE8UiY2vZ/53eyNWJOhPqPwu1XYo
	ooqzIbpD30qd9g8tPgbFUrFjBeeGyrUzmZPpJ5/5kpGckMEADraHB+e36H0k/8hx
	z2ShEhfAc1aXG6mBggBJ5pb5aLikiCkrJ6KTA//Jtu+/+79OR33KPFRooYcNheeW
	NrIpOVrOtjLYlOeI/EQVS37JHXgSZvQqQ6PlscG/N/cEVKb0yoplV/DamLQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxsdw1x06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 19:08:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36514eb1194so4258766a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 12:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777921697; x=1778526497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QpEOCCW2frO5RjDS7yw8Uzvvr6ebtp3PdlAzKWnUJ/s=;
        b=f46l7Pr6uZ72xNa6q8fbt/ITqCjPFVVKTR2Mw1UM8dVqoAp+60fjIYGMiHHyoAQfm+
         3PNyRH+nUGlDXVHT8GJrmRsPcML+rBl6otkx4p5r5qW+ddhWtELBF59oIBkYDEqCwVKD
         P7HW+63QW7yOFwjZdLZ8Hs0Bhwq/lPtuoIPE0uLliUyzYN893T+Dpyuu7Wrfg1krBNVY
         MDiLrOKPBdySVozHmH0ukuvcu7aZLvctInwlimfIJEzrklcXuChKYJ8MUeCYr+Fl4WYK
         8wl+bRRbGjrQ33NlZ+retQzD9juqWJRuCBSamgJtb2GkbkUEZM+Wnn0gQsqecpbr5rpl
         888w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777921697; x=1778526497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QpEOCCW2frO5RjDS7yw8Uzvvr6ebtp3PdlAzKWnUJ/s=;
        b=AOFMdeEMGHYrYgGlDM0UlLPuG3hwb+WD3Q3YIVMNeyaAMK29qbd4KSLOidv+YzOYuU
         KjYaV120VuMKQsUyQr1pasRaUqhbjfciRumkWrmz3qSqIJ1sCc5fWpNbPlfoKWnefjO9
         IPd211y9AVponDNXmgmix79WKXnxBgZ8XWBwgjjY995Oa5GoihgWyPrIZXDxUAmf0JS7
         BO6m6JWtEHElJhCUw7RMAub91X7NC9uiyqTlbY7iNDjGVz8ZWUDIsSZK9g+Gat/cOPgy
         Pvru9bxLkqd+eAxfQIbWOA4JOSB9cG3ir03Y2x/XC3ZcdsJjr6Crd64gxE6w866PGc4w
         ydjQ==
X-Gm-Message-State: AOJu0YwtQUPuH1/x+UDsoR4oqRn8nD3TtvTX5MuRdIew6+8st/2miOHb
	RFkL1iqaoPiBLfNpSAh0DnQQDXecAuJGtZ6Sjf6gGbM0ORmBe3wa86Q2MutGWxstyME952kHomv
	6/c8m6l6WmnU3bAFDdMuU/4fbZeaFbRSghptio0eUDyizlLnooUyebZc18vVMlBW6Pcsh
X-Gm-Gg: AeBDievdyL/deR4V9lP85cNBxURnSTMJpm/SqSmdHB3O9WOrS+jHAW0pMzH+9DJeFSf
	2vn5eOoKJaoakaPdlxzBcgvtoZjsbve9yDWb5M9uxeag03FAEHEZMj56UkfHetiuctAzL9Tlx8g
	nC6S6VXxj4S4S5FSJPq3D2Sk5OOVOq2026qghP4LhDnMN/Z/n4rUdsaTtMgcwWshTkX4C4dXJP1
	xGKWd2K5MmCfyYBbDrMyOzIlXMFtw8IzEHwn/9suD4VJijhERLkVecvCqNohuxfBjvdlCCmbzhE
	Fm1koqtaQxC/ikxdQ/qrVtpyDyhJOuaHGuQj0+d3aZ2cYTiiLDyCwFHx8eJ00jTjmfdZ2/N8HmB
	7Dvat36jXVeIg6bSJ35jzTx6AcnbHP1UknDj2tdZnLAE=
X-Received: by 2002:a17:90b:44:b0:35d:a90d:580e with SMTP id 98e67ed59e1d1-3650cef4475mr10744343a91.23.1777921697413;
        Mon, 04 May 2026 12:08:17 -0700 (PDT)
X-Received: by 2002:a17:90b:44:b0:35d:a90d:580e with SMTP id 98e67ed59e1d1-3650cef4475mr10744305a91.23.1777921696879;
        Mon, 04 May 2026 12:08:16 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364f48be507sm4609984a91.14.2026.05.04.12.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 12:08:16 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 02/16] drm/msm: Allow CAP_PERFMON for setting SYSPROF
Date: Mon,  4 May 2026 12:06:45 -0700
Message-ID: <20260504190751.61052-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504190751.61052-1-robin.clark@oss.qualcomm.com>
References: <20260504190751.61052-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a7AAM0SF c=1 sm=1 tr=0 ts=69f8eea2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=ZRXlmS4ShPoOlOK7p90A:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: vWslRbRSnb3xBe6prUQklVRnJZsKxhgU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE3NSBTYWx0ZWRfXyIVjQadTLtzS
 0zNa6K/Oi73W5P3SlQzX6yvkw9NcdMkTqdZi6+bRV4pm+qKL90jzBCirjit6oFU0bYXyY9vLe07
 f0C6NruqWiK7EMu7v7iGDNHoPGgNqOrkUfuYaceMH+gsjkMjgVbCP3fYFTxJ9FgY/osHsbHce3i
 ALhvOdIIfxI9f0rkHWYXVc+KL9emPtb6KB/8V0apKSgH7dVBX9Km9IyKW9KdaXXl6HmCUNxjZ3H
 B62X5WtOCMeJrQ8XuPLUErR5VUK7u5f0YM8BCHwEn1N1d3/ZIzcuuBf3Fq4AWnLnyHPyn7okTpD
 oo6xKEsUfjeugj9k8TUBHT2GJEjF9z2bavnZpWG/QOLDAVqGEWaZWWY8XERMSqmpt3d0nqikFpn
 i4bVu/gCR/vTteZ5aPGds9DtLuJuZhMfs8cyKF3jMQwG480QQKbKs/b25wDv569Xq5Cqrd20RG4
 0HdUHeEvlK86CSqwXNQ==
X-Proofpoint-ORIG-GUID: vWslRbRSnb3xBe6prUQklVRnJZsKxhgU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040175
X-Rspamd-Queue-Id: 2DA054C2EF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-105794-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Use perfmon_capable() which checks both CAP_SYS_ADMIN and CAP_PERFMON.
This matches what i915 and xe do, and seems more appropriate.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 66f80f2d12f9..72b71e9e44f0 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -494,7 +494,7 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		return 0;
 	}
 	case MSM_PARAM_SYSPROF:
-		if (!capable(CAP_SYS_ADMIN))
+		if (!perfmon_capable())
 			return UERR(EPERM, drm, "invalid permissions");
 		return msm_context_set_sysprof(ctx, gpu, value);
 	case MSM_PARAM_EN_VM_BIND:
-- 
2.54.0


