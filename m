Return-Path: <linux-arm-msm+bounces-109704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKXHM5MXFWqQSgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 05:46:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E770D5D06F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 05:46:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0176C30028E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 03:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4032C1A9F96;
	Tue, 26 May 2026 03:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aB0yG/zt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dYl1Vqfj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0082A2E5B2A
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 03:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779767182; cv=none; b=BDOCURFU/dZk4bLb/YU7vDG8MkFxCn+wjNC+GJUTU/6KmiHFfPdsNuVvSln14Sa5e3EwF2znKdXZQHs1+lc0Sv0fUNOMFWjJkuPK3lv6k5Ah4/hoiRnkFbqPGq3X7K2Yr1vPUX3o3DtL6Hx0FCKj17Inc8S6AZK/EFAcU+Ts9pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779767182; c=relaxed/simple;
	bh=XZdAZaAtQcyYAGB3DQOfoExEp6vD9CjO1J15n1KZgCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sHHMm4imxYSL0ItM9Yw59evLW9AWDsZSSOVvZGqlto1CS00dG2lbt2XGlk9oxlXPUbO6jUAeshrIISriiJ4QVfeGKeYJoBKKxWyXFOFotZPZ/M4LNUlRKw+rYZNplswB1b9mklnjmFFaJb76h1nDtBA4t7xvM0smZmHQS1a2xLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aB0yG/zt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dYl1Vqfj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q2mgBi2822853
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 03:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hKpCmYx1/VB
	9NuoIJY/HWjKO8WwtobMzOCh7XtUICjM=; b=aB0yG/ztdagD50kwU61MghWXWPy
	bPFiESTQIMqUJSjVkxruRlUvFzJZcsCP8ORCIcXjmky+fGaGK6cAPL68IlcMu+n7
	eRo9Jy8AkDBTXHRVF4ShDXxMzIEOE0EW7AvfavypJUlZF2u4jQhrug2KkkhynBAz
	Qp5CB3MVNZmDQJwjj1yoNPmu9d01chItZ+OwXk2AGpnobAXxhj0pu/F6a+AZnTv3
	ikZgYDOla5LJiwGLxRIlYT3va8fJSDm+3NybOxRzN/zgS1M/syYu0unBocRk+pPZ
	qya/kacdEb/Q4LoKGlQv+rWYeH/BsRka4TQwL7zKyayHjbXB5asV+y8E75w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqvwsv5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 03:46:20 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304448ab58cso2086068eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 20:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779767180; x=1780371980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKpCmYx1/VB9NuoIJY/HWjKO8WwtobMzOCh7XtUICjM=;
        b=dYl1VqfjbLykXGAW6O4ghz6e5Whpn0WW82S+6G5dDfacoBnPPVhY/idjLdx2tLJxAl
         F+kCEI244QilYaKri+4EU3vloP/c6QqDHe725b6pjMld6ehoCqkWutFlMnf0qkMjsm8L
         c3ogyWZ4RN9kufvt9wd9PPQY8BaRnceekaxi1CmuruEHyS03sAExOd+YPUdOvsmvSzIH
         k+1Azzz3ZU4pjPk6AiPHVTb1PLAEByS3/CH+xR1c/gEevi8pE4UnLS78A4WFALtq/Yyx
         2LNtDLSxdiXNW1EJ4h5fwxpi85/ikB0UFwXr37APIjCK2yfCvj6H45U9rI+4fqJcJ3qC
         dMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779767180; x=1780371980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hKpCmYx1/VB9NuoIJY/HWjKO8WwtobMzOCh7XtUICjM=;
        b=PB4gIy0NkMf77/8/So8NAGbXjuwQaebiZ5B7UqIup98wmRfxxNiwWvoBACboPnYEDc
         L57qId+PzKnfdlZwnyrZxIjh7hW3PyMr8fQ3wp5cpRl9HvsMg77xHBw34g6CrUtSkznJ
         ZVu0Nzo6+S9yS9gYHNuWDD6KkpYUk4v5tXn6JcNJdScMwLPinqOHxcclPrBaf3/XkWK7
         QDiS+tWkSOtWDNk1T1/OQGbSfsWAREIK01SKX8aHTC5sjRZ0hhQiaC1QLpFMqNiJylb9
         ozlplVyhRNAeVe9Z1YfGaPT0sfiyneTqFEInmNFR9Zt4xtCoC/dLxI8ZwJpwj60DFFeP
         a4Ag==
X-Forwarded-Encrypted: i=1; AFNElJ+mCsZfkI/wlzQcFwTfFwLxqbtbjD0Cei6yC+do29USQ0atVfytOXrZv2NU8cqDcoaRAsJg2PQTMfF9pYy8@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi41X4f4333NZzJkLEAzY7XY2U2ZKQqJmScMDvTUl1AbfU4y5F
	kyIxCZxtA7H2TM+ebR1wk3AkDgWkGiYhJ2MfhLZh4JQCnlfmNKge150rS13R51MYYJt/aJK0JKU
	aCFc3YxtW/qRnie7/xkoMFRWBk+oxm6JBbkH5gmg42RHUiEJTyLxNs8sYZCdi9DoDZwHD
X-Gm-Gg: Acq92OHydWc0NPuFaMN6UBzhL1QXoUZRpiQEtFAFXltk77jJcerWxgNBucXMMiShYvl
	NyRzteuwPE/MN7v2TOZ867DBXK0cI8FlQAy2rRGuCEunm+rj3sUPwH93qkPPTkSLrRAl2SxXv8h
	sodU7WlU/P4+d5smKvMWvuYC3BHkCHwyKcisopOJ7T4V9UFLFspR9YAQ6M0UGhNgx3Zkw1c5QZs
	tAY5SRSdH3kn3aXuX+PYp7Qx6GtITAJacqzh4POI9ePLD6dwe5Nn7YtMYQPIx4+NU63AVadJVlq
	S3fVk888Czv9qYGxtwi0w/eGqcaVVb+9PDPDBDdqQ/wJxoslGZH6KMrDGMvWJCHRVCRndOrnxh5
	uB0ckvEF7Oeh1LY6G3GObO7ixNXXnrnyRphqkPM5edbkSGla9IJsnXBx76Z2jnCqSefPnqoaCZQ
	LssxSyVg==
X-Received: by 2002:a05:7300:ef83:b0:2f2:b544:2fd4 with SMTP id 5a478bee46e88-30449201503mr8469968eec.34.1779767179528;
        Mon, 25 May 2026 20:46:19 -0700 (PDT)
X-Received: by 2002:a05:7300:ef83:b0:2f2:b544:2fd4 with SMTP id 5a478bee46e88-30449201503mr8469944eec.34.1779767179030;
        Mon, 25 May 2026 20:46:19 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304522547fesm9792271eec.21.2026.05.25.20.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 20:46:18 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.or,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/5] dt-bindings: crypto: qcom,inline-crypto-engine: Document Nord ICE
Date: Tue, 26 May 2026 11:45:53 +0800
Message-ID: <20260526034557.1669007-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526034557.1669007-1-shengchao.guo@oss.qualcomm.com>
References: <20260526034557.1669007-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zMT3kiFRFza1zO5JrQNsMKezYlC3jaoO
X-Proofpoint-GUID: zMT3kiFRFza1zO5JrQNsMKezYlC3jaoO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDAyOSBTYWx0ZWRfXxa8eueFeL67o
 A1csg9nZ5gVwD2PRaK78wp6PaYt+00wEvcueZHoCHIt4EYE+DENR0bQW1UENbK808L6JaZ7nWTf
 2FOy6QO0qreEhPSBvoun5CSgbgM18MFW8Pl4aJYd8d/SavCEEvCziehqh5GwSLGmiPsHFwotwWA
 gUgY6ddStTkWrFb5HQpXhD76np4kVLEIKmpws/oO3ZJJ/zQcX+o+ZL4P3k+fohCX9T+J9aJxcji
 UFNEQfxJtkIaOYYzwmGORzlItOlxHcBdk9am4eNz6bdiY6Vv/GgpgDWcSQWcKrIqHK8TiSC9v7M
 yXjhsQr+vZujdXZL4MrYdLFohTKoqcIh4tAlbmU+8PpwIdRFCE9qeJcA3kXTq9Ys+mch7xl6vlU
 qghpvQaBk1JYUgRsyN4Ax/fI5yhunDN2YFbAKXqvgTkRXuVupk38nvk2+eRT2LM7P9l4kb0solq
 2XZecOuhMKdcfrsFjLg==
X-Authority-Analysis: v=2.4 cv=M4l97Sws c=1 sm=1 tr=0 ts=6a15178c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=qu0NaVmkdm94GxaCK5wA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260029
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109704-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E770D5D06F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document Inline Crypto Engine (ICE) on Qualcomm Nord SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index ccb6b8dd8e11..c497528826a4 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -16,6 +16,7 @@ properties:
           - qcom,eliza-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
           - qcom,milos-inline-crypto-engine
+          - qcom,nord-inline-crypto-engine
           - qcom,qcs8300-inline-crypto-engine
           - qcom,sa8775p-inline-crypto-engine
           - qcom,sc7180-inline-crypto-engine
@@ -62,6 +63,7 @@ allOf:
             enum:
               - qcom,eliza-inline-crypto-engine
               - qcom,milos-inline-crypto-engine
+              - qcom,nord-inline-crypto-engine
 
     then:
       required:
-- 
2.43.0


