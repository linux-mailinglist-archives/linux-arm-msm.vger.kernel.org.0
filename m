Return-Path: <linux-arm-msm+bounces-104050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UF4xDFiU6Gl9MgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:26:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 974CF443F1A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:26:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7D673042E9C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 09:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 395973C2763;
	Wed, 22 Apr 2026 09:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g+1nmx6A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eU6lyK8H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A1F3C2786
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776849868; cv=none; b=F5YtC3doeR+84GX4UL4KhmcE8hQ2asD/xlgMyeAbC4JpbBVvRlzWKrxCqD0I5m6jmjQy4jbJ6E9nh7aQCcqmztqmNHFzt3cs1NucIWWI0rw/FMJ6RYs78PgRLU6jVR8v1LJg/BuqO8hYr2dMD0WMw463SP/qTJ/VWvJZKGbt4v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776849868; c=relaxed/simple;
	bh=17Ef71wpPprYkzSdH9NRRGCjdmeEYelFAAr5q3M9YqE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=En9LfcFzMQPn/JjtoDCiYnCW+JHH2XQFWuAtn4Y8pFejPZ1ySyyoWB3jVV0m1uPcIW/UUZFeg/G64419vtKHBl26ZCEMna8/kk6hKKqTqnhMgXd+xa1JbgHJPP2qO8sBWjj8tmrGAO+LYCV5PlisBCbyB5a+FjDmrnLwIU5hf4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g+1nmx6A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eU6lyK8H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5Gxj82123520
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TZq/rLCuYKP
	zZ+3bFaDBlw4HhmEskTpGrvorY5Ef4Mg=; b=g+1nmx6A68Kw61XVmfG9ABrU1W8
	rp7KU2ny4le52S59Qf2jKYO62ceWjGzm8r79c1h1bfzQ6JEtX71qjyYEIjtaF0KN
	2RPaO02LOc4on1B4n2ZVTc/kNiKpJMBXkmuyU2Slcjg06wDWNfCjHi5tBJyB8sQR
	aV4mePJhFj0M5eolaaK1dGs3TYhxVt6E5jPJciDa3n7Ferkyc7SfneC+0gOr3TM2
	I1+hR7uZdFnVEVfGGVBVKyrdmgnqFeNj5cQ1Q+ojGqf4e9iruPkPAEVNf1+GNTrd
	rGTwhQhY0/cDBWCHBRKhaVuvHDvW1H2vbD7aMkxzTLgwlSHyGLqW9uIUsLA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenftq1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:24:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35fbb5779e8so6083353a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 02:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776849866; x=1777454666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZq/rLCuYKPzZ+3bFaDBlw4HhmEskTpGrvorY5Ef4Mg=;
        b=eU6lyK8HFN2qb+J7aju4+nGrnAMMjpI0195Xg1+DqmHhxC49J2KaLJX3LZclI3EYo3
         /7F4GvjXAV0Z+/wDJtboNYn4zPD+m6oP4XSVnd51seXv5YXTZrqmzZeBxkmUh26CvkFz
         HZuTboG0Uv5KXTMW+zSE82tt5hEl7SU3QzVH0HwL0lXbzpZx193Q6ioSBk8jP1SewO8N
         CyjlrJ6WGQCUsMMYaY+ijD3+aO6HJunvSxivknrjiZXH/ovO3J0DGKorPDOrlM7gnOF2
         3oUefeXugDxFR3BZ11J6PFfQO6gzNyLuDQNqfdzuYJVp8TJm3XlJFPUYPYF3PCeikVPa
         GoRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776849866; x=1777454666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TZq/rLCuYKPzZ+3bFaDBlw4HhmEskTpGrvorY5Ef4Mg=;
        b=NBB0RRS2/K88eaZLp94N8npghJUNWv4GmdRsmDDXLRbICyrYVFvwNic8Pnr+EvI6td
         oiryqK6iQPFDMKia/KAcJiJZIqbM4xZ6/tV2luVlVoV2vEgvDweZXw2VtnN9utWxwdGz
         iX7y0RsfcZRPdT958N4EPnOXhlWl87OUz/8yJG9muo8hsY4j+IHIqrEYwJs80foaOCrR
         9Xbx/2/j3E0/1kzLsmVRxJc2jigOuonSJa8BnBpa4LN67Fjeo9GXltuUaLBkiTWjDslo
         TVCh2mv41q+fyqwenbMxRI+xk86irbctXeThgM0MoUowLHkXCnyJe3+kOJRa6CDAhDLf
         06Lg==
X-Forwarded-Encrypted: i=1; AFNElJ95WrvF/b4/VN2DGLBJRpI2rXq/vK5+G6tzZb1oz9A9uLXSqKeUve8Dui6//3Y3K+Tj4iCo+uBitwNXsoGN@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc1PQyUw/Pu0KQdXkf91KEdJ2m9zv5o4Oo032DeqHxw5NG9sHq
	Sm4G/L1oDjZQ6AGXPWaFCl6d/oNs719qWmhAIHtg9Bq6t/zECNCdJ5d38lagPn96hmfIjb9o0zE
	DNASJ3j4hVUXmiBkq39VYKqU6pyAD+JIaKkOO5kP9T2NpDLTiwTnBkslop6y3BEdsvcNa
X-Gm-Gg: AeBDiesggkhqW2NMScPDG2slbZyq8MtS2K5Q5CX4Z/ygHBh9Lz6efamXY6xpUvniTsX
	xLyEfjvpBfPuN0Z7Gomnxxd8NWpZdhtDIV7L6m0vZOfoFfYtObdCwoDBxTicEp418X4MWd8mwC2
	zPXYxmblJArzmSDBwTwcUwTdfWsrWhWbhy2ljofCyhOKUKW/f2DOincOP+RnbpjC6pdZ5PDM3rm
	fI7fYMchz2lTnpaj8EkBCDcrbqXUJrDX3zw4AYBWfEQS/YEsbRS1mPvyNsnSJ/5+gtfFs7CiKcR
	NdqcBme2+XSb+I1EIElTtf1Hrh9AaMOeLYwsAq4pxfW1O1rflvhG9DF0iNJSwa2w5oq26Cer6SZ
	K2RjThLbt8HlrNOEGVcz4zx0ayGLACArN4a7q7sfpOpwKTddOI1u4YtsnVS9lhGID
X-Received: by 2002:a05:6300:218a:b0:398:7357:bb81 with SMTP id adf61e73a8af0-3a08d748eb8mr23344909637.15.1776849865603;
        Wed, 22 Apr 2026 02:24:25 -0700 (PDT)
X-Received: by 2002:a05:6300:218a:b0:398:7357:bb81 with SMTP id adf61e73a8af0-3a08d748eb8mr23344874637.15.1776849865055;
        Wed, 22 Apr 2026 02:24:25 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb38ddsm15778576b3a.34.2026.04.22.02.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 02:24:24 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, ltuikov89@gmail.com,
        konrad.dybcio@oss.qualcomm.com, andersson@kernel.org
Subject: [PATCH v9 2/4] misc: fastrpc: Replace hardcoded ctxid mask with GENMASK
Date: Wed, 22 Apr 2026 14:54:07 +0530
Message-Id: <20260422092409.4107093-3-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260422092409.4107093-1-ekansh.gupta@oss.qualcomm.com>
References: <20260422092409.4107093-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OdioyBTY c=1 sm=1 tr=0 ts=69e893ca cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=HL6mAI18knL3XnPGOeUA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: AGDVOR-G0lnx7cBHav3PxgmDJstzRxcc
X-Proofpoint-GUID: AGDVOR-G0lnx7cBHav3PxgmDJstzRxcc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA4NCBTYWx0ZWRfX5/vhmnnol56V
 CQ+zuOSGuX2I69q40BmHONQNZ24uH4IjaVmDW9LJjKmk2K8A6Nt5lRFWibLG7YeREr/JhH4356K
 0lvj3VQ8BAoCXvfDscWsOCW0+baQw12x4ZpWaqVviYeTVH9HhX4G+ctbrFFCMfvw81CK0BjaIAR
 /Wb+cmB6a1ybytwU5xdewBzgz5rkLTAMsS/Oyw74wy4hqW/taU4CiR5D2oIncLkUcCZ++f7/sp8
 ThcbwfaJFo5DhXk0uqtbEhzAtFUO5vxNCTVYEPZFEJmsyn4okEHHVXALErJh2TrSxFMmLp7hskZ
 A0y1OJexSzR6r7uW+jTHUfa7Dqkb2I40gn1OySzkuGXR+AEq+GxFDGkoHoLV4pAwiiy7Urv4aIG
 eDLAQmLFSaRrHD3A2DGNXpcLIvUGn1X/GcF4F1lKtfNT8PyTjQszbL6nsk8bxxwAlpTczRr8p9C
 iYikzcQQQOlc4kt7VQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220084
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104050-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,quicinc.com,vger.kernel.org,lists.freedesktop.org,arndb.de,oss.qualcomm.com,gmail.com,kernel.org];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 974CF443F1A
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


