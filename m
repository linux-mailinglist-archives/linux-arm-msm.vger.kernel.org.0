Return-Path: <linux-arm-msm+bounces-118628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5dwgDzh2VGoemQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 07:23:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C075E7473F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 07:23:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cEFQol0W;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=b+UZdN1C;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118628-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118628-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9B684300AC94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 05:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E7F3612F1;
	Mon, 13 Jul 2026 05:22:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC84360EF6
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:22:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783920173; cv=none; b=and7vkUpnbchA692z0ggI3hw2hSANls7UAZF6dchBHM0s6MhSJjWk3bnGbrkQq5ptvpOLVDlTHYqXhVuaVFZKj8hvHoiAJ+JdMsbn+NituxDJz4nmyD3U7o4hqN1bkH9+QMsfJgXY12Nvj+vST8iAf6lhsVbQElWgllwBVqQmEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783920173; c=relaxed/simple;
	bh=VmXHhCMfLZLd1XdifWXdK5hh9acIDGbTOS14Y8L4MD0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M0a/xgMvU6HmwqZze77Klr5qyQnVKazHymS55OM/GuGLwke0YbNjdif/F+bwdSmdqL1leg8jiD5T0R6NohpV4KecM/E84g0jAqQELRZKPTqn6Q2P2Ff7G+NR4AK6zNopWhz/K7w1GwiZsLLYIIjPY0jKhPd+6hVuMOl9KQGTC50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cEFQol0W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b+UZdN1C; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D39vmB038537
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rX2n8/wl/aZ
	5m0mAvSyZH/8f/EcwdRtpFwxFW/vqR7A=; b=cEFQol0WXB/xTarzSmKHeJ9Fcf4
	DcOs4JPBkm6j/bzteyJ036g4nZIh4g1Rq+moFWD1v1nzDq2GfPrhgm7wwmwobaBz
	MLlUTwV0g6xH6mP6iui2XCNibGyswNimG/wLwMHDILUGCNYBFFbXFXJtBBmWoDC2
	N2dIfAkrA1OhxcxvlRZuDsFo7qpuywlKPVWM5xm5taZyZAiR8AszmNf3xO/mfIVP
	HC1ONrGez4+TT5RjqtwzsEhI14lSFyR50PGwCAu1WqVUoSn50xzfBCDnyqr3wMoZ
	ytCmKWxinkJKB8J2pFUwkHFDp7Q8tk+3JiK5mkW373X0wOSQiUZ0QX4lJkg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbee9mfkv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:22:50 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84877b362f6so4433489b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 22:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783920170; x=1784524970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rX2n8/wl/aZ5m0mAvSyZH/8f/EcwdRtpFwxFW/vqR7A=;
        b=b+UZdN1CbRe2aQSgRQeQ9nCPjwuv83UuLAdMuWUCFUou2+9TOQF/maoxig2KIlbDqD
         xc6iIE96Zj/ywoynPkzzq4kApPdv+v/UT0ASC5SqHnuZPaaM1l8EGxF/OnTvLZ7isU1Z
         qZalKQ50ShAE0enimLQWk8mFIu6BcC1OO4aCrB152LAP5bwhF+pXwI8tbOQWv8O9lZ4E
         2WsXTCRLuw7GhY4S+I/8nt2nZqJZKlB2z+U3VbVfjnunA4L0lFMP2HdThL5kekS0h3g5
         EiZNN+WbSwggdjKY2QKRvizNhupKPLiCAKS/UZ5czUlAXhI0ts7/z2uYCQ7qGGR1SAkC
         ZuMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783920170; x=1784524970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rX2n8/wl/aZ5m0mAvSyZH/8f/EcwdRtpFwxFW/vqR7A=;
        b=Q6JAOpNjnsxsXiAoO23HW7UIXLNs0bOIvuPO2nULMqXUdYSS5quAZJacU/zyGgpe4h
         V57RSi2lWxQOdQDbnIQ5WcIfXeXEfUzGiIe+fWW1C2FfXpgkZW4wghHq34mI7OwXPlFi
         WKY+CrrP+3mGMTnc7p+X4hKrNn34QOVYtf7OenvjZ/BPklJjSFhzn42fUGQ/RTqXBiee
         Bx87ZAYha0pRtkCvPxdNNMadSA7UoabT02BZBT//RVYXlPP88GySjQYlwCHKE7jMxNVD
         UA53kqrEikq0/28oCMZsBpgeO290QXTQCGvL5IlRzQdLARZAHSe6RN/BW+OdnsCULSMA
         UvHQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZjWIPXr6bbrR8QPWvzqDMHycz3Y3nfMuvM7TdVsqvEjbdpOaITW7dVCRR9/OO5SrF8ElG/w2nmKGSbB0R@vger.kernel.org
X-Gm-Message-State: AOJu0YwbPVbyZ3zE+xtpABczvCruLF+JzQgTTSLQv+olzxg3LJYrsJji
	54OGZIdX17Cd248x+g06P8lvPCtxXcFUw3X5kqOTISDpmUIWSirtuy3zyI5WHBKLfbBF/lFkiED
	dBXQ2R9pmQQOD8N1t7psMAzlAL9tJbKPhfGb/4BQdOdzJhsEJm5aGp9DAuoz5MhTwFs/g
X-Gm-Gg: AfdE7cnxL/acELh3c9fAhyNGxZcNuqgVJgNJ5sasX6dQ2YfHn9No89h76MMDok8a2k8
	NCxRbJHpQ39Dd6ALIeB32kaNz+6aMOd0e5/bdI7crwiZza/7R6vyJAMxPpnXbiBHz3TCoJ4dYl9
	S1mYxlO6z1j/eA1qeICjmfYPS+U3LJ7+kPEYPRfaMgolVi2EuiCnPLTC5PYF0RrUUdLpCSPCs57
	iJq+fkca+uWGLHKg1Z1MYhXCzowDr+rjZiTFf0kMSqTFoLuvoNEsW0pn0WrlgEUKwzYm36mqt6q
	3VAx01ADKUn5uM7sHil6dUDWFDQuxrU5W9404NGajuMh7xPDzRHvFbraDS336BftOguGtywc1Bf
	d7jmsLCirQY+9PMj7hB7pzeALyLwkehgWElaFte2TIVI=
X-Received: by 2002:a05:6a00:139c:b0:848:4c3d:659f with SMTP id d2e1a72fcca58-8488990d0b4mr7089163b3a.75.1783920169870;
        Sun, 12 Jul 2026 22:22:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:139c:b0:848:4c3d:659f with SMTP id d2e1a72fcca58-8488990d0b4mr7089134b3a.75.1783920169350;
        Sun, 12 Jul 2026 22:22:49 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca75ef0c30dsm6245605a12.17.2026.07.12.22.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 22:22:48 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v13 2/4] misc: fastrpc: Replace hardcoded ctxid mask with GENMASK
Date: Mon, 13 Jul 2026 10:52:34 +0530
Message-Id: <20260713052236.3033744-3-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713052236.3033744-1-ekansh.gupta@oss.qualcomm.com>
References: <20260713052236.3033744-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA1MiBTYWx0ZWRfX7ZiBNlKoTIgU
 4zqFi50lRlZ+JNgVlSd0onNbMsRStDx34SZihXF/3+mrEqkrJzCbezD8mpOujqOSxU834ir9+BD
 0u3Y1eNojFiGDGSUvOyKQt7LNRYG220=
X-Proofpoint-GUID: HLO8khL9YgLYWxH6iiCXVYbcm8WYJ7nC
X-Authority-Analysis: v=2.4 cv=a7UAM0SF c=1 sm=1 tr=0 ts=6a54762a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=HL6mAI18knL3XnPGOeUA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA1MiBTYWx0ZWRfXyDpaNn2nA3d8
 /T1m5W52mbkmbMkKUeIcnEWNtGqGSnakNv0C85R8XR6shDH6wtniQlb18e2Zw1cx5SIlsSMaJnT
 k+ohz+JIFQIk/JV+DgcxRqDbIJMl7eftJ0E967vZXmfuo8v0XZL3e+lw6ZvR8YJIpIgiuZ8DE7a
 +rwZroYlkz3KO4wxHeywDKc8wb0KxhAAXiUpKtoa5cHJlWqrZxmGVZskuhWFeVWfjqfSP5NWh6q
 0K806FeZ+Ks/QJV75pCg6mDD02DP0mAh+ylhjF4RHJUIKHdNO+QAR7rFz6VuxpllY/GoawJM8BP
 dzM/0H/RQlip+OGExDzAXbR0CkVuYqXr2+ZQ/T3wKkAyusGGnK0YL4e13nJqvS9up2fvh6zurEm
 9/bd92sufFsuMe1G7Zc21WB8KLZ4/dA0BrppLw1LL0x67XkpTvDh8f4N6YgZjGjaodf1Oy57PJa
 DFl295V4d0U3KcXDTIg==
X-Proofpoint-ORIG-GUID: HLO8khL9YgLYWxH6iiCXVYbcm8WYJ7nC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130052
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118628-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:gregkh@linuxfoundation.org,m:quic_bkumar@quicinc.com,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:dri-devel@lists.freedesktop.org,m:arnd@arndb.de,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C075E7473F2

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
index 02c2765e1188..41c2ec0bc628 100644
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
@@ -566,7 +567,7 @@ static void fastrpc_context_free(struct kref *ref)
 	fastrpc_buf_free(ctx->buf);
 
 	spin_lock_irqsave(&cctx->lock, flags);
-	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
+	idr_remove(&cctx->ctx_idr, FIELD_GET(FASTRPC_CTXID_MASK, ctx->ctxid));
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	kfree(ctx->maps);
@@ -704,7 +705,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 		spin_unlock_irqrestore(&cctx->lock, flags);
 		goto err_idr;
 	}
-	ctx->ctxid = ret << 4;
+	ctx->ctxid = FIELD_PREP(FASTRPC_CTXID_MASK, ret);
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	kref_init(&ctx->refcount);
@@ -2547,7 +2548,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 	if (!cctx)
 		return -ENODEV;
 
-	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
+	ctxid = FIELD_GET(FASTRPC_CTXID_MASK, rsp->ctx);
 
 	spin_lock_irqsave(&cctx->lock, flags);
 	ctx = idr_find(&cctx->ctx_idr, ctxid);
-- 
2.34.1


