Return-Path: <linux-arm-msm+bounces-115159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GRMTA7uBQmoe8wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:31:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB6E6DC117
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:31:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Kafmva2e;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SRuTY7mt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115159-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115159-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5A3BC329B2E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBD8641166E;
	Mon, 29 Jun 2026 14:18:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9813A410D2D
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:18:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742689; cv=none; b=V4l/4mYzYsTCAf+qH9oDvZvtETxoV1wfvrwae0i5eZ3iH1DoelE6aP9oEFmXZj1Zy/qLrlNs/BSK5I5aXGujPw89M/aQxHD9nO30odUSYnb63bh0tgaS1sDfvjUoGnVARlu89L9BnA+G+8juv1nze9V4hm3e8BQwzH7MsuwYt54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742689; c=relaxed/simple;
	bh=AcvaTu8lwVofEtagYxqeFhSl9A3VDEnCqUviA/orrDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fN3L/Z45DNm3H7vvJMmdOHGsRu7TNhFzsfJ/mbMmH63sh57RKUeAy6wi5uapN8wL13qfOE4cNyqfReQJ4RJ5iv/FeMOy2j6N+hcyL0hp5c36AuEIZcXgPsUrpJxHIwqQAuZz3AjWS3oQxRS44wvGrPpRzTrTfdD+Nno+ANj1+Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kafmva2e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SRuTY7mt; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATFQY2579199
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DbQAzYpcRR5
	5NMotjjho3VrXDpNp2yf0yJSS845TzTA=; b=Kafmva2eKXoxaS1lgnJLppUyhD7
	IrrL8MYghq8JO1wueUCiosoC/8S4mZ/X0vzT62jD/tytiYWQnSr0p8jvhsAs6e8N
	7/MFgXksEFnXFTT8OdAYtuOo7eKQ2sr7S36g77npzE8vV5l/DT15u4syoSM3ySac
	QOPuxIhh0gSSlmtECxtRQ8Q8uYZIVEIAcFlFRQryeeQBz8X8wkfpyxCb+d4Mt7d3
	1pKdyZFKIE0VpD0zQFpPenRQshJVKCJhIzLI9bPbQmX5qKZkMVAKRpQBbKZnuDEM
	gPhRlx63rpYUBF7ZIn+Hd5TOo+6VljsTsuCpNRvE8DZQscwACxuD7uEQwng==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7hr4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:18:07 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e9e54e9cf5so658208a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742687; x=1783347487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbQAzYpcRR55NMotjjho3VrXDpNp2yf0yJSS845TzTA=;
        b=SRuTY7mt7qCwJ32hcqY4Sj+PrnQ/5Rxe9dGdZ+jjoCyjviyEOGK/ZoC3RxYX8gTzJE
         YrnYALio+m9msZuELNWQ4y8ISCpQIgUHTqCghPTD/NwToyELsdUfU2/UXA59giCZPxxd
         /FGWPqUUFXvvHDhDifr8TU/4Wm3WMnTFXUEe+GzaaPKOOxqhrBgTneGm0WRGJ3ASJLNa
         GZeSYp2eTYGwITvK+/RRJJfT8E40NhY8ZjnoIYNZMx+xn/tgRWnLkWCIO1DQKlUl0+Sh
         wAhzbvX8QLpbFCv8ToT1m/yMCJmLNg5o5G0lO5q+xrUzlvZkcQ4QDLfChPCR3mdpo2QT
         2tzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742687; x=1783347487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DbQAzYpcRR55NMotjjho3VrXDpNp2yf0yJSS845TzTA=;
        b=MXcVmFfc723j3M22tLJlTc1qsNUI0DQ2U+lGY7H/Z9DmUJMxJK4UAZ2PfceevSTVu8
         EpsYGxareastfLSdA8D4dVKRKyRTBXOzwqZaN1D13WsF2FKw4vBK2G44EzEvf6lZrjv3
         O6R/28i24fBEi/wFer/3DkPM9G2jyliOpsdSYHYRL1DEHIGkzE2I4YhJUy+DUAEh82PD
         G+uDghcvU2NUx45Cb2NFtJwIs2HeJhd4FQwwcjfbjoJowd+Awxo/Qv7b3Ld8oApb5DTM
         nhxsI78QNvt8PP4H1030SkJ6JZftOsniQF7J24EmUhWEE8vhjM+YIc0MVnR3qDFiWBvn
         8Syw==
X-Gm-Message-State: AOJu0YyxjSBB6WSBsg8nofNjixq6GQrWAQ4aeMvNmdqmNTH0rZielYyY
	BHfbv8ANyf1BvfguFsurPFblzaZB0UkAVJsk2/v2e/j6vwukRFxySmaQ735bAk72lDr0W3xD49P
	w9ET3dAbdEj1emH8Cd3LsWzeKGhHDXLbnSCz7R7oxMc8XUA4IILg1rVaK4O8umiAFmg4SP5rhD7
	g1
X-Gm-Gg: AfdE7ckX6SoYl9Ylzhpm231Z77sQT1fG53166ZXxTOV1L+36ddiWS6Ryg7G+MtgmbSP
	hx4fQpFPpxN5uqlWYjEFmz8s+ZXZvmKUq5AhRZI2X8eMkRPTgzSiEmclpSRhMwhQmaxMhNy6/NC
	LwDvUXzayMFCdJXgPkpwsLZnE+LC5Rq61wzJJEmUfCbabD7W2bA4plQ0K5S7Mbkf5Oxfh1bkUY3
	jfDuQkxS9a6YH3/UJXYlZeQmajmdDi7NSHOCqK5sNm3enW+/MqzNz/wOP+nujz/7d6GVOpr7vOl
	3f0iHJsjWXPXixrYA/yXRXFmkf4V0KOpcZS6aNd+DqaDsxdun2vBKWs6848eDxbtF9kIfWCU2kM
	w64GI7e0OoHM8F5Mcuiir97ZG+kbHzVvIA/rZjA==
X-Received: by 2002:a05:6830:4119:b0:7e7:aac:4cc9 with SMTP id 46e09a7af769-7e99bf3fec7mr15081180a34.3.1782742687021;
        Mon, 29 Jun 2026 07:18:07 -0700 (PDT)
X-Received: by 2002:a05:6830:4119:b0:7e7:aac:4cc9 with SMTP id 46e09a7af769-7e99bf3fec7mr15081142a34.3.1782742686417;
        Mon, 29 Jun 2026 07:18:06 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9e8228746sm647612a34.20.2026.06.29.07.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:18:06 -0700 (PDT)
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
Subject: [PATCH v2 2/3] firmware: qcom: scm: Fix reserved memory cleanup on probe failure
Date: Mon, 29 Jun 2026 19:47:49 +0530
Message-ID: <20260629141750.996853-3-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOSBTYWx0ZWRfX+uk70jDAd3QO
 ZvjZhB25AR6lbR2/YE1olPFOs17TzkjnFGpvXBW+FdUChwaJxXdgmMqKDSFRhhTRqJtWD4ijpDm
 wTF9P3AzmGUjUFHAwPBUuZp4xRjD0VM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOSBTYWx0ZWRfX1HIpjSP7pOsW
 s3tRFx3tYCoZVSKNkH0XLgOhMLgqBmBPzFyohR+4RgOAKHtCGlE0GfKcOKzGMynwxh0Bk043w60
 SmwJZcSXPd0FQPU/Ox1ZWhC/eN7DejN6AXsqvnMg0ORStpFzbZifFVjzszqoUBTz//PQlY6+EZc
 jrFV38rc1E+U06Y0LHZjop6rRk/By4tMV1g81QFtMiBXsvyQvoLiU2Ob2WU6BGyUZRNd+czNbCq
 QM38/qOzsy7fObmqodlwsybuwZzj5gyokkgh0zgN1812HTSg3yJXfqU+6Gf/xFpXxpib3pN4aWP
 QhHTkKvfpX4jjuyUS4fKD93m6ZopoguZ08HU/sHHBtg7V7nLXloyBKbHvHSlIXEtL9YXEzltXkE
 r1Qz6PQLWH/TnNm8xb0XIyruH16KJUYERzi2QVBj4+2+oPgswEmBZMDoTI7MXdON8ixrVdYNY/W
 G23HSUdRtfTs/ZFcRVw==
X-Proofpoint-ORIG-GUID: K2MIUdWt5h5aVLD6JieibCUFZrYpurKT
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a427e9f cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=mag7UKMDEwzM_1C7KTIA:9 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: K2MIUdWt5h5aVLD6JieibCUFZrYpurKT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290119
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115159-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6CB6E6DC117

of_reserved_mem_device_init() adds an entry to a global list with no
devres counterpart. If qcom_scm_probe() fails after the call the
assignment is never cleaned up. A probe retry would add a duplicate
entry, leaking the original one permanently.

Add an err_rmem label that calls of_reserved_mem_device_release() and
route all error paths after of_reserved_mem_device_init() through it.
of_reserved_mem_device_release() is safe to call unconditionally as it
simply walks an empty list when nothing was assigned.

Fixes: a33b2579c8d3 ("firmware: qcom: scm: add support for SHM bridge memory carveout")
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 464ae3b4ca43..f0e19fc314b4 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2785,9 +2785,11 @@ static int qcom_scm_probe(struct platform_device *pdev)
 				     "Failed to setup the reserved memory region for TZ mem\n");
 
 	ret = qcom_tzmem_enable(scm->dev);
-	if (ret)
-		return dev_err_probe(scm->dev, ret,
-				     "Failed to enable the TrustZone memory allocator\n");
+	if (ret) {
+		dev_err_probe(scm->dev, ret,
+			      "Failed to enable the TrustZone memory allocator\n");
+		goto err_rmem;
+	}
 
 	memset(&pool_config, 0, sizeof(pool_config));
 	pool_config.initial_size = 0;
@@ -2795,9 +2797,12 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	pool_config.max_size = SZ_256K;
 
 	scm->mempool = devm_qcom_tzmem_pool_new(scm->dev, &pool_config);
-	if (IS_ERR(scm->mempool))
-		return dev_err_probe(scm->dev, PTR_ERR(scm->mempool),
-				     "Failed to create the SCM memory pool\n");
+	if (IS_ERR(scm->mempool)) {
+		ret = PTR_ERR(scm->mempool);
+		dev_err_probe(scm->dev, ret,
+			      "Failed to create the SCM memory pool\n");
+		goto err_rmem;
+	}
 
 	ret = qcom_scm_query_waitq_count(scm);
 	scm->wq_cnt = ret < 0 ? QCOM_SCM_DEFAULT_WAITQ_COUNT : ret;
@@ -2868,6 +2873,10 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	qcom_scm_gunyah_wdt_init(scm);
 
 	return 0;
+
+err_rmem:
+	of_reserved_mem_device_release(scm->dev);
+	return ret;
 }
 
 static void qcom_scm_shutdown(struct platform_device *pdev)
-- 
2.53.0


