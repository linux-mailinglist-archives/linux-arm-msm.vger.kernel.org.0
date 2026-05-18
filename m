Return-Path: <linux-arm-msm+bounces-108268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPWZGKxjC2rwGwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:08:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 002F75729C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CDC2F3016B60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF70390CB7;
	Mon, 18 May 2026 19:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CNXTESBp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GUX/Rbk7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4E2390222
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131284; cv=none; b=pjLOTLw4WnKEKNSY0IeidQNpk/K7EHMJEzA35nedJxb5cf81+xOr0Gc4hpbfMjTY6SD4bUbmZcDOh6K4PtQTHWADQ5miRReO3OvCRzOLmihPyfsTcgybFucp8iMh+nehEe4fYtInbobY9pWMH/zXQZYkO5V/j4ZvntdTNxV73uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131284; c=relaxed/simple;
	bh=hNYajq5FoO8Ohwqtcny4uUuWTPmnir7ozBVWoOEnOkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fEBW2HS/0fygvfYJzqVICRcPyHxTgQKOcZQdqLvagrE2tskd669w928wLyw2Ffkpmy+6U1I1k3xfB6mDzoiJoCWK8dx4VFAm7a1y8wXpz9WVDpdv5wvHJ05EbU24SMJF7f+0kGEko6ExgSrhmtvrReNK/c4MQqLBxaJjcVQU2S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CNXTESBp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GUX/Rbk7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IId5OE1250890
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=r626fk8GTYQ
	7mVDurnFWdbX+Kfuz+zSekrPETuLYfy4=; b=CNXTESBp47U1AEyP0/C8RdCk/Fd
	ackEbQ4Rot206/j24X7xEnrghkdCQHZJO4J69LbGUe6hLYAwYeflzWwUa2Rx6Iow
	a40P1PFkkaNtRaYl1eFRTVJpTxbOEgsO9zv/JimfjZjWDU7YhaxQTKFNU2erp7ny
	+AGllerARffASgVWrm1RnmtZ17OeR6r1Hfqplluq4B3Q6Lgtn0ZkkLA/5v8yUlms
	05rQa9ZRTtHfsZnrbAeBtSqFaoXJQyS1Vh1gOpU7/g5ne9i4q/KqgcnGh/5dFIIY
	PP3yir8P5PIXi5ynyc+mtSsDNUhP49uz6qQRjrPqSJLgxwWuSWUUgSIOstA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82c0hq89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:08:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b9fe2d6793so69405395ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 12:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779131281; x=1779736081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r626fk8GTYQ7mVDurnFWdbX+Kfuz+zSekrPETuLYfy4=;
        b=GUX/Rbk7MrU+v4S3apZivj1oHDUFhgUV7qBjruaqdkOFqo4XnGChhITmClV2TbE7Jp
         9cdOrbEahLFoHn4eGS0RZmyC5Ww7Z4gj6XwCm3dfbVu+121ygwJp7DWeEOBIyOzDlLMv
         BKrpedPjkiH+VHh22PIW2HvBqwZBcLiIe9ZUwM/y+1oCq9zPenmdMgBgEMFSWmrQs026
         3X4m3WS0zEs92Hy7dCPipELQd2w+OOtfIDj7BfQysqsGQkOIVGEPfsmV9LQhzx9YJW9f
         goI0aLepeUDmIhNNL0MhN3qb02ABWCaG4XKf8TrFLPiUpFCtj7VNjdgHmyosJyzoLMaP
         jvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779131281; x=1779736081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r626fk8GTYQ7mVDurnFWdbX+Kfuz+zSekrPETuLYfy4=;
        b=jC29fBnnb7AtAskW4ytlO5VW9DuItjmDy8Og5bHYWe1OgXFkSAi4ZMUqXrD+fsbyjH
         qUmEZGnmFUh/1P2kH8bEkP5qd4o8Ee9cADRdFMWzKEwcnUYv4MzXiUDxSXZs//mSLO6X
         jfaxzsVeBk9uID/nSRlsVeHTeMPnremqJ8d9i50awOWOyW2H07xukwO3tL9jZop4VALa
         cAH14gU1waxBPocR1JHstBoZcymtrepohYTgmEusWqvOFALtnEjLgrpBqPt11rx01Xao
         xh5CmOTaqq0m5rMn+jSiZosOzXtmMz8DNgRpIUuVbErCPYP/nmSCcYgtgSaQ2YPyQ+c1
         jbkg==
X-Gm-Message-State: AOJu0YzwSgEpJ3XPuZaadXyozABC4+HP8OZC3RR1W11EczWinf+eM/5m
	JdzLGdTzRjjpfBaH4SqBn16xfMCCLXuvkzX8i/qVJlrRrUDnt1BDtvSLuRFjzNYxKoeGwskIMnJ
	5yviVTh7bCMuJnCZE6qiTHgU6VJMmApb+9VIIq/c3H89AUU1kBnrPunxJEdDo7D9bNc+6
X-Gm-Gg: Acq92OFKBt5W1G0abvel7vUpMvxsGdj6eKsoDp9ZhcU3eteCyYkuBe88RgHZyyoZhec
	RAfRqLFNx0sQ5qtDRjn9sp1bM7OqKiMbE/ysNOsleku8kMgKo+YkOldOK4B6T2bOKqxDIhelnpb
	zd6x17qC2OJjKUogQUBsHC1EtBpKMhWRtoodNDLy/658gwS4Yz6Hydg60N7Wnsv0h/ma9XTzUBp
	MX2oFuTVWePd5d6mTSrE25hSwrJYqLokUZ0Qtgte8ve3szc4NJMjnfw25cBUaBwek9G96c3oFua
	klFCJSGp8EepVy1FUHBqUBm/3qHBfeZWrcGACjKOqLg2cwwggx29NM5erEI7MjKq/B961a6/XTk
	1ARuBl5DMnHIQGHljWg3eOl59ScuU1/Qe
X-Received: by 2002:a17:902:f38e:b0:2b2:4d36:7aa with SMTP id d9443c01a7336-2bd7e8cbc80mr136657715ad.35.1779131281367;
        Mon, 18 May 2026 12:08:01 -0700 (PDT)
X-Received: by 2002:a17:902:f38e:b0:2b2:4d36:7aa with SMTP id d9443c01a7336-2bd7e8cbc80mr136657525ad.35.1779131280870;
        Mon, 18 May 2026 12:08:00 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5ef27sm202768495ad.8.2026.05.18.12.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 12:08:00 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 02/16] drm/msm: Allow CAP_PERFMON for setting SYSPROF
Date: Mon, 18 May 2026 12:06:29 -0700
Message-ID: <20260518190735.16236-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518190735.16236-1-robin.clark@oss.qualcomm.com>
References: <20260518190735.16236-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE4OSBTYWx0ZWRfX2lQTZUS6rw9D
 rC/+A60O+C3Bn3uvk6YdyB0DN/cclLfg8u1WQPwj6FDGWkBSiz/WAvUxOQquT3olvMJfoMZ/a51
 UkIwCVaQ3pqZFw4lMxG9qEPdLtELmlvKcuOD+H9gZDM5Vivvnjz9IPYkUrRnoK6tgZF7KNn6Kle
 nJkeT2VlF1ZBx4DVl7bPZORzWiNU0o9oN+byOMK0iYaYuE/f6oNQyybJh1/au1AJ+/lD4a6U3RT
 RnyVf8xJoAiJC52J2kSKblAuAaAjgsllHm4smh26VU7H2Ad/T99DsrnQe5/xuBnXjafyB4AkoFy
 ajrMQoVKCen5bdKKJac8p83/XJ7j+CqAJBXmg3aRtNpCzBWzGcXhLuRYd7RfV03fOrU1qgfF470
 x/G8yswXViTP3a2DKyY6aWtyo4POY82WzoI6fT7eIxiA3P7la0zq+4bbNEX9/WPhoQml76At36z
 TgFuSNj81pfbqdimEkw==
X-Authority-Analysis: v=2.4 cv=A5Jc+aWG c=1 sm=1 tr=0 ts=6a0b6391 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=ZRXlmS4ShPoOlOK7p90A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 8KwXqKKKI4pgnnnTbXliioarEBn3pkrc
X-Proofpoint-ORIG-GUID: 8KwXqKKKI4pgnnnTbXliioarEBn3pkrc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180189
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108268-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 002F75729C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use perfmon_capable() which checks both CAP_SYS_ADMIN and CAP_PERFMON.
This matches what i915 and xe do, and seems more appropriate.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
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


