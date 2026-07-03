Return-Path: <linux-arm-msm+bounces-116372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +X2rM6TnR2qPhQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 18:47:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D3F70466D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 18:47:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VOJk+1Hr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AXVY6b5J;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116372-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116372-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C738C30448AB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 16:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E722930AD0B;
	Fri,  3 Jul 2026 16:45:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A05730C164
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 16:45:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783097118; cv=none; b=FCld/G289T67iCeX5ECywAyuvN3dwx6hiJBle3iA9uBt18WkKEOv0FeEvR/J5VxbqjdbmybkcgGQ1BCwrlqnb5zkqv8JZ1tylgvi/Pj7aldsop7tVUO/PaQj1aD+f4g1hW5E56kqhbqLadwxO5djCJtUwCdROMv9S1RcDWJ4bG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783097118; c=relaxed/simple;
	bh=QFmdpn3SKWiErBEZDIVBnBpCy/h3HE95C34zDcSx4oo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JQbprYXiDE3/1fYKLNK6cf9xXJyi2XHBmztx7GU6tVEb0oC+3ly5jQHtyi0gATtnJrudeea7yBlQppZGtNk8uV2OEVs3R/ZPpZ57fFhGuwcslpJ33YPY0AD8eAAH2IIm/tGEoPSv2LLQkWsZF4g+xvmyxX+6NYWB+9UHdlwxCBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VOJk+1Hr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AXVY6b5J; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663GInxj476556
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 16:45:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ay27yF8zZgZ
	v28x4xa1DF/pvUrvVGtV2T+SPrjKMEWo=; b=VOJk+1Hr0Rm3KCk0urbMcfH+2Sv
	4OCyNQmXiauzE+Bf21v8rXTSYqTpIF1H2hzsjVXD6lfgRx33gzWtPeqaPFIN6KD9
	BhmJ5ouX+/7wgtZKkk1u4GVzFCJdIfNdtSw7ByDs7mMw+1Cc9VERTOuYv3hafnZD
	0EV7Vf4sjkJDPBIDZPcpy1pv4sof36uVEtjyXxwD9eFdeqO0zjy7FvjmiNj/GbpX
	s/LwOxCKkTACWxkhpaiejMwLecR1ndkyujrEMF27p0HCfGTbpwWG/Yl35fQSJK5N
	5+62uj2lIFrMZCdKR1Gd6KWJiQ8j+DeBljuxzjsee6X4eVCl/OuklyXrV2g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60eybxph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 16:45:16 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c889d1eebafso1747329a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 09:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783097115; x=1783701915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ay27yF8zZgZv28x4xa1DF/pvUrvVGtV2T+SPrjKMEWo=;
        b=AXVY6b5J4SfqexLjZ2X+d2LpyTrZimi12JGA1OJWBp7MRoPpZgDajt785YqiyT1mDY
         IKhjXV3FsfCnp8qAqort//tSPKNAHxAdwPKBlJi1SRIIQ9Upn5FHGRtga8173P8CMtz1
         CRn+1KbfJwzpeF07j1aU7ywsw7mybyjcKqUFmsT8PzCVKYSYGxW0BiPc6cCeVIe9JSJ2
         ub0fl54F2EP7f5zx1EYk9uk8w3O+zpEplkn456yWxONHGTSwblGGE7sk4/F9AxKIfoMk
         bdnarJUuN4qyVkR/FXTOHcbvJQbJTq+bG0F300/J+EExs+IUCj/eDkRCiAAkAzRbMNkv
         8rkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783097115; x=1783701915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ay27yF8zZgZv28x4xa1DF/pvUrvVGtV2T+SPrjKMEWo=;
        b=c1PHWKV7YZTOn3qGT8i4ksZMSIVcKOj6TFX0X+sw16vtrN7FoX5VA5yPlY1pO6drsn
         8Sq0bQd89HbImjbo1J9oSPwUXUw9H0ITHCheFunbrwQDj4VUO/MCNhIc2pOWrIGqaGmU
         PBZjjQ/0I1T5tWBNyUrPiYHKacySgRRKgdzao30ruWdbthXvCOGir/lb0YJsKYkPBGBH
         7Uh0Nh7JoyNCjkcvFjuUUY1xcFXiK+OST9RqnxwUJ0QJLaH3OCiAu4AVoeW5XcuwFAwP
         F3JQ/rP9uUzoqBEDflIL60xXJE6CWuo0QJyTrMCe/FzgQWdtVDR4bKQuvVc9EJZf5b77
         khSg==
X-Gm-Message-State: AOJu0Yy7n/EBUiMCVw2u5kli34lHxrzs9LglNmDqD+OSbCKWkyDHIpg0
	lEFzjpgYubNnFGQPMutVrNbmbw05xc6bQX0VNuN0ErHqRkGKmCMiLzzKz+MzQD+v9mgwLGekSHJ
	fyTSDPIrvgnvkXH287iE35j49W19jp8Jr4TNpXxZT2p/nj77lt2HPbalGpZkQU7iAq06F
X-Gm-Gg: AfdE7clyxDwxz53SR9wEQR0aecMLGn5CLLtDYxIV6hrVofdbFOAMabJBtIi/VeWwhWK
	um6NQ1PDu4+Zgpvv24muGFtJL1hc5KhQ9UTzZUfptw4bP0WTo7bVLz6GqTuB5ijeYr6AcTsZK2T
	+zZ+xAK0Ch1YagmMuzWL7HZm7lFryUn76fV70ppCpnohW/c/9WGrCbUC4vHtfK46TU2yN0R0Tl7
	WTM+rMJYw/GunSpdgsUa/3aWgff+KGUyBGlG9LCli2qcfMmOB0Yk7SIFkQicjk1NXxoDv+QHeh5
	VUcShdhYyRE3RqiIS/U9K+yIJmD/rkW0ETFyPjbtNFUJ3SM1sXXvUzf55xcfGucGa2Ft1ETo5ha
	sEdB4A3x0ZBk2lldxJ2H6MxU8U5amUA0aUc0e7g==
X-Received: by 2002:a05:6a20:7486:b0:3bf:6c08:2847 with SMTP id adf61e73a8af0-3c03e51f17cmr148085637.54.1783097115337;
        Fri, 03 Jul 2026 09:45:15 -0700 (PDT)
X-Received: by 2002:a05:6a20:7486:b0:3bf:6c08:2847 with SMTP id adf61e73a8af0-3c03e51f17cmr148029637.54.1783097114658;
        Fri, 03 Jul 2026 09:45:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f38ee1333sm3908984eec.24.2026.07.03.09.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 09:45:14 -0700 (PDT)
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
Subject: [PATCH v3 2/3] firmware: qcom: scm: Fix reserved memory cleanup on probe failure
Date: Fri,  3 Jul 2026 22:14:56 +0530
Message-ID: <20260703164457.4040457-3-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE2NiBTYWx0ZWRfX3h9GYyABfNuo
 HpISSNWdl3ilAiJ7tVlNa358UCN8ahsKRqqL9R0OkirQiSU3JiSQo5x2VnpG4rPlgJvP78fd0Tk
 TLFJKNJT8u2bYtjgQmgj+Zp3TgIFtqxMz8gZ+psvTJDLLQpdedwnNMetoMKdIkTeN1pVCWNPd8r
 3lMojbOzFqwlzfosizJY8g+O50x6mFoKMpJNhoD8Jr0RFvnwjGqp2WZnqVziNixgcbWCBZfJdlE
 8DHhd/idGXmI1GbQCKko2vDS5t0Mps/i1X/79Ezx6WK9dPWZZAagz61rwWzrUwNX29rhE2IX8Ql
 9jBP6tRE8b6wtsaP+174MLgBEbcI8WBMBFvVETY1tCVIbUttv7W9HU/hwF3ox/qjVEe8WPilJpf
 eX4SP+KY4Fl5GLpxbZotfFfuePR2npkRuE58yAQHN2a3MQsQi4eBWm7SriWqrvBsjXVWTqy9yzG
 EZctfOBHLxxwNQJUeHQ==
X-Proofpoint-GUID: fCEjr77h0RPNM0CuglIUaCgsD5Y2B0IA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE2NiBTYWx0ZWRfX5JZmsuXJuTNs
 jI4iZUBFTdxpanmk1KwFi5hb+146uB7FDtUCWxMbIovBAvSkII0S5sVp+/rSIn7qox/KaClN8Lf
 09dVSceAgV9UkDi6T3wiUeeX8Cpe8RY=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a47e71c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=mag7UKMDEwzM_1C7KTIA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: fCEjr77h0RPNM0CuglIUaCgsD5Y2B0IA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030166
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
	TAGGED_FROM(0.00)[bounces-116372-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 42D3F70466D

of_reserved_mem_device_init() adds an entry to a global list with no
devres counterpart. If qcom_scm_probe() fails after the call the
assignment is never cleaned up. A probe retry would add a duplicate
entry, leaking the original one permanently.

Add an err_rmem label that calls of_reserved_mem_device_release() and
route all error paths after of_reserved_mem_device_init() through it.
of_reserved_mem_device_release() is safe to call unconditionally as it
simply walks an empty list when nothing was assigned.

Fixes: a33b2579c8d3 ("firmware: qcom: scm: add support for SHM bridge memory carveout")
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 464ae3b4ca43..26bf87247afa 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2785,9 +2785,11 @@ static int qcom_scm_probe(struct platform_device *pdev)
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
@@ -2795,9 +2797,11 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	pool_config.max_size = SZ_256K;
 
 	scm->mempool = devm_qcom_tzmem_pool_new(scm->dev, &pool_config);
-	if (IS_ERR(scm->mempool))
-		return dev_err_probe(scm->dev, PTR_ERR(scm->mempool),
-				     "Failed to create the SCM memory pool\n");
+	if (IS_ERR(scm->mempool)) {
+		ret = dev_err_probe(scm->dev, PTR_ERR(scm->mempool),
+				    "Failed to create the SCM memory pool\n");
+		goto err_rmem;
+	}
 
 	ret = qcom_scm_query_waitq_count(scm);
 	scm->wq_cnt = ret < 0 ? QCOM_SCM_DEFAULT_WAITQ_COUNT : ret;
@@ -2868,6 +2872,10 @@ static int qcom_scm_probe(struct platform_device *pdev)
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


