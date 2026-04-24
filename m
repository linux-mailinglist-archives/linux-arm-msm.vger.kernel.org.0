Return-Path: <linux-arm-msm+bounces-104419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHevGmU/62nZKAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:01:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B0445CA9C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:01:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF28B303207D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 09:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C3F35A938;
	Fri, 24 Apr 2026 09:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FQ2e6FWR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CjKWTe4t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9669535BDD5
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777024762; cv=none; b=DWlVqlEAtuh/HY1icUOyc+3e5ZbmJzX1KDBZ2ElAaQm9bI7r55PFjGZNFCDHiqn21plT+kDdyX/mJNsygatJ1YmZqLQbWisRN8MQS0MmhkZ3pp0jvcW5h3Qt2i7sJPssymSPOejhCPjASsXFwi/UVRf8SNfGgIOejyufhVEkn6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777024762; c=relaxed/simple;
	bh=1ddE0U7h9weXbIaT7HOzewRICM+9yO0cSWfl91aUt5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TgyISb1SGv/aro/9SfbSj6Q/1UYUN15wdXymCfjAxtwYHnqrVNibuU5HcXU34ED61M8kV4fw/XWIFF8rD9rx6fSvOKWjNyoau4XVW7B91OTjG0eJsYV2U2iu5OWcs3XatMI0J9CYW8/L/8zL7NBvOW6t0TelXQMU8XpdG44kOBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FQ2e6FWR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CjKWTe4t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O7GC8K1823216
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JIaEBu2fXti
	OblnnO/rwwIoef8J83XO0Fyvu0X3nK9Q=; b=FQ2e6FWRljlMUNbVPh4e9UcRVw2
	nb+bAB7ZnDazynDz1UA9VQLn4jewRB2iDOyqxkpIyJu/k8WKKn36Wtr/VdL1GV/+
	ZItwReRkaBA83DiIRFM1SZzHX6lBiL8qV+gNyqxHtfh8IwrXPSDAaKEN4hSlGq8t
	dzxl2fD4dRli9oTon7uHxVkwHPgWzbgQaS+k1GuQBxUv8vqSmdL74Qup7H3YO6RB
	npw+A2j9najKyOX6jSjPfwnm110QYUm7MY4p8MJwtR1Mp6s1d8+3Pk36+dmGZDwp
	mMElfAtvCagGnPmoWw+5BiEESyCg6kyVC1c8NEgNSpZDWTg73jxsdd+tdcg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqv5rt9ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:59:20 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6097ca315bso11378944a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 02:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777024759; x=1777629559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIaEBu2fXtiOblnnO/rwwIoef8J83XO0Fyvu0X3nK9Q=;
        b=CjKWTe4tLg+IGCIEI5oScVx16KoU/LejP18Zya4vTvIDL0Q0SrCfLtvcyhhKRNbSCv
         W3tf7k6oeQYhBHlqKGY+gCxwqxeBqM3nkwEePPTFQnxIt48PtAnW3WbE/QH/bHLlwVH6
         MCV4yfnLbBp/BC2sc4iJ+X8z8IySk7l050IDB1yLi44AFyUvmvLpcTq16Rbdb3B5EpMC
         Ed/1Wb6dBGb+c76iaVYr5p2YtGI7qqEqduxJdb9Q0H0tz6iJyV4C4DQ2a1twRpHZ8wXs
         IeAig7o6INL0ZK70qeCwl/u+1Z9s4qAnbsxrkcUQ4zDB4BtAvQjySh9aOL9Qlzht2AUG
         LXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024759; x=1777629559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JIaEBu2fXtiOblnnO/rwwIoef8J83XO0Fyvu0X3nK9Q=;
        b=JanZ6iB46heN6QHjcysxVJedoekPo3MBEIZmxF041Tidk7wxauIfHsULz9Teu2JCQI
         PfXbbY5d0IK/m3ulzn41JcpbwGJjkepV4EOARwpoerPDnlQpTWd41kHKOvEVKxu+3ywE
         yB/bg01vGb4E6bkKBg0BP6v3nbZixCC22T39Z+9+T5Azhfv0OvGlqAq/dlF5e3SmnF/f
         OLM0iWKhQMDav/owDQVeuk/yrFtfT0ONtJR+JBFFLueR4u3TcS3AUfCM6+Ebe/AZGLI7
         XtSJEb4uH9r6THXpmcesMlafG2fXt8oZnqbuekTN7KDuIHipQ7b4P52iOuhQjG9KYZcP
         azDA==
X-Forwarded-Encrypted: i=1; AFNElJ8Qwhfv7tApcDv3DYEQIuWKp9CsJGhi8Ajk9astvo9mBdqYZsCzVhg6tFFJzLXupaAdEpzttPEqYmOzXFpP@vger.kernel.org
X-Gm-Message-State: AOJu0YwFYvMmWfym1r5fhN9IS3YHzzWwZFLv5K7Auqfc7+LRdtf85E0P
	mAHLY4fYEXLl7mRaWs+sMoSf9EVH+MtFr7gKnkdHuIpP7GBI6Fj9UJFLDvaZ4BNg/VbBt2cl/5b
	Fse6oNPd+tE8Srh77KI2usM0tLr805an5u8sRQG6WdMkzSIJLmRsUYkeqNHeZU2Gvfm43
X-Gm-Gg: AeBDieuO+U0iIB4vv0Kz1f9qV9e7V29JRIppZhShUSz7AecbJ+lFbuFzi44wga0rkpD
	YPLaCy98caGZgJEotOw401HC8BZMZrqkIwTdx3qdZ7jdtoqJHXoP4LnXsQxaOpZJ3Aky8dluCRZ
	jXO7H5YnGbtTbyLr9IQS4yviztCOB1vy7CZG9hacXf+XiPAKULwuIDhDq/bE0bwNmAjuMngGCvG
	H8CogAY8KxKV27Kt7wc8AFJmKrGDsbZlYGrkLVuWN7JX8x4AU6BEcP+hxET+8/l2+MbSqGZ9uNd
	Ljf9aOscBSomL2gUDZdaEspYW06S2b7vMsYlXgWPmrgEkQfF0//PzoRrlqWSL37caZ4P4vNi0ek
	NxcEr2kfkb0VFvCe1cmT2AtNlrxIPahlp2YIKp3DYx0UcIjgRzDVXdWncQv0DOhFr
X-Received: by 2002:a05:6a00:3498:b0:82f:4566:bbdf with SMTP id d2e1a72fcca58-82f8c862662mr32861541b3a.14.1777024759373;
        Fri, 24 Apr 2026 02:59:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:3498:b0:82f:4566:bbdf with SMTP id d2e1a72fcca58-82f8c862662mr32861517b3a.14.1777024758896;
        Fri, 24 Apr 2026 02:59:18 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9d35acsm23679702b3a.15.2026.04.24.02.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:59:18 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, ltuikov89@gmail.com,
        konrad.dybcio@oss.qualcomm.com, andersson@kernel.org
Subject: [PATCH v10 2/4] misc: fastrpc: Replace hardcoded ctxid mask with GENMASK
Date: Fri, 24 Apr 2026 15:29:01 +0530
Message-Id: <20260424095903.1622565-3-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260424095903.1622565-1-ekansh.gupta@oss.qualcomm.com>
References: <20260424095903.1622565-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LqiiDHdc c=1 sm=1 tr=0 ts=69eb3ef8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=HL6mAI18knL3XnPGOeUA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 8MESKdS6dT8oph8hXvNH250N4Fwjr-Xb
X-Proofpoint-GUID: 8MESKdS6dT8oph8hXvNH250N4Fwjr-Xb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA5MyBTYWx0ZWRfX8IvfMNbufpFh
 8y1+Meek4+3d7mTY8efVLUs1vkImR7nbYcj3hWuxmZWfd/hQFMsfOFBRLMukG1vgUuhQIlfBgwf
 Uvhxknq8BKL9iMENaSdPJdaYLHjgufeIDHUjdDFrEimgsxNm0aykXvMCdcUPDjHPkzoB/vgkyZv
 38pLzt8LWnQVO5yEBg/8O4FCzXwKMPZlrzIJXSM86oCTPiN1pVQ3sj42W5TNAi+pjTiEIjmMcO+
 inRfWZ70m9FDFreSq6xRGGSSljIRm2QKmGLrPg/+Mm5gkXKo0XGxFxMnrTtvq7U6wSjJ1lb0Ayy
 f4UxQ5Yw6Eob3bdMfyeYZP8PYR+7MjzeAibd3WzUsSpIPLWMLv7vREg6TP93GWzv1rDnIxXTpah
 vf0jjmlL3Vr/CFiYn9xdQ4Ba6yqlhKHE6g7IfKrNSXNkWKxYNfA1B7mNjKZSE3r+YIP7B8K0S9w
 c39rn5eOHd7zT01o5/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240093
X-Rspamd-Queue-Id: 03B0445CA9C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104419-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,quicinc.com,vger.kernel.org,lists.freedesktop.org,arndb.de,oss.qualcomm.com,gmail.com,kernel.org];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

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


