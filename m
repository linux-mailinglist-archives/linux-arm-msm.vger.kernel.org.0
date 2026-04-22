Return-Path: <linux-arm-msm+bounces-104088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPXJHsyv6GldOwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:23:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E669F4453CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:23:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF40230515DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F382433E34E;
	Wed, 22 Apr 2026 11:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i2zQ4VB/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="czaKztZO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904113CFF41
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776856642; cv=none; b=RQ4sfrclxkGeKakPt1xfrmx+KYOLobisM3XRtYCqm5xMh+i5qsN6W2PR/bKK5jclG+rDN34dy3dUuBN8LTYhPLnhxI/Cis8sqccD3wgMHPozdi0nuV76Eq1gjIdNY58SvhcuadRBpcCPkuKwin/dnJeEH2QxJQEuyixvZ3ESzHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776856642; c=relaxed/simple;
	bh=Jbh3ewlZURHGfxOIxegETw5Vx0Yr6tndGi7C/P8xCaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AgdFaM3GCt5ppkfyYaUZWbX9gXOTj4RBxbrHT20qUM8ff8yXuaoM1X7xlyhVSUk5eRxv9ON6zDcoHhUrH449QdyqzNWIUKNzq2V0sHoLwL0AtqzkeqWK1FdhW3CcvqM7mIumC+UZbGt/LUAb7E7XOetmtaMmBFkLX9ILWrr2MQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i2zQ4VB/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=czaKztZO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAGSJk4051047
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rKFQPgjt7eYtDdi6D75h2wv4cgPqa3Hgwpc1smHTUzY=; b=i2zQ4VB/HX0Tjxyz
	fAHYm4iwcjXu0FQisdj0mQ4EU01nHSXfoK/Q1Fm54NyO8EeTaaoKS9EmH7fL6Yf7
	BgkHIGz1Z8wWPyT5FPwO0+1/jBBofafFVEy+LQ/sy48HyFa0DRI1f5uv3h8Ls/Vm
	mhY6itvR7Eej5jsYCN14PrPushRx0wZmi4dV+9yUo3MDT6NjqRNXVZa2R/vf2BfV
	N2jMk5a2/9a8dMD8D5H64gh18rXd8QU2btyH2P/Kh/mw1zWyX9dNGoGd7UAY3ZaY
	C1rKLppBCAjzYLuBq9DdlhS4A+51gSxE9Ntfhl+5C5OAn70hNpipocR6hpUym/js
	+1cLMQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfk667-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:17:20 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa7c6699fso4881565b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 04:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776856640; x=1777461440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rKFQPgjt7eYtDdi6D75h2wv4cgPqa3Hgwpc1smHTUzY=;
        b=czaKztZOfzmSZrIjaFQhB1gvj/LrnkOQz90VAhgvGPZ7xd0f8pBk0uvxDfUAbI3/FI
         PDHpUM7FW+rL+K5I+dgeC8MA82Tb/ABDfRC0DHMrZusxrAt7olQR8OT9ZFftIPV4s6zL
         6q4Xgm7zKQKNfGndSHxfXIoqFf0DVOjp9ZEKp82QQBAo7mVtzxHuv807ztbDSchiYD9F
         cTbxKXVeiih2DVJX+Q/ghUTA2+W8dhT+kr59o10Xpli+AwKMj7A9DEFyZuoSyu/ZI6s9
         huAGOuoqIjR27BcFvqgIMwycQKWNVQrG6fXzi9bnRk+iTH24BHdwjZp4ttD69TwkvGkc
         D1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776856640; x=1777461440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rKFQPgjt7eYtDdi6D75h2wv4cgPqa3Hgwpc1smHTUzY=;
        b=BRs0cb8g6m2hhjwaI3Ik3Q3ECTtCIKkWXjAEbB7vQX4cC/16FuzAkpeKogKtpAZC1B
         g/c8Pd1Kjo+Ec4K64MQGBYIKAanpRR2kflxYFUzKmIM5rHlF6mvLjC9DQqB0VADNkqCL
         dPzNmCsCH+owkg9fD9lISllIAvu6h9o3nOrSZj0ZgHrVv4SST/RXg4bygNohkgqAtiF2
         1OsDfTP5dS7Mkw8H9frn6R8MSLUeQYvpggtB9BhSs9CQzyzLzmoLe1Ak0yqv9rgzNLjb
         lxYwLPvT6zVlA3GPTToKILZ33WOVh7OiMYhkZ6Bib+O1H/uwv2NJ97x/6MmK+mLrKDjT
         cV7g==
X-Forwarded-Encrypted: i=1; AFNElJ9uHbg6Btf2BLDSDGp9Sq4cpELL6TrQe1VzF3iUqVoD3hfPlcspikeL2Wp0VnJxOMYeZjfjAU9x3ou9BPV5@vger.kernel.org
X-Gm-Message-State: AOJu0YwNERDxPTEYWXB2LUWeHYzyuDgCbsSWbKmRglwPe1W+PGx/bod/
	LELM7Kp/Kljh70n+p+dWtGpfv0G3tcfrFKCnNdvvGjTxMSe4HQGuN+xwpUbrdHmUh5SQQb+0Rzr
	dRoLLxgtZ/Y6aBd+5FkcIeZHqVhYGJ69EP2u/Up6XMPXhuv7slUh3MVfUeJXJj81FIrYK
X-Gm-Gg: AeBDieuNRS+TLHSDmibOy3yNi0qPaMHMdahLon+VAFzkXRNcz2I8WJGCsz1EfSzF3cE
	jkaJm5kipqDPT4TL21VPEKgob6yHK7uJDax752qovDVg+HJHbYlLE7KAizKt294eAoMuggSYLDf
	FcmTYWPYfPu4EO15ucfZ/f75vJIBIAfAtE58daRad/GmVDx6yBWMsE/s/kMaruL0lFgxhQwQE5u
	hJ7+EJM0B5TRDzl8/r8+FHPoTRlpNIVo6OK4fOGG8RJMfL/X9bZHT5Kfi9m4N2TlEaLkQERcw9a
	VdOmEmc3wD2fbumbhOpP3Yj3ynvwIQb4kzk8CDnGrCx86GwAuZvtK2yBHwhUw75HytcB4ktGSMl
	hdQ6n9gC+Puzcu4bxpK8OFmkGLBklq4G+cT5cm0sSLThLI7/DM8swYdsQWwqBKBD2vNWtKg==
X-Received: by 2002:a05:6a00:4b54:b0:82f:6e39:d90f with SMTP id d2e1a72fcca58-82f8c93d102mr22724210b3a.39.1776856640121;
        Wed, 22 Apr 2026 04:17:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b54:b0:82f:6e39:d90f with SMTP id d2e1a72fcca58-82f8c93d102mr22724164b3a.39.1776856639622;
        Wed, 22 Apr 2026 04:17:19 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe901csm21100782b3a.48.2026.04.22.04.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 04:17:19 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 16:46:40 +0530
Subject: [PATCH 7/7] media: qcom: iris: Make iris_destroy_internal_buffer()
 return void
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-iris-code-improvement-v1-7-8e150482212d@oss.qualcomm.com>
References: <20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com>
In-Reply-To: <20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776856606; l=5103;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=Jbh3ewlZURHGfxOIxegETw5Vx0Yr6tndGi7C/P8xCaQ=;
 b=vhCvl9BVSmEHYFqdsKw/GzOArLPagrdO8KKMygn95x01akdnU5vkj8fZp9z/Ht4AphpqHiu6F
 GlzczV/0n8xADfCdqbKk70jFtL/kiqsq2AT/w8bl8uz/dUuFRen4LsK
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwOCBTYWx0ZWRfX8VvhDOMFinpe
 X5ovCkE83BIS8KCht4QhvosYOP3BwCzi7zUmcOePE2YF0Spxtv6zD6J+x1O/5+XNSsIdKKWGFza
 oDoxzgxtjxHx+YZ52kqYbI9cncHAuT3bYTdaBgs5abh9f3a/OJjOxUp/FM/35WDD1E9Exu3D9lR
 pAEBQfapQrJUlk0Dn99mY0W1ivUn71oHS1PeR2DSWD41fxvICf0Y3jDKRcleunZ8quekIIHwhVD
 nV6mUjg2jqEkQkL0Gl3KLYgzOTlBKgllo2hn7XWK9JUoBgPVhGu6IdWIKcfWoQTmgZazuqq7Kih
 CVLLU0DhbWeOUC5j7amZV3Pn3nwFWTtQrQfRMX5aa0dxW0xG7ZWfFnnzdnHThx9/m6JH+XxgZmn
 E0TVSbXTw1BCbUN0knKYfkJpSNynw0FxzP9YiMtTl/CmMHWzgDzdI9M9TEHPCzFWRsEZKQpa5Zo
 Ki+U9+KMiphjqxLRokA==
X-Authority-Analysis: v=2.4 cv=VMrtWdPX c=1 sm=1 tr=0 ts=69e8ae40 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=U2F47QYUfY1_dUrEBYAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: vRi0D276J2arj9fqSJdJQQS4oUssVtbl
X-Proofpoint-ORIG-GUID: vRi0D276J2arj9fqSJdJQQS4oUssVtbl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220108
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104088-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E669F4453CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

iris_destroy_internal_buffer() is guaranteed to succeed and never
reports an error. Returning an int is misleading and forces callers to
handle a meaningless status value. Convert it to return void to match
its behavior and simplify callers.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c           | 16 ++++------------
 drivers/media/platform/qcom/iris/iris_buffer.h           |  2 +-
 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c |  2 +-
 .../media/platform/qcom/iris/iris_hfi_gen2_response.c    |  4 +++-
 4 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 137a69c99bcc24a72f4f27e516b8fb4d6509c0ad..2da0498843595d3071040d45f1e605f8814f87a2 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -455,7 +455,7 @@ int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
 	return 0;
 }
 
-int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
+void iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
 {
 	struct iris_core *core = inst->core;
 
@@ -463,8 +463,6 @@ int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buf
 	dma_free_attrs(core->dev, buffer->buffer_size, buffer->kvaddr,
 		       buffer->device_addr, buffer->dma_attrs);
 	kfree(buffer);
-
-	return 0;
 }
 
 static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool force)
@@ -473,7 +471,6 @@ static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool
 	struct iris_buffers *buffers;
 	const u32 *internal_buf_type;
 	u32 i, len;
-	int ret;
 
 	iris_get_int_buf_tbl(inst, plane, &internal_buf_type, &len);
 
@@ -488,9 +485,7 @@ static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool
 			if (!force && buf->attr & BUF_ATTR_QUEUED)
 				continue;
 
-			ret = iris_destroy_internal_buffer(inst, buf);
-			if (ret)
-				return ret;
+			iris_destroy_internal_buffer(inst, buf);
 		}
 	}
 
@@ -500,11 +495,8 @@ static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool
 		else
 			buffers = &inst->buffers[BUF_ARP];
 
-		list_for_each_entry_safe(buf, next, &buffers->list, list) {
-			ret = iris_destroy_internal_buffer(inst, buf);
-			if (ret)
-				return ret;
-		}
+		list_for_each_entry_safe(buf, next, &buffers->list, list)
+			iris_destroy_internal_buffer(inst, buf);
 	}
 
 	return 0;
diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
index 75bb767761824c4c02e0df9b765896cc093be333..ab8e5d953101a786ade20540ee3c3ed226160cbe 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_buffer.h
@@ -112,7 +112,7 @@ void iris_get_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_create_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_queue_internal_deferred_buffers(struct iris_inst *inst, enum iris_buffer_type buffer_type);
-int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer);
+void iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer);
 int iris_destroy_all_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_destroy_dequeued_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst, enum iris_buffer_type buf_type);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index e42d17653c2c37f526e6b26c6e29cc45ae29a747..d1114e5ce7788c5e803ac7aec505a6115997eb27 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -442,7 +442,7 @@ static int iris_hfi_gen1_session_unset_buffers(struct iris_inst *inst, struct ir
 
 	ret = iris_wait_for_session_response(inst, false);
 	if (!ret)
-		ret = iris_destroy_internal_buffer(inst, buf);
+		iris_destroy_internal_buffer(inst, buf);
 
 exit:
 	kfree(pkt);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 8e19f61bbbf9e427f658471b4502bedb1ad5f616..f5c342f4c926a68b2017006a3c1cfbb251605ae0 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -447,7 +447,9 @@ static int iris_hfi_gen2_handle_release_internal_buffer(struct iris_inst *inst,
 
 	buf->attr &= ~BUF_ATTR_QUEUED;
 
-	return iris_destroy_internal_buffer(inst, buf);
+	iris_destroy_internal_buffer(inst, buf);
+
+	return 0;
 }
 
 static int iris_hfi_gen2_handle_session_stop(struct iris_inst *inst,

-- 
2.34.1


