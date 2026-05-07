Return-Path: <linux-arm-msm+bounces-106287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGFALYFI/Gk0NwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:08:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B3A4E480D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A7E03028641
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 08:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A0FE54B;
	Thu,  7 May 2026 08:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aId/aLsZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WOnBTRDC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE94F3321C2
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 08:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778141267; cv=none; b=DfPW+eAu8G8i8GsWuQDFLSZ3r5EMMkeXtH3F4tbszPKNp9vUVSJwUygFn3q1tx9HukOplj1IOJYD0gNLMFGcu1I4qKV3jBgWodIWShp8gpHfE8itAFjhjGtfMusaayEoczX+11SoGm3FCH6DCN9SAaI5TW5EagwySqKer2vOwbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778141267; c=relaxed/simple;
	bh=Fqe1k6ndoQL7AnpjmB3rnljMslxXfxgBLPUTZjxTcSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AhdPXZRDmdqNrcbGph0x0sCkzwhrIb/BwBqmaoD8LiNqbThv9a8mwc6r8SHlwEGgLZ9Z4hQ55tnBVhpVQiAtBM+4IMHjCF7uFA2UcOh4XGkIpBYiaF7WH8LplFZQbhgtJuB5PiUU5Hpr/2dsbW4ddraTq5dt6bYd/MVbjQz+iyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aId/aLsZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WOnBTRDC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6477pTl71424449
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 08:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IVQVByW/wSo
	hyv8buz0jWXLYt9mFK1Fn/wNwuVrm8X8=; b=aId/aLsZi9orcrIVTnUwyCJaFk/
	N7Qzrm2XOewR1t9hT+ChzLteHB+s8DvhNKmXrUepqklZioomkIqhRxgdtrXGw260
	/h1Dbt9uz3/grSl5r0e4U07QLyE4HZ/FGtegwsVTzYpivpwQBN+JmsU0lqW++HWc
	x2fcop8JNfdjE1kxXKz1BuZibPVawjm2mq0lSGdAX4SufF/gRJ8DWX7ndFk5zKAr
	k6jWfv0u89wF17G1O3UrNnPtc+WnsB7joMJ3uoiY8Y3X6TwNkO8AAVhQnl2rQ99f
	lv0tvYTApHUF6C6zGCusunMERQotv5MiWbxhDLSTd523qnmcaInLnhOkg2A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0pqfr1w0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 08:07:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3653638874cso905160a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 01:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778141263; x=1778746063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVQVByW/wSohyv8buz0jWXLYt9mFK1Fn/wNwuVrm8X8=;
        b=WOnBTRDCe1vJWqHXGwdF5eMFUV7v5z19/eocnZqTTjtyBHc4z3cPJmahaAiZkZvYMm
         cOOP9Fmx13vL7icFYdrDcncBB8Kl3YQCrRRDBLwZAXp7SXN2W2mtSl5jTUMuLnuATHpR
         DQiqkGtqWfl4AzR4OQYErpp/Y471qsthyrwlSW8AVIvYvox/QwTfWR5i31F8A47KyHYK
         F3vFuj/ESt8WASFgh/jhe/aWgNKFswqxgFNZ7pdHlurKVVEq7x9fGssMpXhgSt2wzMZz
         O/PbU9Fx1QwAHYVD+0obtovl6jXOeuw44H42UrSqbzrzWk4cD1++I5CKHpKfDtnzf0+t
         IoKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778141263; x=1778746063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IVQVByW/wSohyv8buz0jWXLYt9mFK1Fn/wNwuVrm8X8=;
        b=tHFCdLPIsKy0yBmHrC4MfQ5cPDO6OfC+gU6uKDFhNXWwP1+tR45wZbgpSnJcuk35kL
         SI6P7rXdQ18pbtz+C6R8LoVdpGQVtoxvVWfU+a0n8BJviZhsJDVnhcED95WOdKHRBBey
         SDIUie4RSh8oVDVegz2aPwCN83CZoWfthJuU2sWjacWsyjM6W3Xx7GdZtfWo/fbz1SAa
         6BVCGm1B0x9t2o1vJt9nZqy6hR7+Ysa5LrWrpfnXvGVzN+4CtI8R7Xj3n3IFiJP8T4H4
         44j8GGFLuB9Hkne4lx6hqnu2/rU6pJ2IvygbkjUDcYCGoX8E/6DAvmIehngxEwJU4Oc+
         MWjA==
X-Gm-Message-State: AOJu0YzKJnU8XqQ3jPj9Z350qr0LRmf+fQuF4hVeaKJbcjgDDyxSCipV
	hPlmnHK1mBV5QGAzDz4Th8GiuHxpBtIFWdPhlDhMS1xT8KQ5coQZ5ia62FjlFJ8+bf9/kxMEAEJ
	/qncv6SD37QQ4cTvguwEmCd0Gxk2/6BN0qMTXlrA7z2zeuPLMXmz8bcuWuYXh7PapjH1A
X-Gm-Gg: AeBDieuc7lpIvnYRX75lTElGMZVTtnvCumLE8gY7v9U9L8YJgSxPRBA0Y3nThgrWQha
	0U1UdpU+2PAX/5aLJmEdy7UbTgQC6lYr5FKk9OWFu9MQFAZ7R3b6ECmyMhsX09PCjppPzLrSKjE
	VVykQ9U2cQEYWYbvJ2A2QtpkD8NC3PwRe+5oaWVNLQjeafA4jcmxLKWkiqFtomAyGdjAbCkut+P
	M6jwG+44KMP+75AYjt5yYgD6+AYibi/x9+/NZlEgadxmZRedxekxgMeqZ18T9dLWuBFaRmbRnnh
	MtjaRkfVoZii2LSihWN6dpnC/F8PS1coD3rnScKTOlbS7FpaUCahSUuDpNbkyiknYB8P8K7bsZ0
	zgETpJ3oHZwV1u7ARW0kzp8LvfVbBJZ5ugMTqveXsTDfVnWPdMPdM1/gdWBw=
X-Received: by 2002:a17:90b:5284:b0:356:2c7b:c026 with SMTP id 98e67ed59e1d1-365ac766d8fmr7725934a91.23.1778141263441;
        Thu, 07 May 2026 01:07:43 -0700 (PDT)
X-Received: by 2002:a17:90b:5284:b0:356:2c7b:c026 with SMTP id 98e67ed59e1d1-365ac766d8fmr7725871a91.23.1778141262870;
        Thu, 07 May 2026 01:07:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b0560fa8sm1986094a91.1.2026.05.07.01.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:07:42 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 2/4] firmware: qcom: scm: use dev_err_probe() for dload address failure
Date: Thu,  7 May 2026 13:37:18 +0530
Message-ID: <20260507080727.3227367-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TJB1jVla c=1 sm=1 tr=0 ts=69fc4850 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=7_M7cpwsPd7APosSulYA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA3OSBTYWx0ZWRfXxiK5CfSvsUzE
 kXkvPgNukRIGdPGHC4kDObCGFKFKBcpYRPTnOBwkwrZwOrrTAYh71gnGIlrtv0RH5j3f+ZwvUQP
 OVDLTD5AaplhkHZxQF4e/67XrTCgy7D2KwmU5PnAXZBsnvkxZknuPgwONAVxYuyWv32GaYgQhyE
 n5E4J6BDp5UbzXNze0cVCKbn4pNi6b1e6K93h36O3nZka0J8DWqxCDpQsA2B98UxDAlKMuzyWfy
 KkQK9w6V12Uv3TgJGYZUv3A1Rp/0AL8Z0auA2Stx/V8p+1R52G7fi5eruMUQ5JRHkkEK9w4n4X/
 bpBC8mTST1IcUODjrK9dS7RO8sL+9w7/129EQXsKdq8cZ5FgfRwQshtjaEW5rO05Wf8c2361W8l
 TwdPDdkFFJ/Cqywdfwbz7H0LkDGOo9+1VNNI8QAcYxqXobk5J/pm6fNvWsTvSZev+3tdeR4kN8t
 VvfMt/IvWQyN5dwQ+Wg==
X-Proofpoint-GUID: wD0TEy7ZepQdyv45dVFNkTuXwR_Uu2ND
X-Proofpoint-ORIG-GUID: wD0TEy7ZepQdyv45dVFNkTuXwR_Uu2ND
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070079
X-Rspamd-Queue-Id: 36B3A4E480D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106287-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Replace the bare `return ret` after qcom_scm_find_dload_address() with
dev_err_probe() to produce a consistent, deferred-probe-aware error
message when the download-mode address cannot be resolved.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index d9ee180388aa..f65b132004a5 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2762,7 +2762,8 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	scm->dev = &pdev->dev;
 	ret = qcom_scm_find_dload_address(&pdev->dev, &scm->dload_mode_addr);
 	if (ret < 0)
-		return ret;
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to find download mode address\n");
 
 	mutex_init(&scm->scm_bw_lock);
 
-- 
2.53.0


