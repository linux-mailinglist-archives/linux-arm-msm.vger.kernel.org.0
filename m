Return-Path: <linux-arm-msm+bounces-114490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1LRzJl33PGqGvAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:39:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 088186C4517
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:39:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=b4iMNgnu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ULA+b25v;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114490-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114490-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ADADA30A3712
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB763CCFD2;
	Thu, 25 Jun 2026 09:36:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A035C1CAA78
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:36:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782380215; cv=none; b=RpiBrTiEdwdUK4GclK7DcEjhORpkYdW4S06bWx61TBNtv9SZQZ1E/wS1k1vWB+eCM3b1Cz0wrjB3m5y4dxE/SLB4cTrIvCP9APqxko8YxG9AqXN8IywFABsnnvw/TMX1Th3C6wQl029BsL7rFNNsjO48nUvbGHFsqgQ1qxeEPhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782380215; c=relaxed/simple;
	bh=GINfe0IEN+5RQC/mziNtNaqc6jNSmuKvAfDxICFx8a0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o/kgwpnDfx3yUFvzDyB+4D1ROyQS74FTxm5obDE1JoAg/VvHzLfM1DY/pn6WQv4kxTR+kvDwEF1h/EJFA2GB+knXzCroQBj7kax0jdgAuTuwL41PfByCeqHlskMsEaA7ZqM6WM9ZfhlsoFmuS8EO6qb0OaCX3Ut0qj5F4dAl8rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4iMNgnu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ULA+b25v; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8p9nl1247056
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OYUac9gdHKQ0bXVem8jt8Fm2nxuYdEvOCye
	Kfp1XuJY=; b=b4iMNgnuCeyqteyCfCxO4izVUiV3jiZBxcTm8xXfwjdqqANQQ9F
	g0wReeTZC0lKfIYHMZZvt5Z0qXEu5ZevISxFqteaGus1acPDInf19vV8Zr5Fotyc
	r6kPkA2EHnfy1wV7NJT7zKDDsn0LZdA6VvJMigwvf72CrSCz6d4Gx/AL7XJW0F5s
	v7OvreKw9Rc4ex9fvnvJVg4J5+cNwqztjSBa1QDPy+o74oMDOlRNN2qIL787vXm1
	nLq31CWQRd7lOSvx6V1mZpe5rXP2AN5ELlYamDOXCxMl5AyU7r0aHr0ms1MHRCMf
	PVlgYxZACs8bK4s7EQluw+BnjxhE1PPSVdg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ymv0ju6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:36:52 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8453a81b846so3026975b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 02:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782380212; x=1782985012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OYUac9gdHKQ0bXVem8jt8Fm2nxuYdEvOCyeKfp1XuJY=;
        b=ULA+b25vddAQbIMqvZge0G7lQ65EdEx2j/DwDI7+UdEzhqZDHsmR7uP3Z6YhvGgl1L
         AdilgOzlw3nJ7+l1f7flOfIkvnzX5KYXuZZpBzMhVIfti2d+RO0RHI8lzJ/VWk/1s8z9
         k8ZpsSYwv1YtVzjPPN2F31uGPOrf1DD3ajCSThL/KN1SJYwNDjHUYLMbHC941BtN7mKn
         JSISmtlLc873dN+a0rjaX4N2g+VKUJejQIZYYYml8jZNcFb4k1z17KAJA8zHJ44/BeLP
         C0qWQdHI856ZozTs3t0QOhZ6yw7I3coUJS/97Kymd448umQfDHC9O79hcOT0SHYo7osX
         IFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782380212; x=1782985012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYUac9gdHKQ0bXVem8jt8Fm2nxuYdEvOCyeKfp1XuJY=;
        b=ro9iC9+HF8AgAKySwy638zn1CrCDpUz8Lsg902opxQCWy/hiro9xzv2w9Y6RgsfryL
         2NEb3OMySAAEx0AUqz22to9RfIr8euOYyFCTY0mq2cdunM6jboCLtFQDjz/2sLVgfZ5t
         5IcWdeokF3qbN0tkDQdDUULjTvlXOjUR8hkk3TKXskTriIFpHmJKjsAsOdNYbdTQxJ6w
         0/h6aHyQgnKkSlEB3Drdaf1fs3YKsREVs7TtQO/pLX/CWbt99ddHwQIW2CKQDjLphXy5
         9pqCST/KC9K1LSuXQuWQroWNXGk7tSxYQ3sSiS7fWP+Ebi9bEhhZiIAHGIQglTMgPn/p
         Eprw==
X-Gm-Message-State: AOJu0YwOJ6hy7YgI/d5/mqpUOEAKXjqVxtlZVDdVc16LUIvFZ4E3K/h2
	oRtDDueD3YeI6AtTHrZPMWAQKNCwXQTAFaj5xqoFiqZSlYm1WxEAR7te/zAWlo/Fgt3ARlePrLc
	H6kBrQqdTuwMfqyemVfOxSRHwNxUUa9LN12yE04/MlFSwgQ+kINH9aeSQBehlaanAJPg5
X-Gm-Gg: AfdE7clLxTG4OVvgt6oRC8ejob+KjhQ48YKlHmZFLLpSRX5MaUuNroWioSsw7RXa3dO
	1ON+VAx4pP67mvs+JyLN3GNf4XNCOz3DthD/w1Zwurv/DlNEjPgtE5jiZKmoDIPQ+GSblXB2fut
	1AmNuu3rn9c4ubNR9gCdgTZMXwHqIKTPKUhz3GY+YqZwA5QAdqN1KSmfkwuLe9B3noFYRyqiSwN
	jIhouvQklRtK0ifgEDl1yWW4rl3FNNTEL40HS2/fF/f0HB9Y/vzi6PznaU6FG4nZ2p5tZtgTpEY
	WdyC2jX9dlZTbF7YXjiJpqSWThDqzhyoW17KiAhxFdHUDXQ3lj14LWJWBfG+G6oU8MD8/F2gXbH
	1k/jd8oPQP6Sdzk9g1WE+j6S9szsfu2VE3ZDmNQ==
X-Received: by 2002:a05:6a00:21d1:b0:82f:5051:f024 with SMTP id d2e1a72fcca58-845b3ac85d9mr2397955b3a.27.1782380211916;
        Thu, 25 Jun 2026 02:36:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:21d1:b0:82f:5051:f024 with SMTP id d2e1a72fcca58-845b3ac85d9mr2397885b3a.27.1782380211166;
        Thu, 25 Jun 2026 02:36:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a4120e30sm4372635b3a.50.2026.06.25.02.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:36:50 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] firmware: qcom: scm: Fix resource cleanup on probe failure
Date: Thu, 25 Jun 2026 15:06:44 +0530
Message-ID: <20260625093644.3918184-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DqBmPm/+ c=1 sm=1 tr=0 ts=6a3cf6b4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=uihZu18H8m0TJQArKZ8A:9
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA4MiBTYWx0ZWRfX2TDvERcSk4TJ
 rEki1+UmGizJF7TUZ5JjSiKHpax6FNB4qbZ+82TIyGVQF6ues30VMHmUD5APtukXqDyQQXFp5If
 2dCqPdTqfmmQn8D9io56M816MuCuHzI=
X-Proofpoint-ORIG-GUID: qfMiBBpXiX72Rz-QZ_iNLgILrB35AxHw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA4MiBTYWx0ZWRfXz/79lR63oJT/
 dkaNyQGhISw7LKbLQ5kqpX3efeW/Dzz4BzpMUh+LQPEMzi6bIj+xf4EWaxoKzx4rpEH0EWMoF4w
 +gtr+idKwXSZzxh6hVKl/UCk+GR68w+g5oO5lUa9gNLyWplGwzDj/JQdepNV8dEmzBLFQ2cUWiU
 cy2CAYy+L+Dk5Dhd6mAlP2jcboFp0vwXGqzY3l8+ohMXRdsA2kjcSvGmHcd8XVwkN+noLLrtCA8
 jRJYtucUUHo15e8E2WEGqn7jI+MFO8dvbTdrHzmlvY42ObJqLz1ahOM8EfPIhPSqhzHQZ2Sje05
 5hQ6fS9AqRX8GDy6dc4aZsy5Pwt/IlMtmXL/eXb2+mEgNniHN+mcaIxTGu5O6J36CBo9TSFlHh/
 ZM+PXvEyWPAjgfIllM6I7mUNMoq4bAObF03ZZ9pk8FaqRlfBmL/lfBQ1nbP6czMes4j2TRm6q3R
 f+bq4ke3EcwHdP7Iohg==
X-Proofpoint-GUID: qfMiBBpXiX72Rz-QZ_iNLgILrB35AxHw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250082
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
	TAGGED_FROM(0.00)[bounces-114490-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:brgl@kernel.org,m:quic_eberman@quicinc.com,m:ahalaney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 088186C4517

qcom_scm_probe() acquires two non-devres resources that are never
released if probe fails or defers after them. of_reserved_mem_device_init()
adds an entry to a global list with no devres counterpart, so a retry
would add a duplicate entry and leak the original. qcom_tzmem_enable()
sets a static qcom_tzmem_dev pointer and may set qcom_tzmem_using_shm_bridge;
without cleanup a probe retry finds qcom_tzmem_dev already set and
returns -EBUSY, permanently preventing the driver from probing.

Introduce err_tzmem and err_rmem goto labels at the end of probe to
call qcom_tzmem_disable() and of_reserved_mem_device_release() in the
right order, route all subsequent error paths through them, and add
qcom_tzmem_disable() to qcom_tzmem.c to clear the static state.

Fixes: a33b2579c8d3 ("firmware: qcom: scm: add support for SHM bridge memory carveout")
Fixes: 40289e35ca52 ("firmware: qcom: scm: enable the TZ mem allocator")
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
This is reported on sasiko review as existing issue here
 https://lore.kernel.org/all/20260624192213.C82691F000E9@smtp.kernel.org/
and it can go independently.

 drivers/firmware/qcom/qcom_scm.c   | 42 +++++++++++++++++++++---------
 drivers/firmware/qcom/qcom_tzmem.c |  7 +++++
 drivers/firmware/qcom/qcom_tzmem.h |  1 +
 3 files changed, 37 insertions(+), 13 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index ba5cdeed8a04..cb3d776fa645 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2883,9 +2883,11 @@ static int qcom_scm_probe(struct platform_device *pdev)
 				     "Failed to setup the reserved memory region for TZ mem\n");
 
 	ret = qcom_tzmem_enable(scm->dev);
-	if (ret)
-		return dev_err_probe(scm->dev, ret,
-				     "Failed to enable the TrustZone memory allocator\n");
+	if (ret) {
+		ret = dev_err_probe(scm->dev, ret,
+				    "Failed to enable the TrustZone memory allocator\n");
+		goto err_rmem;
+	}
 
 	memset(&pool_config, 0, sizeof(pool_config));
 	pool_config.initial_size = 0;
@@ -2893,16 +2895,20 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	pool_config.max_size = SZ_256K;
 
 	scm->mempool = devm_qcom_tzmem_pool_new(scm->dev, &pool_config);
-	if (IS_ERR(scm->mempool))
-		return dev_err_probe(scm->dev, PTR_ERR(scm->mempool),
-				     "Failed to create the SCM memory pool\n");
+	if (IS_ERR(scm->mempool)) {
+		ret = dev_err_probe(scm->dev, PTR_ERR(scm->mempool),
+				    "Failed to create the SCM memory pool\n");
+		goto err_tzmem;
+	}
 
 	ret = qcom_scm_query_waitq_count(scm);
 	scm->wq_cnt = ret < 0 ? QCOM_SCM_DEFAULT_WAITQ_COUNT : ret;
 	scm->waitq_comps = devm_kcalloc(&pdev->dev, scm->wq_cnt, sizeof(*scm->waitq_comps),
 					GFP_KERNEL);
-	if (!scm->waitq_comps)
-		return -ENOMEM;
+	if (!scm->waitq_comps) {
+		ret = -ENOMEM;
+		goto err_tzmem;
+	}
 
 	for (i = 0; i < scm->wq_cnt; i++)
 		init_completion(&scm->waitq_comps[i]);
@@ -2912,14 +2918,18 @@ static int qcom_scm_probe(struct platform_device *pdev)
 		irq = platform_get_irq_optional(pdev, 0);
 
 	if (irq < 0) {
-		if (irq != -ENXIO)
-			return irq;
+		if (irq != -ENXIO) {
+			ret = irq;
+			goto err_tzmem;
+		}
 	} else {
 		ret = devm_request_threaded_irq(scm->dev, irq, NULL, qcom_scm_irq_handler,
 						IRQF_ONESHOT, "qcom-scm", scm);
-		if (ret < 0)
-			return dev_err_probe(scm->dev, ret,
-					     "Failed to request qcom-scm irq\n");
+		if (ret < 0) {
+			ret = dev_err_probe(scm->dev, ret,
+					    "Failed to request qcom-scm irq\n");
+			goto err_tzmem;
+		}
 	}
 
 	/*
@@ -2966,6 +2976,12 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	qcom_scm_gunyah_wdt_init(scm);
 
 	return 0;
+
+err_tzmem:
+	qcom_tzmem_disable(scm->dev);
+err_rmem:
+	of_reserved_mem_device_release(scm->dev);
+	return ret;
 }
 
 static void qcom_scm_shutdown(struct platform_device *pdev)
diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 0635cbeacfc8..3f2b782f4a94 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -518,6 +518,13 @@ int qcom_tzmem_enable(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(qcom_tzmem_enable);
 
+void qcom_tzmem_disable(struct device *dev)
+{
+	qcom_tzmem_using_shm_bridge = false;
+	qcom_tzmem_dev = NULL;
+}
+EXPORT_SYMBOL_GPL(qcom_tzmem_disable);
+
 MODULE_DESCRIPTION("TrustZone memory allocator for Qualcomm firmware drivers");
 MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@linaro.org>");
 MODULE_LICENSE("GPL");
diff --git a/drivers/firmware/qcom/qcom_tzmem.h b/drivers/firmware/qcom/qcom_tzmem.h
index 8fa8a3eb940e..0b0f26d4e22e 100644
--- a/drivers/firmware/qcom/qcom_tzmem.h
+++ b/drivers/firmware/qcom/qcom_tzmem.h
@@ -9,5 +9,6 @@
 struct device;
 
 int qcom_tzmem_enable(struct device *dev);
+void qcom_tzmem_disable(struct device *dev);
 
 #endif /* __QCOM_TZMEM_PRIV_H */
-- 
2.53.0


