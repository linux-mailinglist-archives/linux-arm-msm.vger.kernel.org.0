Return-Path: <linux-arm-msm+bounces-103283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIZrNDJ332ljTQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:32:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52573403D16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDD673115F45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02A873264E2;
	Wed, 15 Apr 2026 11:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KGmANgAW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZTd/AMjk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14F2379998
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 11:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776252347; cv=none; b=bsAvNbq/rC46FvEWahE57LDZTLdpBOmNHdZQL8oF2DoEKPDHYAVfdzxybZ9ZkkytfWi6zWLmhJFf1NtdR7FS9hGaMoCMsj+CDYJ/IOx45EL4n/lG1bRsaAIvsBBVdajCslj0Vk5LqfpKXkLeUhICNhS6ZL+jR02DPsAdocUgYAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776252347; c=relaxed/simple;
	bh=17Ef71wpPprYkzSdH9NRRGCjdmeEYelFAAr5q3M9YqE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rug98azLeTIQxIAnMeT51mEnlKqTXy009iartDcB1GxiQxba83DsezLpmPzW8jN+rHgL/dVyQaAsJCpt7bQGM0W6xomVNciajgTE4Zwred6qcuiv20IJInjOeAGYGwfdNsr796Ye6jFYEI4gwvUrk4CBq5r64FRxk8rkTlGyGXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KGmANgAW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZTd/AMjk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F8wViI2005539
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 11:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TZq/rLCuYKP
	zZ+3bFaDBlw4HhmEskTpGrvorY5Ef4Mg=; b=KGmANgAWlCO1gEeQJ5VVozAh+zm
	sV+Ldiunp+1ulSTCnd98Qa/7mY/LRPY0O+3WpJEuCyD6sMRGIrRJDC8AP25bMX0i
	fu4X0S+3IHTdKjfbZAI1lFaZXMo4MbTD2BEjKM8DICr1nQZF5DKWl96zijCvTaMF
	AKD3MxKtzrsRDBdRhtvU9QeJo/ld6uvfEwZQmkWZjw7PaQ5iTANg15ezs5WnO+EJ
	niUnBiQDKzuXxejSMJsKVccgINvvdA2lm6r0GfIhAUo0apWLDi4QF5GFU8px/qQE
	XT+xA7pwvmcykC/3Nvm9CR+b30UKHCdoe8Ve9uS5nuJX5IJmLYUKLAahiRA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrsjufbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 11:25:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2e6ee9444so42144775ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 04:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776252345; x=1776857145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZq/rLCuYKPzZ+3bFaDBlw4HhmEskTpGrvorY5Ef4Mg=;
        b=ZTd/AMjkU1n4EJv/LLIh2myPbZARifg9qI4UtVPhUNz1tsWn93nacr7KA2Kd0HGvzx
         ii/iX2KBua+y2MM8Gx9AwJT2bXlw94CeYFoDYDrKXiIl7tHSjBs/RLck4GnxlvJZ8/Ir
         5WabpVt+TNrEuMI0YEOmGUblNzlMqkm3Dpa7NsQBxEWcXIcnncCTaJH6Uk6m9YI0dGj0
         /ieH4Jnoa5ZVMc3/OsrzLWQLtaloR78lJXL/3HMctu2E9r1fY07rZ9hzErlb27bAYz3P
         S4HxgphJ9J8h7bxx8vkzXk0IHVwc5U63Gbd3DHBLnzGrbYJORvw0Pp2kj86JQQNmWqF4
         j6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776252345; x=1776857145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TZq/rLCuYKPzZ+3bFaDBlw4HhmEskTpGrvorY5Ef4Mg=;
        b=Cxf1CBBXjcze7xr89LXCU73tHn3i146bBkOgIRwPQ16WbSWKzGGZ3RunkxeMCxDiUR
         0t1QdAhdjZA7RWo9IqBx2nG8CI8LsUIVjQVOty16PXqkoA8sFrLB3rRakK0/lidO9AsB
         inmOvjfhLkAfotftFHJTDmFoNKiHvEv9JLRW82UI9aQZwHF9oo4vw4cnEyB7nNsmn0DV
         koLe9yU0pslX7+hiLt9oM76bRlf4eDybbjmB2aaTYVAgJ0n4YPvHWddWgusJmLujZHmp
         EZvsoxUdpcMWrlSww2kYvx1kBRswIkMnu3L0f5sPsrF9okU5WWRSof5rucw25kyApXHG
         4jMA==
X-Forwarded-Encrypted: i=1; AFNElJ8CiY5NOehTf/1hmd9sIUuZW4oJh7VfN4vW+TbzPIncp5bUJ1m0Nfu7DhpQPbYF6z+ic7Wc8Pt1boOZDA1s@vger.kernel.org
X-Gm-Message-State: AOJu0Yw66tNnRTfVuD13vhlXx7EOao1zuVxjVZRkTVC9E442oWwxK+Ne
	ugxuZjPIdXfD5+XJhVpRWEGLZ6O26D+vB/4Ecb5P9BOy1ZZ/W+JUKLFB/0wHS9SnH7AoAH+iddi
	JyBH3/zjCJTKkR7ulk6faxKhgNRXc5n5NooCdNxy9KDZ1KznXjZBACgFJwY4KEF7J1rJp
X-Gm-Gg: AeBDievYhR8gC6GScq5pge8KuPMwXhB+blGE6Nn2AAzCv5rGPeiz3edDMBK97sBBv6a
	wDKLHsrqXp38D2j7RbS/QEw38HL7moE0pKgIdoBay6Q1p9L3bnC18Ag6CiMeXlS3hjNFx5Wn5eC
	lRIXtUwsjrIQS+9NW++kSHXYsk5k4C4UMqo1DAEPF8OJl+s5FHLuHSgBV+1nCOkVKvvhKH2zaBv
	DUp03YQTQ/ZQ+xWkkfxCKiGvQI80ETb08Ex+0ASbiS5TjfFkVizkVUODESVE3Bkhov47dVaXjTf
	UbiTX4qQ63vp1zUrppleHNRWPuWqPaY+gwC6FVDJjsScqiBTt0tgQKedXaoT/SHSotiTmz+J8Ym
	9JCdWgvXR5BDYZ6kRqmz5jI9YlAZyRPFXPtd6FwvWKqmqxH/vl4T3okTvb7H5l+Sd
X-Received: by 2002:a17:903:38c4:b0:2b2:4f43:b49a with SMTP id d9443c01a7336-2b2d5d8ab1bmr197871745ad.22.1776252344511;
        Wed, 15 Apr 2026 04:25:44 -0700 (PDT)
X-Received: by 2002:a17:903:38c4:b0:2b2:4f43:b49a with SMTP id d9443c01a7336-2b2d5d8ab1bmr197871535ad.22.1776252344070;
        Wed, 15 Apr 2026 04:25:44 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b4782b6fd8sm26794325ad.73.2026.04.15.04.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 04:25:43 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        andersson@kernel.org
Subject: [PATCH v8 2/4] misc: fastrpc: Replace hardcoded ctxid mask with GENMASK
Date: Wed, 15 Apr 2026 16:55:28 +0530
Message-Id: <20260415112530.4083240-3-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260415112530.4083240-1-ekansh.gupta@oss.qualcomm.com>
References: <20260415112530.4083240-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WKhPmHsR c=1 sm=1 tr=0 ts=69df75b9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=HL6mAI18knL3XnPGOeUA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: dkhIGD1Y7NZ7LlL95BtS93jv7g6gpH8-
X-Proofpoint-GUID: dkhIGD1Y7NZ7LlL95BtS93jv7g6gpH8-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEwNSBTYWx0ZWRfX5P3tapTYEU+v
 UCmJ82V0n9iRlUEFUzxPbtefcXgbTPcmUYE0nSyVXI/0iqe6pniiQLANAs/HmK1WZ4W5oC8k3Yf
 XDCm2+L9u1IcX4S18pgvKiVyVCN7aj77IebJMg493zllYxRlzF5/4D6i1sSx4F4Zin82FJ2nsUo
 skuAaCe6BXNxUDZbVNTOi19pQIPAyLg5JfEVuqINHH9mJ4DpuLRMXe/hZba0R73ygVYGrOE4HSz
 oCrGlcL3QL93SBIQqtXjWxvRN7HGDYu7DtqDTIlCUHyD/b+zMjA6lt29alCI4FT7LZtEkRC5Jx1
 ditPmtoQiTqdT8ThV0MKdTR/F5s83tqQjLRBU1+pE1/AgJoPgMbaP5Qk4KLv4V1D5aRP8sZY9ve
 4NuY0Z4rT0r601FQ6THuq2Cw+jBaqBigY5SKB5Rvryz6xHDn8HHjYMuRyoKQmcPSCYNtfxoyS3f
 +mozZwNMYoiOOCkG3wQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604150105
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-103283-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 52573403D16
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


