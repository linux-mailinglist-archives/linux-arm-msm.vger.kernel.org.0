Return-Path: <linux-arm-msm+bounces-115160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Xau3GkaEQmq68wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:42:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B37906DC2C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:42:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jGOsj5xm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="BS/vJF0f";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115160-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115160-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 170EA31EB6CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17FF5413240;
	Mon, 29 Jun 2026 14:18:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C134192E8
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:18:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742694; cv=none; b=njuJ0k00NHvhUjXgPqsroH0QlXlq1+gsITHN1DUqecUNzuLITZ845uGsR5wLwN4US7JG/MVlBHLG9lSrmYOoB5fa+N8WbIbmNSZRYoUOhITuzUNk16PfdiY8TvNAjDCYPRqicoItSSpFEzen3EoXNqVT6jutJmVswtswH/48nHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742694; c=relaxed/simple;
	bh=Df1KDOccbqEazNlLvwWaAHjiE6WZ0aQvZvw7WpehgKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OCods6LahEZ3mB9tU6rL7o0H5gqJvTxMV+GYQklxtOrPOi7bydIxjyiPC/HAvu532OJp9LxBp2Je0hYkLaZwIwrWP/b1drq08TDE0wW/0RUPMMKfJs+FSo1xDWACx6uDDRF8Mofk0fLCJtbjS84IBq6MsZqBJp39cOvgE6Q+Dg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jGOsj5xm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BS/vJF0f; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT38A2646942
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uv1W3tU2aY8
	ToSlnS9LSoHeA44va9lxe+3x0vozFLeI=; b=jGOsj5xmgU8xEGmXtgZzLSipVXD
	10CYAxtHJOFOEfVjpw+EMBTwAYrGyWlcIdNlasKL58BxmbyKLKRStFxAesIb2RqS
	BHJqtT3Xes/7msdXzRH7MzNCj9lxWMNJzNlULhKQMG7thQncnQzoDNgc3AmAGkOq
	u7tqwvy7zbSw5ecT6sVca2H+YC4MyMj9z/4Nmi8yDuCsefc1qIpp0Ac3Ww5G41AU
	uj1iILWL+yAfCAhxNXfo6AYTQAYNTPFPMGjXSqBbyRABGZOzu+/d1z1B+4WO93PO
	yxuQmzwulD3neCRr4bRuFbSnCSyK/8Qkc9QbNHIe5IzG8TXdihcVjeZoXVw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4tsp1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:18:12 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e99ff505c2so2833619a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742691; x=1783347491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uv1W3tU2aY8ToSlnS9LSoHeA44va9lxe+3x0vozFLeI=;
        b=BS/vJF0frXsS8+DPzHt8mQ+8voPQ4bzN8jfekMefdU4b3V5I1GJCqsDZvSLtZRAG42
         AkV11O1IkCm46x/Po72Fn1vxTcpE+4lvYIbdu4Vs/BF07bZ8Uv1nMdvYaUHje5wKgbJN
         GxAzgGcbACe7d0umihCw/XPq7PnkU5y+/0kWlGK874RufxFZh61MddJTSfOUoKrKfRCm
         cTuFdl1z8GqCkTjdtWsoFdhmYU6Gn1lp5YuUEMFwG6kdJ7p0GTsl2WG4X6SC3WiGqVRL
         9fa9RmLLlwig+YLiuqenBy4hAtXY0jvn7iXGszBSlWEwFCdNrckUzSqjs8p2LCbKxUMX
         ixJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742691; x=1783347491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uv1W3tU2aY8ToSlnS9LSoHeA44va9lxe+3x0vozFLeI=;
        b=UOj0ZBk/W4nKUOBUf3TzmVmjovqqI+LksSQyqhACYMS+4lom8BO7TSe5Bda7v0iYP4
         PenIf792XBWeYXitaDkMrQ4wGlo4XXFVYAwE1uYo2DafftiysygjG0hgRoQ3dbbE/lqK
         AhuNVQdp3U+ClICA65uSza13AtB42v7ojhWM4emJ8zl9ilwrFHx6HlrrC2y6A7fV0UyL
         Dh2j6RMoVVyMad+XNW25OgYFL1kxJ2lI86wVPDEHWU/58LAqWFSlcpkwMOxVnx5mn0t2
         6ZbfHM54FknlcXn3SUAMsYXFhrwsocvVx1LOFZsUr4Ek9uWgsHVu5aODqDN3vEOaWMzy
         jhiw==
X-Gm-Message-State: AOJu0Ywbk1p6uDhOSsXQ2Sf6GW/K+QrD4AFFFvY1904t3FP0NwUSqMGR
	k2kQnynjedZ73mYXuuUTBTq41+aU1J5hJGEGLKIPpMMPQ0Pbhki8+wXXf2BwH8lLYNO6vzS/pRE
	6h2xt+rXnWQEb5SmIQ5ufm0u2rFykRzlqSBg3HeaWQDeIslCBgDYvpNtZbaQCES1c5WR9
X-Gm-Gg: AfdE7clUxtItTHRoHZMBT+uvMPMsxUvWJXCpa+dOHQMYYawWE9HUwLzHSKPNp/X0mNM
	XeIy97oeSWO2FHkpnw4uNpN4e5cosap5aGMe8V9MViGipsbOasw6HaEv98iBx5fmElQJUQq5SMz
	UhZ6IL6Tb1AVCEh98ac71d2P3nDMSwMP48+CUvIrOkLX3cvyG+fCBR3L1bTqAHHnYBniGnYocEh
	y5+4fTQuL09aVlzRRs4hMgHkkpDZ7Ui1OO2Q478bzyeqG6UyYEqW4LW5hvFxi7ezZmLnnVmrfaN
	HVekl1i4iTgDicsw+xWsq2fBjEMMsWDAGTkmX/qA2FHI1ocPP3498WBgUQNeO89HcfVWUpE/MqZ
	EH/tgrZMUC7muHPAjo7gtp1PVyc83GNEOBq8qOA==
X-Received: by 2002:a05:6830:7306:b0:7e9:b4cf:683e with SMTP id 46e09a7af769-7e9e9301fe2mr517579a34.30.1782742691270;
        Mon, 29 Jun 2026 07:18:11 -0700 (PDT)
X-Received: by 2002:a05:6830:7306:b0:7e9:b4cf:683e with SMTP id 46e09a7af769-7e9e9301fe2mr517554a34.30.1782742690597;
        Mon, 29 Jun 2026 07:18:10 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9e8228746sm647612a34.20.2026.06.29.07.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:18:10 -0700 (PDT)
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
Subject: [PATCH v2 3/3] firmware: qcom: scm: Fix tzmem state on probe retry
Date: Mon, 29 Jun 2026 19:47:50 +0530
Message-ID: <20260629141750.996853-4-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOSBTYWx0ZWRfX9e0Az9J72oMB
 CNOfHHEp16woz+O04hoEbcrFb8OPEcWKkLVtkG6qBE2tiZ7kNE8FnTeKGEupgEUCoTyR+H+nzfM
 +3/PkYLTwW3Ksu+IQvE401BKbMrdZXj3eGmfbCWn28SNUSpcDS/Hfbspzjvy/wtqECepfQNJIC/
 EOBPjYyU58dGHXDtmzygqON8ZCzo3XegYXeXmkzPuA1ssMclTD5iuPJp36ttK8JUeJI8agtKKfT
 fmA4VoWe+/pFn7yemOcMYRZZly+mmwaTREHWRlisAZb9hMjzyumzKf5zgMXe0llJEdYLCQsP9tb
 YEUqbosHz6q8lWhXYDplRAMqgg/Oj/h4vAK3Z4dC6+5mtps6mK3Uf/ukTMcxfjH4qGrHXFqJlmZ
 zYR/GZ2EMrJH9ywDf/58TE67a5o9r7j4IDLp3djXM0aAtQfasvp4wK+PsiHUOKe965kmR3lS298
 HWiRW3Qy94onBrz9AZA==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a427ea4 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Wn-X5jRZ7-pqfG1RE4UA:9 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOSBTYWx0ZWRfXxYG2XN2A2Icy
 WLBVUW4Ufo/msNurvkoIzmJOZC0s/7YDVET29/R4ab4d5jSlY8V+wJrS7DPfF4c3XgO7sYQUxmn
 Wb7GqvRgkaX3uxA6JYDc2urEe4yuu9Q=
X-Proofpoint-ORIG-GUID: L2-T9yRnTaUy3ddRX2swWPiUOpAumrtj
X-Proofpoint-GUID: L2-T9yRnTaUy3ddRX2swWPiUOpAumrtj
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115160-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B37906DC2C1

qcom_tzmem_enable() returns -EBUSY if called a second time, but this
causes probe retries to fail permanently if a later step in
qcom_scm_probe() defers after qcom_tzmem_enable() has already succeeded.

Use DO_ONCE() to ensure qcom_tzmem_init() runs exactly once across all
calls in a thread-safe manner. qcom_tzmem_dev is set on every call since
probe retries use the same device pointer. The result of the first
initialisation is cached and returned to every subsequent caller.

Fixes: 40289e35ca52 ("firmware: qcom: scm: enable the TZ mem allocator")
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


