Return-Path: <linux-arm-msm+bounces-101426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMsBObwDzmk/kQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 07:50:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8123842B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 07:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFCE63088EBF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 05:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05FA378D64;
	Thu,  2 Apr 2026 05:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gGYVLTx7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ftp8GT5/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63457374183
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 05:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775108982; cv=none; b=DEyQKjBt5+kpMbvYXBbwKtADP+W+JReZ5wE9hW0RvP8SuS763bMxC1B6K4gzQKz78NB7qKC4J+/IIuLOmOSg5h316pxhf0xamDMLkDRTuWCwjqLX29FwbuhI39UA/VLRu+5woAImor/3xXVFTKqgSma+5t634DxssLBUOjxjkdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775108982; c=relaxed/simple;
	bh=GcJa7Pz0PPXt0b9IVULyqmwnNI0VqYsX73C2BhOipgE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bk50xVHJuy9yGgS7QjTXILgUS7z+g8I2IAoflit9x2ngAgIW97Fh0ZYWcs6s7B9ooIFpobg3CjTmZlSYvtlwNEV/Op0gVMu44VARzHGucfH5MOWgwWI1xI9Ycf+i9qvsCJgVxTb2o9hRI5ZagHoB116YCJ4m/g0lXCAMAgb7+SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gGYVLTx7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ftp8GT5/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6325VRfc090852
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 05:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=f3tzm5JBMwO
	w31Vut+2DEjfXxJ0rtenkMsmzXkmycbw=; b=gGYVLTx7Zby8UkIW7dM1Jd/DZuA
	ainZAqX99Czs+QMXlZ2RKPUQfWTbnC7gBnlVSRdTCXeST1wwu97JyZMfpYgmox3u
	UxrPWmTaabx54Y7xDNLw34Eyf/3DhHhWTKKnW91tgHgZg77JplFu2/aSQK6B02PV
	Erlzr9b+BDvDePtV/sy/OEdn8Df5ZHeW9bzUKCKqzRTWDJmzAbklrmwkNeZvmnvp
	M/3Tf87Mg0rcbq6cX6r3+prYc20NXp5VYWliw8+EqT/YGvctJbyP8KjqYQ8Hrh3h
	6LD0ojrMwM14IfqPwX8p+8alH30EPTjc7N9H9flLNHNGXCtppqzTWF1khJQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9jcu8212-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 05:49:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7651644975so325387a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 22:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775108979; x=1775713779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3tzm5JBMwOw31Vut+2DEjfXxJ0rtenkMsmzXkmycbw=;
        b=Ftp8GT5/RSO+Tz9s1juoydKXzp83KTFNurgUjBAvNLYskj1axrq6YJGOSr5BgcHCiR
         LMOhOsQAo6a8Kgd3O9HVBBzkV0AoXVOlUOdGcaiYZLPM04T+KqFKfA5+M3Y/dAYufsj1
         zbWqm5sB9H57CqdWogiNS4DNQa4ESs3BO7KxH96woXbNpT47NViHeC1bb4hFsmza+c03
         sglJXwydefL85eCeckksLmbVIOjtz6pwZ6kyS5LR0EVKWde9MNAAyLKRIjU4Af9guKHW
         pZgo8w6RlrY4ZEzct7hynB+hxiGtcVelH/mV/0UqPJMfTKULipM3LDGqqwG3aqhnmUy+
         pBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775108979; x=1775713779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f3tzm5JBMwOw31Vut+2DEjfXxJ0rtenkMsmzXkmycbw=;
        b=p2ldSl8Ze6jg8/vAXYagXcYoRGvXzgIh6VRPhI00ky4Y9P3/S9/3cveJ0Qo7Yb4r83
         PiN+tHNyNv4Gk+0Fu75xi9iLNPTzLJlS4u8Au4C9Ve637Bqfi2SC2iGBoGrIvPM371qM
         Jj/uSJgO4QbKoVBBmxn0gHgb98A2wcJ2FOFVBpk8Yp3eTAi9+c71YlJtdHtXoK/vXig3
         fW36OfKNIUBDlppvoHvgSTAH6cQUzecG+Z7RipZZHk1YpeM4+/ktU/j9Plt1JlCNC/6m
         F2q8NfFlQRtaIWNW1xYsRKo/3e2sabP5wCF89iZO7q7ssXr+hu5XNRhBrmPYQ4qOd0yS
         rXYg==
X-Forwarded-Encrypted: i=1; AJvYcCWpmHLDqGUVRGeLB2ZM7U9xiby6DvFIaqbynzF3kgrmT5GTlPCHQprbfsIPgmc3i6RHvgxL5IX3BIvsOOZx@vger.kernel.org
X-Gm-Message-State: AOJu0YwHxeSQNrWQ/P+Iyqe+g11v/2FD3ohP9DdjjYPPvS4QJHGy1psg
	3f6n8/Dz6V/otu1vOXeXY4iHF3BqaqbZbmqXbPHPg7/SzmCNH0YXs1GVOz2t2bDG1W/VfMQvEUs
	r2BMdA0f+oAOE0cyr6+LrbcF7aCFPnEyuvXNzMzCg+er/3JC6GTF8BwfivfRflNGkoenF
X-Gm-Gg: ATEYQzxFREwsSI1mwkj6RNrCYPb+Wf4SBR0ovavsIZ+YDtH7u05J73R+A/1bXvN2Vh4
	FygB78MvrxzIMyUZjw+lRcdiKKmxa4H0W8vSOg8aSXGCmUYEmLjJ7fh6kHyI3HrTjYP84syLS4d
	i4EIfKF0RCgaGlaK0vupQS68GEH5taDEDsWrKyPRR+o0u3Zi7LE1OSTwUZj6+0QIlHFVW8Z9gyh
	vG/fbTTLTtfyhv/yXTzWO6q83cSoSw5hT+FI+wFuhmUa4chvk7ZypLyDaF+V+ABcCCkdwiI5tIh
	CSOUl/4i6OB6mO3S1r2AUcQn1lJennTBGpMyJRPNDSHM/53HrrpF2MjPaFUWj57YTk/rulEk1R7
	gnYj15diBy22M/1vvLqRgIauQUmWSNjuph6Cg3db606eWLFGAM00BCQ==
X-Received: by 2002:a05:6a00:3c87:b0:81f:be3c:9c9e with SMTP id d2e1a72fcca58-82ce89975dfmr5757621b3a.33.1775108979371;
        Wed, 01 Apr 2026 22:49:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:3c87:b0:81f:be3c:9c9e with SMTP id d2e1a72fcca58-82ce89975dfmr5757597b3a.33.1775108978879;
        Wed, 01 Apr 2026 22:49:38 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b5fb22sm2167747b3a.26.2026.04.01.22.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:49:38 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org,
        konrad.dybcio@oss.qualcomm.com
Subject: [PATCH v7 2/4] misc: fastrpc: Replace hardcoded ctxid mask with GENMASK
Date: Thu,  2 Apr 2026 11:19:21 +0530
Message-Id: <20260402054923.3061925-3-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402054923.3061925-1-ekansh.gupta@oss.qualcomm.com>
References: <20260402054923.3061925-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA0OCBTYWx0ZWRfX7R7gShkyqlM7
 tjY2flOyzAtjNtR2BUHHzxgYygzTqD2v6ZLlbr5aEArvx0gFUdGSi2MhaiSDYiMHjf2VYrLBPkN
 saYxq2/vyeL6gAd1OIR6c9yZ9RJ3utc6sJ9eA9rZvnKvpGAKDofqr0MbZIwjlh3HoLwV0srmW9J
 5V56V9jQxtZ+PIvzRr2QFXc0/b2tSGZVoNC7Eo5xS5dQ3Q6D/Rig3113LUGok4RpZb7zsYNIEAr
 owPQ4+Z90k8UfF+qq3nvVIdKQUC0bFUqEiSs9qTkP5C4Y7UqklOczSBNIOwDSxPP7cSzciLHXiX
 bkxVX8RWlnmQAt71K2Hl1J9/ZbmGDtA0zWkr79LIB8NMCR4CKpz81r9qswBwQgoNCNU1qVfCUbL
 GuMM2473rsABCQzyDP1LrdmY0d0xcxhBskRw1st/bX9AQWTOY5U0oZ2HB9Y07+rzjiIyh2mp+xL
 YLo9sxRinyjx8afKHUA==
X-Proofpoint-GUID: y5sY6RTUK0cw3v9TQZbt_5RxHIsWWyjB
X-Authority-Analysis: v=2.4 cv=eYYwvrEH c=1 sm=1 tr=0 ts=69ce0374 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=HL6mAI18knL3XnPGOeUA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: y5sY6RTUK0cw3v9TQZbt_5RxHIsWWyjB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020048
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-101426-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7A8123842B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace the hardcoded context ID mask (0xFF0) with GENMASK(11, 4) to
improve readability and follow kernel bitfield conventions. Use
FIELD_PREP and FIELD_GET instead of manual shifts for setting and
extracting ctxid values.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 11f4ae749e51..ce4874b9480e 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -23,6 +23,7 @@
 #include <uapi/misc/fastrpc.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/bits.h>
+#include <linux/bitops.h>
 
 #define ADSP_DOMAIN_ID (0)
 #define MDSP_DOMAIN_ID (1)
@@ -37,7 +38,7 @@
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
-#define FASTRPC_CTXID_MASK (0xFF0)
+#define FASTRPC_CTXID_MASK GENMASK(11, 4)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
@@ -515,7 +516,7 @@ static void fastrpc_context_free(struct kref *ref)
 		fastrpc_buf_free(ctx->buf);
 
 	spin_lock_irqsave(&cctx->lock, flags);
-	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
+	idr_remove(&cctx->ctx_idr, FIELD_GET(FASTRPC_CTXID_MASK, ctx->ctxid));
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	kfree(ctx->maps);
@@ -649,7 +650,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 		spin_unlock_irqrestore(&cctx->lock, flags);
 		goto err_idr;
 	}
-	ctx->ctxid = ret << 4;
+	ctx->ctxid = FIELD_PREP(FASTRPC_CTXID_MASK, ret);
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	kref_init(&ctx->refcount);
@@ -2505,7 +2506,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 	if (len < sizeof(*rsp))
 		return -EINVAL;
 
-	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
+	ctxid = FIELD_GET(FASTRPC_CTXID_MASK, rsp->ctx);
 
 	spin_lock_irqsave(&cctx->lock, flags);
 	ctx = idr_find(&cctx->ctx_idr, ctxid);
-- 
2.34.1


