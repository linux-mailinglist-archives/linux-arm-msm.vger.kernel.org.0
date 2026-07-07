Return-Path: <linux-arm-msm+bounces-117368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I+ZQOiMsTWp6wAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 18:41:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F6471DF1A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 18:41:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FQr66EDd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SZxdacGq;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117368-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117368-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97DF1308A411
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 16:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BFC343784F;
	Tue,  7 Jul 2026 16:37:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BAD436BE8
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 16:37:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783442242; cv=none; b=Giqf4dYzE22ahbW3NXIX2XjtEWwIpl7w4oY3jnyF2C5KTtN68v7xkm2IniblBXaZs7Ltd6Gm/HK6rv/jZ//x5DfLbJdjCChuziFFuV1WSBwvr1W6FSMbsT3fJCJVa0MOCxvz82Wi1zHZXF8mBhB5GMQmaR68ifPPhX8v5HUthHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783442242; c=relaxed/simple;
	bh=tMrC93Dus9S0lREYudXPFHHq5mzvSj1dmlTSG+Z5F8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BzRnNqvnpRk5tJUOybsOTd5NS4iDPU6GEbELcFsDjONuqmgvn6pLOpR8xXo4EpvzI3WlOvC9EePyzkqMv0+pJXodYWxkmxHZjEShe/VzuAK4+/J7AuHDCJp+pLQhVqPp/1Jjog/nGU8JJ7VjHZnRq3YvArftAeemDkwcKUldB7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FQr66EDd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SZxdacGq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FT2C64073486
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 16:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iLIe2sqk6h4
	NRKgLyw23Q6cPgYJKlFV5hVohkgx8Spw=; b=FQr66EDdfiLuR5zSQF5BLpM0tdz
	Qxv1Knn3ZSLlycnsji4GJR9rkipQL8ndppatOQjeJvpkGisIveE+HKWwP5dISV8f
	pAAzX41ip1DlU2pDKAe0+oqiK3UTDfvFflvskCgAAoPJIhRwCummsxXPxamgZVdR
	dAdhcwmdEKqeZqa54e/nenM97a/xuCNM/Th71b8x0upvT96euo6oXq1+rUvTTN0H
	/lScgyUL8WBCFbWQUdLvuIE36eyfnNQ3cVBiMRzZDAaMmfZBO78i6ZN4biibhxfI
	vEHb9o4VNtRol80zWAltxliSHqVHRt7MP5UEVkcnzrts09U4UShxqLQFT0A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vun29k3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 16:37:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e56b2b350so877214985a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 09:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783442240; x=1784047040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iLIe2sqk6h4NRKgLyw23Q6cPgYJKlFV5hVohkgx8Spw=;
        b=SZxdacGqTnHp4+pTOAd6s+Wb7T0o73HaRuNCAD7O3o3wPRzaRYEbKIHkqCyoltj8hp
         bUVJEkfJhyvX3KzlnXBGMZKPfLR9TnmKSnC63lHc+qFhQbO3hXcYVhRAuHYQwaxn4g1f
         1GZDHxB3JXLuB7zVmZb7AG6G5FBX9v0pS5+YKTM4CEIbU3egdBefGD/bMgMMnvRbGgm9
         YjZlhVtVyi4TaFN8Hz1lXQhucniaueA0jeugKOBXmnx+MTrhaRhmofZUT3escX47x32W
         mdQAUn7S7+6W+BDfH8KZVsBq2FzuvXsfRAEFQIONk38bTDsDRP34a+T8nfWhI8x4zCGT
         AEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783442240; x=1784047040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iLIe2sqk6h4NRKgLyw23Q6cPgYJKlFV5hVohkgx8Spw=;
        b=MnJWsW46bT9B032YytTRk0/M/9PZEm7NAuqR9mLG1OdY8P3wGJNqsAvXpZS+LItWlt
         4V07xDi8FFjk4B1+0pLHn+qEwu3yKQshiEbYyCHtCmTGxy3qlfcFQOqZW3srORZihKYg
         otRats7A1eN2PS+cKv+ddzXG3QSeydOehwqb0nH7b9+n5Fr+qoB5IspLz/ms1/GFPZQt
         rdWDBNL2sqKeYB4Ql0gaf0AAu3dMqkcKKj138uTrqBJZ+qjH3IlHDZzhMeCokMwvkaqL
         /BBs3zNlB4srDavsQLIVmnk3bOTc5bsFtqg+75EgxpolIA7BQnDia1mv6lGVlJfO6KEm
         2F8g==
X-Forwarded-Encrypted: i=1; AHgh+RqRGdcTYjQCUPeiUOkQPjOZxTOhB89qvoCZbH7jnI0U7Ds5CjtIFpgpwRu9NMxsOVrb1pu6LULXcYEKZ0VJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwMO2+eO6c4wm5dCCYFz39d2xPiRiDdYXnUBD+Jb+pt1iSO09ra
	JgiEHEZHUC4ThT80hpLkITsSz6xJzFA+7qU6p6fiXXxV5opvkclAtpUpgvN6gDIGFkSxKFfQlFG
	GZMjSxHq86BO53UTCaYeHvEttDramhwfKtysML328E1c7ZSkkY8nclMFhMn9SypPRjkJv
X-Gm-Gg: AfdE7ck5NIjj9KfUCCFOVV36ARDaF0+d5A2lMElhe8h71tApUh1fiZki6MHZ6y/Ke7O
	yIJhnEEwcOCTq27A/zR9YvcFs7mRKJL1+AdmjXVwA9ZwUO2wHA3LcoEDQXjfUHia9ZZNAFyMBEw
	B6qh9MKiHSTdUb6XPpUS6iTywVXHoym9L1gLQUZt6FlCpPIl0Y3iVqm3moHHn/xaVmpOpLUrv6S
	MpOAhh5HPPnkDbruAWsL2Uq9uAjmKD53HubM1sAf9gKFpgeLjPP2JEFVuesWhiaRvLIyPpL6Uu4
	l9fCTsVYISqxIG5spPYliIdjtnG7UIm4edbIvdHrRgFdnOvN6GRiBtLux0UT55l+Pt2GwnKoYHC
	iseOv88fhf1v62wRpz4fH7CWm
X-Received: by 2002:ac8:5951:0:b0:51b:fa52:807b with SMTP id d75a77b69052e-51c7487bf1fmr64850981cf.47.1783442234564;
        Tue, 07 Jul 2026 09:37:14 -0700 (PDT)
X-Received: by 2002:ac8:5951:0:b0:51b:fa52:807b with SMTP id d75a77b69052e-51c7487bf1fmr64850491cf.47.1783442234012;
        Tue, 07 Jul 2026 09:37:14 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f2186bsm34627699f8f.36.2026.07.07.09.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:37:13 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, loic.poulain@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/3] arm64: dts: qcom: monaco-arduino-monza: Enable I2C0 and SPI3 for 40-pin JHAT connector
Date: Tue,  7 Jul 2026 17:37:01 +0100
Message-ID: <20260707163703.233405-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE2MiBTYWx0ZWRfX74+bUyXr2lUG
 Lol0vvBXFJMdMTJenMhAD9PMwjnla/pmaNQPMVXSmMYR/HiipzfKZH9Ugen79CSJCt9Fz1n0VOH
 LlA8UamawTDcXVNg8Jnt3p1uqseKgZ4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE2MiBTYWx0ZWRfXzPHxcyL6x2aT
 gqsaVWDRzlGvrYSxibylaQFSQILiWstX688+CWqd1nHYlfRo7vaYPxcNj6bPnFJ3iOoi87fZmDG
 SdEKHUEgYzWj/Hbo+BJraG9vTzaRNIFzG0SOg6UeU4q8WXWmh/Geen6j/VOgI0VbcltqiDxQ6mF
 LwaM6TZx5WWXu8VutWABTGZl2G/Jeuz5eAukMm1kJ60RMILl2bmsDqiMzUx5VhAeKP5tk4Dk4MA
 q7TwTO7ZcsTHn8oU6CC28g0I5GLj/uXWJm0Dj0Mxll/7wo7nwenOI3g7hWUU+TwBJh27d+29ZeE
 xwsIr/Is8JEOd8D8xeHxInWldWr4V+O2MrvRK/fEfVBIblwCjCQWscV9n8aBXz9LPdqu/U46srw
 73yOzRNzrl86D+peL19SJ76x8fCnqUsvBGaLQBpRDmSZT2hK3yJ7nPovFjL/NXjVKZOA7x1o72N
 DarQZ32KuJ8o/zPi9Jw==
X-Proofpoint-GUID: rJ1lpiL9Be-J3HkOkW3IPzw_IIIm0Dif
X-Authority-Analysis: v=2.4 cv=N+IZ0W9B c=1 sm=1 tr=0 ts=6a4d2b40 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=dj7Vvq_9f8a1xWt5ZFsA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: rJ1lpiL9Be-J3HkOkW3IPzw_IIIm0Dif
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070162
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117368-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:srinivas.kandagatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 49F6471DF1A

Enable i2c0 and spi3 interfaces that are exposed on the 40-pin JHAT
connector and add the corresponding i2c0 and spi0 aliases for them.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 8b3ed73feb6e..4b1975dff885 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -19,9 +19,11 @@ / {
 
 	aliases {
 		ethernet0 = &ethernet0;
+		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 		serial0 = &uart7;
 		serial1 = &uart10;
+		spi0 = &spi3;
 	};
 
 	chosen {
@@ -257,6 +259,11 @@ queue3 {
 	};
 };
 
+/* JHAT 40-pin I2C0 */
+&i2c0 {
+	status = "okay";
+};
+
 &i2c12 {
 	clock-frequency = <400000>;
 
@@ -425,6 +432,11 @@ &pcieport1 {
 	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
 };
 
+/* JHAT 40-pin SPI */
+&spi3 {
+	status = "okay";
+};
+
 &tlmm {
 	pcie0_default_state: pcie0-default-state {
 		wake-pins {
-- 
2.53.0


