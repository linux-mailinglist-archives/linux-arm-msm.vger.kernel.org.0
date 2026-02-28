Return-Path: <linux-arm-msm+bounces-94572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIcWELynomkK4wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 09:30:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AB85C1C1645
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 09:30:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B0483065076
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 08:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5693E95B6;
	Sat, 28 Feb 2026 08:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqW7udaW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FFwnnotG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3FF3EBF27
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 08:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772267358; cv=none; b=armiXug8BH8WdmXB1wumGeHhzWawq6d3eRF2k92m8B23pgUjI+mMXMqqeSYw2OhJyT34OHHs+oB4fbmdFv3iaivT7PC1c80fo43AhdAezQb6o8tdpmWrvg0NJ/ymk8tbiDAomQGqBaTOmxiFBvJyvDlPtpKjwcdcHUH2LFCXMbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772267358; c=relaxed/simple;
	bh=D2ds+EqPKOCJKa58h2afy1b8aa1tTO2Jv/xccI8QzNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hbiRPt3iqKbrHy+6QMC1x1mi+G0aV3+U5XifASG3+Be4iaWCrWgcscmmTdinQy0b3ocH5LolYiuDw4HvvTkhKPn+90zNbW1kt4MQjXjtBxEY/GgtsA0FKT0JJwYgaDEb9hSBsaKJsrdkH+PAi2+v1oRVAfa+KqwUSaGyr7RZDJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqW7udaW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FFwnnotG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S6NiS63132222
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 08:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o3RuzPJp0cLL4gWGIuH6YePBKq2/LnO2jmhoxtNAj60=; b=AqW7udaWkVzquWKs
	5uQRGS4Jr41sOFXYXm3AwjET1VV7A/E+YSfxZW6owS/2CwVb8srLu4aFvlCU6wEp
	BvtA1nvSjApxrGFb/9KC461oR0gj0wEgY0EHylvLjE1iadS5dCGPZSuMkeC5KwlB
	ngJkoZu6jZe61lmuvah4X183f45EtJ8lq5HgQ3rUyrrjaWO/qQHRWtn3AwG735Kk
	hqyKVgHabkL5qbI38CzUdXuoJjvQpwCKDpY+nD383EqDmjTso2LVBMbchBBtiFfV
	9PN7K+SPp93u3uf4dEr1OzajzRdE0kgbyFl5WzwHwXoEa/eoEyrR7R3gLfonqzKT
	4xQYAw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshcgjj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 08:29:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5033b4d599eso312095161cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 00:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772267353; x=1772872153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o3RuzPJp0cLL4gWGIuH6YePBKq2/LnO2jmhoxtNAj60=;
        b=FFwnnotGzKgV83zcyA43dFdL5lOe4beH6ftxsynHRvSw2lCFU+SWVKSwFBiYoSTE3w
         LewAFOrYG/+NwxUjhpusG6L+xhXJInt8PKER54k5JOyt4YnYa5LePkrBLuQgYYRg47Ba
         kKgqeRC0qpGXIXaAdHst7e0jKI8wGO7Sp3016rQO+AvRvHLgicf3p9xGtHtnzoaj0Iwe
         XH6UbC0GWTpbkZW2YszwrUPsIUZf6HMT9p1XBOlc1Xoz2TqjxuUdkgxVJjdDEMmYeozd
         ZYGb7dYPnfVxetn9NW8ZSfJIojmxbGNrGI8drP2LzwrNRgBFNOpkqQkgGTQ9Nsj5OqJF
         q8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772267353; x=1772872153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o3RuzPJp0cLL4gWGIuH6YePBKq2/LnO2jmhoxtNAj60=;
        b=NbaZF8PEYvrIkMMV5PsMCZbYhPYpw5mrCZibUZPQjpLSVI09ZAF3yHXo8rdAmUgMh/
         FdfFc6wwd0XDkrFHXUjMW3u/GUivxu8cto+vZrdmmPPhKR0yGbMihx0UTZ3wEIbEowID
         +g5zIbPga8+a6Sqgosz8PxG52zzCNbB3ZXx9SsU+YCSeO7iKCWtweMPyltP6ws0QjdAm
         ZHM6G9DRT75V/DZgyYeVZP88DKNwxD74D/GPegqIfKmkiM9nBkb7jpZb3xMoBzClBIeD
         mN32zDMfuU17bwD0ndfhyc0swoshPr4wURlrfrvW+74ZH+vwZpT0p/dqkINTAJH34rlP
         3FBw==
X-Forwarded-Encrypted: i=1; AJvYcCVibCSzlJeS1f3W98OgDzfJ429VT47vTLnIY4dyUYuS1ADRlpE+aKw+AU7eWLoX6HAq0kDzbqW3HdjKTsxE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7feCLVuWbsd+9tFmT0U1Dcri6VWw0zo3rd/PTewvRyxSXIM79
	sO6J42L11hUqipwrptsm/pjpLDZyv+u836X5yR92qgrqNlLQxfDFvTF5N3XXm+PoC4aIwaLmCkm
	WgAZpmLSwK7LtUBXOJJLXXNm/zKzmNZoH+OtG7yFY8cq3Tlq55ZPKaMd3pTUFJEZEM1X4
X-Gm-Gg: ATEYQzwtbCWh+OQ4bVnu0DW6iQdcwt8DVyurhCRY8IM2h2TPlstgOaU0mAMBbb2cpR4
	D/TgzzOiCZZTnGgeOYARRqMl4TWKhYDzu4p4dcPoZr49NJ1DwO1TtXqTx/sAMd/AvK0x/yFe+Ru
	fDvawCL9enAS1yb64PGb9k7pQsjCyYwjnQqUBdqA5SW53M0UcQcfGKNmbsPKvYj7Dfq19cd0Cd1
	oIhFvmCt8IOm0ggB8mq8iet4M/ckiFNYHKaOQxtSJb8pWMvxmTD+oxHd2HaVGvw/tJ10IvxCjmK
	CMUsdQCgxJ5VWod9nsZnXtkh4Yyxb9P1Ki/uzLPpjEDxLvHP9rycBOS7GKlTGb2BhzMoags5AsY
	AP4wbGldfl7TixMbXLe5o2FEnfEiZJtIMV1a3WIGn3n/NmDGp3MqbtK0lkQyY/KDlWk+h88CCtQ
	ax2gdsi2mAgwkucGYLqTKBLqenL6oZb89o0b8=
X-Received: by 2002:a05:620a:28cd:b0:8cb:5130:cfe0 with SMTP id af79cd13be357-8cbc8df7177mr762471685a.51.1772267353417;
        Sat, 28 Feb 2026 00:29:13 -0800 (PST)
X-Received: by 2002:a05:620a:28cd:b0:8cb:5130:cfe0 with SMTP id af79cd13be357-8cbc8df7177mr762469985a.51.1772267352941;
        Sat, 28 Feb 2026 00:29:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2f4b158sm17970711fa.6.2026.02.28.00.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 00:29:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 10:28:54 +0200
Subject: [PATCH 09/11] media: qcom: iris: move get_instance to iris_hfi_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-iris-platform-data-v1-9-c2c53539f948@oss.qualcomm.com>
References: <20260228-iris-platform-data-v1-0-c2c53539f948@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v1-0-c2c53539f948@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8958;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=D2ds+EqPKOCJKa58h2afy1b8aa1tTO2Jv/xccI8QzNM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpoqdAbJMTF2s0uHRL01lE0wJW8UrvgQ0folWYp
 LQztwjKVZaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaKnQAAKCRCLPIo+Aiko
 1XF9B/4h1aaln4Zh8zEP5uPGXhQlD9beejnsHGssDHhhcB1Unhze7EvxtM4gYdw6zu/+DS+FmGk
 VARuvkTAo1dda8BaJG8eAhMOdWX+LArMwTAY65LxOiBWfQxutioBMztdkWSPXW4+xo5TYtksM9u
 LKnrNXWzgIsfeDpduww1Tt+ELOrBK7JKL/7L18HVRHk+mQCw4X43UU4HEP7Vj4757De2Ws83zpo
 wlvnS12xBpXL4Jus6fnMRc4wbXILZfXQaaOxSY8biPR8r+HpnnVISX7h3BWU2/IXULdHA/52zQi
 e7Y9sG3R+aIYlQ33w34tYmHGqT34s9u7Ege+x56ukilkrBA6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: VAKDfKfhTXXfyP6AScpGQwAhZy_TUic3
X-Proofpoint-GUID: VAKDfKfhTXXfyP6AScpGQwAhZy_TUic3
X-Authority-Analysis: v=2.4 cv=SO9PlevH c=1 sm=1 tr=0 ts=69a2a75a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=65xn1vM8G5_EQ4liwbMA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA3NyBTYWx0ZWRfX1r79mLfLFoIc
 pSoGKme5GG+oG9ATrmAcHOL3RQdYCVUr9STIuHJ12BdYoZFVu6so0wPWRHBf62NpkdoR4LyscYw
 xXUhIytCYWxjsebwZQgPS4091mlqRGT/J8Zd1w7bNnH01B5xUTtQ0wLPQ8uUBADvUHQrHRkjdut
 tRiiOEfvQV3eRpc8fweD0Lq83gqNVwQje/LRvoR/vC8M258mP49h6+441sqm3zafNRr5aIW/IZE
 juwC7HC2yC39Veqro8/7DG6kOLoNO5w/pf+J0cgIqLLPvw81VUib1wBgD3QT/e5W1XNdqGX5CYH
 i/T81X3e5YzE1v0D3VtKv1ry0xdZ9mQcgJugiACiSHTuVYWrymfa0Yh1Yi9cvASh+9XZTmuqeQS
 Yl/rEWCNvKZUc5kR/VzUCqNm5nhypz00bzWiXoNvh2AFoQrb6Qd3kUQ/MzZ5aOz4VMpzV5/enDd
 +bvNJZGAp87vXtF1c+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94572-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AB85C1C1645
X-Rspamd-Action: no action

The get_instance() is a callback tightly connected to the HFI
implementation. Move it into the new iris_hfi_ops structure, merging all
core callbacks into a single vtable.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  2 ++
 drivers/media/platform/qcom/iris/iris_hfi_gen1.h   |  2 --
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 28 ++++++++++----------
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |  1 -
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 30 ++++++++++++----------
 .../platform/qcom/iris/iris_platform_common.h      |  1 -
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  2 --
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  4 ---
 drivers/media/platform/qcom/iris/iris_vidc.c       |  2 +-
 9 files changed, 34 insertions(+), 38 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index 21bb35261073..de181d0be320 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -112,6 +112,8 @@ struct iris_hfi_ops {
 	int (*sys_pc_prep)(struct iris_core *core);
 
 	void (*hfi_response_handler)(struct iris_core *core);
+
+	struct iris_inst *(*get_instance)(void);
 };
 
 struct iris_hfi_inst_ops {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
index 1c970243532a..0479ba442b09 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
@@ -7,10 +7,8 @@
 #define __IRIS_HFI_GEN1_H__
 
 struct iris_core;
-struct iris_inst;
 
 void iris_hfi_gen1_ops_init(struct iris_core *core);
 void iris_hfi_gen1_response_handler(struct iris_core *core);
-struct iris_inst *iris_hfi_gen1_get_instance(void);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 7f0e5a75a301..253edf2f62bb 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -1028,6 +1028,19 @@ static const struct iris_hfi_inst_ops iris_hfi_gen1_inst_ops = {
 	.session_close = iris_hfi_gen1_session_close,
 };
 
+static struct iris_inst *iris_hfi_gen1_get_instance(void)
+{
+	struct iris_inst *out;
+
+	out = kzalloc_obj(*out);
+	if (!out)
+		return NULL;
+
+	out->hfi_ops = &iris_hfi_gen1_inst_ops;
+
+	return out;
+}
+
 static const struct iris_hfi_ops iris_hfi_gen1_ops = {
 	.sys_init = iris_hfi_gen1_sys_init,
 	.sys_image_version = iris_hfi_gen1_sys_image_version,
@@ -1035,22 +1048,11 @@ static const struct iris_hfi_ops iris_hfi_gen1_ops = {
 	.sys_pc_prep = iris_hfi_gen1_sys_pc_prep,
 
 	.hfi_response_handler = iris_hfi_gen1_response_handler,
+
+	.get_instance = iris_hfi_gen1_get_instance,
 };
 
 void iris_hfi_gen1_ops_init(struct iris_core *core)
 {
 	core->hfi_ops = &iris_hfi_gen1_ops;
 }
-
-struct iris_inst *iris_hfi_gen1_get_instance(void)
-{
-	struct iris_inst *out;
-
-	out = kzalloc_obj(*out);
-	if (!out)
-		return NULL;
-
-	out->hfi_ops = &iris_hfi_gen1_inst_ops;
-
-	return out;
-}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
index b981a1ba6954..f1d293759bc6 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
@@ -36,6 +36,5 @@ struct iris_inst_hfi_gen2 {
 
 void iris_hfi_gen2_ops_init(struct iris_core *core);
 void iris_hfi_gen2_response_handler(struct iris_core *core);
-struct iris_inst *iris_hfi_gen2_get_instance(void);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 12d286be94a8..3676af51894c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1405,6 +1405,20 @@ static const struct iris_hfi_inst_ops iris_hfi_gen2_inst_ops = {
 	.session_close = iris_hfi_gen2_session_close,
 };
 
+static struct iris_inst *iris_hfi_gen2_get_instance(void)
+{
+	struct iris_inst_hfi_gen2 *out;
+
+	/* The allocation is intentionally larger than struct iris_inst. */
+	out = kzalloc_obj(*out);
+	if (!out)
+		return NULL;
+
+	out->inst.hfi_ops = &iris_hfi_gen2_inst_ops;
+
+	return &out->inst;
+}
+
 static const struct iris_hfi_ops iris_hfi_gen2_ops = {
 	.sys_init = iris_hfi_gen2_sys_init,
 	.sys_image_version = iris_hfi_gen2_sys_image_version,
@@ -1412,23 +1426,11 @@ static const struct iris_hfi_ops iris_hfi_gen2_ops = {
 	.sys_pc_prep = iris_hfi_gen2_sys_pc_prep,
 
 	.hfi_response_handler = iris_hfi_gen2_response_handler,
+
+	.get_instance = iris_hfi_gen2_get_instance,
 };
 
 void iris_hfi_gen2_ops_init(struct iris_core *core)
 {
 	core->hfi_ops = &iris_hfi_gen2_ops;
 }
-
-struct iris_inst *iris_hfi_gen2_get_instance(void)
-{
-	struct iris_inst_hfi_gen2 *out;
-
-	/* The allocation is intentionally larger than struct iris_inst. */
-	out = kzalloc_obj(*out);
-	if (!out)
-		return NULL;
-
-	out->inst.hfi_ops = &iris_hfi_gen2_inst_ops;
-
-	return &out->inst;
-}
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 8e330ce5e726..a936ab2aedaf 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -203,7 +203,6 @@ enum platform_pm_domain_type {
 
 struct iris_platform_data {
 	void (*init_hfi_ops)(struct iris_core *core);
-	struct iris_inst *(*get_instance)(void);
 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 	const struct vpu_ops *vpu_ops;
 	void (*set_preset_registers)(struct iris_core *core);
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 1906e480e2ec..622164ca9c65 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -314,7 +314,6 @@ static const u32 sm8250_enc_ip_int_buf_tbl[] = {
 };
 
 const struct iris_platform_data sm8250_data = {
-	.get_instance = iris_hfi_gen1_get_instance,
 	.init_hfi_ops = &iris_hfi_gen1_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
@@ -360,7 +359,6 @@ const struct iris_platform_data sm8250_data = {
 };
 
 const struct iris_platform_data sc7280_data = {
-	.get_instance = iris_hfi_gen1_get_instance,
 	.init_hfi_ops = &iris_hfi_gen1_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 09dcf01047c5..7745a3481f6c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -819,7 +819,6 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
 };
 
 const struct iris_platform_data sm8550_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_ops = iris_hfi_gen2_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
@@ -875,7 +874,6 @@ const struct iris_platform_data sm8550_data = {
  * - fwname to "qcom/vpu/vpu33_p4.mbn"
  */
 const struct iris_platform_data sm8650_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_ops = iris_hfi_gen2_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu33_ops,
@@ -926,7 +924,6 @@ const struct iris_platform_data sm8650_data = {
 };
 
 const struct iris_platform_data sm8750_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_ops = iris_hfi_gen2_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu35_ops,
@@ -979,7 +976,6 @@ const struct iris_platform_data sm8750_data = {
  * - inst_caps to platform_inst_cap_qcs8300
  */
 const struct iris_platform_data qcs8300_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_ops = iris_hfi_gen2_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index eddf2694e759..d4608ae756fc 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -156,7 +156,7 @@ int iris_open(struct file *filp)
 
 	pm_runtime_put_sync(core->dev);
 
-	inst = core->iris_platform_data->get_instance();
+	inst = core->hfi_ops->get_instance();
 	if (!inst)
 		return -ENOMEM;
 

-- 
2.47.3


