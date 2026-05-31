Return-Path: <linux-arm-msm+bounces-110450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPR9B6DOG2prGQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 08:01:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 505C1614A5C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 08:01:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91FD13034BCB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 05:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F4743233E8;
	Sun, 31 May 2026 05:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pCOD7ycQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RaJtn0zH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0663264EF
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 05:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780206964; cv=none; b=S6MIpKqKUOl6C2ZcbwQnwMCI2uy7IicFQH1sFeTzXdaSDW4ZEBZhfUHMEctWzzDaa+lVDblFLSunk7tKY6/XpEB/gqOqFaFaaV7+VBIZmDe+GtPnXNOaxFY51hoFQnVJWO3hsmRVDiW7KO7z+4gRIJV8dKQBgrmzz7udtE/RjGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780206964; c=relaxed/simple;
	bh=dfU6+dokRmdLHFqF1O48cBLlUXiRI2PArZA5+lK6pus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=scVtyh12pokprmDPrlcZwoenkVavkbjMWnq13CBexzFDEQySf1HhT0XIr7sOO0o6aRqT8i36dgI5j50vrTe3KtBMWXgjzYwYRb/fRylcjygABHG+o/fZmrbuHdtKa2KNpOhO1FZOsP378ZADLktpVOhkC7dMUjFVArvYk7vqvvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pCOD7ycQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RaJtn0zH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64V5KCKB1069059
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 05:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u5VzfpyDmVjM775VKxwIpIo0dFf4yb7OgSjGOH8Q/3Q=; b=pCOD7ycQM4pDCl5I
	Ytn/zrgRMi5PBiJAk+AS+UGW9BI9dfH6MLeVDajCQlEkIebBG3hUTyCYusiPC9j6
	EezxCPQnvXgGW1wHjQCobNljjT/siEUlOmkXppi79CDPk4yLL9Gbw3rl7XX9zKIk
	jzBKJmZgpgc/+djaF2NyVHNZyc3J3kJqhBjUkwrcI7oKi95EPkKJw26cyFVlprHC
	w44gOa+TaJBp//RNRfY0SHOrPr97JbMKPEI3AZlcvBdwRY0cVvtyRJyvOZvp2sP+
	hoD57QdmmJ7J6V9tcA8dhbHGZ1OrcSyVBPhXCLbQWONrlqa2jUeCD8tKiLuMEcPq
	+qyN6A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efr98asms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 05:56:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bfdd99f6b7so18713705ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 22:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780206961; x=1780811761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5VzfpyDmVjM775VKxwIpIo0dFf4yb7OgSjGOH8Q/3Q=;
        b=RaJtn0zH9mfcS+3MYaa5va7x4VA1yniNjlPmipVKIuWW7dAvDc0UVnkk/1vMU7UKVq
         YGseIofUak3J3V3GVOOop6hY+kxoGAxRU3a30Ec6jYR4Y+i4LE28eypcn4PlMZyt07Hm
         vEokxZ75v7IxFv3RkZGd+GRn/BRTOJUuPVNs2lEHE8lAmirOjYfJUnvpIloaqpjxu/uz
         aRwGzc0Urn64SJYJ8i6lkS1pFhoL8hIrRrMGfii6RrX+mazCPryJm6VnnQbvLDbM3JbT
         nBgSHtWomkQddA1/sIUK74Ig+KCEMaVsMr5/FLkO7BmEviXeiCSzLsgfvtr9cfloJkUn
         pnFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780206961; x=1780811761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u5VzfpyDmVjM775VKxwIpIo0dFf4yb7OgSjGOH8Q/3Q=;
        b=lbch/40CsbVoV5MHOGw32LemxYa1sUp+3qJcds9xSxNbvtyyYcpj+aPfn3PEtwWLxM
         v8aUd+0fUB6c0T4XtvnqcITvuQsb13VKOzVjLivbEklkCnEqGFOV8u5T8cfnLFC1+GtZ
         eqs0MPs7Uhy48y/NqAArNHoLTa3ZNjHZDLPrF5j4AEwZ0WSYObTfjqHT+c4twsmb2p/1
         v5QXUUQ69d0jiMjjTiPCtglghoqw9AUARDR6+lq0lZgsVuI0ENODNuCZB6n4pJGzn5YZ
         Sjsx22PTxMEeRj/NjZCI6FrtGw/Dc2sU8E61OoOb5QHZ+ZRbN+D7+JdJKk+5yWLy18r2
         OrCg==
X-Forwarded-Encrypted: i=1; AFNElJ//mDfMOKq6JvxxoYarcQcLcbVuknLdRWB23eKqcugp7APsncGqbq70ml9Gzv/0hZCRf0bmc/uqbCXDGOTu@vger.kernel.org
X-Gm-Message-State: AOJu0YxYP8uxcQ7nTCb7sFmMU0UlfagJT4HO034qsCNUi7jS/lfPUSTx
	Tl3gRwCJ3OT9yFmCKuKXttnI6JguM1CwWmGNiQanxTm6EOW/ZlNIuRKyEsFktS9Uky9wmLF6YVx
	ZEe9DvssmYTTIry0nRhWFddZkeqjsN4zUX+AFJPljfs9I+siqSU1xgg0aFdk1B9fAt1IJmvKezD
	5x
X-Gm-Gg: Acq92OFSy5Ei/uvc9S0ZdV36FtlndSMZciPOkBNsR1Z8bzVQy3REuPOgW7+ttaoHBI7
	4W6RdmlnY0kYmnko2rC35OUiKJfToRzk0gC0dYE73qJn2656vtycqgr0PqKOLAHoM8yOa38AHyw
	hIqsiYPVGxwFCaoBSrwvpdkgu8eB5IqbnEzH4V5PsOjgcWFTFbPZKLuFAAANUBmWt9hb6XzXvEc
	2Z6exoE3dVIqAi6zzA7a7AdHC4JHtIwEb2kQGCNe+AgdkYajzuYIQ0ehGNNr2hmj9nUWSeKhZnX
	MJUZGg6E9hiziF+ZuZS6+Ri0+spMh1PSI/UeyZz3soWLHaC00TPUo4/3EYALPXsvcQFtEDrTZ5S
	JVvLHo8JpBAXAq7sPUClxzd6NV2U7UsK3C3k3fd2u7u602Bd1Wj9OTc37Htx+ofnEYQ==
X-Received: by 2002:a17:902:e749:b0:2c0:b4f5:41d4 with SMTP id d9443c01a7336-2c0b4f5428bmr35522485ad.41.1780206960995;
        Sat, 30 May 2026 22:56:00 -0700 (PDT)
X-Received: by 2002:a17:902:e749:b0:2c0:b4f5:41d4 with SMTP id d9443c01a7336-2c0b4f5428bmr35522215ad.41.1780206960547;
        Sat, 30 May 2026 22:56:00 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e702fsm67124375ad.4.2026.05.30.22.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 22:56:00 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sun, 31 May 2026 11:20:41 +0530
Subject: [PATCH v3 7/7] media: qcom: iris: Make
 iris_destroy_internal_buffer() return void
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-iris-code-improvement-v3-7-4c699c3dd719@oss.qualcomm.com>
References: <20260531-iris-code-improvement-v3-0-4c699c3dd719@oss.qualcomm.com>
In-Reply-To: <20260531-iris-code-improvement-v3-0-4c699c3dd719@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
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
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780206921; l=5062;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=4TfJehBE92h1hmWIguFxpHCkAJHvwkJ4iRehblWu+mA=;
 b=X/pafYCT4rNyM2SQ94vqgs6EbNJDMQ3yis79ZD+UWKFyo95X3v/T3/xiWqKLDBOwqhVf3ZgOn
 OGUb19o252PChB6BS1VZzGHfoCV5fWqFsmDMPgnpqDcmAoxmOi+z5eu
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=BaDoFLt2 c=1 sm=1 tr=0 ts=6a1bcd72 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=CWBAsx5YQZKXPYp8bPkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: cFl_WMZ6-6H-NPvUm6trLquhqvJ0zb1q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDA2MiBTYWx0ZWRfX8Fnq3tuCaRRC
 pVS83eGIkOaPMLCKZdqntDC0zMzfJROGe+CEOEGJqz2jdi9AfYzbInvBwszvC0c1DD3Eq+rl0wW
 sTbSA9BIxzKRJ2BzfC2S1f35FLeHsSaISWg5rXDD2gt+RXJNNye4BjGbkMQVYKGpT4nUGg0W76I
 V+PTBJBKClxGYcVlUuqj4r2PfROXmfM/fOVT6wgiXS+XylLS/C1sP/8we+Z6a3yXEVbUZNfvkDI
 P5jMEs3g7cDPA21f1AFpizljm5dVpRmr3Qw38W+ClM/slP1G76bcNqXS+BOwbgIUOXhkrmcurT+
 XcGiI0a+cDHj1pUhHInZUonqIIUvvkH/m3Xo/6Lk2tCGo6ZDldprZdx0ylkUI+YtjwhoZO4BIeO
 CtXfqwMv1HG/70szu/UbZVD04ixKvxJ9eud3rIYyfHT56nE7jyKnArZhRGn6nBB5SclBu3pS2fS
 tSRj2qKJWunOGJ81jrQ==
X-Proofpoint-ORIG-GUID: cFl_WMZ6-6H-NPvUm6trLquhqvJ0zb1q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605310062
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110450-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 505C1614A5C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

iris_destroy_internal_buffer() is guaranteed to succeed and never
reports an error. Returning an int is misleading and forces callers to
handle a meaningless status value. Convert it to return void to match
its behavior and simplify callers.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c           | 16 ++++------------
 drivers/media/platform/qcom/iris/iris_buffer.h           |  2 +-
 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c |  2 +-
 .../media/platform/qcom/iris/iris_hfi_gen2_response.c    |  4 +++-
 4 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 73b4d3381e47..2a4a813c9c57 100644
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
index 75bb76776182..ab8e5d953101 100644
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
index 83373862655f..e6fd38ad8e36 100644
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
index c350d231265e..917d2775612c 100644
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


