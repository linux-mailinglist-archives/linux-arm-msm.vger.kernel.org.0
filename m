Return-Path: <linux-arm-msm+bounces-117141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BoDqJsqYTGpSmwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:12:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE29717CFF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:12:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MgzdsOOT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="OdecdnP/";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117141-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117141-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C525B300BD65
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 06:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B61B38944E;
	Tue,  7 Jul 2026 06:12:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DD338887D
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 06:12:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783404727; cv=none; b=i2XzDJJGuHt5RqmFmgYfBZHwZYjT/n3mqkFPITUV90w91fHONNaMXVvVJs67vfi0uydcO1clA0PdnePVffrCtb82uNyTjIxOtkuOACCJdQ0qVe4gTNieU91EQbBpk160lXaA/IY0b0fpFpNFaEMFEleDsnS4+Qnxa2JEa3hmO3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783404727; c=relaxed/simple;
	bh=swwFCmvhnGXLtV5EjzA1jpj0y1exqoHCd9lIGCRTTXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nA3US5vIF+zujyJlYoec5Pi9yA4OxMXGFIwJEJ1Hlv80r/53C8POn5Jy3LdFORkIHt5lzc2HkowhrSrIpaXr/QCpHt83hy+/RnUT4dL772WnPpjy8PTQFQVsl8amx1ko4lWSGFjV0IcCj0Gf3OB+EW6Zb+rlCLBj7A201ye/mQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MgzdsOOT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OdecdnP/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748mLD2585297
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 06:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N4XA902sDhftTe3c8fF1ABgOsUEkFzIp03BayNh/XVE=; b=MgzdsOOT5RJ9e31e
	hc3ZIEwiV1AkpBSL/D4Gc2Cge35bG4qmW1gYn2At0m0ZK9L5smuDwgcI6vKHJ+uM
	bAw9A/oY44UpE+gLSS8V80ENUhyBKz4kwVINI2TN187Fqh62YmpGqp6R/HsDfI9v
	LAn7cMGZ6KWhTCxOAaE6CYgGkz10Tz0gC3WcAJNnL7o40RODPt6KoE0b2Jx/kDX+
	r5fjNe4X6EQnz5pG+PJdR74W2VWdyd6M2pDnJNTZkySu7k/R729UQs0Zh9b1etqv
	6m7LvxzJltaYZnb5F9XlzRp0T4iBOzZB6OdvAyigSmSu0Cguei+ZqRivG0L7pn+z
	zIg5QQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8t158e22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 06:12:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8478947e047so7410519b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 23:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783404724; x=1784009524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N4XA902sDhftTe3c8fF1ABgOsUEkFzIp03BayNh/XVE=;
        b=OdecdnP/lzBlXwFLh8eVpPW2EB9gGmN2oKPZe/C06+YGIg/tX9U+8+o0gxAVlJ+g+T
         h3vH0XhRcLzKwC3vCA2NORrboEnN1ED8cpD0rCNd0V+upCRYcUv+ZCJPrSc02D+h+42b
         091yDwPBpBacQlohMjDB0XheWHAhhJ7+t1pHqJ+Z8lereL5Sp1GPYTKSyOZHrJvrcVqO
         e9kEZnt5lJtOCRFFM1vYHcDu7J2m2gt9EDDtgUHhujQSxN+EoPToEssLj+XlC3jjrZpv
         qjs1H4Bg0Kz2UWBpW67AlSSvIVqJQX/h78d8sqUMEvZlYU/5UpSmZbM6rSnWaWOLVnG0
         J88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783404724; x=1784009524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N4XA902sDhftTe3c8fF1ABgOsUEkFzIp03BayNh/XVE=;
        b=o9KWQL5BvlOpRM+TvFAp27U3Xs31lP2CZXwmH4QR17D42ojNPCa5mlp/d4lqSOyF7X
         TP+Sr6VZT6spBX8/5tmVJcvDLF9bS3Erf566eg+kH7oFUK+BOn7D5bEb9Ri3lPEBkUBk
         I+TWXbVbFC3MEZCReGOfLOnUu4Q6FJyVGDOUOZlGDloG+5G1IrTnaEbAXFVAc1vDNtOb
         lDih5Cu3IvEiCOi3LB5BXzwI8+X3OWqiw3kp/FENJzG+LUs8n0DLJKwjw+nyMKdYVzmp
         bBO5GlA0hi6ATY95QHUJ3NEslY5QzXvqlgxdLS4htIrrFeqHqLvbTgrIYBZVz09KLWKH
         wm/A==
X-Forwarded-Encrypted: i=1; AHgh+RpDFzUHIZG8W5BuxeNhPAWuLgBCH1a4mV06nMI1zFq+ldkCMgUffB0Fz1AHhOTpZXCMkknPNZdngqtfppgs@vger.kernel.org
X-Gm-Message-State: AOJu0YyVpnhuyCKFOHFPe8uNdg1yHpZiLMUpdEi0w2XwZB6kHxZ3etP4
	uxFhHPwd6JlOCbDHjfEetH27XotO9jlYRORz7LApOPS+xUqoNEVSWgDBgNWSYT93P6gZCL5rgDq
	ZUMCsMdioCvxQGNXDli+u5BiCKwROe0Vxax3nRZzZuzAQCk06IdFgIyYVcTiIobP6UJ+G
X-Gm-Gg: AfdE7cnkObubWV7hnlzUqTpAKA9dhfdMK0BJEDxHa6JhNS+WYPhtRAbxvmrAUxEdgjP
	vPMZsgIsG8Yn2yubuOpzNJxfdVDKLe3EVA1t0M8o692JG9iCXc3Xfn6vFDueaC2IV0tNsVVXOC8
	ekVjykaOEaW18RVCk+nVS74OcOkULGoeldphcWrBRPwxb/EwbYHcSCveFWtifzsOIG6CCthwtok
	CA1K3UgYARrgE0C2A+Y/tMskMRZSjV+w1vDgTsm6YRcwpm2rcPN0zL7vsj0OXj2+WPbNLl3oKhr
	72cgP8jGwApLrmQHCmorHTfW9YdCTpan9RDqNT0lYUihqdE5ERNqQCziReQK9qL9/Gm9bgz2DIY
	He2RTdGkC/mfZD1N/LiCVtdO4Lwvl2srtbc3+
X-Received: by 2002:a05:6a00:94d2:b0:842:83d1:ee6d with SMTP id d2e1a72fcca58-84826d9e918mr3749312b3a.45.1783404724104;
        Mon, 06 Jul 2026 23:12:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:94d2:b0:842:83d1:ee6d with SMTP id d2e1a72fcca58-84826d9e918mr3749288b3a.45.1783404723570;
        Mon, 06 Jul 2026 23:12:03 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8480da8bab0sm3299321b3a.8.2026.07.06.23.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 23:12:03 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 11:41:27 +0530
Subject: [PATCH 1/6] tee: qcomtee: Track the object invocation context
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-qcom_uefisecapp_migrate_qcomtee-v1-1-f659cbd5d04c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783404715; l=5636;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=swwFCmvhnGXLtV5EjzA1jpj0y1exqoHCd9lIGCRTTXQ=;
 b=uf/oPxl1JN73Nkc3YvvPVlkXI6dU3u1y1EVY3cA+GokfjTWaK15SIJ+daxxeOjzpHQYxkQLy9
 2h2RSJwJ3AqDSDtIpcr3/0KejM+HrPn7XNC9tsN1E41B3PIXQJpD1Lx
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: JCMKK-4cOrAShk0XUAfpX4jZeRVuxBhe
X-Authority-Analysis: v=2.4 cv=HstG3UTS c=1 sm=1 tr=0 ts=6a4c98b5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=BWs0V4_eQumgdb2k_SYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: JCMKK-4cOrAShk0XUAfpX4jZeRVuxBhe
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA1NiBTYWx0ZWRfX5wZIgLTUhgF8
 2nHPCkvsyFCnWjT+pk1HpBJRiNM5puhcLm1Vy0TwazMa8n+NTK9Y2iAf9KyC/If4Poa3AkTK4My
 VhanRFAei6ai30pPoXX5WigUv+MHKlc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA1NiBTYWx0ZWRfX11w62CQg2k5h
 Vfix7FWuhsz7i8Z3MsufZb4hSaSsIridszldJyE+y+O4v1qr6HVPWxU0R1uqlcPWiRCRJ2rJQm4
 gN+SDGkLBitkter2LmTqEd4Krjsl+s/WKMNI/Aw5Wmh9n7jLpSwsmlk7X2uguG0MgHvJ2c9dbTb
 ihnFlj3cwDG3E+sfYHETTkNMnxZhLUz6AbJv+LBBjohDvBkbLk0dN/5CL1uyBeUUucwFU3Kqpgt
 gnLIP8XNp/NGQsKac2uk6vW70AX1AmdHauQlDjg27RogPnvDcWJpm+vSZaUxpHjzfCMlrww1o4I
 KUAUE1IwUuFqUwHr+4bn++mXc/NT75Hf65M5wjLZsPchZEWDm8dzK25AebJX4i4sZgjmjHo7ox+
 yT4O7TBK5u1+kg4VGvOjfgNhw1gcf5OJfuGyTfehjP5gXX/s8IFXMfhxjeZIF1AipMMb2wHeCon
 BozzetvWqs4d9FTMc+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117141-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jens.wiklander@linaro.org,m:sumit.garg@kernel.org,m:amirreza.zarrabi@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:basantk@qti.qualcomm.com,m:apurupa@qti.qualcomm.com,m:aneelaka@qti.qualcomm.com,m:op-tee@lists.trustedfirmware.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:harshal.dev@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,arg.id:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8AE29717CFF

QCOMTEE needs to distinguish between object invocations arriving from
kernel clients and user-space clients in order to correctly marshal
UBUF parameters and decide whether certain operations should be permitted.

Add a kernel_ctx flag to struct qcomtee_object_invoke_context to track
the context of object invocation. Objects invoked from the kernel-space
are expected to have the MSB of their 64-bit object-id set to indicate a
kernel context, whereas objects invoked from user-space should not set it.
To ensure this, we restrict the object-id space of user-space invoked
objects to 32-bits. This is in-line with QTEE expectation of 32-bit object
ids.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 drivers/tee/qcomtee/call.c           | 24 ++++++++++++++++++++++--
 drivers/tee/qcomtee/qcomtee.h        |  6 ++++++
 drivers/tee/qcomtee/qcomtee_object.h |  8 ++++++--
 drivers/tee/tee_core.c               |  4 ++++
 4 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
index 0efc5646242a..a74a54d67b06 100644
--- a/drivers/tee/qcomtee/call.c
+++ b/drivers/tee/qcomtee/call.c
@@ -397,11 +397,31 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
 {
 	struct qcomtee_context_data *ctxdata = ctx->data;
 	struct qcomtee_object *object;
+	bool kernel_ctx = false;
 	int i, ret, result;
 
 	if (qcomtee_params_check(params, arg->num_params))
 		return -EINVAL;
 
+	/* Obtain the invocation context information from the MSB of the object
+	 * `id` field.
+	 */
+	kernel_ctx = QCOMTEE_GET_CLIENT_CTX(arg->id);
+	/* User-space identifies a NULL object via a 32-bit TEE_OBJREF_NULL id, whereas
+	 * the kernel uses as 64-bit object-id. Hence, we check for a NULL object by
+	 * sign-extending the object-id to 64 bits. If user-space is indeed invoking a
+	 * NULL object we must extend the object-id to 64-bits from here on so that
+	 * QCOMTEE can recognize it.
+	 */
+	if (!kernel_ctx && ((s64)(s32)arg->id) == TEE_OBJREF_NULL)
+		arg->id = TEE_OBJREF_NULL;
+
+	/* If the object being invoked is not NULL, drop the MSB from the `id` field to
+	 * obtain the actual object-id.
+	 */
+	if (arg->id != TEE_OBJREF_NULL)
+		arg->id = QCOMTEE_SANITIZE_OBJ_ID(arg->id);
+
 	/* First, handle reserved operations: */
 	if (arg->op == QCOMTEE_MSG_OBJECT_OP_RELEASE) {
 		del_qtee_object(arg->id, ctxdata);
@@ -411,7 +431,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
 
 	/* Otherwise, invoke a QTEE object: */
 	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
-		qcomtee_object_invoke_ctx_alloc(ctx);
+		qcomtee_object_invoke_ctx_alloc(ctx, kernel_ctx);
 	if (!oic)
 		return -ENOMEM;
 
@@ -648,7 +668,7 @@ static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
 	int result;
 
 	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
-		qcomtee_object_invoke_ctx_alloc(ctx);
+		qcomtee_object_invoke_ctx_alloc(ctx, true);
 	if (!oic)
 		return;
 
diff --git a/drivers/tee/qcomtee/qcomtee.h b/drivers/tee/qcomtee/qcomtee.h
index f39bf63fd1c2..5d292a2ff83d 100644
--- a/drivers/tee/qcomtee/qcomtee.h
+++ b/drivers/tee/qcomtee/qcomtee.h
@@ -17,6 +17,12 @@
 #define QCOMTEE_OBJREF_FLAG_USER	BIT(1)
 #define QCOMTEE_OBJREF_FLAG_MEM		BIT(2)
 
+/* The MSB of the object_id field indicates whether the client is invoking the
+ * object from user context or kernel context.
+ */
+#define QCOMTEE_GET_CLIENT_CTX(x) (((x) >> 63) & 1U)
+#define QCOMTEE_SANITIZE_OBJ_ID(x) ((x) & (BIT(63) - 1))
+
 /**
  * struct qcomtee - Main service struct.
  * @teedev: client device.
diff --git a/drivers/tee/qcomtee/qcomtee_object.h b/drivers/tee/qcomtee/qcomtee_object.h
index 8b4401ecad48..2528d07e4576 100644
--- a/drivers/tee/qcomtee/qcomtee_object.h
+++ b/drivers/tee/qcomtee/qcomtee_object.h
@@ -146,6 +146,7 @@ static inline int qcomtee_args_len(struct qcomtee_arg *args)
  * struct qcomtee_object_invoke_ctx - QTEE context for object invocation.
  * @ctx: TEE context for this invocation.
  * @flags: flags for the invocation context.
+ * @kernel_ctx: flag that indicates this context is owned by a kernel client.
  * @errno: error code for the invocation.
  * @object: current object invoked in this callback context.
  * @u: array of arguments for the current invocation (+1 for ending arg).
@@ -158,6 +159,7 @@ static inline int qcomtee_args_len(struct qcomtee_arg *args)
 struct qcomtee_object_invoke_ctx {
 	struct tee_context *ctx;
 	unsigned long flags;
+	bool kernel_ctx;
 	int errno;
 
 	struct qcomtee_object *object;
@@ -172,13 +174,15 @@ struct qcomtee_object_invoke_ctx {
 };
 
 static inline struct qcomtee_object_invoke_ctx *
-qcomtee_object_invoke_ctx_alloc(struct tee_context *ctx)
+qcomtee_object_invoke_ctx_alloc(struct tee_context *ctx, bool kernel_ctx)
 {
 	struct qcomtee_object_invoke_ctx *oic;
 
 	oic = kzalloc_obj(*oic);
-	if (oic)
+	if (oic) {
 		oic->ctx = ctx;
+		oic->kernel_ctx = kernel_ctx;
+	}
 	return oic;
 }
 
diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index ef9642d72672..7f986d7fb47f 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -706,6 +706,10 @@ static int tee_ioctl_object_invoke(struct tee_context *ctx,
 			goto out;
 	}
 
+	/* Userspace object-ids are restricted to 32-bits. */
+	if (arg.id > U32_MAX)
+		return -EINVAL;
+
 	rc = ctx->teedev->desc->ops->object_invoke_func(ctx, &arg, params);
 	if (rc)
 		goto out;

-- 
2.34.1


