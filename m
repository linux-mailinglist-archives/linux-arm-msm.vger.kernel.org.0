Return-Path: <linux-arm-msm+bounces-114581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JPOeFuGrPWrc5QgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 00:29:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4AC6C8F99
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 00:29:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GIQNh9vj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="MwzO/EJs";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114581-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114581-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5C4630CA3D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 22:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78DC4383318;
	Thu, 25 Jun 2026 22:28:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D193859C3
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:27:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782426483; cv=none; b=uSQz7sPrt2UuXJ5vP35szLW9CzD+k35SFzB/kCd0d3lT3kgmFj+9ie3r5mf5e6U/trOJse/dzPQy7I8LufhcY103GLMoNA59aTWrreSpApczUDTFjzJFLbEALPCVwVKZGkWpBILyF62YFeSN9JK6POGKYbaHG/BTmADGZX5zEJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782426483; c=relaxed/simple;
	bh=UJzeniTUGEpiHfu9ZR+orQWkw+fF+r5Mn+nUSwed31g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=icFTbUItJeiOu7w3gCOCEZUeOzUxI/YstqUdrajZ7ZXlQEmCbMIRaxVbEMoSSj4Bi10VqNuNXSDxu8SR6yw8Y7oKtihmfjJkquoJZa1xqwd7Ojg7rV5YvSr1HXJ8Xw/NFYr7aMA94LpDKbENsintFMttym/bJ15uo6cC9waQKN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GIQNh9vj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MwzO/EJs; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PJkQax2809127
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CrqeyYgLg0O
	yN3yne80Nf16IikyqcRRNAcpAakZrOf8=; b=GIQNh9vj7976s1PV4uK6sNl1Ymh
	Irj/v3lo1FXnt0baIlR0HGIalpQURhWwD7ZF10IZfG4jm+Q2kmjUzcwmmbV682j9
	wJ8V5S2skww2vmG4xrbktPSs7vhsAIQY8/+GliP5WAxKn5P/TRGbc803FgRjrsEu
	mOWUrbBUymUL5pG99Ef6PNWv6cyJcmLrmBikJRkW8brsLO1u9W3j48iJAhe/9AeO
	ngQwZ81/zcVbxPmMtYDjrVitEc4McFZ6Hu3NBJe/eQPQXwFqL+FlUi//jqNDckkj
	bfrtXSlTC4vwTfXhZR2C5aIYElL7raKT2CBAmz2QnPRVtsauJi9aQsxMsww==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1asj8f2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:27:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c80be91ea3so5138985ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 15:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782426477; x=1783031277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CrqeyYgLg0OyN3yne80Nf16IikyqcRRNAcpAakZrOf8=;
        b=MwzO/EJsktPAX64ujRU/4vHPYOtnaw8tB3zsJYGrUh5MZCRDj/l81dSjTM1RkjaeSA
         JIifSeXBaD4huurunFhr7EmZGkFhctkIrqFqppJyVZbgfnnrycijB4BbSB/ZRPq6DCv8
         XQV/kP0wfWLMZ9RxiSyW3Av6SouWuoxlYJCDoM73x4NsDAgIb3ehNL5SE+iABNDrKELB
         tz5CdN9voU6N3hTjBfjPk53nkHSaccDO2fb7H8Ebnx0EyL2xucepfbnrSsVrOLKH0QWo
         FBli8GBt9w69iAacr6uZ2ta5KOPXYJUS8PSd6uWg5nnHZJBDBYBIgqwH8Hj+1HQMAOkQ
         yS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782426477; x=1783031277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CrqeyYgLg0OyN3yne80Nf16IikyqcRRNAcpAakZrOf8=;
        b=GGfrATjj7QlJIM5ffLbQenePbnXEr6+/U6YmjcvoekFpVajQloXadm2vLNdz4LClSC
         0hcFa8UDrQD+eO1TDtGjfOGtR68dE2O5JRQJBRYJvz41Ii8vVuu/ZiONnf12CdusJhiP
         gwldKmmTCqVErCsvO/bX4po+dW/Nm7zkcmoKiuD8Wx7mUvBZ8Mo8M1S+Ysnd1vuBKVJl
         CYTKPAUVlpRzYW4fmBJ/m+Zllqw1+M2UF0lL0pNDUY4wUBJtZKo0KBDbel+/TjpcpMbd
         g/Sa3edD0JwZanHEp8ga2oG11J7UohQPddW68ewTDsI8QMAglYAaLKgoRh+Ti5VLKHxo
         ulSA==
X-Gm-Message-State: AOJu0YwWd/fW2qutij4T9z/WuqkGc50gtNH2dxBY/7vZcquGRd8oHEoS
	QzDWq2zpKl5k9+K7PyYFU0uDVkd3c2Cf04N7fSLclGN3XCIeqNynUX+Std+xP/9+F5Qzf6cHYcX
	v8QNQZP4A1u7efixRLUzvGquOAoTS71D7DL7hJe43/4TV5DcWjF6lsawKtwZS0LuhpKqA
X-Gm-Gg: AfdE7cnQ9E8+eWMhtMxWUmnFDPFPRD/g5nbfV+yqob7GDxoO2QABG3pPtVs0FNOKgjJ
	ve6lWnSBrUEGSrdHEHjz8sMJWiCfOq8ZzWJ5FFraH+GAKhCT9WQnNLDB+2aCY0ZnD3xi4Wqhify
	k1/OhlvDsXb9hLVfLv5Wd56LoYgdquBq93q+1sxcKQJpcZhpfJ6vZvCmi1/DxfRzFhXOtXOBOkr
	LtkfhwzQpN+LJRWAOG5OHqc2Wqv40mf+W4tODgULDK3kJLHa/4VNGO4fWf5oHj1cuLvzlIewpE3
	zMB6LNDjQKwwf/P2JKxQHHutQpc2o56KO6+ycsZz7DVsXVhnOrBgS/iG/gCYkoSQuTqCYrn4fqe
	KDiNJLDon4arq4j3G80ih5o0fQZOku+fB7tuajCMnLc8CVTp1Vc/g99q/eQ==
X-Received: by 2002:a17:902:e78d:b0:2c6:90ec:f601 with SMTP id d9443c01a7336-2c7fc632a17mr47006445ad.8.1782426477256;
        Thu, 25 Jun 2026 15:27:57 -0700 (PDT)
X-Received: by 2002:a17:902:e78d:b0:2c6:90ec:f601 with SMTP id d9443c01a7336-2c7fc632a17mr47006145ad.8.1782426476790;
        Thu, 25 Jun 2026 15:27:56 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63b24a2sm28025595ad.50.2026.06.25.15.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 15:27:56 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 4/4] drm/msm: Fix per-process-pgtables check
Date: Thu, 25 Jun 2026 15:27:43 -0700
Message-ID: <20260625222744.22254-5-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=TO11jVla c=1 sm=1 tr=0 ts=6a3dab6d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vtH2vi951kckHO5NeAIA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: a_FgmM-AC5QkEtSO3jNiwd2_KnbcgVAB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDE5MyBTYWx0ZWRfX98Jgsk8rm0kF
 T2La8Nq5thEgOXw255biEUhDa47kCLH5HBsRdtzyL1B2ZiL6a21Xs2q0yMqKnJbb7Nls7ZcKx7s
 Zcpb43B+i4k/kwZT2IYdyUEuYK+myjA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDE5MyBTYWx0ZWRfX0qxoz1GyXXXQ
 z9NyRwPMgX9djZeDR3g1JGD8ogaRr0lV1i1zIf5X3yMLIg93O3IsjHKmcEAKatqjadVD3N5hkq+
 ZicwtFWZlwtSoly39aM0hzwABGHDUFw5AEuyJOlxe7hOSIFK5QRHlSXMbQ/JPBicI+F7TnTE9xI
 aWD4anAH8/8PTkqqV2+Dvyxz6pVeBBwXdc737FRJ1yassKKqRY71cpvMDE4+35otYEg60SfefqO
 Vn8twkZsa0TiAECJ4Z+SQBzn2SmZZeiK7OXFzFem2IFkmKhJHoxPcV6SvM0cQIR6VW3XfsFk4Ts
 uLSi5vmeawY8KeajvtJvgN05Hj+pIWAMtnHPTusTDCNLh6qWSFJuavySKuvaJ0Dxpa2h7JhN40k
 PFdoR2HPB+RvY4g2lpv/LUEcyKv0opYls6bQ2QQO+QyEBeMz7s8Gt7Vb01YGNSGhuvCTyfwsKmc
 tqpA4zyN2bOjNOFlP/g==
X-Proofpoint-GUID: a_FgmM-AC5QkEtSO3jNiwd2_KnbcgVAB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250193
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,kernel.org,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-114581-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:robin.clark@oss.qualcomm.com,m:sashiko-bot@kernel.org,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AA4AC6C8F99

ctx->vm should not be inialized yet (or if it has, an error is returned
immediately following this check), so this isn't a valid way to check
for per-process-pgtable support.

Instead just check if create_private_vm() is supported.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: feb8ef4636a4 ("drm/msm: Add opt-in for VM_BIND")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index c62c45bb0ddb..bff2a773c0d4 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -505,7 +505,7 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		return msm_context_set_sysprof(ctx, gpu, value);
 	case MSM_PARAM_EN_VM_BIND:
 		/* We can only support VM_BIND with per-process pgtables: */
-		if (ctx->vm == gpu->vm)
+		if (!gpu->funcs->create_private_vm)
 			return UERR(EINVAL, drm, "requires per-process pgtables");
 
 		/*
-- 
2.54.0


