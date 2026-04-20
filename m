Return-Path: <linux-arm-msm+bounces-103744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2L9SLvAS5mnRrAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 13:50:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F9E42A285
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 13:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8D7803006D50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0900739E6E4;
	Mon, 20 Apr 2026 11:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VTpHXisL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NmLGfzOl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F6839BFE9
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 11:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776685802; cv=none; b=bbl4Lhs5PN5Nd1SMv+Viy4BaIBAaO+a6Vh3vDTo9mjCFLkBkLN2qtbahY+4ad/j2ezzVvqH0xLoZUePdNiWrELx3YYSpFd9Hq5qIavWEF39qybwMxcBRhskJMpVsPvSdNCt/ztAvMWxIHo9S6iNxqEjM7ntPvB8XYGkHfTF5G+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776685802; c=relaxed/simple;
	bh=BhtVsvHqwipunR1cVFQzCSny4nImw5wDkPa6vKIEfXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B9023Zwg1RaM6tbANYv9qho5uyJvr666kFTNv2kihS4EAy/RVgKHTZ7DOaLzExUtU330o9bqzYEBKAI3fkEBFiw5cQYh/U+3DRk6+as2R5TFQLR/wfnkaC36ac8aNpL3N2bhl+G2k2Ndkwk6KAnCDfMzpwXDTxvCcVnWLFJgHkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VTpHXisL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NmLGfzOl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K7WttT1532097
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 11:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gwv9Rp6MAzjqv4y3DbSzkzWs0vosbCAkTdd
	M1lHun2Y=; b=VTpHXisL8QBqQqas4ixUxRwIWPzD2Pm2lYcykie/p1fwScQqIMb
	ugVBfJ83W0j1T0x+hZTioSdb1p6naTMP9Z5PUPcj9L7Kzfc7UOGP5pq4U/15po5Q
	bWmCnDrC3ZlwK/xV4zIzSIx0SgVzNc0GulbAm/ct0bQpbkuP5rVBXKVvp2slmL0j
	zaUBlWZwQWFYK2Bml3Tc2fhDye7HkmLG9ztu3DiWmi+3KVZc/fztglJJDXS/9PUQ
	wJG/pLLVMG5+0WU+cG117OuqR/TdMrW1vvkCII0fWBgSOCSUV2zob4LsSozwfKq7
	Z5zWGEG8E8J/IxG5iEsd1Uz5WaB6uYgz0Ew==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfus17p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 11:50:00 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2d93379001eso2103150eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 04:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776685800; x=1777290600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gwv9Rp6MAzjqv4y3DbSzkzWs0vosbCAkTddM1lHun2Y=;
        b=NmLGfzOljWPWoMdIrEfWBMQ0ovxVyDDgg9o3ov9BaHhDikYb/HO4AKCyaTlfsFmB2T
         FX25Tv6O+VtglPWSdPP/ZgsahTHWIEnOuEhENzv91/kB2leE0VEyaPgd1dcDe1/nmb4L
         dLwBeJEYOan6HWnmVDjJKDtzwGcOZh4i1NTLMXvABtXuKtJmNFoKfeO2FPsEzQ0PN9XA
         631R6A9bbl9ORqvDuXPCL0XA1OdEewt/JasUdRXG1A+yUrAHeVy1m+mOas3lPgDsDXeH
         V8LCtnpTr/vVmhGVWnyNF+prJSLrE8oxHILtNi91RCCQPxvwoiikNvIz4KnHakBd8a6u
         X5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776685800; x=1777290600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwv9Rp6MAzjqv4y3DbSzkzWs0vosbCAkTddM1lHun2Y=;
        b=tFXWrChtjAlQUWbfiF6OmMPJ64pG5mGiSTYBCtJJBqcSz6MGKzY4KCe6B5LUCKWhV1
         4bJUoj4f6zllJvcxLhxhri7NmS/Wb9d6nFFVup5IO9k5TJO0zYD/9SOreoGGPk4cqJ67
         xCJ0CaP3hUXZCnUhIJ5+wS80YdwJM6YN1Dyl2sO8LBCLobBAwmxgKgtP7A+iPgnC6rYB
         HVtFXg6Dr7X4tTkY948+D92Ta13GavUHfvLb/U58Pef8Vi6dJ+FQKpzL5ZiHkvWyitZ4
         1Ce8m4J8yQqr+hn+5rewWDfuc8aAhmAu0qY5zoYIKxpHz493rBUa5BDuRX0KfGwPFJUj
         frIQ==
X-Forwarded-Encrypted: i=1; AFNElJ8wkbn340JbpPrcZHJ0MTa0s8EaL0xnPNdISkdrMzztZBtVniLCDwbdXCz2YG0Wn/MIck4zZLZJmoZTHC9g@vger.kernel.org
X-Gm-Message-State: AOJu0YwanaNah97XNpjlywYoM5Fzub1E2B32+8Piu7yWuTLQQ05o2Bkf
	Atw2Z23iDwVR3GKTCaYkB4yCItscMzfoFrafqtYruUKnHRfYlMUvkka296Rs4GbLQ1UMdYzMHEa
	5/xA7jw3OC0a+2pxkF4bpP62gTwyAxxL8XbxE9j5Mn4elqZiBiFYuentLvPUc13gzVkr2
X-Gm-Gg: AeBDiesxRvSnngOUzP+W0VVMrgK9FJjRnV521HmK53VpQcmMT+RxNFMU6grZZoaRZ46
	bFhrulw8hvyyxvmRKzvsAjZblstxUfDPXpyPsXBnTqqZIT0yjRSqh3glcmmmAGsrobAm038PxHD
	RgKWGt5XXwv3faZk5EiEB9eijkvDlLtF7Ym3ySQhiuXJkbJxhjspYPSaC+MwN41JU7wQ51yUdiH
	H5x44qpOlKvxIF2avvxjyklEvX9gf2KL+1FSeYK7z4Cwe5zJItyhHbTpcb/11AQxJAIhIVutzXB
	PinbHCDcqLQJxmskL1Ku4tjNnGFe7MjjOtoDlfQ91pw3RYJ3xwe/aIPzX03HfeUcRh8D4rfQztt
	42X5w3HWJ6kOgRMwtj8406OMQ+TdWO7wnfkqi4dve7BXmjvDI2EJixgPJrKJvjfqMjxVuzqXq5R
	95qCUuvY2woa5UA0vh
X-Received: by 2002:a05:7301:578e:b0:2d9:6373:ad1d with SMTP id 5a478bee46e88-2e478c1f833mr7108112eec.20.1776685799829;
        Mon, 20 Apr 2026 04:49:59 -0700 (PDT)
X-Received: by 2002:a05:7301:578e:b0:2d9:6373:ad1d with SMTP id 5a478bee46e88-2e478c1f833mr7108095eec.20.1776685799305;
        Mon, 20 Apr 2026 04:49:59 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa244csm13683810eec.2.2026.04.20.04.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 04:49:58 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: watchdog: qcom-wdt: Add compatible for Nord watchdog
Date: Mon, 20 Apr 2026 19:49:50 +0800
Message-ID: <20260420114950.1253792-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDExNSBTYWx0ZWRfX2qYfa0xG7S/g
 feszD2Sx306rb+vInP4v4DSPS5gDAg/1E6KAMNLh7N+OtCK2ZxTGe9Frw46OYVI1Bxw3KmEojBo
 fF6ovTLj5dJD2tHvB7ca/WYNFWlViEdy3b+pGScSKp/0yWNK8cd6xCctgLOxCK2wgxwJnTXvehS
 PSbZqpHJWEYJ77Yk1gWm+4WJIoYmtiUDvX35Yht9c3MBRw+LqVAcMXslBD2ZNOQ7aHg3IcEyIYe
 jG+jOwF3NJOqTKEg3O9WqrO8vdg/8Vl8JGJ1f69pEbqNAGIT+k/O5af5TZ7jbcRPpSiDC3zEzN/
 mvsGCDec8nzIb2mBFGmijtPw4oNHslOq2ABUoVzq6dExco9+LMirl9slPBRbFSJB1QLaDPuoyXy
 rix4sqmHplloFOo6NvN/YXIsp5EUqzFFhUvnGbNqECpzfSFFqv0US4EGF5NmyVB2BX0ZEoamnAf
 QnsN2MLYstirZE00ygg==
X-Proofpoint-GUID: qQOhsl4EflEb8thw2Ywcm__U3VhJZ8Th
X-Authority-Analysis: v=2.4 cv=PMQ/P/qC c=1 sm=1 tr=0 ts=69e612e8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=r--zF035SsPxjZAzwykA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: qQOhsl4EflEb8thw2Ywcm__U3VhJZ8Th
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200115
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103744-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B1F9E42A285
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Add compatible for watchdog present on Qualcomm Nord SoC with a fallback
on qcom,kpss-wdt based on the compatibility.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 9f861045b71e..f2e6091902b1 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -27,6 +27,7 @@ properties:
               - qcom,apss-wdt-msm8226
               - qcom,apss-wdt-msm8974
               - qcom,apss-wdt-msm8994
+              - qcom,apss-wdt-nord
               - qcom,apss-wdt-qcm2290
               - qcom,apss-wdt-qcs404
               - qcom,apss-wdt-qcs615
-- 
2.43.0


