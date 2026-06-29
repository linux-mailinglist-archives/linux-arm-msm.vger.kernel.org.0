Return-Path: <linux-arm-msm+bounces-115101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eh/uBVN4QmoA8AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:51:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A136DB8DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:51:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LXD4p3Ff;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RV2fxW7S;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115101-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115101-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E52A31AD60F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA086423158;
	Mon, 29 Jun 2026 13:18:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC4D409101
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:18:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739084; cv=none; b=aHvYlz3e6WACv0tlEM6GHRBpCeBGUXMIIjMHTW7qCFfjOi4GCv35ZQuszQpp380lMQkTqo/jH5qAeQZwAYQesVEs/bNUSsBkBoortZ0Ozk6Xg/FUFLEGm6HfpRJ7387iXYcFa/TDj3KjkU9kCsbL6xQh/tFEEqbFLjFfEES394A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739084; c=relaxed/simple;
	bh=M8HporrHR4TroPqsNLp1fnzaVZtixFKytOyYesj4iZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rErOoPgxdJJqHLzWfFQcRbZRwqogJOpY2nghMEs0tiMGTaewWXtJJjrf7BUlZZuXqgxysXJdqhhc0Dth4dxrFDGKklkmIj3bekqlLE47e/lw8zjVO7Q0T2Kg3hL/JYSvgOCzHL+4A2Jl98UIjdZdIbVZPiLVd7pnXHnj8g25fwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LXD4p3Ff; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RV2fxW7S; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASxbI2641503
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hZJyjmKYjOSNQb7RA0taR2J0lFRDRngR4/4RIKL4IXo=; b=LXD4p3FfREkNRX/F
	UA6Pi7zP//asvGH4B8W805/udnuOB87lMDGMhFuhgzt9I3MTz3J1TbkwG9gFCR3K
	GzyL0nACnTHp9eoWkYx/kbgmCMCbsu0aNIYSNZsx7paXO6c5dlt7AAFcZXP/y9p6
	7G7GanivRCwD/spAYEMtVnz8D4+hC8/QGPzZM0FV4obIln7tzoNAuvilFZmboT4h
	g3oMhKnPIZKEr7G9iee38iC8TQVMgNhPSxE9thkekD8mYb7BrH8eglIgniyk1Yr1
	Rekioe9ETGPckIRjWWia3ZiSoJQtNdIYbDcunUSTL9gCFylc+uEeetEMCVmwzDgI
	OoleWQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nperyf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:18:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ef8249f73fso34837916d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782739082; x=1783343882; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hZJyjmKYjOSNQb7RA0taR2J0lFRDRngR4/4RIKL4IXo=;
        b=RV2fxW7SA3oCABpmTsAp/8HlQrwBaJKj74yHGAEHPE5dyRaHeZZqLSvEPrz6uKGZzf
         aKCJHrAef4l53ceUpjixMMP53nzvfg4RRbdhqWE//Uv+8redsdeRCzJSc0wJmLCXeeTi
         w9Zufmkf04rh/P+bVreXj4GudxlWHynYjeRLcxxrBSYSh5Dla0ZboxH3rsZA4+KkcVxY
         xtKQ7nOzEUBKSgq6oZ3cjwbBbByw32sl8MzWOcMxO9hcaCGGfplWWts+aYQnbmYH/6B7
         1tf0tIj6r6lq0HTACqc85bpyGSnyS3hFVUOUsIDsozF9+aN+Vch+7/zDaMgbJ5qAUGue
         KjmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782739082; x=1783343882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hZJyjmKYjOSNQb7RA0taR2J0lFRDRngR4/4RIKL4IXo=;
        b=J/mL7kaBQkuJd6dhD1dGmqphFEqpOVC1IfV/xMTe4KqCwCOUUUXadwqMxlJ5E742Sc
         Cp0Ian0t3I4vNbjkCXfstSD93tUq1VYSMtmURyDp8JXZO6PneUUwiFL4m3O6EA1lO0pZ
         RrrW7Kk+ynnt2LzO2to7BpqxxoBs+sVWURc5syYYK3R6gOhFluup9ZsjO7vRtbLVHfpo
         ui1W8e3g8L7pk6BwmsW+i1MRoLjOQ+BjrnVpzLz/vR9J1N3/O8PSnksFtmy4UxRU5VoG
         FQbiIKixC5QdJjo7+KDkuQRyi/Pi/78UOgazKXQ54vq3I7AyzddK5wltmVylqt6oTw9U
         Uudw==
X-Gm-Message-State: AOJu0YzXvEIyN3MWchqHrcr+3Wuq9OFzy1ANmTrGZxb6tYPT3+8xmUPL
	SowzvPktlTQr5MUHYGfDnoOHsNcyn4PwIYrQN2JP9HB5a1heE8WssNPf3KxSQbsEqFOAvIMLLOB
	65zBRe+0/Rl6zNalxkBCq1gPAYvJMJu6k5QZXZB/GmNlVPQAqLATFrFCXeLeaFfD+DOan
X-Gm-Gg: AfdE7cncTExsIfjmXnxOV+gWymFiBkoTzToDtxbdCZreBFlQjSjaFrhIm594uUY7sKB
	vSOt1BH2NIG3qNrbyDuEYHVJAgKj0XHTjGnD9O8QuhRf0SYB77iAWp2DwRTGVzidm0YY0hS9mhV
	djtqIzhZxHx4aV2ezkwaMr/eroEA1xIZd0eAM73DK/EjnuWT9IiQyyNTCqawFlDQFLUW3AZoxCu
	qsGSULp2FRbiY4K2Cb9vcGhWbhTkm969XXleMABp276CJuuXG3iFiU+Wkl9zDkGB5ki58k+axdH
	g2LVjmixoTVbEoYb9ru6pbBoURdIv775/bmZYTCwWpuLVExK9Zg0B/2T9kjPMkkY/xL3IPIOK8r
	G7TJdcGVSCvXKNXaZ0JyrsedRFu33GEbquIlHQV3+MH2e/76Iis8Kr0zzpiWzG37zZwAhHWReng
	==
X-Received: by 2002:a05:6214:e6e:b0:8ea:2d6b:3b76 with SMTP id 6a1803df08f44-8ea2d89c091mr155405596d6.46.1782739081940;
        Mon, 29 Jun 2026 06:18:01 -0700 (PDT)
X-Received: by 2002:a05:6214:e6e:b0:8ea:2d6b:3b76 with SMTP id 6a1803df08f44-8ea2d89c091mr155404696d6.46.1782739081215;
        Mon, 29 Jun 2026 06:18:01 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ef0f2b9df0sm56744616d6.13.2026.06.29.06.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:18:00 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 21:16:36 +0800
Subject: [PATCH v5 18/25] drm/msm/dpu: initialize encoders per stream for
 DP MST
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-msm-dp-mst-v5-18-1d882d9012f4@oss.qualcomm.com>
References: <20260629-msm-dp-mst-v5-0-1d882d9012f4@oss.qualcomm.com>
In-Reply-To: <20260629-msm-dp-mst-v5-0-1d882d9012f4@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782738985; l=2431;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=M8HporrHR4TroPqsNLp1fnzaVZtixFKytOyYesj4iZk=;
 b=ix3HGmPgzOprW+IcRYXLdICj5VmiNH9m4cqwJK+Et2GLwflHQXvf5vLuZ1VCkjB7FPuNMMHc8
 HQcUh0OIwGVCKGy5w55oS7c2m/ocqUWwYAQap4v6/vT09BTfnAv1Q2m
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwOSBTYWx0ZWRfX+kd68ABAFaYB
 0BpNUcwcvJ+eibuqQJvDsx2iJP8/LbCh5NBYf9QsAfIBTsm9zVp2TsUAkx61HrzYllPwML2Dy1K
 riCAQ2bZuACgd777j3Jgvaik9rTnX/FhleHvkVbTcccYmD4FuD8by622qtHmGkYonCrFjdWo+Vx
 cRN9wRW7hOQ+S4wwj3/7iBdC8mjD9NgUe5UH7fn+ztG3yiwsFUlReUgtCjQu9mHVILlHsp5lDPR
 oT2DIIJNjmD2JTFgsjHQ9LJbOZlZ4StymGFfKbRuCLzs9hh7nK7iqpbBB2vXa4Y31ZRNPiviS2R
 lmP7+lnvt/h+qDZCrKC+qyKEGVdsZp8m/5G3AeYLTMddFM4z0jY6ImZa3qdV9hyWyn0GFBhrW1Q
 Ba/Ab5T4CDjcM0PUKQFmlhFwTVApvstzibum8+e+bKr+0qtjvzufTpdTW4q2430F08q4xi8K2H4
 huec4XB233PZKH0cjsQ==
X-Proofpoint-ORIG-GUID: H-bDs0AITl63XO45VGdsz_4bW2PGAzr2
X-Authority-Analysis: v=2.4 cv=T6q8ifKQ c=1 sm=1 tr=0 ts=6a42708a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=CHjaKMol-vWaWBnFkvwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwOSBTYWx0ZWRfX65nQ5fMCUYkg
 BICeLdbtM2Ucu7Anr3f146NwkZdUujQdz7KmE6C7tRepDkWwcIrmNwX2DLR9VRiNSadmPXB85Sx
 gT/EKC4H1LaLpmZoTJd5DZthuPW1mv0=
X-Proofpoint-GUID: H-bDs0AITl63XO45VGdsz_4bW2PGAzr2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115101-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 98A136DB8DE

Simply initialize MST encoders for MST-capable DP controllers, and
introduce msm_dp_get_mst_max_stream to query MST streams.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 14 +++++++++++++-
 drivers/gpu/drm/msm/msm_drv.h           |  7 ++++++-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index da3556eb6ecc..7a00c4094d5c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -655,7 +655,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 	struct msm_display_info info;
 	bool yuv_supported;
 	int rc;
-	int i;
+	int i, stream_id, stream_cnt;
 
 	for (i = 0; i < ARRAY_SIZE(priv->kms->dp); i++) {
 		if (!priv->kms->dp[i])
@@ -678,6 +678,18 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
 			return rc;
 		}
+
+		stream_cnt = msm_dp_get_mst_max_stream(priv->kms->dp[i]);
+
+		if (stream_cnt > 1) {
+			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
+				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
+				if (IS_ERR(encoder)) {
+					DPU_ERROR("encoder init failed for dp mst display\n");
+					return PTR_ERR(encoder);
+				}
+			}
+		}
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index c3fb3205f683..5fee0b291059 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -355,7 +355,7 @@ bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
 bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
 			       const struct drm_display_mode *mode);
 bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
-
+int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
 #else
 static inline int __init msm_dp_register(void)
 {
@@ -372,6 +372,11 @@ static inline int msm_dp_modeset_init(struct msm_dp *dp_display,
 	return -EINVAL;
 }
 
+static inline int msm_dp_get_mst_max_stream(struct msm_dp *dp_display)
+{
+	return -EINVAL;
+}
+
 static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display)
 {
 }

-- 
2.43.0


