Return-Path: <linux-arm-msm+bounces-116373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id shABD8TnR2qXhQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 18:48:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F4670467F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 18:48:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=D8t7EA5M;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Fz94YmRA;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116373-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116373-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7159330512BF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 16:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569E630C171;
	Fri,  3 Jul 2026 16:45:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A43330C143
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 16:45:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783097123; cv=none; b=kdEr2EhlJPJOmhSURK7KYbRXUsXe6FCl4ddXCEMXLXo1ngFZ+2zmO39psHMJrPqfr6pXOd3eOhJ9iEAsSiIOE0UC3BYTMOOfJWkBlPy5xYq4nhItOL5W2qDhrZD4jsO432if3hX+v//TJyHcyOwjpoUZ4ZXYWIuzPzQY88Z+smQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783097123; c=relaxed/simple;
	bh=nGzwYW9XMYjIOpU7rm2Up8e85vxgCyaRTXlm2Pc71PE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h5WqcN4VFIb+zRPxj5lwwd5kuBtn+27W/ZoNU4ppawF0nNtV3YEVlANQ0ffwpWRK9wAuprK5Eh92OCjVWo5H5xltFwxa/6DikSDck4kVs74CqFvTovX7Q4xFVNV4rgSoRoSfaknUGNBvunMugUmdGbw7zyehXzt9UygD784OWsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D8t7EA5M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fz94YmRA; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663GIivU493533
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 16:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OHVNsbMAYbj
	kQ1t/N6D0ZmoMvxe2Y1h1gCTZ8ANDnOQ=; b=D8t7EA5MAFVYccJkQHBhRov/QLk
	MBQ2FEu05dR1HGP515spowPgnTfzh53EevlJgVxCUgM5PT1q6E/W5vZlC1AC9H5j
	5TNfkTTZ1ozZ6Qqd4/vPqVi1xOyZff/1B6+7LUI2aaZ7QOJlbwi3N30p4xfECckj
	L4Zw0Ciz/oIXVm5gFlefUKe+QtTybQuiWOfptJ3XFrDvJdu8af32nieM868YkRIg
	2vesK6oR+sJUmJqdk6Qor77wDg3KHhGslc3efBBjWFKz3FzZMdMs3vVtu8FGMqje
	uxZilTqCvpSpwTtSJa7qEtVIF5WjFkeYGdpqQEchgEz999dQEbHaymz8XnQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68u320w1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 16:45:20 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9aa197d5easo2261945a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 09:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783097120; x=1783701920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OHVNsbMAYbjkQ1t/N6D0ZmoMvxe2Y1h1gCTZ8ANDnOQ=;
        b=Fz94YmRA6owao77sxIli3K6fvrFsO+S8BpZlZPP0ZW2IApzOqlhQ0n3J2FalUNxgco
         NH8MCyLacbaF4kQx43r8R1dOgXhRqehMSZVeyWE0Q9qt7Th/wbj3+OaEgzsXAgNl6dBS
         OBgPSqU78qFm2xNi/ebR2Oj54Q0gL4IEnFtnLGVKInLxLj7qwjFVSB48GhyCbP6j9w+O
         crJOxwmnz09AfDjF9q4DrP1/hKSFNz1mQB7Zp9DLCFEeQdRNpVfervClhqGo784PtkoC
         ekZQtY6MxRR+jnDj9/DIvvoLJ1dkNoBa6rm/RvYsXkBjUg2qNE25wGhWyn0bOLlFDLdm
         AMGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783097120; x=1783701920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OHVNsbMAYbjkQ1t/N6D0ZmoMvxe2Y1h1gCTZ8ANDnOQ=;
        b=bSSTtrlPLU5onfMi7forU+ivT5NwH5cXE6vRBmRoVGnVEaCTQL4yVV6oLrHS5Qcxhu
         yxKr1WlhqJ57YJH0Lma9+UUsN4nYZTurzlpDIqBIDJuKwiBSjeuRxF3cf821JkZTNGgd
         fI21iBw4tubfmLn0HQSEKdwAwSRflwJ93EIfnb4cppFPPaqd2AT4qYcGYatCptGJSYVY
         BTNx/8rWngl92P4j0f6zWY8Evf02uTn8za1vCtVSWxspe4jkRo0BxcsTtTyewN+GD7WM
         d42p+qd2DrFrS5YJIG54u9Q7bD/LLs5wgWnUGFVz8DBcYWRh3U3K2v0ACJpMh97v5FTx
         fglA==
X-Gm-Message-State: AOJu0YwIf7lRjmzbDtqH5aB/XKb4QFozedDFtAuHVh55fqm3NR5SnNtw
	U2zbp5qOofpj4uNvFOHhQ9sRponldCWCn2cbzoDp1egijSGqMNJmFqSQLTQiZ5Nrgo8/aFzFT4p
	flTtxKl8GX35yT5B6iEsWQM57MLxNoaUOEIUI05DbeyXjRVIMdI4DGbuu4HOYMDtmj1SSZGboPP
	Zf
X-Gm-Gg: AfdE7ckOTng1UIhUEnDEFJETcGJDBWJnl8bmAw0YrA1HEc2ure0aRijKqP+7p5KXKg8
	KmCykV5Xd1tIHngF/NRS54pO88GefHj4CZM3figuIsbEjg0prlZ/goxhQl+hkwwC4GNo8v2HHVG
	w53SfOOTBh/FwJ9WKqmV9MzKR5mVBxhpKOECcW6FJ7xPXFOpbfojhwfM1HObM5050NhcMYCudBt
	CErV92KR4LweqW9Jnm0p2Mq+TLW/2mwwSM6biLcJwkQ/fhuH5crO/RBguIktwVCbrCsp//Hv+AV
	1krp8jl+LqWBPB9P8G+XGOv1sWpw6EPzu6mY1yTjwle7v2nAjaPbN3suqaS7vLQdgBUZX2Ek5Mw
	EGTrOqxTJr+uXLpa9GrjGBMQWSXA1FC25AcnaWw==
X-Received: by 2002:a05:6a20:72a0:b0:3bf:8a0e:dd99 with SMTP id adf61e73a8af0-3c01c8d1863mr5117253637.17.1783097119687;
        Fri, 03 Jul 2026 09:45:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:72a0:b0:3bf:8a0e:dd99 with SMTP id adf61e73a8af0-3c01c8d1863mr5117204637.17.1783097119135;
        Fri, 03 Jul 2026 09:45:19 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f38ee1333sm3908984eec.24.2026.07.03.09.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 09:45:18 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 3/3] firmware: qcom: scm: Fix tzmem state on probe retry
Date: Fri,  3 Jul 2026 22:14:57 +0530
Message-ID: <20260703164457.4040457-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703164457.4040457-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703164457.4040457-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UA7SduhPNxo_C2uTU5BeP3gsLcbmoBTq
X-Proofpoint-ORIG-GUID: UA7SduhPNxo_C2uTU5BeP3gsLcbmoBTq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE2NiBTYWx0ZWRfX90pDAjWV4wmH
 hepxbDWhkzvY8LeainEQuWZqnSccZIaIeJbbemHEb7t1qGRLSRkopUEeq1Lf0uf4yfQCHjQ77MU
 jbQLseFTu7roNl1P06LBIcoAkB1FHEU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE2NiBTYWx0ZWRfXxJgbHzOc/jLx
 nM4KQSRkXQ+3kWv1fW1ExnBGhx17PiQJ5aWQQIeIkUKxN5VbCLMhZMYhTwjxytAr5ih+1MEWgjb
 JS6QBL02OnfrO85u31zm54nh5KmweY9y++6v8scHdhUAezaD0jAKo2lp8tGwXQXp22VZjQEsIiA
 4p4/c8eAdP4wXFQ07mj+br8JdwZaQhKcl0OmK3Vp794wT6KGoY2coUw+YfEEs3qkfDZZbKQeUa1
 G9hqGAlzFbwjM4CxrIaygK4wpyszGb9wN+orEDqZdXsB5X4sAknA2VbCs3u9HECIM2dIw0Qhrit
 HIXx22DuMxXDL2yozYKt5M+e3HRW3RK8PkUs2eqCaQ751Do7WYQ5cRRgAabcAE+7T8m9vTJQRWZ
 MYrzyg4P9/9r3YT/m3Vu8YB6gsbdQgQ4JDNScUz/i1RUdaYPdivO8ciH5DIDFAkO+MkZvrWe2Rt
 /HgQ02m1yeAOpvNYxXQ==
X-Authority-Analysis: v=2.4 cv=OaKoyBTY c=1 sm=1 tr=0 ts=6a47e720 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Wn-X5jRZ7-pqfG1RE4UA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030166
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116373-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:brgl@kernel.org,m:linux@gurudas.dev,m:sibi.sankar@oss.qualcomm.com,m:quic_eberman@quicinc.com,m:ahalaney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 94F4670467F

qcom_tzmem_enable() returns -EBUSY if called a second time, but this
causes probe retries to fail permanently if a later step in
qcom_scm_probe() defers after qcom_tzmem_enable() has already succeeded.

Use DO_ONCE() to ensure qcom_tzmem_init() runs exactly once across all
calls in a thread-safe manner. qcom_tzmem_dev is set on every call since
probe retries use the same device pointer. The result of the first
initialisation is cached and returned to every subsequent caller.

Fixes: 40289e35ca52 ("firmware: qcom: scm: enable the TZ mem allocator")
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_tzmem.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 0635cbeacfc8..0fd9581275f1 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -15,6 +15,7 @@
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/mm.h>
+#include <linux/once.h>
 #include <linux/radix-tree.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
@@ -507,14 +508,18 @@ phys_addr_t qcom_tzmem_to_phys(void *vaddr)
 }
 EXPORT_SYMBOL_GPL(qcom_tzmem_to_phys);
 
+static void qcom_tzmem_do_init(int *result)
+{
+	*result = qcom_tzmem_init();
+}
+
 int qcom_tzmem_enable(struct device *dev)
 {
-	if (qcom_tzmem_dev)
-		return -EBUSY;
+	static int result;
 
 	qcom_tzmem_dev = dev;
-
-	return qcom_tzmem_init();
+	DO_ONCE(qcom_tzmem_do_init, &result);
+	return result;
 }
 EXPORT_SYMBOL_GPL(qcom_tzmem_enable);
 
-- 
2.53.0


