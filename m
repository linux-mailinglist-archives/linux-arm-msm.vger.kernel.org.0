Return-Path: <linux-arm-msm+bounces-115158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OsGlHHR/QmqI8gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:21:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0473C6DBF6A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:21:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QlDxqecb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YOJW8MkS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115158-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115158-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2D4663016655
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1E240F8FC;
	Mon, 29 Jun 2026 14:18:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFB33BADB1
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:18:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742685; cv=none; b=Ob0XvB4Bg7AWjZ+mnrkMLii9mW6PLnwUfIKMs7Vv3SUqYo2j+zN0gYK5YU2x7n134J5MRX2eHEYCt0TIR5nywavTzgd4Y1LuoCxjgzfsg7MopJTjMwC+WzFd4Xrb7Vic3Lru2Yknq0AXoBfaJLFO8aiIBqyUGuIhZIS2mAL1Seg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742685; c=relaxed/simple;
	bh=9lUfAtl/sQFaXDsYhccTxCgLS8umK99dvY1EWVrstfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GX02IRTgM71KdMMdMgLH8SijkV2xeg+zLzbrueQrNV2rfaOjW3Ywl26BDMACSBXFhNnh/f/VGoMiTgF3tA5MQU+m3eFxNQAHJ6MgJtZGxHLi+lhL1TAswwH/GztVuFnzdG3jNWiQxehecMoV0Pd7aGBurPyNkKmiFQpDbf2zeQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QlDxqecb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YOJW8MkS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATMlh2647667
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sagDdptnBLV
	W0Yl1kvH9vzmHx2hz0XSL0gf5c3pGFuA=; b=QlDxqecbP2sHAtXaXFHL5MMlhSs
	rtufsYz3kdQ9KHPz00kqBCuG80elBSoco8GtbE8t1epArwenS+YrX4InEdqAux2a
	nJxvMKJHEAKy5qd1ONYRBme+jnw4dwNOHrityYVRPdLnRKs650cA9QJexKCpSzMb
	Tztq3FV95gjUh4c24ni+lIBH73vMzjd99pvEjgGHZuVgt6FcrAuJzwfW2a3KSmmA
	uFpWEt/0Ywu79L6UgQB0u0ljA+m5v3WsU9/P99D4XZlsS2LZjmok5Px/k0DcjkXA
	vDUoNCRXLu+1RNKn6lkcNASMH6hIT+bayj/ljesAHdtFph4Y2gPUsckwRVA==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4tsp0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:18:03 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6a155636ec9so2069281eaf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742683; x=1783347483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sagDdptnBLVW0Yl1kvH9vzmHx2hz0XSL0gf5c3pGFuA=;
        b=YOJW8MkSv5pnMz920jSTojyz53igs6IT9BqT4UvSr28tumkiq68ybKbdUt7OfNdOiP
         8PFczerfXKkgpJFprCneQTW89kEzPwh4DllyEtjWsOVmaaNtzFqikmhJm5VK+pPqtMMb
         Ub+Qj/FdJpTkyffdxoPTNEftNXh+S4ue673de6bf3Nv12WDnV8DjFPBmhddGJF91+T4r
         Sp+kYBR1iq8FI/Kd31WAT8ft65c1ckL1GbRE1MydR8ZiM/oRCElY1rhZsVMAA9kK4z3f
         WtcWo+fZPRMS3WV77Or668qE6Ow52azSm6g2utmIIsYU1RCv7vauzCWqIbuHtjprXJmR
         jSaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742683; x=1783347483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sagDdptnBLVW0Yl1kvH9vzmHx2hz0XSL0gf5c3pGFuA=;
        b=dpooGmej3QUt8pcq2TEQ23Yl9owH2/YtvU3D2xBUygWblqUX80vrwn+nYY5Oyk/xa0
         mCyqYRiqLGth9+XGqAxy8Nd+sUQ+cfDF4/tLMQOji0f0mLoy4lGloXHkVI+p2wV9F5mu
         eOVArGAISCQ+k9aKEVz4M0vyHqtUYnyzlL1UwVVQGAtlxzdL4wJJBsNeOQzgJxxoioDD
         UCnMt5JpzY9EWugKszvxKuPYNvZDuVi7G2l3RZS5g6JGg/8ZSpAFKutSuym5TqF1uoKh
         WTK9GKIbi7C06kaeKBihszI27F3TePFZwv72uTDUIBMjV82hAC87OggJ/QoOZVTs4K5N
         T0hQ==
X-Gm-Message-State: AOJu0Yy2GFk+uqxynsLwMHCYGya6EneuwB0NczyRdYP2qq//sRiC8Ya+
	zDQKt2fKJ/S/zPWWaeJmRo1193AgDglDV1td4kKHNSnJpH3M8eRyMbMXiFItYzRbc0qSni+fKeP
	J5xn5H3Aiz1aCJOiDtE7Z+dQfnSj7+6UjlKUQljWEjDx831dPYl4+EPYsHucuicmWBHnI
X-Gm-Gg: AfdE7cnbndU0A7JUkLgvB/Fqb3RJzrI2mWtYDrg6/U/4fu7eula/PHD69hEyTwoK+/M
	csHXQt1RABJPT5R99NNwuNKSUN5VcctfKctRhztq9Mmu42/P/ZSIXKWs835Ig7CfS/jzAHAxg3x
	vXvtWl86IajA1b/7j5rtIqx20MoBQoN2Hf3hLSouv9WlDA6BjEwNyL6tHRaKyM2BZeSCC/WMygS
	QxjlGPi7eL2UOA+VbHp33UGQDwSH1e0humrKgbIhMrN4DeyB07vRqA4kaV+FI0oeU8Xp34qDjWI
	XhQPvER/VIFJlZmJPYjRo4DyyjrplcN2G8WfZGdf6r9tE4eu4sJvggnJPKDXjCLpc1g7fglsOPd
	RUnjv3tZ+v7/Jn3vBRr+rHPGWGjw/Gqq/73m6+w==
X-Received: by 2002:a05:6820:4b0a:b0:6a1:50e7:5c1c with SMTP id 006d021491bc7-6a150e75d4dmr6848313eaf.71.1782742682881;
        Mon, 29 Jun 2026 07:18:02 -0700 (PDT)
X-Received: by 2002:a05:6820:4b0a:b0:6a1:50e7:5c1c with SMTP id 006d021491bc7-6a150e75d4dmr6848271eaf.71.1782742682242;
        Mon, 29 Jun 2026 07:18:02 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9e8228746sm647612a34.20.2026.06.29.07.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:18:01 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 1/3] firmware: qcom: scm: Fix NULL dereference in IRQ handler before __scm is published
Date: Mon, 29 Jun 2026 19:47:48 +0530
Message-ID: <20260629141750.996853-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260629141750.996853-1-mukesh.ojha@oss.qualcomm.com>
References: <20260629141750.996853-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOSBTYWx0ZWRfX2aMo4L6gxdJs
 QG5nGbW2WR4XlCuD9qi8PN4Cza9YkthG72a7KqYI8D8ftWNbBNYm9HLnf46yNxkEVEnCzBfMiSb
 e478lH263BtPHqybmigPs3UshCMUw3ts0xpLG9WKbMx9LcYk/uy9bdVfgNr9ll7S77czUYQkiMo
 1XyzN6dthEQ9v/faPLtXehlCNL9XOxtItsc3upbFA7M1bPcDNX79m47KppYG51Apl9E7Fcjkvir
 5xzqTzhvryzXdOqyT+xATp7t7oXVm2z04RR6r5TeB1bKQlVnqIhil0rk1es0Bi0IJCsSG2kV7oo
 mUGlLMX6oBc/pnELpPZ3QrK/hUjYre3STJzCijGja8CgkVkH4eFBnHYxo3CbdTeHlURLaMUbduf
 n/qPVSISRkGFK3h0OEVvTpMt9MMC9WrYrDhRJ5M+2nvlS2IMFyRzw3bOXGb4yOw2z+LELgScMhx
 9PXQphAiZ7sP9T9YY+Q==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a427e9b cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=oeUS87UVm4c7YcJ927QA:9 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOSBTYWx0ZWRfX1Hz++XQ89iC9
 pKhEE4T0yc4fTUpnqGQ469ZIp0S4M6W3YOEtc/3R9aqWx2QO9UjN8MowFhGb2oqUsiWGv6eoOua
 Qgdida9t2uvfXJVD1PB72ImH+TCOEBc=
X-Proofpoint-ORIG-GUID: _uadNs2xsPqg8OMJA4zY-bBR8LSDTfC_
X-Proofpoint-GUID: _uadNs2xsPqg8OMJA4zY-bBR8LSDTfC_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290119
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
	TAGGED_FROM(0.00)[bounces-115158-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:brgl@kernel.org,m:linux@gurudas.dev,m:sibi.sankar@oss.qualcomm.com,m:quic_eberman@quicinc.com,m:ahalaney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0473C6DBF6A

In qcom_scm_probe(), devm_request_threaded_irq() is called before
smp_store_release(&__scm, scm). Two paths can dereference __scm before
it is published, both causing a NULL pointer dereference.

The IRQ handler receives scm via its data argument but passes only wq_ctx
to qcom_scm_waitq_wakeup() and qcom_scm_get_completion(), which then
dereference __scm directly. Thread scm through both functions so the IRQ
handler path never touches __scm.

Non-atomic SMC calls made during probe (e.g. from qcom_tzmem_init via
qcom_scm_shm_bridge_enable) can return WAITQ_SLEEP, causing
qcom_scm_wait_for_wq_completion() to run before __scm is published and
dereference it. Add platform_set_drvdata(pdev, scm) early in probe and
change qcom_scm_wait_for_wq_completion() to take the device pointer and
use dev_get_drvdata() to reach scm, removing any dependency on __scm.

Fixes: 6bf325992236 ("firmware: qcom: scm: Add wait-queue handling logic")
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm-smc.c |  2 +-
 drivers/firmware/qcom/qcom_scm.c     | 22 ++++++++++------------
 drivers/firmware/qcom/qcom_scm.h     |  2 +-
 3 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm-smc.c b/drivers/firmware/qcom/qcom_scm-smc.c
index 574930729ddd..7abe60fce676 100644
--- a/drivers/firmware/qcom/qcom_scm-smc.c
+++ b/drivers/firmware/qcom/qcom_scm-smc.c
@@ -105,7 +105,7 @@ static int __scm_smc_do_quirk_handle_waitq(struct device *dev, struct arm_smccc_
 			wq_ctx = res->a1;
 			smc_call_ctx = res->a2;
 
-			ret = qcom_scm_wait_for_wq_completion(wq_ctx);
+			ret = qcom_scm_wait_for_wq_completion(dev, wq_ctx);
 			if (ret)
 				return ret;
 
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 6b601a4b89db..464ae3b4ca43 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2630,23 +2630,20 @@ static int qcom_scm_get_waitq_irq(struct qcom_scm *scm)
 	return irq_create_fwspec_mapping(&fwspec);
 }
 
-static struct completion *qcom_scm_get_completion(u32 wq_ctx)
+static struct completion *qcom_scm_get_completion(struct qcom_scm *scm, u32 wq_ctx)
 {
-	struct completion *wq;
-
-	if (WARN_ON_ONCE(wq_ctx >= __scm->wq_cnt))
+	if (WARN_ON_ONCE(wq_ctx >= scm->wq_cnt))
 		return ERR_PTR(-EINVAL);
 
-	wq = &__scm->waitq_comps[wq_ctx];
-
-	return wq;
+	return &scm->waitq_comps[wq_ctx];
 }
 
-int qcom_scm_wait_for_wq_completion(u32 wq_ctx)
+int qcom_scm_wait_for_wq_completion(struct device *dev, u32 wq_ctx)
 {
+	struct qcom_scm *scm = dev_get_drvdata(dev);
 	struct completion *wq;
 
-	wq = qcom_scm_get_completion(wq_ctx);
+	wq = qcom_scm_get_completion(scm, wq_ctx);
 	if (IS_ERR(wq))
 		return PTR_ERR(wq);
 
@@ -2655,11 +2652,11 @@ int qcom_scm_wait_for_wq_completion(u32 wq_ctx)
 	return 0;
 }
 
-static int qcom_scm_waitq_wakeup(unsigned int wq_ctx)
+static int qcom_scm_waitq_wakeup(struct qcom_scm *scm, unsigned int wq_ctx)
 {
 	struct completion *wq;
 
-	wq = qcom_scm_get_completion(wq_ctx);
+	wq = qcom_scm_get_completion(scm, wq_ctx);
 	if (IS_ERR(wq))
 		return PTR_ERR(wq);
 
@@ -2686,7 +2683,7 @@ static irqreturn_t qcom_scm_irq_handler(int irq, void *data)
 			goto out;
 		}
 
-		ret = qcom_scm_waitq_wakeup(wq_ctx);
+		ret = qcom_scm_waitq_wakeup(scm, wq_ctx);
 		if (ret)
 			goto out;
 	} while (more_pending);
@@ -2746,6 +2743,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	scm->dev = &pdev->dev;
+	platform_set_drvdata(pdev, scm);
 	ret = qcom_scm_find_dload_address(&pdev->dev, &scm->dload_mode_addr);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index caab80a73e17..cf90a565fdfb 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -66,7 +66,7 @@ struct qcom_scm_res {
 	u64 result[MAX_QCOM_SCM_RETS];
 };
 
-int qcom_scm_wait_for_wq_completion(u32 wq_ctx);
+int qcom_scm_wait_for_wq_completion(struct device *dev, u32 wq_ctx);
 int scm_get_wq_ctx(u32 *wq_ctx, u32 *flags, u32 *more_pending);
 
 #define SCM_SMC_FNID(s, c)	((((s) & 0xFF) << 8) | ((c) & 0xFF))
-- 
2.53.0


