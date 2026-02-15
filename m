Return-Path: <linux-arm-msm+bounces-92860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id vUlyAJ6okWn8lAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 12:06:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 751AA13E8B2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 12:06:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8F0283003993
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 11:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25E8C2E973F;
	Sun, 15 Feb 2026 11:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M/Gkf8mQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TCzGntfD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47A525EF9C
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 11:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771153563; cv=none; b=jdzyA1ryp8M+rkydrIOu/e/qJWXhjYy/HxUno1UZ2IJ/+F0uMzvF2zdDIb/oHHBahEB1gW2+R28JYlqrZHXe9pxG/vcqw4/0r6LAz/JEB4STgXVhnKB69DhUMavjKtURsepio2IQp4EJE1MIRBlzQEInEvqXbubLxXoVqd2zFKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771153563; c=relaxed/simple;
	bh=JgciLUg+pw6PjKaEANrgZwMR8Hl+3lQyn1sBmUGeCTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=enXBEEIIlsYpK9B1fbSiyWCH6LHgHKj0MMi0zkH300zeLWyS3YWSuYIEIsMTT+dW4VTxi+5UQLJBOs4u7fNbdLFXQNqz5rmW5NLw03vLP2rGsUgV89qZJhcQN5gRz/18h3DbRiuHkkggSLOPK0OdFx5lcJgYWbv5OuSfndRkbSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M/Gkf8mQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TCzGntfD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61ENHk7t3751792
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 11:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bd8esVoqkJv
	RivTagt0+SdMi3gO0XC96hO9aW5YG/qw=; b=M/Gkf8mQsMn6ylMeo8FfKl3vJCk
	asb/5XP2cJKA6z7pTlim5Q+8jP3e3hGoUDj88pIVwkVLMIb/9J1dRtaqSxKf9Lw/
	JNpIgkHu4yEvvdLahATElE1thLOfMkXN85bWD9e/Bc6l8OXg5pwsj03ZnkOPVru3
	YbwSV1PeKiSNCnxkGs8oUkUpFoy1y0XJIem8DOYyvrUq4c95BTSSQJLyFhVPP849
	leTIvWqbPYX0wrs/ZoqTZU/XMhlEk7dKdGbmViuijBugHNLJCV7ZcZE0pux/KkIR
	nvntbEBAbutX+mxXw5GI4TNhOZ57JhHgwhg5WTBTJ1jK9BOaDJK8SrrLl+g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cagcf296r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 11:06:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4817f3c8so817004385a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 03:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771153560; x=1771758360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bd8esVoqkJvRivTagt0+SdMi3gO0XC96hO9aW5YG/qw=;
        b=TCzGntfDZPkemo29a9VZhvhLgK6Fe7wVtFoopA6IIhwn8IlraEIfnarZrP1m0FBYJ1
         9i2X2eQJ217ZycTh7Jrf36GpQf8Qjo0wv1vPNo61Q68U7FT/0AFvYX0aSa1d1kltx0eY
         RIrKzD+rluXu9HzzQndMM1UiBMusZeJdcQ0UUGvaOV+lKvrpKCH0XXYND2yHO2sgEKR8
         n5UTRWcaXnKAJaKxis8eW5R0Xv40gRDc5pzcHZ1C02NvH11vTw/k0iV4sILrPHc2bEbD
         4dGlGGJCNUx3kZdbLLnM2fLRXoTptu/RIwrgX1OmUeDiCJerdG7Gs02QSlFZN6LFOIwN
         wijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771153560; x=1771758360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bd8esVoqkJvRivTagt0+SdMi3gO0XC96hO9aW5YG/qw=;
        b=Ephncai6Df5L5Zse1wtPGHZD4tktRJO+a7nDPZxNv+QuqvBJfF3lfpxFiQIEzfE47r
         uog4cgJijJgZ+KTxtktPFiW6gaKGf0tUW3ApGc7abj/EtWa6AUkRiXnKBQJURzBwPout
         YcyNf0jrWfzecFaebDzXewZkD+3m0P04mxrIQKDWcipGu0PhZ+nDLeirzr/P6qMK+I4N
         fyJnbygyp/ttHExaxk81xwisHq7fZNqKlBH7jPJv9OWIsfGvMIib95aFAw5aXH99uHuC
         ZjUK9kwiOCJ97OUj7uyHMhCnSttnfxajb2Ju6opOlkn+27D4mxSk7NcenSi/9s9Efv+2
         +Xiw==
X-Forwarded-Encrypted: i=1; AJvYcCU+anT/drGC8xF6QwcOgRf2ia/LnJc3GhNVt8WcQQzkd5cU1O1gtcwUSTYlaDH3TP9VMTtx9YRgecXOCaC1@vger.kernel.org
X-Gm-Message-State: AOJu0YzKbKBJZ1jW2lCdwiw0YQSlG08HXWoL8wKHrEjDJ/SkeaOGr/H1
	oy9du6EgJPoRiHHg3nw/QduPdF3fOctS8sxiDkr8ix+5q7yMN8h6V7v49ulCPb5+9DG5yP3T71F
	Q8AMEA5kTqcO5R13VMhjmJLX2XqIS7XLsnT+m9hWlaEW5YMxfxDaORf7RodM7HodzZcvN
X-Gm-Gg: AZuq6aImQKwmi6NqOJpxiDbdU0d7y4DLFsfAWQn7++HG7yT5DSkIteqQRrIqL9kG8tY
	/p+LPtGXor4ncuPtNhL6nX2d2POdQoI4FXffEjNczWsv/wv4a2VuTgi9V9Rx5Naf1ipnyd00Kpj
	ekV6B/ds3i+zzJa09uiNtEtmcYNt+UAVQvH8CjnBzjKhXIPautK8+RlqkxMbcTXVPkXjTh/trHw
	5NyH6xt3d8Aww1RMecNEq5T8i6hvrfD0h4PowCatxmbAjIpclNpl1D4YG6wmnSIv1LZH5HdD1pO
	rfUovktgVAnnBIi9yV1zZrmmYWMaSInb5PFNibUee8y7LTu+2BCap5saJiEYv4YptqZhMSeF2Lk
	TJ/QyzvnLp92yOjzIJNS/+dGskVw+d7VKtdjxrQ==
X-Received: by 2002:a05:620a:410f:b0:8cb:4d18:bb6b with SMTP id af79cd13be357-8cb4d18c1cbmr530991585a.73.1771153560439;
        Sun, 15 Feb 2026 03:06:00 -0800 (PST)
X-Received: by 2002:a05:620a:410f:b0:8cb:4d18:bb6b with SMTP id af79cd13be357-8cb4d18c1cbmr530989985a.73.1771153560054;
        Sun, 15 Feb 2026 03:06:00 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a15dd9sm83550155e9.5.2026.02.15.03.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 03:05:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Maximilian Luz <luzmaximilian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/3] firmware: qcom: uefisecapp: Annotate acquiring locks for sparse
Date: Sun, 15 Feb 2026 12:05:50 +0100
Message-ID: <20260215110548.34152-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260215110548.34152-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260215110548.34152-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1011; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=JgciLUg+pw6PjKaEANrgZwMR8Hl+3lQyn1sBmUGeCTY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpkaiQb5YffSwnuwkPwhJ0bpG1JGLxbizRHHDrK
 wY+QhijdM2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZGokAAKCRDBN2bmhouD
 17gUD/9U/RG0pXQkCFdkKbrSMY70zMHDYlriNds/twDN+BFZWUAm/i0bnzRQ0BvkA9/50vUQaDu
 6H3lUWWbDQG8yDFQj321efeK4pnf4HGDYQjiF2AygPvRmqtPbG9uCpCJjkeqwAZmL1e7+pWQEdq
 vTaDtVolAY9p8gA0rehiP2K1iZXkwVoD1O/y9y6BbksDEHap/RP0W+hDklcLG6poeTzM/2FbR2A
 lswl6Fb9fLHs78ce2kJa8W6LrOgZu5L248lZ7KRDQCoAG+v5f13ObOjjTrB8gmaSpjkZgmpyxMK
 rr+CVxSc+VurRzrLAunPbd4sqQLgHcLh9c7YZ6/GGCw48QXKYbWo8ojrtNR63Mf1xqQ8K+r5slN
 G4Q2oNUT49FkY3XzquZrRrS0V6YYUv3xGhV4HnnhIq82TOz1HYdJZSaDzkLenhTFf+CVM8V9e79
 PG9Vl4VZyQONpmwRSSUIH2rJEKZ1aRgULu5f9AR1W/qfK4AQYbRFgRS6gBTevN5++M6GrsFUoeL
 qajpC8cGiGczdeDQ0WQzCwp2b32IksV60JnbfdtItL/AqOB5ZuadRYrUdtpSK8R4myUnzab0V8X
 LKEWoGqTWYLqArtX+wyNw2tFc2So6KPRwnD2fODj3W+tAkIl3IxLg2ycXV1mJE77qVZ2zeWjZUt cCtjYYOOig9R+7Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qJK7BTaidnDjnGwEVPdKgoiW0MR3WZUN
X-Proofpoint-ORIG-GUID: qJK7BTaidnDjnGwEVPdKgoiW0MR3WZUN
X-Authority-Analysis: v=2.4 cv=Sc76t/Ru c=1 sm=1 tr=0 ts=6991a899 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=KoL59UCub1vOF40GOT0A:9 a=ZXulRonScM0A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE1MDA4OSBTYWx0ZWRfX9HaXs54hCdZP
 4W8hsJ8DW4XHIyR45NYANyrp4DxzrGntBg/W+U5BPRIh5qhdifI0CffS1LPpObg7CadjSh2W+L2
 INDBg4ciZ0lz+rSMeDdi7vn7P+y9VMJlVkXk8sejmPzFSFMc+0FQhNDCbWNRA5Z+P6hjnlOnHbE
 23niReJPwZ0tFhIdPM5HqRHwHsyoEysNWaEAgXfgvF59P8rjFJDn9IK3e+NUPb+dcEXU7NeKu3m
 CIaMTSA2qA0DtqcfZMYB5hPlaeKKWjF3W3HNxdRkRhkIpgb4ZEUa+W/jiX0f+m6yIQzCD7LeeTI
 vYGj96gbntkTwEyRAJP0pIMWKsceeYJo+hqbSM8x2N68i2K1Qew1x2qGnnG/o0SW9qBgIhQxDON
 GL8189p9qUKMGTKMhzz+bw570/padE/SqzNtkyBnyAwhtPMlkVZ1eu8L8BFHX8KOA+Y/YbWbn2M
 lJJ7p44sGiFZJDIf7DA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-15_04,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602150089
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92860-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 751AA13E8B2
X-Rspamd-Action: no action

qcuefi_acquire() and qcuefi_release() end with mutex locked or unlocked
respectively, so annotate them so the lock usage will be tracked by
sparse.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_qseecom_uefisecapp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
index 21be447374aa..befa68d1dcaf 100644
--- a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
+++ b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
@@ -710,6 +710,7 @@ static int qcuefi_set_reference(struct qcuefi_client *qcuefi)
 }
 
 static struct qcuefi_client *qcuefi_acquire(void)
+	__acquires(__qcuefi_lock)
 {
 	mutex_lock(&__qcuefi_lock);
 	if (!__qcuefi) {
@@ -720,6 +721,7 @@ static struct qcuefi_client *qcuefi_acquire(void)
 }
 
 static void qcuefi_release(void)
+	__releases(__qcuefi_lock)
 {
 	mutex_unlock(&__qcuefi_lock);
 }
-- 
2.51.0


