Return-Path: <linux-arm-msm+bounces-117142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y2s/EcSYTGpQmwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:12:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E50B7717CF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:12:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=idgrWUyR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AMQU0cAW;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117142-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117142-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EEBEE3022854
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 06:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 952F7388E43;
	Tue,  7 Jul 2026 06:12:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2762A3890F1
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 06:12:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783404731; cv=none; b=RBJKb81Vozz7LWmh/OZrnyc7Lj5s9olxXCLgXrRvayqZjdyk3jqhxl+HimvTLQQqipaMDAL3lE/DUoi43WeNuKK0XrywO/xtXnXDFv4BAw23VXhngk4j+zz+LFmZ5zLaiUUix/y3lxA/3yN4d3EqPe8qQjShCZYsp3yXJgFcpOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783404731; c=relaxed/simple;
	bh=Wc9YPOH3gLSEej49AwWn9+hi7hpzaEhY0b42nssqRJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fl3zhQP1HAi2ibnT2Q9O/mykfeZI0Q0eWtjyXqSlMVHFdJrxJopUde+0dige3spNt5P1/D7ReIVgaPPiOZQf3A+sMc88SErift234mahoZElJAGGwWGg9L5foiK5S0qJZWvP17Ut0Ym2/lcUAMUvNbuUQdQxK7olxS5RLIzdDJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=idgrWUyR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AMQU0cAW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748roS2687759
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 06:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fWjDybI1o5yT4eZXIx3vUFWYnFEDkE2p45bYzyDGbmk=; b=idgrWUyRiRio27T/
	K/6iOKp/cti3Q9jNmV3NfZOAADb4wksGVuiFrB7L3FU2M0pZZWx6WdXUjN7sVP+M
	oNzGO4RxNL36tDLHiKxUw6DWeaI2MdMjH9eNCuUu/gjt7+jhwjZ0x9heKrqtB5zJ
	o34yg/OB7s/9oonmpuJ96flxRDDpm68GQh68L8zXzgHb21cWoIbeHOkmvma6El+x
	W1DX/hsZ7CApcDTCgQxS1BDHBk85yfgrFzL5+ts14QC52Uxpe8zr6oyvaYKqhCEs
	m/20V5i8UJOCFt2obTbbWye4b28FAYZnvgrEFr79QHVuGtT3g3te+iIA48p/4YDp
	9rfOQQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gvetc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 06:12:09 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-847a5f03ff9so5847089b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 23:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783404729; x=1784009529; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fWjDybI1o5yT4eZXIx3vUFWYnFEDkE2p45bYzyDGbmk=;
        b=AMQU0cAWq1LyqWiE2ajedcVzMvXZny6Ha4dIYhx45tXTeqgnqTeX06jbTYfKIHUwg6
         x0WnkVBfeCKLjmpFIuF6uNZ3mIzTQKLpMNqyl0iRcrnvoCteA6U44DO710UrOPJzK+H2
         9hmld6BQwNw1xiZUXYpjpxeIEKLRsByYZhkkJHWJICcvcujKcgFYa7Qm358tkrcVw2Iq
         XUesA1gSnerfulDEjsRJ1sC9taUbK/D0bDUEk1ngY+05LmHFyX4Z/dyOH7BhgrQYQlJk
         SPH7ptwGaQXkSPe7s3hD4dgiyKex1y05weDlx0vVOWN2dJ15F5sVW4VIvpdrfqXscBen
         MOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783404729; x=1784009529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fWjDybI1o5yT4eZXIx3vUFWYnFEDkE2p45bYzyDGbmk=;
        b=asGe+zlyktyhSeh3UVFmEy6AuwITPIO7U1iSLCi2YDYav6LWP6v7gNadP3+ZIwxpWB
         SRGk9mLSVzGkNB/yVGVlnwLxoFqYeLzxs4WEnO+ctVpGsCs1vef9Q3rtl90AVV0xFUXC
         WxXr5HlBSlgQ06Vv5TXuBr3PtKJisM1uzc2JySezq6ffKrwgYuadH/4Qz4Ssbk8tnHU4
         KcQ9ZicX+Nc0EMFOLFM1sbFt7zbiufnGAby1DF2q05Gse5gflmoEM/7FADAhQwJNIEmq
         qEr2LSd7VF18VY5lHibbLhcYBhxK2n9pXIH807XXYNvnem+BIe6c7P0Lyu6afCNa0bvg
         l5Ew==
X-Forwarded-Encrypted: i=1; AHgh+RrZAXedKHsVB+u57NZeLvkxboaebZJARx3sOP8rxoIDHBqK9YGasSYaq0ScvycHbMfBIZz8PbprQdfiUdm+@vger.kernel.org
X-Gm-Message-State: AOJu0YxlnjBMdm81KR6GcOxGYWWn4s6rCSP1+iv/yS9ZtEjEMcfXn52m
	z5Gw7oq/CY6P6l47xdoFFHg2QyM3tYFR+rqPwEXU8n7gN57eZ0O0fxzUVQBdnjv+TiCRa4WRPBl
	6Xg+ZAwBof2L/bLq5qaGt7iqXsM02U21AdI/XLueUT9JMwCtjA+0TVA5xahiF0re7Na5P
X-Gm-Gg: AfdE7cmsOJCXC9G2eehLAY7lDq2G0E0JGJSAP1ho0BTh4xdI3L628nM4Ph9cNYPmXj5
	iI0sWhwbEWQ/qsFlfRMphoAz7LQ68GtgRvYguE59JtRymj7Qt5pkgZ/bA1utle7GW5gldC/xwQ6
	Dew5x4DgDoyxWuUgzNAiO/E3Htie4CDsiNo5ZpStYGYyWVmt2uUSPdzJHQ6fmDVbDXRrn/sIfIp
	+Pj6OL9Z6O4YF8hQueNAVt8x+LcSFbw7L3I3tAltr3ZIOG7nU1F95VwOunYqyH1dZCsSt4JYLhi
	03BgKaIbsh1CFvQg9tWRN0tDNRGZmEU8VBzAAXqrN29rG+6MjQ4CjyaRiFg/AHXfP8P5QCzvmlH
	ryI+S5a70NKGbnyp4a+IRF87355jAn3fQyypW
X-Received: by 2002:a05:6a00:22c5:b0:847:9565:7a58 with SMTP id d2e1a72fcca58-84826df132amr3609196b3a.48.1783404728520;
        Mon, 06 Jul 2026 23:12:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:22c5:b0:847:9565:7a58 with SMTP id d2e1a72fcca58-84826df132amr3609148b3a.48.1783404727696;
        Mon, 06 Jul 2026 23:12:07 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8480da8bab0sm3299321b3a.8.2026.07.06.23.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 23:12:07 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 11:41:28 +0530
Subject: [PATCH 2/6] tee: Add kernel client object invoke helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-qcom_uefisecapp_migrate_qcomtee-v1-2-f659cbd5d04c@oss.qualcomm.com>
References: <20260707-qcom_uefisecapp_migrate_qcomtee-v1-0-f659cbd5d04c@oss.qualcomm.com>
In-Reply-To: <20260707-qcom_uefisecapp_migrate_qcomtee-v1-0-f659cbd5d04c@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783404715; l=2685;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=tf7n4iBWfzhqdtN6PCm26dFltLwD/+JEiJW6BobHH+w=;
 b=0IoQzMoBgXd3Nm4jBsZCdkfR2D05fBzDzovrQrN13cn3KEMKvPOJfN0vDgLCztUzjcFqgIhc7
 lLxu+XHvEUZBlk8bJ7piE7Uf3oXHc/yGge+FWStw2kXrz9vPifX1jzq
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: a77T9uTJdvPQNi7lSP2sTPNAi6QQu6CC
X-Proofpoint-ORIG-GUID: a77T9uTJdvPQNi7lSP2sTPNAi6QQu6CC
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4c98b9 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=kr-ihz5DC76VLKRVsLUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA1NiBTYWx0ZWRfXw91+dhV8i/4y
 aQBOfvD/dU0vDPpAM85KRY67YZ2KBsKm8bVlkZZ4RD5lX6Zbt3NBSoVjmME+phvJpRIDf0tO0xi
 cig9hCW9OVZOKMy5BZern3J/HAlo6brB3oEWWMR/2zDOJ/fHn2JDBaJiVzV0qAj7uYscJwzpWNA
 0fwZu1N4bx96A28cNqKk1I9NQXAArCsXWmb2DVKoAE3dPe7j3p76WNGeR8gjnonZFpZUzB4Nh56
 yyCU1WHaqFQQqN+HXkcHGQuS6VWOZnDaQD7hDZHa+f+3U7qRi4O4xFPs28RQ/FFoXPS5ArOebGa
 yWm9QFkgcI6FBL9mP4CAWtSAopGYOMkLbfg7c128EwHGYob/9yTESuQWWTGKEdZJ6nofkcWjh14
 ikF8Dnf7ZqrPb44ehGXH9GODxwS5M4Ro4KoW+VL8T4TmyGcLewexg/vHQNdwN5yvEyCPcprHrmO
 0YxcN+COQvHf4e9s7xA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA1NiBTYWx0ZWRfX4VHOQJGZBHvh
 M07LTBLneWio7Ivil+XGQn5pP+GBFkIkmEWeERBQMbnsKA2ZLM9PFTgnpdCxCTr+ZaNl2TFagvi
 2qS8JRyLUrOkMV54BDcetgx05vAYRU0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117142-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jens.wiklander@linaro.org,m:sumit.garg@kernel.org,m:amirreza.zarrabi@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:basantk@qti.qualcomm.com,m:apurupa@qti.qualcomm.com,m:aneelaka@qti.qualcomm.com,m:op-tee@lists.trustedfirmware.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:harshal.dev@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E50B7717CF5

From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

Kernel clients can open a TEE context and invoke regular TA commands
through tee_client_invoke_func(). However, there is currently no
equivalent helper for invoking TEE objects.

Add tee_client_object_invoke_func() as a kernel client API for issuing
object invocation requests. The helper checks that the backend provides
object_invoke_func() before setting the MSB of the object-id and forwarding
the request. The MSB of the object-id informs the TEE backend that the
object is invoked from a kernel context.

This allows TEE backends that support privileged object-based calls from
the kernel-space.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 drivers/tee/tee_core.c  | 13 +++++++++++++
 include/linux/tee_drv.h | 13 +++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 7f986d7fb47f..0783802fd010 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -1413,6 +1413,19 @@ int tee_client_invoke_func(struct tee_context *ctx,
 }
 EXPORT_SYMBOL_GPL(tee_client_invoke_func);
 
+int tee_client_object_invoke_func(struct tee_context *ctx,
+				  struct tee_ioctl_object_invoke_arg *arg,
+				  struct tee_param *param)
+{
+	if (!ctx->teedev->desc->ops->object_invoke_func)
+		return -EINVAL;
+
+	/* Indicate that this object is being invoked from a kernel context. */
+	arg->id = arg->id | BIT(63);
+	return ctx->teedev->desc->ops->object_invoke_func(ctx, arg, param);
+}
+EXPORT_SYMBOL_GPL(tee_client_object_invoke_func);
+
 int tee_client_cancel_req(struct tee_context *ctx,
 			  struct tee_ioctl_cancel_arg *arg)
 {
diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
index e561a26f537a..ca99c6b747a8 100644
--- a/include/linux/tee_drv.h
+++ b/include/linux/tee_drv.h
@@ -283,6 +283,19 @@ int tee_client_invoke_func(struct tee_context *ctx,
 			   struct tee_ioctl_invoke_arg *arg,
 			   struct tee_param *param);
 
+/**
+ * tee_client_object_invoke_func() - Invoke a TEE object from kernel space
+ * @ctx:    TEE Context
+ * @arg:    Invoke arguments, see description of
+ *          struct tee_ioctl_object_invoke_arg
+ * @param:  Parameters for the object invocation
+ *
+ * Return: On success, returns 0; on failure, returns < 0.
+ */
+int tee_client_object_invoke_func(struct tee_context *ctx,
+				  struct tee_ioctl_object_invoke_arg *arg,
+				  struct tee_param *param);
+
 /**
  * tee_client_cancel_req() - Request cancellation of the previous open-session
  * or invoke-command operations in a Trusted Application

-- 
2.34.1


