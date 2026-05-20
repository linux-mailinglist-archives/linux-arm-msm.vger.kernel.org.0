Return-Path: <linux-arm-msm+bounces-108628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOVdLFFaDWpuwQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 08:53:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2647B588777
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 08:53:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 91A1E30234E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 06:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF11364EAF;
	Wed, 20 May 2026 06:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KP0Oc6fO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DLWstlXr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841C5364EA5
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 06:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779259865; cv=none; b=BH+FVCo6bQHOtUiHg5vt9Je1FabXgDKXC72tZ2H5aoug9MaYxvRSIrlBz4RZQN/iEKoReUwOq6XYvt6TFvcNR7VfjYH43wWwesNCqlg9QYJjFmaWL75HkKfigDW2ff8+A7lwJdryvP/VbJWCM3MYEjjNjGThbU2xvJUPUSCQ5wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779259865; c=relaxed/simple;
	bh=1ddE0U7h9weXbIaT7HOzewRICM+9yO0cSWfl91aUt5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V2pj21/iVJDWmL9B5hcdYd7eGc7P2QdiEomzXQ4EZDOZCcnbILE9GhOBSW/W0qylEX8c/Mpqma7CmJy/XWQDQ4Hi/YcehhkzDdXnwDG+SPHikfbsrzsVvZDMZWV1nNTbSahRb0gmjGXJnQWAQshmYAnGcJ9QeIabcF9HeQ0WU6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KP0Oc6fO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DLWstlXr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JNDbXo1739337
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 06:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JIaEBu2fXti
	OblnnO/rwwIoef8J83XO0Fyvu0X3nK9Q=; b=KP0Oc6fOQHckMwDl6aAK7+IENbO
	ipvK9YVfmudylkelSt3tGvElGMtCmLp9mievydU48ADgv0v/Dm0Cob3yv9Q0bTrT
	jdiZMckl3kyFLvFbuC1EyVPGIuP94a1yGFB/ByKkphYIo5yPURTR34kqTtIQOH7F
	TwQSAaScP2sP01UZxnjXnKtb3uXdLYAgURpGFO/j/SRlUqfeWwScnAMgVmtz2+rT
	Ynsrwmf7gIJ42966ZYFhRFFrCi9tF1aeYDrJpOkfbYHgDRfOqd1tI5j/vrKfQ5cr
	MlO+3DX9k+dBSI+gfNCpqnVWpmmzVk1LAr9id4OdBSwHK0MWirsnphgHnKg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qbba6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 06:51:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bc860066a6so32458715ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 23:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779259862; x=1779864662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIaEBu2fXtiOblnnO/rwwIoef8J83XO0Fyvu0X3nK9Q=;
        b=DLWstlXru/hB1c49bQ4czQg8YSL4c3fj96Ii7y8d1I2aFutzgCtk85LRNWgSNi8agu
         WdKkM8773SfiQtcmHiMH/YY0FZQ4Q4JBz17nZQ4Xa02os2g5Lk7SH6kIqveXsKFPeQne
         k0d1PH0MKJL4X0TeYJFfQDUMd4cyKT1gjbEpFtpH61rUUA3Q6BqW896dCsvV8AvX7+NM
         qn/UeYQbbpERUjnI/RmGoMNg9f6kQAOxTAlmSwlVKpU63rv7sn3fIdUQBG/+fTTmdY9v
         Sra6pY1xCQ8oN0XmnU941Cb7rLAdIdNIX9zHwpu7GvCkFGRPXfarTvKrVcscsrD1vj7m
         SncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779259862; x=1779864662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JIaEBu2fXtiOblnnO/rwwIoef8J83XO0Fyvu0X3nK9Q=;
        b=ruBNZj3urAnQO89SB5JIGkaPMNu96l57ESAQ8vGOIYv+E0Lwq3+Vfl7Pm5Su6KVjj+
         UGlUoiuURz+FGXk/ZSWkOQXxhgsCUUcDCmhwSwRinlN2MVE3kPDpZMtuAW5uJioE+Nh3
         yo5LBo1B9K4YtDNl7hQjX9o+8PVHCEJnyecXfF7wOUdQTNQ6+aNdBQslNrJxci3mQuZp
         Du8QprM14p9Ld1kq9GAqnVnKfN9ZTweeZLY/ytn74vYEAJGQLJA6Okxtvit2sInzYNOO
         M/0M/cXkDWWtIhywuJg+XxruD1VxeMQnRp6R/AqHYdUbw4GhPfR4NeekcIXosGNinIKF
         Ky+g==
X-Forwarded-Encrypted: i=1; AFNElJ+2nGlI9M1+jlgWNRzPxLHr4wjLTXuhqLXrvExZGIJiAh/zanih8p2I/1bLA2epjEs5wBtvAbySEUWULvFg@vger.kernel.org
X-Gm-Message-State: AOJu0YyDyDcH8BG+vVBGmE94tlbXP9Qw2paW6c/IZCtBE5/15S/TMSH6
	BgtZ06aAmctCVwHWJdkmlO9KW0DpWMzFluXHDWGzz4au+N+EfBoadxYhX2yjj4NgwPU++8ZNZRO
	WHnk09qyLXcTv5WXklcPTyLTpcIqAE9yADBhcHzXJceEv8qzw4jziu25zvbE8K/VDoTUy
X-Gm-Gg: Acq92OG87QKJmmyRtVhUZOLlBJMLHWqu1c9s5wyJUVebMDartJgbsT331Qfyxp87lbJ
	jyQThFUHWdfQwAdnYcIZ359M3hekv0pXbsCFuZ3qAMQ7jC9aJBLY4cy8qPkhsNqV+BjNqTivUh3
	NXDdZKIvtTfSDt7SXEGZXiAy4nTm7iZym9RPI+za0zpEhLJ+bsjxE5GCmvXHMoBhfyvoNd5QOMg
	bysLmwqyaekEEaA5sfMp7JcuvsPwr3K7I0UXF/ptspZdqAsKPW2GAHVoUr6amsUBr6ohRMK8/d7
	gKaYtcjjtt26Esnitg3mmaciDXUaDdHtVlsBvQfXOaD6K3ototAIEIitLOeshfAVh6gKPNh3ged
	UL5KTMfhr9CLYXYtojdkPzJxkzNOcCUQD+PG4/sYEflyBukAHQ0n1+A==
X-Received: by 2002:a17:903:3c6b:b0:2ae:825b:49a5 with SMTP id d9443c01a7336-2bd7e415675mr232877155ad.0.1779259862410;
        Tue, 19 May 2026 23:51:02 -0700 (PDT)
X-Received: by 2002:a17:903:3c6b:b0:2ae:825b:49a5 with SMTP id d9443c01a7336-2bd7e415675mr232876855ad.0.1779259861917;
        Tue, 19 May 2026 23:51:01 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fe51sm206410165ad.2.2026.05.19.23.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 23:51:01 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v11 2/4] misc: fastrpc: Replace hardcoded ctxid mask with GENMASK
Date: Wed, 20 May 2026 12:20:45 +0530
Message-Id: <20260520065047.3415790-3-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260520065047.3415790-1-ekansh.gupta@oss.qualcomm.com>
References: <20260520065047.3415790-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Zkg3jwPdIQIIJbK4QLPGUpQAVaZiWa9f
X-Authority-Analysis: v=2.4 cv=LcMMLDfi c=1 sm=1 tr=0 ts=6a0d59d7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=HL6mAI18knL3XnPGOeUA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Zkg3jwPdIQIIJbK4QLPGUpQAVaZiWa9f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA2MyBTYWx0ZWRfX3BuVQIcSzYQH
 LOLPflf0RVQr0HCrDnfDsa/Rqwb+uMqxF7gIpYciRFg9N2vTbQGvWvOWCnpzDmI4S/UPSa+G06Z
 n2LbmCvpeKf02AXaUR0lLpmBFvLgnTLppgf6iM8JmoQy9+QAp9GYnaRhsWrAnRB3IuzmWi1yW8L
 7P7CYBUQdv2KnBn1Uo0RvVLKg3QQwHV2IYpafKGn+YIjnvkagOoLEu+b/FgBAvuu2spsFHmHuMT
 lKgW3a+DL8AF+2lw4j62YS83j1uH2cUuBerZyl19Q6jyPRj0i2I2Wp24+11enDWtX9czuUnGbJF
 PRKiroHa9Vwdl8sRbuluppMoDnjkNtae2G/nruq/Ib6cK/1N1xFXqpzxstrHJiqaRhmpKLsiPBc
 OkvyjkbiMSle/BwAmpKf8gDaX5RRZQitDcBKSs24jekMzCqoWXVo+1c+cKQXz+pNVUXb7yJdzFd
 e4pnUxjveSIE4xcUeeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200063
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
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108628-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2647B588777
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace the hardcoded context ID mask (0xFF0) with GENMASK(11, 4) to
improve readability and follow kernel bitfield conventions. Use
FIELD_PREP and FIELD_GET instead of manual shifts for setting and
extracting ctxid values.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index a9f507a88c67..3f5d5d73be5a 100644
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
@@ -2508,7 +2509,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 	if (len < sizeof(*rsp))
 		return -EINVAL;
 
-	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
+	ctxid = FIELD_GET(FASTRPC_CTXID_MASK, rsp->ctx);
 
 	spin_lock_irqsave(&cctx->lock, flags);
 	ctx = idr_find(&cctx->ctx_idr, ctxid);
-- 
2.34.1


