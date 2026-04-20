Return-Path: <linux-arm-msm+bounces-103810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GB+FFttn5mnBvwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:52:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1E4432352
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:52:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 253C03118363
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 16:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 455AB350A35;
	Mon, 20 Apr 2026 16:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kYfjFUWc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HBc9BT3V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A51A34EEEA
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702603; cv=none; b=aNv2i5+Yjc2sfw2TPTqpVABxS4HJsdyQSLumNhlK46CZH4yG6/WO7m5RCpA8j4Ac77HPVlxWF2gjzdmFThOGNB4UiI008WK99de8n0myYNII/l6gT2/3enQ4IeG8xVa8XQDfwG2+KTcjsaj5XI2nf3CG0E/Y6QFfUOqFMuKEgiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702603; c=relaxed/simple;
	bh=SOdAbNbt21HBHcLgJoaj2a6ESEJpE6twEKBKVpgML6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bCrkck740uHrpGha8ugzMAVDMndmt19ZpYpMqXTHO13b5RZTNyn2n8Rd7y4aV4/WlGPeKW5EDmIOpuHMf/uor9mhlSopykeHnb2Jkc+KAIV/lyQZySYRCnqjL4FpakTwcpyHthIKMYi5KnmkjQRnpqoAUBrL7LZK8LwoixrwLvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kYfjFUWc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBc9BT3V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KFw4Vj2755814
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VSG/MswqxcAVwAMltE+fM34VppJcZ2LRqFDVhbD1xqs=; b=kYfjFUWcXVNCQPSa
	+iLfrmUkR1dMRE03sI6eI79Q/38AIICcU+g54FnGQlVOyJfYi+tAmAicTD0H+FJ6
	/oIDpcKZx7Oig3XewfxoWi68ZQ900+Ji6nRNXsRB6BbaextyVWEij6sIxsB/nrUe
	RDs+sWhUNUjNbK+n7zcyWizvOhsz3tork9cPqXkRXWOSwD1C7Usp6KT5DobxRQgN
	n4qGzON+IFzo4xthHP6RmWdG8iMKz5IojAtgOpcDZF7CoTiV1vrvkyM9/PE5i8A5
	kpbXAHUyMnunHcXGT5oPEg1LX+PHVNEiURWLMcIqtScmQtBiM/FdNQhTd/MNDQjt
	PcjksA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh7xhmcf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:30:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f74f0e3c6so2176181b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 09:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776702600; x=1777307400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VSG/MswqxcAVwAMltE+fM34VppJcZ2LRqFDVhbD1xqs=;
        b=HBc9BT3V0mcmjTtDj2CMW+JhTa1Ksf9FJZsDHNKo2FQM62HQeI4zEoYivFHjQspOyQ
         MhQG4y8ad/njQ974ahpTBVnhV14hd7i4dpT7T47t3IlLRtNz7k3bAwkPlX0vRfl5gIUT
         z+4M2xewytUUDxiz9Vv4DikNo2ltAc7xLV9w0sVT9dcVIfpnoXGzkLzFWjaBpOI0nChd
         8QxGWFj7Qb6jjnMwdPkHx9rUabHRuDqmTClaw0xIm1OVZkM4Jvpprk0YAIe1HVIT49K9
         0aJrlrn45I3KSWc5ppZvxinkJ484NX6MENBbluoDgtdFQdCZT0kUP6W4nUUdipOos5bE
         qHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776702600; x=1777307400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VSG/MswqxcAVwAMltE+fM34VppJcZ2LRqFDVhbD1xqs=;
        b=YGNQYzowpJBFxPDuOp6EEnZYETdFgp7nz0e/EdTp/gl2mnutYcGehMMMQlJbdcYkwn
         +AC/nXeo3uJ3SiTykb7TZvBCUQyi/JgfPFw6evuhQ4wPFrQEqNlnU1QoE0H2tdNdGWUd
         cYZbgIKED+z4hVk6JDZ3PN4pc2secwYz7ihrC9nu9ZZ4zAaBH9oDs1yad45A5GrUZ/QN
         QDEkg0TY6o1K1J40uVKboq8K8qyO+21AVDohULuNBN6xOQ0rzC3LSikuYpfFDDAqXJsG
         FP5oELorj1/Y9xT3TNLhqrXpn4Wy6HPJ7qwEBGnWQlldz7eJ2XzmR9BxFgS9jYvxdvzV
         Gjpg==
X-Forwarded-Encrypted: i=1; AFNElJ8ht6nrMlTCXpj7OL1JDJaMs8OP8ggo83PLy5w2YA9wAMBKL4ZsYlspVLL9gldO6pwItFVLGriWA7uM9+wJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwRagd3oq+RcWMPiCp02fVemOflSX3z72Ud+fAs9L+d0MYw25bn
	XntpoVt47ctomGJkayGHJ8bDIXaHZJW6VzacyQvGEqltQD7nTCbn/u2vWvOoS7ByB0/94Ya4oSn
	gCGqr4KegMVfscDIiltV9pue6CJmmbirDwkD21sR7QCxhb4MJ1Zg0Hq6NEQT79FkWXo93
X-Gm-Gg: AeBDies4ZXOEE6X3c2j0YcD4iauI5BbZ/fU9ZjUvzrukeDkIAqWVX5jmoLJLSGbbxV7
	5GMiDVhQvP59QOuCEJLy0NaxwESOvCdHu/IGYt9kyiMVX8SGvr8Kr/9Y0RWWWGkLpkv471cuFEf
	on6BUHFRiJSdR599FNJ+fjCnmiNfKmQK5yca9PF68xOWkKayipqNJVy7GUAJSek3Poy3sjel0Xi
	Th98u/Ts5oGNE6RsUVZhaCqdhOUsVFbtOFm3U9nzdEdWie4p1rAKtNBTDAhrbcSlDfIiK/E7zG3
	X2iBmPNtEG198wB85FooY7sMTgfpzyAV0Jm0UXQ9AHH7ge1OyeVAt0/mpsRtdkYDeFrhXHZVV1G
	5OGfRqBSZCnH3NevEc1fSKpO2FbqfRmmSS1o6affFd9ny9FY3TsuKDsYoZRMn208=
X-Received: by 2002:a05:6a00:bb84:b0:82f:1d38:f693 with SMTP id d2e1a72fcca58-82f8c8e0f98mr14014211b3a.35.1776702599883;
        Mon, 20 Apr 2026 09:29:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:bb84:b0:82f:1d38:f693 with SMTP id d2e1a72fcca58-82f8c8e0f98mr14014174b3a.35.1776702599334;
        Mon, 20 Apr 2026 09:29:59 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm11666469b3a.56.2026.04.20.09.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:29:58 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:58:56 +0530
Subject: [PATCH 03/13] dt-bindings: mfd: syscon: Add qcom,crmc-syscon
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-cesta-sm870-dispcc-v1-3-eb27d845df9c@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1OSBTYWx0ZWRfX8Qii0J9oGI8a
 VCYJ04PHXhlTx+7pd8XfevMO9iLX9PWvYOpiCiwUlOpOr4+96FYscz3oUa2w39OXSLEwyTaLcpI
 6iGlcoPtyR0OQL7l186befWvc3EmBVXpjVvtx2t91FKFehrJqWAVfOEs3k6oU+E7eVI7MyqT1nm
 lYx3no6+z26lnyezgYoz6Why5prOZ4ByqhSFlAhd/8ZsPe5IClp8fOMGyC3CQtWNnHJmryeSIGq
 MjdbvJ/0pWp7OaLwpQ5xWrccAU/QgtTL+8NQVn22Ye/jWjonzN5XQgwCOKeOjArvNWlpawfk/6Y
 O8CeoBRwZllTnbOpdgLnhssEwkGCxufgvseUtosKzacwWlxPh2lCzP2EVjFPx4bi+zmvUCczogI
 Iaw/JeK2sPPrblbjK1sTGkbgj6rsUUOzrr+7SCTfu53zKhvlhBmd7I6uDL/0coxuCV5wd7nV0tF
 C50O1jt1mq/E9uZprEg==
X-Authority-Analysis: v=2.4 cv=BPmDalQG c=1 sm=1 tr=0 ts=69e65488 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Gjla_oY5Z_Fy-GYXBTcA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: Pq7INxnYsUU7albfrk30khWiiL1Ty8JH
X-Proofpoint-GUID: Pq7INxnYsUU7albfrk30khWiiL1Ty8JH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200159
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103810-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AC1E4432352
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the qcom,crmc-syscon compatible for the CRMC
(CESTA Resource Manager Clock) syscon device. This syscon
provides access to the frequency lookup tables provided by
CRM (CESTA Resource Manager) for clocks controlled by CESTA
hardware, so the SW frequency tables of these clocks can be
populated from this data.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index e228670880631429836b542ea5d40100b73d69e1..231e30144a5f3704eacf3387187cebde39c7148d 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -107,6 +107,7 @@ select:
           - nxp,s32g3-gpr
           - qcom,apq8064-mmss-sfpb
           - qcom,apq8064-sps-sic
+          - qcom,crmc-syscon
           - rockchip,px30-qos
           - rockchip,rk3036-qos
           - rockchip,rk3066-qos
@@ -221,6 +222,7 @@ properties:
               - nxp,s32g3-gpr
               - qcom,apq8064-mmss-sfpb
               - qcom,apq8064-sps-sic
+              - qcom,crmc-syscon
               - rockchip,px30-qos
               - rockchip,rk3036-qos
               - rockchip,rk3066-qos

-- 
2.34.1


