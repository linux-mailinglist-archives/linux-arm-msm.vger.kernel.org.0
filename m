Return-Path: <linux-arm-msm+bounces-105422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sK06NQaq82kF5wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 21:14:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5A64A750B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 21:14:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D03FE3015315
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 19:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9580F47DD7E;
	Thu, 30 Apr 2026 19:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="heuouaUF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xi+K8y6R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC5E47DD7B
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 19:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777576415; cv=none; b=rwb1SJsHLmA+ckssEdbMa6E9LAOlE17fOsXNShD2gnYfQXlgM6JW20UZz4nrvQpcmCI+GywKvzfKUX4WSXdbWHRG1XyhNguR9BIjcLw8Qj6cpeyfALKT5JQ3Za33sxJcVPXazrGXwVf1ofGpbaSTk/8pwcNf8CREPPMVr2jdcBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777576415; c=relaxed/simple;
	bh=gQWNsHl91ilLNjTSh7RNOaVTObxlwn2h8QvMOHtZWew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JY9HeKkgnjpSamzgffB1K7/Hp4xqHoWV8/vK95AEifdYo0qCOXXvySK6iNNYxTKb8ZqzuSV2g69HugHkiQz1oZfQIayCQKfkJ00rpKvYp1FcstrvXXyQLD6ZLTnkd/eQuLb9AMlgF3Jo75+1cdA6HRLv2mn025fhCIuwuQ5I/bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=heuouaUF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xi+K8y6R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UHfGeI440710
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 19:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fg2lzz8NOqj
	c+GdU+0aG/zCCAsXprdqRORQ1jihAjpw=; b=heuouaUFx+1y9s1txSMyYBX2793
	+9XmG9DbsQl7+fAek3Oxl1IYXrlezi83ftbYckPWYB+45FA7e4cjmm1pOOGLgQV/
	n1SYwZWu2Zroq9WFAjALAskcA+drIYjst3ev/nTFqFbLczIoo543wj0AcyW4qgmG
	KDfsMqsm/xrHXz5cJqHEl9W+vHWAaCdd9cBYgWvyY53hYicZsTAkgPOTQO4hY2hm
	kHlc9I4a//rcmVEIYWrl9u7G8NL1R466cQR81UqUUJhDuwy4Ie7o4GxX1DL0T1DT
	q2yVSR0BQmDfoevMdAMqNfnz6Uu3ZeCvYSSe17UFa//+wamYJDRYdTs2Peg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvbpw8hdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 19:13:33 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f71437218so941022b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 12:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777576413; x=1778181213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fg2lzz8NOqjc+GdU+0aG/zCCAsXprdqRORQ1jihAjpw=;
        b=Xi+K8y6R9tKYntFJBQS0hMmuZyxuwOk2UjyvawCnguvGJzYCkFytpvKXEKo384a7vP
         Hv3nrG0YJ7NNI5vE25qPjbV9RSeUESJr3nWtdvvxWpWAPjrdeL0xiC/QLusyOAX+4NSC
         oAfiHiAv4JwKzJdKBSZcFSOc1Agay8nfJFXunqcVHHLKs0DURteJWtDQkj4winb9jJFu
         iBbK9HiHuMdu8LZSd18w+KTVL3vczk50fE3+8u6vv5q7e+x1hMp46ceyXBnrNHmrn1Y6
         owJfkivOpht34dgry5uVPLMbEsRKOE7SHiAhbbGzK5QoIla1PH1z/Ufn57JiZUVgIQFW
         raPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777576413; x=1778181213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fg2lzz8NOqjc+GdU+0aG/zCCAsXprdqRORQ1jihAjpw=;
        b=pWPlVoWrRrGHf4IljA0A8QDyyyeWfTVltw2l4W8jBA2ZR3+F/bjiQp4oJgo8OtdALv
         zlHoUlYrRjVMNdwt3GI7MSL23w+8KRVYmPpi9blmCd72Gq2Zhpr9RVOb0CZx3lV3/nqE
         XM7Tw2JX4e6m/CCZt8AVYrgZ22+QtNJXdA0/t6ogdwTugAbXlESCB4pcE0y8jsdrVckd
         rn8NhqqcdMX4o58legapRp5zpSKHBf2s8gWd9tLzag9MdxnqmdUsr5JVI+YKnfKJJHWr
         RHlUp0lGLeEGys+InQPUb7F7jQztnt5h8wpYodDOUV3XApYgwqjO2O5d8nbB5vB44Fvd
         QTOw==
X-Gm-Message-State: AOJu0YwUjH5qYdt22EBLD2yKvMqhKidJUKrbtqXPgUDmi1b+8zNOpH1p
	usxCYqPVqvrONCVZM2csJM9NoNq/PFVn/sFtzPbtm4br+71e3vYhXDmVWiKCfoSn8r+KEhk2tEH
	8BAIXZHqdXNFCcn3I17tYRA5jJGqx/z18TT58N82SG9gvMz8FB6cUSsf7OxAZAl6VB1+v
X-Gm-Gg: AeBDiesrAfMNk8Sgv5rMABumhOteCISkegtDNvcJcm9j/qeGwC58D4Is0+9kzGNd0Rg
	Ci7uU1eH+d3vxaLa0Amj8486ASuWocqol6vASlLuYVdG3dqP9MEUUpSEBQDR8euPANcWvbBjxP+
	002KYwkvcQO3S/e1I2MpXyv1bqssEAhcBCr+LAhJGR65NxKRwxDxmKjXpYj5x6T0Z1A0+zIWMGk
	ZnSP0KVfG45Gx8J9US0iU8BBOMfBrSywzH8uoSkwgzRJbpAz6gidLxOKbpIZC8P9RszyeIc311t
	/LOt6ZOQ80uDHeWmC0QNbMXdQcd7ZanwGS2R37Kbo5CE39MiLoflw7NBh+fGyYhjLj0MRByUP3s
	htUpP4/79zNrvaarGHwtQOqcdLzh8BcD9ltRxdhJpXNz7B8wNj5Ygf6nIgIk=
X-Received: by 2002:a05:6a00:90a9:b0:82c:9c90:58c9 with SMTP id d2e1a72fcca58-834fe06049cmr4393900b3a.4.1777576412667;
        Thu, 30 Apr 2026 12:13:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:90a9:b0:82c:9c90:58c9 with SMTP id d2e1a72fcca58-834fe06049cmr4393871b3a.4.1777576412099;
        Thu, 30 Apr 2026 12:13:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b485eesm373640b3a.48.2026.04.30.12.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 12:13:31 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 3/6] remoteproc: qcom: pas: Fix the PAS context creation placement
Date: Fri,  1 May 2026 00:42:50 +0530
Message-ID: <20260430191253.4052025-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dozrzVg4 c=1 sm=1 tr=0 ts=69f3a9dd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=vHqpxYNXqBXYHKvWcGcA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE5OSBTYWx0ZWRfX/PdXepKxplvG
 Y1quDSKRwciIu4Hwch2+ZocvFGmwi0nQ1uF53a6xKQKB3KSbH/EsQfn/OIDwDuGhHUE3X+i6t3X
 lirUEXbm9p1kWSk9poyKWiP+KbsbFC6wTo6x3WEueghY8zgEu/SH8/fu/iEpL1VV/8UGdX3Qd00
 DsD2DpEKckPqpPxWsDF4ibaJpu23cbn4cB1KJuXfgCByXZnIsFaSioCw8x8Jo/PANZ+DouC4oWa
 TwdCsFo8ypNLeEXtvNiOL3ARI+3PNPTkPaJCs8S78ol5Kzy1YwQN/TCL81iHQo9Cs1ot4YaA2fd
 F3dSplZZOom8RyEOMSsAUdHZLTM/NAHbbuzZ0K6qpneSS1pUq3krk1WIOZWngXD0yecN3h+yMIt
 SdkMKJboVLjK1PDVIlhlAlkdfIVsx23hm4Uulj0UcW5S+AYE7wC0PJ7P8q8TRWjnpWgaFsJj0c4
 wnSqodpzVWEi2bfC2vA==
X-Proofpoint-ORIG-GUID: rhdcRF_KOKBN6L5Po43cUMWKF6KK-OlV
X-Proofpoint-GUID: rhdcRF_KOKBN6L5Po43cUMWKF6KK-OlV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 bulkscore=0
 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300199
X-Rspamd-Queue-Id: DF5A64A750B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105422-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

DTB PAS context creation should be done only for subsystems that support
a DTB firmware binary; otherwise, memory is wasted. Move the context
creation to the appropriate location.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 32 ++++++++++++++----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 2785d19408d1..a64fbf7225aa 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -620,6 +620,7 @@ static void qcom_pas_pds_detach(struct qcom_pas *pas, struct device **pds, size_
 
 static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 {
+	struct rproc *rproc = pas->rproc;
 	struct resource res;
 	int ret;
 
@@ -637,6 +638,12 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 		return PTR_ERR(pas->mem_region);
 	}
 
+	pas->pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->pas_id,
+						       pas->mem_phys, pas->mem_size);
+	if (IS_ERR(pas->pas_ctx))
+		return PTR_ERR(pas->pas_ctx);
+
+	pas->pas_ctx->use_tzmem = rproc->has_iommu;
 	if (!pas->dtb_pas_id)
 		return 0;
 
@@ -654,6 +661,14 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 		return PTR_ERR(pas->dtb_mem_region);
 	}
 
+	pas->dtb_pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->dtb_pas_id,
+							   pas->dtb_mem_phys,
+							   pas->dtb_mem_size);
+	if (IS_ERR(pas->dtb_pas_ctx))
+		return PTR_ERR(pas->dtb_pas_ctx);
+
+	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
+
 	return 0;
 }
 
@@ -835,23 +850,6 @@ static int qcom_pas_probe(struct platform_device *pdev)
 
 	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
 
-	pas->pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->pas_id,
-						       pas->mem_phys, pas->mem_size);
-	if (IS_ERR(pas->pas_ctx)) {
-		ret = PTR_ERR(pas->pas_ctx);
-		goto remove_ssr_sysmon;
-	}
-
-	pas->dtb_pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->dtb_pas_id,
-							   pas->dtb_mem_phys,
-							   pas->dtb_mem_size);
-	if (IS_ERR(pas->dtb_pas_ctx)) {
-		ret = PTR_ERR(pas->dtb_pas_ctx);
-		goto remove_ssr_sysmon;
-	}
-
-	pas->pas_ctx->use_tzmem = rproc->has_iommu;
-	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
 	ret = rproc_add(rproc);
 	if (ret)
 		goto remove_ssr_sysmon;
-- 
2.53.0


